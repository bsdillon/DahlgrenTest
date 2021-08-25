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
        private Dictionary<string, Dictionary<int, List<GraphNode>>> affectedDict = new Dictionary<string, Dictionary<int, List<GraphNode>>>();
        //luTODO - create or add on to dictionary here that describes where things were affected from
        public AffectedLine()
        {
        }

        //luTODO -- take simulated data, mark it, terminate tracing at that point
        //luTODO -- fix the fibonacci error
        public void WriteToAffectedDict(GraphNode gn, string fileName, int lineNumber, bool trimFileN)
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
                        if (!affectedDict[fileName][lineNumber].Contains(gn))
                        {
                            affectedDict[fileName][lineNumber].Add(gn);
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
