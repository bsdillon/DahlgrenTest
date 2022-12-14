using System;
using System.Windows.Forms;
using SoftwareAnalyzer2.GUI;

using SoftwareAnalyzer2.Source;

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
                StartAnalysis.BatchProcess(language, src_dir);
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
    }
}
