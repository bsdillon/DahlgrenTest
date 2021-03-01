using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class ForThreeLoop : ControlStructure
    {
        private Scope loop, update, initialExpressions;

        public ForThreeLoop(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;

            RegisterFields(myNavigable.GetFirstSingleLayer(MemberSets.Fields));
            initialExpressions = RegisterScope(myNavigable.GetFirstSingleLayer(Members.ForInitial));
            AddControlExpression(myNavigable.GetFirstSingleLayer(Members.Boolean));
            update = RegisterScope(myNavigable.GetFirstSingleLayer(Members.Update).GetNthChild(0));
            loop = RegisterScope(myNavigable.GetFirstSingleLayer(Members.Scope));
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            foreach (Field f in AllFields)
            {
                f.InitialLink();
            }

            loop.InitialLink();
        }

        public override void FullLink()
        {
            foreach (Field f in AllFields)
            {
                f.FullLink();
            }

            initialExpressions.FullLink();

            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));

            update.FullLink();

            loop.FullLink();
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

            foreach (DefinedMember d in AllFields)
            {
                d.ExploreGraph(ExploreModes.Full);
            }

            initialExpressions.ExploreGraph(ExploreModes.Full);

            loop.ExploreGraph(ExploreModes.Full);

            update.ExploreGraph(ExploreModes.Full);
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            foreach (DefinedMember d in AllFields)
            {
                WriteMember(d);
            }

            WriteMember(initialExpressions);
            WriteMember(loop);
            WriteMember(update);
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

                    //which of the above makes sense in this case
                    return sameLine;
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
