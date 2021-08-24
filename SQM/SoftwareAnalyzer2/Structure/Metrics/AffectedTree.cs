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
        private Dictionary<string, Dictionary<int, List<GraphNode>>> affectedDict = new Dictionary<string, Dictionary<int, List<GraphNode>>>();
        private Dictionary<string, Dictionary<int, List<GraphNode>>> lineNumDict = GraphNode.GetLineNumDict();
        public AffectedTree()
        {
        }

        public void FindCSVConnections(string fileName, int lineNum, string fileStem)
        {
            string outputFileName = "_errors_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter gFile = new StreamWriter(fullFile, true);

            List<GraphNode> relatedGNodes = lineNumDict[fileName][lineNum];

            //find all graphnodes that are related to the line number entered by the user
            FindAffectedNodes(relatedGNodes);

            //csv output
            OutputCSVErrors(gFile, fileName, lineNum);

            affectedDict.Clear();
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
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    //candidate read is neccesary when it relates to methods/return values
                    if (r == Relationship.WrittenBy || r == Relationship.ReturnType)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                            {
                                WriteStatementToAffectedDict(gn, grphNde, r);
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
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNde, r);

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
                WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, -1, false);

                foreach (Relationship r in gn.GetRelationshipsTo().Keys)
                {
                    if (r == Relationship.CandidateRead)
                    {
                        foreach (GraphNode grphNde in gn.GetRelationshipsTo()[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNde, r);
                        }
                    }
                    //return value is neccesary in some but not others (subject to change)
                    else if (r == Relationship.ReturnValue)
                    {
                        foreach (GraphNode grphNode in gn.GetRelationshipsTo()[r].Keys)
                        {
                            WriteStatementToAffectedDict(gn, grphNode, r);
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
                            WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, i, false);
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
                    WriteToAffectedDict(affectedDict, gn, gn.Represented.FileName, gn.Represented.GetLineStart(), false);
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
        //luTODO -- take simulated data, mark it, terminate tracing at that point
        //luTODO -- fix the fibonacci error
        private static void WriteToAffectedDict(Dictionary<string, Dictionary<int, List<GraphNode>>> dict, GraphNode gn, string fileName, int lineNumber, bool trimFileN)
        {
            //simulated graphnodes are not very meaningful for tracing errors
            if (fileName != null && !gn.IsSimulated)
            {
                //trim filename for affected dict, but not linenumber dict
                if (trimFileN && fileName.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fileName = fileName.Substring(fileName.LastIndexOf(Path.DirectorySeparatorChar));
                }

                Dictionary<int, List<GraphNode>> gnLine = new Dictionary<int, List<GraphNode>>();
                gnLine[lineNumber] = new List<GraphNode>();
                gnLine[lineNumber].Add(gn);

                //add to linenumber dictionary
                //does the dict contain the filename?
                if (!dict.ContainsKey(fileName))
                {
                    dict.Add(fileName, gnLine);
                }
                else
                {
                    //if the dict contains the filename, does it also contain the line number?
                    if (dict[fileName].ContainsKey(lineNumber))
                    {
                        //if it doesn't contain the exact graphnode we are inserting, insert it
                        if (!dict[fileName][lineNumber].Contains(gn))
                        {
                            dict[fileName][lineNumber].Add(gn);
                        }
                    }
                    else
                    {
                        //if it doesn't contain the line number, safe to insert.
                        dict[fileName].Add(lineNumber, gnLine[lineNumber]);
                    }
                }
            }
        }

        private void WriteStatementToAffectedDict(GraphNode gn, GraphNode grphNde, Relationship r)
        {
            //simulated graphnodes are not very meaningful for tracing errors
            if (!gn.IsSimulated)
            {
                foreach (Statement s in gn.GetRelationshipsTo()[r][grphNde])
                {
                    //check if affectedDict contains the filename we are trying to insert
                    if (!affectedDict.ContainsKey(s.Represented.FileName))
                    {
                        Dictionary<int, List<GraphNode>> iGNList = new Dictionary<int, List<GraphNode>>();
                        List<GraphNode> smallGList = new List<GraphNode>();
                        smallGList.Add(grphNde);
                        iGNList[s.Represented.GetLineStart()] = smallGList;
                        affectedDict[s.Represented.FileName] = iGNList;
                    }
                    //if affectedDict contains the filename, does it also contain the line number we are trying to insert?
                    else if (!affectedDict[s.Represented.FileName].ContainsKey(s.Represented.GetLineStart()))
                    {
                        List<GraphNode> gnList = new List<GraphNode>();
                        gnList.Add(grphNde);
                        affectedDict[s.Represented.FileName][s.Represented.GetLineStart()] = gnList;
                    }
                }
            }
        }

        //this output is subject to change based on safety's needs
        public void OutputCSVErrors(StreamWriter file, string tracingFile, int tracingLineNumber)
        {
            foreach (string fN in affectedDict.Keys)
            {
                string fnModded = fN;
                if (fN.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fnModded = fnModded.Substring(fnModded.LastIndexOf(Path.DirectorySeparatorChar));
                }
                foreach (int lN in affectedDict[fN].Keys)
                {
                    List<GraphNode> gnList = affectedDict[fN][lN];
                    //output affected filename, linenumber, and nodetype
                    string gnListStr = "";
                    foreach (GraphNode g in gnList)
                    {
                        gnListStr += g.Represented.Node.ToString() + ",";
                    }
                    if (gnListStr != "")
                    {
                        file.WriteLine(tracingFile + "[" + tracingLineNumber.ToString() + "]," + fN + "," + lN + "," + gnListStr);
                    }
                }
            }
        }
    }
}
