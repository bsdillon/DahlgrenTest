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
        private List<TraceTree> trees = new List<TraceTree>();
        private AffectedLine al;
        //variables to hold the user-inputted csv fields
        private string errorDescription;
        private string errorProperty;
        //Austin: variables to hold the user-inputted Critical input csv fields
        private string criticalDescription;
        private string criticalProperty;
        //Austin: new placeholder AffectedLine, trying to duplicate al to separate output to the new output file
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

            //find all graphnodes that are related to the line number entered by the user
            TraceTree root = new TraceTree(fileName, lineNum, errorP + ": " + errorD);
            FindAffectedNodes(root, AbbreviatedGraph.GetNodes(fileName,lineNum));

            //csv output
            root.TraceDown(gFile, "");

            gFile.WriteLine(missedTraces);
            gFile.Close();
            missedTraces = "";
        }
        public void FindCriticalCSVConnections(string fileName, int lineNum, string criticalFileName, int criticalLineNum, string fileStem, string criticalD, string criticalP, string errorD, string errorP)
        {
            criticalProperty = errorP;
            criticalDescription = errorD;

            errorDescription = criticalD;
            errorProperty = criticalP;
            string outputFileName = "_critical_nodes_output.csv";
            string fullFile = fileStem + outputFileName;
            StreamWriter cFile = new StreamWriter(fullFile, false);
            //I have a dictionary- here's the fileNamekey (e.g., "/bubblemod- line 2") and returns the list of graph nodes

            // e.g., lineNums["/bubblesort"] would output a Dictionary<int, List<GraphNode>>
            // e.g., lineNumDict["/bubblesort"][1] would output a List of GraphNodes that are related to /bubbleSort line number 1
            Console.WriteLine("****AJF: relatedGNodes is: lineNumDict[" + fileName + "][" + lineNum + "]");
            Console.WriteLine("****AJF: criticalrelatedGdGNodes is: lineNumDict[" + criticalFileName + "][" + criticalLineNum + "]");

            //List<GraphNode> relatedCriticalGNodes = lineNumDict[criticalFileName][criticalLineNum];

            //acl = new AffectedLine();
            //find all graphnodes that are related to the line number entered by the user
            Console.WriteLine("****AJF: File Stem: " + fileStem);
            //FindAffectedNodes(relatedGNodes, cFile, acl);
            //Console.WriteLine("Got through FindAffectedNodes");
            //csv output
            //AffectedLine acl;
            //BSD should be some form of trace tree
            //traceTree.TraceUp(cFile);
            //acl.OutputCSVErrors(cFile, fileName, lineNum);
            //Console.WriteLine("finished outputting CSV errors");
            cFile.WriteLine(missedTraces);
            cFile.WriteLine("****AJF: Does this file have access to Critical Nodes? Critical Description: " + criticalD + " Critical Props: " + criticalP);
            cFile.Close();
            //Console.WriteLine("closed file");
            missedTraces = "";
        }

        private void FindAffectedNodes(TraceTree root, List<AbbreviatedGraph> gNodes)
        {
            //for every affected graph node, trace the relationships down the chain until everything has been traced
            foreach (AbbreviatedGraph g in gNodes)
            {
                //Console.WriteLine("does a single graphnode exist?");
                if (!g.Represented.Node.IsClassification)
                {
                    //Console.WriteLine("got to classification?");
                    //constructor, literal, statement, return type, return, method are potential future cases to consider
                    //field, param, local variable**, return value, method are used in the state tracing

                    //switch statement to trace the different member types.
                    //each member type has a different set of relationships (writtento, candidateread, etc.) that needs to be traced.
                    //these tracing functions all call each other and can be called according to a series of complex function calls and conditional statements
                    //the oringial tracing was configured through thorough debugging and will likely change slightly according to the customer's needs
                    switch (g.Represented.Node.GetMyMember())
                    {
                        case Members.Field:
                            //Console.WriteLine("field reached");
                            TraceField(TraceTree.ConditionalLinkToParent(root, g));
                            break;
                        case Members.Parameter:
                            //Console.WriteLine("parameter reached");
                            TraceParameter(TraceTree.ConditionalLinkToParent(root, g));
                            break;
                        case Members.Method:
                            //Console.WriteLine("method reached");
                            TraceMethod(TraceTree.ConditionalLinkToParent(root, g));
                            break;
                        case Members.MethodScope:

                            AbbreviatedGraph p = g.findParentScope();
                            //Console.WriteLine("methodscope reached");
                            if (p.Represented.Node.GetMyMember() == Members.Method)
                            {
                                //Console.WriteLine("methodscope if-then reached");
                                TraceMethod(TraceTree.ConditionalLinkToParent(root, p));
                            }
                            break;
                        case Members.Branch:
                            //Console.WriteLine("tracebranch reached");
                            TraceBranch(TraceTree.ConditionalLinkToParent(root, g));
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

        private List<AbbreviatedGraph> tracedGNs = new List<AbbreviatedGraph>();
        private static string missedTraces = "";

        //mark the GraphNode parameter as traced, and add it to the static tracedGNs list
        private void MarkGraphNodeTraced(AbbreviatedGraph g)
        {
            g.traced = true;
            tracedGNs.Add(g);
        }

        //reset the value of "traced" in each graphnode in case the user enters multiple filenames/line numbers to track.
        private void CleanTracedGNs()
        {
            foreach (AbbreviatedGraph g in tracedGNs)
            {
                g.traced = false;
            }
            tracedGNs.Clear();
        }

        //tracing field nodes
        private void TraceField(TraceTree parent)
        {
            AbbreviatedGraph gn = parent.GetGnode();
            List<AbbreviatedGraph> set = new List<AbbreviatedGraph>();
            //eventually, more relationships may be relevant to trace. future work would add in other conditional tracing here
            set.AddRange(gn.GetEdges(Relationship.WrittenBy).Keys.ToArray());
            Relationship r = Relationship.WrittenBy;
            foreach (AbbreviatedGraph grphNde in set)
            {
                /*
                 * Same comment as below
                if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                {
                    line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                }
                */

                TraceTree child = TraceTree.ConditionalLinkToParent(parent, grphNde);
                //field wants to trace back to anything it is related to.
                if (grphNde.Represented.Node.Equals(Members.Parameter))
                {
                    TraceParameter(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Method))
                {
                    TraceMethod(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Branch))
                {
                    TraceBranch(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Field))
                {
                    TraceField(child);
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

            set = new List<AbbreviatedGraph>();
            set.AddRange(gn.GetEdges(Relationship.ReturnType).Keys.ToArray());
            r = Relationship.ReturnType;
            foreach (AbbreviatedGraph grphNde in set)
            {
                /*
                 * Probably no longer needed:
                 * 1. this is just writing to the affected dictionary which probably belongs in TraceTree
                 * 2. This doesn't seem to continue the tree
                 * 3. Literals are things like "Hi" and 3 which cannot be affected by errors.
                if (grphNde.Represented.Node.GetMyMember() != Members.Literal)
                {
                    line.WriteStatementToAffectedDict(gn, grphNde, r, errorDescription, errorProperty);
                }
                */

                TraceTree child = TraceTree.ConditionalLinkToParent(parent, grphNde);
                //field wants to trace back to anything it is related to.
                if (grphNde.Represented.Node.Equals(Members.Parameter))
                {
                    TraceParameter(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Method))
                {
                    TraceMethod(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Branch))
                {
                    TraceBranch(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Field))
                {
                    TraceField(child);
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

            set = new List<AbbreviatedGraph>();
            //candidate read is necessary when it relates to methods/return values
            set.AddRange(gn.GetEdges(Relationship.CandidateRead).Keys.ToArray());
            r = Relationship.CandidateRead;
            foreach (AbbreviatedGraph grphNde in gn.GetEdges(r).Keys)
            {
                if (grphNde.Represented.Node.Equals(Members.Method))
                {
                    TraceMethod(TraceTree.ConditionalLinkToParent(parent, grphNde));
                }
            }

            //Accesses will be relevant once the CandidateRead issue (github issue #329) is fixed
        }

        //tracing parameter nodes
        private void TraceParameter(TraceTree parent)
        {
            AbbreviatedGraph gn = parent.GetGnode();
            Relationship r = Relationship.CandidateRead;
            foreach (AbbreviatedGraph grphNde in gn.GetEdges(r).Keys)
            {
                TraceTree child = TraceTree.ConditionalLinkToParent(parent, grphNde);
                //There are many members that could be relevant in the future. This logic provides the user with the most important traces
                if (grphNde.Represented.Node.Equals(Members.Method))
                {
                    TraceMethod(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Parameter))
                {
                    TraceParameter(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Branch))
                {
                    TraceBranch(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Field))
                {
                    TraceField(child);
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

        //tracing method nodes
        private void TraceMethod(TraceTree parent)
        {
            AbbreviatedGraph FromParent = parent.GetGnode();
            //Other relationships are subject to be added here in the future
            Relationship r = Relationship.CandidateRead;
            foreach (AbbreviatedGraph grphNde in FromParent.GetEdges(r).Keys)
            {
                //This shows that the method (return type below) is affecting the incoming parent as in int x = methodY();
                TraceTree.ConditionalLinkToParent(parent, grphNde);
            }

            //return value is neccesary in most cases (subject to change)
            r = Relationship.ReturnValue;
            foreach (AbbreviatedGraph grphNode in FromParent.GetEdges(r).Keys)
            {
                //Theoretically this grphNode should be identical with the grphNode above. Not sure but should be.
                //TODO check this assumption
                TraceReturnValue(TraceTree.ConditionalLinkToParent(parent, grphNode));
            }

            //control is rarer than return value, but relevant
            r = Relationship.Control;
            foreach (AbbreviatedGraph grphNde in FromParent.GetEdges(r).Keys)
            {
                //Theoretically this should be like the tracebranch below. ajf see ln 276
                TraceTree child = TraceTree.ConditionalLinkToParent(parent, grphNde);
                if (grphNde.Represented.Node.Equals(Members.Method))
                {
                    TraceMethod(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Parameter))
                {
                    TraceParameter(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Branch))
                {
                    TraceBranch(child);
                }
                else if (grphNde.Represented.Node.Equals(Members.Field))
                {
                    TraceField(child);
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

        //tracing branch nodes
        private void TraceBranch(TraceTree parent)
        {
            AbbreviatedGraph gn = parent.GetGnode();
            TraceTree child = TraceTree.ConditionalLinkToParent(parent, gn);
            //gn.AddToParentAndChildrenLists(gnPar);

            //get all of the line numbers in the affected branch (if/else)
            int start = gn.Represented.GetLineStart();
            int stop = gn.Represented.GetLineStop();
            for (int i = start; i <= stop; i++)
            {
                //TODO this needs to have logic to check each line and follow them.
                foreach (AbbreviatedGraph grphNde in AbbreviatedGraph.GetNodes(gn.Represented.FileName,i))
                {
                    //Theoretically this should be like the tracebranch below. ajf see ln 276
                    TraceTree c2 = TraceTree.ConditionalLinkToParent(child, grphNde);
                    if (grphNde.Represented.Node.Equals(Members.Method))
                    {
                        TraceMethod(c2);
                    }
                    else if (grphNde.Represented.Node.Equals(Members.Parameter))
                    {
                        TraceParameter(c2);
                    }
                    else if (grphNde.Represented.Node.Equals(Members.Branch))
                    {
                        TraceBranch(c2);
                    }
                    else if (grphNde.Represented.Node.Equals(Members.Field))
                    {
                        TraceField(c2);
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

        //tracing returnvalue nodes
        private void TraceReturnValue(TraceTree parent)
        {
            AbbreviatedGraph gn = parent.GetGnode();

            Relationship r = Relationship.WrittenBy;
            foreach (AbbreviatedGraph grphNode in gn.GetEdges(r).Keys)
            {
                //There are many members that could be relevant in the future. This logic provides the user with the most important traces
                if (grphNode.Represented.Node.Equals(Members.Field))
                {
                    /*
                     * Not sure why this is linking to parent of field instead of to field.
                    foreach (AbbreviatedGraph p in gn.GetParentGNs())
                    {
                        grphNode.AddToParentAndChildrenLists(p);
                    }
                    
                    This was the original recursive step independent of p
                    TraceField(grphNode, r, Members.Return, gn, line);
                    */

                    //BSD probably right, see note above
                    TraceTree child = TraceTree.ConditionalLinkToParent(parent, grphNode);
                    TraceField(child);
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
