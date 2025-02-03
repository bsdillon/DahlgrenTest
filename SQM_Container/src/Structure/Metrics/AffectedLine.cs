using SoftwareAnalyzer2.Structure.Gephi;
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
        //outputStarted determines the order of the output tree. If the user wants to track an error on line 14 (and enters it within their csv input),
        //the output will start with line 14 of the file they inputted.
        // private bool outputStarted = false;
        // TODO This is probably valid but has been commented out because it generates warnings in compilation.

        //statementsWritten prevents any duplicate statements from being outputted. Remember: not every line in the codebase is tracked by a graphnode.
        //some graphnodes have statements (which don't have relationships) and they are our main source of tracking many items. 
        //while statements are not ideal due to their lack of information, abbreviatedgraphs and gephinodes had even less information when that was the main approach for tracing files
        private List<Tuple<string, int>> statementsWritten = new List<Tuple<string, int>>();
        private static List<GraphNode> markedGNs = new List<GraphNode>();

        public AffectedLine()
        {
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
    }
}
