using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Branch : ControlStructure
    {
        private Scope thenScope, elseScope;

        public Branch(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;
            AddControlExpression(myNavigable.GetNthChild(0));

            //Add the scope for each branch and recurse
            thenScope = RegisterScope(myNavigable.GetNthChild(1).GetNthChild(0));

            INavigable scope = myNavigable.GetNthChild(2).GetNthChild(0);//else scope
            if (scope.GetChildCount() > 0)
            {
                //only else scopes with actual contents are added.
                //this prevents empty else blocks which are equivalent to the then block above.
                elseScope = RegisterScope(scope);
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            thenScope.InitialLink();

            if (elseScope != null)
            {
                elseScope.InitialLink();
            }
        }

        public override void FullLink()
        {
            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));

            thenScope.FullLink();

            if (elseScope != null)
            {
                elseScope.FullLink();
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

            thenScope.ExploreGraph(ExploreModes.Full);

            if (elseScope != null)
            {
                elseScope.ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            WriteMember(thenScope);

            if (elseScope != null)
            {
                WriteMember(elseScope);
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
                    bool sameFile = represented.FileName.Equals(otherNode.FileName);

                    return sameFile && sameLine;
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
