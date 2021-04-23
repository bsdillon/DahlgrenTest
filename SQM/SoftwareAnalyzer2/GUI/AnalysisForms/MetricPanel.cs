using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using SoftwareAnalyzer2.ProjectCoordination;
using System.IO;
using SoftwareAnalyzer2.Structure.Metrics;
using SoftwareAnalyzer2.Structure.Graphing;

namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    public partial class MetricPanel : UserControl, IProjectUser
    {
        private Project currentProject;
        private string directory;
        private List<string> csvPaths;

        #region IProjectUser Implementation
        public void ProjectLoaded(object sender, EventArgs e)
        {
            currentProject = ((IProjectCoordinator)sender).CurrentProject;
            directory = currentProject.GetProperty(ProjectProperties.FilePath);
        }

        public void ProjectChanged(object sender, EventArgs e)
        {
            currentProject = ((IProjectCoordinator)sender).CurrentProject;
            directory = currentProject.GetProperty(ProjectProperties.FilePath);
        }
        #endregion

        public MetricPanel()
        {
            InitializeComponent();
        }

        private bool FileCheck(string endFileName)
        {
            bool ready = true;

            //file portion
            Regex fileFormat = new Regex("^([a-z]|[A-Z]|\\d)+$");
            Color c = Color.Black;
            bool visible = false;
            if (FileText.Text.Length == 0)
            {
                ready = false;
            }
            else if (!fileFormat.IsMatch(FileText.Text))
            {
                c = Color.Red;
                ready = false;
            }
            else
            {
                visible = File.Exists(directory + Path.DirectorySeparatorChar + FileText.Text + endFileName);
            }

            fileNameLabel.ForeColor = c;
            fileOverwrite.Visible = visible;
            return ready;
        }

        private void ModuleButton_Click(object sender, EventArgs e)
        {
            if (FileCheck(ModuleNavigator.FileSuffix))
            {
                ModuleNavigator mn = new ModuleNavigator(directory + Path.DirectorySeparatorChar + FileText.Text, output);
                if(csvPaths != null)
                {
                    mn.SetCsvInput(csvPaths);
                }
                //call to Navigate and DiscoverAllMembers
                AbbreviatedGraph.Navigate(mn);
                MessageBox.Show(this, "Module file complete");
            }
        }

        private void csvCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            //when the user indicates that they have csv files to add, the browse/filepath text box appear
            if(csvPaths != null)
            {
                csvPaths.Clear();
            }
            filePathTextBox.Clear();
            browseButton.Visible = !browseButton.Visible;
            filePathTextBox.Visible = !filePathTextBox.Visible;
            formatExample.Visible = !formatExample.Visible;
        }

        private void browseButton_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "";
            openFileDialog1.Filter = "CSV Files|*.csv|All Files|*.*";
            openFileDialog1.Title = "Select CSV Input File";
            openFileDialog1.Multiselect = true;
            openFileDialog1.ShowDialog();
            //if file path(s) have never been selected during the session
            if(csvPaths == null && openFileDialog1.FileNames != null)
            {
                //init csvPaths list
                csvPaths = new List<string>();
            }
            if(csvPaths != null && openFileDialog1.FileNames != null)
            {
                //get rid of any old file paths
                csvPaths.Clear();
                foreach (string fName in openFileDialog1.FileNames)
                {
                    //add all file paths that the user selected
                    csvPaths.Add(fName);
                }
            }
            //display the filepath(s) the user selected
            filePathTextBox.Text = String.Join(", ", csvPaths);
        }
    }
}
