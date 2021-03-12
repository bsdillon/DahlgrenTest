using SoftwareAnalyzer2.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace SoftwareAnalyzer2.Structure.Node.Implementations
{
    /// <summary>
    /// ASTree implements the highest node interface (IModifiable). This gives it all the functionality 
    /// required of all three interfaces (INode, INavigable, IModifiable). It's main purpose is the 
    /// aid in the construction and manipulation of the AST.
    /// 
    /// ASTree is NOT meant to be directly constructed. Instead NodeFactory methods allow for the 
    /// instantiation and file I/O of ASTree. All other operations should be handled through one of
    /// the interface functions.
    /// </summary>
    public class ASTree : IModifiable
    {
        #region Used by NodeFactory
        #region Version history
        //first digit-prototype/release version
        //second digit-version of the parser
        //third digit-slight improvement
        //0.5.3 added file name to all nodes in the tree as part of XML file.
        //0.6.0 Revised the use of strings in all but trivial nodes in favor of Enumerated values.
        //0.6.1 Altered structure create the classification set with the type (CLASS, ENUM, INTERFACE) as node subordinate
        //0.6.2 Added Members.Default as node type
        //0.6.3 Fixed problem with switch using multiple values in node sinlge block.
        //0.7.0 Had problems with the relationship between assignment operators and arrayinvokations. 
        //0.7.1 Added self-referencing constructors and parameters i.e. this.stuff
        //0.7.2 Added Trinary, structure of nested expressions, error checking
        //0.7.3 Alteration of NodeTyep memberships
        //0.7.4 8/6/2015 Added types for generics and type checking
        //0.7.5 8/20/2015 Added new SuperConstructor type
        //0.8.0 8/24/2015 Added node type to all Literals
        //0.8.1 10/28/2015 Altered anonymous classes to extend the parent type
        //0.8.2 10/28/2015 Created method to generate unique names for anonymous classes
        //0.8.3 11/10/2015 Altered the order of nested expression and selfreference modifiers because the later wasn't working
        //0.8.4 11/13/2015 Changed the anonymous constructors to invoke the parent constructor.
        //0.8.5 11/14/2015 Added Link to be used with anonymous constructors.
        //0.8.6 11/19/2015 Added classfication to parent types
        //0.8.7 11/20/2015 Added logic to ignore generic types when parsing parent types
        //0.8.8 12/21/2015 Added modifiers as specific member types
        //0.8.9 2/1/2016 Altered the parsing of For3Loop to separate expressions from field definitions in the initialization block.
        //0.8.10 2/1/2016 Altered the parsing of For3Loop fields to correctly use the universal format.
        //0.8.11 2/16/2016 Changed parser to throw an error for any internal annotation types
        //0.8.12 2/22/2016 Fixed parsing of ArrayInokation to include array degree.
        //0.8.13 2/26/2016 Fixed multi-dimensional array invokations to have nexted parameters.
        //0.8.14 3/2/2016 Changed switch value parenting to allow complex expressions
        //0.8.15 3/21/2016 Fixed the anonymous constructor reconfiguration and constructor parameter parsing.
        //0.8.16 3/22/2016 Fixed non-uniform method parameter parsing
        //0.8.17 3/22/2016 Fixed error in generic invokations
        //0.9.0  3/23/2016 Moved all language-specific items to ILanguage and changed literals to reflect that move
        //0.9.1  4/8/2016 Added name parsing for type.member strings which had not been parsed into inverted expressions.
        //0.9.2  4/22/2016 Improvement to name parsing.
        //0.9.3  4/26/2016 Fixed error in primitive types for array constructors.
        //1.0.0  12/18/2017 Having completed all of the work for my Phd, this is a final clean up and version update.

        private const string VERSION = "1.0.0";

        /// <summary>
        /// Returns true if the given file matches the current AST version.
        /// False otherwise.
        /// </summary>
        /// <param name="xmlFile"></param>
        /// <returns></returns>
        public static bool IsCurrentVersion(string xmlFile)
        {
            XmlReader reader = XmlReader.Create(xmlFile);
            ASTree root = new ASTree(false);
            reader.Read(); reader.Read();

            string version = reader.GetAttribute("version");
            reader.Close();

            string[] file = version.Split('.');
            string[] code = VERSION.Split('.');

            //current definition of "current" version is that the value and order of the verison number match
            bool ans = (file.Length == code.Length);
            for (int i = 0; i < file.Length && i < code.Length; i++)
            {
                //update for each version level
                ans &= file[i].Equals(code[i]);
            }

            return ans;
        }
        #endregion

        /// <summary>
        /// Only constructor for ASTree
        /// </summary>
        /// <param name="naturalNode"></param>
        public ASTree(bool naturalNode)
        {
            IsNatural = naturalNode;
        }

        internal const string FileExtension = ".AST";

        /// <summary>
        /// Writes an XML representation of AST to the given file location
        /// </summary>
        /// <param name="output"></param>
        public void WriteXMLTree(string fileName, string baseFolder)
        {
            XmlWriter writer = XmlWriter.Create(fileName);

            int nameStart = baseFolder.Length;
            string file = fileName.Substring(nameStart, fileName.Length - 4 - nameStart);

            writer.WriteStartElement("ASTree");
            writer.WriteAttributeString("version", "" + ASTree.VERSION);
            writer.WriteAttributeString("date", "" + DateTime.Now.Ticks);

            RecursiveXMLWrite(writer, file);

            writer.WriteEndElement();

            writer.Close();
        }

        /// <summary>
        /// Reads an XML representation of AST from the given file location
        /// </summary>
        /// <param name="xmlFile"></param>
        /// <returns></returns>
        public static ASTree ReadXMLTree(string xmlFile)
        {
            XmlReader reader = XmlReader.Create(xmlFile);
            ASTree root = new ASTree(false);
            reader.Read(); reader.Read();

            reader.Read(); //Go to File answer
            root.RecursiveXMLRead(reader);//start recursive read

            reader.Close();
            return root;
        }

        /// <summary>
        /// Assesses the match of the targetNode and candidate in question returning node 
        /// boolean value indicating the presense of a potential match. This is 
        /// inconclusive for methods because it ignores parameter type matching.
        /// </summary>
        /// <param name="candidate"></param>
        /// <param name="allowAllParameters">True if any method matches should ignore parameters</param>
        /// <returns></returns>
        public bool IsCasualMatch(ASTree candidate, bool allowAllParameters)
        {
            //disqualify non-maching identifiers; exceptions for self reference and super reference
            if (!(Node.Equals(Members.SelfConstructorInvoke) || Node.Equals(Members.SuperConstructorInvoke)) && !this.Code.Equals(candidate.Code))
            {
                return false;
            }

            //determine the node text which will be node match
            bool isMethod = Node.IsInvocation;
            NodeType myNode = Node;
            List<NodeType> compliments = new List<NodeType>();

            try
            {
                compliments.AddRange(myNode.GetCompliments());
            }
            catch (InvalidCastException)
            {
                //based on compliments we should only receive expected types. If an unexpected
                //type is found in Nodetype.GetCompliments it will throw this exception
                //need to see what comes here and handle it.
                throw new InvalidCastException("ASTree.IsCasualMatch found type without compliments: " + this);
            }

            //at least one of the compliment node types need to match the candidate
            //we assume no match is found
            bool matchFound = false;
            foreach (NodeType n in compliments)
            {
                if (n == candidate.Node)
                {
                    //correct that assumption for any match
                    matchFound = true;
                }
            }

            //if there is no matching compliment, then this node is not an eligible match
            if (!matchFound)
            {
                return false;
            }

            if (isMethod)
            {
                if (allowAllParameters)
                {
                    //no checking of parameters.
                    return true;
                }

                //disqualify overloaded methods with different NUMBERS of parameters
                ASTree paramList = (ASTree)GetFirstSingleLayer(Members.ParameterList);
                int myParams = paramList.children.Count;
                ASTree canParamList = (ASTree)candidate.GetFirstSingleLayer(Members.ParameterList);
                List<ASTree> candidateParamList = canParamList.children;
                int candidateParams = candidateParamList.Count;

                //if there is an extendible parameter
                if (candidateParams > 0 && candidateParamList[candidateParams - 1].Expandable)
                {
                    //Expandable parameters may be zero so add offset to allow for greater count
                    return (candidateParams <= myParams + 1);
                }

                //Naive parameter match at this point seems to indicate node match. This does not
                //check that types are also node match. Nor is it the best match. With this logic
                //do(int, int) and do(double, double) will both be matches for do(1,3) so order
                //of evaluation becomes important. 
                return (candidateParams == myParams);
            }

            //after excluding all non-matches and specific cases for methods this must be node match.
            return true;
        }
        #endregion

        #region Error Checking
        //see declaration in INavigable
        public void ErrorScan(List<string> answer)
        {
            // Checks for nodes which have not been handled (trivial nodes still 
            // in the tree) and flags them as errors
            if (Node.IsUnknown)
            {
                answer.Add("ERROR: Trival layers still exist in the tree: " + this.ToString() + System.Environment.NewLine);
            }

            // Checks for the correct configuration of all nodes within a TypeDeclaration
            if (Node.Equals(Members.TypeDeclaration))
            {
                //There should be exactly this set of element sets in the next level
                List<NodeType> expectedElements = new List<NodeType>();
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Classification));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.ModifierSet));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.SuperTypes));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Enumerations));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Constructors));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Methods));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Types));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Values));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Fields));
                expectedElements.Add(NodeType.CreateNodeType(MemberSets.Inlines));

                List<string> unknownElements = new List<string>();
                foreach (ASTree c in children)
                {
                    //by removing this node we prevent multiple nodes of the
                    //required child nodes. The removal returns true/false
                    //depends on whether c matches anything expected
                    if (!expectedElements.Remove(c.Node))
                    {
                        //if it is not expected, the unknown node is remembered
                        unknownElements.Add(c.ToString());
                    }
                }

                //Several of the collections nodes are optional. We
                //remove them from the expectations before checking for 
                //additional required nodes which werent' found
                expectedElements.Remove(NodeType.CreateNodeType(MemberSets.Fields));
                expectedElements.Remove(NodeType.CreateNodeType(MemberSets.Inlines));
                expectedElements.Remove(NodeType.CreateNodeType(MemberSets.Values));

                if (expectedElements.Count > 0)
                {
                    //If one of the required nodes was never found
                    //something is wrong with the type structure
                    answer.Add("ERROR: Expected major element was not found on " + this.ToString() + System.Environment.NewLine);
                    foreach (NodeType s in expectedElements)
                    {
                        answer.Add("\t Element " + s + " not found\r\n");
                    }
                }

                if (unknownElements.Count > 0)
                {
                    //Some unexpected node was found; this is an error
                    answer.Add("ERROR: Unexpected answer found at the level of major elements on " + this.ToString() + System.Environment.NewLine);
                    foreach (string element in unknownElements)
                    {
                        answer.Add(element);
                    }
                }
            }

            //recursive step
            foreach (ASTree child in Children)
            {
                child.ErrorScan(answer);
            }
        }
        #endregion

        #region Tree structure
        private ASTree parent;

        //see declaration in INavigable
        public INavigable Parent
        {
            get
            {
                return parent;
            }
            set
            {
                parent = (ASTree)value;
                parent.children.Add(this);
            }
        }

        private List<ASTree> children = new List<ASTree>();

        //see declaration in INavigable
        public List<INavigable> Children
        {
            get
            {
                List<INavigable> answer = new List<INavigable>();
                foreach (ASTree child in children)
                {
                    answer.Add(child);
                }
                return answer;
            }
        }

        //see implementation in INavigable
        public int GetChildCount()
        {
            return children.Count;
        }

        //see declaration in INavigable
        public INavigable GetNthChild(int index)
        {
            if (children.Count <= index)
            {
                throw new IndexOutOfRangeException("Nth Child does not exist. " + children.Count + " children available in " + this);
            }
            return children[index];
        }

        //see declaration in IModifiable
        public void DropChildren()
        {
            foreach (ASTree child in children)
            {
                child.parent = null;
            }
            children = new List<ASTree>();
        }

        //see declaration in IModifiable
        public void RemoveChild(IModifiable child)
        {
            if (!children.Contains(child))
            {
                throw new InvalidOperationException("RemoveChild error: Cannot find Child " + child + " in Node " + this);
            }
            children.Remove((ASTree)child);
        }

        //see declaration in IModifiable
        public void ReplaceChild(IModifiable currentChild, IModifiable nextChild)
        {
            ASTree curr = (ASTree)currentChild;
            ASTree next = (ASTree)nextChild;
            int index = children.IndexOf(curr);
            children.Remove(curr);
            curr.parent = null;
            children.Insert(index, next);
            next.parent = this;
        }

        //see declaration in IModifiable
        public IModifiable Collapse(string specificNode)
        {
            return Collapse(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in IModifiable
        public IModifiable Collapse(Members specificNode)
        {
            return Collapse(NodeType.CreateNodeType(specificNode));
        }

        //private function to enable interface
        private IModifiable Collapse(NodeType specificNode)
        {
            return Collapse(specificNode, "");
        }

        //see declaration in IModifiable
        public IModifiable Collapse(string specificNode, string specificCode)
        {
            return Collapse(NodeType.CreateNodeType(specificNode), specificCode);
        }

        //private function to enable interface
        private ASTree Collapse(NodeType specificNode, string specificCode)
        {
            //recursive step produces a set of children nodes which will be of interest
            //revise child list based on recursive collapse
            List<ASTree> newChildren = new List<ASTree>();
            foreach (ASTree child in children)
            {
                newChildren.Add(child.Collapse(specificNode, specificCode));
            }

            //clear the current collection as they are no longer valid.
            //replace them with the new set of already-collapsed child nodes
            children.Clear();
            foreach (ASTree child in newChildren)
            {
                if (child != null)//child nodes can be null (see return value below)
                {
                    child.Parent = this;
                }
            }

            //determine if this node should collapse
            if (Node == specificNode && IsNatural && Code.Equals(specificCode))
            {
                //this is redundant so collapse the tree by removing this node
                if (children.Count > 1)
                {
                    //too many children to collapse. This is an error state
                    throw new InvalidOperationException("Multiple children of collapsed node: " + this);
                }
                else if (children.Count == 1)
                {
                    //normal case with exactly one child
                    return children[0];
                }
                else if (children.Count == 0)
                {
                    //special case for empty expressions this is allowed,
                    //but there is nothing left in this branch.
                    return null;
                }
            }

            //this node is not redundant either because it has 
            //code in the node or because it has multiple children
            return this;
        }

        //see declaration in IModifiable
        public IModifiable Clone()
        {
            //create a copy of this node
            ASTree answer = new ASTree(IsNatural);
            answer.ArrayDegree = ArrayDegree;
            answer.myNode = Node;

            answer.CopyCode(this);
            answer.lineStop = lineStop;
            answer.charStop = charStop;

            //recursively create tree below this point
            foreach (ASTree child in children)
            {
                child.Clone().Parent = answer;
            }

            return answer;
        }
        #endregion

        #region Node Description
        //see declaration in INode
        public int ArrayDegree{ get; set;}

        //see declaration in INode
        public bool Expandable { get; set; }

        //see declaration in IModifiable
        public bool IsNatural { get; set; }

        #region FileName
        //see declaration in INode
        public string FileName { get; set; }

        //see declaration in IModifiable
        public void CopyFile(IModifiable source)
        {
            this.FileName = source.FileName;
        }
        #endregion

        #region Node Values
        //because the NodeType must be set by multiple setter methods
        //the value must be separted from the public attribute Node.
        NodeType myNode = NodeType.NULL;

        //see declaration in INode
        public NodeType Node
        { 
            get
            {
                return myNode;
            }
        }

        //see declaration in IModifiable
        public void SetNode(string s)
        {
            this.myNode = NodeType.CreateNodeType(s);
        }

        //see declaration in IModifiable
        public void SetNode(Members m)
        {
            this.myNode = NodeType.CreateNodeType(m);
        }

        //see declaration in IModifiable
        public void SetNode(NodeType m)
        {
            this.myNode = m;
        }
        #endregion

        #region Line and character ranges
        private int lineStart = -1;
        private int charStart = -1;
        private int lineStop = -1;
        private int charStop = -1;

        //see declaration in INode
        public string GetFileLineRange()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("(");
            if (lineStop == lineStart)
            {
                //single line elements have a specific character range on that line
                sb.Append(lineStart);

                if (charStart > -1)
                {
                    //specific character information on this line
                    sb.Append(":");
                    sb.Append(charStart);
                    sb.Append("-");
                    sb.Append(charStop);
                }
            }
            else
            {
                //multi-line so no character information at all
                sb.Append(lineStart);
                sb.Append("-");
                sb.Append(lineStop);
            }
            sb.Append("): ");
            return sb.ToString();
        }

        //see declaration in IModifiable
        public void SetLine(IModifiable source)
        {
            lineStart = lineStop = ((ASTree)source).lineStart;
        }

        //see declaration in INode
        public bool OnSameLineAs(INode node)
        {
            ASTree other = (ASTree)node;
            return other.lineStart == this.lineStart && other.lineStop == this.lineStop;
        }

        //see declaration in IModifiable
        public void NormalizeLines()
        {
            if (children.Count > 0)
            {
                //resort to the children to define node range
                int min = int.MaxValue;
                int max = int.MinValue;
                foreach (ASTree child in children)
                {
                    //allow each child to expand the scope of your lines 
                    //ignores child nodes with no scope (i.e. not natural nodes)
                    //only occurs if the child has node scope larger than yours
                    //so child nodes on the same line will have no effect
                    child.NormalizeLines();
                    if (child.lineStart > -1 && min > child.lineStart)
                    {
                        min = child.lineStart;
                    }

                    if (child.lineStop > 0 && max < child.lineStop)
                    {
                        max = child.lineStop;
                    }
                }

                //allow your own lines to affect the outcome
                //this catches the case where you have child nodes, but these are not natural naodes
                if (lineStart > -1 && min > lineStart)
                {
                    min = lineStart;
                }

                if (max < lineStop)
                {
                    max = lineStop;
                }

                if (this.Code.Length == 0)
                {
                    lineStart = min;
                    lineStop = max;
                }
            }
        }
        #endregion

        #region Code
        private List<string> code = new List<string>();

        //see declaration in INode
        public string Code
        {
            get
            {
                StringBuilder sb = new StringBuilder();

                //first code snippet
                if (code.Count > 0)
                {
                    sb.Append(code[0]);
                }

                //append subsequent snippets
                for (int i = 1; i < code.Count; i++)
                {
                    sb.Append(' ');
                    sb.Append(code[i]);
                }

                return sb.ToString();
            }
        }

        //see declaration in IModifiable
        public void AddCode(string codeSnippet, int line, int start)
        {
            code.Add(codeSnippet);
            if (lineStart == -1)
            {
                lineStart = line;
            }
            lineStop = line;

            if (charStart == -1)
            {
                charStart = start;
            }

            charStop = start + codeSnippet.Length - 1;
        }

        //see declaration in IModifiable
        public void AddCode(string codeSnippet, IModifiable lineSource)
        {
            ASTree a = (ASTree)lineSource;
            code.Add(codeSnippet);
            if (lineStart == -1)
            {
                lineStart = a.lineStart;
            }
            lineStop = a.lineStart;

            if (charStart == -1)
            {
                charStart = a.charStart;
            }

            charStop = charStart + codeSnippet.Length - 1;
        }

        //see declaration in IModfiable
        public void ClearCode(ClearCodeOptions o)
        {
            code = new List<string>();
            switch (o)
            {
                case ClearCodeOptions.KeepLine:
                    charStart = -1;
                    charStop = 0;
                    break;
                case ClearCodeOptions.ClearAll:
                    lineStart = charStart = -1;
                    lineStop = charStop = 0;
                    break;
                //default action is to keep everything
            }
        }

        //see declaration in IModifiable
        public void CopyCode(IModifiable source)
        {
            ASTree a = (ASTree)source;
            for (int i = 0; i < a.code.Count; i++)
            {
                code.Add("" + a.code[i]);
            }
            lineStart = a.lineStart;
            lineStop = a.lineStop;
            charStart = a.charStart;
            charStop = a.charStop;
        }

        //see declaration in IModifiable
        public void CopyCode(IModifiable source, int copyIndex)
        {
            ASTree a = (ASTree)source;
            if (a.code.Count <= copyIndex)
            {
                throw new ArgumentOutOfRangeException("ASTree " + source.ToString() + " does not have node code element at index " + copyIndex);
            }

            AddCode(a.code[copyIndex], a.lineStart, a.charStart);
        }

        //see declaration in IModifiable
        public void SimplifyCode(char[] excluded)
        {
            int line = lineStart;
            int chars = charStart;
            string[] s = Code.Split(excluded, StringSplitOptions.RemoveEmptyEntries);
            ClearCode(ClearCodeOptions.ClearAll);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < s.Length; i++)
            {
                sb.Append(s[i]);
            }
            AddCode(sb.ToString(), line, chars);
        }

        //see declaration in IModifiable
        public List<IModifiable> CreateNodesFromCode(char[] excluded)
        {
            List<IModifiable> answer = new List<IModifiable>();
            string myCode = Code;
            string[] tokens = myCode.Split(excluded, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < tokens.Length; i++)
            {
                ASTree n = new ASTree(false);
                n.AddCode(tokens[i], lineStart, charStart + myCode.IndexOf(tokens[i]));
                answer.Add(n);
            }

            return answer;
        }
        #endregion

        #region Text Output
        //overrides the original implementation in Object
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Node);

            if (!IsNatural)
            {
                //not a natural line, so there is no line information
                sb.Append(": ");
            }

            sb.Append(GetFileLineRange());

            //add the code and brackets for each level of the array
            sb.Append(Code);
            for (int i = 0; i < ArrayDegree; i++)
            {
                sb.Append(" []");
            }
            return sb.ToString();
        }

        //see declaration in INavigable
        public void PrintTreeText()
        {
            StringBuilder sb = new StringBuilder();
            RecursivePrint(0, sb);
            Console.Write(sb.ToString());
        }

        //see declaration in INavigable
        public void PrintTreeText(StringBuilder sb)
        {
            RecursivePrint(0, sb);
        }

        //see declaration in INavigable
        public void PrintTreeText(Action<string> output)
        {
            StringBuilder sb = new StringBuilder();
            RecursivePrint(0, sb);
            output(sb.ToString());
        }

        //private function to enable interface
        private void RecursivePrint(int level, StringBuilder output)
        {
            int l = level % 10;
            //full summary text
            output.Append(' ', 3 * level);
            output.Append(l);
            output.Append(this.ToString());
            output.Append("\n");

            foreach (ASTree child in children)
            {
                child.RecursivePrint(level + 1, output);
            }
        }
        #endregion

        #region XML Output
        //private function to enable interface
        private void RecursiveXMLRead(XmlReader reader)
        {
            this.myNode = NodeType.ReadFromFile(reader);
            FileName = reader.GetAttribute("fileName");
            IsNatural = bool.Parse(reader.GetAttribute("natural"));
            ArrayDegree = int.Parse(reader.GetAttribute("arrayDegree"));
            Expandable = bool.Parse(reader.GetAttribute("expandable"));

            if (IsNatural)
            {
                lineStart = int.Parse(reader.GetAttribute("lineStart"));
                lineStop = int.Parse(reader.GetAttribute("lineStop"));
                if (lineStop == lineStart)
                {
                    charStart = int.Parse(reader.GetAttribute("charStart"));
                    charStop = int.Parse(reader.GetAttribute("charStop"));
                }
            }

            int myDepth = reader.Depth;//check the current depth before looking for child nodes
            if (reader.IsStartElement())
            {
                //any start element may have additional child elements
                reader.Read();//skip self
                if (reader.Name.Equals("CodeSegments"))
                {
                    int count = int.Parse(reader.GetAttribute("count"));
                    reader.Read();//skip open tag
                    for (int i = 0; i < count; i++)
                    {
                        //not the close tag so must be code.
                        //put the code into the list
                        code.Add(reader.GetAttribute("value"));
                        reader.Read();
                    }
                    reader.Read();//skip the end tag
                }

                //any child answer will be node non-ending type and will have node lower dept
                while (reader.NodeType != XmlNodeType.EndElement && reader.Depth > myDepth)
                {
                    //read all the child nodes parenting each as you go
                    ASTree node = new ASTree(false);
                    node.RecursiveXMLRead(reader);
                    node.Parent = this;
                }

                //hit the close tag
                if (reader.Depth == myDepth && reader.NodeType == XmlNodeType.EndElement && Node.IsXMLTagEquivalent(reader))
                {
                    reader.Read();
                }
            }

            //finish answer and subtree
            return;
        }

        //private function to enable interface
        private void RecursiveXMLWrite(XmlWriter writer, string fileName)
        {
            Node.WriteToFile(writer);
            writer.WriteAttributeString("fileName", fileName);
            writer.WriteAttributeString("natural", "" + IsNatural);
            writer.WriteAttributeString("arrayDegree", "" + ArrayDegree);
            writer.WriteAttributeString("expandable", "" + Expandable);

            if (IsNatural)
            {
                writer.WriteAttributeString("lineStart", "" + lineStart);
                writer.WriteAttributeString("lineStop", "" + lineStop);

                if (lineStop == lineStart)
                {
                    writer.WriteAttributeString("charStart", "" + charStart);
                    writer.WriteAttributeString("charStop", "" + charStop);
                }
            }

            if (code.Count > 0)
            {
                writer.WriteStartElement("CodeSegments");
                writer.WriteAttributeString("count", "" + code.Count);

                //each code segment as its own answer
                foreach (string s in code)
                {
                    writer.WriteStartElement("Code");
                    writer.WriteAttributeString("value", s);
                    writer.WriteEndElement();
                }

                writer.WriteEndElement();
            }

            foreach (ASTree child in children)
            {
                child.RecursiveXMLWrite(writer, fileName);
            }

            writer.WriteEndElement();
        }
        #endregion
        #endregion

        #region Node Rename
        //see declaration in IModifiable
        public void Rename(string specificNode, Members newNode)
        {
            Rename(NodeType.CreateNodeType(specificNode), NodeType.CreateNodeType(newNode));
        }

        //see declaration in IModifiable
        public void Rename(string specificNode, string newNode)
        {
            Rename(NodeType.CreateNodeType(specificNode), NodeType.CreateNodeType(newNode));
        }

        //private function to enable interface
        private void Rename(NodeType specificNode, NodeType newNode)
        {
            if (Node == specificNode)
            {
                this.myNode = newNode;
            }

            foreach (ASTree child in Children)
            {
                child.Rename(specificNode, newNode);
            }
        }
        #endregion

        #region Node Modification
        //see declaration in IModifiable
        public void CodeModify(Action<IModifiable> modifier)
        {
            modifier(this);

            foreach (ASTree child in Children)
            {
                child.CodeModify(modifier);
            }
        }

        //see declaration in IModifiable
        public void LeafDownModify(string currentNode, string newNode, Action<IModifiable> modifier)
        {
            NodeModifyDown(NodeType.CreateNodeType(currentNode), NodeType.CreateNodeType(newNode), modifier);
        }

        //see declaration in IModifiable
        public void RootUpModify(string currentNode, string newNode, Action<IModifiable> modifier)
        {
            NodeModifyUp(NodeType.CreateNodeType(currentNode), NodeType.CreateNodeType(newNode), modifier);
        }

        //see declaration in IModifiable
        public void RootUpModify(string currentNode, Members newNode, Action<IModifiable> modifier)
        {
            NodeModifyUp(NodeType.CreateNodeType(currentNode), NodeType.CreateNodeType(newNode), modifier);
        }

        //see declaration in IModifiable
        public void RootUpModify(Members currentNode, Members newNode, Action<IModifiable> modifier)
        {
            NodeModifyUp(NodeType.CreateNodeType(currentNode), NodeType.CreateNodeType(newNode), modifier);
        }

        //private function to enable interface
        private void NodeModifyUp(NodeType currentNode, NodeType newNode, Action<IModifiable> modifier)
        {
            if (Node == currentNode)
            {
                this.myNode = newNode;
                modifier(this);
            }

            foreach (ASTree child in Children)
            {
                child.NodeModifyUp(currentNode, newNode, modifier);
            }
        }

        //private function to enable interface
        private void NodeModifyDown(NodeType currentNode, NodeType newNode, Action<IModifiable> modifier)
        {
            foreach (ASTree child in Children)
            {
                child.NodeModifyDown(currentNode, newNode, modifier);
            }

            if (Node == currentNode)
            {
                this.myNode = newNode;
                modifier(this);
            }
        }

        //see declaration in IModifiable
        public void ModifyToTypeDeclaration(IModifiable node)
        {
            ASTree a = (ASTree)node;
            if (a.code.Count < 2)
            {
                throw new InvalidOperationException("ERROR: CreateTypeDeclaration does not have sufficient code elements\r\n");
            }

            this.SetNode(Members.TypeDeclaration);
            this.ClearCode(ClearCodeOptions.ClearAll);
            this.CopyCode(node, 1);

            ASTree myType = new ASTree(false);
            myType.SetNode(NodeType.CreateNodeType(MemberSets.Classification));
            ASTree subType = new ASTree(false);
            subType.SetNode((Members)Enum.Parse(typeof(Members), a.code[0].ToUpper()));
            subType.Parent = myType;
            myType.Parent = this;
        }
        #endregion

        #region Search Tree
        #region Ancestor searches
        //see declaration in INavigable
        public INavigable GetDirectAncestorTo(INavigable specificNode)
        {
            if (parent != null && parent == specificNode)
            {
                return this;
            }
            else if (parent != null)
            {
                return parent.GetDirectAncestorTo(specificNode);
            }
            return null;
        }

        //see declaration in INavigable
        public INavigable GetAncestor(string specificNode)
        {
            return GetAncestor(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public INavigable GetAncestor(Members specificNode)
        {
            return GetAncestor(NodeType.CreateNodeType(specificNode));
        }

        //private function to enable interface
        private IModifiable GetAncestor(NodeType specificNode)
        {
            if (parent != null && parent.Node == specificNode)
            {
                return parent;
            }
            else if (parent != null)
            {
                return parent.GetAncestor(specificNode);
            }
            return null;
        }
        #endregion

        #region Triviality
        //see declaration in INavigable
        public bool IsTrivial()
        {
            return (Node.IsUnknown && code.Count == 0);
        }

        //see declaration in INavigable
        public INavigable GetNonTrivialChild()
        {
            if (IsTrivial())
            {
                //this is trivial, so look for node child to have node non-trivial.
                if (children.Count == 0)
                {
                    return null;
                }
                return children[0].GetNonTrivialChild();
            }
            else //this is not trivial, return this
            {
                return this;
            }
        }

        //see declaration in INavigable
        public INavigable GetNonTrivialParent()
        {
            if (parent != null && parent.IsTrivial())
            {
                //Parent is trivial, so look for another ancestor to be non-trivial.
                return parent.GetNonTrivialParent();
            }
            else if (parent != null)
            {
                //Parent is non-trivial, return parent
                return parent;
            }
            return null;
        }
        #endregion

        #region Breadth-first search
        //see declaration in INavigable
        public List<INavigable> BreadthFirstSearch(string specificNode)
        {
            return BreadthFirstSearch(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public List<INavigable> BreadthFirstSearch(Members specificNode)
        {
            return BreadthFirstSearch(NodeType.CreateNodeType(specificNode));
        }

        //private function to enable interface
        private List<INavigable> BreadthFirstSearch(NodeType specificNode)
        {
            List<INavigable> answer = new List<INavigable>();

            //if this is that type, return the tree at this point
            if (Node == specificNode)
            {
                answer.Add(this);
                return answer;
            }

            //if this is not that type, return the subtree at that point
            foreach (ASTree child in children)
            {
                foreach (ASTree subChild in child.BreadthFirstSearch(specificNode))
                {
                    answer.Add(subChild);
                }
            }
            return answer;
        }
        #endregion

        #region Full recursive search
        //see declaration in INavigable
        public void FullRecursiveSearch(Members specificNode, List<INavigable> answer)
        {
            FullRecursiveSearch(NodeType.CreateNodeType(specificNode), answer);
        }

        //private function to enable interface
        private void FullRecursiveSearch(NodeType specificNode, List<INavigable> answer)
        {
            //if this is that type add me to the list
            if (Node == specificNode)
            {
                answer.Add(this);
            }

            //if this is not that type, return the subtree at that point
            foreach (ASTree child in children)
            {
                child.FullRecursiveSearch(specificNode, answer);
            }
        }
        #endregion

        #region Get All First Layer
        //see declaration in INavigable
        public List<INavigable> GetAllFirstLayer(Members specificNode)
        {
            return GetAllFirstLayer(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public List<INavigable> GetAllFirstLayer(string specificNode)
        {
            return GetAllFirstLayer(NodeType.CreateNodeType(specificNode));
        }

        //private function to enable interface
        private List<INavigable> GetAllFirstLayer(NodeType specificNode)
        {
            List<INavigable> answer = new List<INavigable>();

            //if this is not that type, return the subtree at that point
            foreach (ASTree child in children)
            {
                //if this child is node match add it to the list of answers
                if (child.Node == specificNode)
                {
                    answer.Add(child);
                }
            }
            return answer;
        }
        #endregion

        #region Get First Single Layer
        //see declaration in INavigable
        public INavigable GetFirstSingleLayer(string specificNode)
        {
            return GetFirstSingleLayer(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public INavigable GetFirstSingleLayer(Members specificNode)
        {
            return GetFirstSingleLayer(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public INavigable GetFirstSingleLayer(MemberSets specificNode)
        {
            return GetFirstSingleLayer(NodeType.CreateNodeType(specificNode));
        }

        //private function to enable interface
        private INavigable GetFirstSingleLayer(NodeType specificNode)
        {
            //check each of the direct children for this type
            foreach (ASTree child in children)
            {
                if (child.Node == specificNode)
                {
                    return child;
                }
            }

            return null;
        }
        #endregion

        #region Get First Recursive
        //see declaration in INavigable
        public INavigable GetFirstRecursive(string specificNode)
        {
            return GetFirstRecursive(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public INavigable GetFirstRecursive(Members specificNode)
        {
            return GetFirstRecursive(NodeType.CreateNodeType(specificNode));
        }

        //see declaration in INavigable
        public INavigable GetFirstRecursive(MemberSets specificNode)
        {
            return GetFirstRecursive(NodeType.CreateNodeType(specificNode));
        }

        //private function which enables interface methods
        private INavigable GetFirstRecursive(NodeType specificNode)
        {
            //if this is that type, return the tree at this point
            if (Node == specificNode)
            {
                return this;
            }

            //if this is not that type, return the subtree at that point
            foreach (ASTree child in children)
            {
                INavigable answer = child.GetFirstRecursive(specificNode);
                if (answer != null)
                {
                    return answer;
                }
            }

            return null;
        }
        #endregion

        #region Search from Type
        //see declaration in INavigable
        public List<INavigable> FromTypeGetSet(MemberSets specificNode)
        {
            NodeType nt = NodeType.CreateNodeType(specificNode);

            if (!Node.Equals(Members.TypeDeclaration))
            {
                throw new InvalidOperationException("Cannot search for members except from node TypeDeclaration");
            }

            List<INavigable> answer = new List<INavigable>();

            INavigable types = GetFirstSingleLayer(nt);

            if (types != null)
            {
                answer = types.Children;
            }

            return answer;

        }
        #endregion
        #endregion
    }
}
