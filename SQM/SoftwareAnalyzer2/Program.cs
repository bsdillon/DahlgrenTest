using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using SoftwareAnalyzer2.GUI;

using SoftwareAnalyzer2.ProjectCoordination;

namespace SoftwareAnalyzer2
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            if (args != null && args.Length > 0) {
                // CLI mode
                string language = args[0];
                string src_dir = args[1];
                Console.WriteLine("Processing "+language+" code within "+src_dir);
                BatchProcess(language, src_dir);
            }
            else {
                // GUI mode
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                try
                {
                    Application.Run(new Form1());
                }
                catch (Exception e)
                {
                    System.Windows.Forms.MessageBox.Show("Final error in application: " + e.Message + "\n\r" + e.StackTrace);
                }
            }
        }

        static void BatchProcess(string language, string src_dir) {
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
                p.SetProperty(ProjectProperties.Tool, "ANTLR");
                p.SetProperty(ProjectProperties.Language, language);
                p.SetProperty(ProjectProperties.RootDirectory, src_dir);
                p.WriteFile();
            }

            

        }
    }
}
