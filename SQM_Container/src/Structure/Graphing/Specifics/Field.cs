using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Source;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Field : DefinedMember
    {
        private Members fieldType = Members.Field;

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

        private bool IsSelfReference = false;
        internal void MakeReference()
        {
            IsSelfReference = true;
        }

        public override void AddRelationship(GraphNode g, Relationship r, Statement s)
        {
            //for selfReferential fields, abort candidate linking
            if (IsSelfReference && r==Relationship.CandidateRead)
            {
                return;
            }
            base.AddRelationship(g, r, s);
        }

        public Field(INode n)
        {
            Members type = n.Node.GetMembers();
            if (!(type == Members.Parameter || type == Members.Field || type == Members.Value))
            {
                throw new InvalidCastException("Fields must be variables or fields. Type " + type + " is undefined");
            }

            fieldType = type;
            represented = n;
        }

        #region Registration
        public override void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            base.Register(memberList, parentScope);

            List<INavigable> potentialLinks = new List<INavigable>();
            List<INavigable> confirmedLinks = new List<INavigable>();
            ((INavigable)represented).FullRecursiveSearch(Members.ConstructorInvoke, potentialLinks);
            foreach (INavigable l in potentialLinks)
            {
                INavigable n = l.GetFirstSingleLayer(Members.AnonymousLink);
                if (n != null)
                {
                    ParentScope.AddAnonymousLink(ParentScope, n);
                }
            }
        }

        public void SimulateFieldType(TypeDefinition d)
        {
            INavigable type = (INavigable)NodeFactory.CreateNode(Members.Type, false);
            INavigable typeNode = (INavigable)NodeFactory.CreateNode(Members.TypeName, d.Represented.Code, false);
            typeNode.Parent = type;
            type.Parent = (INavigable)represented;
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            if (fieldType == Members.Value)
            {
                definition = TypeDefinition.GetNativeType(ApprovedLiterals.Enum.ToString());
            }
            else
            {
                INavigable type = ((INavigable)represented).GetFirstSingleLayer(Members.Type);
                INavigable sub = type.GetFirstSingleLayer(Members.Sub_Type);
                List<INavigable> subtypes = new List<INavigable>();
                List<INode> subtypesI = new List<INode>();
                if (sub != null)
                {
                    subtypes = sub.Children;
                    subtypesI = new List<INode>();
                    if (subtypes.Count > 0)
                    {
                        foreach (INavigable a in subtypes)
                        {
                            subtypesI.Add(a.GetNthChild(0));
                        }
                    }
                }

                //find type definition and link
                TypeDefinition headType = SearchUpToType();
                ChainArgs args = new ChainArgs(this, false, new Statement(this, represented), false);
                int aCount;
                definition = headType.FindNestedType(type.GetNthChild(0), args, out aCount);
                definition.AddInstantiation(this);
                arrayCount = aCount;

                //find sub type definitions and link
                foreach (INode n in subtypesI)
                {
                    int x;
                    TypeDefinition subType = headType.FindNestedType((INavigable)n, args, out x);
                    subTypes.Add(subType);
                    subType.AddSubTypeInstantiation(this);
                }
            }

            INavigable mSet = ((INavigable)this.represented).GetFirstSingleLayer(MemberSets.ModifierSet);
            List<INavigable> modifiers = new List<INavigable>();
            if (mSet != null)
            {
                modifiers = mSet.Children;
            }

            foreach (INavigable modifier in modifiers)
            {
                this.AddRelationship(new Annotation(modifier), Relationship.Annotation, new Statement(this, modifier));
            }
        }

        public override void SimulateLinking(INode rType)
        {
            definition = SearchScopeForType(rType.Code);
        }

        public override void FullLink()
        {
            Statement statement = new Statement(this, represented);
            ChainArgs args = new ChainArgs(ParentScope, true, statement, false);
            if (represented.Node.Equals(Members.Value))
            {
                //there is no write block associated with a value.
                return;
            }

            //find the variable which is the head of any write operation
            INavigable var = ((INavigable)represented).GetFirstSingleLayer(Members.Variable);

            //look at the write if it exists and attribute usage
            if (var.GetChildCount() > 0)
            {
                //parse all expressions to find write members
                List<INavigable> writeMembers = new List<INavigable>();
                ParseExpression(var.GetNthChild(0), writeMembers, args);

                //Link write members
                foreach (INavigable r in writeMembers)
                {
                    LinkWrite(this, ParentScope.FindChainEnd(r, args), statement);
                }
            }
            else
            {
                //there is no write, so this must be associated with the default value
                LinkWrite(this, AssociatedType.DefaultValue, statement);
            }
        }
        
        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new InvalidOperationException("TruncatedSearch not allowed from Field");
        }

        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            throw new InvalidOperationException("SearchFields not allowed from Field");
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            throw new InvalidOperationException("FindChainEnd not allowed from Field");
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

            AssociatedType.ExploreGraph(ExploreModes.Touch);

            foreach (TypeDefinition s in SubTypes)
            {
                s.ExploreGraph(ExploreModes.Touch);
            }        
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    Field other = (Field)gn;
                    INode otherNode = gn.Represented;

                    //Fields should have specific common characteristics
                    bool sameType = fieldType == other.fieldType;
                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                    bool sameLine = represented.OnSameLineAs(otherNode);

                    //prior to registration fields have no registered definition. So this is a soft requirement
                    bool sameDefinition = (definition == null || other.definition == null) || AssociatedType.Equals(other.AssociatedType);

                    return (sameType && sameCode && sameLine && sameDefinition);
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
