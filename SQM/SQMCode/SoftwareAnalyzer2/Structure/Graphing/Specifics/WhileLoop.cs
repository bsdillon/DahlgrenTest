using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class WhileLoop : ControlStructure
    {
        private Scope loop;
        private Members whileType;

        public WhileLoop(INode node, Members type)
        {
            if (!(type == Members.While || type == Members.DoWhile))
            {
                throw new InvalidCastException("While loops must be while or do-while. Type " + type + " is undefined");
            }

            represented = node;
            whileType = type;
        }

        #region Register
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;
            
            int count = myNavigable.GetChildCount();
            if ( count<1 || count>3 )
            {
                throw new IndexOutOfRangeException("Expected 1-3 children for While/doWhile but received " + count + " children"); 
            }

            List<INavigable> childs = myNavigable.Children;
            foreach(INavigable n in childs)
            {
                if(n.Node.Equals(Members.Scope))
                {
                    loop = RegisterScope(n);
                }
                else if (n.Node.Equals(Members.Boolean))
                {
                    AddControlExpression(n);
                }
                else if (n.Node.Equals(MemberSets.Fields))
                {
                    RegisterFields(n);
                }
            }
            
            
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

            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));

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
            foreach (DefinedMember d in AllFields)
            {
                d.ExploreGraph(ExploreModes.Full);
            }

            foreach (GraphNode g in FindRelationships())
            {
                g.ExploreGraph(ExploreModes.Touch);
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
                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                    bool sameRepresentative = represented.Equals(otherNode);

                    //which of the above makes sense in this case
                    return sameLine;
                }
                else
                {
                    return false;
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
