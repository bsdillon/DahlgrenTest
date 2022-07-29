using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure.Metrics;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    /// <summary>
    /// Head class used to navigate the graph and discover all metrics
    /// </summary>
    public class ModuleNavigator : IGraphNavigator
    {
        // Control communications with the user during work.
        private Label output;
        private void SetOutput(string msg)
        {
            if (output != null)
            {
                output.Text = msg;
                output.Refresh();
            }
            else
            {
                Console.WriteLine(msg);
            }
        }

        #region File IO
        // Defines the valid file type used by this IGraphNavigator
        private static string nodeSuffix = ".nod.csv";
        public static string FileSuffix
        {
            get
            {
                return nodeSuffix;
            }
        }

        private static string edgeSuffix = ".edg.csv";
        private string fileStem;
        private List<string> csvPaths;
        private string csvErrors = "";
        //Austin: adding CriticalCSVPaths and necessary variables 
        private List<string> criticalCsvPaths;
        private String cDescription = "testvalue";
        private String cProperty = "testvalue";
        private int criticalLineNum = -1;

        #endregion

        public ModuleNavigator(string fileRoot, Label userOutput)
        {
            fileStem = fileRoot;
            output = userOutput;
        }

        //accept csv input file from other static analyzers (PMD, KlocWork, etc.) from metrics tab
        public void SetCsvInput(List<string> csvRecieved)
        {
            csvPaths = csvRecieved;
        }
        //Austin: accept critical csv input file from metrics tab
        public void SetCriticalCsvInput(List<string> criticalCsvRecieved)
        {
            criticalCsvPaths = criticalCsvRecieved;
        }

        //required functionality under IGraphNavigator
        public void Navigate(AbbreviatedGraph current)
        {
            Console.WriteLine("did it get into Navigate in ModuleNavigator.cs?");
            MetricUtilities.Initialize();
            if (current == null)
            {
                // Discovered when loading c++ projects
                SetOutput("AbbreviatedGraph is null!");
                return;
            }

            SetOutput("Looking for graph members");
            DiscoverAllMembers(current);

            //Create gephi nodes for all type members.
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                bool isInterface = false;

                if (type.Represented.Node.Equals(Members.INTERFACE))
                {
                    isInterface = true;
                }

                //TODO Reconsider the definition of interface in metrics
                //At some point I was using an abstract or stateless annotation as 
                //the sign of an interface. It is completely disabled in the 
                //current version, but it either needs to used or just removed.
                AbbreviatedGraph[] annotations = type.GetEdges(Relationship.Annotation).Keys.ToArray();
                if (annotations.Length > 0)
                {
                    foreach (AbbreviatedGraph a in annotations)
                    {
                        if (a.Represented.Node.Equals(Members.Abstract))
                        {
                            //isInterface = true;
                            break;
                        }
                        else if (a.Represented.Node.Equals(Members.Annotation) && a.Represented.Code.Equals("Stateless"))
                        {
                            //isInterface = true;
                            break;
                        }
                    }
                }

                Console.WriteLine("type=" + type);

                //TODO consider new means of excluding external nodes
                //the current metric recognizes that the file was not 
                //one of those under test so we can ignore it. This
                //will not be true of the next version of the metric
                bool externalMember = type.Represented.FileName.Equals("--");

                foreach (AbbreviatedGraph member in MetricUtilities.GetMembersOf(type))//look at all members in that type
                {

                    Console.WriteLine("member=" + member);

                    //Determine the initial values of the new node
                    long myMember = MetricUtilities.GetMemberID(type, member);

                    long module = myMember;

                    bool inQAlgorithm = true;
                    NodePatterns p = NodePatterns.None;
                    if (externalMember)
                    {
                        p = NodePatterns.External;
                        inQAlgorithm = false;
                    }
                    else if (isInterface)
                    {
                        p = NodePatterns.Interface;
                        inQAlgorithm = false;
                    }

                    //create the gephi node for this member
                    MetricUtilities.InitializeGephiNode(myMember, member, type, module, p, AccessPatterns.None, inQAlgorithm);
                }
            }

            SetOutput("Creating graph edges");
            //Create all edges and define weights
            allSourceMethods = new Dictionary<AbbreviatedGraph, GephiNode>();
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                foreach (AbbreviatedGraph member in MetricUtilities.GetMembersOf(type))
                {
                    //CreateEdges(member, Relationship.ParamLink, 1);
                    CreateWriteEdges(member, Relationship.WrittenBy, 1);
                    CreateEdges(member, Relationship.CandidateRead, 1);
                    CreateEdges(member, Relationship.NewImplementation, 0);
                }
            }

            //if the user submits csv file(s) to add to the nodes, add them
            //if matching file/line numbers are found between
            //csv file and the already create gephinodes, add all csv data to the node

            SetOutput("Scanning for known patterns");
            NodePatternMetrics.FindPatterns();
            SetOutput("Scanning for unconnected nodes");
            ConnectivityMetrics.TagLoneNodes();
            SetOutput("Discovering modules");
            QAlgorithm.Instance.MainAlgorithm();
            SetOutput("Identifying API classes");
            ConnectivityMetrics.FindAPIClasses();
            SetOutput("Measuring integrity values");
            IntegrityMetrics.CalculateAllItegrityValues();
            SetOutput("Scanning for turmors");
            CancerInvasion.FindCancers();
            SetOutput("Identifying state members");
            StateCounter.CountAllStates();
            SetOutput("Looking for state machines");
            StatePatternMetrics.FindPatterns();

            SetOutput("Checking for any CSV Issues");
            TraceCSVLinks(current);
            Console.WriteLine("did it get through traceCSVlinks?");
            //Austin - adding Critical CSV Input Metric
            TraceCriticalCSVLinks();
            Console.WriteLine("did it get through criticallinks?");
            SetOutput("Writing graph files");
            WriteOutGraph();
            Console.WriteLine("did it get through graph files?");
            SetOutput("Writing metric reports");
            WriteMetricReports();
            Console.WriteLine("did it get through metricreports?");
            SetOutput("Done");
            Console.WriteLine("did it get through everything in Navigate?");
        }

        #region Report Writing
        private void WriteOutGraph()
        {
            //output all edges
            MetricUtilities.WriteEdges(fileStem + edgeSuffix);

            long moduleIndex = 25;//start of separted modules
            moduleIndex += 25;//moving index for other modules.

            //start all node writers
            StreamWriter externalWriter = new StreamWriter(fileStem + "_External" + nodeSuffix);
            StreamWriter interfaceWriter = new StreamWriter(fileStem + "_Interface" + nodeSuffix);
            StreamWriter loneWriter = new StreamWriter(fileStem + "_Lone" + nodeSuffix);
            StreamWriter APIWriter = new StreamWriter(fileStem + "_API" + nodeSuffix);
            StreamWriter separatedWriter = new StreamWriter(fileStem + "_Separated" + nodeSuffix);
            StreamWriter tumorWriter = new StreamWriter(fileStem + "_Tumor" + nodeSuffix);
            StreamWriter ModuleWriter = new StreamWriter(fileStem + "_Module" + nodeSuffix);

            //node 0 will be used to define the header of each file
            //*update* - node[0] is used to call the static dictionary of properties to obtain the header
            //this removes the attributes which do not need to show up
            //in the file and then writes the header for that node
            //in each of the files.
            GephiNode[] nodes = MetricUtilities.AllNodes;
            nodes[0].RemoveProperty(NodeProperties.QState);
            nodes[0].RemoveProperty(NodeProperties.ClassIntegrity);
            nodes[0].RemoveProperty(NodeProperties.ModuleIntegrity);

            string nodeHeader = nodes[0].getHeader();
            externalWriter.WriteLine(nodeHeader);
            interfaceWriter.WriteLine(nodeHeader);
            loneWriter.WriteLine(nodeHeader);
            APIWriter.WriteLine(nodeHeader);
            separatedWriter.WriteLine(nodeHeader);
            tumorWriter.WriteLine(nodeHeader);
            ModuleWriter.WriteLine(nodeHeader);

            //go through each node and put it in the right file
            foreach (GephiNode n in nodes)
            {
                //remove non-reported attributes
                long module = (long)n.GetProperty(NodeProperties.Module);
                n.RemoveProperty(NodeProperties.QState);
                n.RemoveProperty(NodeProperties.ClassIntegrity);
                n.RemoveProperty(NodeProperties.ModuleIntegrity);

                //this module is pseudo-random based on the Q algorithm and
                //is ill-suited for a clean file output with consecutive
                //modules numbers in a given range.
                long mod = (long)n.GetProperty(NodeProperties.Module);

                //write state-related files
                StatePatterns sp = (StatePatterns)n.GetProperty(NodeProperties.StateMember);
                if (sp != StatePatterns.None)
                {
                    bool skip = false;
                    switch (sp)
                    {
                        case StatePatterns.ConstantVariable:
                            moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                            tumorWriter.WriteLine(n.ToGephiRecord());
                            skip = true;
                            break;
                        case StatePatterns.ConstantLogic:
                            moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                            tumorWriter.WriteLine(n.ToGephiRecord());
                            skip = true;
                            break;
                        case StatePatterns.UncalledStateMethod:
                            moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                            tumorWriter.WriteLine(n.ToGephiRecord());
                            skip = true;
                            break;
                        case StatePatterns.UnreadStateField:
                            moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                            tumorWriter.WriteLine(n.ToGephiRecord());
                            skip = true;
                            break;
                        case StatePatterns.CasualCancer:
                            moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                            tumorWriter.WriteLine(n.ToGephiRecord());
                            skip = true;
                            break;
                    }

                    if (skip)
                    {
                        //State-related members which belong to the cancer group
                        //will not appear in any other file; skip writing them out
                        continue;
                    }
                }

                //Nodes which were not part of a known state-problem
                //are added to one of several file types.
                switch ((NodePatterns)n.GetProperty(NodeProperties.NodePattern))
                {
                    case NodePatterns.External:
                        //module is fixed
                        externalWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.Interface:
                        //module is fixed
                        interfaceWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.APIClass:
                        //module is fixed
                        APIWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.LoneNodes:
                        //module is fixed
                        loneWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.Separated:
                        //module is fixed
                        separatedWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.DysplasiaII:
                        moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                        tumorWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.DysplasiaI:
                        moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                        tumorWriter.WriteLine(n.ToGephiRecord());
                        break;
                    case NodePatterns.Tumor:
                        moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                        tumorWriter.WriteLine(n.ToGephiRecord());
                        break;
                    default:
                        moduleIndex = FinalizeModuleNumber(mod, moduleIndex);
                        ModuleWriter.WriteLine(n.ToGephiRecord());
                        break;
                }
            }

            //close all the file outputs.
            externalWriter.Close();
            interfaceWriter.Close();
            loneWriter.Close();
            APIWriter.Close();
            separatedWriter.Close();
            ModuleWriter.Close();
            tumorWriter.Close();
        }

        private void WriteMetricReports()
        {
            //prepare the summary file
            StreamWriter writer = new StreamWriter(fileStem + "_Summary.txt");
            StringBuilder summary = new StringBuilder();
            summary.Append("Summary report\r\n");

            //IN each of the following sections a report file will be generated for a
            //specific metric. As part of that process the number of reports will be
            //output and THAT will be put into the summary report.

            int reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Constants.txt", StatePatterns.ConstantVariable);
            summary.Append("Constant Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Settings.txt", StatePatterns.SettingVariable);
            summary.Append("Setting Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Sources.txt", StatePatterns.SettingSource);
            summary.Append("Source Object Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Unread.txt", StatePatterns.UnreadStateField);
            summary.Append("Unread State Variable Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_SuperMethod.txt", StatePatterns.SuperStateMember);
            summary.Append("Super State Method Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Healthy.txt", StatePatterns.StateVariable);
            summary.Append("Healthy State Reports: " + reportCount + System.Environment.NewLine);

            reportCount = StateMachineMetrics.CreateReport(fileStem + "State_Objects.txt", StatePatterns.SomeState);
            summary.Append("State Object Reports: " + reportCount + System.Environment.NewLine);

            reportCount = CancerInvasion.ReportTumors(fileStem + "Cancer_Tumor");
            summary.Append("Tumor Reports: " + reportCount + System.Environment.NewLine);

            reportCount = CancerInvasion.ReportDysplasia(fileStem + "Cancer_Dysplasia");
            summary.Append("Dysplasia Reports: " + reportCount + System.Environment.NewLine);

            reportCount = CancerInvasion.ReportFeatures(fileStem + "Features");
            summary.Append("Feature Reports: " + reportCount + System.Environment.NewLine);

            reportCount = NodePatternMetrics.DecoratorReport(fileStem + "Decorators.txt");
            summary.Append("Decorator Reports: " + reportCount + System.Environment.NewLine);

            reportCount = NodePatternMetrics.AccessorReport(fileStem + "GoodAccessors.txt");
            summary.Append("Good Accessor Reports: " + reportCount + System.Environment.NewLine);

            reportCount = NodePatternMetrics.BadAccessorReport(fileStem + "BadAccessors.txt");
            summary.Append("Bad Accessor Reports: " + reportCount + System.Environment.NewLine);

            reportCount = ConnectivityMetrics.APIReport(fileStem + "_API");
            summary.Append("API Reports: " + reportCount + System.Environment.NewLine);

            // TODO: CreatePlantUML needs to return an int to be used with reportCount
            // reportCount = 
            PlantUML.CreatePlantUML(fileStem + "Plant_UML.txt");
            summary.Append("Plant UML: " + reportCount + System.Environment.NewLine);

            summary.Append(csvErrors);
 
            // Uncommented. See Metrics/PlantUMLAPI.cs for instructions to get this method working
            //PlantUMLAPI.CreatePlantUMLAPI(fileStem + "Plant_UMLAPI.txt");
            //summary.Append("Plant UML API: " + reportCount + System.Environment.NewLine);

            //Austin: Eventually we will use reportCount = TraceCriticalCSVLinks with return value of integer
            //TraceCriticalCSVLinks();

            //write the summary data collected
            writer.WriteLine(summary.ToString());
            writer.Close();

            //write the verbose state report
            writer = new StreamWriter(fileStem + "_VerboseState.txt");
            writer.WriteLine(StateCounter.StateReport);
            writer.Close();

            //write the verbose state report
            StateCounter.GetSummary(fileStem + "_stateSummary.txt");

            //write the aggregated value report for each class
            StreamWriter allCountWriter = new StreamWriter(fileStem + "_AllCount" + nodeSuffix);
            CountAll.Count(allCountWriter);
            allCountWriter.Close();

            //write the graph related to heat values
            StreamWriter heatMapNodes = new StreamWriter(fileStem + "_heat" + nodeSuffix);
            StreamWriter heatMapEdges = new StreamWriter(fileStem + "_heat" + edgeSuffix);
            CountAll.FindPackages(heatMapNodes, heatMapEdges);
            heatMapEdges.Close();
            heatMapNodes.Close();

        }

        /// <summary>
        /// Compresses all modules into a consecutive set. The
        /// current module mod will be replaced with a new value
        /// either derived from the already remapped module number
        /// OR adding a new module.
        /// Returns the next maximum
        /// </summary>
        /// <param name="mod"></param>
        /// <param name="max"></param>
        /// <returns></returns>
        private long FinalizeModuleNumber(long mod, long max)
        {
            if (mod > max)
            {
                if (MetricUtilities.ModuleExists(max))
                {
                    MetricUtilities.SwitchModules(mod, max);
                    return max + 1;
                }
                else
                {
                    //this is from a new module; move all the current members over
                    foreach (GephiNode member in MetricUtilities.GetModule(mod))
                    {
                        MetricUtilities.ChangeModule(member, max);
                    }

                    //go to the next index
                    return max + 1;
                }
            }
            return max;
        }
        #endregion

        #region GraphCreation
        //temporary mapping to GephiNode for all edge calculations
        private Dictionary<AbbreviatedGraph, GephiNode> allSourceMethods;

        /// <summary>
        /// Creates a group of edges from member following all relationships matching the specification
        /// </summary>
        /// <param name="member"></param>
        /// <param name="r"></param>
        /// <param name="weightFactor"></param>
        private void CreateEdges(AbbreviatedGraph member, Relationship r, double weightFactor)
        {
            GephiNode edgeSink = MetricUtilities.GephiFromGraph(member);

            //search links to find connections with other types.
            //count the edges relating some member to another
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> nextEdges = member.GetEdges(r);

            //create edges if they exist
            if (nextEdges.Keys.Count > 0)
            {
                //this collection summarizes the counts for all edges
                //a method may be linked to member by more than one edge
                //as in x=y and z=y
                Dictionary<AbbreviatedGraph, int> sourceMethodWeight = new Dictionary<AbbreviatedGraph, int>();

                //count the links for this one edge as in x=y
                foreach (AbbreviatedGraph edge in nextEdges.Keys)
                {
                    if (edge.Represented.Node.Equals(Members.Literal))
                    {
                        //we do not link to literals
                        continue;
                    }

                    //the edge may link to a boolean expression or something similar.
                    //the root is the actual method or field in some class within whose 
                    //scope this method or field was touched.
                    AbbreviatedGraph sourceMethod = FindSourceMethod(edge);
                    List<AbbreviatedGraph> linkableSourceMethods = new List<AbbreviatedGraph>();

                    if (member == sourceMethod)
                    {
                        //should have no self-referential connections.
                        continue;
                    }

                    if (sourceMethod == null && !edge.Represented.Node.IsClassification)
                    {
                        //we don't consider connections to types
                        continue;
                    }

                    if (edge.Represented.Node.IsClassification || (sourceMethod.Represented.Node.Equals(Members.Field) && sourceMethod.Represented.Code.Equals(NodeFactory.SelfReference)))
                    {
                        //Links from "this" or the static members from class name aren't usable
                        //we need to link to the method where the member is connected
                        //nextEdges[edge] is a list of all the statements where the edge
                        //exists. All of them will be sourced on a method.
                        foreach (AbbreviatedGraph s in nextEdges[edge])
                        {
                            AbbreviatedGraph methodLocation = FindSourceMethod(s);

                            if (methodLocation != null)
                            {
                                linkableSourceMethods.Add(methodLocation);
                            }
                        }
                    }
                    else
                    {
                        //if the link is a natural one (on a method), we only 
                        //have the one source to link
                        linkableSourceMethods.Add(sourceMethod);
                    }

                    //linkableSourcesMethods are all the methods which link to edge
                    foreach (AbbreviatedGraph s in linkableSourceMethods)
                    {
                        if (member == s)
                        {
                            //should have no self-referential connections.
                            continue;
                        }

                        if (!sourceMethodWeight.ContainsKey(s))
                        {
                            //add a new method linked to member
                            sourceMethodWeight.Add(s, 0);

                            //globally track all the source objects. This prevents
                            //the need to create competing Gephi definiitions from 
                            //the same AbbreviatedGraph
                            if (!allSourceMethods.ContainsKey(s))
                            {
                                if (MetricUtilities.GephiExists(s))
                                {
                                    allSourceMethods.Add(s, MetricUtilities.GephiFromGraph(s));
                                }
                            }
                        }

                        //increment the size of the relationship between member and this method
                        sourceMethodWeight[s]++;
                    }
                }

                //create the edges from the weights
                foreach (AbbreviatedGraph key in sourceMethodWeight.Keys)
                {
                    if (allSourceMethods.ContainsKey(key))
                    {
                        GephiNode edgeSource = allSourceMethods[key];
                        double weight = sourceMethodWeight[key] * weightFactor;
                        bool inQAlgorithm = weightFactor > 0 && !MetricUtilities.IsExternal(edgeSource);
                        MetricUtilities.CreateSingleEdge(edgeSource, edgeSink, r, weight, inQAlgorithm);
                    }
                }
            }
        }

        private void CreateWriteEdges(AbbreviatedGraph member, Relationship r, double weightFactor)
        {
            GephiNode edgeSink = MetricUtilities.GephiFromGraph(member);

            //search links to find connections with other types.
            //count the edges relating some member to another
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> nextEdges = member.GetEdges(r);

            //create edges if they exist
            if (nextEdges.Keys.Count > 0)
            {
                //this collection summarizes the counts for all edges
                //a method may be linked to member by more than one edge
                //as in x=y and z=y
                Dictionary<AbbreviatedGraph, int> sourceMethodWeight = new Dictionary<AbbreviatedGraph, int>();

                //count the links for this one edge as in x=y
                foreach (AbbreviatedGraph edge in nextEdges.Keys)
                {
                    //for writes, we don't care WHAT writes to it (that is covered by read if we care at all)
                    //instead we just want to find out WHERE they took place.

                    //the edge may link to a boolean expression or something similar.
                    //the root is the actual method or field in some class within whose 
                    //scope this method or field was touched.

                    List<AbbreviatedGraph> linkableSourceMethods = new List<AbbreviatedGraph>();
                    foreach (AbbreviatedGraph s in nextEdges[edge])
                    {
                        AbbreviatedGraph methodLocation = FindSourceMethod(s);
                        if (methodLocation != null)
                        {
                            linkableSourceMethods.Add(methodLocation);
                        }
                    }

                    //linkableSourcesMethods are all the methods which link to edge
                    foreach (AbbreviatedGraph s in linkableSourceMethods)
                    {
                        if (member == s)
                        {
                            //should have no self-referential connections.
                            continue;
                        }

                        if (s == null)
                        {
                            //should have no null connections.
                            continue;
                        }

                        if (!sourceMethodWeight.ContainsKey(s))
                        {
                            //add a new method linked to member
                            sourceMethodWeight.Add(s, 0);

                            //globally track all the source objects. This prevents
                            //the need to create competing Gephi definiitions from 
                            //the same AbbreviatedGraph
                            if (!allSourceMethods.ContainsKey(s))
                            {
                                AbbreviatedGraph temp = s;
                                if (!MetricUtilities.GephiExists(temp))
                                {
                                    temp = MetricUtilities.FindMethod(s);
                                    if (temp == null)
                                    {
                                        temp = MetricUtilities.FindField(s);
                                    }

                                    if (temp == null)
                                    {
                                        temp = MetricUtilities.FindType(s);
                                    }
                                }

                                if (MetricUtilities.GephiExists(temp))
                                {
                                    //TODO investigate why there would still be no Gephi
                                    allSourceMethods.Add(temp, MetricUtilities.GephiFromGraph(temp));
                                }
                            }
                        }

                        //increment the size of the relationship between member and this method
                        sourceMethodWeight[s]++;
                    }
                }

                //create the edges from the weights
                foreach (AbbreviatedGraph key in sourceMethodWeight.Keys)
                {
                    if (allSourceMethods.ContainsKey(key))
                    {
                        GephiNode edgeSource = allSourceMethods[key];
                        double weight = sourceMethodWeight[key] * weightFactor;
                        bool inQAlgorithm = weightFactor > 0 && !MetricUtilities.IsExternal(edgeSource);
                        MetricUtilities.CreateSingleEdge(edgeSource, edgeSink, r, weight, inQAlgorithm);
                    }
                }
            }
        }

        //finds the method where node is in scope or null if there is no method
        private AbbreviatedGraph FindSourceMethod(AbbreviatedGraph node)
        {
            if (node.Represented.Node.IsClassification)
            {
                //only occurs for static access of members
                return null;//no link represented by root.
            }

            AbbreviatedGraph current = node;

            while (!current.Represented.Node.IsMethodDefinition)
            {
                AbbreviatedGraph[] parent = current.GetEdges(Relationship.MemberOf).Keys.ToArray();

                if (parent.Length == 0)
                {
                    throw new InvalidOperationException("Search for root from " + node + " was without bound");
                }

                if (parent[0].Represented.Node.IsClassification)
                {
                    //if the parent of a node is the class, then it must be directly parented off of a field on the class.
                    return current;
                }

                current = parent[0];
            }

            //the method on which the node is parented.
            return current;
        }

        /// <summary>
        /// Recursive function which finds all types and then the members within those types
        /// adding them to the MetricUtilities members set.
        /// </summary>
        /// <param name="current"></param>
        private void DiscoverAllMembers(AbbreviatedGraph current)
        {

            Console.WriteLine("DiscoverAllMembers(" + current + ") IsClassification=" + current.Represented.Node.IsClassification);

            if (current.Represented.Node.IsClassification)
            {
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> members = current.GetEdges(Relationship.Member);
                foreach (AbbreviatedGraph m in members.Keys)
                {
                    Console.WriteLine(
                        "m.Represented.Node.Equals(Members.Field)=" + m.Represented.Node.Equals(Members.Field) +
                        "  m.Represented.Code.Equals(NodeFactory.SelfReference)=" + m.Represented.Code.Equals(NodeFactory.SelfReference) +
                        "  m.Represented.Node.IsMethodDefinition=" + m.Represented.Node.IsMethodDefinition +
                        "  m.Represented.Node.Equals(Members.Value)=" + m.Represented.Node.Equals(Members.Value)
                    );

                    // TODO: in C++ scans these 2 properties are always true, making no nodes be reported in the metrics.

                    // if (m.Represented.Node.Equals(Members.Field) && m.Represented.Code.Equals(NodeFactory.SelfReference))
                    // {
                    //     continue;
                    // }

                    if (m.Represented.Node.Equals(Members.Field) || m.Represented.Node.IsMethodDefinition || m.Represented.Node.Equals(Members.Value))
                    {
                        if (!m.IsSimulated && (m.Represented.Node.Equals(Members.Field) || m.Represented.Node.Equals(Members.Method)))
                        {
                            //Console.WriteLine(m.Represented.FileName + "\t" + m.Represented.Node + "\t" + m.Represented.Code + "\t" + m.GetEdges(Relationship.Control).Count);
                        }

                        //need to add to known members
                        MetricUtilities.AddMember(current, m);
                    }
                    else if (m.Represented.Node.IsClassification)
                    {
                        DiscoverAllMembers(m);
                    }
                    else if (m.Represented.Node.Equals(Members.ArrayInvoke))
                    {
                        //need to add to known members
                        MetricUtilities.AddMember(current, m);
                    }
                    else
                    {
                        throw new InvalidCastException("Unknown type member " + m);
                    }
                }
            }
            else
            {
                //dictionary of associated and related items
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> nextEdges = current.GetEdges(Relationship.Member);

                Console.WriteLine("nextEdges.Count = " + nextEdges.Count);

                //discover all members of associated and related items also (recursive)
                foreach (AbbreviatedGraph next in nextEdges.Keys)
                {
                    DiscoverAllMembers(next);
                }
            }
        }

        private void TraceCSVLinks(AbbreviatedGraph current)
        {
            Console.WriteLine("Are CSV links being traced?");
            //if there are no csv files, there is nothing to trace
            if (csvPaths == null)
            {
                return;
            }

            //foreach csv file entered by the user
            ////foreach file in linenums (declared above). key = filename, value = dictionary<line number, list of graph nodes that have that line number>
            //////read the csv file
            //////if filename and line number match
            ////////find all related edges
            foreach (String csvFile in csvPaths)
            {
                using (var read = new StreamReader(@csvFile))
                {
                    while (!read.EndOfStream)
                    {
                        //split CSV values
                        var rLine = read.ReadLine();
                        var values = rLine.Split(',');
                        //user csv input format = file, line, error description, error property
                        string errorDescription = values[2];
                        string errorProp = values[3];

                        //check that each property within the csv is not found in the NodeProperties enum.
                        //this was already checked for, so it should not be an issue.
                        //if this is found, crash the program with an error
                        foreach (string enumProp in Enum.GetNames(typeof(NodeProperties)))
                        {
                            if (errorProp == enumProp)
                            {
                                throw new InvalidDataException("Error property: " + errorProp + " cannot be used.");
                            }
                        }

                        int lineNum = -1;
                        bool succeeded = int.TryParse(values[1], out lineNum);

                        if(succeeded)
                        {
                            List<AbbreviatedGraph> nodes = AbbreviatedGraph.GetNodes(values[0], lineNum);
                            if(nodes.Count>0)
                            {
                                AffectedTree at = new AffectedTree();
                                //find all graphnodes that are related to the line number entered by the user
                                TraceTree root = new TraceTree(values[0], lineNum, errorProp + ": " + errorDescription);
                                at.FindCSVConnections(root, nodes, fileStem);
                                csvErrors += "Line Number: " + lineNum + " in File: " + values[0] + " not found." + System.Environment.NewLine;
                            }
                        }
                    }
                }
            }
        }

        //Austin note: Starter function to trace Critical Nodes re: Metric Analysis
        private void TraceCriticalCSVLinks()
        {

            //if there are no csv files, there is nothing to trace
            if (criticalCsvPaths == null || csvPaths == null)
            {
                return;
            }
            //Key: /bubblesort, value: Dictionary<key of integer and value of LIST of Graphnodes//
            // Dictionary<string, Dictionary<int, List<GraphNode>>> lineNums = GraphNode.GetLineNumDict();
            //Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>> affectedDictionary = AffectedLine.GetAffectedDict();

            Console.WriteLine("****AJF: Critical CSV Path File(s): ");
            Console.WriteLine("****AJF: " + string.Join(",", criticalCsvPaths.ToArray()));
            Console.WriteLine("****AJF: Regular CSV Path File(s): ");
            Console.WriteLine("****AJF: " + string.Join(",", csvPaths.ToArray()));

            ////Parse critical file inputs
            /*
                foreach (String criticalCsvFile in criticalCsvPaths)
            {
                Console.WriteLine("****AJF: Individual Critical CSV File: " + criticalCsvFile);
                //foreach (string criticalFileNameKey in lineNums.Keys)
                //{   
                using (var readcritical = new StreamReader(@criticalCsvFile))
                {
                    while (!readcritical.EndOfStream)
                    {
                        var criticalRLine = readcritical.ReadLine();
                        var criticalValues = criticalRLine.Split(',');
                        criticalLineNum = -1;
                        bool criticalLineUsed = false;
                        //criticalValues[0] = file name
                        //criticalValues[1] = line number
                        cDescription = criticalValues[2];
                        cProperty = criticalValues[3];
                        ////Austin note: mutability property between criticalD and P, shorten "critical" and extend the different part (Property) (Description)
                        foreach (string enumProp in Enum.GetNames(typeof(NodeProperties)))
                        {
                            if (cProperty == enumProp)
                            {
                                throw new InvalidDataException("Error property: " + cProperty + " cannot be used.");
                            }
                        }

                        if (affectedDictionary.ContainsKey(criticalValues[0]))
                        {
                            Console.WriteLine("****AJF: Dictionary contains file: " + criticalValues[0]);
                            //Verify that the user inputs an integer into values[1] - if they put "xyz", it should not work
                            if (int.TryParse(criticalValues[1], out criticalLineNum))
                            {
                                Console.WriteLine("****AJF: User has correctly put in an integer. Searching AffectedDictionary...");
                                //if line number values[1], now called criticallineNum, matches a line number within /bubblesort 's integer keys
                                // Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>> affectedDictionary is full dictionary...
                                // Dictionary<string, Dictionary<int...>> is how far we've gotten, we have NOT gotten to GraphNodes yet!
                                // e.g., lineNums["/bubblesort"].ContainsKey(1) checks if line number 1 is a relevant key in bubblesort
                                if (affectedDictionary[criticalValues[0]].ContainsKey(criticalLineNum))
                                {
                                    Console.WriteLine("****AJF: Dictionary contains a node for line:" + criticalLineNum + " in file: " + criticalValues[0]);
                                    List<Dictionary<GraphNode, Relationship>> inFileOnLine = affectedDictionary[criticalValues[0]][criticalLineNum];
                                    Console.WriteLine("****AJF: These are the graphnodes that correspond to that: ");
                                    
                                    foreach (Dictionary<GraphNode, Relationship> StartingPoint in inFileOnLine)
                                    {
                                        Console.WriteLine("****AJF: Moving into next sub-dictionary <GraphNode, Relationship>");

                                        foreach (GraphNode gn in StartingPoint.Keys)
                                        {
                                            Console.WriteLine("****AJF: -----This individual graphnode is:");
                                            Console.WriteLine("****AJF: " + gn.Represented.ToString() + ": " + StartingPoint[gn]);
                                            Console.WriteLine("****AJF: ----------------Parent Nodes");
                                            //GetAllParents(gn, StartingPoint);
                                        }
                                        ///FIGURE OUT: What is in the graphnode that you actually need? Maybe come back to this place and ask if it matches filename and line number?
                                        ///Maybe try out printing all of bubblesort (line 934?), or print out all line numbers that are contained within affecteddictionary.criticalvalues
                                        ///from there, check out what is in the graph node
                                    }
                                }
                            }
                        }
                    }
                }
            }*/

            //}
        }

        //Austin note: recursion is 1. base case (exit condition), 2. make a step
        /*
         * private bool ParentCheck(GraphNode gn)
        {
            if (gn != null)
            {
                if (gn.GetParentGNs() != null)
                {
                    if (gn.GetParentGNs().Count() > 0)
                    {
                        Console.WriteLine("****AJF: Parents exist!");
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
       private void GetAllParents(GraphNode gn, Dictionary<GraphNode, Relationship> StartingPoint)
        {
            //If you got StartTree as your relationship, that's IT! You're done!
            //IF the startingpoint[gn] is start-of-tree, then you're done! GetAllParents will find next one up.
            //If there's a relationship that happens on that line, I can say "that error came from somewhere else" - then we follow the link
            if (!StartingPoint[gn].Equals(Relationship.StartTree))
            {
                //if NOT that, this is start of recursion step
                //GetAllParents(gn);
                ///withOUT recursion... just get the parent, grandparent, greatgrandparent
                ////(if those exist) ... may need to rewrite ParentCheck and still use it eventually
                ///IF parentcheck has a parent, check it. Maybe 3 for-each loops.
            }
            Console.WriteLine("****AJF:Entering GetAllParents(graphnode gn)...");

            if (!ParentCheck(gn))
            {
                Console.WriteLine("****AJF:No more parents - exiting...");
                return;
            }

            foreach (GraphNode parentgraph in gn.GetParentGNs())
            {
                Console.WriteLine("****AJF:-----calling GetAllParents");
                GetAllParents(parentgraph, StartingPoint);
            }
        }
        */
    }
}

#endregion
