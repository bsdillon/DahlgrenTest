using Microsoft.Extensions.Logging;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.ProjectCoordination;
using SoftwareAnalyzer2.Source;
using SoftwareAnalyzer2.Structure;
using SoftwareAnalyzer2.Tools;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Metrics;
using System;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Collections.Generic;

namespace SoftwareAnalyzer2.Source
{
    public class CLI_Parameters
    {
        public String Language { get; set; }
        public String ProgramName { get; set; }
    }

    static class StartAnalysis
    {
        private static ILogger logger;
        private const string ParseFolder = "Parse";
        public static ILanguage global_language = null;

        public static void BatchProcess() {
            logger = CrossCutting.GetLogger(typeof(StartAnalysis));

            // Read the config file (we assume it's in JSON format)
            string configFilePath = "/workspace/data/config.json";  // Path to the config file
            string json_data = File.ReadAllText(configFilePath);
            CLI_Parameters config = JsonSerializer.Deserialize<CLI_Parameters>(json_data);

            string language = config.Language;  // e.g., "Java8"
            string programName = config.ProgramName;  // e.g., "SampleProgram"
            
            // Sanitize program name and generate the project folder
            var sb = new StringBuilder();
            string tmp = programName.ToLower();
            for (int i = 0; i < tmp.Length; i++) {
                char c = tmp[i];
                if (Char.IsLetterOrDigit(c) || c == ' ') {
                    sb.Append(c);
                }
            }
            string proj_name = sb.ToString().Replace(" ","_");
            string proj_dir = Path.Combine("/workspace/data/out", proj_name);

            Project p;
            string can_file = proj_dir+Path.DirectorySeparatorChar+proj_name+".can";
            if (File.Exists(can_file)) {
                logger.LogTrace($"Found project {proj_name}");
                p = Project.LoadProject(can_file);
            }
            else {
                logger.LogTrace($"Creating new project {proj_name}");
                p = Project.GenerateNew(proj_name, proj_dir);
                p.SetProperty(ProjectProperties.Tool, "ANTLR");
                p.SetProperty(ProjectProperties.Language, language);
                p.SetProperty(ProjectProperties.RootDirectory, "/workspace/data/src");
                p.WriteFile();
            }

            // Much of this logic comes from SourceUpdatePanel.cs;
            // using the GUI object invoke methods to send state around doesn't fit well
            // with a cli/batch processing tool.
            // Begin with InitiateRead:

            ILanguage lang = LanguageManager.GetLanguage(p.GetProperty(ProjectProperties.Language));
            global_language = lang;
            string dir = p.FilePath;
            dir = dir.Substring(0, dir.LastIndexOf(Path.DirectorySeparatorChar));
            string name = p.GetProperty(ProjectProperties.ProjectName);
            
            string analysisPath = p.FilePath;
            analysisPath = analysisPath.Substring(0, analysisPath.LastIndexOf(Path.DirectorySeparatorChar));

            string proj_parse_folder = proj_dir + Path.DirectorySeparatorChar + ParseFolder;
            if (!Directory.Exists(proj_parse_folder)) {
                Directory.CreateDirectory(proj_parse_folder);
            }

            logger.LogTrace($"Parsing files");
            ParseSource(p, analysisPath);
            
            logger.LogTrace($"Registering types");
            RegisterGraph(p, lang, proj_dir, proj_parse_folder);

            logger.LogTrace($"Linking files");
            LinkGraph(p, lang, proj_dir, proj_parse_folder);

            try
            {
                logger.LogTrace($"Saving graph");
                GraphNode.Save(dir, name);
            }
            catch (Exception e)
            {
                logger.LogError($"Could not save file: {e.Message}\n\r\t{e.StackTrace}");
                return;
            }
            logger.LogTrace($"Reloading graph");
            GraphNode.ClearGraph(lang);
            AbbreviatedGraph.OpenFile(dir, name);

            // Now perform graph gen, which in the GUI is another button press
            List<GephiNode> nodes = new List<GephiNode>();
            List<GephiEdge> edges = new List<GephiEdge>();

            GephiNavigator nav = new GephiNavigator(nodes, edges);
            AbbreviatedGraph.Navigate(nav);

            logger.LogTrace($"Creating Gephi files");
            GephiWriter.WriteFile(p.GetProperty(ProjectProperties.FilePath) + Path.DirectorySeparatorChar + proj_name, nodes, edges);
            logger.LogTrace("Gephi files complete");

            // Now that we have generated .edg and .nod csv files,
            // perform the rest of the metric analysis
            logger.LogTrace($"Creating metric reports");
            ModuleNavigator mn = new ModuleNavigator(p.GetProperty(ProjectProperties.FilePath) + Path.DirectorySeparatorChar + proj_name + "_metrics");
            AbbreviatedGraph.Navigate(mn);
            logger.LogTrace("Metric reports complete");
        }

        public static void LinkGraph(Project p, ILanguage lang, string proj_dir, string proj_parse_folder) {
            logger.LogInformation($"Linking all types in {p.GetProperty(ProjectProperties.ProjectName)}");

            //find the total number of types
            List<GraphNode> types = new List<GraphNode>();
            int totalMembers = GraphNode.GetAllTypes(types);
            logger.LogInformation($"totalMembers={totalMembers}");
            
            foreach (GraphNode t in types)
            {
                //t.InitialLink(p, lang, proj_dir, proj_parse_folder);
                logger.LogInformation($"InitialLink for {t}");
                t.InitialLink();
            }

            //switching gears now. Up until now we have only set up the type linking
            //now we are going to link the members within the various scopes.
            //we know how many of them there are so we start counting from here.
            logger.LogInformation($"Linking all members in {p.GetProperty(ProjectProperties.ProjectName)}");
            
            GraphNode.PrepareForLink(null);

            GraphNode.LinkAll();

            logger.LogInformation("All members linked!");
        }

        public static void RegisterGraph(Project p, ILanguage lang, string proj_dir, string proj_parse_folder)
        {
            GraphNode.ClearGraph(lang);
            string[] files = Directory.GetFiles(proj_parse_folder, "*.XML", SearchOption.AllDirectories);

            logger.LogInformation($"Registering all members in {p.GetProperty(ProjectProperties.ProjectName)}");

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

        private static readonly object ParseProgress = new object();
        private static int emptyFiles = 0;
        private static int newFiles = 0;
        private static int skippedFiles = 0;
        private static int errorFiles = 0;
        private static int finishedFiles = 0;
        private static int totalFiles = 0;

        /// <summary>
        /// Stage one of the source update process. Spawns threads for each of the source code files and produces
        /// (or accepts) a (previously calculated) parsing saved as an XML file.
        /// </summary>
        /// <returns>True if any new files are parsed; false if all files are already set.</returns>
        public static bool ParseSource(Project p, string analysisPath)
        {
            ILanguage lang = LanguageManager.GetLanguage(p.GetProperty(ProjectProperties.Language));
            GraphNode.SetLanguage(lang);
            ITool tool = ToolManager.GetTool(p.GetProperty(ProjectProperties.Tool), lang);
            if (tool is LLVMTool) {
                ((LLVMTool) tool).project = p;
            }
            string rootPath = p.GetProperty(ProjectProperties.RootDirectory);

            foreach (string lang_ext_glob in lang.FileExtensionGlobs) {
                string[] files = Directory.GetFiles(p.GetProperty(ProjectProperties.RootDirectory), lang_ext_glob, SearchOption.AllDirectories);
                
                totalFiles += files.Length;

                logger.LogInformation($"Checking for updated files in {p.GetProperty(ProjectProperties.ProjectName)}");

                //go through all files which match the required extension
                foreach (string file in files)
                {
                    lock(ParseProgress)
                    {
                        //Print status message to screen
                        int f = finishedFiles;
                        int t = totalFiles;
                        int percent = (int)(100*f/t);
                        Console.Write($"\rParsing... {f}/{t} {percent}%- Errors {errorFiles} New {newFiles}");
                    }
                    ReadFile(p, tool, lang, lang_ext_glob, file);
                }
            }

            lock(ParseProgress)
            {
                //Print status message to screen
                Console.WriteLine($"\rParsing... Complete - Errors {errorFiles} New {newFiles-errorFiles}");
            }

            if(errorFiles>0)
            {
                logger.LogError("Errors in the parse process! Cannot move on to registration.");
                Console.WriteLine("Errors in the parse process! Cannot move on to registration.");
                Environment.Exit(1); // Exit with an error code if processing fails
            }

            return newFiles > 0;
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
                logger.LogTrace($"Reading file: {fileName}");
                myTool.outputFilepath = fileRoot;
                myTool.Analyze(fileName, lang);

                List<string> errors = myTool.Errors;
                if (myTool.NoTreeCreated)
                {
                    //this kind of error occurs when the file did not yield a tree
                    lock (ParseProgress)
                    {
                        logger.LogWarning($"Empty file {fileName}");
                        emptyFiles++;
                    }
                }
                else
                {
                    //newer file with a non-empty tree. This counts.
                    lock (ParseProgress)
                    {
                        newFiles++;
                    }

                    if (errors.Count > 0)
                    {
                        //there are some errors; create a report
                        logger.LogError($"Error in {fileName.Substring(rootPath.Length)}: {System.Environment.NewLine}{String.Join(System.Environment.NewLine, errors)}");
                        lock (ParseProgress)
                        {
                            errorFiles++;
                        }
                    }

                    INode node = myTool.ParsedNode;
                    if (node != null)
                    {
                        NodeFactory.WriteTextFile(node, fileRoot);
                        NodeFactory.WriteXMLFile(node, xmlFile, parsePath);
                    }
                }
            }
            else
            {
                lock (ParseProgress)
                {
                    skippedFiles++;
                }
            }

            lock (ParseProgress)
            {
                finishedFiles++;
            }
        }
    }
}