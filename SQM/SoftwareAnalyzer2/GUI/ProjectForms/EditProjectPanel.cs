using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SoftwareAnalyzer2.ProjectCoordination;

namespace SoftwareAnalyzer2.GUI.ProjectForms
{
    public partial class EditProjectPanel : UserControl, IProjectUser
    {
        public EditProjectPanel()
        {
            InitializeComponent();
        }

        private Project currentProject;

        private void LoadPanel(object sender, EventArgs e)
        {
            if (this.Visible && currentProject != null)
            {
                this.Enabled = true;

                //load the properties
                dataGridView1.Rows.Clear();
                string[][] list = currentProject.PropertiesList;
                foreach (string[] pair in list)
                {
                    DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();
                    row.Cells[0].Value = pair[0];
                    row.Cells[1].Value = pair[1];
                    dataGridView1.Rows.Add(row);
                }
            }
            else
            {
                this.Enabled = false;
            }
        }

        public void ProjectLoaded(object sender, EventArgs e)
        {
            IProjectCoordinator ipc = (IProjectCoordinator)sender;
            currentProject = ipc.CurrentProject;
        }

        public void ProjectChanged(object sender, EventArgs e)
        {
            //no potential for project update while this is operating
        }

        private void SaveButton_Click(object sender, EventArgs e)
        {
            string[][] list = new string[dataGridView1.Rows.Count][];
            int index = 0;
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                list[index] = new string[2];
                list[index][0] = row.Cells[0].Value.ToString();
                list[index][1] = row.Cells[1].Value.ToString();
                index++;
            }
            currentProject.PropertiesList = list;
        }
    }
}
