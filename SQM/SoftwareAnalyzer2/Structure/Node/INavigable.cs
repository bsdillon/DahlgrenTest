using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Node
{
    /// <summary>
    /// INavigable extends the INode interface by adding parent-child structural relationships
    /// and the search and print capabilities which are based on that tree structure.
    /// </summary>
    public interface INavigable : INode
    {
        #region Structure Functionality
        /// <summary>
        /// A collection of nodes follow this node. The collection is 
        /// copied for consumption by foreach loops, making this 
        /// operation O(n) expensive.
        /// </summary>
        List<INavigable> Children { get; }

        /// <summary>
        /// The one node which immediately preceeds this one in the tree; The proper way of 
        /// establishing node relationship of parent to child for nodes X and Y is to set 
        /// y.Parent to X. This establishes the relationship completely with private methods.
        /// </summary>
        INavigable Parent { get; set; }

        /// <summary>
        /// Returns the size of the children collection in O(1) time
        /// </summary>
        /// <returns></returns>
        int GetChildCount();

        /// <summary>
        /// Gives direct access to the nth child node in O(1) time
        /// This method will throw an IndexOutOfRangeException if there is not nth node.
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        INavigable GetNthChild(int p);
        #endregion

        #region Print Functionality
        /// <summary>
        /// Recursive function which prints a text representation of AST to the console
        /// using indents to create a tree structure 
        /// </summary>
        void PrintTreeText();

        /// <summary>
        /// Recursive function which prints a text representation of AST to the StringBuilder
        /// using indents to create a tree structure
        /// </summary>
        /// <param name="sb"></param>
        void PrintTreeText(StringBuilder sb);

        /// <summary>
        /// Recursive function which prints node text representation of AST to the given output method
        /// using indents to create node tree structure
        /// </summary>
        /// <param name="action"></param>
        void PrintTreeText(Action<string> action);
        #endregion

        #region Search Functionality
        /// <summary>
        /// A non-trivial answer is defined as an unaltered answer name that has no code;
        /// this makes it node structural layer without symantic meaning
        /// </summary>
        /// <returns></returns>
        bool IsTrivial();

        /// <summary>
        /// Recursive search for the first child answer (including the one called) which is not trivial
        /// </summary>
        /// <returns></returns>
        INavigable GetNonTrivialChild();

        /// <summary>
        /// Recursive search for the first parent answer (NOT including the one called) which is not trivial
        /// </summary>
        /// <returns></returns>
        INavigable GetNonTrivialParent();

        /// <summary>
        /// Recursive search for the ancestor of the current answer which is proximal 
        /// to (i.e. node child of) the specificNode given
        /// </summary>
        /// <param name="target"></param>
        /// <returns></returns>
        INavigable GetDirectAncestorTo(INavigable specificNode);

        /// <summary>
        /// Recursive search for the ancestor of the current node which matches the 
        /// specificNode criteria
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetAncestor(string specificNode);

        /// <summary>
        /// Recursive search for the ancestor of the current node which matches the 
        /// specificNode criteria
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetAncestor(Members specificNode);
        
        /// <summary>
        /// Starting from a TypeDeclaration node, locates the set indicated and
        /// returns the collection within that set
        /// </summary>
        /// <param name="memberSets"></param>
        /// <returns></returns>
        List<INavigable> FromTypeGetSet(MemberSets memberSets);

        /// <summary>
        /// Find all child nodes which match the specificNode given
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        List<INavigable> GetAllFirstLayer(Members specificNode);

        /// <summary>
        /// Find all child nodes which match the specificNode given
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        List<INavigable> GetAllFirstLayer(string specificNode);

        /// <summary>
        /// Recursive function which identifies the first child node matching the 
        /// specificNode criteria among all nodes below this one
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstRecursive(string specificNode);

        /// <summary>
        /// Recursive function which identifies the first child node matching the 
        /// specificNode criteria among all nodes below this one
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstRecursive(MemberSets specificNode);

        /// <summary>
        /// Recursive function which identifies the first child node matching the 
        /// specificNode criteria among all nodes below this one
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstRecursive(Members specificNode);

        /// <summary>
        /// Non-recursive search which identifies the first child answer matching the specificNode criteria
        /// As node non-recursive function the search is limited to children of this answer and not all descendents
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstSingleLayer(string specificNode);

        /// <summary>
        /// Non-recursive search which identifies the first child answer matching the specificNode criteria
        /// As node non-recursive function the search is limited to children of this answer and not all descendents
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstSingleLayer(Members specificNode);

        /// <summary>
        /// Non-recursive search which identifies the first child answer matching the specificNode criteria
        /// As node non-recursive function the search is limited to children of this node and not all descendents
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        INavigable GetFirstSingleLayer(MemberSets specificNode);

        /// <summary>
        /// Recursive function which finds all child nodes matching the specificNode 
        /// criteria at any level below this answer in the tree and returns them in an unordered list
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        List<INavigable> BreadthFirstSearch(string specificNode);

        /// <summary>
        /// Recursive function which finds all child nodes matching the specificNode 
        /// criteria at any level below this answer in the tree and returns them in an unordered list
        /// </summary>
        /// <param name="specificNode"></param>
        /// <returns></returns>
        List<INavigable> BreadthFirstSearch(Members specificNode);

        /// <summary>
        /// Recursive function to find all nodes matching the specificNode, returning
        /// them int an unordered list.
        /// </summary>
        /// <param name="type"></param>
        /// <param name="answer"></param>
        void FullRecursiveSearch(Members specificNode, List<INavigable> answer);

        /// <summary>
        /// Recursive function which searches for errors within the entire AST.
        /// Any nodes which have not been changed by the tool or not been 
        /// correctly placed into the structure are identified. The presence 
        /// of any of these nodes represents a failure of the parser.
        /// </summary>
        /// <param name="errorMessages"></param>
        void ErrorScan(List<string> errorMessages);
        #endregion
    }
}
