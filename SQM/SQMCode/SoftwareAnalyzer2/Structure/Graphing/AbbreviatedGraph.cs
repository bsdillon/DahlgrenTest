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
                        if (parts.Length == 0) { 
                            continue;
                        }

                        if (parts[0].Equals("Node"))
                        {
                            bool simulated = parts[4].Equals("--") && parts[5].Equals("--");

                            AbbreviatedGraph g = new AbbreviatedGraph(NodeFactory.CreateNode(parts[2], parts[3], parts[4], parts[5]));
                            
                            // use this for line number! g.Represented.GetLineStart
                            //if -1, don't add it in . if getlinestart and getlinestop dont match, don't add. if it's simulated, dont add it!
                            if(g.Represented.GetLineStart() == g.Represented.GetLineStop())
                            {
                                if (!simulated)
                                {
                                    //store this node in linenumdict for use in tracing errors
                                    WriteToLineDict(g, parts[4], g.Represented.GetLineStart(), true);
                                    //file:4  //line number:5
                                    

                                }
                            }
                            g.simulated = simulated;
                            long l = long.Parse(parts[1]);
                            nodes.Add(l, g);
                            indices.Add(g, l);
                        }
                        else
                        { 
                            AbbreviatedGraph statement = null;
                            
                            long source = long.Parse(parts[1]);
                            long destination = long.Parse(parts[2]);
                            long statementID = long.Parse(parts[3]);
                            object relationship = Enum.Parse(typeof(Relationship), parts[4]);
                            string weight = parts[5];


                            //statement = nodes[source];
                            if (statementID != -1)
                            {
                                if (nodes.ContainsKey(statementID))
                                {
                                    statement = nodes[statementID];
                                    if (!statements.ContainsKey(statement.Represented.FileName))
                                    {
                                        statements.Add(statement.Represented.FileName, new List<AbbreviatedGraph>());            
                                    }
                                    statements[statement.Represented.FileName].Add(statement);
                                }
                            }


                            if (parts.Length > 6)
                            {
                                int linenum = int.Parse(parts[6]);
                                string filenam = parts[7];
                                //something like x writes to y on line 123 of file.java
                                edges.Add(new object[] { nodes[source], nodes[destination], statement, relationship, weight, linenum, filenam });
                                //source:1 destination:2 scope:3 r:4 weight:5 lineNumber:6 fileName:7
                            }
                            else
                            {
                                //something like x is of type y where line number and file make no sense
                                edges.Add(new object[] { nodes[source], nodes[destination], statement, relationship, weight });
                                //source:1 destination:2 scope:3 r:4 weight:5
                            }
                        }
                       
                        data = sr.ReadLine();
                    }

                    foreach (object[] e in edges)
                    {
                        ((AbbreviatedGraph)e[0]).AddRelationship((AbbreviatedGraph)e[1], (AbbreviatedGraph)e[2], (Relationship)e[3]);
                        //store this edge in linenumdict for use in tracing errors
                        
                        if(e.Length>5)
                        {
                            //Console.WriteLine(e.Length + "e5:" + e[5] + " e6:" + e[6] + " e1:" + e[1]);
                            //the relationship has a relevant line and file location
                            WriteToLineDict((AbbreviatedGraph)e[0], e[6].ToString(), (int)e[5], true);
                        }
                    }

                    AbbreviatedGraph.root = nodes[0];

                    worked = true;
                }
                catch (Exception e)
                {
                    try {
                        System.Windows.Forms.MessageBox.Show("Graph file format corrupted: " + e.Message + "\n\r" + e.StackTrace);
                    }
                    catch (Exception e2) {}
                    
                    Console.WriteLine("Graph file format corrupted: " + e.Message + "\n\r" + e.StackTrace);
                    return false;
                }
                sr.Close();
            }
            return worked;
        }


        public bool traced = false;
        private static Dictionary<string, Dictionary<int, List<AbbreviatedGraph>>> lineNumDict = new Dictionary<string, Dictionary<int, List<AbbreviatedGraph>>>();

        public static List<AbbreviatedGraph> GetNodes(string file, int line)
        {
            if (lineNumDict.ContainsKey(file) && lineNumDict[file].ContainsKey(line))
            {
                return lineNumDict[file][line];
            }
            return new List<AbbreviatedGraph>();
        }

        private static void WriteToLineDict(AbbreviatedGraph gn, string fileName, int lineNumber, bool trimFileN)
        {
            //simulated graphnodes are not very meaningful for tracing errors
            if (fileName != null)
            {
                //e.g. /folder/another/importantFile.java -> /importantFile
                if (trimFileN && fileName.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fileName = fileName.Substring(fileName.LastIndexOf(Path.DirectorySeparatorChar));
                }

                Dictionary<int, List<AbbreviatedGraph>> gnLine = new Dictionary<int, List<AbbreviatedGraph>>();
                gnLine[lineNumber] = new List<AbbreviatedGraph>();
                gnLine[lineNumber].Add(gn);

                //add to linenumber dictionary
                //does the dict contain the filename?
                if (!lineNumDict.ContainsKey(fileName))
                {
                    lineNumDict.Add(fileName, gnLine);
                }
                else
                {
                    //if the dict contains the filename, does it also contain the line number?
                    if (lineNumDict[fileName].ContainsKey(lineNumber))
                    {
                        //if it doesn't contain the exact graphnode we are inserting, insert it
                        if (!lineNumDict[fileName][lineNumber].Contains(gn))
                        {
                            lineNumDict[fileName][lineNumber].Add(gn);
                        }
                    }
                    else
                    {
                        //if it doesn't contain the line number, safe to insert.
                        lineNumDict[fileName].Add(lineNumber, gnLine[lineNumber]);
                    }
                }
            }
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
        public AbbreviatedGraph findParentScope()
        {
            AbbreviatedGraph[] keys = this.GetEdges(Relationship.MemberOf).Keys.ToArray();
            if (keys.Length != 1)
            {
                throw new InvalidDataException("Should only have one parent scope of " + this + " instead of " + keys.Length);
            }
            return keys[0];
        }

        //Probably should be taken out and shot. Looks like a revision of a MetricUtilities function
        //this function converts a GraphNode to an abbrievatedgraph, and then uses the abbreviated graph to find any related GephiNodes
        //any GephiNode found has the user-inputted "error property" added to the property dictionary with the value of the user-inputted "error description"
        /*        internal static void GephiFromGraphNode(GraphNode gn, string errorD, string errorP)
                {
                    AbbreviatedGraph aG = AbbreviatedGraph.Create(NodeFactory.CreateNode(gn.Represented.Node.ToString(), gn.Represented.Code, gn.Represented.FileName, gn.Represented.GetFileLineRange()));

                    foreach (INode r in representedIndex.Keys)
                    {
                        //the comparison between INodes is not working as intended, but these comparisons ensure a match
                        if (r.Node == aG.Represented.Node &&
                           r.Code == aG.Represented.Code &&
                           r.FileName == aG.Represented.FileName &&
                           r.GetFileLineRange() == aG.Represented.GetFileLineRange() &&
                           GephiExists(representedIndex[r].Item2))
                        {
                            //add the user-inputted error property/description into the GephiNode that corresponds with the GraphNode.
                            GephiNode gephiN = GephiFromGraph(representedIndex[r].Item2);
                            //the .gph file has already been outputted by the time this logic is reached, but the property will be added to the programmatic GephiNode
                            gephiN.AddProperty(errorP, errorD);
                        }
                    }
                }


         */
    }
}
