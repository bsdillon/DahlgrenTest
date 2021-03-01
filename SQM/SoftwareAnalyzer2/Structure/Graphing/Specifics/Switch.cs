using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Switch : ControlStructure
    {
        private List<Scope> blocks = new List<Scope>();

        public Switch(INode node)
        {
            represented = node;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;

            //Need to add the scope of the switch value
            AddControlExpression(myNavigable.GetNthChild(0));

            foreach (INavigable c in myNavigable.GetNthChild(1).Children)
            {
                Scope s = new Scope(c.GetNthChild(1));
                blocks.Add(s);
                s.ParentScope = this;
                s.Register();
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            foreach (Scope b in blocks)
            {
                b.InitialLink();
            }
        }

        public override void FullLink()
        {
            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));

            foreach (Scope s in blocks)
            {
                s.FullLink();
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

            foreach (Scope s in blocks)
            {
                s.ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            foreach (Scope s in blocks)
            {
                WriteMember(s);
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
