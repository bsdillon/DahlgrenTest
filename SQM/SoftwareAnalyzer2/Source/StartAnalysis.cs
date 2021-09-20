// TODO: Note - Find all repeated instances between the GUI and CMD
// with read file/parse file/etc. and put them here

using System;
using System.Collections.Generic;
using SoftwareAnalyzer2.ProjectCoordination;
using System.IO;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Tools;
using SoftwareAnalyzer2.Structure.Node;

namespace SoftwareAnalyzer2.Source
{
    static class StartAnalysis
    {
        public static void ReadFile(Project p, ITool tool, ILanguage lang, string lang_ext_glob, string fileName) {
            string ParseFolder = "Parse";
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
        }
    }
    // lock (ParseProgress)
    // {
    //     filesDone++;
    // }

}