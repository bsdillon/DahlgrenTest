using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing
{
    public class AbbreviatedGraph
    {
        private static AbbreviatedGraph root;
        private static Dictionary<long, AbbreviatedGraph> nodes = new Dictionary<long, AbbreviatedGraph>();
        private static Dictionary<AbbreviatedGraph, long> indices = new Dictionary<AbbreviatedGraph, long>();
        private static Dictionary<string, List<AbbreviatedGraph>> statements = new Dictionary<string, List<AbbreviatedGraph>>();

        internal static bool OpenFile(string directory, string fileName)
        {
            bool worked = false;
            string path = directory + Path.DirectorySeparatorChar + fileName + ".gph";
            nodes.Clear();
            indices.Clear();

            if (File.Exists(path))
            {
                StreamReader sr = new StreamReader(directory + Path.DirectorySeparatorChar + fileName + ".gph");
                try
                {
                    List<object[]> edges = new List<object[]>();

                    string data = sr.ReadLine();
                    while (data != null)
                    {
                        string[] parts = data.Split("\t".ToCharArray(), StringSplitOptions.None);

                        if (parts[0].Equals("Node"))
                        {
                            bool simulated = parts[4].Equals("--") && parts[5].Equals("--");

                            AbbreviatedGraph g = new AbbreviatedGraph(NodeFactory.CreateNode(parts[2], parts[3], parts[4], parts[5]));
                            g.simulated = simulated;
                            long l = long.Parse(parts[1]);
                            nodes.Add(l, g);
                            indices.Add(g, l);
                        }
                        else
                        {
                            AbbreviatedGraph statement = null;
                            long statementID = long.Parse(parts[3]);
                            if (statementID != -1)
                            {
                                statement = nodes[statementID];
                                if (!statements.ContainsKey(statement.Represented.FileName))
                                {
                                    statements.Add(statement.Represented.FileName, new List<AbbreviatedGraph>());
                                }
                                statements[statement.Represented.FileName].Add(statement);
                            }

                            edges.Add(new object[] { nodes[long.Parse(parts[1])], nodes[long.Parse(parts[2])], statement, Enum.Parse(typeof(Relationship), parts[4]) });
                        }

                        data = sr.ReadLine();
                    }

                    foreach (object[] e in edges)
                    {
                        ((AbbreviatedGraph)e[0]).AddRelationship((AbbreviatedGraph)e[1], (AbbreviatedGraph)e[2], (Relationship)e[3]);
                    }

                    AbbreviatedGraph.root = nodes[0];

                    worked = true;
                }
                catch (Exception e)
                {
                    System.Windows.Forms.MessageBox.Show("Graph file format corrupted: " + e.Message + "\n\r" + e.StackTrace);
                    return false;
                }
                sr.Close();
            }
            return worked;
        }

        private Dictionary<Relationship, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> relationshipsTo = new Dictionary<Relationship, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
 
        private bool simulated = false;
        public bool IsSimulated
        {
            get
            {
                return simulated;
            }
        }

        private INode represented;

        public INode Represented
        {
            get
            {
                return represented;
            }
        }

        public static AbbreviatedGraph Create(INode n)
        {
            AbbreviatedGraph ag = new AbbreviatedGraph(n);
            ag.simulated = true;
            return ag;
        }
        
        private AbbreviatedGraph(INode n)
        {
            represented = n;
        }

        public override string ToString()
        {
            return "GraphNode[" + represented.ToString() + "]";
        }

        public Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> GetEdges(Relationship r)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> answer = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> mySet = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            lock (relationshipsTo)
            {
                if (!relationshipsTo.ContainsKey(r))
                {
                    return answer;
                }
                mySet = relationshipsTo[r];
            }

            lock (mySet)
            {
                foreach (AbbreviatedGraph g in relationshipsTo[r].Keys)
                {
                    answer.Add(g, new List<AbbreviatedGraph>());
                    foreach (AbbreviatedGraph s in relationshipsTo[r][g])
                    {
                        answer[g].Add(s);
                    }
                }
            }
            return answer;
        }

        private void AddRelationship(AbbreviatedGraph g, AbbreviatedGraph s, Relationship r)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> temp = null;
            lock (relationshipsTo)
            {
                if (!relationshipsTo.ContainsKey(r))
                {
                    relationshipsTo.Add(r, new Dictionary<AbbreviatedGraph,List<AbbreviatedGraph>>());
                }
                temp = relationshipsTo[r];
            }

            if (!temp.ContainsKey(g))
            {
                temp.Add(g, new List<AbbreviatedGraph>());
            }

            temp[g].Add(s);
        }

        internal static void Navigate(IGraphNavigator nav)
        {
            nav.Navigate(root);
        }

        public bool IsChildScopeOf(AbbreviatedGraph parentContext)
        {
            if (this == parentContext)
            {
                return true;
            }

            AbbreviatedGraph[] parents = GetEdges(Relationship.MemberOf).Keys.ToArray();
            if (parents.Length == 0)
            {
                return false;
            }
            else if (parents.Length > 1)
            {
                throw new InvalidDataException("Malformated graph; multiple member of relationships from " + this);
            }
            else
            {
                return parents[0].IsChildScopeOf(parentContext);
            }
        }

        public Dictionary<string, List<AbbreviatedGraph>> GetStatementsDict()
        {
            return statements;
        }
    }
}
