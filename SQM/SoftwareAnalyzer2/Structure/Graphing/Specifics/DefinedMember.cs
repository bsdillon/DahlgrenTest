using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public abstract class DefinedMember : GraphNode
    {
        public abstract TypeDefinition AssociatedType { get; }
        public abstract void SimulateLinking(INode rType);

        public void SetSimulated(bool value)
        {
            isSimulated = value;
        }

        public static DefinedMember CreateDefinedMember(INode node)
        {
            DefinedMember answer = null;

            switch (node.Node.GetMembers())
            {
                case Members.Method:
                    answer = new InvokableMember(node);
                    break;
                case Members.Inline:
                    answer = new InvokableMember(node);
                    break;
                case Members.Constructor:
                    answer = new InvokableMember(node);
                    break;
                case Members.ArrayInvoke:
                    answer = new AnonArray(node);
                    break;
                case Members.Field:
                    answer = new Field(node);
                    break;
                case Members.Parameter:
                    answer = new Field(node);
                    break;
                case Members.Value:
                    answer = new Field(node);
                    break;
                case Members.Branch:
                    answer = new Branch(node);
                    break;
                case Members.ForEachLoop:
                    answer = new ForEachLoop(node);
                    break;
                case Members.For3Loop:
                    answer = new ForThreeLoop(node);
                    break;
                case Members.Switch:
                    answer = new Switch(node);
                    break;
                case Members.Trinary:
                    answer = new Trinary(node);
                    break;
                case Members.Try_Catch:
                    answer = new TryCatch(node);
                    break;
                case Members.While:
                    answer = new WhileLoop(node, Members.While);
                    break;
                case Members.DoWhile:
                    answer = new WhileLoop(node, Members.DoWhile);
                    break;
                case Members.SynchBlock:
                    answer = new SynchBlock(node);
                    break;
                default:
                    throw new InvalidCastException("Unrecognized control structure type: " + node.Node);
            }

            return answer;
        }

        public virtual void Register(List<DefinedMember> memberList, GraphNode parentScope)
        {
            if (memberList.Contains(this))
            {
                throw new InvalidOperationException("Duplicate definition for " + this + " already found in " + parentScope);
            }
            memberList.Add(this);

            ParentScope = parentScope;
        }

        /// <summary>
        /// We are given a next member which will be called from the type of this member.
        ///     example : method().nextMember()
        /// Create a link between this member and the next.
        /// </summary>
        /// <param name="nextMember"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        public virtual DefinedMember DotOperator(INavigable nextMember, ChainArgs args)
        {
            args.LastMember = this;
            return AssociatedType.FindChainEnd(nextMember, args);
        }

        protected abstract DefinedMember SearchFields(INavigable targetNode);

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            DefinedMember answer = null;

            if (targetNode.Node.Equals(Members.Literal))
            {
                return LinkChainMember(targetNode, Literal.Create(targetNode, args.ParameterScope), GetDotChild(targetNode), args);
            }
            else if (targetNode.Node.Equals(Members.Variable))
            {
                DefinedMember d = SearchFields(targetNode);

                if (d != null)
                {
                    return LinkChainMember(targetNode, d, GetDotChild(targetNode), args);
                }
                else
                {
                    //variable not found in this scope, may be in parent scope
                    answer = ParentScope.FindChainEnd(targetNode, args);
                }
            }
            else if (targetNode.Node.Equals(Members.MethodInvoke))
            {
                //methods are only defined in types so we must search there
                answer = SearchUpToType().FindChainEnd(targetNode, args);
            }
            else if (targetNode.Node.IsTypeReference)
            {
                //all type references (constructors, this., super., etc.) are defined from a type.
                answer = SearchUpToType().FindChainEnd(targetNode, args);
            }
            else if (targetNode.Node.Equals(Members.ArrayInvoke))
            {
                //array invoke should be handled at the type level
                answer = SearchUpToType().FindChainEnd(targetNode, args);
            }
            else if (targetNode.Node.Equals(Members.LanguageTypeCheck))
            {
                //there is only one typeCheck method
                answer = InvokableMember.LanguageTypeCheck;
            }
            else if (targetNode.Node.Equals(Members.Cast))
            {
                answer = HandleCast(targetNode, args);
            }
            else if (targetNode.Node.Equals(Members.Trinary))
            {
                answer = new Trinary(targetNode);
            }
            else
            {
                throw new InvalidOperationException("Unknown search type " + targetNode.Node);
            }

            if (answer == null)
            {
                //This should never happen. Somewhere in the various search locations there should be a non-null answer.
                throw new NullReferenceException("SearchScopeFor failed to find a non-null definition for " + targetNode + " in any scope known to " + this.represented);
            }

            return answer;
        }
    }
}
