using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class StateMachine
    {
        public static readonly AbbreviatedGraph Disrupted = AbbreviatedGraph.Create(NodeFactory.CreateNode(NodeType.NULL, false));

        private StatePatterns type;
        public StatePatterns Type 
        { 
            get
            {
                if (type == StatePatterns.NotSet)
                {
                    throw new InvalidOperationException("Type not specified for StateMachine");
                }
                return type;
            }
        }
        
        public StateMachine()
        {
        }


        public void WriteStateMachine(StringBuilder sb)
        {
            switch (type)
            {
                case StatePatterns.SuperStateMember:
                    OutputSuperState(sb);
                    break;
                case StatePatterns.UnreadStateField:
                    sb.Append("Field represents state, is written to but never read\r\n");
                    DefaultWrite(sb);
                    break;
                case StatePatterns.ConstantVariable:
                    sb.Append("Field is a constant\r\n");
                    DefaultWrite(sb);
                    break;
                case StatePatterns.SettingVariable:
                    sb.Append("Field is written to only upon construction; it is a setting\r\n");
                    DefaultWrite(sb);
                    break;
                case StatePatterns.StateVariable:
                    sb.Append("Normal state machine\r\n");
                    DefaultWrite(sb);
                    break;
                default:
                    throw new InvalidCastException("StatePattern " + type + " is unknown in StateMachine");
            }
        }

        private void DefaultWrite(StringBuilder sb)
        {
            if (stateDefault != null)
            {
                if (stateDefault.Represented.Equals(Members.Literal) && stateDefault.Represented.Equals(Members.Value))
                {
                    sb.Append(stateDefault.Represented.Code + "\t\tDEFAULT\r\n");
                }
                else
                {
                    sb.Append("DEFAULT\t" + stateDefault + "\t" + stateDefault.Represented.FileName + "\r\n");
                }
            }

            foreach (AbbreviatedGraph v in unusedWrites)
            {
                sb.Append("UNUSED\t" + v + "\t"+v.Represented.FileName+"\r\n");
            }

            RecursiveWriteTree(sb, primaryField, 0);
            sb.Append("PRIMARY: " + primaryField + "\t" + primaryField.Represented.FileName + "\r\n");

            RecursiveReadTree(sb, primaryField, 0);
        }

        #region Super State Methods
        private List<AbbreviatedGraph> superStates = new List<AbbreviatedGraph>();
        private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> superLogic = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();

        internal void AddSuperState(AbbreviatedGraph n)
        {
            type = StatePatterns.SuperStateMember;

            //this node is one of the related super states.
            //add it to the list
            superStates.Add(n);

            //find its users
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = n.GetEdges(Relationship.CandidateRead);
            List<AbbreviatedGraph> locations = new List<AbbreviatedGraph>();
            foreach (AbbreviatedGraph k in reads.Keys)
            {
                foreach (AbbreviatedGraph loc in reads[k])
                {
                    AbbreviatedGraph ab = MetricUtilities.FindMethod(loc);
                    if (ab == null)
                    {
                        continue;//we only want logic related to the super state, not fields
                    }

                    if (!locations.Contains(ab))
                    {
                        locations.Add(ab);
                    }
                }
            }

            if (superLogic.ContainsKey(n))
            {
                foreach (AbbreviatedGraph g in locations)
                {
                    if (!superLogic[n].Contains(g))
                    {
                        superLogic[n].Add(g);
                    }
                }
            }
            else
            {
                superLogic.Add(n, locations);
            }
        }

        private void OutputSuperState(StringBuilder sb)
        {
            sb.Append("Related methods indicating state\r\n");
            foreach (AbbreviatedGraph m in superLogic.Keys)
            {
                sb.Append("\t" + m + "\t" + m.Represented.FileName + "\r\n");

                if (superLogic[m].Count > 0)
                {
                    sb.Append("\t\tAffecting logic in\r\n");
                }

                foreach (AbbreviatedGraph l in superLogic[m])
                {
                    sb.Append("\t\t" + l + "\t" + l.Represented.FileName + "\r\n");
                }
            }
        }
        #endregion

        private AbbreviatedGraph primaryField = null;
        public AbbreviatedGraph PrimaryField
        {
            get
            {
                return primaryField;
            }
        }
        
        internal void AddPrimaryField(AbbreviatedGraph n)
        {
            primaryField = n;
            writeTree.Add(0, new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>());
            writeTree[0].Add(n, new List<AbbreviatedGraph>());
            readTree.Add(0, new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>());
            readTree[0].Add(n, new List<AbbreviatedGraph>());

            type = (StatePatterns) MetricUtilities.GephiFromGraph(n).GetProperty(NodeProperties.StateMember);
        }

        private AbbreviatedGraph stateDefault = null;
        internal void AddDefaultWrite(AbbreviatedGraph defaultValue)
        {
            stateDefault = defaultValue;
        }

        private List<AbbreviatedGraph> unusedWrites = new List<AbbreviatedGraph>();

        internal void AddUnusedWrite(AbbreviatedGraph v)
        {
            unusedWrites.Add(v);
        }
        
        private Dictionary<int, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> writeTree = new Dictionary<int, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();

        internal void AddWriteChain(AbbreviatedGraph node, AbbreviatedGraph parent, int level)
        {
            //write this into the parent node
            if (!writeTree.ContainsKey(level-1))
            {
                //this is an error. The parent level should already exist
                throw new InvalidOperationException("No level " + (level - 1) + " for field " + primaryField);
            }

            if (!writeTree[level-1].ContainsKey(parent))
            {
                //this is an error. The parent should already exist
                throw new InvalidOperationException("Parent " + parent + " not found at level " + (level - 1) + " for field " + primaryField);
            }

            if (!writeTree[level-1][parent].Contains(node))
            {
                writeTree[level-1][parent].Add(node);
            }

            //write this into its own record
            if (!writeTree.ContainsKey(level))
            {
                writeTree.Add(level, new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>());
            }

            if (!writeTree[level].ContainsKey(node))
            {
                writeTree[level].Add(node, new List<AbbreviatedGraph>());
            }
        }

        private void RecursiveWriteTree(StringBuilder sb, AbbreviatedGraph n, int level)
        {
            foreach (AbbreviatedGraph n2 in writeTree[level][n])
            {
                RecursiveWriteTree(sb, n2, level + 1);
            }

            //supress primary field
            if (level != 0)
            {
                int start = 0;
                if (level == 1 && WriteValues.ContainsKey(n))
                {
                    sb.Append(WriteValues[n].Represented.Code + "\t");
                    start++;
                }
                else if (level == 1)
                {
                    sb.Append("UNKNOWN\t");
                    start++;
                }

                for (int i = start; i <= level; i++)
                {
                    sb.Append("\t");
                }

                sb.Append(n + "\t" + n.Represented.FileName + "\r\n");
            }
        }


        private void RecursiveReadTree(StringBuilder sb, AbbreviatedGraph n, int level)
        {
            //supress primary field
            if (level != 0)
            {
                for (int i = 0; i <= level; i++)
                {
                    sb.Append("\t");
                }
                sb.Append(n + "\t" + n.Represented.FileName + "\r\n");
            }

            foreach (AbbreviatedGraph n2 in readTree[level][n])
            {
                RecursiveReadTree(sb, n2, level + 1);
            }

            if (terminals.ContainsKey(n))
            {
                string lead = "";
                for (int i = 0; i <= level + 1; i++)
                {
                    lead += ("\t");
                }

                foreach (AbbreviatedGraph n2 in terminals[n])
                {
                    if (n2 == Disrupted)
                    {
                        sb.Append(lead + "<<+>> Disrupted\r\n");
                    }
                    else
                    {
                        sb.Append(lead + "<<+>>" + n2 + "\t" + n2.Represented.FileName + "\r\n");
                    }
                }
            }
        }

        private Dictionary<int, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> readTree = new Dictionary<int, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();

        internal bool AddReadChain(AbbreviatedGraph node, AbbreviatedGraph parent, int level)
        {
            foreach (int l in readTree.Keys)
            {
                if (readTree[l].ContainsKey(parent) && readTree[l][parent].Contains(node))
                {
                    return false;
                }
            }

            //write this into the parent node
            if (!readTree.ContainsKey(level - 1))
            {
                //this is an error. The parent level should already exist
                throw new InvalidOperationException("No level " + (level - 1) + " for field " + primaryField);
            }

            if (!readTree[level - 1].ContainsKey(parent))
            {
                //this is an error. The parent should already exist
                throw new InvalidOperationException("Parent " + parent + " not found at level " + (level - 1) + " for field " + primaryField);
            }

            if (!readTree[level - 1][parent].Contains(node))
            {
                readTree[level - 1][parent].Add(node);
            }

            //write this into its own record
            if (!readTree.ContainsKey(level))
            {
                readTree.Add(level, new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>());
            }

            if (!readTree[level].ContainsKey(node))
            {
                readTree[level].Add(node, new List<AbbreviatedGraph>());
            }

            return true;
        }

        private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> terminals = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();

        internal bool AddTerminalNode(AbbreviatedGraph method, AbbreviatedGraph parent)
        {
            if (!terminals.ContainsKey(parent))
            {
                terminals.Add(parent, new List<AbbreviatedGraph>());
            }

            if (terminals[parent].Contains(method))
            {
                return false;
            }

            terminals[parent].Add(method);
            return true;
        }

        private Dictionary<AbbreviatedGraph, AbbreviatedGraph> WriteValues = new Dictionary<AbbreviatedGraph, AbbreviatedGraph>();

        internal void AddWriteValue(AbbreviatedGraph tier1Node, AbbreviatedGraph value)
        {
            if (WriteValues.ContainsKey(tier1Node))
            {
                if (value != WriteValues[tier1Node])
                {
                    //there is a conflict
                    WriteValues[tier1Node] = AbbreviatedGraph.Create(NodeFactory.CreateNode(Members.Literal, "MANY"));
                }
            }
            else
            {
                WriteValues.Add(tier1Node, value);
            }
        }

        internal void WritePrimary(StringBuilder sb)
        {
            sb.Append("\tfor "+ primaryField + " @ " + primaryField.Represented.FileName + "\r\n");
        }

        internal void WriteDefaultValue(StringBuilder sb)
        {
            if (stateDefault != null)
            {
                if (stateDefault.Represented.Equals(Members.Literal) || stateDefault.Represented.Equals(Members.Value))
                {
                    sb.Append("Default value: "+stateDefault.Represented.Code + "\r\n");
                }
                else
                {
                    sb.Append("Default value set from " + stateDefault + " @ " + stateDefault.Represented.FileName + "\r\n");
                }
            }
        }

        internal void WriteAllValues(StringBuilder sb)
        {
            List<AbbreviatedGraph> set = new List<AbbreviatedGraph>();
            RecursiveGetAllValues(set, primaryField, 0);

            if (set.Count > 0)
            {
                sb.Append("All values written to this variable include:\r\n");
                foreach (AbbreviatedGraph s in set)
                {
                    sb.Append("\t" + s + "\r\n");
                }
            }
        }

        internal void RecursiveGetAllValues(List<AbbreviatedGraph> set, AbbreviatedGraph n, int level)
        {
            foreach (AbbreviatedGraph n2 in writeTree[level][n])
            {
                RecursiveGetAllValues(set, n2, level + 1);
            }

            //supress primary field
            if (level != 0)
            {
                if (level == 1 && WriteValues.ContainsKey(n))
                {
                    if (!set.Contains(WriteValues[n]))
                    {
                        set.Add(WriteValues[n]);
                    }
                }
            }
        }

        internal void WriteUsedSetters(StringBuilder sb)
        {
            throw new NotImplementedException();
        }

        internal void WriteUnusedSetters(StringBuilder sb)
        {
            if (unusedWrites.Count > 0)
            {
                sb.Append("\r\nThe following methods are used to set the variable, but are uncalled themselves:\r\n");
                foreach (AbbreviatedGraph v in unusedWrites)
                {
                    sb.Append("\t" + v + " @ " + v.Represented.FileName + "\r\n");
                }
            }
        }

        internal void WriteBothTrees(StringBuilder sb)
        {
            sb.Append("\r\nWrite and read tree detail\r\n");

            RecursiveWriteTree(sb, primaryField, 0);
            sb.Append("<<Variable>>\r\n");
            RecursiveReadTree(sb, primaryField, 0);
        }

        internal int CountTerminalNodes()
        {
            int a = 0;
            foreach (AbbreviatedGraph ag in terminals.Keys)
            {
                foreach (AbbreviatedGraph l in terminals[ag])
                {
                    if (l != Disrupted)
                    {
                        a++;
                    }
                }
            }
            return a;
        }

        internal void WriteTerminalNodeDetail(StringBuilder sb)
        {
            sb.Append("The following logic is affected by this variable\r\n");
            foreach (AbbreviatedGraph ag in terminals.Keys)
            {
                foreach (AbbreviatedGraph l in terminals[ag])
                {
                    if (l != Disrupted)
                    {
                        //we only want real terminal ends
                        sb.Append("\t" + l + "\t" + l.Represented.FileName + "\r\n");
                    }
                }
            }
        }

        internal AbbreviatedGraph[] GetTerminalNodes()
        {
            List<AbbreviatedGraph> answer = new List<AbbreviatedGraph>();
            foreach (AbbreviatedGraph ag in terminals.Keys)
            {
                foreach (AbbreviatedGraph l in terminals[ag])
                {
                    if (l != Disrupted)
                    {
                        //we only want real terminal ends
                        answer.Add(l);
                    }
                }
            }

            return answer.ToArray();
        }

        internal void AddSources(Dictionary<AbbreviatedGraph, int> sources)
        {
            List<AbbreviatedGraph> set = new List<AbbreviatedGraph>();
            RecursiveFindSources(set, primaryField, 0);

            if (set.Count > 0)
            {
                foreach (AbbreviatedGraph s in set)
                {
                    //find class and add to class count.
                    AbbreviatedGraph t = MetricUtilities.FindType(s);

                    if (t.IsSimulated)
                    {
                        continue;
                    }

                    if (!sources.ContainsKey(t))
                    {
                        sources.Add(t, 0);
                    }
                    sources[t]++;
                }
            }
        }

        internal void RecursiveFindSources(List<AbbreviatedGraph> set, AbbreviatedGraph n, int level)
        {
            foreach (AbbreviatedGraph n2 in writeTree[level][n])
            {
                RecursiveFindSources(set, n2, level + 1);
            }

            //supress primary field
            if (level == 1 && WriteValues.ContainsKey(n))
            {
                AbbreviatedGraph src = WriteValues[n];
                //we only want to keep non-literal members.
                if (!(src.Represented.Node.Equals(Members.Literal) || src.Represented.Node.Equals(Members.Value)))
                {
                    set.Add(src);
                }
                else
                {
                    set.Add(n);
                }
            }
        }

        internal void WriteSuperState(StringBuilder sb)
        {
            foreach (AbbreviatedGraph m in superLogic.Keys)
            {
                sb.Append(m + " @ " + m.Represented.FileName + "\r\n");

                if (superLogic[m].Count > 0)
                {
                    sb.Append("\tAffecting logic in\r\n");
                }

                foreach (AbbreviatedGraph l in superLogic[m])
                {
                    sb.Append("\t" + l + " @ " + l.Represented.FileName + "\r\n");
                }
            }
        }
    }
}
