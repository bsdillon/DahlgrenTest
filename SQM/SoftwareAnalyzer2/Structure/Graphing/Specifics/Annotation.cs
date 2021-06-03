using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Annotation : GraphNode
    {
        public Annotation(INode n)
        {
            this.represented = n;
        }

        public override void InitialLink()
        {
            throw new NotImplementedException();
        }

        public override void FullLink()
        {
            throw new NotImplementedException();
        }

        public override DefinedMember FindChainEnd(Node.INavigable targetNode, ChainArgs args)
        {
            throw new NotImplementedException();
        }

        public override DefinedMember TruncatedSearch(Node.INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new NotImplementedException();
        }

        public override void ExploreGraph(GraphNode.ExploreModes mode)
        {
            SaveThisNode();

            if (mode == ExploreModes.Touch || explored)
            {
                return;
            }

            explored = true;
        }
    }
}
