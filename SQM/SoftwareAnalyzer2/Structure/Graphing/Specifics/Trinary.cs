using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Trinary : ControlStructure
    {
        private Scope right, wrong;

        public Trinary(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable a = (INavigable)represented;
            //register the boolean
            AddControlExpression(a.GetNthChild(0));


            //register the right/wrong scopes
            INavigable scope = a.GetNthChild(1);
            right = RegisterScope(scope.GetNthChild(0));
            right.MakeLinkable();
            wrong = RegisterScope(scope.GetNthChild(1));
            wrong.MakeLinkable();
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
        }

        private List<INavigable> branchMembers = new List<INavigable>();

        public override void FullLink()
        {
            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));

            LinkScope(right);
            LinkScope(wrong);
        }

        private void LinkScope(Scope sub)
        {
            List<INavigable> set = new List<INavigable>();
            ChainArgs args = new ChainArgs(sub, true, new Statement(sub, sub.Represented), false);
            ParseExpression((INavigable)sub.Represented, set, args);

            foreach (INavigable n in set)
            {
                NodeType type = n.Node;
                if (type.Equals(Members.Literal))
                {
                    sub.LinkChainMember(n, Literal.Create(n, sub), null, args);
                }
                else if (type.IsDefinedMember)
                {
                    DefinedMember def = sub.FindChainEnd(n, args);
                }
                else if (type.Equals(Members.ArrayInvoke))
                {
                    DefinedMember def = SearchUpToType().FindChainEnd(n, args);
                }
                else
                {
                    throw new InvalidOperationException("Unknown node type " + n + " in Trinary branch " + this);
                }
            }

            branchMembers.AddRange(set);
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

            right.ExploreGraph(ExploreModes.Full);
            wrong.ExploreGraph(ExploreModes.Full);
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            WriteMemberOf(ParentScope);

            WriteMember(right);
            WriteMember(wrong);
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

                    return (sameLine && sameCode && sameRepresentative);
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        internal List<INavigable> GetBranchMembers()
        {
            return branchMembers;
        }
    }
}
