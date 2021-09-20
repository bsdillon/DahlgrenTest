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
using System.Threading;
using System.IO;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Tools;
using SoftwareAnalyzer2.Structure;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;

namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    public partial class SourceUpdatePanel : UserControl, IProjectUser
    {
        private const string ParseFolder = "Parse";

        private Project currentProject;
        private ILanguage lang;
        private ITool tool;
        private string rootPath;
        private string analysisPath;

        public SourceUpdatePanel()
        {
            InitializeComponent();
        }

        #region IProjectUser Implementation
        public void ProjectLoaded(object sender, EventArgs e)
        {
            Stop();
            currentProject = ((IProjectCoordinator)sender).CurrentProject;
            Start();
        }

        public void ProjectChanged(object sender, EventArgs e)
        {
            Stop();
            currentProject = ((IProjectCoordinator)sender).CurrentProject;
            Start();
        }
        #endregion

        #region Thread run methods
        private int totalFiles = 0;
        private int totalMembers = 0;
        private int filesDone = 0;

        private object errorLock = new object();
        private int totalErrors = 0;

        private List<string> newFilesFound;

        private void SuspendEnabled(bool value)
        {
            if (this.InvokeRequired)
            {
                Invoke(new Action<bool>(SuspendEnabled), new object[] { value });
                return;
            }

            SuspendButton.Enabled = value;

        }

        private void SetOutput(string text)
        {
            if (this.InvokeRequired)
            {
                Invoke(new Action<string>(SetOutput), new object[] { text });
                return;
            }

            output.Text = "" + text;
        }


        private void InitiateRead()
        {
            SuspendEnabled(true);
            //first need to update files for all source code
            string dir = currentProject.FilePath;
            dir = dir.Substring(0, dir.LastIndexOf(Path.DirectorySeparatorChar));
            string name = currentProject.GetProperty(ProjectProperties.ProjectName);

            //There are two conditions which force the creation of a new graph.
            // New source code (which might change the structure of the graph
            // A missing or corrupted graph file
            string output = "File successfully opened.";
            if (ParseSource() || !AbbreviatedGraph.OpenFile(dir, name))
//            if (!AbbreviatedGraph.OpenFile(dir, name))
            {
                RegisterGraph();

                LinkGraph();

                for (int i = 0; i < 5; i++)
                {
                    Thread.Sleep(1000);
                }

                try
                {
                    GraphNode.Save(dir, name);
                }
                catch (Exception e)
                {
                    System.Windows.Forms.MessageBox.Show("Could not save file: " + e.Message + "\n\r" + e.StackTrace);
                    return;
                }
                GraphNode.ClearGraph(lang);
                AbbreviatedGraph.OpenFile(dir, name);
                output = "Graph created and saved: " + totalErrors + " Error(s)";
            }

            SuspendEnabled(false);
            if (continueRun)
            {
                SetOutput(output);
            }
            else
            {
                SetOutput("Analysis halted");
            }
            halted = true;
            System.Media.SystemSounds.Exclamation.Play();
            MessageBox.Show("All done", "Analysis Complete", MessageBoxButtons.OK);
        }

        #region Parsing
        private int emptyFilesFound = 0;

        private void UpdateParseCounts()
        {
            if (this.InvokeRequired)
            {
                Invoke(new MethodInvoker(UpdateParseCounts));
                return;
            }

            ParseProgress.Value = (int)(100 * filesDone / NotZero(totalFiles));
            ParseProgress.Refresh();

            newFiles.Text = "" + newFilesFound.Count;
            newFiles.Refresh();

            emptyFiles.Text = "" + emptyFilesFound;
            emptyFiles.Refresh();
        }

        private int NotZero(int num) {
            if (num == 0) {
                return 1;
            }
            return num;
        }

        /// <summary>
        /// Stage one of the source update process. Spawns threads for each of the source code files and produces
        /// (or accepts) a (previously calculated) parsing saved as an XML file.
        /// </summary>
        /// <returns>True if any new files are parsed; false if all files are already set.</returns>
        private bool ParseSource()
        {
            lang = LanguageManager.GetLanguage(currentProject.GetProperty(ProjectProperties.Language));
            GraphNode.SetLanguage(lang);
            tool = ToolManager.GetTool(currentProject.GetProperty(ProjectProperties.Tool));
            if (tool is LLVMTool) {
                ((LLVMTool) tool).project = currentProject;
            }
            rootPath = currentProject.GetProperty(ProjectProperties.RootDirectory);
            analysisPath = currentProject.FilePath;
            analysisPath = analysisPath.Substring(0, analysisPath.LastIndexOf(Path.DirectorySeparatorChar));

            totalFiles = 0;

            foreach (string lang_ext_glob in lang.FileExtensionGlobs) {
                string[] files = Directory.GetFiles(currentProject.GetProperty(ProjectProperties.RootDirectory), lang_ext_glob, SearchOption.AllDirectories);
                totalFiles += files.Length;
                filesDone = 0;
                newFilesFound = new List<string>();
                UpdateParseCounts();
                SetOutput("Checking for updated files in " + currentProject.GetProperty(ProjectProperties.ProjectName));

                //go through all files which match the required extension
                foreach (string file in files)
                {
                    if (!continueRun)
                    {
                        break;
                    }
                    Thread t = new Thread(ReadFile);
                    t.Name = file;

                    while (spawned > MaxThreads)
                    {
                        Thread.Sleep(250);
                    }

                    t.Start(new string[]{file, lang_ext_glob});
                    ChangeSpawnCount(1);
                    UpdateParseCounts();
                }

                while (spawned > 0)
                {
                    Thread.Sleep(500);
                }
                UpdateParseCounts();

                if (continueRun)
                {
                    SetOutput("Files parsed: " + totalErrors + " Error(s)");
                }
            }

            return newFilesFound.Count > 0;
        }

        private void ReadFile(object parameters)
        {
            string[] str_parameters = (string[]) parameters;
            string fileName = str_parameters[0];
            string file_extension = str_parameters[1];
            string parsePath = analysisPath + Path.DirectorySeparatorChar + ParseFolder;
            string parseFile = fileName.Replace(rootPath, parsePath);
            string fileRoot = parseFile.Substring(0, parseFile.Length - file_extension.Length + 1);
            string xmlFile = fileRoot + ".XML";
            string directory = parseFile.Substring(0, parseFile.LastIndexOf(Path.DirectorySeparatorChar));

            // StartAnalysis.ReadFile(currentProject, tool, lang, file_extension, fileName);

            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            ITool myTool = tool.Clone();
            bool newerCode = true;//assume all code is new (i.e. has never been analyzed before)

            //exclude this code from parsing based on xml which already exists in 
            //an XML file more recent than the code file
            if (File.Exists(xmlFile))
            {
                DateTime xml = File.GetLastWriteTime(xmlFile);
                DateTime code = File.GetLastWriteTime(fileName);

                //new code is consistent with the last saved source AND the last verison of tree
                newerCode = !((xml.Ticks > code.Ticks) && NodeFactory.IsCurrentVersion(xmlFile));
            }

            if (newerCode)//if the code is in fact newer then we parse the source into an XML tree
            {
                myTool.Analyze(fileName, lang);

                List<string> errors = myTool.Errors;
                if (myTool.NoTreeCreated)
                {
                    //we don't track new files if they are empty
                    //this kind of error occurs when the file did not yield a tree
                    lock (emptyFiles)
                    {
                        emptyFilesFound++;
                    }
                }
                else
                {
                    //newer file with a non-empty tree. This counts.
                    lock (newFiles)
                    {
                        newFilesFound.Add(fileRoot);
                    }

                    if (errors.Count > 0)
                    {
                        //there are some errors; create a report
                        ErrorMessage.Show(fileName.Substring(rootPath.Length), myTool.GetType().ToString(), errors);

                        lock (errorLock)
                        {
                            totalErrors++;
                        }
                    }

                    INode node = myTool.ParsedNode;
                    if (node != null)
                    {
                        NodeFactory.WriteTextFile(node, fileRoot);
                        NodeFactory.WriteXMLFile(node, xmlFile, parsePath);
                    }
                }
            }

            lock (ParseProgress)
            {
                filesDone++;
            }

            ChangeSpawnCount(-1);
            UpdateParseCounts();
        }
        #endregion

        #region Graphing
        private void UpdateGraphCounts()
        {
            if (this.InvokeRequired)
            {
                Invoke(new MethodInvoker(UpdateGraphCounts));
                return;
            }

            filesRegistered.Text = "" + filesDone;
            TotalFilesToRegister.Text = "" + totalFiles;
            registerProgress.Value = (int)(100 * filesDone / NotZero(totalFiles));
        }

        private void RegisterGraph()
        {
            GraphNode.ClearGraph(lang);
            string[] files = Directory.GetFiles(analysisPath + Path.DirectorySeparatorChar + ParseFolder, "*.XML", SearchOption.AllDirectories);
            totalFiles = files.Length;
            filesDone = 0;

            UpdateGraphCounts();
            SetOutput("Registering all members in " + currentProject.GetProperty(ProjectProperties.ProjectName));

            //go through all files which match the required extension
            foreach (string file in files)
            {
                if (!continueRun)
                {
                    break;
                }
                Thread t = new Thread(LoadTree);
                t.Name = file;

                while (spawned > MaxThreads)
                {
                    Thread.Sleep(250);
                }

                t.Start(file);

                ChangeSpawnCount(1);
                UpdateGraphCounts();
            }

            while (spawned > 0)
            {
                Thread.Sleep(500);
            }
            UpdateGraphCounts();

            if (continueRun)
            {
                SetOutput("All members registererd: " + totalErrors + " Error(s)");
            }
        }

        private void LoadTree(object parameters)
        {
            //read the parsed file and register it with the graph
            GraphNode.Register(NodeFactory.ReadXMLTree((string)parameters));

            lock (registerProgress)
            {
                filesDone++;
            }

            ChangeSpawnCount(-1);
            UpdateGraphCounts();
        }
        #endregion

        #region Linking
        private long LinkEvents = 0;
        private void graphLinkProgressChanged(object sender, LinkEventArgs e)
        {
            if (this.InvokeRequired)
            {
                Invoke(new Action<object, LinkEventArgs>(graphLinkProgressChanged), new object[] { sender, e });
                return;
            }

            lock (linkProgress)
            {
                if (e.ID > LinkEvents)
                {
                    LinkEvents = e.ID;
                    int total = e.Total;

                    if (total < totalMembers)
                    {
                        total = totalMembers;
                    }
                    int percent = (int)(100 * e.Done / NotZero(total));
                    LinkPercent.Text = "" + percent + " %";
                    linkProgress.Value = percent;
                }
            }
        }

        private void UpdateLinkCounts()
        {
            if (this.InvokeRequired)
            {
                Invoke(new MethodInvoker(UpdateLinkCounts));
                return;
            }

            InitialLinksDone.Text = "" + filesDone;
            TotalInitialLinks.Text = "" + totalFiles;
            InitialLinkProgress.Value = (int)(100 * filesDone / NotZero(totalFiles));
        }

        private void LinkGraph()
        {
            SetOutput("Linking all types in " + currentProject.GetProperty(ProjectProperties.ProjectName));

            //find the total number of types
            List<GraphNode> types = new List<GraphNode>();
            totalMembers = GraphNode.GetAllTypes(types);
            filesDone = 0;
            totalFiles = types.Count;

            foreach (GraphNode t in types)
            {
                if (!continueRun)
                {
                    break;
                }

                Thread thread = new Thread(InitialLink);
                thread.Name = thread.ToString();

                while (spawned > MaxThreads)
                {
                    Thread.Sleep(250);
                }

                thread.Start(t);

                ChangeSpawnCount(1);
                UpdateLinkCounts();
            }


            //wait for initial links to finish
            while (totalFiles > filesDone)
            {
                Thread.Sleep(250);
            }

            //switching gears now. Up until now we have only set up the type linking
            //now we are going to link the members within the various scopes.
            //we know how many of them there are so we start counting from here.
            SetOutput("Linking all members in " + currentProject.GetProperty(ProjectProperties.ProjectName));
            LinkEvents = 0;
            GraphNode.PrepareForLink(graphLinkProgressChanged);

            //start a thread purely for the linking process
            Thread thread2 = new Thread(GraphNode.LinkAll);
            thread2.Start();

            //wait for the semaphore to be set
            while (!GraphNode.AllLinking)
            {
                Thread.Sleep(500);
            }

            //depend on the semaphore
            while (linkProgress.Value < 100)
            {
                Thread.Sleep(500);
            }

            UpdateGraphCounts();

            if (continueRun)
            {
                SetOutput("All members linked: " + totalErrors + " Error(s)");
            }
        }

        private void InitialLink(object parameters)
        {
            ((GraphNode)parameters).InitialLink();

            lock (linkProgress)
            {
                filesDone++;
            }

            ChangeSpawnCount(-1);
            UpdateLinkCounts();
        }
        #endregion
        #endregion

        #region Thread control
        private object spawnLock = new object();
        private int MaxThreads = 5;
        private int spawned = 0;

        private void ChangeSpawnCount(int amount)
        {
            lock (spawnLock)
            {
                spawned += amount;
            }
        }

        private Thread currentThread;
        private bool continueRun = false;
        private bool halted = true;
        private object startLock = new object();
        private bool waitingOnStart = false;
        private void Stop()
        {
            //only execute once a process has been executed
            if (currentThread != null)
            {
                //soft stop of execution
                continueRun = false;
            }
        }

        private void Start()
        {
            lock (startLock)
            {
                if (!waitingOnStart)
                {
                    //start an asynchronous thread which tries to start up a new process
                    Thread t = new Thread(AsynchStart);
                    waitingOnStart = true;
                    t.Start();
                }
            }
        }

        private void AsynchStart()
        {
            //if a soft stop has been called for we wait for the algorithm to halt before proceeding.
            while (!halted)
            {
                Thread.Sleep(250);
            }

            lock (startLock)
            {
                currentThread = new Thread(InitiateRead);
                currentThread.Name = "Main";
                halted = false;
                continueRun = true;
                waitingOnStart = false;
                currentThread.Start();
            }
        }

        private void SuspendButton_Click(object sender, EventArgs e)
        {
            Stop();
        }
        #endregion
    }
}