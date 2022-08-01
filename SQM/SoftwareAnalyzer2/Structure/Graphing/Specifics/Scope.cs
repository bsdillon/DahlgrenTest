using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Scope : DefinedMember
    {
        private List<DefinedMember> allMembers = new List<DefinedMember>();
        private List<Scope> subScopes = new List<Scope>();

        public Scope(INode node)
        {
            represented = node;
        }

        #region Registration
        /// <summary>
        /// Identifies all the elements within the scope and registers those elements
        /// </summary>
        public void Register()
        {
            INavigable scopeNode = (INavigable)represented;

            foreach (INavigable a in scopeNode.Children)
            {
                if (a.Node.Equals(MemberSets.Fields))
                {
                    foreach (INavigable field in a.Children)
                    {
                        new Field(field).Register(allMembers, this);
                    }
                }
                else if (a.Node.IsControlStructure)
                {
                    DefinedMember.CreateDefinedMember(a).Register(allMembers, this);
                }
                else if (a.Node.Equals(Members.Scope))
                {
                    Scope other = new Scope(a);
                    other.Register();
                    other.ParentScope = this;
                    subScopes.Add(other);
                }
                else
                {
                    List<INavigable> answer = new List<INavigable>();
                    a.FullRecursiveSearch(Members.AnonymousLink,answer);

                    foreach (INavigable l in answer)
                    {
                        ParentScope.AddAnonymousLink(ParentScope, l);
                    }
                }
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            foreach (DefinedMember d in allMembers)
            {
                d.InitialLink();
            }

            foreach (Scope s in subScopes)
            {
                s.InitialLink();
            }
        }

        public override void FullLink()
        {
            INavigable treeNode = (INavigable)represented;

            //find the parent method by ascending scope hierarchy.
            GraphNode tempMethod = this;
            while (!tempMethod.Represented.Node.IsMethodDefinition)
            {
                tempMethod = tempMethod.ParentScope;
            }
            InvokableMember method = (InvokableMember)tempMethod;

            //full link all the defined members
            foreach (DefinedMember d in allMembers)
            {
                d.FullLink();
            }

            foreach (Scope s in subScopes)
            {
                s.FullLink();
            }

            //link other statements in this scope
            foreach (INavigable a in treeNode.Children)
            {
                NodeType type = a.Node;
                if (type.IsDefinedMember)
                {
                    ChainArgs ca = new ChainArgs(this, true, new Statement(this, a), false);
                    //ca.LastMember = method;//is this a good idea? It will link every call to the scope which starts it.
                    DefinedMember def = FindChainEnd(a, ca);
                }
                else if (type.Equals(Members.Return))
                {
                    //skipping any empty return statements (i.e. the method returns void)
                    if (a.GetChildCount() > 0)
                    {
                        //this return statement is unique.
                        Statement statement = new Statement(this, a);

                        //parse all expressions to find return members
                        List<INavigable> returnMembers = new List<INavigable>();
                        ChainArgs args = new ChainArgs(this, true, statement, false);
                        ParseExpression(a.GetNthChild(0), returnMembers, args);

                        //link return statement to method
                        args = new ChainArgs(this, true, statement, false);

                        method.LinkReturnStatement(returnMembers, args);
                    }
                }
                else if (type.Equals(Members.Cast))
                {
                    HandleCast(a, new ChainArgs(this, true, new Statement(this, a), false));
                }
                else if (type.Equals(Members.Exception))
                {
                    //no op for exceptions
                }
                else if (type.IsControlStructure || type.Equals(MemberSets.Fields))
                {
                    //no operation for defined members already linked to this scope
                }
                else if (type.Equals(Members.Scope))
                {
                    //no operation for scope linked earlier
                }
                else if (type.Equals(Members.Assertion))
                {
                    //no-op; assertions are only to be used as part of a testing cycle. I don't want them to be
                    //counted as part of the regular use cases, etc. even if the developer is so poor a programmer.
                }
                else if (type.Equals(Members.Label) || type.Equals(Members.Break) || type.Equals(Members.Continue))
                {
                    //no-op; could be linked with the break or continue when those appear.
                }
                else if (type.Equals(Members.Operator) || type.Equals(Members.Boolean_Not) || type.Equals(Members.Boolean_Or)
                    || type.Equals(Members.Boolean_Equal) || type.Equals(Members.Boolean_NotEqual) || type.Equals(Members.Boolean_LessThan)
                    || type.Equals(Members.Boolean_GreaterThan) || type.Equals(Members.Boolean_LessThanEqual)
                    || type.Equals(Members.Boolean_GreaterThanEqual))
                {
                    //no op for operators which aren't assigned to any variables
                }
                else
                {
                    //Very messy logically, but this will catch anything else which comes in a scope.
                    //Because all expected cases are already covered, unexpected cases are illegal and
                    //must prompt an error message.
                    throw new InvalidCastException("LinkScope found unhandled " + type + " within method " + method.Represented);
                }
            }
        }

        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            //search for recognizable identifier among scope fields
            foreach (DefinedMember d in allMembers)
            {
                if (d.Represented.Code.Equals(targetNode.Code))
                {
                    return d;
                }
            }
            return null;
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            DefinedMember d = SearchFields(targetNode);
            if (d != null)
            {
                return d;
            }

            return ParentScope.TruncatedSearch(targetNode, parameterScope, halt);
        }
        #endregion

        private bool normalScope = true;

        internal void MakeLinkable()
        {
            normalScope = false;
        }

        protected override void LinkAccess(GraphNode IAccessHim, GraphNode IAmAccessedByHim, Statement s)
        {
            if (normalScope)
            {
                //no op for scopes
            }
            else
            {
                base.LinkAccess(IAccessHim, IAmAccessedByHim, s);
            }
        }

        public override void SimulateLinking(INode rType)
        {
            throw new InvalidOperationException("SimulatedLinking no valid for Scope.");
        }

        public override TypeDefinition AssociatedType
        {
            get
            {
                throw new InvalidOperationException("No type associated with Scope.");
            }
        }

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

            foreach (DefinedMember d in allMembers)
            {
                d.ExploreGraph(ExploreModes.Full);
            }

            foreach (Scope d in subScopes)
            {
                d.ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            foreach (DefinedMember d in allMembers)
            {
                WriteMember(d);
            }

            foreach (Scope d in subScopes)
            {
                WriteMember(d);
            }
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    INode otherNode = gn.Represented;
                    bool sameLine = represented.OnSameLineAs(otherNode);
                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                    bool sameRepresentative = represented.Equals(otherNode);

                    bool answer = (sameCode && sameLine && sameRepresentative);

                    return answer;
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
