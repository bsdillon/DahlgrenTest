using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class ForEachLoop : ControlStructure
    {
        private Scope loop;

        public ForEachLoop(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;

            //fields [0]
            RegisterFields(myNavigable.GetNthChild(0));

            //scope [1]
            loop = RegisterScope(myNavigable.GetNthChild(1));
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

            loop.ExploreGraph(ExploreModes.Full);
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            foreach (DefinedMember d in AllFields)
            {
                WriteMember(d);
            }

            WriteMember(loop);
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
