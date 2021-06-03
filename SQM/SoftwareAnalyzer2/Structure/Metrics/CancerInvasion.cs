using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    /// <summary>
    /// Cancer related metrics are highly dependent on IntegrityMetrics. By comparing the integrity
    /// values of each class and module with given thresholds it is possible to identify examples
    /// of dysplasia and cancer among the various members
    /// 
    /// Also contains report methods for dysplasia and tumors.
    /// </summary>
    class CancerInvasion
    {
        private static readonly double FULL_INTEGRITY = 99;
        private static readonly double LOW_INTEGRITY = 26;
        private static readonly double POSSIBLE_TUMOR = 50;
        
        /// <summary>
        /// Head method to statically examine all classes for cancer
        /// </summary>
        public static void FindCancers()
        {
            ConsiderIntegrity();
            FilterDysplasia();
            FindTumors();
        }

        /// <summary>
        /// This will find perfect classes (all in one module), classes with
        /// internal division, and modules with minor portions 
        /// </summary>
        private static void ConsiderIntegrity()
        {
            int perfectClassCount = 0;
            int allCount = 0;
            #region Looking at Modules first
            foreach (long module in MetricUtilities.ModuleIds)
            {
                //get the module integrity from one member
                GephiNode[] members = MetricUtilities.GetModule(module);
                double moduleIntegrity = (double)members[0].GetProperty(NodeProperties.ModuleIntegrity);

                if (moduleIntegrity < FULL_INTEGRITY)
                {
                    //this module is split by at least two classes
                    List<string> alreadyAssessedClasses = new List<string>();
                    foreach (GephiNode n in members)
                    {
                        //get the class integrity from each member
                        string myClass = (string)n.GetProperty(NodeProperties.TypeName);
                        double classIntegrity = (double)n.GetProperty(NodeProperties.ClassIntegrity);

                        //remember the constituent classes
                        if (!alreadyAssessedClasses.Contains(myClass))
                        {
                            alreadyAssessedClasses.Add(myClass);

                            //separate task for any class which is entirely within this module
                            if (classIntegrity > FULL_INTEGRITY)
                            {
                                CheckForMinorClass(MetricUtilities.GetMembersOf((string)n.GetProperty(NodeProperties.File), myClass));
                            }
                        }
                    }
                }
                else
                {
                    //this module is made up of only one class.

                    //get the class integrity from one member
                    double myIntegrity = (double)members[0].GetProperty(NodeProperties.ClassIntegrity);
                    if (myIntegrity < FULL_INTEGRITY && myIntegrity > 0)
                    {
                        //this class has some intrusion or internal division and the module has high integrity
                        AssessDividedClass(MetricUtilities.GetMembersOf((string)members[0].GetProperty(NodeProperties.File), (string)members[0].GetProperty(NodeProperties.TypeName)));
                    }
                    else
                    {
                        //TODO consider this as an alternate definition of perfect class
                        //this class and module are perfectly aligned
                        //cancer does not exist at this point
                    }
                }
            }
            #endregion

            #region Looking at Classes first
            foreach (AbbreviatedGraph g in MetricUtilities.AllMembers)
            {
                //set up integrity values
                AbbreviatedGraph[] memberGraphs = MetricUtilities.GetMembersOf(g);
                Dictionary<long, List<GephiNode>> modules = new Dictionary<long, List<GephiNode>>();
                Dictionary<long, double> moduleIntegrity = new Dictionary<long, double>();
                Dictionary<long, int> moduleSize = new Dictionary<long, int>();

                foreach (AbbreviatedGraph mg in memberGraphs)
                {
                    GephiNode gn = MetricUtilities.GephiFromGraph(mg);

                    //ignore separted members
                    if (MetricUtilities.IsSeparated(gn))
                    {
                        continue;
                    }

                    //get the module
                    long m = (long)gn.GetProperty(NodeProperties.Module);
                    if (!modules.ContainsKey(m))
                    {
                        //when first seen, initialize module integrity values
                        modules.Add(m, new List<GephiNode>());
                        moduleIntegrity.Add(m, (double)gn.GetProperty(NodeProperties.ModuleIntegrity));
                        moduleSize.Add(m, MetricUtilities.SizeOfModule(m));
                    }

                    modules[m].Add(gn);
                }

                //TODO consider the accuracy of this measure for perfect classes
                //update counts for perfect classes
                if (!NodeFactory.IsAnonymous(g.Represented.Code))
                {
                    allCount++;
                    if (moduleSize.Keys.Count == 1)
                    {
                        perfectClassCount++;
                    }
                }

                foreach (long m in modules.Keys)
                {
                    //TODO consider that classPortion may be low because it includes separated members.
                    double classPortion = modules[m].Count * 100.0 / memberGraphs.Length;
                    double modulePortion = modules[m].Count * 100.0 / moduleSize[m];
                    if ( classPortion < LOW_INTEGRITY && modulePortion < LOW_INTEGRITY && modulePortion < moduleIntegrity[m])
                    {
                        //this is a module which is a minority of my class and the
                        //class is a minor portion of the module (not even the largest 
                        //portion of the module) its members are likely a form of dysplasia

                        foreach (GephiNode gn in modules[m])
                        {
                            gn.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.DysplasiaI);
                            MetricUtilities.AddCancer(NodePatterns.DysplasiaI, MetricUtilities.GraphFromGephi(gn), m);
                        }
                    }
                }
            }
            Console.WriteLine("Perfect classes: " + perfectClassCount + " out of " + allCount);
            #endregion
        }

        /// <summary>
        /// If a class contains only one non-separated member it can fall into one of two categories.
        /// * One member alone in the class - incompetent node
        /// * One member with separated members - this member is dysplasia
        /// </summary>
        /// <param name="classMembers"></param>
        private static void CheckForMinorClass(AbbreviatedGraph[] classMembers)
        {
            string className = ((string)MetricUtilities.GephiFromGraph(classMembers[0]).GetProperty(NodeProperties.TypeName));

            bool hasSeparatedMembers = false;
            List<GephiNode> members = new List<GephiNode>();
            foreach (AbbreviatedGraph g in classMembers)
            {
                GephiNode m = MetricUtilities.GephiFromGraph(g);
                if (!MetricUtilities.IsSeparated(m))
                {
                    members.Add(m);
                }
                else
                {
                    hasSeparatedMembers = true;
                }
            }

            if (members.Count == 1)
            {
                if (hasSeparatedMembers)
                {
                    members[0].SetProperty(NodeProperties.NodePattern, (int)NodePatterns.DysplasiaI);
                    AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(members[0]);
                    MetricUtilities.AddCancer(NodePatterns.DysplasiaI, ag, (long) members[0].GetProperty(NodeProperties.Module));
                }
                else
                {
                    members[0].SetProperty(NodeProperties.NodePattern, (int)NodePatterns.IncompetentLoneMember);
                }
            }
        }

        /// <summary>
        /// This class has low integrity meaning that many modules are found in it.
        /// Need to determine the degree of the problem and any related cancer.
        /// </summary>
        /// <param name="members"></param>
        private static void AssessDividedClass(AbbreviatedGraph[] members)
        {
            Dictionary<long, List<GephiNode>> membersInModule = new Dictionary<long,List<GephiNode>>();
            Dictionary<long, double> moduleIntegrities = new Dictionary<long,double>();
            Dictionary<long, double> modulePercentages = new Dictionary<long, double>();
            List<long> highModules = new List<long>();

            //find all modules in the class and remember which members of the class
            //are in which module for future use
            foreach (AbbreviatedGraph ag in members)
            {
                //get module of member
                GephiNode member = MetricUtilities.GephiFromGraph(ag);
                long m = (long) member.GetProperty(NodeProperties.Module);

                //non-separated members are the only ones that matter
                if (MetricUtilities.IsImportantConnection(member))
                {
                    if (!membersInModule.ContainsKey(m))
                    {
                        //add new module
                        membersInModule.Add(m, new List<GephiNode>());
                        double integrity = (double)member.GetProperty(NodeProperties.ModuleIntegrity);
                        moduleIntegrities.Add(m, integrity);

                        //check for high integrity modules
                        if (integrity > FULL_INTEGRITY)
                        {
                            highModules.Add(m);
                        }
                    }
                    //add member to module
                    membersInModule[m].Add(member);
                }
            }

            //separate each portion of the class as either a large-part of a module OR a small part of a module
            List<long> lowModules = new List<long>();
            foreach (long m in moduleIntegrities.Keys)
            {
                //ignore high-integrity modules
                if (moduleIntegrities[m] > FULL_INTEGRITY)
                {
                    continue;
                }

                //figure out the percentage of this class which is in the module
                modulePercentages.Add(m, 100.0 * membersInModule[m].Count / MetricUtilities.SizeOfModule(m));

                if (moduleIntegrities[m] - modulePercentages[m] < .001)
                {                    
                    //this is THE major contributor to the other module
                    //this is a large splinter of this class
                    highModules.Add(m);
                    foreach (GephiNode gn in membersInModule[m])
                    {
                        gn.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.LargeSplinter);
                    }
                }
                else if (modulePercentages[m] < LOW_INTEGRITY)
                {
                    //this is a minor member of the other module
                    lowModules.Add(m);
                }
            }

            if (lowModules.Count > 1)
            {
                //There are multiple small pieces in this class
                //this must be a splintered class.
                //identify all the low modules as potential cancerous invasion
                foreach (long l in lowModules)
                {
                    foreach (GephiNode g in membersInModule[l])
                    {
                        g.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.DysplasiaII);
                        AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(g);
                        MetricUtilities.AddCancer(NodePatterns.DysplasiaII, ag, l);
                    }
                }
            }
            else if (lowModules.Count == 1 && highModules.Count + lowModules.Count == moduleIntegrities.Count)
            {
                //this is one low module with one or more high modules.
                foreach (long l in lowModules)
                {
                    foreach (GephiNode g in membersInModule[l])
                    {
                        g.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.DysplasiaI);
                        AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(g);
                        MetricUtilities.AddCancer(NodePatterns.DysplasiaI, ag, l);
                    }
                }
            }
            else if (highModules.Count + 1 == moduleIntegrities.Count)
            {
                //TODO figure out if this cancer metric is significant
                //possiblely one medium module class.
                //No means of evaluating at present.
            }
            else if (highModules.Count == moduleIntegrities.Count)
            {
                //TODO figure out if this cancer metric is significant
                //all part of large splinters or highly integrated modules
                //is this bipartite class?
            }
            else
            {
                //TODO figure out if this cancer metric is significant
                //this is some other mix
                //No means of evaluating at present.
            }
        }

        //search for indicates that detected "dysplasia" may be valid
        private static void FilterDysplasia()
        {
            Dictionary<long, List<AbbreviatedGraph>> dysplasia = MetricUtilities.GetDysplasia();
            foreach (long moduleIndex in dysplasia.Keys)
            {
                //discover groups of module members which are common
                Dictionary<String, List<AbbreviatedGraph>> groups = new Dictionary<string, List<AbbreviatedGraph>>();
                GephiNode[] module = MetricUtilities.GetModule(moduleIndex);
                foreach (GephiNode g in module)
                {
                    AbbreviatedGraph m = MetricUtilities.GraphFromGephi(g);
                    NodeType n = m.Represented.Node;
                    String c = n.ToString()+"-"+m.Represented.Code;
                    AbbreviatedGraph t = MetricUtilities.FindType(m);
                    if (!groups.ContainsKey(c))
                    {
                        groups.Add(c, new List<AbbreviatedGraph>());
                    }
                    groups[c].Add(t);
                }

                //find the classes with the most members in common
                int max = 0;
                Dictionary<AbbreviatedGraph, int> classCounts = new Dictionary<AbbreviatedGraph, int>();
                foreach (String s in groups.Keys)
                {
                    if (groups[s].Count > 1)//ignore unique items
                    {
                        foreach (AbbreviatedGraph a in groups[s])
                        {
                            if (!classCounts.ContainsKey(a))
                            {
                                classCounts.Add(a, 0);
                            }
                            classCounts[a]++;
                            if (max < classCounts[a])
                            {
                                max = classCounts[a];
                            }
                        }
                    }
                }

                List<AbbreviatedGraph> centralClasses = new List<AbbreviatedGraph>();
                while (centralClasses.Count < 2 && max>1)//looking for at least two classes with a count greater than 1
                {
                    foreach (AbbreviatedGraph a in classCounts.Keys)
                    {
                        if (classCounts[a] == max)
                        {
                            centralClasses.Add(a);
                        }
                    }
                    max--;//this adjustment to find the next smallest number
                }

                if (centralClasses.Count > 2)//this is a feature
                {
                    foreach (GephiNode g in module)
                    {
                        AbbreviatedGraph m = MetricUtilities.GraphFromGephi(g);
                        AbbreviatedGraph t = MetricUtilities.FindType(m);
                        if (centralClasses.Contains(t))
                        {
                            MetricUtilities.AddFeature(m, moduleIndex);
                            MetricUtilities.RemoveFromDysplasia(m, moduleIndex);
                            g.SetProperty(NodeProperties.NodePattern, NodePatterns.Feature);
                        }
                        else
                        {
                            //the rest of the displasia module is removed
                            MetricUtilities.RemoveFromDysplasia(m, moduleIndex);
                            g.SetProperty(NodeProperties.NodePattern, NodePatterns.None);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// For each module either determine that the module is a tumor OR
        /// if the report does not meet the threshold requirements remove it
        /// entirely from cancer relationships.
        /// </summary>
        private static void FindTumors()
        {
            foreach (long module in MetricUtilities.ModuleIds)
            {
                //initialize module counts
                int cancerCount = 0;
                int incompetentMembers = 0;
                List<string> largeSplinters = new List<string>();
                List<string> cancerClasses = new List<string>();

                //Find all the module members
                GephiNode[] members = MetricUtilities.GetModule(module);
                foreach (GephiNode member in members)
                {
                    //assess each class in the module for signs of cancer
                    string myClass = (string)member.GetProperty(NodeProperties.TypeName);
                    if (MetricUtilities.IsPotentialCancer(member))
                    {
                        //Is there an incompetent member in that class
                        if ((int)member.GetProperty(NodeProperties.NodePattern) == (int)NodePatterns.IncompetentLoneMember)
                        {
                            incompetentMembers++;
                            //not actually counted as a form of cancer
                            continue;
                        }

                        //is there a large splinter associated with that class
                        if ((int)member.GetProperty(NodeProperties.NodePattern) == (int)NodePatterns.LargeSplinter)
                        {
                            if (!largeSplinters.Contains(myClass))
                            {
                                largeSplinters.Add(myClass);
                            }
                        }

                        //otherwise just count the number of cancer classes
                        if (!cancerClasses.Contains(myClass))
                        {
                            cancerClasses.Add(myClass);
                        }
                        cancerCount++;
                    }
                }

                //determine the probability of cancer as the portion of cancerous members out of the module,
                //discount the size of the module by those incompetent members as they cannot be part of 
                //this determination on either side.
                double tumorProbability = 100.0 * cancerCount / (members.Length - incompetentMembers);

                //Cancer: There must be some cancer members and more cancer classes than large splinters
                //Finally, the cancer probability must meet the required threshold

                if (cancerCount > 0 && cancerClasses.Count - largeSplinters.Count > 1 && tumorProbability > POSSIBLE_TUMOR)
                {
                    Tumor t = new Tumor(members, module);
                    if (t.IsValid())
                    {
                        MetricUtilities.AddTumor(t);

                        foreach (GephiNode member in members)
                        {
                            member.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.Tumor);
                        }
                    }
                }
                else if (cancerClasses.Count > 1)
                {
                    //this module does not meet the requirements for cancer. We need to remove it from the dysplasia set.
                    MetricUtilities.RemoveCancer(module);
                }
            }
        }

        internal static int ReportFeatures(string filename)
        {
            StreamWriter writer = new StreamWriter(filename + ".txt");
            StringBuilder sb = new StringBuilder();
            sb.Append("Features are groups of highly related members in multiple classes. These members typically \r\n");
            sb.Append("\tperform a common function which is recognizable as a discrete property of the program.\r\n\r\n");

            int count = 1;
            Dictionary<long, List<AbbreviatedGraph>> fMembers = MetricUtilities.GetFeatures();
            foreach (long moduleIndex in fMembers.Keys)
            {
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> classMembers = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
                List<AbbreviatedGraph> module = fMembers[moduleIndex];
                foreach (AbbreviatedGraph a in module)
                {
                    AbbreviatedGraph t = MetricUtilities.FindHostType(a);
                    
                    if (t.IsSimulated)
                    {
                        continue;
                    }

                    if (!classMembers.ContainsKey(t))
                    {
                        classMembers.Add(t, new List<AbbreviatedGraph>());
                    }
                    classMembers[t].Add(a);
                }

                //there is no report for this module if there are no non-simulated classes or is in the same file.
                if (classMembers.Count <2)
                {
                    continue;
                }

                sb.Append("*************Feature Report ( " + count + " )*************\r\n");
                foreach (AbbreviatedGraph t in classMembers.Keys)
                {
                    AbbreviatedGraph[] mems = t.GetEdges(Relationship.Member).Keys.ToArray();
                    sb.Append(t.ToString());
                    foreach (AbbreviatedGraph m in classMembers[t])
                    {
                        sb.Append("\t" + m + System.Environment.NewLine);
                    }
                }

                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }
            writer.WriteLine(sb);
            writer.Close();
            return count - 1;
        }

        /// <summary>
        /// Write a report with all instances of dysplasia
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        internal static int ReportDysplasia(string filename)
        {
            StreamWriter writer = new StreamWriter(filename + ".txt");
            StringBuilder sb = new StringBuilder();
            sb.Append("Dysplasia occurs when a member from one class is being inappropriately and strongly associated\r\n");
            sb.Append("\twith one or more other types. This can occur for a variety of reasons, but generally shows\r\n");
            sb.Append("\tthat the types shouldn't have that relationship (e.g. feature envy) or that they types\r\n");
            sb.Append("\tshould be even more tightly coupled (e.g. one class should subsume the other). If the member\r\n\r\n");
            sb.Append("\tis a constructor then that class might ONLY be associated with the other class(es).\r\n\r\n");
            sb.Append("Find the link between the various classes and then consider why they are linked. Is there\r\n");
            sb.Append("\tsome perpose in the connection or is the relationship meaningless? If this is a construction\r\n");
            sb.Append("\trelationship, does the auxiliary class really exist or should it be inlined?\r\n\r\n");

            int count = 1;
            Dictionary<long, List<AbbreviatedGraph>> dMembers = MetricUtilities.GetDysplasia();
            foreach (long l in dMembers.Keys)
            {
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> classMembers = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
                GephiNode dm = MetricUtilities.GephiFromGraph(dMembers[l][0]);
                long mod = (long)dm.GetProperty(NodeProperties.Module);
                AbbreviatedGraph type = MetricUtilities.FindType(dMembers[l][0]);

                GephiNode[] module = MetricUtilities.GetModule(mod);
                foreach (GephiNode g in module)
                {
                    AbbreviatedGraph m = MetricUtilities.GraphFromGephi(g);
                    AbbreviatedGraph t = MetricUtilities.FindType(m);

                    if (t.IsSimulated || type == t)
                    {
                        continue;
                    }

                    if (!classMembers.ContainsKey(t))
                    {
                        classMembers.Add(t, new List<AbbreviatedGraph>());
                    }
                    classMembers[t].Add(m);
                }

                //there is no report for this module if there are no non-simulated classes or is in the same file.
                if (classMembers.Count == 0 || (classMembers.Count == 1 && classMembers.Keys.ToArray()[0].Represented.FileName.Equals(type.Represented.FileName)))
                {
                    continue;
                }

                bool found = false;
                GephiNode mG = MetricUtilities.GephiFromGraph(dMembers[l][0]);
                foreach (AbbreviatedGraph t in classMembers.Keys)
                {
                    if (t.Represented.FileName.Equals(type.Represented.FileName))
                    {
                        continue;//not interested in read links from a class in the same file.
                    }

                    foreach (AbbreviatedGraph m in classMembers[t])
                    {
                        GephiNode tG = MetricUtilities.GephiFromGraph(m);
                        foreach (GephiEdge e in MetricUtilities.GetEdges(tG, mG))
                        {
                            if (e.GetEdgeType() == Relationship.CandidateRead)
                            {
                                found = true;
                                break;
                            }
                        }

                        if (found == true)
                        {
                            break;
                        }
                    }

                    if (found == true)
                    {
                        break;
                    }
                }

                if (!found)
                {
                    continue;
                }

                sb.Append("*************Dysplasia Report ( " + count + " )*************\r\n");
                AbbreviatedGraph[] typeMembers = type.GetEdges(Relationship.Member).Keys.ToArray();
                int percent = dMembers[l].Count * 100 / typeMembers.Length;
                sb.Append("Cancer Members - " + percent + "% of " + type + " @ " + type.Represented.FileName + System.Environment.NewLine);
                foreach (AbbreviatedGraph m in dMembers[l])
                {
                    sb.Append("\t" + m + System.Environment.NewLine);
                }

                foreach (AbbreviatedGraph t in classMembers.Keys)
                {
                    if (t == type)
                    {
                        continue;
                    }

                    AbbreviatedGraph[] mems = t.GetEdges(Relationship.Member).Keys.ToArray();

                    if (mems.Length == classMembers[t].Count)
                    {
                        sb.Append("Non-cancer Members - " + t + " @ " + t.Represented.FileName + System.Environment.NewLine);
                    }
                    else
                    {
                        percent = classMembers[t].Count * 100 / mems.Length;
                        sb.Append("Non-cancer Members - " + percent + "% of " + t + " @ " + t.Represented.FileName + System.Environment.NewLine);
                        foreach (AbbreviatedGraph m in classMembers[t])
                        {
                            sb.Append("\t" + m + System.Environment.NewLine);
                        }
                    }
                }

                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }
            writer.WriteLine(sb);
            writer.Close();
            return count-1;
        }

        /// <summary>
        /// Write a report with all instances of tumors.
        /// Also write a node/edge file which shows these tumors
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        internal static int ReportTumors(string filename)
        {
            StreamWriter writer = new StreamWriter(filename + ".txt");
            StringBuilder sb = new StringBuilder();

            sb.Append("Tumors occurs when several classes are inappropriately conjoined in relation to single\r\n");
            sb.Append("\tresponsibility which they all partially share. This ranges from multiple classes poorly\r\n");
            sb.Append("\tmanaging something which could be done from one central location (e.g. a cross-cutting\r\n");
            sb.Append("\tconcern) to a class which only partially manages a responsibility and requires other\r\n");
            sb.Append("\tclasses to intervene more directly than they should.\r\n\r\n");
            sb.Append("Examine the members in the relationship and the graphical representation of their connection.\r\n");
            sb.Append("\tConsider what responsibility is at the heart of the tumor and how it is affecting each of\r\n");
            sb.Append("\tthe classes involved. Is this a cross-cutting concern which should be more sharply defined?\r\n");
            sb.Append("\tIf so, what class(es) are responsible for the concern and how should they be accessed?\r\n");
            sb.Append("If this responsibility is managed by multiple classes, determine which class should be uniquely\r\n");
            sb.Append("\tresponsible and determine how to reduce the inolvement of the other classes. This may require\r\n");
            sb.Append("\textensive redesign.\r\n");

            int count = 1;
            Tumor[] tumors = MetricUtilities.GetTumors();
            foreach (Tumor tumor in tumors)
            {
                sb.Append("*************Tumor Report ( " + count + " )*************\r\n");
                tumor.Report(sb);
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }
            writer.WriteLine(sb);
            writer.Close();

            StreamWriter writer2 = new StreamWriter(filename + ".nod.csv");
            StringBuilder nodes = new StringBuilder();
            StreamWriter writer3 = new StreamWriter(filename + ".edg.csv");
            StringBuilder edges = new StringBuilder();

            if (tumors.Length > 0)
            {
                nodes.Append(tumors[0].NodeHeader + System.Environment.NewLine);
                edges.Append(tumors[0].EdgeHeader + System.Environment.NewLine);
                foreach (Tumor tumor in tumors)
                {
                    tumor.Gephi(nodes, edges, MetricUtilities.NextModule());
                }
            }

            writer2.WriteLine(nodes);
            writer2.Close();
            writer3.WriteLine(edges);
            writer3.Close();

            return count-1;
        }
    }
}
