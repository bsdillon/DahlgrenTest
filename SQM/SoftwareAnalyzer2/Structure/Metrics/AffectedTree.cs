using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Graphing.Specifics;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace SoftwareAnalyzer2.Structure.Metrics
{
    class AffectedTree
    {
        private Dictionary<string, Dictionary<int, List<GraphNode>>> lineNumDict = GraphNode.GetLineNumDict();
        private AffectedLine al;

        public AffectedTree()
        {
        }

        public void FindCSVConnections(string fileName, int lineNum, string fileStem)
        {
            string outputFileName = "_errors_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter gFile = new StreamWriter(fullFile, true);

            List<GraphNode> relatedGNodes = lineNumDict[fileName][lineNum];

            al = new AffectedLine();
            //find all graphnodes that are related to the line number entered by the user
            FindAffectedNodes(relatedGNodes, gFile);
            
            //csv output
            al.OutputCSVErrors(gFile, fileName, lineNum);
            gFile.Close();
        }
        //luTODO -- make the tracing errors silent and output them within an output file
        private void FindAffectedNodes(List<GraphNode> gNodes, StreamWriter s)
        {
            //for every affected graph node, trace the relationships down the chain until everything has been traced
            foreach (GraphNode g in gNodes)
            {
                if (!g.Represented.Node.IsClassification)
                {
                    //constructor, literal, statement, return type, return, method are potential future cases to consider
                    //field, param, local variable**, return value, method are used in the state tracing

                    //switch statement to trace the different member types.
                    //each member type has a different set of relationships (writtento, candidateread, etc.) that needs to be traced.
                    switch (g.Represented.Node.GetMyMember())
                    {
                        case Members.Field:
                            TraceField(g, Relationship.na, Members.Null, null);
                            break;
                        case Members.Parameter:
                            TraceParameter(g, Relationship.na, Members.Null, null);
                            break;
                        case Members.Method:
                            TraceMethod(g, Relationship.na, Members.Null, null);
                            break;
                        case Members.MethodScope:
                            if (g.ParentScope.Represented.Node.GetMyMember() == Members.Method)
                            {
                                TraceMethod(g.ParentScope, Relationship.na, Members.Null, null);
                            }
                            break;
                        case Members.Branch:
                            TraceBranch(g, Relationship.na, Members.Null, null);
                            break;
                        default:
                            //default functionality unnecessary? (subject to change)
                            break;
                    }
                }
            }
        }

        private void TraceField(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                gn.traced = true;
                gn.AddToParentAndChildrenLists(gnPar);
                //this line seems to be neccessary to trace everything. maybe redundant in some cases
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //candidate read is neccesary when it relates to methods/return values
                    if (r == Relationship.WrittenBy || r == Relationship.ReturnType)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                            {
                                al.WriteStatementToAffectedDict(gn, grphNde, r);
                            }

                            //field wants to trace back to anything it is related to.
                            if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                TraceParameter(grphNde, r, Members.Field, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Field, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde, r, Members.Field, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                gn.AddToSisterLists(grphNde);
                                TraceField(grphNde, r, Members.Field, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Constructor))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Literal))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. error message to user.
                                throw new InvalidDataException(grphNde.Represented.Node.ToString() + " not accounted for in TraceField()");
                            }

                        }
                    }
                    else if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Field, gn);
                            }
                        }
                    }
                    else if (r == Relationship.Accesses)
                    {
                        //Accesses will be relevent once the CandidateRead issue is fixed
                    }
                }
            }
        }

        private void TraceParameter(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                gn.traced = true;
                gn.AddToParentAndChildrenLists(gnPar);
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            al.WriteStatementToAffectedDict(gn, grphNde, r);

                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Parameter, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                grphNde.AddToParentAndChildrenLists(gn);
                                TraceParameter(grphNde, r, Members.Parameter, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde, r, Members.Parameter, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde, r, Members.Parameter, gn);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else if (grphNde.Represented.Node.Equals(Members.For3Loop))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. error message to user.
                                throw new InvalidDataException(grphNde.Represented.Node.ToString() + " not accounted for in TraceParameter()");
                            }
                        }
                    }
                }
            }
        }

        private void TraceMethod(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                gn.traced = true;
                if(gnPar != null)
                {
                    gnPar.AddToParentAndChildrenLists(gn);
                }
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            al.WriteStatementToAffectedDict(gn, grphNde, r);
                        }
                    }
                    //return value is neccesary in some but not others (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            grphNode.AddToParentAndChildrenLists(gn);
                            al.WriteStatementToAffectedDict(gn, grphNode, r);
                            TraceReturnValue(grphNode, r, Members.Method, gn);
                        }
                    }
                    else if (r == Relationship.Control)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            al.WriteStatementToAffectedDict(gn, grphNde, r);
                        }
                    }
                }
            }

        }

        private void TraceBranch(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                gn.traced = true;
                gn.AddToParentAndChildrenLists(gnPar);
                Branch b = (Branch)gn;
                //get all of the line numbers in the affected branch (if/else)
                List<Tuple<int, int>> bList = b.GetBranchLineNums();

                if (bList != null)
                {
                    foreach (Tuple<int, int> t in bList)
                    {
                        for (int i = t.Item1; i <= t.Item2; i++)
                        {
                            //maybe find relationships of the line numbers eventually (subject to change)
                            al.WriteToAffectedDict(gn, gn.Represented.FileName, i, false, re);
                        }
                    }
                }
            }
        }

        private void TraceReturnValue(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            gn.AddToParentAndChildrenLists(gnPar);

            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                gn.traced = true;

                if (gn.Represented.Node.Equals(Members.Field))
                {
                    al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re);
                }

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.WrittenBy)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNode.Represented.Node.Equals(Members.Field))
                            {
                                foreach (GraphNode p in gn.GetParentGNs())
                                {
                                    grphNode.AddToParentAndChildrenLists(p);
                                }
                                grphNode.AddToSisterLists(gn);

                                TraceField(grphNode, r, Members.Return, gn);
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Literal))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Method))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Parameter))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.ArrayInvoke))
                            {
                                //do nothing
                            }
                            else if (grphNode.Represented.Node.Equals(Members.Constructor))
                            {
                                //do nothing
                            }
                            else
                            {
                                //case not accounted for. throw error message to user
                                throw new InvalidDataException(grphNode.Represented.Node.ToString() + " not accounted for in TraceReturnValue()");
                            }
                        }
                    }
                }
            }
        }
        /* template trace function
        private static void Trace(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;

            }
        }
        */
    }
}
