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
using SoftwareAnalyzer2.Structure.Graphing;
using System.Text.RegularExpressions;
using SoftwareAnalyzer2.ProjectCoordination;
using SoftwareAnalyzer2.Structure;
using SoftwareAnalyzer2.Structure.Gephi;

namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    public partial class GraphPanel : UserControl, IProjectUser
    {
        private Project currentProject;
        private string directory;

        public GraphPanel()
        {
            InitializeComponent();
        }

        private void SaveFile_Click(object sender, EventArgs e)
        {
            List<GephiNode> nodes = new List<GephiNode>();
            List<GephiEdge> edges = new List<GephiEdge>();

            GephiNavigator nav = new GephiNavigator(nodes, edges);
            AbbreviatedGraph.Navigate(nav);

            GephiWriter.WriteFile(directory + Path.DirectorySeparatorChar + fileName.Text, nodes, edges);
            MessageBox.Show(this, "Gephi files complete");
        }

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

        private void fileName_TextChanged(object sender, EventArgs e)
        {
            bool ready = true;

            //file portion
            Regex fileFormat = new Regex("^([node-z]|[A-Z]|\\d)+$");
            Color c = Color.Black;
            bool visible = false;
            if (fileName.Text.Length == 0)
            {
                ready = false;
            }
            else if (!fileFormat.IsMatch(fileName.Text))
            {
                c = Color.Red;
                ready = false;
            }
            else
            {
                visible = GephiWriter.FileExists(directory + Path.DirectorySeparatorChar + fileName.Text);
            }

            fileNameLabel.ForeColor = c;
            fileOverwrite.Visible = visible;

            SaveFileButton.Enabled = ready;
        }
    }
}
