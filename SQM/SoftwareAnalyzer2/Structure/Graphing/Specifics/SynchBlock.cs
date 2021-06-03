using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    class SynchBlock : ControlStructure
    {
        private Scope myscope, mylock;

        public SynchBlock(INode node)
        {
            represented = node;
        }

        #region Register
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;

            mylock = RegisterScope(myNavigable.GetFirstSingleLayer(Members.Lock));
            myscope = RegisterScope(myNavigable.GetFirstSingleLayer(Members.Scope));
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            myscope.InitialLink();
        }

        public override void FullLink()
        {
            myscope.FullLink();
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

            mylock.ExploreGraph(ExploreModes.Full);
            myscope.ExploreGraph(ExploreModes.Full);
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            WriteMember(mylock);
            WriteMember(myscope);
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
