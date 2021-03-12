using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    public class Tumor
    {
        private static Dictionary<AbbreviatedGraph, long> classIDs = new Dictionary<AbbreviatedGraph, long>();
        private static Dictionary<long, AbbreviatedGraph> reverseClassIDs = new Dictionary<long, AbbreviatedGraph>();
        private static long firstID = 0;
        private static long maxID = 100;

        private static long GetClassID(AbbreviatedGraph type)
        {
            if (!classIDs.ContainsKey(type))
            {
                Random r = new Random();

                long l = firstID+((long)(r.NextDouble()*(maxID-firstID)));

                while (reverseClassIDs.ContainsKey(l))
                {
                    l = firstID + ((long)(r.NextDouble() * (maxID - firstID)));
                }

                classIDs.Add(type, l);
                reverseClassIDs.Add(l, type);

                while (reverseClassIDs.ContainsKey(firstID))
                {
                    firstID++;
                    maxID++;
                }
            }

            return classIDs[type];
        }

        private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> dysplasia = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
        private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> nativeTumor = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
        private List<AbbreviatedGraph> all = new List<AbbreviatedGraph>();
        private List<GephiEdge> edges = new List<GephiEdge>();
        private bool valid = true;

        public bool IsValid()
        {
            return valid;
        }

        public Tumor(GephiNode[] members, long m)
        {
            Dictionary<AbbreviatedGraph, int> edgeCount = new Dictionary<AbbreviatedGraph, int>();
            foreach (GephiNode member in members)
            {
                AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(member);
                AbbreviatedGraph other = MetricUtilities.GetControlledVariable(ag);
                AbbreviatedGraph [] other2 = MetricUtilities.GetVariableControlMethods(ag);

                List<AbbreviatedGraph> getterPattern = new List<AbbreviatedGraph>();

                if (other2 != null)
                {
                    getterPattern.AddRange(other2);
                }

                if (other != null)
                {
                    getterPattern.Add(other);
                }

                AbbreviatedGraph type = MetricUtilities.FindType(ag);
                long typeID = GetClassID(type);
                member.SetProperty(NodeProperties.ClassID, typeID);

                if (MetricUtilities.RemoveFromDysplasia(ag, m))
                {
                    //also remove member property
                    member.SetProperty(NodeProperties.NodePattern, NodePatterns.None);
                    if (!dysplasia.ContainsKey(type))
                    {
                        dysplasia.Add(type, new List<AbbreviatedGraph>());
                    }
                    dysplasia[type].Add(ag);

                    foreach(AbbreviatedGraph o in getterPattern)
                    {
                        dysplasia[type].Add(o);
                        GephiNode gn = MetricUtilities.GephiFromGraph(o);
                        gn.SetProperty(NodeProperties.ClassID, typeID);
                    }
                }
                else
                {
                    if (!nativeTumor.ContainsKey(type))
                    {
                        nativeTumor.Add(type, new List<AbbreviatedGraph>());
                    }
                    nativeTumor[type].Add(ag);
                    member.SetProperty(NodeProperties.Rank, 100);

                    foreach (AbbreviatedGraph o in getterPattern)
                    {
                        nativeTumor[type].Add(o);
                        GephiNode gn = MetricUtilities.GephiFromGraph(o);
                        gn.SetProperty(NodeProperties.ClassID, typeID);
                        gn.SetProperty(NodeProperties.Rank, 100);
                    }
                }

                all.Add(ag);
                edgeCount.Add(ag, 0);

                foreach (AbbreviatedGraph o in getterPattern)
                {
                    all.Add(o);
                    edgeCount.Add(o, 0);
                }
            }

            foreach (AbbreviatedGraph a1 in all.ToArray())
            {
                GephiNode g = MetricUtilities.GephiFromGraph(a1);

                foreach (AbbreviatedGraph a2 in all.ToArray())
                {
                    GephiNode g2 = MetricUtilities.GephiFromGraph(a2);

                    GephiEdge[] links = MetricUtilities.GetEdges(g, g2);

                    if (links.Length > 0)
                    {
                        edges.Add(links[0]);
                        edgeCount[a1]++;
                        edgeCount[a2]++;
                    }
                }
            }

            foreach (AbbreviatedGraph a in edgeCount.Keys)
            {
                if (edgeCount[a] == 0)
                {
                    valid = false;
                    break;
                }
            }
        }

        public string NodeHeader
        {
            get
            {
                AbbreviatedGraph answer = null;
                if (dysplasia.Count > 0)
                {
                    answer = dysplasia[dysplasia.Keys.ToArray()[0]][0];
                }
                else
                {
                    answer = nativeTumor[nativeTumor.Keys.ToArray()[0]][0];
                }

                GephiNode g = MetricUtilities.GephiFromGraph(answer);
                return g.Header;
            }
        }

        public string EdgeHeader
        {
            get
            {
                AbbreviatedGraph answer = null;
                if (dysplasia.Count > 0)
                {
                    answer = dysplasia[dysplasia.Keys.ToArray()[0]][0];
                }
                else
                {
                    answer = nativeTumor[nativeTumor.Keys.ToArray()[0]][0];
                }

                GephiNode g = MetricUtilities.GephiFromGraph(answer);
                GephiNode g2 = MetricUtilities.GetLinksInvolving(g)[0];
                GephiEdge [] edges = MetricUtilities.GetEdges(g, g2);

                if (edges.Length == 0)
                {
                    edges = MetricUtilities.GetEdges(g2, g);
                }

                return edges[0].Header;
            }
        }

        public void Report(StringBuilder sb)
        {
            foreach (AbbreviatedGraph type in nativeTumor.Keys)
            {
                sb.Append("\tMember Class: " + type + " @ " + type.Represented.FileName + System.Environment.NewLine);
                foreach (AbbreviatedGraph m in nativeTumor[type])
                {
                    sb.Append("\t\t" + m + System.Environment.NewLine);
                }
                sb.Append(System.Environment.NewLine);
            }

            foreach (AbbreviatedGraph type in dysplasia.Keys)
            {
                sb.Append("\tIntrusion into Class: " + type + " @ " + type.Represented.FileName + System.Environment.NewLine);
                foreach (AbbreviatedGraph m in dysplasia[type])
                {
                    sb.Append("\t\t" + m + System.Environment.NewLine);
                }
                sb.Append(System.Environment.NewLine);
            }
        }

        internal void Gephi(StringBuilder nodesOutput, StringBuilder edgeOutput, long tumorNumber)
        {
            foreach (AbbreviatedGraph m in all)
            {
                GephiNode g = MetricUtilities.GephiFromGraph(m);
                g.SetProperty(NodeProperties.Module, tumorNumber);
                AbbreviatedGraph type = MetricUtilities.FindType(m);
                if (!nativeTumor.ContainsKey(type))
                {
                    if (dysplasia.ContainsKey(type))
                    {
                        g.SetProperty(NodeProperties.Rank, 100 * dysplasia[type].Count / all.Count);
                    }
                    else
                    {
                        //why is this even happening?
                        g.SetProperty(NodeProperties.Rank, 999);
                    }
                }

                nodesOutput.Append(g.ToGephiRecord() + System.Environment.NewLine);
            }

            foreach (GephiEdge ge in edges)
            {
                edgeOutput.Append(ge.ToString() + System.Environment.NewLine);
            }
        }
    }
}
