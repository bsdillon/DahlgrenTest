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
                visible = File.Exists(directory + "\\" + FileText.Text + endFileName);
            }

            fileNameLabel.ForeColor = c;
            fileOverwrite.Visible = visible;
            return ready;
        }

        private void ModuleButton_Click(object sender, EventArgs e)
        {
            if (FileCheck(ModuleNavigator.FileSuffix))
            {
                ModuleNavigator mn = new ModuleNavigator(directory + "\\" + FileText.Text, output);
                AbbreviatedGraph.Navigate(mn);
                MessageBox.Show(this, "Module file complete");
            }
        }
    }
}
