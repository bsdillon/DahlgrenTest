using SoftwareAnalyzer2.ProjectCoordination;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Source
{
    class FileIdentification
    {
        public ITool Tool { get; set; }
        public ILanguage Language { get; set; }
        public string Root { get; set; }
        public Project Project { get; set; }

        internal void Go()
        {
            //find the source code file names in the folder
            foreach (string lang_ext_glob in Language.FileExtensionGlobs) {
                foreach (string file in Directory.GetFiles(Root, lang_ext_glob, SearchOption.AllDirectories))
                {
                    //read in each file in
                    //read in file for manipulation
                    StreamReader sr = File.OpenText(file);
                    List<string> fileLines = new List<string>();
                    string line = sr.ReadLine();
                    while (line != null)
                    {
                        if (line.Length > 0)
                        {
                            fileLines.Add(line);
                        }

                        line = sr.ReadLine();
                    }
                    sr.Close();
                }
            }
        }
    }
}
