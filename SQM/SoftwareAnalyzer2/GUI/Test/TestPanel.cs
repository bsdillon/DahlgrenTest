using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using SoftwareAnalyzer2.Tools;
using System.Diagnostics;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Language;

namespace SoftwareAnalyzer2.GUI.Test
{
    public partial class TestPanel : UserControl
    {
        public TestPanel()
        {
            InitializeComponent();
        }

        private void TestButton_Click(object sender, EventArgs e)
        {
            testProgress.Value = 0;

            string path = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase;
            int end = path.IndexOf("Debug/");
            path = path.Substring(8, end - 8);

            path += "TestOnly/";

            ILanguage lang = new JavaLanguage();
            string[] files = Directory.GetFiles(path, lang.FileExtension, SearchOption.AllDirectories);
            int count = 0;
            foreach (string file in files)
            {
                ITool myTool = new ANTLRTool();
                myTool.Analyze(file, lang);

                string fileName = file.Substring(0, file.Length - 5);
                List<string> errors = myTool.Errors;

                if (errors.Count > 0)
                {
                    //there are some errors; create node report
                    ErrorMessage.Show(fileName, myTool.GetType().ToString(), errors);
                }

                INode node = myTool.ParsedNode;
                //write out AST to text file
                NodeFactory.WriteTextFile(node, fileName + "NEW");
                count++;

                testProgress.Value = 100 * count / files.Length;
                //ErrorMessage.Show(fileName, myTool.ToString(), errors);
            }
        }
    }
}
