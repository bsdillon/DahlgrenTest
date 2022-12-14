using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Statement : GraphNode
    {
        public Statement(GraphNode parent, INode lineSource)
        {
            ParentScope = parent;
            represented = NodeFactory.CreateNode(Members.Statement, "", false);
            ((IModifiable)represented).SetLine((IModifiable)lineSource);
            ((IModifiable)represented).CopyFile((IModifiable)lineSource);
        }

        public override void ExploreGraph(ExploreModes mode)
        {
            SaveThisNode();
        }

        public override void InitialLink()
        {
            throw new InvalidOperationException("InitialLink is not allowed from Statement");
        }

        public override void FullLink()
        {
            throw new InvalidOperationException("FullLink is not allowed from Statement");
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            throw new InvalidOperationException("FindChainEnd is not allowed from Statement");
        }

        public override DefinedMember TruncatedSearch(Node.INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new InvalidOperationException("TrucatedSearch is not allowed from Statement");
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    //both are statements
                    Statement other = (Statement)gn;

                    if (ParentScope.Equals(other.ParentScope))
                    {
                        //both are on the same scope
                        return represented.Equals(other.represented);
                    }
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
