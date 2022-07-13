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
        //Austin: variables to hold the user-inputted Critical input csv fields
        private string criticalDescription;
        private string criticalProperty;
        //Austin: new placeholder AffectedLine, trying to duplicate al to separate output to the new output file
        private AffectedLine acl;
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
            FindAffectedNodes(relatedGNodes, gFile, al);
            
            //csv output
            al.OutputCSVErrors(gFile, fileName, lineNum);

            gFile.WriteLine(missedTraces);
            gFile.Close();
            missedTraces = "";
        }
        public void FindCriticalCSVConnections(string fileName, int lineNum, string fileStem, string criticalD, string criticalP)
        {
            errorDescription = criticalD;
            errorProperty = criticalP;
            string outputFileName = "_critical_nodes_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter cFile = new StreamWriter(fullFile, false);
            //I have a dictionary- here's the fileNamekey (e.g., "/bubblemod- line 2") and returns the list of graph nodes

            // e.g., lineNums["/bubblesort"] would output a Dictionary<int, List<GraphNode>>
            // e.g., lineNumber["/bubblesort"][1] would output a List of GraphNodes that are related to /bubbleSort line number 1

            List<GraphNode> relatedGNodes = lineNumDict[fileName][lineNum];

            acl = new AffectedLine();
            //find all graphnodes that are related to the line number entered by the user
            Console.WriteLine("Is it at FindAffectedNodes for Critical?");
            FindAffectedNodes(relatedGNodes, cFile, acl);
            Console.WriteLine("Got through FindAffectedNodes");
            //csv output
            acl.OutputCSVErrors(cFile, fileName, lineNum);
            Console.WriteLine("finished outputting CSV errors");
            cFile.WriteLine(missedTraces);
            cFile.Close();
            Console.WriteLine("closed file");
            missedTraces = "";
        }

        private void FindAffectedNodes(List<GraphNode> gNodes, StreamWriter s, AffectedLine line)
        {
            //for every affected graph node, trace the relationships down the chain until everything has been traced
            foreach (GraphNode g in gNodes)
            {
                Console.WriteLine("does a single graphnode exist?");
                if (!g.Represented.Node.IsClassification)
                {
                    Console.WriteLine("got to classification?");
                    //constructor, literal, statement, return type, return, method are potential future cases to consider
                    //field, param, local variable**, return value, method are used in the state tracing

                    //switch statement to trace the different member types.
                    //each member type has a different set of relationships (writtento, candidateread, etc.) that needs to be traced.
                    //these tracing functions all call each other and can be called according to a series of complex function calls and conditional statements
                    //the oringial tracing was configured through thorough debugging and will likely change slightly according to the customer's needs
                    switch (g.Represented.Node.GetMyMember())
                    {
                        case Members.Field:
                            Console.WriteLine("field reached");
                            TraceField(g, Relationship.na, Members.Null, null, line);
                            break;
                        case Members.Parameter:
                            Console.WriteLine("parameter reached");
                            TraceParameter(g, Relationship.na, Members.Null, null, line);
                            break;
                        case Members.Method:
                            Console.WriteLine("method reached");
                            TraceMethod(g, Relationship.na, Members.Null, null, line);
                            break;
                        case Members.MethodScope:
                            Console.WriteLine("methodscope reached");
                            if (g.ParentScope.Represented.Node.GetMyMember() == Members.Method)
                            {
                                Console.WriteLine("methodscope if-then reached");
                                TraceMethod(g.ParentScope, Relationship.na, Members.Null, null, line);
                            }
                            break;
                        case Members.Branch:
                            Console.WriteLine("tracebranch reached");
                            TraceBranch(g, Relationship.na, Members.Null, null, line);
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
        private void TraceField(GraphNode gn, Relationship re, Members m, GraphNode gnPar, AffectedLine line)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                gn.AddToParentAndChildrenLists(gnPar);
                Console.WriteLine("tracefield function reached");
                //this line seems to be necessary to trace everything. maybe redundant in some cases
                line.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);
                Console.WriteLine("writetoaffecteddict successfully passed");
                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //eventually, more relationships may be relevant to trace. future work would add in other conditional tracing here
                    if (r == Relationship.WrittenBy || r == Relationship.ReturnType)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                            {
                                line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                            }

                            //field wants to trace back to anything it is related to.
                            if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                TraceParameter(grphNde, r, Members.Field, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Field, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde, r, Members.Field, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde, r, Members.Field, gn, line);
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
                    //candidate read is necessary when it relates to methods/return values
                    else if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Field, gn, line);
                            }
                        }
                    }
                    else if (r == Relationship.Accesses)
                    {
                        //Accesses will be relevant once the CandidateRead issue (github issue #329) is fixed
                    }
                }
            }
        }

        //tracing parameter nodes
        private void TraceParameter(GraphNode gn, Relationship re, Members m, GraphNode gnPar, AffectedLine line)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                gn.AddToParentAndChildrenLists(gnPar);
                line.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                            //There are many members that could be relevant in the future. This logic provides the user with the most important traces
                            if (grphNde.Represented.Node.Equals(Members.Method))
                            {
                                TraceMethod(grphNde, r, Members.Parameter, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Parameter))
                            {
                                grphNde.AddToParentAndChildrenLists(gn);
                                TraceParameter(grphNde, r, Members.Parameter, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Branch))
                            {
                                TraceBranch(grphNde, r, Members.Parameter, gn, line);
                            }
                            else if (grphNde.Represented.Node.Equals(Members.Field))
                            {
                                TraceField(grphNde, r, Members.Parameter, gn, line);
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
        private void TraceMethod(GraphNode gn, Relationship re, Members m, GraphNode gnPar, AffectedLine line)
        {
            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);
                if(gnPar != null)
                {
                    gnPar.AddToParentAndChildrenLists(gn);
                }
                line.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //Other relationships are subject to be added here in the future
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                        }
                    }
                    //return value is neccesary in most cases (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            grphNode.AddToParentAndChildrenLists(gn);
                            line.WriteStatementToAffectedDict(gn, grphNode, r, errorDescription, errorProperty);
                            TraceReturnValue(grphNode, r, Members.Method, gn, line);
                        }
                    }
                    //control is rarer than return value, but relevant
                    else if (r == Relationship.Control)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            gn.AddToParentAndChildrenLists(grphNde);
                            line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                        }
                    }
                }
            }

        }

        //tracing branch nodes
        private void TraceBranch(GraphNode gn, Relationship re, Members m, GraphNode gnPar, AffectedLine line)
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
                            line.WriteToAffectedDict(gn, gn.Represented.FileName, i, false, re, errorDescription, errorProperty);
                        }
                    }
                }
            }
        }

        //tracing returnvalue nodes
        private void TraceReturnValue(GraphNode gn, Relationship re, Members m, GraphNode gnPar, AffectedLine line)
        {
            gn.AddToParentAndChildrenLists(gnPar);

            //don't retrace any fields that have already been marked.
            if (!gn.traced && !gn.IsSimulated)
            {
                MarkGraphNodeTraced(gn);

                if (gn.Represented.Node.Equals(Members.Field))
                {
                    line.WriteToAffectedDict(gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false, re, errorDescription, errorProperty);
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

                                TraceField(grphNode, r, Members.Return, gn, line);
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
