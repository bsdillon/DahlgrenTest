using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class TryCatch : ControlStructure
    {
        private Scope tryScope, catchScope;

        public TryCatch(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);

            INavigable myNavigable = (INavigable)represented;
            //both argList are scopes
            tryScope = RegisterScope(myNavigable.GetNthChild(0));
            catchScope = RegisterScope(myNavigable.GetNthChild(1));
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            tryScope.InitialLink();
            catchScope.InitialLink();
        }

        public override void FullLink()
        {
            tryScope.FullLink();
            catchScope.FullLink();
        }
        #endregion

        public override void ExploreGraph(ExploreModes mode)
        {
            SaveThisNode();

            if (mode==ExploreModes.Touch || explored)
            {
                return;
            }

            explored = true;

            foreach (GraphNode g in FindRelationships())
            {
                g.ExploreGraph(ExploreModes.Touch);
            }

            tryScope.ExploreGraph(ExploreModes.Full);

            catchScope.ExploreGraph(ExploreModes.Full);
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            WriteMember(tryScope);
            WriteMember(catchScope);
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
