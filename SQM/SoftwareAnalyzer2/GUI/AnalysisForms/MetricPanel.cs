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
using SoftwareAnalyzer2.Structure.Gephi;
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
                    bool fileError = false;
                    //need to verify that each file has "file, line number, error name, property, etc." as the header
                    //must check fName for null so empty filenames don't cause a crash
                    if(fName != "")
                    {
                        using (var read = new StreamReader(@fName))
                        {
                            if (!read.EndOfStream)
                            {
                                var rLine = read.ReadLine();
                                var values = rLine.Split(',');
                                //files must contain headers with "file, line, error, property as the first four columns
                                //some variations of those header names are accounted for in this logic
                                if ((values[0] == "file" || values[0] == "File" || values[0] == "Filename" || values[0] == "File name")
                                    && (values[1] == "line" || values[1] == "Line" || values[1] == "Line Number" || values[1] == "Line number")
                                    && (values[2] == "error" || values[2] == "Error" || values[2] == "Error Details" || values[2] == "Error details")
                                    && (values[3] == "property" || values[3] == "Property" || values[3] == "Error Property" || values[3] == "Error property"))
                                {

                                    //no errors so far, continue
                                }
                                else
                                {
                                    //one or more of the column headers does not match, error
                                    MessageBox.Show(this, fName + " does not follow the required format. Each file must have a header that contains these values: \"file, line, error, property\"", "File Format Issue");
                                    fileError = true;
                                }

                                //if all header names are correct, continue
                                //else, there will be a popup box for the user to deal with
                                if (!fileError)
                                {
                                    string propErrors = "";
                                    while (!read.EndOfStream)
                                    {
                                        rLine = read.ReadLine();
                                        values = rLine.Split(',');

                                        foreach (string p in Enum.GetNames(typeof(NodeProperties)))
                                        {
                                            //check each row in the property column for entries that match the preset properties
                                            //the preset properties can be found in PropertiedObject.cs in the NodeProperties enum
                                            if (values[3] == p)
                                            {
                                                //if a property matches, add it to the list of illegal properties
                                                if (propErrors == "")
                                                {
                                                    propErrors += "\"" + p + "\"";
                                                }
                                                else
                                                {
                                                    propErrors += ", " + "\"" + p + "\"";
                                                }

                                            }
                                        }
                                    }
                                    //if there are any illegal properties, show the user a messagebox with which ones they need to fix
                                    if (propErrors != "")
                                    {
                                        MessageBox.Show(this, propErrors + " within " + fName + " are pre-allocated property names that cannot be used. File was not added to list.", "Duplicate Property");

                                    }
                                    //else, if the file had the appropriate headers and no illegal properties, add it to the list
                                    //all of the logic is to prevent any bad files from being processed
                                    else
                                    {
                                        csvPaths.Add(fName);
                                    }
                                }
                            }
                        }
                    }    
                }
            }
            //display the filepath(s) the user selected
            filePathTextBox.Text = String.Join(", ", csvPaths);
        }
    }
}
