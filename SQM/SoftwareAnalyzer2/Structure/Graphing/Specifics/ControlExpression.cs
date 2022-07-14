using SoftwareAnalyzer2.Structure.Graphing.Specifics;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    class ControlExpression : GraphNode
    {
        public ControlExpression(INavigable n, ChainArgs args)
        {
            ParseControlExpression(n, args);
        }

        public void ParseControlExpression(INavigable control, ChainArgs args)
        {
            foreach (INavigable n in control.Children)
            {           
                //to avoid confluence of chains for separate simple boolean expressions 
                //we need to create new chain args for each sub-statatment
                ChainArgs nextArgs = new ChainArgs(args.ParameterScope, args.CheckOtherChildren, args.OriginStatement, false);
                if(n.Node.Equals(Members.Trinary))
                {
                    List<INavigable> answer = LinkTrinary(n, nextArgs);
                    foreach (INavigable a in answer)
                    {
                        LinkControlExpression(a, nextArgs, Relationship.Control);
                    }
                }
                else if (n.Node.IsBooleanExpression)
                {
                    ParseControlExpression(n, nextArgs);
                }
                else if (n.Node.IsBooleanBoundary)
                {
                    BoundaryCheck(n, nextArgs);
                }
                else if (n.Node.IsBooleanEquality)
                {
                    EqualityExpression(n, nextArgs);
                }
                else if(n.Node.IsDefinedMember || n.Node.Equals(Members.Literal) || n.Node.Equals(Members.Primitive))
                {
                    ValueCheck(n, nextArgs);
                }
                else if(n.Node.Equals(Members.Operator))
                {
                    ParseControlExpression(n, nextArgs);
                }
                else if (n.Node.Equals(Members.Cast))
                {
                    INavigable keyObject = n.GetNthChild(1);
                    DefinedMember def = args.ParameterScope.FindChainEnd(keyObject, nextArgs);//follow the variable

                    //TODO The logic below is only interested in 3 elements. 
                    //Determine what if anything should be done with other numbers

                    if (n.GetChildCount() == 3)
                    {
                        //there is a dot after the type so we need to link the cast object and change 
                        //our keyObject to that dot set.

                        TypeDefinition d = args.ParameterScope.SearchScopeForType(n.GetNthChild(0).GetNthChild(0).Code);
                        def = d.FindChainEnd(n.GetNthChild(2).GetNthChild(0), nextArgs);

                        //if a function or field is being accessed through this means, it should be tagged as a state action.
                        LinkControlExpression(def, nextArgs, Relationship.Control);
                    }
                }
                else if (n.Node.Equals(Members.LanguageTypeCheck))
                {
                    TypeCheck(n, nextArgs);
                }
                else if (n.Node.Equals(Members.Type)) // && language is CPP Lang
                {
                    if((n.Parent.GetChildCount() == 2) && (n.Parent.GetFirstSingleLayer(Members.Variable) != null))
                    {
                        //n.Node.IsDefinedMember should be true
                        ValueCheck(n.Parent.GetFirstSingleLayer(Members.Variable).GetFirstSingleLayer(Members.Write).GetFirstSingleLayer(Members.Literal), nextArgs);
                    }
                    else
                    {
                        throw new InvalidOperationException("Unknown element of boolean expression " + n);
                    }
                }
                else
                {
                    throw new InvalidOperationException("Unknown element of boolean expression " + n);
                }
            }
        }

        protected void LinkControlExpression(INavigable control, ChainArgs args, Relationship r)
        {
            DefinedMember def = args.ParameterScope.FindChainEnd(control, args);
            LinkControlExpression(def, args, r);
        }

        protected void LinkControlExpression(DefinedMember def, ChainArgs args, Relationship r)
        {
            def.AddRelationship(args.ParameterScope, Relationship.CandidateRead, args.OriginStatement);
            args.ParameterScope.AddRelationship(def, r, args.OriginStatement);
            def.AddRelationship(args.ParameterScope, r, args.OriginStatement);

            //if (!def.IsSimulated && !def.Represented.Node.Equals(Members.Literal) && def.ParentScope.Represented.Node.Equals(Members.TypeDeclaration))
            //{
            //    Console.WriteLine(r + "\t" + def.Represented + "\t" + def.Represented.FileName + "\t" + def.GetRelationshipCount(r) + "\t" + args.OriginStatement + "\t" + args.OriginStatement.Represented.FileName);
            //}
        }

        private void BoundaryCheck(INavigable n, ChainArgs args)
        {
            if (n.GetNthChild(0).Node.Equals(Members.Literal))
            {
                CheckRelationship(n.GetNthChild(1), args, Relationship.LiteralBoundary);
            }
            else if (n.Children[1].Node.Equals(Members.Literal))
            {
                CheckRelationship(n.GetNthChild(0), args, Relationship.LiteralBoundary);
            }
            else
            {
                CheckRelationship(n.GetNthChild(0), args, Relationship.CompareBoundary);
                CheckRelationship(n.GetNthChild(1), args, Relationship.CompareBoundary);
            }
        }

        public void TypeCheck(INavigable n, ChainArgs args)
        {
            LinkControlExpression(n.GetNthChild(0), args, Relationship.TypeCheck);
        }

        public void EqualityExpression(INavigable n, ChainArgs args)
        {
            INavigable n0 = n.GetNthChild(0);
            INavigable n1 = n.GetNthChild(1);

            if(Literal.IsNull(n0))
            {
                CheckRelationship(n1, args, Relationship.NullCheck);
            }
            else if (Literal.IsNull(n1))
            {
                CheckRelationship(n0, args, Relationship.NullCheck);
            }
            else if (n0.Node.Equals(Members.Literal))
            {
                CheckRelationship(n1, args, Relationship.LiteralCheck);
            }
            else if (n1.Node.Equals(Members.Literal))
            {
                CheckRelationship(n0, args, Relationship.LiteralCheck);
            }
            else
            {
                //ignores cases where the n0 or n1 is some expressionw 
                //which doesn't immediately descend to a field/method
                CheckRelationship(n0, args, Relationship.EqualityCheck);
                CheckRelationship(n1, args, Relationship.EqualityCheck);
            }
        }

        private void CheckRelationship(INavigable n, ChainArgs args, Relationship r)
        {
            //this is being checked for a null value
            List<INavigable> answer = new List<INavigable>();
            ParseExpression(n, answer, args);

            foreach (INavigable a in answer)
            {
                LinkControlExpression(a, args, r);
            }
        }

        public void ValueCheck(INavigable n, ChainArgs args)
        {
            //this is an expression which contains various parts. 
            //Do we need to parse the whole thing?

            List<INavigable> answer = new List<INavigable>();
            ParseExpression(n, answer, args);

            foreach (INavigable a in answer)
            {
                LinkControlExpression(a, args, Relationship.Control);
            }
        } 

        public override void InitialLink()
        {
            throw new NotImplementedException();
        }

        public override void FullLink()
        {
            throw new NotImplementedException();
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            throw new NotImplementedException();
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new NotImplementedException();
        }

        public override void ExploreGraph(GraphNode.ExploreModes mode)
        {
            throw new NotImplementedException();
        }
    }
}
