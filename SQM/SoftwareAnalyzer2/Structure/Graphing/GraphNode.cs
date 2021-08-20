using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure.Graphing.Specifics;
using SoftwareAnalyzer2.Language;

namespace SoftwareAnalyzer2.Structure.Graphing
{
    public abstract class GraphNode
    {
        #region Redirect
        //These methods all exist as a redirection to the Package or TypeDefinition child classes. The
        //former is the static hub of the graph and the later has a central role in registration.
        //By putting these here we can avoid exposing the entire set of child classes to outside objects.

        public static void Register(INode node)
        {
            TypeDefinition.RegisterType(node);
        }

        public static void PrepareForLink(Action<object, LinkEventArgs> actionDelegate)
        {
            Package.HubPrepareForLink(actionDelegate);
        }

        public static bool AllLinking
        {
            get
            {
                return Package.AllLinkingHub;
            }
        }

        public static void ClearGraph(ILanguage lang)
        {
            Package.ClearGraphHub(lang);
        }

        /// <summary>
        /// Retrieves a hierarchically-ordered collection of all types in the graph.
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public static int GetAllTypes(List<GraphNode> types)
        {
            return Package.HubGetAllTypes(types);
        }

        public static void LinkAll()
        {
            Package.HubLinkAll();
        }

        protected static Dictionary<long, GraphNode> nodes;
        protected static long SaveIndex = 0;
        protected static StreamWriter graphFile;
        protected static Boolean AllowNewID = false;

        public enum ExploreModes
        {
            Touch,
            Full
        }

        public static void Save(string directory, string fileName)
        {
            SaveIndex = 0;
            graphFile = new StreamWriter(directory + Path.DirectorySeparatorChar + fileName + ".gph");
            nodes = new Dictionary<long, GraphNode>();
            AllowNewID = true;

            //find and identify all nodes
            Package.HubExplore();

            //for any node which was only touched, complete the exploration
            for (long i = 0; i < SaveIndex; i++)
            {
                if (!nodes[i].explored)
                {
                    nodes[i].ExploreGraph(ExploreModes.Full);
                }
            }

            AllowNewID = false;

            //write all nodes
            for (long i = 0; i < SaveIndex; i++)
            {
                nodes[i].WriteNode();
            }

            //write all edges
            for (long i = 0; i < SaveIndex; i++)
            {
                nodes[i].WriteEdges();
            }
            graphFile.Close();
        }
        #endregion

        #region Instance Members
        #region Fields
        private Dictionary<Relationship, Dictionary<GraphNode, List<Statement>>> relationshipsTo = new Dictionary<Relationship, Dictionary<GraphNode, List<Statement>>>();
        private static Dictionary<string, Dictionary<int, List<GraphNode>>> lineNumDict = new Dictionary<string, Dictionary<int, List<GraphNode>>>();
        private static Dictionary<string, Dictionary<int, List<GraphNode>>> affectedDict = new Dictionary<string, Dictionary<int, List<GraphNode>>>(); 


        public static Dictionary<string, Dictionary<int, List<GraphNode>>> GetLineNumDict()
        {
            return lineNumDict;
        }

        protected INode represented;
        public INode Represented
        {
            get
            {
                return represented;
            }
        }

        protected bool isSimulated = false;
        public bool IsSimulated
        {
            get
            {
                return isSimulated;
            }
        }

        private GraphNode parentScope = null;
        public GraphNode ParentScope
        {
            get
            {
                if (parentScope == null)
                {
                    throw new ArgumentException("No parent scope exists for " + this + " in "+this.represented.FileName);
                }
                return parentScope;
            }
            set
            {
                if (parentScope != null)
                {
                    throw new InvalidOperationException(this + " already contains a parent scope " + parentScope + ". Cannot add " + value);
                }
                parentScope = value;
            }
        }
        #endregion

        #region Methods
        public abstract void InitialLink();
        public abstract void FullLink();

        public virtual void AddRelationship(GraphNode g, Relationship r, Statement s)
        {
            lock (relationshipsTo)
            {
                Dictionary<GraphNode, List<Statement>> temp = null;
                if (!relationshipsTo.ContainsKey(r))
                {
                    relationshipsTo.Add(r, new Dictionary<GraphNode, List<Statement>>());
                }
                temp = relationshipsTo[r];

                if (!temp.ContainsKey(g))
                {
                    temp.Add(g, new List<Statement>());
                }

                List<Statement> statements = temp[g];

                statements.Add(s);
            }
        }

        public int GetRelationshipCount(Relationship r)
        {
            lock (relationshipsTo)
            {
                if (relationshipsTo.ContainsKey(r))
                {
                    int count = 0;

                    Dictionary<GraphNode, List<Statement>> temp = relationshipsTo[r];
                    foreach (GraphNode g in temp.Keys)
                    {
                        count += temp[g].Count;
                    }
                    return count;
                }
            }
            return 0;
        }

        /// <summary>
        /// Returns true if a relationship exists for a node which matches the given node. False otherwise.
        /// </summary>
        /// <param name="someNode"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public bool HasRelationShip(INavigable someNode, Relationship r)
        {
            lock (relationshipsTo)
            {
                if (relationshipsTo.ContainsKey(r))
                {
                    Dictionary<GraphNode, List<Statement>> temp = relationshipsTo[r];
                    foreach (GraphNode g in temp.Keys)
                    {
                        if (g.represented.Equals(someNode))
                        {
                            return true;
                        }
                    }
                }
                return false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="targetNode"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        public abstract DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="targetNode"></param>
        /// <param name="parameterScope"></param>
        /// <param name="halt"></param>
        /// <returns></returns>
        public abstract DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt);

        /// <summary>
        /// Returns null if there is no dot opoerator. Otherwise returns the INavigable after the operator.
        /// </summary>
        /// <param name="current"></param>
        /// <returns></returns>
        protected INavigable GetDotChild(INavigable current)
        {
            //if the dot operator is used to access some further member,
            //identify the final graph node in that dot chain
            INavigable dotOp = current.GetFirstSingleLayer(Members.DotOperator);
            if (current.GetChildCount() > 0 && dotOp != null)
            {
                return dotOp.GetNthChild(0);
            }

            return null;
        }

        /// <summary>
        /// Takes a root expresion which may contain multiple small parts, expressions, etc. in a tree.
        /// It finds all the parts and determines the overall type. Returns the definition
        /// of the type which is represented by the various parts. If type can't be 
        /// conclusively determined the null node instance is returned.
        /// </summary>
        /// <param name="p"></param>
        /// <param name="parameterScope"></param>
        /// <returns></returns>
        protected TypeDefinition DiscoverTypeFromParts(INavigable root, GraphNode parameterScope)
        {
            Statement statement = new Statement(parameterScope, root);

            List<INavigable> parts = new List<INavigable>();
            ParseExpression(root, parts, new ChainArgs(parameterScope, true, statement, true));

            if (parts.Count == 0)
            {
                throw new InvalidDataException("Found 0 parts in parameter " + root);
            }
            else if (parts.Count > 1)
            {
                //at this point we cannot confidently parse the type when there are multiple parts in the expression
                return TypeDefinition.VoidType;
            }

            //there is only one part so we can parse the type
            return parameterScope.FindChainEnd(parts[0], new ChainArgs(parameterScope, true, statement, false)).AssociatedType;
        }

        protected void ParseExpression(INavigable block, List<INavigable> answer, ChainArgs args)
        {
            if (block.Node.Equals(Members.Cast))
            {
                //casts always contain a typename which is NOT part of the expression, so we have to skip the type information.
                ParseExpression(block.GetNthChild(1), answer, args);
            }
            else
            {
                if (block.Node.IsUseType)
                {
                    answer.Add(block);
                    return;
                }

                if (block.Node.Equals(Members.Trinary))
                {
                    answer.AddRange(LinkTrinary(block, args));
                    return;
                }

                //parse any nested expressions
                foreach (INavigable c in block.Children)
                {
                    if (c.Node.Equals(Members.DotOperator))
                    {
                        //dot operators are ignored because they are handled in calling logic
                        continue;
                    }

                    //this logic would be better if I could test to ensure only expressions are being recursed.
                    ParseExpression(c, answer, args);
                }
            }
        }

        protected List<INavigable> LinkTrinary(INavigable node, ChainArgs args)
        {
            if (args.CheckTypeOnly)
            {
                List<INavigable> list = new List<INavigable>();
                //if there are two types in the list we are "unable" to tell what is there.
                list.Add((INavigable)TypeDefinition.HeadType.Represented);
                list.Add((INavigable)TypeDefinition.HeadType.Represented);
                return list;
            }
            else
            {
                List<DefinedMember> list = new List<DefinedMember>();
                Trinary t = new Trinary(node);
                t.Register(list, args.ParameterScope);
                t.InitialLink();
                t.FullLink();

                return t.GetBranchMembers();
            }
        }

        internal DefinedMember LinkChainMember(INavigable node, DefinedMember nodeDefinition, INavigable next, ChainArgs args)
        {
            //need to check other children
            CheckChildren(node, nodeDefinition, args);

            LinkAccess(this, nodeDefinition, args.OriginStatement);

            if (next == null)
            {
                return nodeDefinition;
            }
            else
            {
                return nodeDefinition.DotOperator(next, args);
            }
        }

        protected virtual void LinkAccess(GraphNode IAccessHim, GraphNode IAmAccessedByHim, Statement s)
        {
            //link the candidate use to the statement
            IAmAccessedByHim.AddRelationship(IAccessHim, Relationship.CandidateRead, s);
            IAccessHim.AddRelationship(IAmAccessedByHim, Relationship.Accesses, s);
        }

        protected virtual void LinkWrite(GraphNode writeTo, GraphNode writeFrom, Statement s)
        {
            writeFrom.AddRelationship(writeTo, Relationship.CandidateRead, s);
            writeTo.AddRelationship(writeFrom, Relationship.WrittenBy, s);
        }

        protected bool CheckChildren(INavigable node, GraphNode definition, ChainArgs args)
        {
            if (!args.CheckOtherChildren)
            {
                return false;
            }

            if ((node.Node.Equals(Members.LanguageTypeCheck) && node.GetChildCount() == 2) ||
                (node.Node.Equals(Members.Cast) && node.GetChildCount() <= 3))
            {
                return false;//neither of these is unusual, but the exact membership is unimportant.
            }

            bool answer = false;
            foreach (INavigable n in node.Children)
            {
                NodeType t = n.Node;
                if (t.Equals(Members.DotOperator))
                {
                    continue;//already handled elsewhere
                }
                else if (t.Equals(Members.Write))
                {
                    answer = true;
                    if (n.GetChildCount() == 0)
                    {
                        //this is an auto-write of some sort.
                        LinkWrite(definition, definition, args.OriginStatement);
                    }
                    else if (n.GetChildCount() > 1)
                    {
                        node.PrintTreeText();
                        throw new InvalidCastException("Mal-formed Write block " + node + " in " + node.FileName);
                    }
                    else
                    {
                        List<INavigable> parts = new List<INavigable>();
                        ParseExpression(n.GetNthChild(0), parts, args);

                        //for each one find the end of the chain
                        foreach (INavigable p in parts)
                        {
                            LinkWrite(definition, args.ParameterScope.FindChainEnd(p, args), args.OriginStatement);
                        }
                    }
                }
                else if (t.Equals(Members.Index))
                {
                    answer = true;

                    List<INavigable> parts = new List<INavigable>();
                    ParseExpression(n.GetNthChild(0), parts, args);

                    //for each one find the end of the chain
                    foreach (INavigable p in parts)
                    {
                        LinkWrite(definition, args.ParameterScope.FindChainEnd(p, args), args.OriginStatement);
                    }
                }
                else if (t.Equals(Members.Sub_Type))
                {
                    answer = true;
                    INavigable sub = n.GetNthChild(0);
                    TypeDefinition td = args.ParameterScope.SearchScopeForType(sub.Code);
                    td.AddRelationship(this, Relationship.SubDefinitionOf, args.OriginStatement);
                    this.AddRelationship(td, Relationship.SubDefinition, args.OriginStatement);
                }
                else if (t.Equals(Members.AnonymousLink))
                {
                    continue;//already handled elsewhere
                }
                else if (t.Equals(Members.ParameterList))
                {
                    continue;//already handled elsewhere
                }
                else if (t.Equals(Members.Type) && node.Node.Equals(Members.Literal))
                {
                    continue;//already handled elsewhere
                }
                else if (t.Equals(Members.Primitive) && node.Node.Equals(Members.ArrayInvoke))
                {
                    continue;//already handled elsewhere
                }
                else
                {
                    node.PrintTreeText();
                    Console.WriteLine();
                    throw new InvalidCastException("Unknown child node " + t + " found an " + node);
                }
            }
            return answer;
        }

        #region Search
        /// <summary>
        /// From the current GraphNode goes up to the nearest type. Useful for identifying
        /// the type which contains some member or for accessing the pool of imports
        /// </summary>
        /// <returns></returns>
        public virtual TypeDefinition SearchUpToType()
        {
            return ParentScope.SearchUpToType();
        }

        /// <summary>
        /// Starting from any node finds the type indicated.
        /// </summary>
        /// <param name="other"></param>
        /// <param name="primitiveType"></param>
        /// <returns></returns>
        public TypeDefinition SearchScopeForType(string typeName)
        {
            if (typeName.Length == 0)
            {
                throw new InvalidOperationException("Cannot search for Type with empty name");
            }
            //search up the graph for the nearest type declaration in this tree
            return SearchUpToType().FindType(typeName);
        }
        #endregion

        #region Save
        protected bool explored = false;
        protected bool traced = false;
        protected long myNodeID = -1;
        private int parentLineNum = -1;
        /// <summary>
        /// If the node has not been assigned an ID, one is assigned and the node is written to the file.
        /// The node is returned.
        /// </summary>
        /// <param name="graphFile"></param>
        /// <returns></returns>
        public long SaveThisNode()
        {
            lock (nodes)
            {
                if (myNodeID == -1 && AllowNewID)
                {
                    //this node has never been written.
                    myNodeID = SaveIndex++;
                    nodes.Add(myNodeID, this);
                }
                else if (myNodeID ==  -1)
                {
                    throw new InvalidOperationException("Attempting to create new node id for "+this+" after initial exploration");
                }
            }

            return myNodeID;
        }
        
        /// <summary>
        /// Creates a save node and recursively searches for extensive links.
        /// To prevent a complete DFS for every link, the parameter indicates
        /// if the complete DFS is indicated or if this is intended simply to touch 
        /// the linked node.
        /// </summary>
        /// <param name="mode"></param>
        public abstract void ExploreGraph(ExploreModes mode);

        public List<GraphNode> FindRelationships()
        {
            List<GraphNode> answer = new List<GraphNode>();
            foreach (Relationship r in relationshipsTo.Keys)
            {
                Dictionary<GraphNode, List<Statement>> related = relationshipsTo[r];
                foreach (GraphNode g in related.Keys)
                {
                    if (!answer.Contains(g))
                    {
                        answer.Add(g);
                    }

                    foreach (Statement s in related[g])
                    {
                        GraphNode p = s.parentScope;
                        if (!answer.Contains(p))
                        {
                            answer.Add(p);
                        }
                    }
                }
            }
            return answer;
        }

        public static void FindCSVConnections(string fileName, int lineNum, string fileStem)
        {
            string outputFileName = "_errors_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter gFile = new StreamWriter(fullFile, true);

            List<GraphNode> relatedGNodes = lineNumDict[fileName][lineNum];
            
            //find all graphnodes that are related to the line number entered by the user
            FindAffectedNodes(relatedGNodes);

            //csv output
            OutputCSVErrors(gFile, fileName, lineNum);

            affectedDict.Clear();
            gFile.Close();
        }

        //this output is subject to change based on safety's needs
        public static void OutputCSVErrors(StreamWriter file, string tracingFile, int tracingLineNumber)
        {
            foreach (string fN in affectedDict.Keys)
            {
                string fnModded = fN;
                if (fN.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fnModded = fnModded.Substring(fnModded.LastIndexOf(Path.DirectorySeparatorChar));
                }
                foreach (int lN in affectedDict[fN].Keys)
                {
                    List<GraphNode> gnList = affectedDict[fN][lN];
                    //output affected filename, linenumber, and nodetype
                    string gnListStr = "";
                    foreach (GraphNode g in gnList)
                    {
                        gnListStr += g.Represented.Node.ToString() + ","; 
                    }
                    if (gnListStr != "")
                    {
                        file.WriteLine(tracingFile + "[" + tracingLineNumber.ToString() + "]," + fN + "," + lN + "," + gnListStr);
                    }
                }
            }
        }
        //luTODO -- move these functions to a different file within metrics folder
        //luTODO -- make the tracing errors silent and output them within an output file
        //luTODO -- look at statemachine, create object for showing relationship
        public static void FindAffectedNodes(List<GraphNode> gNodes)
        {
            //for every affected graph node, trace the relationships down the chain until everything has been traced
            foreach (GraphNode g in gNodes)
            {
                if (!g.Represented.Node.IsClassification)
                {
                    //constructor, literal, statement, return type, return, method are potential future cases to consider
                    //field, param, local variable**, return value, method are used in the state tracing

                    //switch statement to trace the different member types.
                    //each member type has a different set of relationships (writtento, candidateread, etc.) that needs to be traced.
                    switch (g.Represented.Node.GetMyMember()) 
                    {
                        case Members.Field:
                            TraceField(g);
                            break;
                        case Members.Parameter:
                            TraceParameter(g);
                            break;
                        case Members.Method:
                            TraceMethod(g);
                            break;
                        case Members.MethodScope:
                            if(g.ParentScope.Represented.Node.GetMyMember() == Members.Method)
                            {
                                TraceMethod(g.ParentScope);
                            }
                            break;
                        case Members.Branch:
                            TraceBranch(g);
                            break;
                        default:
                            //default functionality unnecessary? (subject to change)
                            break;
                    }
                }
            }
        }

        private static void TraceField(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                //this line seems to be neccessary to trace everything. maybe redundant in some cases
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

                foreach (Relationship r in gn.relationshipsTo.Keys)
                {
                    //candidate read is neccesary when it relates to methods/return values
                    if (r == Relationship.WrittenBy || r == Relationship.ReturnType)
                    {
                        foreach (GraphNode grphNde in gn.relationshipsTo[r].Keys)
                        {
                            if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                            {
                                WriteStatementToAffectedDict(gn, grphNde, r);
                            }

                            //field wants to trace back to anything it is related to.
                            if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                TraceParameter(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Constructor))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Literal))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. error message to user.
                                throw new InvalidDataException(grphNde.Represented.Node.ToString() + " not accounted for in TraceField()");
                            }

                        }
                    }
                    else if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.relationshipsTo[r].Keys)
                        {
                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde);
                            }
                        }
                    }
                }
            }
        }

        private static void TraceParameter(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

                foreach (Relationship r in gn.relationshipsTo.Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.relationshipsTo[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNde, r);

                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                TraceParameter(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.For3Loop))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. error message to user.
                                throw new InvalidDataException(grphNde.Represented.Node.ToString() + " not accounted for in TraceParameter()");
                            }
                        }
                    }
                }
            }
        }

        private static void TraceMethod(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, -1, false);

                foreach (Relationship r in gn.relationshipsTo.Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.relationshipsTo[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNde, r);
                        }
                    }
                    //return value is neccesary in some but not others (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.relationshipsTo[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNode, r);
                            TraceReturnValue(grphNode);
                        }
                    }
                }
            }
                
        }

        private static void TraceBranch(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                Branch b = (Branch)gn;
                //get all of the line numbers in the affected branch (if/else)
                List<Tuple<int, int>> bList = b.GetBranchLineNums();
                
                if(bList != null)
                {
                    foreach (Tuple<int, int> t in bList)
                    {
                        for (int i = t.Item1; i <= t.Item2; i++)
                        {
                            //maybe find relationships of the line numbers eventually (subject to change)
                            WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, i, false);
                        }
                    }
                }      
            }
        }

        private static void TraceReturnValue(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;

                if (gn.Represented.Node.Equals(Members.Field))
                {
                    WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);
                }

                foreach (Relationship r in gn.relationshipsTo.Keys)
                {
                    if (r == Relationship.WrittenBy)
                    {
                        foreach (GraphNode grphNode in gn.relationshipsTo[r].Keys)
                        {
                            if (grphNode.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNode);
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Literal))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Method))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Parameter))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Constructor))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. throw error message to user
                                throw new InvalidDataException(grphNode.Represented.Node.ToString() + " not accounted for in TraceReturnValue()");
                            }
                        }
                    }
                }
            }
        }
        /* template trace function
        private static void Trace(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;

            }
        }
        */

        private void SetParentLine(int lineNum)
        {
            parentLineNum = lineNum;
        }

        public int GetParentLine()
        {
            return parentLineNum;
        }

        public void WriteNode()
        {
            WriteToAffectedDict(lineNumDict, this, represented.FileName, represented.GetLineStart(), true);
            string graph = "Node\t" + myNodeID + "\t" + represented.Node;

            if (represented.Code.Length == 0)
            {
                graph += "\t--";
            }
            else
            {
                graph += "\t" + represented.Code;
            }

            if (IsSimulated)
            {
                graph += "\t--\t--";
            }
            else if (represented.GetFileLineRange().Length == 0)
            {
                //BSD 12/19/2017 Evidence shows that the minimal value for GetFileLineRange
                //is "(): ". There should be no node which satisfies this branch of logic.
                //watch for this line to occur and confirm/deny this
                Console.WriteLine("ASTree.GetFileLineRange has zero length: " + represented);
                Console.WriteLine("Revise GraphNode.WriteNode() to accept zero length.");
                System.Windows.Forms.Application.Exit();

                graph += "\t" + represented.FileName + "\t--";
            }
            else
            {
                graph += "\t" + represented.FileName + "\t" + represented.GetFileLineRange();
            }
            graphFile.WriteLine(graph);
        }

        protected virtual void WriteEdges()
        {
            foreach (Relationship r in relationshipsTo.Keys)
            {
                Dictionary<GraphNode, List<Statement>> related = relationshipsTo[r];
                foreach (GraphNode g in related.Keys)
                {
                    Dictionary<GraphNode, int> scopes = new Dictionary<GraphNode,int>();
                    foreach (Statement s in related[g])
                    {
                        GraphNode p = s.parentScope;
                        if (!scopes.ContainsKey(p))
                        {
                            scopes.Add(p, 0);
                            p.SetParentLine(s.Represented.GetLineStart());
                        }
                        scopes[p]++;
                    }

                    foreach (GraphNode key in scopes.Keys)
                    {
                        WriteEdge(myNodeID, g.SaveThisNode(), key.SaveThisNode(), r, scopes[key], key.Represented.FileName, key.GetParentLine(), g);
                    }
                }
            }
        }

        protected void WriteEdge(long source, long destination, long scope, Relationship r, int weight)
        {
            //for writing the .gph file edges
            graphFile.WriteLine("Edge\t" + source + "\t" + destination + "\t" + scope + "\t" + r + "\t" + weight);
        }

        protected void WriteEdge(long source, long destination, long scope, Relationship r, int weight, string fileName, int lineNumber, GraphNode gn)
        {
            //for writing the .gph file edges
            if(fileName == null)
            {
                fileName = " ";
            }
            graphFile.WriteLine("Edge\t" + source + "\t" + destination + "\t" + scope + "\t" + r + "\t" + weight + "\t" + lineNumber + "\t" + fileName);

            WriteToAffectedDict(lineNumDict, gn, fileName, lineNumber, true);
        }

        //luTODO -- take simulated data, mark it, terminate tracing at that point
        //luTODO -- fix the fibonacci error
        private static void WriteToAffectedDict(Dictionary<string, Dictionary<int, List<GraphNode>>> dict, GraphNode gn, string fileName, int lineNumber, bool trimFileN)
        {
            //simulated graphnodes are not very meaningful for tracing errors
            if(fileName != null && !gn.IsSimulated)
            {       
                //trim filename for affected dict, but not linenumber dict
                if(trimFileN && fileName.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fileName = fileName.Substring(fileName.LastIndexOf(Path.DirectorySeparatorChar));
                }
                
                Dictionary<int, List<GraphNode>> gnLine = new Dictionary<int, List<GraphNode>>();
                gnLine[lineNumber] = new List<GraphNode>();
                gnLine[lineNumber].Add(gn);

                //add to linenumber dictionary
                //does the dict contain the filename?
                if (!dict.ContainsKey(fileName))
                {
                    dict.Add(fileName, gnLine);
                }
                else
                {
                    //if the dict contains the filename, does it also contain the line number?
                    if (dict[fileName].ContainsKey(lineNumber))
                    {
                        //if it doesn't contain the exact graphnode we are inserting, insert it
                        if (!dict[fileName][lineNumber].Contains(gn))
                        {
                            dict[fileName][lineNumber].Add(gn);
                        }
                    }
                    else
                    {
                        //if it doesn't contain the line number, safe to insert.
                        dict[fileName].Add(lineNumber, gnLine[lineNumber]);
                    }
                }
            }
        }

        private static void WriteStatementToAffectedDict(GraphNode gn, GraphNode grphNde, Relationship r)
        {
            //simulated graphnodes are not very meaningful for tracing errors
            if (!gn.IsSimulated)
            {
                foreach (Statement s in gn.relationshipsTo[r][grphNde])
                {
                    //check if affectedDict contains the filename we are trying to insert
                    if (!affectedDict.ContainsKey(s.Represented.FileName))
                    {
                        Dictionary<int, List<GraphNode>> iGNList = new Dictionary<int, List<GraphNode>>();
                        List<GraphNode> smallGList = new List<GraphNode>();
                        smallGList.Add(grphNde);
                        iGNList[s.Represented.GetLineStart()] = smallGList;
                        affectedDict[s.Represented.FileName] = iGNList;
                    }
                    //if affectedDict contains the filename, does it also contain the line number we are trying to insert?
                    else if (!affectedDict[s.Represented.FileName].ContainsKey(s.Represented.GetLineStart()))
                    {
                        List<GraphNode> gnList = new List<GraphNode>();
                        gnList.Add(grphNde);
                        affectedDict[s.Represented.FileName][s.Represented.GetLineStart()] = gnList;
                    }
                }
            }
        }

        protected const long NO_SCOPE = -1;

        protected void WriteMember(GraphNode member)
        {
            WriteEdge(myNodeID, member.SaveThisNode(), myNodeID, Relationship.Member, 1);
            WriteEdge(member.SaveThisNode(), myNodeID, myNodeID, Relationship.MemberOf, 1);
        }

        protected void WriteMemberOf(GraphNode parent)
        {
            WriteEdge(myNodeID, parent.SaveThisNode(), myNodeID, Relationship.MemberOf, 1);
            WriteEdge(parent.SaveThisNode(), myNodeID, myNodeID, Relationship.Member, 1);
        }
        #endregion

        #region From Object
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            if (this.represented == null)
            {
                return "GraphNode[--]";
            }
            else
            {
                string s = "GraphNode[";
                if (this.IsSimulated)
                {
                    s += "SIM:";
                }

                return s + represented.ToString() + "]";
            }
        }
        #endregion
        #endregion
        #endregion

        /// <summary>
        /// Ascends the parent scope hierarchy to add this scope link to the parent TypeDefinition.
        /// </summary>
        /// <param name="al"></param>
        public virtual void AddAnonymousLink(GraphNode al, INavigable n)
        {
            ParentScope.AddAnonymousLink(al, n);
        }

        protected DefinedMember HandleCast(INavigable targetNode, ChainArgs args)
        {
            DefinedMember v = FindChainEnd(targetNode.GetNthChild(1), args);//follow the variable

            if (targetNode.GetChildCount() == 3)
            {
                //there is a dot after the type
                TypeDefinition d = SearchScopeForType(targetNode.GetNthChild(0).GetNthChild(0).Code);
                return d.FindChainEnd(targetNode.GetNthChild(2).GetNthChild(0), args);
            }
            else
            {
                //cast object is the return type
                return v;
            }
        }
    }
}