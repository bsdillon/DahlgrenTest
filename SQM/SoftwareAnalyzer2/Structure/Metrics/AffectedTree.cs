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
        //variables to hold the user-inputted csv fields
        private string errorDescription;
        private string errorProperty;
        private List<GraphNode> tracedGNs = new List<GraphNode>();
        private static string missedTraces = "";

        public AffectedTree()
        {
        }

        //find all of the related filenames and linenumbers associated with the user's csv input file and mark gephinodes with the user-inputted error property/description
        public void FindCSVConnections(string fileName, int lineNum, string fileStem, string errorD, string errorP)
        {
            errorDescription = errorD;
            errorProperty = errorP;
            //change the "outputFileName" variable to change the name of the output file.
            string outputFileName = "_errors_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter gFile = new StreamWriter(fullFile, true);

            List<GraphNode> relatedGNodes = lineNumDict[fileName][lineNum];

            al = new AffectedLine();
            //find all graphnodes that are related to the line number entered by the user
            FindAffectedNodes(relatedGNodes, gFile);
            
            //csv output
            al.OutputCSVErrors(gFile, fileName, lineNum);

            gFile.WriteLine(missedTraces);
            gFile.Close();
            missedTraces = "";
        }

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
                    //these tracing functions all call each other and can be called according to a series of complex function calls and conditional statements
                    //the oringial tracing was configured through thorough debugging and will likely change slightly according to the customer's needs
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
            //reset the value of "traced" in each graphnode
            CleanTracedGNs();
        }

        //mark the GraphNode parameter as traced, and add it to the static tracedGNs list
        private void MarkGraphNodeTraced(GraphNode g)
        {
            g.traced = true;
            tracedGNs.Add(g);
        }

        //reset the value of "traced" in each graphnode in case the user enters multiple filenames/line numbers to track.
        private void CleanTracedGNs()
        {
            foreach (GraphNode g in tracedGNs)
            {
                g.traced = false;
            }
            tracedGNs.Clear();
        }

        //tracing field nodes
        private void TraceField(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                gn.AddToParentAndChildrenLists(gnPar);
                //this line seems to be neccessary to trace everything. maybe redundant in some cases
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //eventually, more relationships may be relevant to trace. future work would add in other conditional tracing here
                    if (r == Relationship.WrittenBy || r == Relationship.ReturnType)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                            {
                                al.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
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
                                missedTraces += grphNde.Represented.Node.ToString() + " not accounted for in TraceField()\n";
                            }

                        }
                    }
                    //candidate read is neccesary when it relates to methods/return values
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
                        //Accesses will be relevent once the CandidateRead issue (github issue #329) is fixed
                    }
                }
            }
        }

        //tracing parameter nodes
        private void TraceParameter(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                gn.AddToParentAndChildrenLists(gnPar);
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            al.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                            //There are many members that could be relevant in the future. This logic provides the user with the most important traces
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
                                missedTraces += grphNde.Represented.Node.ToString() + " not accounted for in TraceParameter()\n";
                            }
                        }
                    }
                }
            }
        }

        //tracing method nodes
        private void TraceMethod(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                if(gnPar != null)
                {
                    gnPar.AddToParentAndChildrenLists(gn);
                }
                al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //Other relationships are subject to be added here in the future
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            al.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                        }
                    }
                    //return value is neccesary in most cases (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            grphNode.AddToParentAndChildrenLists(gn);
                            al.WriteStatementToAffectedDict(gn, grphNode, r, errorDescription, errorProperty);
                            TraceReturnValue(grphNode, r, Members.Method, gn);
                        }
                    }
                    //control is rarer than return value, but relevant
                    else if (r == Relationship.Control)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            al.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                        }
                    }
                }
            }

        }

        //tracing branch nodes
        private void TraceBranch(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
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
                            al.WriteToAffectedDict(gn, gn.Represented.FileName, i, false, re, errorDescription, errorProperty);
                        }
                    }
                }
            }
        }

        //tracing returnvalue nodes
        private void TraceReturnValue(GraphNode gn, Relationship re, Members m, GraphNode gnPar)
        {
            gn.AddToParentAndChildrenLists(gnPar);

            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);

                if (gn.Represented.Node.Equals(Members.Field))
                {
                    al.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);
                }

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.WrittenBy)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            //There are many members that could be relevant in the future. This logic provides the user with the most important traces
                            if (grphNode.Represented.Node.Equals(Members.Field))
                            {
                                foreach (GraphNode p in gn.GetParentGNs())
                                {
                                    grphNode.AddToParentAndChildrenLists(p);
                                }

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
                                missedTraces += grphNode.Represented.Node.ToString() + " not accounted for in TraceReturnValue()\n";
                            }
                        }
                    }
                }
            }
        }
        /* template trace function
        private void Trace(GraphNode gn)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);

            }
        }
        */
    }
}
