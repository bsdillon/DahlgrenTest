using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Node.Implementations
{
    /// <summary>
    /// AbbreviatedNode is a placeholder which maintains the minimal amount of INode functionality
    /// without using an extensive amount of memory unlike ASTree (the more detailed implementation).
    /// This class is created after the graph has been finalized and is used during the metric calculations.
    /// The reduced memory requirements leave additional memory available for those metrics.
    /// </summary>
    public class AbbreviatedNode : INode
    {
        #region From INode
        private string code;

        //see declaration in INode
        public string Code
        {
            get
            {
                return code;
            }
        }

        private NodeType node;

        //see declaration in INode
        public NodeType Node
        {
            get
            {
                return node;
            }
        }

        //see declaration in INode
        public int ArrayDegree
        {
            get
            {
                return 0;
            }
            set
            {
                //no op; not of interest in this child class
            }
        }

        //see declaration in INode
        public string FileName { get; set; }

        public bool Expandable { get; set; }

        private string line;

        //see declaration in INode
        public string GetFileLineRange()
        {
            return line;
        }

        //see declaration in INode
        public bool OnSameLineAs(INode representNode)
        {
            AbbreviatedNode other = (AbbreviatedNode)representNode;
            return other.lineStart == this.lineStart && other.lineStop == this.lineStop;
        }
        #endregion

        #region Used by NodeFactory
        private object lineStart;
        private object lineStop;
        private int charStart;
        private int charStop;

        /// <summary>
        /// SetFile parses the line and character ranges and sets the file name as one action
        /// The method is used (vs Normal construction and FileName.set) when there is line
        /// data available.
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="lineDetail"></param>
        internal void SetFile(string fileName, string lineDetail)
        {
            this.FileName = fileName;
            line = lineDetail;
            string[] parts = lineDetail.Split("(:-) ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 1)
            {
                lineStart = int.Parse(parts[0]);
                lineStop = int.Parse(parts[0]);
            }
            else if (parts.Length == 2)
            {
                lineStart = int.Parse(parts[0]);
                lineStop = int.Parse(parts[1]);
            }
            else if (parts.Length == 3)
            {
                lineStart = lineStop = int.Parse(parts[0]);
                charStart = int.Parse(parts[1]);
                charStop = int.Parse(parts[2]);
            }
            else
            {
                throw new InvalidCastException("Line detail for node is illegally formated " + lineDetail);
            }
        }
        #endregion

        /// <summary>
        /// Default constructor with NodeType, but otherwise fixed values.
        /// </summary>
        /// <param name="node"></param>
        public AbbreviatedNode(NodeType node)
        {
            this.node = node;
            this.code = "";
            this.FileName = "--";
            this.line = "--";
            lineStart = -1;
            lineStop = -1;
        }

        /// <summary>
        /// Expanded constructor with additional code information
        /// </summary>
        /// <param name="node"></param>
        /// <param name="code"></param>
        public AbbreviatedNode(NodeType node, string code)
            : this(node)
        {
            this.code = code;
        }

        //standard implementation of method in parent class
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Node);
            if (line.Equals("--"))
            {
                sb.Append(": ");
            }
            else
            {
                sb.Append(GetFileLineRange());
            }

            sb.Append(Code);
            return sb.ToString();
        }
    }
}
