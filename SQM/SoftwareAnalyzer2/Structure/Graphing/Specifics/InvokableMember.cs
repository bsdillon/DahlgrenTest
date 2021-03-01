using SoftwareAnalyzer2.GUI;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class InvokableMember : DefinedMember
    {
        private static Boolean verboseMatch = false;

        static InvokableMember()
        {
            typeCheck = new InvokableMember(NodeFactory.CreateNode(Members.Method, "LanguageTypeCheck", false));
            typeCheck.returnType = TypeDefinition.GetNativeType("Boolean");
        }

        private static InvokableMember typeCheck;
        public static InvokableMember LanguageTypeCheck
        {
            get
            {
                return typeCheck;
            }
        }


        #region Return Type
        protected TypeDefinition returnType = null;
        private void SetReturnType(INode t)
        {
            lock (this)
            {
                if (returnType != null)
                {
                    throw new InvalidOperationException(this + " already contains a return type " + returnType + ". Cannot accept alternate return " + t);
                }

                if (TypeDefinition.IsVoid(t.Code))
                {
                    returnType = TypeDefinition.VoidType;

                }
                else
                {
                    returnType = SearchScopeForType(t.Code);
                }
            }
        }

        public override TypeDefinition AssociatedType
        {
            get
            {
                lock (this)
                {
                    if (returnType == null)
                    {
                        throw new InvalidOperationException("Method " + represented + " does not have a return type");
                    }
                    else if (returnType == TypeDefinition.VoidType)
                    {
                        throw new InvalidOperationException(represented + " has a void return type; Return value cannot be accessed");
                    }

                    return returnType;
                }
            }
        }
        #endregion

        #region Parameter List
        private List<Field> formalParameters = new List<Field>();

        public List<Field> GetParameters()
        {
            List<Field> answer = new List<Field>();

            foreach (Field g in formalParameters)
            {
                answer.Add(g);
            }

            return answer;
        }
        #endregion

        private Scope methodScope = null;
        private Members methodType;

        public InvokableMember(INode node)
        {
            Members type = node.Node.GetMembers();
            if (!(type == Members.Method || type == Members.Inline || type == Members.Constructor))
            {
                throw new InvalidCastException("Invokables must be methods, constructors or inlines. Type " + type + " is undefined");
            }

            represented = node;
            methodType = type;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);

            INavigable myNavigable = (INavigable)represented;

            //find and register the method scope if it exists.
            INavigable ms = myNavigable.GetFirstSingleLayer(Members.MethodScope);
            if (ms != null)
            {
                methodScope = new Scope(ms);
            }
            else
            {
                //abstract methods and interface methods have no interface scope
                //we have to simulated one for linking
                methodScope = new Scope(NodeFactory.CreateNode(Members.MethodScope, false));
            }

            //create the link to the parent scope first so we can link to it.
            methodScope.ParentScope = this;
            methodScope.Register();

            //find the variables in the method if they exist
            INavigable paramList = myNavigable.GetFirstSingleLayer(Members.ParameterList);
            if (paramList != null)
            {
                List<DefinedMember> parameters = new List<DefinedMember>();
                foreach (INavigable t in paramList.Children)
                {
                    new Field(t).Register(parameters, this);
                }

                foreach (DefinedMember d in parameters)
                {
                    formalParameters.Add((Field)d);
                }
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            INavigable returned = ((INavigable)represented).GetFirstSingleLayer(Members.ReturnType);

            if (methodType != Members.Inline && returned.GetChildCount() > 0)
            {
                SetReturnType(returned.GetNthChild(0));
            }
            else
            {
                //void return type create for simulated methods
                SetReturnType(NodeFactory.CreateNode(Members.TypeName, "Void"));
            }

            foreach (Field f in formalParameters)
            {
                f.InitialLink();
            }

            INavigable mSet = ((INavigable)this.represented).GetFirstSingleLayer(MemberSets.ModifierSet);
            List<INavigable> modifiers = new List<INavigable>();
            if (mSet != null)
            {
                modifiers = mSet.Children;
            }

            foreach (INavigable modifier in modifiers)
            {
                this.AddRelationship(new Annotation(modifier), Relationship.Annotation, new Statement(this, modifier));
            }

            methodScope.InitialLink();
        }

        public override void SimulateLinking(INode rType)
        {
            SetReturnType(rType);
        }

        public override void FullLink()
        {
            methodScope.FullLink();
        }

        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            foreach (Field f in formalParameters)
            {
                if (f.Represented.Code.Equals(targetNode.Code))
                {
                    //this is the field we are looking for
                    return f;
                }
            }

            return null;
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            if (targetNode.Node.Equals(Members.Variable))
            {
                DefinedMember f = SearchFields(targetNode);

                if (f != null)
                {
                    return f;
                }

                //variable not found in this scope, may be in parent scope
                return ParentScope.TruncatedSearch(targetNode, parameterScope, halt);
            }
            else
            {
                throw new InvalidOperationException("TruncatedSearch not valid for " + targetNode + " from InvokableMember");
            }
        }

        public void LinkParameters(INavigable methodInvoke, ChainArgs args)
        {
            INavigable paramList = methodInvoke.GetFirstSingleLayer(Members.ParameterList);

            //no variables to link, nothing to evaluate
            if (paramList.GetChildCount() == 0)
            {
                return;
            }

            List<INavigable> actuals = paramList.Children;

            if (isSimulated)
            {
                //external method with no formal definitions to link to
                //using WrittenBy here because there will be no backwards attribution from an outlibrary method
                for (int i = 0; i < actuals.Count; i++)
                {
                    SetParameter(actuals[i].GetNthChild(0), this, args);
                }
            }
            else
            {
                if (formalParameters.Count == 0)
                {
                    throw new InvalidOperationException("Attempting to link " + methodInvoke + " with " + actuals.Count + " variables.\r\n No variables found in proposed definition");
                }

                //look for expandable list variables in the last position
                bool expandable = ((INavigable)formalParameters[formalParameters.Count - 1].Represented).Expandable;

                //catch error for all parameter lists which don't match
                if (formalParameters.Count != actuals.Count && !expandable)
                {
                    throw new InvalidCastException("Cannot Link Parameters because " + methodInvoke + " is not matched with " + represented);
                }

                if (expandable)
                {
                    //link all the standard variables
                    for (int i = 0; i < formalParameters.Count - 1; i++)
                    {
                        SetParameter(actuals[i], formalParameters[i], args);
                    }

                    Field expandedSet = formalParameters[formalParameters.Count - 1];

                    //link the expanded ones to the list variable
                    for (int i = formalParameters.Count - 1; i < actuals.Count; i++)
                    {
                        SetParameter(actuals[i], expandedSet, args);
                    }
                }
                else
                {
                    //normal 1-to-1 linking
                    for (int i = 0; i < actuals.Count; i++)
                    {
                        SetParameter(actuals[i], formalParameters[i], args);
                    }
                }
            }
        }
        #endregion

        public override void ExploreGraph(ExploreModes mode)
        {
            SaveThisNode();

            if (mode == ExploreModes.Touch || explored)
            {
                return;
            }

            explored = true;

            foreach (GraphNode g in FindRelationships())
            {
                g.ExploreGraph(ExploreModes.Touch);
            }

            returnType.ExploreGraph(ExploreModes.Full);

            foreach (Field f in formalParameters)
            {
                f.ExploreGraph(ExploreModes.Full);
            }

            if (methodScope != null)
            {
                methodScope.ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            WriteEdge(myNodeID, returnType.SaveThisNode(), NO_SCOPE, Relationship.ReturnType, 1);

            foreach (Field f in formalParameters)
            {
                long fID = f.SaveThisNode();
                WriteEdge(myNodeID, fID, myNodeID, Relationship.FormalParameter, 1);
                WriteEdge(fID, myNodeID, myNodeID, Relationship.MemberOf, 1);
            }

            if (methodScope != null)
            {
                WriteMember(methodScope);
            }

            foreach (InvokableMember m in newImplementations)
            {
                WriteEdge(myNodeID, m.SaveThisNode(), NO_SCOPE, Relationship.NewImplementation, 1);
            }

            foreach (InvokableMember m in parentDefinitions)
            {
                WriteEdge(myNodeID, m.SaveThisNode(), NO_SCOPE, Relationship.OverridesImplementation, 1);
            }
        }

        private void SetParameter(INavigable actualBlock, DefinedMember formal, ChainArgs args)
        {
            List<INavigable> actualMembers = new List<INavigable>();
            ParseExpression(actualBlock, actualMembers, args);

            foreach (INavigable a in actualMembers)
            {
                if (a.Node.Equals(Members.ArrayInvoke))
                {
                    //this may be a second round through the method. If that is the case
                    //then a previous record will be found in the relation. To prevent
                    //generating two AnonArray objects, we first check for that relationship
                    //and pre-empt any further work if it is found.
                    if (formal.HasRelationShip(a, Relationship.WrittenBy))
                    {
                        continue;
                    }
                }

                LinkWrite(formal, args.ParameterScope.FindChainEnd(a, new ChainArgs(args.ParameterScope, false, args.OriginStatement, false)), args.OriginStatement);
            }
        }

        private List<InvokableMember> parentDefinitions = new List<InvokableMember>();
        public void Overrides(InvokableMember parentMember)
        {
            if (parentDefinitions.Count > 0)
            {
                foreach (InvokableMember im in parentDefinitions)
                {
                    if (im == parentMember)
                    {
                        //exactly the same memory location; same member
                        return;//just ignore it
                    }
                }
            }
            
            parentDefinitions.Add(parentMember);
            parentMember.AddNewImplementation(this);
        }

        private List<InvokableMember> newImplementations = new List<InvokableMember>();
        private void AddNewImplementation(InvokableMember childMember)
        {
            newImplementations.Add(childMember);
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    InvokableMember other = (InvokableMember)gn;
                    INode otherNode = gn.Represented;

                    //Methods should have specific common characteristics
                    bool sameType = methodType == other.methodType;
                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                    bool sameLine = represented.OnSameLineAs(otherNode);

                    //prior to registration methods have no registered return type. So this is a soft requirement; 
                    //directly compare (avoiding error checking in AssociatedType property)
                    bool sameDefinition = (returnType == null || other.returnType == null) || returnType.Equals(other.returnType);

                    return (sameType && sameCode && sameLine && sameDefinition);
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        internal bool IsOverrideOf(InvokableMember other)
        {
            //easy turn down if names don't match
            if (!(other.Represented.Node.Equals(Represented.Node) &&
                   other.Represented.Code.Equals(Represented.Code)))
            {
                return false;
            }

            //easy answer; we don't worry about the specific number of parameters for simulated types
            if(other.IsSimulated)
            {
                return true;
            }
            
            //easy answer; parameter count does not match
            if(other.formalParameters.Count != formalParameters.Count)
            {
                return false;
            }

            //If there are parameters, check expandability
            if (formalParameters.Count > 0)
            {
                bool otherIsExpandable = ((INavigable)other.formalParameters[formalParameters.Count - 1].Represented).Expandable;
                bool IAmExpandable = ((INavigable)formalParameters[formalParameters.Count - 1].Represented).Expandable;

                if (otherIsExpandable != IAmExpandable)
                {
                    return false;
                }
            }

            for(int i=0;i<formalParameters.Count;i++)
            {
                if(!formalParameters[i].AssociatedType.Equals(other.formalParameters[i].AssociatedType))
                {
                    //mismatch in parameter type
                    return false;
                }

                if (formalParameters[i].ArrayCount != other.formalParameters[i].ArrayCount)
                {
                    //mismatch in parameter array
                    return false;
                }
            }
            
            return true;
        }
        
        private static object MatcherLock = new object();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="unknown">The method which we are trying to match to a definition</param>
        /// <param name="parameterScope">The original scope wherein the method is called</param>
        /// <param name="candidates">Potential matches based on a preliminary view of matching method signature</param>
        /// <returns></returns>
        public static DefinedMember GetBestMatch(INavigable unknownMethod, GraphNode parameterScope, List<InvokableMember> candidates, List<GraphNode> paramTypes, List<INavigable> myParams)
        {
            //evaluate the variables of this method to determine which types may be determined.

            //find the variables for each candidate
            Dictionary<InvokableMember, List<TypeDefinition>> candidateParams = new Dictionary<InvokableMember, List<TypeDefinition>>();
            Dictionary<InvokableMember, List<List<TypeDefinition>>> subCandidates = new Dictionary<InvokableMember, List<List<TypeDefinition>>>();
            Dictionary<InvokableMember, List<int>> candidateArray = new Dictionary<InvokableMember, List<int>>();
            Dictionary<InvokableMember, List<bool>> templates = new Dictionary<InvokableMember, List<bool>>();
            Dictionary<InvokableMember, bool> expandable = new Dictionary<InvokableMember, bool>();
            foreach (InvokableMember g in candidates)
            {
                List<TypeDefinition> candidateTypes = new List<TypeDefinition>();
                List<List<TypeDefinition>> subTypes = new List<List<TypeDefinition>>();
                List<int> arrayType = new List<int>();
                List<bool> potentialTemplate = new List<bool>();
                List<Field> paramList = g.GetParameters();

                if (paramList.Count == 0)
                {
                    throw new InvalidOperationException("Mismatch of parameter list size when searching for " + unknownMethod);
                }

                foreach (Field p in paramList)
                {
                    TypeDefinition def = p.AssociatedType;
                    //if this may be a template (i.e. one letter name) we'll assume it is
                    potentialTemplate.Add(def.Represented.Code.Length == 1);
                    arrayType.Add(p.ArrayCount);
                    candidateTypes.Add(def);
                    subTypes.Add(p.SubTypes);
                }

                candidateParams.Add(g, candidateTypes);
                templates.Add(g, potentialTemplate);
                candidateArray.Add(g, arrayType);
                subCandidates.Add(g, subTypes);
                if (paramList.Count > 0)
                {
                    expandable.Add(g, ((INavigable)paramList[paramList.Count - 1].Represented).Expandable);
                }
                else
                {
                    expandable.Add(g, false);
                }
            }

            //now that we know the types of the variables, let's evaluate each match
            List<InvokableMember> finalMatches = candidates;
            List<InvokableMember> primaryMatches = new List<InvokableMember>();
            List<InvokableMember> secondaryMatches = new List<InvokableMember>();
            List<InvokableMember> tertiaryMatches = new List<InvokableMember>();
            primaryMatches.AddRange(candidates);//start by assuming everyone is a primary match

            //This loop has to be right size for multiple parameter sizes.
            //paramTypes is N long, but matching methods may have k<N or k=N+1 variables. We need to account for both cases.
            for (int i = 0; i < paramTypes.Count; i++)
            {
                if (paramTypes[i] != TypeDefinition.VoidType)
                {
                    //if the actual parameter node is null, this because we cannot firmly type it
                    //therefore there can be no changes to the matches; anything which enters here
                    //would compare a type with a known type.
                    foreach (InvokableMember c in finalMatches)
                    {
                        int myIndex = i;//assume the index for the candidate is the same as the actual parameter
                        if (expandable[c] && i >= candidateParams[c].Count)//this handles the case of k<N variables
                        {
                            //for any expandable node and we are in the expanded section
                            //update the index to the expandable node if this is the last or expanded nodes
                            myIndex = candidateParams[c].Count - 1;
                        }
                        //in the case of k=N+1 there is no worry. We don't need to look at the N+1th parameter at all.

                        if (templates[c][myIndex])
                        {
                            //if the other is also a template, however, we want to favor the
                            //template to template match as a primary
                            //Otherwise, a template becomes only a secondary match
                            if (paramTypes[i].Represented.Code.Length != 1 && primaryMatches.Contains(c))
                            {
                                secondaryMatches.Add(c);
                                primaryMatches.Remove(c);
                            }
                        }
                        else if (!candidateParams[c][myIndex].IsDecendantOf(paramTypes[i]))
                        {
                            //if we have a known paramType for the actual parameter and 
                            //we can't prove that this is a descendent of that type, then
                            //this cannot be a match at all and we should move it to tertiary matches

                            //this tends to throw out a number of cases where two types are compatible, 
                            //so they aren't recognized, but they are not necessarily wrong (i.e. Integer and Double)
                            primaryMatches.Remove(c);
                            secondaryMatches.Remove(c);
                            tertiaryMatches.Add(c);
                        }
                    }
                }
            }

            if (primaryMatches.Count > 0)
            {
                //if we still have primary matches, that means the secondary matches (if they exist) are less accurate
                finalMatches = primaryMatches;
            }
            else
            {
                //if we have no primary matches, the secondary matches become the only acceptable matches.
                finalMatches = secondaryMatches;
                finalMatches.AddRange(tertiaryMatches);//add on tertiary in all cases
            }

            if (finalMatches.Count == 1)
            {
                return finalMatches[0];
            }

            if (finalMatches.Count == 0)
            {
                //obviously something has gone wrong so we'll ask the human about all options.
                finalMatches = candidates;
            }

            //match algorithm was unsuccessful. Requires human intervention or better algorithm.
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < paramTypes.Count; i++)
            {
                if (paramTypes[i] == TypeDefinition.VoidType)
                {
                    //this is absolutely no help, so we'll print the tree at this point.
                    myParams[i].PrintTreeText(sb);
                }
                else
                {
                    sb.Append(paramTypes[i].Represented.Code);
                    sb.Append("\n");
                }
            }

            List<string> candidateSignatures = new List<string>();
            StringBuilder sb2 = new StringBuilder();
            for (int i = 0; i < finalMatches.Count; i++)
            {
                List<TypeDefinition> paramList = candidateParams[finalMatches[i]];
                sb2.Clear();
                List<List<TypeDefinition>> subs = subCandidates[finalMatches[i]];
                for (int j = 0; j < paramList.Count; j++)
                {
                    sb2.Append(paramList[j].Represented.Code);
                    if (subs[j].Count > 0)
                    {
                        sb2.Append("<");
                        sb2.Append(subs[j][0].Represented.Code);
                        for (int k = 1; k < subs[j].Count; k++)
                        {
                            sb2.Append(", ");
                            sb2.Append(subs[j][k].Represented.Code);
                        }
                        sb2.Append(">");
                    }

                    for (int a = 0; a < candidateArray[finalMatches[i]][j]; a++)
                    {
                        sb2.Append(" []");
                    }

                    if (j == paramList.Count - 1 && expandable[finalMatches[i]])
                    {
                        sb2.Append(" ...");
                    }
                    sb2.Append("\t");
                }

                candidateSignatures.Add(sb2.ToString());
            }

            if (verboseMatch)
            {
                lock (MatcherLock)
                {
                    System.Media.SystemSounds.Asterisk.Play();
                    MethodMatcher matcher = new MethodMatcher(unknownMethod, sb.Replace("\n", "\r\n").ToString(), candidateSignatures);
                    Console.WriteLine(unknownMethod);
                    Console.WriteLine(unknownMethod.FileName);
                    Console.WriteLine(sb.ToString());
                    foreach (string sign in candidateSignatures)
                    {
                        Console.WriteLine("\t" + sign);
                    }
                    matcher.ShowDialog();
                    Console.WriteLine("----ANSWER----");
                    Console.WriteLine(candidateSignatures[matcher.AnswerIndex]);
                    Console.WriteLine();
                    return finalMatches[matcher.AnswerIndex];
                }
            }
            else
            {
                return finalMatches[0];
            }
        }

        internal void LinkReturnStatement(List<INavigable> returnMembers, ChainArgs args)
        {
            //Link return members
            foreach (INavigable r in returnMembers)
            {
                GraphNode iReturnToHim = args.ParameterScope.FindChainEnd(r, args);
                iReturnToHim.AddRelationship(this, Relationship.CandidateRead, args.OriginStatement);
                this.AddRelationship(iReturnToHim, Relationship.ReturnValue, args.OriginStatement);
            }
        }
    }
}
