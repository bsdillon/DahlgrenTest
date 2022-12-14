using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Literal : DefinedMember
    {
        private TypeDefinition definition = null;
        public override TypeDefinition AssociatedType
        {
            get
            {
                return definition;
            }
        }

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
        }

        public override void SimulateLinking(INode rType)
        {
            throw new InvalidOperationException("SimulatedLinking is not allowed from Literal");
        }

        private Literal()//prevents another type from instantiating this class
        {
        }

        public override void InitialLink()
        {
            //no op
        }

        public override void FullLink()
        {
            //no op
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new InvalidOperationException("TruncatedSearch is not allowed for Literal");
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            throw new InvalidOperationException("FindChainEnd is not allowed for Literal");
        }

        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            throw new InvalidOperationException("SearchFields is not allowed for Literal");
        }

        public static Literal Create(INode targetNode, GraphNode parameterScope)
        {
            //assume that node new instance is needed
            Literal instance = new Literal();
            instance.represented = targetNode;

            //Use the linker to find the type defined for this literal
            string code = ((INavigable)targetNode).GetFirstSingleLayer(Members.Type).GetNthChild(0).Code;
            instance.definition = TypeDefinition.GetNativeType(code);
            
            //Add the new instance OR accept node previous definition of the literal
            return instance.definition.AddLiteralInstance(instance);
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    Literal other = (Literal)gn;
                    INode otherNode = other.represented;
                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                    bool sameDefinition = AssociatedType.Equals(other.AssociatedType);

                    return sameDefinition && sameCode;
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        internal static bool IsNull(INavigable navigable)
        {
            return (navigable.Node.Equals(Members.Literal) && navigable.Code.Equals("null"));
        }
    }
}
