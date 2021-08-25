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
        //private Dictionary<string, Dictionary<int, List<GraphNode>>> affectedDict = new Dictionary<string, Dictionary<int, List<GraphNode>>>();
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
            FindAffectedNodes(relatedGNodes);
            
            //csv output
            al.OutputCSVErrors(gFile, fileName, lineNum);
            gFile.Close();
        }
        //luTODO -- move these functions to a different file within metrics folder
        //luTODO -- make the tracing errors silent and output them within an output file
        //luTODO -- look at statemachine, create object for showing relationship
        //luTODO -- monday create a data structure to hold things (tree starts from original error input -> branch, if a previous branch has been traced, ignore)
        private void FindAffectedNodes(List<GraphNode> gNodes)
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
                            TraceField(g);
                            break;
                        case Members.Parameter:
                            TraceParameter(g);
                            break;
                        case Members.Method:
                            TraceMethod(g);
                            break;
                        case Members.MethodScope:
                            if (g.ParentScope.Represented.Node.GetMyMember() == Members.Method)
                            {
                                TraceMethod(g.ParentScope);
                            }
                            break;
                        case Members.Branch:
                            TraceBranch(g);
                            break;
                        default:
                            //default functionality unnecessary? (subject to change)
                            break;
                    }
                }
            }
        }

        private void TraceField(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                //this line seems to be neccessary to trace everything. maybe redundant in some cases
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

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
                                TraceParameter(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde);
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
                                TraceMethod(grphNde);
                            }
                        }
                    }
                }
            }
        }

        private void TraceParameter(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            al.WriteStatementToAffectedDict(gn, grphNde, r);

                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                TraceParameter(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde);
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

        private void TraceMethod(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
                al.WriteToAffectedDict(gn, gn.Represented.FileName, -1, false);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            al.WriteStatementToAffectedDict(gn, grphNde, r);
                        }
                    }
                    //return value is neccesary in some but not others (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            al.WriteStatementToAffectedDict(gn, grphNode, r);
                            TraceReturnValue(grphNode);
                        }
                    }
                }
            }

        }

        private void TraceBranch(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;
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
                            al.WriteToAffectedDict(gn, gn.Represented.FileName, i, false);
                        }
                    }
                }
            }
        }

        private void TraceReturnValue(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced)
            {
                gn.traced = true;

                if (gn.Represented.Node.Equals(Members.Field))
                {
                    al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);
                }

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.WrittenBy)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNode.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNode);
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
