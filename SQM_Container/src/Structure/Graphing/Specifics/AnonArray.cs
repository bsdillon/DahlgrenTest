using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    class AnonArray : DefinedMember
    {
        private TypeDefinition definition;
        public override TypeDefinition AssociatedType
        {
            get
            {
                if (definition == null)
                {
                    throw new InvalidOperationException(this + " has no definition");
                }

                return definition;
            }
        }

        private List<TypeDefinition> subTypes = new List<TypeDefinition>();
        public List<TypeDefinition> SubTypes
        {
            get
            {
                List<TypeDefinition> answer = new List<TypeDefinition>();
                foreach (TypeDefinition t in subTypes)
                {
                    answer.Add(t);
                }

                return answer;
            }
        }

        private int arrayCount = 0;
        public int ArrayCount
        {
            get
            {
                return arrayCount;
            }
        }

        public AnonArray(INode n)
        {
            represented = n;
        }

        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);

            Statement s = new Statement(parentScope, represented);
            parentScope.AddRelationship(this, Relationship.Member, s);
            this.AddRelationship(parentScope, Relationship.MemberOf, s); 
        }

        public override void SimulateLinking(INode rType)
        {
            throw new InvalidOperationException("SimulatedLinking not allowed from AnonArray");
        }

        public override void InitialLink()
        {
            //find type definition and link
            definition = SearchScopeForType(represented.Code);
            definition.AddInstantiation(this);
        }

        static object LinkLock = new object();
        public override void FullLink()
        {
            Statement statement = new Statement(ParentScope,this.represented);
            lock (LinkLock)
            {
                INavigable myRep = (INavigable)represented;
                foreach (INavigable n in myRep.GetFirstSingleLayer(Members.ParameterList).Children)
                {
                    //get the individual members in the parameter
                    List<INavigable> actualMembers = new List<INavigable>();
                    ParseExpression(n, actualMembers, new ChainArgs(ParentScope, true, statement, false));

                    //for each one find the end of the chain
                    foreach (INavigable a in actualMembers)
                    {
                        LinkWrite(this, ParentScope.FindChainEnd(a, new ChainArgs(ParentScope, true, statement, false)), statement);
                    }
                }
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

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new InvalidOperationException("TruncatedSearch not allowed from AnonArray");
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            throw new InvalidOperationException("FindChainEnd not allowed from AnonArray");
        }

        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            throw new InvalidOperationException("SearchFields not allowed from AnonArray");
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                return gn.Represented == represented;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public bool IsDisposable { get; set; }
    }
}
