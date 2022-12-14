using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public abstract class ControlStructure : DefinedMember
    {
        public override TypeDefinition AssociatedType
        {
            get
            {
                throw new InvalidOperationException("Definition is not allowed from ControlStructure");
            }
        }

        public override void SimulateLinking(INode rType)
        {
            throw new InvalidOperationException("SimulatedLinking is not allowed from ControlStructure");
        }

        #region Boolean
        protected Scope myControl;

        public GraphNode AddControlExpression(INode b)
        {
            myControl = new Scope(b);
            return myControl;
        }

        public GraphNode GetBoolean()
        {
            return myControl;
        }
        #endregion

        #region Registration
        protected Scope RegisterScope(INode scopeNode)
        {
            Scope answer = new Scope(scopeNode);
            answer.ParentScope = this;
            answer.Register();
            return answer;
        }
        #endregion

        #region Fields
        protected List<DefinedMember> AllFields = new List<DefinedMember>();

        protected void RegisterFields(INavigable fieldSet)
        {
            if (fieldSet != null)
            {
                List<INavigable> fields = fieldSet.Children;

                foreach (INavigable field in fields)
                {
                    new Field(field).Register(AllFields, this);
                }
            }

        }
        #endregion

        #region Linking
        protected override DefinedMember SearchFields(INavigable targetNode)
        {
            if (targetNode.Node.Equals(Members.Variable))
            {
                foreach (Field f in AllFields)
                {
                    if (f.Represented.Code.Equals(targetNode.Code))
                    {
                        return f;
                    }
                }
                //variable not found in this scope, may be in parent scope
            }
            return null;
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            DefinedMember f = SearchFields(targetNode);
            if (f != null)
            {
                return f;
            }
            return ParentScope.TruncatedSearch(targetNode, parameterScope, halt);
        }

        public override DefinedMember DotOperator(INavigable nextMember, ChainArgs args)
        {
            throw new InvalidOperationException("DotOperator is not allowed from ControlStructure");
        }
        #endregion
    }
}
