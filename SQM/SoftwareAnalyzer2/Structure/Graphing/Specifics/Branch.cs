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

        public List<Tuple<int,int>> GetBranchLineNums()
        {
            List<Tuple<int, int>> branches = new List<Tuple<int, int>>();
            //have to check for null because some branches don't have then/elsescopes
            if(thenScope != null)
            {
                Tuple<int, int> thenTup = Tuple.Create(thenScope.Represented.GetLineStart(), thenScope.Represented.GetLineStop());
                branches.Add(thenTup);
            }
            if(elseScope != null)
            {
                Tuple<int, int> elseTup = Tuple.Create(elseScope.Represented.GetLineStart(), elseScope.Represented.GetLineStop());
                branches.Add(elseTup);
            }
            //return a list of tuples containing start line and stop lines
            return branches;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);
            INavigable myNavigable = (INavigable)represented;
            AddControlExpression(myNavigable.GetFirstSingleLayer(Members.Boolean));
            //Add the scope for each branch and recurse

            thenScope = RegisterScope(myNavigable.GetFirstSingleLayer(Members.Then).GetFirstSingleLayer(Members.Scope));
            //No gaurantees of an else statement
            if(myNavigable.GetFirstSingleLayer(Members.Else) != null && myNavigable.GetFirstSingleLayer(Members.Else).GetChildCount() != 0)
            {
                INavigable scope = myNavigable.GetFirstSingleLayer(Members.Else).GetFirstSingleLayer(Members.ElseScope);
                if (scope.GetChildCount() > 0)
                {
                    //only else scopes with actual contents are added.
                    //this prevents empty else blocks which are equivalent to the then block above.
                    elseScope = RegisterScope(scope);
                }
            }
            if(myNavigable.GetFirstSingleLayer(MemberSets.Fields) != null)
            {
                RegisterFields(myNavigable.GetFirstSingleLayer(MemberSets.Fields));
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
            foreach (Field f in AllFields)
            {
                f.InitialLink();
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
            foreach (Field f in AllFields)
            {
                f.FullLink();
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

            foreach (DefinedMember d in AllFields)
            {
                d.ExploreGraph(ExploreModes.Full);
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
            foreach (DefinedMember d in AllFields)
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
