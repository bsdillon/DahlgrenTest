using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SoftwareAnalyzer2.Source;
using SoftwareAnalyzer2.Tools;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.ProjectCoordination;
using System.IO;

namespace SoftwareAnalyzer2.GUI.ProjectForms
{
    public partial class OpenProjectPanel : UserControl, IProjectCreator
    {
        private IProjectCoordinator coordinator;

        public OpenProjectPanel()
        {
            InitializeComponent();
        }

        private void OpenButton_Click(object sender, EventArgs e)
        {
            setAllEnabled(false);

            if (!File.Exists(projectText.Text) || !projectText.Text.EndsWith(Project.FileExtension))
            {
                outputLabel.Text = "Invalid project file";
                setAllEnabled(true);
                return;
            }

            Project project = null;
            try
            {
                project = Project.LoadProject(projectText.Text);
            }
            catch (FormatException fe)
            {
                outputLabel.Text = "Format error in project file.\nDetials: " + fe.Message;
                setAllEnabled(true);
                return;
            }

            outputLabel.Text = "Project successfully loaded";
            setAllEnabled(true);
            coordinator.CurrentProject = project;
        }

        private void projectButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.InitialDirectory = ".";
            ofd.Filter = Project.Filter;
            ofd.RestoreDirectory = true;
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                if (ofd.FileName.Length > 0)
                {
                    projectText.Text = ofd.FileName;
                }
            }
        }

        private void projectText_TextChanged(object sender, EventArgs e)
        {
            OpenButton.Enabled = (projectText.Text.Length > 0);
        }

        private void setAllEnabled(bool on)
        {
            OpenButton.Enabled = on;
            projectButton.Enabled = on;
        }

        public void AddProjectCoordinator(IProjectCoordinator ipc)
        {
            coordinator = ipc;
        }
    }
}
