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
                        GraphNode gnCopy = grphNde;
                        gnCopy.statementDetails = new KeyValuePair<string, int>(s.Represented.FileName, s.Represented.GetLineStart());

                        gnRel[gnCopy] = r;
                        smallGList.Add(gnRel);
                        iGNList[s.Represented.GetLineStart()] = smallGList;
                        affectedDict[s.Represented.FileName] = iGNList;
                    }
                    //if affectedDict contains the filename, does it also contain the line number we are trying to insert?
                    else if (!affectedDict[s.Represented.FileName].ContainsKey(s.Represented.GetLineStart()))
                    {
                        List<Dictionary<GraphNode, Relationship>> gnList = new List<Dictionary<GraphNode, Relationship>>();
                        Dictionary<GraphNode, Relationship> gnRelationship = new Dictionary<GraphNode, Relationship>();
                        GraphNode gnCopy = grphNde;
                        gnCopy.statementDetails = new KeyValuePair<string, int>(s.Represented.FileName, s.Represented.GetLineStart());

                        gnRelationship[gnCopy] = r;
                        gnList.Add(gnRelationship);
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
                    List<Dictionary<GraphNode,Relationship>> gnDictList = affectedDict[fN][lN];
                    //output affected filename, linenumber, and nodetype
                    string gnListStr = "";
                    foreach (Dictionary<GraphNode,Relationship> d in gnDictList)
                    {
                        foreach (GraphNode g in d.Keys)
                        {
                            //luTODO -- this output is still a WIP. 
                            //gnListStr += g.Represented.Node.ToString() + "," + d[g].ToString() + ",children (";
                            gnListStr += g.Represented.ToString() + ",children (";
                            foreach (GraphNode c in g.GetChildrenGNs())
                            {
                                if(c != null)
                                {
                                    if (c.statementDetails.Key != null)
                                    {
                                        gnListStr += "[" + c.statementDetails.Key + "::" + c.statementDetails.Value.ToString() + "]; "; 
                                    }
                                    else
                                    {
                                        gnListStr += c.Represented.ToString() + "; ";
                                    }
                                    
                                }  
                            }
                            gnListStr += "),parents (";
                            foreach (GraphNode p in g.GetParentGNs())
                            {
                                if(p != null)
                                {
                                    if (p.statementDetails.Key != null)
                                    {
                                        gnListStr += "[" + p.statementDetails.Key + "::" + p.statementDetails.Value.ToString() + "]; ";
                                    }
                                    else
                                    {
                                        gnListStr += p.Represented.ToString() + "; ";
                                    }
                                }  
                            }
                            gnListStr += "),sisters (";
                            foreach (GraphNode s in g.GetSisterGNs())
                            {
                                if (s != null)
                                {
                                    if (s.statementDetails.Key != null)
                                    {
                                        gnListStr += "[" + s.statementDetails.Key + "::" + s.statementDetails.Value.ToString() + "]; ";
                                    }
                                    else
                                    {
                                        gnListStr += s.Represented.ToString() + "; ";
                                    }
                                }
                            }
                            gnListStr += "),";
                        }
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
