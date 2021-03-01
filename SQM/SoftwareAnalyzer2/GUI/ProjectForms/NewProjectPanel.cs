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

namespace SoftwareAnalyzer2.GUI.ProjectForms
{
    public partial class NewProjectPanel : UserControl, IProjectCreator
    {
        private IProjectCoordinator coordinator;

        public NewProjectPanel()
        {
            InitializeComponent();
        }

        private void CreateButton_Click(object sender, EventArgs e)
        {
            //disable everything
            setAllEnabled(false);

            //create project
            string projectName = projectText.Text;

            string dir = "c:\\SoftwareAnalyzer";//System.IO.Path.GetDirectoryName(Application.StartupPath);
            Project project = null;
            try
            {
                project = Project.GenerateNew(projectName, dir);
                projectText.Text = project.FilePath;
            }
            catch (ArgumentException ae)
            {
                outputLabel.Text = "Cannot create new project.\n\rDetials: " + ae.Message;
                //re-enable everything
                setAllEnabled(true);
                return;
            }

            foreach (Control c in ToolsGroup.Controls)
            {
                if (((RadioButton)c).Checked)
                {
                    project.SetProperty(ProjectProperties.Tool, c.Text);
                    break;
                }
            }

            foreach (Control c in LanguagesGroup.Controls)
            {
                if (((RadioButton)c).Checked)
                {
                    project.SetProperty(ProjectProperties.Language, c.Text);
                    break;
                }
            }

            project.SetProperty(ProjectProperties.RootDirectory, rootFolderText.Text);

            project.WriteFile();

            outputLabel.Text = "Project successfully loaded";

            //re-enable everything
            setAllEnabled(true);
            coordinator.CurrentProject = project;
        }

        private void someTextChanged(object sender, EventArgs e)
        {
            CreateButton.Enabled = (rootFolderText.Text.Length > 0 && projectText.Text.Length > 0);
        }

        private void browseClick(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            fbd.SelectedPath = ".";
            if (DialogResult.OK == fbd.ShowDialog(this))
            {
                rootFolderText.Text = fbd.SelectedPath;
            }
        }

        private void setAllEnabled(bool on)
        {
            CreateButton.Enabled = on;
            BrowseButton.Enabled = on;
            projectText.Enabled = on;
            ToolsGroup.Enabled = on;
            LanguagesGroup.Enabled = on;
        }

        public void AddProjectCoordinator(IProjectCoordinator ipc)
        {
            coordinator = ipc;
        }
    }
}
