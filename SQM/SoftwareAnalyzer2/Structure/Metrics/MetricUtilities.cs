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
    enum AccessPatterns
    {
        None = 0,
        GetterSetter = 1,
        Decorator = 2,
        ControlledField = 3,
        OverlyControlledField = 4
    }

    enum StatePatterns
    {
        NotSet = -1,
        None = 0,
        StateSource = 1,
        SettingSource = 2,
        ConstantSource = 3,
        SomeState = 4,
        StateVariable = 10,
        SettingVariable = 12,
        StateLogic = 20,
        SuperStateMember = 21,
        SettingLogic = 22,
        ConstantVariable = 50,
        ConstantLogic = 51,
        UncalledStateMethod = 52,
        UnreadStateField = 53,
        CasualCancer = 54
    }

    enum NodePatterns
    {
        External = 0,
        Interface = 1,
        LoneNodes = 10,
        Separated = 11,
        APIClass = 12,
        Feature = 13,
        DysplasiaII = 30,
        DysplasiaI = 31,
        Tumor = 39,
        IncompetentLoneMember = 40,
        LargeSplinter = 41,
        None = 50
    }

    enum EdgePatterns
    {
        None = 0,
        GetterSetter = 1,
        StateRead = 20,
        StateWrite = 21,
    }

    class MetricUtilities
    {
        #region Pattern Handling
        internal static bool IsExternal(GephiNode g)
        {
            //External code is a pattern in [0,9]
            return (int)g.GetProperty(NodeProperties.NodePattern) < 10;
        }

        internal static bool IsSeparated(GephiNode g)
        {
            //Separated code is a pattern in [10,19]
            int pattern = (int)g.GetProperty(NodeProperties.NodePattern);
            return (10 <= pattern && pattern < 20);
        }

        internal static bool IsPotentialCancer(GephiNode g)
        {
            //Cancer code is a pattern in [30,49] to include all potential cancerous pieces.
            int p = (int)g.GetProperty(NodeProperties.NodePattern);
            return 30 <= p && p < 49;
        }

        /// <summary>
        /// Returns true if the linked node is connected to other nodes (e.g. not
        /// separated or part of an interface)
        /// </summary>
        /// <param name="f"></param>
        /// <returns></returns>
        internal static bool IsImportantConnection(GephiNode f)
        {
            return (int)f.GetProperty(NodeProperties.NodePattern) > 30;
        }

        #endregion

        internal static void Initialize()
        {
            theNodes = new List<GephiNode>();
            theModules = new Dictionary<long, List<GephiNode>>();
            AllLinks = new Dictionary<GephiNode, Dictionary<GephiNode, double>>();
            DirectedLinks = new Dictionary<GephiNode, Dictionary<GephiNode, double>>();
            edges = new List<GephiEdge>();
            edgeIndex = new Dictionary<GephiNode, Dictionary<GephiNode, List<GephiEdge>>>();
            nodeIndex = new Dictionary<AbbreviatedGraph, GephiNode>();
            reverseNodeIndex = new Dictionary<GephiNode, AbbreviatedGraph>();
            memberIndex = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, long>>();
            stateMembers = new List<AbbreviatedGraph>();
            AccessorLinks = new Dictionary<AbbreviatedGraph, AbbreviatedGraph>();
            FieldAccessorLinks = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
        }

        internal static Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> LimitContext(Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> setOfEdges, AbbreviatedGraph parentContext)
        {
            foreach (AbbreviatedGraph key in setOfEdges.Keys.ToArray())
            {
                AbbreviatedGraph[] statements = setOfEdges[key].ToArray();

                foreach (AbbreviatedGraph statement in statements)
                {
                    if (!statement.IsChildScopeOf(parentContext))
                    {
                        setOfEdges[key].Remove(statement);
                    }
                }

                if (setOfEdges[key].Count == 0)
                {
                    setOfEdges.Remove(key);
                }
            }

            return setOfEdges;
        }

        internal static void DisconnectIncomingEdges(GephiNode node, GephiNode variable)
        {
            List<GephiNode> removedInto = new List<GephiNode>();
            List<GephiNode> removedOutOf = new List<GephiNode>();

            foreach (GephiNode other in AllLinks[node].Keys)
            {
                //other may or may not have a direct edge into node.
                if (DirectedLinks.ContainsKey(other) && DirectedLinks[other].ContainsKey(node))
                {
                    //it does have such an edge. Remove it
                    DirectedLinks[other].Remove(node);

                    if (other != variable)
                    {
                        removedInto.Add(other);
                    }

                    if (DirectedLinks[other].Keys.Count == 0)
                    {
                        //and if that is all the edges from this node, remove it from the collection.
                        DirectedLinks.Remove(other);
                    }
                }
            }

            foreach (GephiNode g in GetDirectedLinksFrom(node))
            {
                DirectedLinks[node].Remove(g);

                if (g != variable)
                {
                    removedInto.Add(g);
                }
            }

            DirectedLinks.Remove(node);

            //create new edges to the variable
            foreach (GephiNode r in removedInto)
            {
                GephiEdge g = CreateSingleEdge(r, variable, Relationship.Accesses, 1, false);
                g.SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.GetterSetter);
            }

            ////create new edges to the variable
            foreach (GephiNode r in removedOutOf)
            {
                GephiEdge g = CreateSingleEdge(variable, r, Relationship.Accesses, 1, false);
                g.SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.GetterSetter);
            }
        }

        internal static bool DFS(AbbreviatedGraph current, AbbreviatedGraph target, AbbreviatedGraph methodContext, List<AbbreviatedGraph> path)
        {
            if (current == target)
            {
                path.Add(target);
                return true;
            }

            //get unique sources
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> sources = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();

            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> collection = current.GetEdges(Relationship.WrittenBy);

            foreach (AbbreviatedGraph key in collection.Keys)
            {
                if (!sources.ContainsKey(key))
                {
                    sources.Add(key, new List<AbbreviatedGraph>());
                }
                sources[key].AddRange(collection[key]);
            }

            collection = current.GetEdges(Relationship.Accesses);
            if (current.Represented.Node.IsInvocation)
            {
                //bsd part of DFS improvement algorithm. Accesses occur for fields and methods,
                //but while the filed read (e.g. obj.myField) is also an access, we are
                //interested in an method being accessed (e.g. obj.getMyField())
                foreach (AbbreviatedGraph key in collection.Keys)
                {
                    if (!sources.ContainsKey(key))
                    {
                        sources.Add(key, new List<AbbreviatedGraph>());
                    }
                    sources[key].AddRange(collection[key]);
                }
            }

            collection = current.GetEdges(Relationship.CandidateRead);
            if (current.Represented.Node.IsField)
            {
                foreach (AbbreviatedGraph key in collection.Keys)
                {
                    if (!sources.ContainsKey(key))
                    {
                        sources.Add(key, new List<AbbreviatedGraph>());
                    }
                    sources[key].AddRange(collection[key]);
                }
            }

            foreach (AbbreviatedGraph param in current.GetEdges(Relationship.FormalParameter).Keys)
            {
                if (path.Contains(param))
                {
                    continue;
                }

                collection = param.GetEdges(Relationship.WrittenBy);
                foreach (AbbreviatedGraph key in collection.Keys)
                {
                    if (!sources.ContainsKey(key))
                    {
                        sources.Add(key, new List<AbbreviatedGraph>());
                    }
                    sources[key].AddRange(collection[key]);
                }
            }

            foreach (AbbreviatedGraph p in path)
            {
                sources.Remove(p);
            }

            sources.Remove(methodContext);

            if (sources.ContainsKey(target))
            {
                path.Add(target);
                return true;
            }

            foreach (AbbreviatedGraph source in sources.Keys)
            {
                if (source.Represented.Node.Equals(Members.Literal))
                {
                    //no linking to literals
                    continue;
                }

                if (source.Represented.Code.Equals(NodeFactory.SelfReference))
                {
                    //skip ~~this~~ variables
                    continue;
                }

                if (source.Represented.Node.IsClassification)
                {
                    //skip CLASS and INTERFACE types
                    continue;
                }

                //assume no local link
                bool localLink = false;

                foreach (AbbreviatedGraph statement in sources[source])
                {
                    //if any statement was in this context we follow the source
                    AbbreviatedGraph currentScope = statement;
                    while (!currentScope.Represented.Node.IsMethodDefinition)
                    {
                        AbbreviatedGraph[] parents = currentScope.GetEdges(Relationship.MemberOf).Keys.ToArray();
                        if (parents.Length == 0)
                        {
                            currentScope = statement;
                            break;
                        }
                        else if (parents.Length > 1)
                        {
                            throw new InvalidDataException("Malformated graph; multiple member of relationships from " + currentScope);
                        }
                        currentScope = parents[0];
                    }

                    if (currentScope == methodContext)
                    {
                        localLink = true;
                        break;
                    }
                }

                if (localLink)
                {
                    path.Add(source);//add to path assuming that this connection works
                    if (DFS(source, target, methodContext, path))
                    {
                        return true;
                    }
                    path.Remove(source);//didn't work, remove from path
                }
            }

            return false;
        }

        #region AbbreviatedGraph Handling
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, long>> memberIndex;

        internal static void AddMember(AbbreviatedGraph parentType, AbbreviatedGraph m)
        {
            if (!memberIndex.ContainsKey(parentType))
            {
                memberIndex.Add(parentType, new Dictionary<AbbreviatedGraph, long>());
            }

            memberIndex[parentType].Add(m, lastNodeIndex++);
        }

        internal static AbbreviatedGraph[] GetMembersOf(string file, string typeName)
        {
            foreach (AbbreviatedGraph ag in memberIndex.Keys)
            {
                if (ag.Represented.FileName.Equals(file) && ag.Represented.Code.Equals(typeName))
                {
                    return GetMembersOf(ag);
                }
            }
            return new AbbreviatedGraph[] { };
        }

        internal static AbbreviatedGraph[] GetMembersOf(AbbreviatedGraph type)
        {
            if (memberIndex.ContainsKey(type))
            {
                return memberIndex[type].Keys.ToArray();
            }
            return new AbbreviatedGraph[]{};
        }

        internal static AbbreviatedGraph[] AllMembers
        {
            get
            {
                return memberIndex.Keys.ToArray();
            }
        }

        internal static long GetMemberID(AbbreviatedGraph type, AbbreviatedGraph member)
        {
            if(!memberIndex.ContainsKey(type) || !memberIndex[type].ContainsKey(member))
            {
                throw new InvalidOperationException("there is not member "+type+"."+member);
            }

            return memberIndex[type][member];
        }
        #endregion

        #region Edge Handling
        private static List<GephiEdge> edges;
        private static Dictionary<GephiNode, Dictionary<GephiNode, double>> DirectedLinks;
        private static Dictionary<GephiNode, Dictionary<GephiNode, double>> AllLinks;
        private static Dictionary<GephiNode, Dictionary<GephiNode, List<GephiEdge>>> edgeIndex;

        internal static GephiEdge[] GetEdges(GephiNode from, GephiNode to)
        {
            if (edgeIndex.ContainsKey(from) && edgeIndex[from].ContainsKey(to))
            {
                return edgeIndex[from][to].ToArray();
            }
            return new GephiEdge[] { };
        }

        internal static GephiEdge[] GetEdges(GephiNode to)
        {
            List<GephiEdge> answer = new List<GephiEdge>();
            foreach (GephiNode from in edgeIndex.Keys)
            {
                Dictionary<GephiNode, List<GephiEdge>> links = edgeIndex[from];
                if (links.ContainsKey(to))
                {
                    answer.AddRange(links[to]);
                }
            }

            return answer.ToArray();
        }

        internal static bool IsThereADirectedLink(GephiNode from, GephiNode to)
        {
            return DirectedLinks.ContainsKey(from) && DirectedLinks[from].ContainsKey(to);
        }

        internal static bool IsThereALinkBetween(GephiNode party1, GephiNode party2)
        {
            return AllLinks.ContainsKey(party1) && AllLinks[party1].ContainsKey(party2);
        }

        internal static double GetDirectedLink(GephiNode from, GephiNode to)
        {
            if (DirectedLinks.ContainsKey(from) && DirectedLinks[from].ContainsKey(to))
            {
                return DirectedLinks[from][to];
            }
            else
            {
                return 0.0;
            }
        }

        internal static double GetLinksBetween(GephiNode party1, GephiNode party2)
        {
            if (AllLinks.ContainsKey(party1) && AllLinks[party1].ContainsKey(party2))
            {
                return AllLinks[party1][party2];
            }
            else
            {
                return 0.0;
            }
        }

        internal static GephiNode[] GetDirectedLinksFrom(GephiNode n)
        {
            if (DirectedLinks.ContainsKey(n))
            {
                return DirectedLinks[n].Keys.ToArray();
            }

            return new GephiNode[] { };
        }

        internal static GephiNode[] GetLinksInvolving(GephiNode n)
        {
            if(AllLinks.ContainsKey(n))
            {
                return AllLinks[n].Keys.ToArray();
            }

            return new GephiNode[]{};
        }

        internal static GephiEdge CreateSingleEdge(GephiNode src, GephiNode snk, Relationship rel, double w, bool inQSet)
        {
            bool related = familialRelation(src, snk);
            GephiEdge edge = new GephiEdge(src, snk, rel);

            edge.SetProperty(NodeProperties.Weight, w);
            edge.SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.None);
            edges.Add(edge);

            if (!edgeIndex.ContainsKey(src))
            {
                edgeIndex.Add(src, new Dictionary<GephiNode, List<GephiEdge>>());
            }

            if (!edgeIndex[src].ContainsKey(snk))
            {
                edgeIndex[src].Add(snk, new List<GephiEdge>());
            }

            edgeIndex[src][snk].Add(edge);

            //unweighted edges are not in the Q algorithm
            if (inQSet && !related)//related members should not be penalized by Q Algorithm
            {
                //Store Q algorithm values for the source nodes
                //referring to connection to sink node
                if (!DirectedLinks.ContainsKey(src))
                {
                    DirectedLinks.Add(src, new Dictionary<GephiNode, double>());
                }

                if (!DirectedLinks[src].ContainsKey(snk))
                {
                    DirectedLinks[src].Add(snk, 0);
                }

                DirectedLinks[src][snk] += w;
            }

            if (!AllLinks.ContainsKey(src))
            {
                AllLinks.Add(src, new Dictionary<GephiNode, double>());
            }

            if (!AllLinks.ContainsKey(snk))
            {
                AllLinks.Add(snk, new Dictionary<GephiNode, double>());
            }

            if (!AllLinks[src].ContainsKey(snk))
            {
                AllLinks[src].Add(snk, 0);
            }

            if (!AllLinks[snk].ContainsKey(src))
            {
                AllLinks[snk].Add(src, 0);
            }


            AllLinks[src][snk] += w;
            AllLinks[snk][src] += w;

            return edge;
        }

        internal static void WriteEdges(string fileName)
        {
            StreamWriter edgeWriter = new StreamWriter(fileName);
            edgeWriter.WriteLine(edges[0].Header);
            foreach (GephiEdge e in edges)
            {
                edgeWriter.WriteLine(e.ToString());
            }
            edgeWriter.Close();
        }
        #endregion

        #region Module Handling
        private static Dictionary<long, List<GephiNode>> theModules;
        private static long lastModule = 0;

        internal static bool ModuleExists(long moduleID)
        {
            return theModules.ContainsKey(moduleID);
        }

        internal static int SizeOfModule(long moduleID)
        {
            if (theModules.ContainsKey(moduleID))
            {
                return theModules[moduleID].Count;
            }
            throw new InvalidOperationException("Unknown module id: " + moduleID);
        }

        internal static long[] ModuleIds
        {
            get
            {
                return theModules.Keys.ToArray();
            }
        }

        internal static long NextModule()
        {
            long answer = lastModule + 1;

            AddModule(answer);
            if (answer != lastModule)
            {
                throw new InvalidOperationException("Error in creating new module");
            }

            return answer;
        }

        private static void AddModule(long moduleID)
        {
            if (lastModule < moduleID)
            {
                lastModule = moduleID;
            }

            theModules.Add(moduleID, new List<GephiNode>());
        }

        internal static GephiNode[] GetModule(long moduleID)
        {
            if (theModules.ContainsKey(moduleID))
            {
                return theModules[moduleID].ToArray();
            }
            throw new InvalidOperationException("Unknown module id: " + moduleID);
        }

        internal static void SwitchModules(long m1, long m2)
        {
            if (ModuleExists(m1) && ModuleExists(m2))
            {
                List<GephiNode> m1List = theModules[m1];
                List<GephiNode> m2List = theModules[m2];
                
                theModules.Remove(m1);
                theModules.Remove(m2);

                theModules.Add(m1, m2List);
                theModules.Add(m2, m1List);

                foreach (GephiNode g in theModules[m1])
                {
                    g.SetProperty(NodeProperties.Module, m1);
                }

                foreach (GephiNode g in theModules[m2])
                {
                    g.SetProperty(NodeProperties.Module, m2);
                }
            }
            else
            {
                throw new InvalidOperationException("Modules " + m1 + " and " + m2 + " both need to exist before they can be switched");
            }
        }

        internal static void ChangeModule(GephiNode n, long newModuleID)
        {
            if (lastModule < newModuleID)
            {
                lastModule = newModuleID;
            }

            long mod = (long)n.GetProperty(NodeProperties.Module);
            theModules[mod].Remove(n);
            if (theModules[mod].Count == 0)
            {
                //remove if empty
                theModules.Remove(mod);
            }

            n.SetProperty(NodeProperties.Module, newModuleID);

            if (!theModules.ContainsKey(newModuleID))
            {
                theModules.Add(newModuleID, new List<GephiNode>());
            }
            theModules[newModuleID].Add(n);
        }
        #endregion

        #region Node Collection
        private static List<GephiNode> theNodes;
        private static Dictionary<AbbreviatedGraph, GephiNode> nodeIndex;
        private static Dictionary<GephiNode, AbbreviatedGraph> reverseNodeIndex;

        internal static bool GephiExists(AbbreviatedGraph m)
        {
            return nodeIndex.ContainsKey(m);
        }

        internal static GephiNode GephiFromGraph(AbbreviatedGraph m)
        {
            if (nodeIndex.ContainsKey(m))
            {
                return nodeIndex[m];
            }
            throw new InvalidOperationException("There is no record of AbbreviatedGraph " + m);
        }

        internal static AbbreviatedGraph GraphFromGephi(GephiNode m)
        {
            if (reverseNodeIndex.ContainsKey(m))
            {
                return reverseNodeIndex[m];
            }
            throw new InvalidOperationException("There is no record of GephiNode " + m);
        }

        internal static GephiNode[] AllNodes
        {
            get
            {
                return theNodes.ToArray();
            }
        }

        private static long lastNodeIndex = -1;
        internal static GephiNode InitializeGephiNode(AbbreviatedGraph member, AbbreviatedGraph type, long module, NodePatterns p, AccessPatterns p2, bool qAllowed)
        {
            return InitializeGephiNode(lastNodeIndex + 1, member, type, module, p, p2, qAllowed);
        }

        private static Dictionary<AbbreviatedGraph, long> classIDs = new Dictionary<AbbreviatedGraph, long>();
        private static int nextID = 0;

        internal static GephiNode InitializeGephiNode(long id, AbbreviatedGraph member, AbbreviatedGraph type, long module, NodePatterns p, AccessPatterns p2, bool qAllowed)
        {
            if (lastNodeIndex < id)
            {
                lastNodeIndex = id;
            }

            if (!classIDs.ContainsKey(type))
            {
                classIDs.Add(type, nextID++);
            }
            long typeID = classIDs[type];

            GephiNode g = new GephiNode(id, member.Represented.Node, member.Represented.Code);
            g.SetProperty(NodeProperties.Module, module);
            g.SetProperty(NodeProperties.NodePattern, (int)p);
            g.SetProperty(NodeProperties.AccessPattern, (int)p2);
            g.SetProperty(NodeProperties.TypeName, type.Represented.Code);
            g.SetProperty(NodeProperties.File, type.Represented.FileName);
            g.SetProperty(NodeProperties.QState, qAllowed);
            g.SetProperty(NodeProperties.ModuleIntegrity, -1.0);
            g.SetProperty(NodeProperties.ClassIntegrity, -1.0);
            g.SetProperty(NodeProperties.StateMember, (int)StatePatterns.None);
            g.SetProperty(NodeProperties.ClassID, typeID);
            g.SetProperty(NodeProperties.Rank, -1);

            if (lastModule < module)
            {
                lastModule = module;
            }

            theNodes.Add(g);

            if (!theModules.ContainsKey(module))
            {
                theModules.Add(module, new List<GephiNode>());
            }

            theModules[module].Add(g);

            nodeIndex.Add(member, g);
            reverseNodeIndex.Add(g, member);

            return g;
        }
        #endregion

        private static Dictionary<AbbreviatedGraph, AbbreviatedGraph> AccessorLinks;
        private static Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> FieldAccessorLinks;

        internal static AbbreviatedGraph[] GetAllControlledVariables()
        {
            return FieldAccessorLinks.Keys.ToArray();
        }

        internal static void LinkToControlledVariable(AbbreviatedGraph method, AbbreviatedGraph field)
        {
            AccessorLinks.Add(method, field);

            if (!FieldAccessorLinks.ContainsKey(field))
            {
                FieldAccessorLinks.Add(field, new List<AbbreviatedGraph>());
            }
            FieldAccessorLinks[field].Add(method);
        }

        internal static AbbreviatedGraph GetControlledVariable(AbbreviatedGraph method)
        {
            if (AccessorLinks.ContainsKey(method))
            {
                return AccessorLinks[method];
            }
            return null;
        }

        internal static AbbreviatedGraph[] GetVariableControlMethods(AbbreviatedGraph field)
        {
            if (FieldAccessorLinks.ContainsKey(field))
            {
                return FieldAccessorLinks[field].ToArray();
            }
            return null;
        }

        private static List<AbbreviatedGraph> stateMembers;

        public static AbbreviatedGraph[] StateMembers
        {
            get
            {
                return stateMembers.ToArray();
            }
        }

        internal static void AddStateMember(AbbreviatedGraph g)
        {
            stateMembers.Add(g);
        }

        internal static bool IsStateMember(AbbreviatedGraph m2)
        {
            return stateMembers.Contains(m2);
        }

        internal static AbbreviatedGraph[] StateMembersByName(string s)
        {
            List<AbbreviatedGraph> answer = new List<AbbreviatedGraph>();

            foreach(AbbreviatedGraph g in stateMembers)
            {
                if (g.Represented.Code.Equals(s))
                {
                    answer.Add(g);
                }
            }
            return answer.ToArray();
        }

        public static AbbreviatedGraph FindHostType(AbbreviatedGraph a)
        {
            AbbreviatedGraph type = MetricUtilities.FindType(a);
            if (type == null)
            {
                int whatDoIdoNow;
                throw new InvalidCastException("Now what");
            }
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> hosts = type.GetEdges(Relationship.FileUp);
            while (hosts.Count > 0)
            {
                type = hosts.Keys.ToArray()[0];
                hosts = type.GetEdges(Relationship.FileUp);
            }

            return type;
        }

        public static AbbreviatedGraph FindType(AbbreviatedGraph p)
        {
            AbbreviatedGraph current = p;
            while (!current.Represented.Node.IsClassification)
            {
                current = current.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];
            }
            return current;
        }

        public static AbbreviatedGraph FindField(AbbreviatedGraph p)
        {
            if (p.Represented.Node.IsClassification)
            {
                return null;
            }

            AbbreviatedGraph current = p;
            while (!current.Represented.Node.IsField)
            {
                current = current.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];
                if (current.Represented.Node.IsClassification)
                {
                    return null;
                }
            }
            return current;
        }

        public static AbbreviatedGraph FindMethod(AbbreviatedGraph p)
        {
            if (p.Represented.Node.IsClassification)
            {
                return null;
            }

            AbbreviatedGraph current = p;
            while (!current.Represented.Node.IsMethodDefinition)
            {
                current = current.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];
                if (current.Represented.Node.IsClassification)
                {
                    return null;
                }
            }
            return current;
        }

        private static bool familialRelation(GephiNode g, GephiNode g2)
        {
            bool answer = false;

            AbbreviatedGraph a1 = GraphFromGephi(g);
            AbbreviatedGraph a2 = GraphFromGephi(g2);

            AbbreviatedGraph t1 = FindType(a1);
            AbbreviatedGraph t2 = FindType(a2);

            List<AbbreviatedGraph> list1 = GetAllParents(t1);
            foreach (AbbreviatedGraph p1 in list1)
            {
                if (p1 == t2)
                {
                    answer = true;
                    break;
                }
            }

            if (!answer)
            {
                List<AbbreviatedGraph> list2 = GetAllParents(t2);
                foreach (AbbreviatedGraph p2 in list2)
                {
                    if (p2 == t1)
                    {
                        answer = true;
                        break;
                    }
                }
            }

            return answer;
        }

        private static List<AbbreviatedGraph> GetAllParents(AbbreviatedGraph type)
        {
            List<AbbreviatedGraph> answer = new List<AbbreviatedGraph>();
            AbbreviatedGraph[] parents = type.GetEdges(Relationship.ParentType).Keys.ToArray();

            for (int i = 0; i < parents.Length; i++)
            {
                answer.Add(parents[i]);
                answer.AddRange(GetAllParents(parents[i]));
            }

            return answer;
        }

        private static Dictionary<StatePatterns, List<StateMachine>> statemachines = new Dictionary<StatePatterns, List<StateMachine>>();
        private static Dictionary<AbbreviatedGraph, StateMachine> stateMachineIndex = new Dictionary<AbbreviatedGraph, StateMachine>();

        internal static void AddStateMachine(StateMachine tmp)
        {
            if (!statemachines.ContainsKey(tmp.Type))
            {
                statemachines.Add(tmp.Type, new List<StateMachine>());
            }

            statemachines[tmp.Type].Add(tmp);

            if (tmp.PrimaryField != null)
            {
                stateMachineIndex.Add(tmp.PrimaryField, tmp);
            }
        }

        internal static StateMachine[] GetStateMachines(StatePatterns type)
        {
            if (statemachines.ContainsKey(type))
            {
                return statemachines[type].ToArray();
            }

            return new StateMachine[0];
        }

        internal static StateMachine GetStateMachine(AbbreviatedGraph primary)
        {
            if (!stateMachineIndex.ContainsKey(primary))
            {
                throw new InvalidDataException("No state machine exists for " + primary);
            }

            return stateMachineIndex[primary];
        }

        internal static void WriteStateMachines(StringBuilder sb, StatePatterns type)
        {
            foreach (StateMachine m in statemachines[type])
            {
                m.WriteStateMachine(sb);
                sb.AppendLine();
            }
            sb.AppendLine();
        }

        internal static void CreateEdge(AbbreviatedGraph src, AbbreviatedGraph dest, EdgePatterns p)
        {
            if (src == dest)
            {
                //this is the same thing. don't make any link
                return;
            }

            if(!(GephiExists(src)&&GephiExists(dest)))
            {
                return;
            }

            GephiNode him = MetricUtilities.GephiFromGraph(src);
            GephiNode me = MetricUtilities.GephiFromGraph(dest);

            if (IsThereADirectedLink(him, me))
            {
                GephiEdge[] set = MetricUtilities.GetEdges(him, me);
                foreach (GephiEdge e in set)
                {
                    if (e.GetEdgeType() == Relationship.CandidateRead)
                    {
                        e.SetProperty(NodeProperties.EdgeFlag, (int)p);
                    }
                }
            }
            else
            {
                GephiEdge e = CreateSingleEdge(him, me, Relationship.WrittenBy, 1, false);
            }
        }

        private static Dictionary<long, List<AbbreviatedGraph>> features = new Dictionary<long, List<AbbreviatedGraph>>();

        internal static void AddFeature(AbbreviatedGraph a, long module)
        {
            if (!features.ContainsKey(module))
            {
                features.Add(module, new List<AbbreviatedGraph>());
            }

            if (!features[module].Contains(a))
            {
                features[module].Add(a);
            }
        }

        internal static Dictionary<long, List<AbbreviatedGraph>> GetFeatures()
        {
            foreach (long l in features.Keys.ToArray())
            {
                if (features[l].Count == 0)
                {
                    features.Remove(l);
                }
            }

            return features;
        }

        private static Dictionary<long, List<AbbreviatedGraph>> dysplasia = new Dictionary<long, List<AbbreviatedGraph>>();

        internal static void AddCancer(NodePatterns p, AbbreviatedGraph a, long module)
        {
            if (!dysplasia.ContainsKey(module))
            {
                dysplasia.Add(module, new List<AbbreviatedGraph>());
            }

            if (!dysplasia[module].Contains(a))
            {
                dysplasia[module].Add(a);
            }
        }

        internal static bool RemoveFromDysplasia(AbbreviatedGraph ag, long m)
        {
            if (dysplasia.ContainsKey(m))
            {
                return dysplasia[m].Remove(ag);
            }
            return false;
        }

        internal static void RemoveCancer(long m)
        {
            if (dysplasia.ContainsKey(m))
            {
                dysplasia.Remove(m);
            }
        }

        internal static Dictionary<long, List<AbbreviatedGraph>> GetDysplasia()
        {
            foreach (long l in dysplasia.Keys.ToArray())
            {
                if (dysplasia[l].Count == 0)
                {
                    dysplasia.Remove(l);
                }
            }

            return dysplasia;
        }
        
        private static List<Tumor> tumors = new List<Tumor>();

        internal static Tumor[] GetTumors()
        {
            return tumors.ToArray();
        }

        internal static void AddTumor(Tumor t)
        {
            tumors.Add(t);
        }
    }
}
