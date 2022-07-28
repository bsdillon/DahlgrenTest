using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class TraceTree
    {
        #region Variables
        private List<TraceTree> children = new List<TraceTree>();
        private TraceTree parent = null;
        private AbbreviatedGraph gnode;
        private string file;
        private int line;
        private string error;
        private string label;

        private static Dictionary<string, TraceTree> AllTrees = new Dictionary<string, TraceTree>();

        public static TraceTree GetAnyTree(string label)
        {
            if(AllTrees.ContainsKey(label))
            {
                return AllTrees[label];
            }
            return null;
        }
        #endregion

        #region Constructors, Getters and Setters
        public AbbreviatedGraph GetGnode()
        {
            return gnode;
        }
        public TraceTree(string file, int line, string error)
        {
            gnode = AbbreviatedGraph.Create(NodeFactory.CreateNode(Members.Null, false));
            this.file = file;
            this.line = line;
            this.error = error;
            this.label = "TraceTree:" + file + ":" + line + ":" + error;
            TraceTree.AllTrees.Add(this.label, this);
        }
        #endregion

        #region ConditionalLinktoParent/Child
        /// <summary>
        /// Conditional link makes several checks for a valid child node associated with the child graph
        /// BUT it may return a null if those conditions are not found. It will create a new TraceTree and
        /// append it to the parent ONLY if 
        /// * Child is not simulated
        /// * Child has not been seen in this tree before.
        /// 
        /// In all other cases it returns a null -- so beware
        /// </summary>
        /// <param name="parent"></param>
        /// <param name="child"></param>
        /// <returns></returns>
        public static TraceTree ConditionalLinkToParent(TraceTree parent, AbbreviatedGraph child)
        {
            if(child.IsSimulated)
            {
                return null;
            }
            

            if(!MetricUtilities.GephiExists(child))
            {
                //create one just for this purpose
                MetricUtilities.InitializeGephiNode(child, child, MetricUtilities.NextModule(), NodePatterns.None, AccessPatterns.None, false);
                
            }

            GephiNode myChild = MetricUtilities.GephiFromGraph(child);
            if(myChild.HasProperty(parent.label))
            {
                return null;
            }

            myChild.AddProperty(parent.label);

            //BSD Needed? Not after AllTrees
            //InsertIntoCombinedDict(g);

            TraceTree tmp = new TraceTree(parent, child);
            tmp.file = parent.file;
            tmp.line = parent.line;
            tmp.error = parent.error;
            tmp.label = parent.label;
            return tmp;
        }

        private TraceTree(TraceTree myParent, AbbreviatedGraph ag)
        {
            gnode = ag;
            parent = myParent;
            myParent.children.Add(this);
        }
        #endregion

        #region TraceUp and Tracedown TraceTree
        public void TraceDown(StreamWriter wr, string level)
        {
            wr.WriteLine(level+this);
            foreach(TraceTree tt in children)
            {
                tt.TraceDown(wr, level+"   ");
            }
        }
        public string TraceUp(StreamWriter wr)
        {
            string level = "";
            if(this.parent!=null)
            {
                level = parent.TraceUp(wr);
            }
            wr.WriteLine(level+this);
            return level + "   ";
        }

        public override string ToString()
        {
            if(this.parent==null)
            {
                return "Trace Tree: " + this.label;
            }
            return this.gnode.ToString();
        }
        #endregion
    }
}
