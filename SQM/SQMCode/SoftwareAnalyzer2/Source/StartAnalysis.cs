using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using SoftwareAnalyzer2.GUI;

using System.Threading;

using SoftwareAnalyzer2.ProjectCoordination;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Tools;
using SoftwareAnalyzer2.Structure;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Metrics;
using SoftwareAnalyzer2.Source;

namespace SoftwareAnalyzer2.Source
{
    static class StartAnalysis
    {
        private const string ParseFolder = "Parse";
        public static ILanguage global_language = null;

        public static void BatchProcess(string language, string src_dir) {
            // We read an env variable to override the windows hard-coded C:\\SoftwareAnalyzer directory.
            // This lets *nix wrappers put SQM data wherever they like.
            string dir = Path.Combine("c:\\", "SoftwareAnalyzer");
            string maybe_dir = Environment.GetEnvironmentVariable("SQM_DATA_DIR");
            if (maybe_dir != null) {
                dir = maybe_dir;
            }

            // The project name will be the name of src_dir
            string proj_name = Path.GetFileName(src_dir.TrimEnd(Path.DirectorySeparatorChar));
            string proj_dir = dir+Path.DirectorySeparatorChar+proj_name;
            Console.WriteLine("proj_dir="+proj_dir);
            Console.WriteLine("proj_name="+proj_name);

            Project p;
            if (File.Exists(proj_dir+Path.DirectorySeparatorChar+proj_name+".can")) {
                p = Project.LoadProject(proj_dir+Path.DirectorySeparatorChar+proj_name+".can");
            }
            else {
                p = Project.GenerateNew(proj_name, dir);
                string tool_name = Environment.GetEnvironmentVariable("SQM_TOOL") ?? "ANTLR";
                Console.WriteLine("Using tool_name="+tool_name);
                p.SetProperty(ProjectProperties.Tool, tool_name);
                p.SetProperty(ProjectProperties.Language, language);
                p.SetProperty(ProjectProperties.RootDirectory, src_dir);
                p.WriteFile();
            }

            // Much of this logic comes from SourceUpdatePanel.cs;
            // using the GUI object invoke methods to send state around doesn't fit well
            // with a cli/batch processing tool.
            // Begin with InitiateRead:

            ILanguage lang = LanguageManager.GetLanguage(p.GetProperty(ProjectProperties.Language));
            global_language = lang;
            dir = p.FilePath;
            dir = dir.Substring(0, dir.LastIndexOf(Path.DirectorySeparatorChar));
            string name = p.GetProperty(ProjectProperties.ProjectName);
            
            string analysisPath = p.FilePath;
            analysisPath = analysisPath.Substring(0, analysisPath.LastIndexOf(Path.DirectorySeparatorChar));

            string proj_parse_folder = proj_dir + Path.DirectorySeparatorChar + ParseFolder;
            if (!Directory.Exists(proj_parse_folder)) {
                Directory.CreateDirectory(proj_parse_folder);
            }

            ParseSource(p, analysisPath);
            //AbbreviatedGraph.OpenFile(dir, name);
            
            RegisterGraph(p, lang, proj_dir, proj_parse_folder);
            LinkGraph(p, lang, proj_dir, proj_parse_folder);

            try
            {
                GraphNode.Save(dir, name);
            }
            catch (Exception e)
            {
                Console.Error.WriteLine("Could not save file: " + e.Message + "\n\r" + e.StackTrace);
                return;
            }
            GraphNode.ClearGraph(lang);
            AbbreviatedGraph.OpenFile(dir, name);

            // Now perform graph gen, which in the GUI is another button press
            List<GephiNode> nodes = new List<GephiNode>();
            List<GephiEdge> edges = new List<GephiEdge>();

            GephiNavigator nav = new GephiNavigator(nodes, edges);
            AbbreviatedGraph.Navigate(nav);

            GephiWriter.WriteFile(p.GetProperty(ProjectProperties.FilePath) + Path.DirectorySeparatorChar + proj_name, nodes, edges);
            Console.WriteLine("Gephi files complete");

            // Now that we have generated .edg and .nod csv files,
            // perform the rest of the metric analysis
            ModuleNavigator mn = new ModuleNavigator(p.GetProperty(ProjectProperties.FilePath) + Path.DirectorySeparatorChar + proj_name + "_metrics", null);
            AbbreviatedGraph.Navigate(mn);

            Console.WriteLine("Metric reports complete");

        }

        public static void LinkGraph(Project p, ILanguage lang, string proj_dir, string proj_parse_folder) {
            Console.WriteLine("Linking all types in " + p.GetProperty(ProjectProperties.ProjectName));

            //find the total number of types
            List<GraphNode> types = new List<GraphNode>();
            int totalMembers = GraphNode.GetAllTypes(types);
            Console.WriteLine("totalMembers="+totalMembers);
            
            foreach (GraphNode t in types)
            {
                //t.InitialLink(p, lang, proj_dir, proj_parse_folder);
                Console.WriteLine("InitialLink for t="+t);
                t.InitialLink();
            }

            //switching gears now. Up until now we have only set up the type linking
            //now we are going to link the members within the various scopes.
            //we know how many of them there are so we start counting from here.
            Console.WriteLine("Linking all members in " + p.GetProperty(ProjectProperties.ProjectName));
            
            GraphNode.PrepareForLink(null);

            GraphNode.LinkAll();

            Console.WriteLine("All members linked!");
        }

        public static void RegisterGraph(Project p, ILanguage lang, string proj_dir, string proj_parse_folder)
        {
            GraphNode.ClearGraph(lang);
            string[] files = Directory.GetFiles(proj_parse_folder, "*.XML", SearchOption.AllDirectories);
            // int totalFiles = files.Length;
            // int filesDone = 0;

            Console.WriteLine("Registering all members in " + p.GetProperty(ProjectProperties.ProjectName));

            //go through all files which match the required extension
            foreach (string file in files)
            {
                LoadTree(file);
            }

        }

        public static void LoadTree(string file)
        {
            //read the parsed file and register it with the graph
            GraphNode.Register(NodeFactory.ReadXMLTree(file));
        }


        /// <summary>
        /// Stage one of the source update process. Spawns threads for each of the source code files and produces
        /// (or accepts) a (previously calculated) parsing saved as an XML file.
        /// </summary>
        /// <returns>True if any new files are parsed; false if all files are already set.</returns>
        public static bool ParseSource(Project p, string analysisPath)
        {
            ILanguage lang = LanguageManager.GetLanguage(p.GetProperty(ProjectProperties.Language));
            GraphNode.SetLanguage(lang);
            ITool tool = ToolManager.GetTool(p.GetProperty(ProjectProperties.Tool));
            if (tool is LLVMTool) {
                ((LLVMTool) tool).project = p;
            }
            string rootPath = p.GetProperty(ProjectProperties.RootDirectory);

            int totalFiles = 0;
            // int filesDone = 0;
            List<string> newFilesFound = new List<string>();

            foreach (string lang_ext_glob in lang.FileExtensionGlobs) {
                string[] files = Directory.GetFiles(p.GetProperty(ProjectProperties.RootDirectory), lang_ext_glob, SearchOption.AllDirectories);
                
                totalFiles += files.Length;

                Console.WriteLine("Checking for updated files in " + p.GetProperty(ProjectProperties.ProjectName));

                //go through all files which match the required extension
                foreach (string file in files)
                {
                    ReadFile(p, tool, lang, lang_ext_glob, file);
                    newFilesFound.Add(file);
                }
            }

            return newFilesFound.Count > 0;
        }

        private static void ReadFile(Project p, ITool tool, ILanguage lang, string lang_ext_glob, string fileName) {
            string analysisPath = p.FilePath;
            analysisPath = analysisPath.Substring(0, analysisPath.LastIndexOf(Path.DirectorySeparatorChar));

            string rootPath = p.GetProperty(ProjectProperties.RootDirectory);

            string parsePath = analysisPath + Path.DirectorySeparatorChar + ParseFolder;
            string parseFile = fileName.Replace(rootPath, parsePath);
            string fileRoot = parseFile.Substring(0, parseFile.Length - lang_ext_glob.Length + 1);
            
            if (lang is CPPLanguage && (lang_ext_glob.Equals("*.h") || lang_ext_glob.Equals("*.hpp"))) {
                fileRoot = fileRoot + "_H";
            }
            
            string xmlFile = fileRoot + ".XML";
            string directory = parseFile.Substring(0, parseFile.LastIndexOf(Path.DirectorySeparatorChar));

            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            ITool myTool = tool.Clone();
            bool newerCode = true;//assume all code is new (i.e. has never been analyzed before)

            //exclude this code from parsing based on xml which already exists in 
            //an XML file more recent than the code file
            if (File.Exists(xmlFile))
            {
                DateTime xml = File.GetLastWriteTime(xmlFile);
                DateTime code = File.GetLastWriteTime(fileName);

                //new code is consistent with the last saved source AND the last verison of tree
                newerCode = !((xml.Ticks > code.Ticks) && NodeFactory.IsCurrentVersion(xmlFile));
            }

            if (newerCode)//if the code is in fact newer then we parse the source into an XML tree
            {
                myTool.outputFilepath = fileRoot;
                myTool.Analyze(fileName, lang);

                List<string> errors = myTool.Errors;
                if (myTool.NoTreeCreated)
                {
                    //we don't track new files if they are empty
                    //this kind of error occurs when the file did not yield a tree
                    // lock (emptyFiles)
                    // {
                    //     emptyFilesFound++;
                    // }
                }
                else
                {
                    //newer file with a non-empty tree. This counts.
                    // lock (newFiles)
                    // {
                    //     newFilesFound.Add(fileRoot);
                    // }

                    if (errors.Count > 0)
                    {
                        //there are some errors; create a report
                        Console.Error.WriteLine(
                            "Error in "+fileName.Substring(rootPath.Length)+": "+System.Environment.NewLine+
                            String.Join(System.Environment.NewLine, errors)
                        );

                        // lock (errorLock)
                        // {
                        //     totalErrors++;
                        // }
                    }

                    INode node = myTool.ParsedNode;
                    if (node != null)
                    {
                        NodeFactory.WriteTextFile(node, fileRoot);
                        NodeFactory.WriteXMLFile(node, xmlFile, parsePath);
                    }
                }
            }

            // lock (ParseProgress)
            // {
            //     filesDone++;
            // }

        }

    }

}