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
        private List<Tuple<string, int>> statementsWritten = new List<Tuple<string, int>>();

        public AffectedLine()
        {
        }

        //luTODO -- take simulated data, mark it, terminate tracing at that point
        //luTODO -- the output of "traceback" is still a work in progress. see TODOs below
        public void WriteToAffectedDict(GraphNode gn, string fileName, int lineNumber, bool trimFileN, Relationship re, string errorDescription, string errorProperty)
        {
            if (fileName != null && !gn.IsSimulated)
            {
                Dictionary<int, List<Dictionary<GraphNode, Relationship>>> gnLine = new Dictionary<int, List<Dictionary<GraphNode, Relationship>>>();
                Dictionary<GraphNode, Relationship> gnRel = new Dictionary<GraphNode, Relationship>();
                gnLine[lineNumber] = new List<Dictionary<GraphNode, Relationship>>();
                gnRel[gn] = re;

                //mark corresponding GephiNode with user-inputted error description/property
                MetricUtilities.GephiFromGraphNode(gn, errorDescription, errorProperty);

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

        //GraphNodes have relationships to certain lines of code that are represented as a "Statement" instead of GraphNode.
        //This function writes said Statements to the "AffectedDict" which tracks the affected files/line numbers to be outputted
        public void WriteStatementToAffectedDict(GraphNode gn, GraphNode grphNde, Relationship r, string errorDescription, string errorProperty)
        {
            //branches should be the parents of the graphnodes they contain
            void InsertNodeConditionally(GraphNode addTo, GraphNode pScope)
            {
                if (pScope.Represented.Node.Equals(Members.Branch) || pScope.ParentScope.Represented.Node.Equals(Members.Branch))
                {
                    addTo.AddToParentAndChildrenLists(pScope);
                }
            }

            //simulated graphnodes are not very meaningful for tracing errors, skip
            if (!gn.IsSimulated)
            {
                foreach (Statement s in gn.GetRelationshipsTo()[r][grphNde])
                {
                    //check if affectedDict contains the filename we are trying to insert
                    if (!affectedDict.ContainsKey(s.Represented.FileName))
                    {
                        //logic only arrives here if the affectedDict has never had an entry from the specified file before.
                        //create dictionaries that abide by the structure of affectedDict and insert the data into affectedDict
                        //affectedDict is a nested dictionary containing all of the data necessary for the output file. 
                        //the key of the dictionary is the filename, and the value is a dictionary of linenumbers, related graphnodes, and relationships.
                        Dictionary<int, List<Dictionary<GraphNode, Relationship>>> iGNList = new Dictionary<int, List<Dictionary<GraphNode,Relationship>>>();
                        Dictionary<GraphNode, Relationship> gnRel = new Dictionary<GraphNode, Relationship>();
                        List<Dictionary<GraphNode, Relationship>> smallGList = new List<Dictionary<GraphNode, Relationship>>();

                        //set GraphNode as the key and the relationship (as to why it was affected) as the value of the sub-sub-dict
                        gnRel[grphNde] = r;
                        //add that dictionary to a list of dictionaries (that will be added to as more GraphNodes are added to affectedDict)
                        smallGList.Add(gnRel);

                        //mark corresponding GephiNode with user-inputted error description/property
                        MetricUtilities.GephiFromGraphNode(grphNde, errorDescription, errorProperty);

                        //set the linenumber of the affected line as the key and the list of graphnodes (with pairing relationships) as the value of the sub-dict.
                        iGNList[s.Represented.GetLineStart()] = smallGList;
                        //set the filename as the key and the list of line numbers (containing a dictionary of affected GraphNodes + relationships) as the value of affectedDict
                        affectedDict[s.Represented.FileName] = iGNList;
                    }
                    //if affectedDict contains the filename, does it also contain the line number we are trying to insert?
                    else if (!affectedDict[s.Represented.FileName].ContainsKey(s.Represented.GetLineStart()))
                    {
                        //see the comments in the "if" section of this section.
                        //logic only arrives here if the affectedDict contained the filename of what we want to insert into affectedDict...
                        //but DOES NOT contain the line number of what we want to insert into affectedDict
                        List<Dictionary<GraphNode, Relationship>> gnList = new List<Dictionary<GraphNode, Relationship>>();
                        Dictionary<GraphNode, Relationship> gnRelationship = new Dictionary<GraphNode, Relationship>();

                        //set GraphNode as the key and the relationship (as to why it was affected) as the value of the sub-sub-dict
                        gnRelationship[grphNde] = r;

                        //mark corresponding GephiNode with user-inputted error description/property
                        MetricUtilities.GephiFromGraphNode(grphNde, errorDescription, errorProperty);

                        //add that dictionary to the list of dictionaries (that was created in the if block above)
                        gnList.Add(gnRelationship);
                        //set the filename as the key and the list of line numbers (containing a dictionary of affected GraphNodes + relationships) as the value of affectedDict
                        affectedDict[s.Represented.FileName][s.Represented.GetLineStart()] = gnList;
                    }

                    //if the graphnode we are inserting into affectedDict contains any statements
                    if (grphNde.statementDetails.ContainsKey(s.Represented.FileName))
                    {
                        //logic only arrives here if statementDetails already contains the filename of the given statement
                        //ensure any branches are allocated as a parent correctly
                        InsertNodeConditionally(grphNde, s.ParentScope);
                        //insert the linenumber into the statementDetails list
                        grphNde.statementDetails[s.Represented.FileName].Add(s.Represented.GetLineStart());
                    }
                    else
                    {
                        //logic only arrives here if statementDetails does NOT contain the filename of the given statement
                        List<int> lineList = new List<int>();
                        //create a new list to hold the statementDetails, and add the current statement's line number
                        lineList.Add(s.Represented.GetLineStart());
                        //ensure any branches are allocated as a parent correctly
                        InsertNodeConditionally(grphNde, s.ParentScope);
                        //insert the filename and line number of the current statement into statementDetails
                        grphNde.statementDetails.Add(s.Represented.FileName, lineList);
                    }
                }
            }
        }

        //this output is subject to change based on safety's needs. finds all affected portions of code and outputs to a csv
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
                    //output affected filename, graphnode.tostring, and where it originates from (if it is a statement) in a tree format
                    foreach (Dictionary<GraphNode,Relationship> d in gnDictList)
                    {
                        foreach (GraphNode g in d.Keys)
                        {
                            //luTODO -- this output is still a WIP. need to add comments
                            if (!g.outputPrint || (g.outputPrint && g.Represented.GetLineStart() != lN))
                            {
                                if (fnModded == tracingFile && g.Represented.GetLineStart() == tracingLineNumber)
                                {
                                    WriteToOutput("fm", file, fN, g.Represented.GetLineStart(), g, false);
                                    printLevel += ",";
                                    PrintChildren(g, file);
                                    printLevel = printLevel.Remove(printLevel.Length - 1);
                                }
                                else if (g.statementDetails.ContainsKey(tracingFile))
                                {
                                    foreach (int lineNum in g.statementDetails[tracingFile])
                                    {
                                        if (lineNum == tracingLineNumber)
                                        {
                                            WriteToOutput("cs", file, fN, lineNum, g, true);
                                            printLevel += ",";
                                            PrintParents(g, file);
                                            printLevel = printLevel.Remove(printLevel.Length - 1);

                                        }
                                        else
                                        {
                                            if (outputStarted)
                                            {
                                                WriteToOutput("se", file, fN, lN, g, true);
                                                printLevel += ",";
                                                PrintChildren(g, file);
                                                printLevel = printLevel.Remove(printLevel.Length - 1);
                                            }
                                            else
                                            {
                                                Tuple<int, string, GraphNode> t = Tuple.Create(lN, fN, g);
                                                extraPrints.Add(t);
                                            }
                                        }
                                    }

                                }
                                else
                                {
                                    if (outputStarted)
                                    {
                                        WriteToOutput("ca", file, fN, lN, g, false);
                                        printLevel += ",";
                                        PrintChildren(g, file);
                                        printLevel = printLevel.Remove(printLevel.Length - 1);
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
                outputStarted = false;
            }
            if(extraPrints.Count > 0)
            {
                foreach(Tuple<int, string, GraphNode> tup in extraPrints)
                {
                    WriteToOutput("tup", file, tup.Item2, tup.Item1, tup.Item3, false);
                    printLevel += ",";
                    PrintChildren(tup.Item3, file);
                    printLevel = printLevel.Remove(printLevel.Length - 1);
                }
            }
            extraPrints.Clear();
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
                        if (p.statementDetails.Keys.Count > 0)
                        {
                            foreach (string fileKey in p.statementDetails.Keys)
                            {
                                foreach (int lineNum in p.statementDetails[fileKey])
                                {
                                    printLevel += ",";
                                    WriteToOutput("psta", file, fileKey, lineNum, p, true);
                                    printLevel = printLevel.Remove(printLevel.Length - 1);
                                }
                            }

                        }
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
                            WriteToOutput("ps", file, fileKey, lineNum, g, true);
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
            if (g.GetChildrenGNs().Count < 1)
            {
                if (g.statementDetails.Keys.Count > 0)
                {
                    foreach (string fileKey in g.statementDetails.Keys)
                    {
                        foreach (int lineNum in g.statementDetails[fileKey])
                        {
                            WriteToOutput("cs", file, fileKey, lineNum, g, true);
                        }
                    }

                }
            }
        }

        //prepend will be removed before the final product. just informational, currently
        void WriteToOutput(string prepend, StreamWriter file, string fileName, int lineNum, GraphNode origin, bool statement)
        {
            Tuple<string, int> s = Tuple.Create(fileName, lineNum);
            if ((!origin.dictPrint || statement) && !statementsWritten.Contains(s))
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
                    statementsWritten.Add(s);
                    file.WriteLine(printLevel + prepend + "[" + fileName + "::" + lineNum.ToString() + "](originated from: " + origin.Represented.ToString() + timeUsedStr + ")");
                }
                else
                {
                    origin.dictPrint = true;
                    file.WriteLine(printLevel + prepend + "[" + fileName + "::" + lineNum.ToString() + "](" + origin.Represented.ToString() + timeUsedStr + ")");
                }
            }
        }
    }
}
