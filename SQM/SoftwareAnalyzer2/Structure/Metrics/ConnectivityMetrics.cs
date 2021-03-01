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
    class ConnectivityMetrics
    {
        private static string formalAPIReport = "";
        private static int APICount = 0;

        internal static int APIReport(string filename)
        {
            StreamWriter writer = new StreamWriter(filename + ".txt");
            writer.WriteLine(formalAPIReport);
            writer.Close();

            return APICount-1;
        }

        internal static void TagLoneNodes()
        {
            foreach (GephiNode n in MetricUtilities.AllNodes)
            {
                if (MetricUtilities.IsImportantConnection(n))
                {
                    //look for non-interface connections
                    bool noneFound = true;
                    foreach (GephiNode other in MetricUtilities.GetLinksInvolving(n))
                    {
                        if (!MetricUtilities.IsExternal(other))
                        {
                            noneFound = false;
                            break;
                        }
                    }

                    if (noneFound)
                    {
                        n.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.LoneNodes);
                    }
                }
            }
        }

        /// <summary>
        /// This method identifies classes whose members are completely unused and 
        /// therefore likely to form part of an externally pointed interface.
        /// 
        /// Ex. An exception class which may be constructed by the client application
        /// 
        /// For these classes, a new class node is added to the code which will correlate 
        /// all of the disconnected members as part of the same class.
        /// </summary>
        /// <param name="nodeIndex"></param>
        internal static void FindAPIClasses()
        {
            StringBuilder apiReport = new StringBuilder();
            apiReport.Append("API classes are not connected to the rest of the program and may be externally oriented.\r\n");
            apiReport.Append("\tAlternatively the class may be completely unused.\r\n\r\n");
            apiReport.Append("Consider if the class is in a package with other API classes, automatically created for API\r\n");
            apiReport.Append("\tpurposes, or is intended for client applications to use when they connect with the system.\r\n");
            apiReport.Append("\tIf none of these descriptions apply, the class may be eligible for removal.\r\n");

            APICount = 1;

            StringBuilder sb2 = new StringBuilder();
            sb2.Append("Well-separated members - These classes have members which are part of a distinct module which is unconnected to the rest of the class.\r\n\r\n");
            
            bool foundAny = false;

            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                if (type.Represented.Node.Equals(Members.INTERFACE) || type.Represented.FileName.Equals("--"))
                {
                    //skip any interface or external nodes. We don't classify them as the program interface
                    continue;
                }

                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);
                if (members.Length == 0)
                {
                    //this class has no members
                    continue;
                }

                List<GephiNode> wellSeparatedMembers = new List<GephiNode>();
                int constructorUses = 0;
                foreach (AbbreviatedGraph member in members)
                {
                    if (member.Represented.Node.Equals(Members.Constructor))
                    {
                        constructorUses += member.GetEdges(Relationship.CandidateRead).Keys.Count;
                    }

                    GephiNode g = MetricUtilities.GephiFromGraph(member);
                    bool isSeparated = MetricUtilities.IsSeparated(g);

                    if (isSeparated)
                    {
                        wellSeparatedMembers.Add(g);
                    }
                }

                int quotient = 100 * wellSeparatedMembers.Count / members.Length;

                if (quotient == 100)
                {
                    //these classes are likely to be externally oriented or have useless members.
                    //so we will create a node to represent the class and superficially tie all 
                    //the offending members to it.
                    long newModule = MetricUtilities.NextModule();
                    GephiNode g = MetricUtilities.InitializeGephiNode(type, type, newModule, NodePatterns.APIClass, AccessPatterns.None, false);

                    CountAll.AddAPIClass(type);
                    foreach (GephiNode c in wellSeparatedMembers)
                    {
                        //create a new edge to the 
                        GephiEdge e = MetricUtilities.CreateSingleEdge(g, c, Relationship.Member, 5, false);
                        e.SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.None);

                        c.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.APIClass);
                        MetricUtilities.ChangeModule(c, newModule);
                    }

                    //for the report we only want to report classes which we know are are unused/API classes.

                    //avoid anonymous classes
                    if (NodeFactory.IsAnonymous(type.Represented.Code))
                    {
                        continue;
                    }

                    //we are going to avoid private types which implement outlibrary classes.
                    AbbreviatedGraph[] parentTypes = type.GetEdges(Relationship.ParentType).Keys.ToArray();

                    bool AllInterfaces = parentTypes.Length>0;//start by assuming any existing parent is outlibrary

                    foreach (AbbreviatedGraph parent in parentTypes)
                    {
                        AllInterfaces &= parent.Represented.FileName.Equals("--");
                    }

                    if (AllInterfaces  && constructorUses > 0)
                    {
                        //this is descended from an interface from out library and is constructed at least once
                        //it is likely that this is an implementaiton of the interface and never called directly
                        continue;
                    }

                    apiReport.Append("*************API Report ( " + APICount + " )*************\r\n");
                    APICount++;
                    apiReport.Append("\tfor " + type + " @ " + type.Represented.FileName + "\r\n\r\n");
                    foundAny = true;
                }
            }

            if (foundAny)
            {
                formalAPIReport = apiReport.ToString();
            }
        }
    }
}
