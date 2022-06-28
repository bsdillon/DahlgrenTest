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
            AddControlExpression(myNavigable.GetNthChild(0));
            //Add the scope for each branch and recurse
            //Why are we assuming a then/else scope?
            if (thenScope != null)
            {
                thenScope = RegisterScope(myNavigable.GetNthChild(1).GetNthChild(0));
            }
            if (myNavigable.GetChildCount() > 2)  
            {
                if (myNavigable.GetNthChild(2).GetChildCount() > 0) 
                {
                    INavigable scope = myNavigable.GetNthChild(2).GetNthChild(0);//else scope
                    if (scope.GetChildCount() > 0)
                    {
                        //only else scopes with actual contents are added.
                        //this prevents empty else blocks which are equivalent to the then block above.
                        elseScope = RegisterScope(scope);
                    }
                }
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            if (thenScope != null) //Not sure why this is the case with ifs without elses.
            {
                thenScope.InitialLink();
            }
            
            if (elseScope != null)
            {
                elseScope.InitialLink();
            }
        }

        public override void FullLink()
        {
            new ControlExpression((INavigable)myControl.Represented, new ChainArgs(this, true, new Statement(this, represented), false));
            if (thenScope != null)
            {
                thenScope.FullLink();
            }
            
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

            if (thenScope != null)
            {
                thenScope.ExploreGraph(ExploreModes.Full);
            }

            if (elseScope != null)
            {
                elseScope.ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            if (thenScope != null)
            {
                WriteMember(thenScope);
            }

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
