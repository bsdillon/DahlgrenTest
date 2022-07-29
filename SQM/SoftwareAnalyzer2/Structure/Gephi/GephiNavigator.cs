using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Gephi
{
    /// <summary>
    /// This class was constructed to help with reading the graph, but that functionality
    /// was never developed, using instead a more direct metric capability.
    /// </summary>
    public class GephiNavigator : IGraphNavigator
    {
        private static List<Members> LevelUps;
        private static List<Members> StructureElements;

        static GephiNavigator()
        {
            List<Members> temp = new List<Members>();
            temp.Add(Members.Root);
            temp.Add(Members.TypeDeclaration);
            temp.Add(Members.Field);
            temp.Add(Members.Method);
            temp.Add(Members.Constructor);
            temp.Add(Members.MethodScope);
            temp.Add(Members.Scope);
            temp.Add(Members.ElseScope);
            temp.Add(Members.TypeDeclaration);
            LevelUps = temp;

            temp = new List<Members>();
            temp.Add(Members.Root);
            temp.Add(Members.Package);
            temp.Add(Members.CLASS);
            temp.Add(Members.INTERFACE);
            temp.Add(Members.ENUM);
            temp.Add(Members.TypeDeclaration);
            temp.Add(Members.Field);
            temp.Add(Members.Method);
            temp.Add(Members.NAMESPACE);
            StructureElements = temp;
        }

        private List<GephiNode> nodesOut;
        private List<GephiEdge> edgesOut;
        public GephiNavigator(List<GephiNode> n, List<GephiEdge> e)
        {
            nodesOut = n;
            edgesOut = e;
        }

        private Dictionary<AbbreviatedGraph, GephiNode> nodes = new Dictionary<AbbreviatedGraph, GephiNode>();
        private long nodeIndex = 0;
        public void Navigate(AbbreviatedGraph current)
        {
            Console.WriteLine("did it get to GephiNavigator?");
            CreateNode(current, 0);
            RecursiveNavigation(current, 0);
        }

        public void RecursiveNavigation(AbbreviatedGraph current, int level)
        {
            //find the node definition
            GephiNode currNode = nodes[current];

            //never revisit node node
            if (!currNode.HasProperty(NodeProperties.Visited))
            {
                //get information about this node
                currNode.AddProperty(NodeProperties.Visited);
                int currLevel = (int)currNode.GetProperty(NodeProperties.ZDepth);
                if (currLevel > level)
                {
                    currLevel = level;
                    currNode.SetProperty(NodeProperties.ZDepth, level);
                }
                int nextLevel = LevelUps.Contains(current.Represented.Node.GetMembers()) ? currLevel + 1 : currLevel;

                //this is where we would ask all the aggregated behaviors if they want to mess with this object

                foreach (Relationship r in Enum.GetValues(typeof(Relationship)))
                {
                    Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> nextEdges = current.GetEdges(r);

                    foreach (AbbreviatedGraph next in nextEdges.Keys)
                    {
                        CreateNode(next, nextLevel);
                        edgesOut.Add(new GephiEdge(currNode, nodes[next], r));
                        RecursiveNavigation(next, nextLevel);
                    }
                }
            }
        }

        private void CreateNode(AbbreviatedGraph current, int level)
        {
            if (!nodes.ContainsKey(current))
            {
                //if node node is not known we have to create it
                NodeType gephiName = current.Represented.Node;

                //BSD - Not sure how this affected the original much less the current version.
                //List<AbbreviatedGraph> classes = current.GetEdges(Relationship.Classification);
                //if (classes.Count > 0)
                //{
                //    gephiName = classes[0].Represented.Node;
                //}

                GephiNode n = new GephiNode(nodeIndex++, gephiName, gephiName + ":" + current.Represented.Code);
                nodes.Add(current, n);
                nodesOut.Add(n);
                n.AddProperty(NodeProperties.ZDepth, level);
            }
        }
    }
}
