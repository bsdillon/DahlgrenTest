using SoftwareAnalyzer2.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Node
{
    /// <summary>
    /// The INode interface is the minimal amount of functionality required to describe a node within the graph.
    /// Typically the interface is used to read basic attributes, not to modify or move through the graph.
    /// </summary>
    public interface INode
    {
        #region Basic Attributes
        /// <summary>
        /// When true, indicates that method parameter may contain multiple items as in
        /// Method(TypeA param1, TypeB ... paramSet) where paramSet is Expandable.
        /// </summary>
        bool Expandable { get; set; }

        /// <summary>
        /// Returns a single string which represents each of the code elements of this node.
        /// This value is read only. Use AddCode to alter the value.
        /// </summary>
        string Code { get; }

        /// <summary>
        /// The NodeType for a node in the AST. All nodes start as NULL. This attribute is
        /// read-only. The NodeType must be set via the SetNode method.
        /// </summary>
        NodeType Node { get; }

        /// <summary>
        /// The order of the array value of this type (i.e. int [][] node is of order 2)
        /// Zero degree by default
        /// </summary>
        int ArrayDegree { get; set; }

        /// <summary>
        /// The file from which the node was derived
        /// </summary>
        string FileName { get; set; }
        #endregion

        #region Line and character ranges
        /// <summary>
        /// Returns a string describing the range of lines and characters 
        /// in the file where the for this node code may be found.
        /// </summary>
        string GetFileLineRange();

        /// <summary>
        /// Returns true if the lines match between this and node. This is one condition
        /// to be considered as part of an equality check
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        bool OnSameLineAs(INode node);
        #endregion
    }
}
