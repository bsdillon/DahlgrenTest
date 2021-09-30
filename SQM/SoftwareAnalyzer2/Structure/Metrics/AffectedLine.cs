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
        //dictionary: <file name (string), dictionary: <line number (int), List<Dictionary>affected graphnodes, relationship>>>
        //affectedDict holds all of the affected graphnodes so that outputcsverrors can find ALL of the filenames and line numbers affected by the users input
        //affectedDict tracks all of the nodes that have any relationship to the user's input (and caught within the tracing functions within affectedTree)
        //if the logic within outputcsverrors ever needs modifications, it would be beneficial to reference affectedDict to see the core affected graphnodes
        private Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>> affectedDict = new Dictionary<string, Dictionary<int, List<Dictionary<GraphNode, Relationship>>>>();
        //printLevel is incremented and decremented with commas in order to create a tree-like output.
        private string printLevel = "";
        //outputStarted determines the order of the output tree. If the user wants to track an error on line 14 (and enters it within their csv input),
        //the output will start with line 14 of the file they inputted.
        private bool outputStarted = false;
        //statementsWritten prevents any duplicate statements from being outputted. Remember: not every line in the codebase is tracked by a graphnode.
        //some graphnodes have statements (which don't have relationships) and they are our main source of tracking many items. 
        //while statements are not ideal due to their lack of information, abbreviatedgraphs and gephinodes had even less information when that was the main approach for tracing files
        private List<Tuple<string, int>> statementsWritten = new List<Tuple<string, int>>();
        private static List<GraphNode> markedGNs = new List<GraphNode>();

        public AffectedLine()
        {
        }

        //conditional statements that allow writing to "affectedDict" without worrying about duplicates and the complex input to the dictionary
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

        //this output is subject to change based on the user's (safety's) needs. finds all affected portions of code and outputs to a csv
        public void OutputCSVErrors(StreamWriter file, string tracingFile, int tracingLineNumber)
        {
            List<Tuple<int, string, GraphNode>> extraPrints = new List<Tuple<int, string, GraphNode>>();

            file.WriteLine("Lines affected by input file:" + tracingFile + " - line number: [" + tracingLineNumber.ToString() + "]");
            //for each file name that has affected code
            foreach (string fN in affectedDict.Keys)
            {
                //trim the file name to the last part of the string behind the last directory separator char.
                //e.g. /folder/another/importantFile.java -> /importantFile
                //this allows safety to simply input "/importantFile" (see modulenavigator as well)
                string fnModded = fN;
                if (fN.LastIndexOf(Path.DirectorySeparatorChar) > 0)
                {
                    fnModded = fnModded.Substring(fnModded.LastIndexOf(Path.DirectorySeparatorChar));
                }
                //for each line number within the files that have affected code
                foreach (int lN in affectedDict[fN].Keys)
                { 
                    List<Dictionary<GraphNode,Relationship>> gnDictList = affectedDict[fN][lN];
                    //output affected filename, graphnode.tostring, and where it originates from (if it is a statement) in a tree format
                    foreach (Dictionary<GraphNode,Relationship> d in gnDictList)
                    {
                        //isolate the graphnodes
                        foreach (GraphNode g in d.Keys)
                        {
                            //if the graphnode has yet to be printed before, or if we are trying to print a statement of the graphnode and not the graphnode itself
                            if (!g.outputPrint || (g.outputPrint && g.Represented.GetLineStart() != lN))
                            {
                                //if we find a match for the input that the user entered within the csv input file
                                if (fnModded == tracingFile && g.Represented.GetLineStart() == tracingLineNumber)
                                {
                                    //write to output, increment the printlevel, and then print children
                                    WriteToOutput("fm", file, fN, g.Represented.GetLineStart(), g, false);
                                    printLevel += ",";
                                    PrintChildren(g, file);
                                    printLevel = printLevel.Remove(printLevel.Length - 1);
                                }
                                //if it doesn't match the user input yet, but the file matches
                                else if (g.statementDetails.ContainsKey(tracingFile))
                                {
                                    foreach (int lineNum in g.statementDetails[tracingFile])
                                    {
                                        //check to see if any of the statements match the user input
                                        if (lineNum == tracingLineNumber)
                                        {
                                            //if a statement matches, write to output, increment the printlevel, and then print parents
                                            WriteToOutput("cs", file, fN, lineNum, g, true);
                                            printLevel += ",";
                                            PrintParents(g, file);
                                            printLevel = printLevel.Remove(printLevel.Length - 1);

                                        }
                                        //if the statement doesn't match
                                        else
                                        {
                                            //if a match to the user input has been found already
                                            if (outputStarted)
                                            {
                                                WriteToOutput("se", file, fN, lN, g, true);
                                                printLevel += ",";
                                                PrintChildren(g, file);
                                                printLevel = printLevel.Remove(printLevel.Length - 1);
                                            }
                                            //if a match to the user input has not been found
                                            else
                                            {
                                                Tuple<int, string, GraphNode> t = Tuple.Create(lN, fN, g);
                                                extraPrints.Add(t);
                                            }
                                        }
                                    }

                                }
                                //if the filename doesn't match what the user inputted
                                else
                                {
                                    //if a match to the user input has been found already
                                    if (outputStarted)
                                    {
                                        WriteToOutput("ca", file, fN, lN, g, false);
                                        printLevel += ",";
                                        PrintChildren(g, file);
                                        printLevel = printLevel.Remove(printLevel.Length - 1);
                                    }
                                    //if a match to the user input has not been found, store the data to print later
                                    else
                                    {
                                        Tuple<int, string, GraphNode> t = Tuple.Create(lN, fN, g);
                                        extraPrints.Add(t);
                                    }
                                }
                            }   
                        }
                    }
                }
                //reset the outputStarted variable in case of multiple user inputs
                outputStarted = false;
            }
            //print the data that was stored before a match to the user input was found
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
            //write a new line to separate the differing outputs and reset for a new input tracing
            file.WriteLine();
            extraPrints.Clear();
            statementsWritten.Clear();
            CleanMarkedGNs();
        }

        //printparents takes all of the parentGNs of the graphnode parameter and writes them to the output.
        //any statements contained within the parents are also affected
        private void PrintParents(GraphNode g, StreamWriter file)
        {
            //classes store many variables we don't regard, skip 
            if (!g.Represented.Node.IsClassification)
            {
                //indicate that the graphnode has been printed and increment the print level
                MarkGraphNodePrinted(g);
                printLevel += ",";
                //for each parent, make sure it hasn't been printed beofre, and write the graphnode and any statements to the output.
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
                }
                //if the graphnode has no parents, but it has statements, print them
                if (g.GetParentGNs().Count < 1)
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
            
        }

        //printchildren takes all of the childrenGNs of the graphnode parameter and writes them to the output.
        //any statements contained within the children are also affected
        private void PrintChildren(GraphNode g, StreamWriter file)
        {
            //classes store many variables we don't regard, skip
            if (!g.Represented.Node.IsClassification)
            {
                //indicate that the graphnode has been printed and increment the print level
                MarkGraphNodePrinted(g);
                //for each child, make sure it hasn't been printed beofre, and write the graphnode and any statements to the output.
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
                //if the graphnode has no children, but it has statements, print them
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
        }

        //mark the outputPrint variable of the graphnode as true and add it to a static dictionary for tracking/resetting
        private void MarkGraphNodePrinted(GraphNode g)
        {
            g.outputPrint = true;
            if (!markedGNs.Contains(g))
            {
                markedGNs.Add(g);
            }
        }

        //reset all of the marked graphnodes so the user can track multiple inputs
        private void CleanMarkedGNs()
        {
            foreach(GraphNode g in markedGNs)
            {
                g.outputPrint = false;
                g.dictPrint = false;
            }
            markedGNs.Clear();
        }

        //write the information to the output. the string prepend is currently not used, but can be included  in the file.WriteLine statement for informative/debugging purposes
        void WriteToOutput(string prepend, StreamWriter file, string fileName, int lineNum, GraphNode origin, bool statement)
        {
            Tuple<string, int> s = Tuple.Create(fileName, lineNum);
            //if the graphnode has not been printed before OR it is a statement AND the statement hasn't been written before
            if ((!origin.dictPrint || statement) && !statementsWritten.Contains(s))
            {
                int timesUsed = 0;
                string timeUsedStr = "";
                Dictionary<GraphNode, int> combDict = origin.GetCombinedDict();
                if (!outputStarted)
                {
                    //output started if we reach this point
                    outputStarted = true;
                }

                if (combDict != null)
                {
                    //if the graphnode has been used in other tracing fields before, mark the number of times it was hit.
                    //this avoids printing duplicates
                    if (combDict.ContainsKey(origin))
                    {
                        timesUsed = combDict[origin];
                        if (timesUsed > 1)
                        {
                            timeUsedStr = " * " + timesUsed.ToString();
                        }
                    }
                }

                //if we print a statement, don't mark the graphnode.dictPrint as true, but write to the statementsWritten dictionary
                if (statement)
                {
                    statementsWritten.Add(s);
                    file.WriteLine(printLevel + "[" + fileName + "::" + lineNum.ToString() + "](originated from: " + origin.Represented.ToString() + timeUsedStr + ")");
                }
                //if we print a graphnode, mark the graphnode.dictPrint as true
                else
                {
                    origin.dictPrint = true;
                    if (!markedGNs.Contains(origin))
                    {
                        markedGNs.Add(origin);
                    }
                    file.WriteLine(printLevel + "[" + fileName + "::" + lineNum.ToString() + "](" + origin.Represented.ToString() + timeUsedStr + ")");
                }
            }
        }
    }
}
