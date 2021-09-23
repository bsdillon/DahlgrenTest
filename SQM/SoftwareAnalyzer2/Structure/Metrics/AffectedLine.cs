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
    class AffectedLine
    {
        //dictionary: <file name (string), dictionary: <line number (int), List<affected graphnodes (graphnode)>>>
        private Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>> affectedDict = new Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>>();
        private string printLevel = "";
        private bool outputStarted = false;
        public AffectedLine()
        {
        }

        //luTODO -- take simulated data, mark it, terminate tracing at that point
        //luTODO -- the output of "traceback" is still a work in progress. see TODOs below
        public void WriteToAffectedDict(GraphNode gn, string fileName, int lineNumber, bool trimFileN, Relationship re)
        {
            if (fileName != null && !gn.IsSimulated)
            {
                Dictionary<int, List<Dictionary<GraphNode, Relationship>>> gnLine = new Dictionary<int, List<Dictionary<GraphNode, Relationship>>>();
                Dictionary<GraphNode, Relationship> gnRel = new Dictionary<GraphNode, Relationship>();
                gnLine[lineNumber] = new List<Dictionary<GraphNode, Relationship>>();
                gnRel[gn] = re;
                gnLine[lineNumber].Add(gnRel);

                //add to linenumber dictionary
                //does the dict contain the filename?
                if (!affectedDict.ContainsKey(fileName))
                {
                    affectedDict.Add(fileName, gnLine);
                }
                else
                {
                    //if the dict contains the filename, does it also contain the line number?
                    if (affectedDict[fileName].ContainsKey(lineNumber))
                    {
                        //if it doesn't contain the exact graphnode we are inserting, insert it
                        if (!affectedDict[fileName][lineNumber].Contains(gnRel))
                        {
                            affectedDict[fileName][lineNumber].Add(gnRel);
                        }
                    }
                    else
                    {
                        //if it doesn't contain the line number, safe to insert.
                        affectedDict[fileName].Add(lineNumber, gnLine[lineNumber]);
                    }
                }
            }
        }

        public void WriteStatementToAffectedDict(GraphNode gn, GraphNode grphNde, Relationship r)
        {
            void InsertNodeConditionally(GraphNode addTo, GraphNode pScope)
            {
                if (pScope.Represented.Node.Equals(Members.Branch) || pScope.ParentScope.Represented.Node.Equals(Members.Branch))
                {
                    addTo.AddToParentAndChildrenLists(pScope);
                }
            }
            //simulated graphnodes are not very meaningful for tracing errors
            if (!gn.IsSimulated)
            {
                foreach (Statement s in gn.GetRelationshipsTo()[r][grphNde])
                {
                    //check if affectedDict contains the filename we are trying to insert
                    if (!affectedDict.ContainsKey(s.Represented.FileName))
                    {
                        Dictionary<int, List<Dictionary<GraphNode, Relationship>>> iGNList = new Dictionary<int, List<Dictionary<GraphNode,Relationship>>>();
                        Dictionary<GraphNode, Relationship> gnRel = new Dictionary<GraphNode, Relationship>();
                        List<Dictionary<GraphNode, Relationship>> smallGList = new List<Dictionary<GraphNode, Relationship>>();

                        if (grphNde.statementDetails.ContainsKey(s.Represented.FileName))
                        {
                            InsertNodeConditionally(grphNde, s.ParentScope);
                            grphNde.statementDetails[s.Represented.FileName].Add(s.Represented.GetLineStart());
                        }
                        else
                        {
                            List<int> lineList = new List<int>();
                            lineList.Add(s.Represented.GetLineStart());
                            InsertNodeConditionally(grphNde, s.ParentScope);
                            grphNde.statementDetails.Add(s.Represented.FileName, lineList);
                        }

                        gnRel[grphNde] = r;
                        smallGList.Add(gnRel);
                        iGNList[s.Represented.GetLineStart()] = smallGList;
                        affectedDict[s.Represented.FileName] = iGNList;
                    }
                    //if affectedDict contains the filename, does it also contain the line number we are trying to insert?
                    else if (!affectedDict[s.Represented.FileName].ContainsKey(s.Represented.GetLineStart()))
                    {
                        List<Dictionary<GraphNode, Relationship>> gnList = new List<Dictionary<GraphNode, Relationship>>();
                        Dictionary<GraphNode, Relationship> gnRelationship = new Dictionary<GraphNode, Relationship>();

                        if (grphNde.statementDetails.ContainsKey(s.Represented.FileName))
                        {
                            InsertNodeConditionally(grphNde, s.ParentScope);
                            grphNde.statementDetails[s.Represented.FileName].Add(s.Represented.GetLineStart());
                        }
                        else
                        {
                            List<int> lineList = new List<int>();
                            lineList.Add(s.Represented.GetLineStart());
                            InsertNodeConditionally(grphNde, s.ParentScope);
                            grphNde.statementDetails.Add(s.Represented.FileName, lineList);
                        }

                        gnRelationship[grphNde] = r;
                        gnList.Add(gnRelationship);
                        affectedDict[s.Represented.FileName][s.Represented.GetLineStart()] = gnList;
                    }
                }
            }
        }

        //this output is subject to change based on safety's needs
        public void OutputCSVErrors(StreamWriter file, string tracingFile, int tracingLineNumber)
        {
            List<Tuple<int, string, GraphNode>> extraPrints = new List<Tuple<int, string, GraphNode>>();

            file.WriteLine("Lines affected by input file:" + tracingFile + " - line number: [" + tracingLineNumber.ToString() + "]");
            foreach (string fN in affectedDict.Keys)
            {
                string fnModded = fN;
                if (fN.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fnModded = fnModded.Substring(fnModded.LastIndexOf(Path.DirectorySeparatorChar));
                }
                foreach (int lN in affectedDict[fN].Keys)
                { 
                    List<Dictionary<GraphNode,Relationship>> gnDictList = affectedDict[fN][lN];
                    //output affected filename, linenumber, and nodetype
                    foreach (Dictionary<GraphNode,Relationship> d in gnDictList)
                    {
                        foreach (GraphNode g in d.Keys)
                        {
                            //luTODO -- this output is still a WIP. need to add comments
                            if (!g.outputPrint)
                            {
                                if (g.Represented.FileName == tracingFile && g.Represented.GetLineStart() == tracingLineNumber /*&& g.Represented.GetLineStart() == lN*/)
                                {
                                    PrintChildren(g, file);
                                }
                                else if (g.statementDetails.ContainsKey(tracingFile))
                                {
                                    foreach (int lineNum in g.statementDetails[tracingFile])
                                    {
                                        if (lineNum == tracingLineNumber)
                                        {
                                            WriteToOutput("cs", file, fN, lineNum, g, true);
                                            printLevel += ",";
                                            //luTODO -- still testing the logic here
                                            PrintParents(g, file);
                                            printLevel = printLevel.Remove(printLevel.Length - 1);

                                        }
                                    }

                                }
                                else
                                {
                                    if (outputStarted)
                                    {
                                        WriteToOutput("tup", file, fN, lN, g, true);
                                    }
                                    else
                                    {
                                        Tuple<int, string, GraphNode> t = Tuple.Create(lN, fN, g);
                                        extraPrints.Add(t);
                                    }
                                    //PrintParents(g, file);
                                }
                            }   
                        }
                    }
                }
            }
            if(extraPrints.Count > 0)
            {
                foreach(Tuple<int, string, GraphNode> tup in extraPrints)
                {
                    WriteToOutput("tup", file, tup.Item2, tup.Item1, tup.Item3, true);
                }
            }
        }

        private void PrintParents(GraphNode g, StreamWriter file)
        {
            g.outputPrint = true;
            printLevel += ",";
            foreach (GraphNode p in g.GetParentGNs())
            {
                if (p != null && !p.dictPrint)
                {
                    if (!p.Represented.Node.IsClassification)
                    {
                        WriteToOutput("nn", file, p.Represented.FileName, p.Represented.GetLineStart(), p, false);
                        PrintParents(p, file);
                    }
                }
                else
                {
                    //WriteToOutput("nu", file, g.Represented.FileName, g.Represented.GetLineStart(), g, false);
                    //PrintChildren(g, file);
                }
            }
            if(g.GetParentGNs().Count < 1)
            {
                if (g.statementDetails.Keys.Count > 0)
                {
                    foreach (string fileKey in g.statementDetails.Keys)
                    {
                        foreach (int lineNum in g.statementDetails[fileKey])
                        {
                            WriteToOutput("s", file, fileKey, lineNum, g, true);
                        }
                    }

                }
            }
            printLevel = printLevel.Remove(printLevel.Length - 1);
        }

        private void PrintChildren(GraphNode g, StreamWriter file)
        {
            g.outputPrint = true;
            foreach (GraphNode c in g.GetChildrenGNs())
            {
                if (c != null && !c.dictPrint)
                {
                    PrintChildren(c, file);
                    if (c.statementDetails.Keys.Count > 0)
                    {
                        foreach (string fileKey in c.statementDetails.Keys)
                        {
                            foreach (int lineNum in c.statementDetails[fileKey])
                            {
                                WriteToOutput("new", file, fileKey, lineNum, c, true);
                                PrintParents(c, file);
                            }
                        }

                    }
                    else
                    {
                        WriteToOutput("cnu", file, c.Represented.FileName, c.Represented.GetLineStart(), c, false);
                        PrintChildren(c, file);
                    }

                }
            }
        }

        //prepend will be removed before the final product. just informational, currently
        void WriteToOutput(string prepend, StreamWriter file, string fileName, int lineNum, GraphNode origin, bool statement)
        {
            if (!origin.dictPrint)
            {
                int timesUsed = 0;
                string timeUsedStr = "";
                Dictionary<GraphNode, int> combDict = origin.GetCombinedDict();
                if (!outputStarted)
                {
                    outputStarted = true;
                }

                if (combDict != null)
                {
                    if (combDict.ContainsKey(origin))
                    {
                        timesUsed = combDict[origin];
                        if (timesUsed > 1)
                        {
                            timeUsedStr = " * " + timesUsed.ToString();
                        }
                    }
                }

                if (statement)
                {
                    file.WriteLine(printLevel + prepend + "[" + fileName + "::" + lineNum.ToString() + "](originated from: " + origin.Represented.ToString() + timeUsedStr + ")");
                }
                else
                {
                    origin.dictPrint = true;
                    file.WriteLine(printLevel + prepend + "[" + fileName + "::" + lineNum.ToString() + "](" + origin.Represented.ToString() + timeUsedStr + ")");
                }
            }
 
        }

        /*
        private string PrintSisters(GraphNode g, string gnListStr)
        {

            foreach (GraphNode s in g.GetSisterGNs())
            {
                if (s != null)
                {
                    if (s.statementDetails.Key != null)
                    {
                        if (s.GetSisterGNs().Contains(g))
                        {
                            gnListStr += "[" + s.Represented.FileName + "::" + s.Represented.GetLineStart().ToString() + "]; ";
                        }
                        gnListStr += "[" + s.statementDetails.Key + "::" + s.statementDetails.Value.ToString() + "]; ";
                    }
                    else
                    {
                        gnListStr += "[" + s.Represented.FileName + "::" + s.Represented.GetLineStart().ToString() + "]; ";
                    }
                }
            }
            gnListStr += "),";
            return gnListStr;
        }
        */
    }
}
