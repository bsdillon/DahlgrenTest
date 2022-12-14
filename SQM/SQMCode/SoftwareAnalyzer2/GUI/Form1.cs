using SoftwareAnalyzer2.ProjectCoordination;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Source;
using SoftwareAnalyzer2.Tools;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SoftwareAnalyzer2.GUI
{
    public partial class Form1 : Form, IProjectCoordinator
    {
        private Project currentProject;
        public Project CurrentProject
        {
            get
            {
                return currentProject;
            }
            set
            {
                currentProject = value;
                currentProject.UpdateEvent += ProjectUpdatedEvent;

                if (ProjectLoaded != null)
                {
                    ProjectLoaded(this, new EventArgs());
                }
            }
        }

        private void ProjectUpdatedEvent(object sender, EventArgs e)
        {
            if (ProjectUpdated != null)
            {
                ProjectUpdated(this, new EventArgs());
            }
        }

        private List<IProjectCreator> creators = new List<IProjectCreator>();
        private List<IProjectUser> users = new List<IProjectUser>();
        private event EventHandler ProjectLoaded;
        private event EventHandler ProjectUpdated;

        public Form1()
        {
            InitializeComponent();

            creators.Add(newProjectPanel1);
            creators.Add(openProjectPanel1);
            users.Add(editProjectPanel1);
            users.Add(sourceUpdatePanel1);
            users.Add(graphPanel1);
            users.Add(metricPanel1);

            foreach (IProjectCreator c in creators)
            {
                c.AddProjectCoordinator(this);
            }

            foreach (IProjectUser u in users)
            {
                ProjectLoaded += u.ProjectLoaded;
                ProjectUpdated += u.ProjectChanged;
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //check for non-null, unsaved project file and suggest save
            if (currentProject != null && !currentProject.ProjectSaved)
            {
                DialogResult temp = MessageBox.Show(this, "Do you want to save the changes to " + currentProject.GetProperty(ProjectProperties.ProjectName) + "?", "Unsaved File", MessageBoxButtons.YesNoCancel);
                if (temp == DialogResult.Yes)
                {
                    currentProject.WriteFile();
                }
                else if (temp == DialogResult.Cancel)
                {
                    e.Cancel = true;
                }
            }
        }
    }
}