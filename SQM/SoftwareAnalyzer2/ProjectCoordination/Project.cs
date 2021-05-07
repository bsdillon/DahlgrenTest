using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#if ENABLE_GUI
using System.Windows.Forms;
#endif

namespace SoftwareAnalyzer2.ProjectCoordination
{
    public enum ProjectProperties
    {
        Language,
        RootDirectory,
        Tool,
        ProjectName,
        FilePath,
        LastSourceRead
    }

    public class Project
    {
        private enum PrivateProperties
        {
            FileName
        }

        public const string Filter = "Cancer File (*.can)|*.can";
        public const string FileExtension = "can";

        public static Project GenerateNew(string projectName, string executionPath)
        {
            //BSD
            string fullPath = executionPath + Path.DirectorySeparatorChar + projectName;
            string fileName = projectName + "." + FileExtension;
            if (Directory.Exists(fullPath))
            {
                throw new ArgumentException("A project already exist for " + projectName + ". Please open that project or select node different name for the new project.");
            }

            Dictionary<string, string> p = new Dictionary<string, string>();
            Project answer = new Project();
            answer.properties = p;

            answer.SetProperty(ProjectProperties.ProjectName, projectName);
            answer.SetProperty(PrivateProperties.FileName, fileName);
            answer.SetProperty(ProjectProperties.FilePath, fullPath);

            answer.WriteFile();

            return answer;
        }

        private bool saved;
        public bool ProjectSaved
        {
            get
            {
                return saved;
            }
        }

        public event EventHandler UpdateEvent;

        public void WriteFile()
        {
            string fullPath = GetProperty(ProjectProperties.FilePath);
            string fileName = GetProperty(PrivateProperties.FileName);

            if (!Directory.Exists(fullPath))
            {
                Directory.CreateDirectory(fullPath);
            }

            string fullFile = fullPath + Path.DirectorySeparatorChar + fileName;
            StreamWriter sw = new StreamWriter(File.Create(fullFile));

            foreach (string key in properties.Keys)
            {
                sw.WriteLine(key + "::" + properties[key]);
            }
            sw.Close();
            saved = true;
        }

        public static Project LoadProject(string fileName)
        {
            Dictionary<string, string> p = new Dictionary<string, string>();
            StreamReader sr = File.OpenText(fileName);
            string line = sr.ReadLine();
            while (line != null)
            {
                string[] parts = line.Split(new string[] { "::" }, StringSplitOptions.RemoveEmptyEntries);
                try
                {
                    p.Add(parts[0], parts[1]);
                }
                catch (ArgumentException e)
                {
                    throw new FormatException("Duplicate property definition of " + parts[0], e);
                }
                line = sr.ReadLine();
            }
            Project answer = new Project();
            answer.properties = p;
            answer.saved = true;
            return answer;
        }

        private Dictionary<string, string> properties;

        public string[][] PropertiesList
        {
            get
            {
                string[][] answer = new string[properties.Count][];
                int index = 0;
                foreach (string key in properties.Keys)
                {
                    answer[index] = new string[2];
                    answer[index][0] = key;
                    answer[index][1] = properties[key];
                    index++;
                }
                return answer;
            }
            set
            {
                properties = new Dictionary<string, string>();
                foreach (string[] pair in value)
                {
                    properties.Add(pair[0], pair[1]);
                }

                saved = false;
                if (UpdateEvent != null)
                {
                    UpdateEvent(this, new EventArgs());
                }
            }
        }

        public string FilePath
        {
            get
            {
                string fullPath = GetProperty(ProjectProperties.FilePath);
                string fileName = GetProperty(PrivateProperties.FileName);
                return fullPath + Path.DirectorySeparatorChar + fileName;
            }
        }

        private Project()
        {
        }

        public void SetProperty(ProjectProperties propName, string value)
        {
            SetProperty(propName.ToString(), value);
        }

        public string GetProperty(ProjectProperties propName)
        {
            return GetProperty(propName.ToString());
        }

        private void SetProperty(PrivateProperties propName, string value)
        {
            SetProperty(propName.ToString(), value);
        }

        private string GetProperty(PrivateProperties propName)
        {
            return GetProperty(propName.ToString());
        }

        private string GetProperty(string propName)
        {
            if (!properties.ContainsKey(propName))
            {
                return "";
            }
            return properties[propName];
        }

        private void SetProperty(string propName, string value)
        {
            if (!properties.ContainsKey(propName))
            {
                properties.Add(propName, value);
            }
            else
            {
                properties[propName] = value;
            }

            saved = false;
            if (UpdateEvent != null)
            {
                UpdateEvent(this, new EventArgs());
            }
        }
    }
}
