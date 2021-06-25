using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Language;

namespace SoftwareAnalyzer2.Tools
{
    /// <summary>
    /// ANTLRTool is the only implementation of ITool to date. It's purpose is to use ANTLR libraries
    /// to parse Java code into abstract syntax tree and token representations. In ANTLR the AST gives
    /// structure while the tokens identify the line and character locations of the code. The tokens also
    /// break on each space, etc. making them difficult to deal with.
    /// 
    /// The first section of code uses the ITool library to set up and start the decomposition for a 
    /// single code file. The decomposition section takes the AST and token files and combines them
    /// into an AST which contains all the code elements with lines, etc. All this is based on the
    /// IModifiable interface and NodeFactory. The final (extensive) set of code translates the ANTRL
    /// AST structure into one which focuses on the essential characteristics of the code base. This
    /// is accomplished through a series of modifications some of which must be performed in a set
    /// order. Most are set up to work with the recursive root-to-leaf or leaf-to-root functions
    /// provided by the IModifiable interface.
    /// </summary>
    class ANTLRTool : ITool
    {
        #region ITool Implementation
        private List<string> errorMessages = new List<string>();

        //see implementation in ITool
        public List<string> Errors
        {
            get
            {
                return errorMessages;
            }
        }

        private IModifiable head;
        private ILanguage myLang;

        //see implementation in ITool
        public INode ParsedNode
        {
            get
            {
                return head;
            }
        }

        //see implementation in ITool
        public bool NoTreeCreated { get; set; }

        //see implementation in ITool
        public ITool Clone()
        {
            return new ANTLRTool();
        }

        // This fn is responsible for translating un-parseable code before ANTLR sees it.
        // Many of the SQM analysis routines do not care about things like pointer dereferences,
        // only that the data related to the pointer has been read/written to.
        private void writeFileToANTLR(string filename, ILanguage lang, StreamWriter stdin) {
            try {
                stdin.AutoFlush = true;

                using (StreamReader reader = new StreamReader(filename)) {
                    string line;
                    while ((line = reader.ReadLine()) != null) {
                        string translated_line = line;
                        
                        if (lang is CPPLanguage) {
                            // Transform "*(T*)x" into "*((T*)x)", which is accepted by the grammar
                            // as long as there is a left-hand token (=, <<, etc.) to accept the value.
                            translated_line = Regex.Replace(line, @"\*(\s*\()", "$1");

                            // Transform all primitive T[*][*] into T* because ANTLR
                            // does not appear to understand array type widths like "int[][3]"
                            // and they compile to "T*" anyway.
                            foreach (string type in "int,double,float".Split(',')) {
                                translated_line = Regex.Replace(translated_line, type+@"\s*([a-zA-Z0-9]*)\s*(\[[0-9]*\]\s*)+", type+"*$1");
                            }

                        }

                        // Additional translations may be added here as we see new parse issues crop up in the field,
                        // esp. with code that does not compile we can make some decisions to allow the ANTLR
                        // grammar to parse something useful.
                        
                        stdin.WriteLine(translated_line);
                    }
                }

                stdin.Flush();
                stdin.Close();
            }
            catch (Exception e)
            {
                errorMessages.Add("ERROR: source file i/o:" + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
            }
        }

        //see implementation in ITool
        public void Analyze(string fileName, ILanguage lang)
        {
            myLang = lang;
            //creates two ANTLR output files by using these two commands and then combines them to create an IModifiable.
            //The IModifiable is then modified to the preferred form and the process terminates

            //this process is prone to errors and although even a partial tree is instructive, all errors must be 
            //captured and brought to the user's attention as they are fatal to the process.
            try
            {
                string processName = lang.ProcessName;
                string instruction = lang.ANTLRInstruction;
                //run -tree fileName
                Process p = new Process();
                p.StartInfo.FileName = processName;
                //p.StartInfo.Arguments = "org.antlr.v4.gui.TestRig " + instruction + " -tree \"" + fileName + "\"";
                p.StartInfo.Arguments = "org.antlr.v4.gui.TestRig " + instruction + " -tree";
                p.StartInfo.UseShellExecute = false;
                p.StartInfo.RedirectStandardInput = true;
                p.StartInfo.RedirectStandardOutput = true;
                p.StartInfo.RedirectStandardError = true;
                p.Start();
                Console.Error.WriteLine(processName + " " + p.StartInfo.Arguments);
                Thread p_stdin_t = new Thread(() => writeFileToANTLR(fileName, lang, p.StandardInput));
                p_stdin_t.Start();
                

                //run -tokens fileName
                Process p2 = new Process();
                p2.StartInfo.FileName = processName;
                //p2.StartInfo.Arguments = "org.antlr.v4.gui.TestRig " + instruction + " -tokens \"" + fileName + "\"";
                p2.StartInfo.Arguments = "org.antlr.v4.gui.TestRig " + instruction + " -tokens";
                p2.StartInfo.UseShellExecute = false;
                p2.StartInfo.RedirectStandardInput = true;
                p2.StartInfo.RedirectStandardOutput = true;
                p2.StartInfo.RedirectStandardError = true;
                p2.Start();
                Console.Error.WriteLine(processName + " " + p2.StartInfo.Arguments);
                Thread p2_stdin_t = new Thread(() => writeFileToANTLR(fileName, lang, p2.StandardInput));
                p2_stdin_t.Start();

                if (myLang is CPPLanguage) {
                    // Timeout after ~3 seconds and kill slow/hung processes
                    p.WaitForExit(3100);
                    p.Kill();
                    p2.WaitForExit(250);
                    p2.Kill();
                }
                else {
                    // Wait indefinitely, ANTLR MUST exit for SQM to continue.
                    p.WaitForExit();
                    //p2 (-tokens) is where the hanging happens...
                    p2.WaitForExit();
                }

                Console.Out.WriteLine(fileName);
                
                //save the output from each process
                string[] tokens = p2.StandardOutput.ReadToEnd().Split(System.Environment.NewLine.ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                // We remove all tokens with "<WS>" (whitespace) and "<COMMENT>"
                tokens = tokens.Where(
                    t => !(
                        t.Contains("<WS>") ||
                        t.Contains("<COMMENT>") ||
                        t.Contains("<Directive>")
                    )
                ).ToArray();

                string[] tree = p.StandardOutput.ReadToEnd().Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                Console.Out.WriteLine("/t"+fileName);

                //capture any process errors
                string error = p.StandardError.ReadToEnd();
                if (error.Length > 0)
                {
                    errorMessages.Add("ERROR: Error in ANTLR tree: " + error + System.Environment.NewLine);
                }
                error = p2.StandardError.ReadToEnd();
                if (error.Length > 0)
                {
                    errorMessages.Add("ERROR: Error in ANTLR tokens: " + error + System.Environment.NewLine);
                }

                //catch and return if the parser fails
                if (errorMessages.Count > 0)
                {
                    if (errorMessages[0].Contains("no viable alternative at input '<EOF>'"))
                    {
                        //occurs only for empty files
                        NoTreeCreated = true;
                    }
                    errorMessages.Add("FATAL ERROR: Could not run tool\r\n");
                    return;
                }

                //combine the line and character references from the tokens with the structure
                //again gracefully fail if combination is not possible
                if (!Combine(tree, tokens))
                {
                    errorMessages.Add("FATAL ERROR: Decomposition incomplete\r\n");
                    return;
                }

                //we will preclude tree operations for any one of several reasons
                INavigable firstType = head.GetFirstRecursive("typeDeclaration");
                if (firstType == null && lang is CPPLanguage) {
                    firstType = head.GetFirstRecursive("declaration");
                    if (firstType == null && head.Children.Count > 0) { // found error & tree looks non-trivial
                        Console.WriteLine("");
                        Console.WriteLine("Exiting b/c head.GetFirstRecursive(declaration) == null. head="+head);
                        Console.WriteLine("");
                        head.PrintTreeText();
                        System.Environment.Exit(5);
                    }
                }

                if (firstType == null)
                {
                    //no type defined in this file; of no interest currently
                    NoTreeCreated = true;
                    errorMessages.Add("File does not define any type\r\n");
                    return;
                }
                else if (firstType.GetFirstSingleLayer("annotationTypeDeclaration") != null)
                {
                    //only an annotation type; of no interest currently
                    NoTreeCreated = true;
                    errorMessages.Add("Non-decomposition Warning: Annotation type is skipped\r\n");
                    return;
                }
                else
                {
                    //now the whole tree is parsed so we can operate on it logically
                    //after this point some tree will be returned, even if errors 
                    //occur in the modification
                    ModifyTree();

                    //Check for errors in the post-modification tree
                    head.ErrorScan(errorMessages);
                }
            }
            catch (Exception e)
            {
                //error causes node crash; capture the error and finish
                errorMessages.Add("FATAL ERROR: File Analysis incomplete:" + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
            }
        }
        #endregion

        #region Decomposition ANTRL Outputs
        /// <summary>
        /// Key method for decomposition which combines the tree and token units into node single IModifiable; 
        /// returns true if completely successful, false otherwise
        /// </summary>
        /// <param name="tree"></param>
        /// <param name="tokens"></param>
        /// <returns></returns>
        private bool Combine(string[] tree, string[] tokens)
        {
            int tokenIndex = 0;

            //creates node false head to grip the tree
            head = (IModifiable)NodeFactory.CreateNode(NodeType.CreateNodeType("HEAD"), "");
            IModifiable current = head;
            for (int i = 0; i < tree.Length; i++)
            {
                char startC = tree[i][0];
                if (tree[i].StartsWith("<EOF>"))//last item in the tree
                {
                    //node correctly parse tree will have closed all nodes at this point except the true head
                    if (current != head.GetNthChild(0))
                    {
                        errorMessages.Add("ERROR: Tree not built appropriately; failure to close sufficient nodes\r\n");
                        return false;
                    }

                    //adjusts grip of tree to compilation unit
                    head = (IModifiable)current;
                    continue;
                }
                else if (startC == '(' && tree[i].Length > 1)//start of new answer in tree
                {
                    //single '(' is just node code snippet; but node ( followed by at least one other character is the new answer
                    IModifiable next = (IModifiable)NodeFactory.CreateNode(NodeType.CreateNodeType(tree[i].Substring(1)), true);
                    next.Parent = current;
                    current = next;//track current place in tree
                }
                else if (startC == '\"' || startC == '\'')//intermitent string answer
                {
                    //text is node special case where node answer has multiple individual strings parsed, but only matches with one token
                    //uses string builder in node loop to agregate each line of text from several strings within the answer until the end of the string is found

                    StringBuilder sb = new StringBuilder();
                    int endText = 0;

                    //determine the actual string by skipping escape characters.
                    int nextC = findDelimiterInString(tree[i], startC, 1);

                    if (startC == '\'' && tree[i].Length > 1)
                    {
                        //aggregates the actual character
                        //if there is node ' node character and node ' (the other option being node ' ' which woudld be broken into two blocks.
                        endText = tree[i].LastIndexOf(startC);
                        string pre = tree[i].Substring(0, endText + 1);
                        sb.Append(pre);
                    }
                    else if (nextC > -1)
                    {
                        //aggregates the last section of text up to the quotation mark
                        endText = tree[i].IndexOf(startC, 1);
                        string pre = tree[i].Substring(0, endText + 1);
                        sb.Append(pre);
                    }
                    else
                    {
                        do
                        {
                            sb.Append(tree[i++]);
                            sb.Append(" ");

                            //search for the end character
                            nextC = findDelimiterInString(tree[i], startC);
                        } while (nextC == -1);

                        //aggregates the last section of text up to the quotation mark
                        endText = nextC;
                        string pre = tree[i].Substring(0, endText + 1);
                        sb.Append(pre);
                    }

                    if (!decomposeToken(current, sb.ToString(), tokens[tokenIndex++]))
                    {
                        errorMessages.Add("ERROR: Inconsistency between tree " + i + " and token " + (tokenIndex - 1) + System.Environment.NewLine);
                        errorMessages.Add("\tText token in tree: " + sb.ToString() + System.Environment.NewLine);
                        errorMessages.Add("\tToken expected: " + tokens[tokenIndex - 1] + System.Environment.NewLine);
                        return false;
                    }

                    //find how many nodes to close and do so
                    int start;
                    int numParens;
                    CountParens(tree[i].Substring(endText), out start, out numParens);

                    //close the indicated nodes
                    for (int j = 0; j < numParens; j++)
                    {
                        if (current.Parent == null)
                        {
                            errorMessages.Add("ERROR: Too many tree answer closed\r\n");
                            head.PrintTreeText(errorMessages.Add);
                            return false;
                        }
                        current = (IModifiable)current.Parent;
                    }
                }
                else if (tree[i][tree[i].Length - 1] == ')')//end of at least one answer in tree
                {
                    int start;
                    int numParens;
                    CountParens(tree[i], out start, out numParens);

                    if (start > 0)//some snippet of code attached to first paren
                    {
                        //salvage the last bit of code
                        if (!decomposeToken(current, tree[i].Substring(0, start), tokens[tokenIndex++]))
                        {
                            errorMessages.Add("ERROR: Inconsistency between tree " + i + " and token " + (tokenIndex - 1) + System.Environment.NewLine);
                            errorMessages.Add("\tSalvaged token in tree: " + tree[i].Substring(0, start) + System.Environment.NewLine);
                            errorMessages.Add("\tToken expected: " + tokens[tokenIndex - 1] + System.Environment.NewLine);
                            return false;
                        }
                    }

                    //close the number of nodes indicated by the number of )'s
                    for (int j = 0; j < numParens; j++)
                    {
                        if (current.Parent == null)
                        {//if the parse is badly done, then too many )'s will take us right out of the tree
                            errorMessages.Add("ERROR: Too many tree answer closed\r\n");
                            head.PrintTreeText(errorMessages.Add);
                            return false;
                        }

                        current = (IModifiable)current.Parent;//close current answer
                    }
                }
                else //some intermitent token part of the existing answer
                {
                    if (!decomposeToken(current, tree[i], tokens[tokenIndex++]))
                    {
                        errorMessages.Add("ERROR: Inconsistency between tree " + i + " and token " + (tokenIndex - 1) + System.Environment.NewLine);
                        errorMessages.Add("\tTree: " + tree[i] + System.Environment.NewLine);
                        errorMessages.Add("\tToken expected: " + tokens[tokenIndex - 1] + System.Environment.NewLine);
                        return false;
                    }
                }
            }

            return true;
        }

        private int findDelimiterInString(string str, char delim)
        {
            return findDelimiterInString(str, delim, 0);
        }

        private int findDelimiterInString(string str, char delim, int startIndex)
        {
            int indexDelim = str.IndexOf(delim, startIndex);
            int indexEscape = str.IndexOf(Path.DirectorySeparatorChar, startIndex);

            while (indexEscape < indexDelim && indexEscape > -1 && indexDelim > -1)//need to skip any escaped characters
            {
                startIndex = indexEscape + 2;
                indexDelim = str.IndexOf(delim, startIndex);
                indexEscape = str.IndexOf(Path.DirectorySeparatorChar, startIndex);
            }

            //either this is the index of node delimeter or it is node -1 indicating no valid delimeter exists
            return indexDelim;
        }

        /// <summary>
        /// Determines the number of nodes which must be closed in the process of parsing the tree units
        /// </summary>
        /// <param name="text"></param>
        /// <param name="start"></param>
        /// <param name="numParens"></param>
        private void CountParens(string text, out int start, out int numParens)
        {
            start = 0;//naively assume all characters are parens
            for (int i = text.Length - 1; i >= 0; i--)
            {
                if (text[i] != ')')//find the first non-paren character starting from the end
                {
                    start = i + 1;
                    break;
                }
            }

            if (start == 0)
            {
                //this is one of the rare. The token ')' which is node code snippet, followed by some ) which are part of the IModifiable
                start++;//move to the next ) character to make that distinction
            }
            numParens = text.Length - start;
        }

        /// <summary>
        /// Searches the given expected token for the actual token text and then compares it to the token found in the tree.
        /// These should match and if they fail to match an error is raised and decomposition halts.
        /// </summary>
        /// <param name="answer"></param>
        /// <param name="foundtoken"></param>
        /// <param name="expectedToken"></param>
        /// <returns></returns>
        private bool decomposeToken(IModifiable node, string foundtoken, string expectedToken)
        {
            //Console.Error.WriteLine("decomposeToken(node="+node+" foundtoken="+foundtoken+" expectedToken="+expectedToken+")");
            //Sample token: [@22,169:169=',',<64>,8:32]
            int token1 = expectedToken.IndexOf('\'');
            if (token1 == -1)
            {
                errorMessages.Add("ERROR: Token character ' not found\r\n");
                return false;
            }

            // We need to remove "channel=1" if it exists (possibly a grammar difference?)
            for (int c=0; c<5; c++) {
                string unused_token = "channel="+c+",";
                if (expectedToken.Contains(unused_token)) {
                    expectedToken = expectedToken.Replace(unused_token, "");
                }
            }

            //this allows for the possibility of an ' character within the token 
            //and finds the exact bounds of the token by taking that into account
            int token2 = expectedToken.LastIndexOf('\'', expectedToken.Length - 1);

            if (token2 == -1 || token2 == token1)
            {
                errorMessages.Add("ERROR: Secondary token character ' not found\r\n");
                return false;
            }

            //extracts the token as defined by those bounds
            string candidateToken = expectedToken.Substring(token1 + 1, (token2 - token1) - 1);
            string[] parts = expectedToken.Substring(token2 + 1).Split(",:]".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

            //extracts the line and character positions of this token
            if (parts.Length < 2)
            {
                errorMessages.Add("ERROR: Insufficient token components\r\n");
                for (int i = 0; i < parts.Length; i++)
                {
                    errorMessages.Add("\t" + parts[i]);
                }
                return false;
            }
            int line = int.Parse(parts[1]);
            int charStart = int.Parse(parts[2]);

            //contrasts expected and found tokens to ensure match.
            //special circumstances (because of potential for additional whitespace) allow all text to match
            //anything else is node violation
            //if (candidateToken.Equals(foundtoken))
            if (candidateToken.Contains(foundtoken) || foundtoken.Contains(candidateToken))
            {
                node.AddCode(foundtoken, line, charStart);
                return true;
            }
            else if (foundtoken[0] == '\"' && foundtoken[foundtoken.Length - 1] == '\"')
            {
                node.AddCode(foundtoken, line, charStart);
                return true;
            }
            else
            {
                errorMessages.Add("ERROR: Token expected but not found.\r\n\t" + foundtoken + "\t\t" + candidateToken + System.Environment.NewLine);
                return false;
            }
        }
        #endregion

        #region Modifiers
        /// <summary>
        /// Key method in the Modifiers section. Lays out the exact order of modification. Because 
        /// these occur in an order later modifications are dependent on previous modifications to
        /// ensure the structure meets with expectations.
        /// </summary>
        private void ModifyTree()
        {
            if (myLang is JavaLanguage) {
                //rename several nodes to improve readability
                head.Rename("primitiveType", Members.Primitive);
                head.Rename("classOrInterfaceModifier", "modifier");
                head.Rename("variableModifier", "modifier");
                head.Rename("modifier", "modifier");

                //modify and simplify the structure
                //Dependencies may exist in this list so order is important
                head.RootUpModify("classOrInterfaceType", Members.TypeName, TypeNameModifier);
                head.CodeModify(AssertModifier);
                head.RootUpModify("literal", Members.Literal, LiteralModifier);
                head.RootUpModify("annotationTypeDeclaration", "annotationTypeDeclaration", RemoveAnnotationModifier);
                head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", StaticMethodModifier);
                head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", InlineCodeModifier);
                head.RootUpModify("creator", "creator", ClassConstructorModifier);
                head.RootUpModify("methodBody", "methodBody", HiddenClassModifier);
                head.RootUpModify("constructorBody", "constructorBody", HiddenClassModifier);
                head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", EmptyDeclarationModifier);
                head.RootUpModify("annotation", Members.Annotation, AnnotationModifier);
                head.RootUpModify("constantDeclarator", "variableDeclarator", ConstantModifier);
                head.RootUpModify("variableDeclaratorId", Members.Variable, ReparentOnFirstChild);
                head.RootUpModify("statement", "statement", StatementModifier);
                head.RootUpModify("compilationUnit", Members.File, Unnatural);
                head.RootUpModify("packageDeclaration", Members.Package, PackageModifier);
                head.RootUpModify("importDeclaration", Members.Import, ImportModifier);
                head.RootUpModify("block", Members.Scope, ClearCode);
                head.RootUpModify("type", "type", TypeArrayModifier);
                head.RootUpModify(Members.TypeName, Members.TypeName, TypeArrayModifier);
                head.RootUpModify("typeArguments", Members.Sub_Type, ClearCode);
                head.RootUpModify("typeArgument", "typeArgument", GenericTypeModifier);
                head.RootUpModify("typeArgumentsOrDiamond", "typeArgumentsOrDiamond", ClearCode);
                head.RootUpModify("formalParameters", Members.ParameterList, ParameterListModifier);
                head.RootUpModify("variableDeclarators", "variableDeclarators", ReparentChildren);
                head.RootUpModify("explicitGenericInvocation", "explicitGenericInvocation", GenericInvocationModifier);
                head.RootUpModify("primary", Members.Variable, NestedExpressionModifier);
                head.RootUpModify("variableDeclarator", "variableDeclarator", VariableDeclaratorModifier);
                head.RootUpModify("fieldDeclaration", "fieldDeclaration", FieldModifier);
                head.RootUpModify("constDeclaration", "constDeclaration", FieldModifier);
                head.RootUpModify("methodDeclaration", "droppingMethod", ClassMethodModifier);
                head.RootUpModify("interfaceMethodDeclaration", "droppingMethod", InterfaceMethodModifier);
                head.CodeModify(staticMethodModifier);
                head.RootUpModify("constructorDeclaration", "droppingConstructor", ConstructorModifier);
                head.RootUpModify("enumDeclaration", "droppingType", TypeModifier);
                head.CodeModify(enumModifier);
                head.RootUpModify("interfaceDeclaration", "droppingType", TypeModifier);
                head.RootUpModify("classDeclaration", "droppingType", TypeModifier);
                head.RootUpModify("innerCreator", Members.ConstructorInvoke, InnerConstructionModifier);
                head.RootUpModify("localVariableDeclarationStatement", "droppingLocal", LocalVariableModifier);
                head.RootUpModify("enhancedForControl", "enhancedForControl", ForEachModifier);
                head.RootUpModify("forControl", "forControl", ForThreePartModifier);
                head.RootUpModify("parExpression", "parExpression", WhileSwitchIfModifier);
                head.Collapse("expression");
                head.LeafDownModify("expression", "expression", ExpressionModifier);
                head.RootUpModify("creator", Members.ConstructorInvoke, ConstructionModifier);
                head.RootUpModify("arrayInitializer", Members.Array, ClearCode);
                head.RootUpModify("superSuffix", "droppingMethod", SuperMethodModifier);
                head.CodeModify(OtherDotModifier);

                //catch inversions in the tree for code phrases like "this.thing.secondThing"
                head.CodeModify(InvertedExpressionModifier);
                head.CodeModify(SuperTypeModifier);
                head.RootUpModify(Members.Variable, Members.Variable, ThisModifier);

                //collapse unnecessary nodes
                head.Collapse("blockStatement");
                head.Collapse("expression");
                head.Collapse("type");
                head.Collapse(Members.Variable);
                head.Collapse("statementExpression");
                head.Collapse("variableInitializer");
                head.Collapse("typeArgument");
                head.Collapse("constantExpression");
                head.Collapse("typeArgumentsOrDiamond");
                head.Collapse("statement", ";");
                head.Collapse("statement", "");
                head.Collapse("interfaceBodyDeclaration", ";");

                //renumber nodes
                head.NormalizeLines();
            }
            else if (myLang is CPPLanguage) {
                
                head.Rename("className", "TypeDeclaration");
                head.Rename("functionDefinition", "Method");
                head.Rename("translationUnit", "File");
                
                head.Collapse("templateArgument");
                head.Collapse("declSpecifier");
                head.Collapse("typeSpecifier");
                head.Collapse("trailingTypeSpecifier");
                head.Collapse("simpleTypeSpecifier");
                head.Collapse("theTypeName");

                // Templates have a complex tree, remove the template parameter to simplify graph
                head.Collapse("TypeDeclaration");

                // head.Rename("modifier", "modifier");
                // head.Rename("modifier", "modifier");
                // head.Rename("modifier", "modifier");

                head.NormalizeLines();

                // Throw away "HEAD" and replace with "File" at top of tree
                head = (IModifiable) head.Children.First();

            }
            else {
                Console.WriteLine("Unknown language = "+myLang);
            }
        }

        #region Common Operations
        /// <summary>
        /// Makes the matching node unnatural
        /// </summary>
        /// <param name="answer"></param>
        private void Unnatural(IModifiable node)
        {
            node.IsNatural = false;
        }

        /// <summary>
        /// Occurs in some cases were an enum is declared followed by node ;. These 
        /// are left behind as empty nodes naturally occuring in the tree.
        /// </summary>
        /// <param name="answer"></param>
        private void EmptyDeclarationModifier(IModifiable node)
        {
            if (node.GetChildCount() == 0 && node.Code.Equals(";"))
            {
                ((IModifiable)node.Parent).RemoveChild(node);
            }
        }

        /// <summary>
        /// Throws an error because we should ignore all annotations
        /// </summary>
        /// <param name="node"></param>
        private void RemoveAnnotationModifier(IModifiable node)
        {
            //TODO handle annotations
            throw new InvalidDataException("Annotation type discovered; " + node);
        }

        /// <summary>
        /// Removes all code from the identified node
        /// </summary>
        /// <param name="node"></param>
        private void ClearCode(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.ClearAll);
        }

        /// <summary>
        /// Reparents all children of this answer onto the parent of this answer
        /// Given node relationship x--y--(z1-z*) it creates the relationship x--(z1-z*)
        /// </summary>
        /// <param name="answer"></param>
        private void ReparentChildren(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            target.RemoveChild(node);

            foreach (IModifiable child in node.Children)
            {
                child.Parent = target;
            }
        }

        /// <summary>
        /// Identifies constant variables, which must be treated differently than parameters or fields
        /// </summary>
        /// <param name="node"></param>
        private void ConstantModifier(IModifiable node)
        {
            if (node.Code.EndsWith(" ="))
            {
                //constants always have node declarator which incorporates the = operation.

                //take the initializer block if it exists.
                List<INavigable> initializer = node.Children;
                node.DropChildren();

                //create the missing variable
                IModifiable variable = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
                variable.CopyCode(node, 0);

                //insert the new variable and reparent the initializer block (if any)
                variable.Parent = node;
                foreach (INavigable n in initializer)
                {
                    n.Parent = node;
                }

                node.ClearCode(ClearCodeOptions.ClearAll);
                node.AddCode("=", variable);
            }
            else
            {
                throw new FormatException("Constant " + node + " is incorrectly formatted");
            }
        }

        /// <summary>
        /// Reparents all children on the first child and reparents that on the parent of this answer
        /// Given node relationship x--y--(z1-z4) it creates the relationship x--z1--(z2-z4)
        /// </summary>
        /// <param name="answer"></param>
        private void ReparentOnFirstChild(IModifiable node)
        {
            //all parameters are going to be renamed in the node modificaiton proces
            //for literals, the "variable" is actually an empty parent node masking the literal child,
            //so we take it away.
            if (node.Code.Length == 0 && node.GetChildCount() > 0)
            {
                IModifiable first = (IModifiable)node.GetNthChild(0);
                node.RemoveChild(first);
                ((IModifiable)node.Parent).ReplaceChild(node, first);
                foreach (IModifiable child in node.Children)
                {
                    child.Parent = first;
                }
            }
        }
        #endregion

        #region Generalized Formatting
        /// <summary>
        /// Changes the node of all assertions
        /// </summary>
        /// <param name="assertion"></param>
        private void AssertModifier(IModifiable assertion)
        {
            if (assertion.Node.Equals("statement") && (assertion.Code.Equals("assert ;") || assertion.Code.Equals("assert : ;")))
            {
                assertion.SetNode(Members.Assertion);
            }
        }

        /// <summary>
        /// Changes a full type name e.g. "x.y.z" into a structure of expressions.
        /// </summary>
        /// <param name="typeName"></param>
        private void TypeNameModifier(IModifiable typeName)
        {
            if (typeName.Code.Contains("."))
            {
                //this type name is node compound of some number of packages
                //needs to be reformated

                INavigable target = typeName.Parent;

                //find the length of the chain
                string[] parts = typeName.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                //add the members in reverse order to node stack
                List<IModifiable> stack = new List<IModifiable>();
                for (int i = 1; i < parts.Length - 1; i += 2)
                {
                    IModifiable n = (IModifiable)NodeFactory.CreateNode("expression", true);
                    n.CopyCode(typeName, i);
                    n.CopyCode(typeName, i + 1);
                    stack.Add(n);
                }

                //the last one in the stack is the first name in the list
                IModifiable last = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
                last.CopyCode(typeName, 0);

                //get the first item which will replace the existing type name
                IModifiable first = stack[stack.Count - 1];
                stack.RemoveAt(stack.Count - 1);

                //substitute names of first element
                typeName.ClearCode(ClearCodeOptions.ClearAll);
                typeName.CopyCode(first);

                //before adding elements from the stack we need to account for other children nodes.
                List<INavigable> children = typeName.Children;
                typeName.DropChildren();

                //add each element in the stack
                IModifiable current = typeName;
                while (stack.Count > 0)
                {
                    IModifiable next = stack[stack.Count - 1];
                    stack.RemoveAt(stack.Count - 1);
                    next.Parent = current;
                    current = next;
                }

                last.Parent = current;

                //add the children back onto the type name
                foreach (INavigable n in children)
                {
                    n.Parent = typeName;
                }
            }
        }

        /// <summary>
        /// Literals are any constant value which is not itself a variable, but has a type.
        /// This method identifies the matching type and puts the literal into a structure 
        /// indicating the relationship
        /// 
        /// Note, this method is the frequent cause of problems as the RegEx statements
        /// may not be 100% inclusive of all type variations.
        /// </summary>
        /// <param name="literal"></param>
        private void LiteralModifier(IModifiable literal)
        {
            Regex stringType = new Regex("^\".*\"$");
            Regex boolType = new Regex("^(true|false|(0b(0|1)+))$");
            Regex intType = new Regex("^-?(\\d|0x([a-f]|[A-F]|[0-9]){1,8})+$");
            Regex longType = new Regex("^-?(\\d+|0(x|X)([a-f]|[A-F]|[0-9])+)(L|l)$");
            Regex floatType = new Regex("^-?(\\d+(\\.(\\d)*)?|\\.\\d+)(F|f)$");
            Regex doubleType = new Regex("^-?(\\d+(\\.\\d*)?|\\d*\\.\\d*)((e|E)(-|\\+)?\\d+)?(D|d)?$");
            Regex charType = new Regex("^'((\\\\)?.|\\\\u([node-f]|[A-F]|[0-9]){4})|\\[0-7]{3}'$");
            IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, true);
            IModifiable t = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);

            t.Parent = type;
            type.Parent = literal;

            if (stringType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.String.ToString(), literal);
            }
            else if (charType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Character.ToString(), literal);
            }
            else if (boolType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Boolean.ToString(), literal);
            }
            else if (intType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Integer.ToString(), literal);
            }
            else if (longType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Long.ToString(), literal);
            }
            else if (floatType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Float.ToString(), literal);
            }
            else if (doubleType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Double.ToString(), literal);
            }
            else if (literal.Code.Equals("null"))
            {
                t.AddCode(myLang.HeadNode, literal);
            }
            else
            {
                //TODO get correct RegEx from gramar
                throw new NotImplementedException("Need to implement new literal type for " + literal);
            }
        }

        /// <summary>
        /// Uniformly formats fields for all types (catch, parameters, local, global, etc.).
        /// </summary>
        /// <param name="parent">The answer on which the set of fields has node scope. This will be populated with node Fields subnode for all fields defined in that scope.</param>
        /// <param name="assorted">The set of all nodes which are Variable, Modifier or node TypeName</param>
        /// <param name="fieldType">True for all local, general and catch fields, false for parameters</param>
        private void FormatField(IModifiable parent, List<INavigable> assorted, bool fieldType)
        {

            //establish if the parent has node fieldset group and create it if it does not already exist
            IModifiable fieldset = (IModifiable)parent.GetFirstSingleLayer(MemberSets.Fields);
            if (fieldset == null && fieldType)
            {
                //no declarations have been made at this level
                fieldset = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, false);
                fieldset.Parent = parent;
            }

            //create the basic structure for the field
            IModifiable f = null;
            if (fieldType)
            {
                f = (IModifiable)NodeFactory.CreateNode(Members.Field, true);
                f.Parent = fieldset;
            }
            else
            {
                f = (IModifiable)NodeFactory.CreateNode(Members.Parameter, true);
                f.Parent = parent;
            }

            IModifiable mods = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            mods.Parent = f;

            IModifiable t = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
            t.Parent = f;

            List<IModifiable> variables = new List<IModifiable>();
            //add modifiers, parameters and types from assortment
            foreach (IModifiable child in assorted)
            {
                if (child.Node.Equals(Members.Variable))
                {
                    //this just adds the parameters into node list so we can create separate fields for each one.
                    variables.Add(child);
                }
                else if (child.Node.Equals("modifier"))
                {
                    CreateModifier(child).Parent = mods;
                }
                else if (child.Node.IsModifier)
                {
                    child.Parent = mods;
                }
                else
                {
                    //type only
                    child.Parent = t;
                }
            }

            for (int i = 1; i < variables.Count; i++)
            {
                IModifiable cloneField = f.Clone();
                cloneField.Parent = f.Parent;
                variables[i].Parent = cloneField;

                cloneField.CopyCode(variables[i]);
            }

            if (variables.Count == 0)
            {
                throw new InvalidOperationException("Field " + parent + " is incorrectly prepared for formatting");
            }

            variables[0].Parent = f;
            f.CopyCode(variables[0]);
        }

        /// <summary>
        /// Modifiers like 'static' or 'private' are caught and formally added to the structure
        /// </summary>
        /// <param name="child"></param>
        /// <returns></returns>
        private IModifiable CreateModifier(IModifiable child)
        {
            IModifiable modifier = child;
            if (modifier.Code.Length == 0)
            {
                modifier = (IModifiable)modifier.GetNthChild(0);
            }

            if (modifier.GetChildCount() > 0 && modifier.GetNthChild(0).Node.Equals(Members.Annotation))
            {
                //this is an annotation so it is handled differently than a normal modifier

                //TODO handle annotations
                IModifiable answer = (IModifiable)NodeFactory.CreateNode(Members.Annotation, false);
                answer.CopyCode(modifier);

                answer.IsNatural = true;
                return answer;
            }

            Members m = Members.Null;
            String s = modifier.Code;
            if (s.Equals("static"))
            {
                m = Members.Static;
            }
            else if (s.Equals("public"))
            {
                m = Members.Public;
            }
            else if (s.Equals("private"))
            {
                m = Members.Private;
            }
            else if (s.Equals("protected"))
            {
                m = Members.Protected;
            }
            else if (s.Equals("final"))
            {
                m = Members.Final;
            }
            else if (s.Equals("transient"))
            {
                m = Members.Transient;
            }
            else if (s.Equals("volatile"))
            {
                m = Members.Volatile;
            }
            else if (s.Equals("abstract"))
            {
                m = Members.Abstract;
            }
            else if (s.Equals("native"))
            {
                m = Members.Native;
            }
            else if (s.Equals("synchronized"))
            {
                m = Members.Synchronized;
            }
            else if (s.Equals("synchronized"))
            {
                m = Members.Synchronized;
            }
            else
            {
                //TODO handle all modifiers defined for the language
                throw new InvalidCastException("Unknown modifier: " + modifier);
            }

            return (IModifiable)NodeFactory.CreateNode(m, true);
        }

        /// <summary>
        /// Bumps the annotation answer up to the level of the class member
        /// </summary>
        /// <param name="answer"></param>
        private void AnnotationModifier(IModifiable node)
        {
            //find all the modifier nodes above this annotation
            IModifiable t = node;

            if (t.Parent.Node.Equals("enumConstant"))
            {
                //these cases do NOT have a modifier and need to have one artificially created.
                INode newParent = NodeFactory.CreateNode("modifier", false);

                IModifiable parent = (IModifiable)t.Parent;

                parent.ReplaceChild(t, (IModifiable)newParent);
                t.Parent = (IModifiable)newParent;
            }

            while (t.Parent.Node.Equals("modifier"))
            {
                t = (IModifiable)t.Parent;
            }

            //remove this node
            t.DropChildren();

            List<INavigable> notes = node.Children;

            node.DropChildren();

            if (notes[0].GetChildCount() != 1)
            {
                throw new InvalidDataException("Expected one annotation, found " + node.GetNthChild(0).GetChildCount());
            }

            //set the modifier code
            foreach (INavigable n in notes[0].Children)
            {
                n.Parent = t;
                ((IModifiable)n).SetNode("modifier");
                INode temp = NodeFactory.CreateNode(Members.Annotation, false);
                ((IModifiable)temp).Parent = n;
            }
        }

        /// <summary>
        /// Keeps any modifiers associated with the targetNode answer, but as an extra bonus divorces all other children in that process.
        /// </summary>
        /// <param name="target"></param>
        private void FormatModifiers(IModifiable target)
        {
            //Disassociate the current children set so we can workOther with it in node foreach
            List<INavigable> children = target.Children;
            target.DropChildren();

            IModifiable set = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            set.Parent = target;
            set.SetLine(target);

            //reassert Modifiers to the class/interface only
            foreach (IModifiable child in children)
            {
                if (child.Node.Equals("modifier") && child.Code.Length == 0)
                {
                    //not an actual modifier, but contains node modifier
                    CreateModifier((IModifiable)child.GetNthChild(0)).Parent = set;
                }
                else if (child.Node.Equals("modifier"))
                {
                    CreateModifier(child).Parent = set;
                }
            }
        }
        #endregion

        #region Statement-Driven
        /// <summary>
        /// Categorizes most statements as node specific type
        /// </summary>
        /// <param name="answer"></param>
        private void StatementModifier(IModifiable node)
        {
            if (node.Code.StartsWith("continue "))
            {
                node.SetNode(Members.Continue);
                string s = node.Code;
                s = s.Substring(9, s.Length - 10);
                node.ClearCode(ClearCodeOptions.KeepLine);
                if (s.Length > 0)
                {
                    node.AddCode(s, node);
                }
            }
            else if (node.Code.StartsWith("break "))
            {
                node.SetNode(Members.Break);
                string s = node.Code;
                s = s.Substring(6, s.Length - 7);
                node.ClearCode(ClearCodeOptions.KeepLine);
                if (s.Length > 0)
                {
                    node.AddCode(s, node);
                }
            }
            else if (node.Code.Equals("try"))
            {
                TryCatchModifier(node);
            }
            else if (node.Code.Equals("return ;"))
            {
                node.SetNode(Members.Return);
                node.ClearCode(ClearCodeOptions.KeepLine);
            }
            else if (node.Code.Equals("throw ;"))
            {
                node.SetNode(Members.Exception);
                node.ClearCode(ClearCodeOptions.KeepLine);
            }
            else if (node.Code.EndsWith(":"))
            {
                string s = node.Code;
                s = s.Substring(0, s.Length - 2);
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.AddCode(s, node);
                node.SetNode(Members.Label);
            }
        }

        /// <summary>
        /// Formates the try-catch-finally block as node reasonable set of nodes in the tree
        /// Catches are sequential
        /// Catches and finally are parented off of try
        /// Catches contain their own parameters just as methods do in relation to the exception
        /// </summary>
        /// <param name="answer"></param>
        private void TryCatchModifier(IModifiable node)
        {
            IModifiable tryer = (IModifiable)node.GetNthChild(0);
            tryer.SetNode(Members.TryScope);
            tryer.ClearCode(ClearCodeOptions.KeepLine);

            List<IModifiable> catchers = new List<IModifiable>();
            IModifiable temp = (IModifiable)node.GetFirstSingleLayer("catchClause");
            while (temp != null)//identifies multiple catch clauses
            {
                List<INavigable> children = temp.Children;
                temp.DropChildren();

                while (children[0].Node.Equals("modifier"))
                {
                    //if there is node modifier on the field it will interfere with the expected order of the catch block, etc.
                    //this moves it to the back of the set so it is still added as node modifier in FormatField, but has no effect
                    //on the previous order-contingent actions.
                    IModifiable modifier = (IModifiable)children[0];
                    children.Remove(modifier);
                    children.Add(CreateModifier(modifier));
                }

                IModifiable catcher = (IModifiable)children[1];
                catcher.SetNode(Members.CatchScope);
                catcher.ClearCode(ClearCodeOptions.ClearAll);
                children.Remove(catcher);
                catchers.Add(catcher);

                //reparent the type within the set of children
                IModifiable type = (IModifiable)children[0];
                children.Remove(type);
                IModifiable typeName = (IModifiable)type.GetNthChild(0);
                typeName.SetNode(Members.TypeName);
                children.Add(typeName);

                //create node new variable with the name used in the catch block;
                IModifiable v = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
                //Code tokens are "catch" "(" exceptionName and ")"
                v.CopyCode(temp, 2);
                children.Add(v);

                FormatField(catcher, children, true);

                node.RemoveChild(temp);
                temp = (IModifiable)node.GetFirstSingleLayer("catchClause");
            }

            IModifiable finalBlock = (IModifiable)node.GetFirstSingleLayer("finallyBlock");
            if (finalBlock != null)
            {
                finalBlock.SetNode(Members.Finally);
                finalBlock.ClearCode(ClearCodeOptions.KeepLine);
                List<INavigable> fchildren = finalBlock.GetNthChild(0).Children;
                finalBlock.DropChildren();
                foreach (IModifiable c in fchildren)
                {
                    c.Parent = finalBlock;
                }
            }

            node.SetNode(Members.Try_Catch);
            node.DropChildren();
            tryer.Parent = node;
            foreach (IModifiable c in catchers)
            {
                c.Parent = node;
            }
            if (finalBlock != null)
            {
                finalBlock.Parent = node;
            }
        }
        #endregion

        #region Package/Import-Driven
        /// <summary>
        /// Parses the string of space names for the endNode in a package declaration
        /// </summary>
        /// <param name="answer"></param>
        private void PackageModifier(IModifiable node)
        {
            List<INavigable> children = node.Children;

            if (children.Count != 1)
            {
                errorMessages.Add("ERROR: Package does not have sufficient children at " + node + System.Environment.NewLine);
                node.PrintTreeText(errorMessages.Add);
            }

            node.DropChildren();
            node.ClearCode(ClearCodeOptions.ClearAll);
            node.CopyCode((IModifiable)children[0]);
            node.SimplifyCode(" ".ToCharArray());
        }

        /// <summary>
        /// Parses the string of space names for the endNode in an import and appends the * or class for this import
        /// </summary>
        /// <param name="answer"></param>
        private void ImportModifier(IModifiable node)
        {
            //there will be one endNode name associated with it
            List<INavigable> children = node.Children;

            if (children.Count != 1)
            {
                errorMessages.Add("ERROR: Import does not have sufficient children at " + node + System.Environment.NewLine);
                node.PrintTreeText(errorMessages.Add);
            }

            node.DropChildren();
            StringBuilder packageNameBuilder = new StringBuilder();
            ((IModifiable)children[0]).SetNode(Members.Package);
            //build node string with the names of the endNode
            foreach (string s in children[0].Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
            {
                packageNameBuilder.Append(s);
            }

            //answer only is written as "import" <potential modifiers> "." endToken
            //we will create nodes for everything in the code and then drop the unnecessary ones
            List<IModifiable> modifiers = node.CreateNodesFromCode(" ;".ToCharArray());
            node.ClearCode(ClearCodeOptions.ClearAll);

            if (modifiers.Count > 0)
            {
                //search through remaining tokens for .
                int index = 1;//start at 1 to skip the import keyword
                while (index < modifiers.Count && !modifiers[index].Code.Equals("."))
                {
                    //ONLY IF THERE ARE MODIFIERS do we need to create the modifier set.
                    //ONCE IT HAS BEEN CREATED we just get it from the answer
                    IModifiable mods = (IModifiable)node.GetFirstRecursive(MemberSets.ModifierSet);
                    if (mods == null)
                    {
                        //no modifiers have been made at this level
                        mods = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                        mods.Parent = node;
                    }

                    //any parts found which are not . are node modifier of some sort
                    IModifiable newMod = CreateModifier(modifiers[index]);
                    newMod.IsNatural = true;
                    newMod.Parent = mods;
                    index++;
                }

                //append remaining parts as the termination of the import.
                for (int i = index; i < modifiers.Count; i++)
                {
                    packageNameBuilder.Append(modifiers[i].Code);
                }
            }
            node.AddCode(packageNameBuilder.ToString(), (IModifiable)children[0]);
        }
        #endregion

        #region Expression-Driven
        /// <summary>
        /// Handles the mutation of specific method calls, to super versions
        /// by changing the super reference to the required parent type.
        /// </summary>
        /// <param name="answer"></param>
        private void SuperTypeModifier(IModifiable node)
        {
            if (!node.Code.Equals("super"))
            {
                //ignore non-"super" types
                return;
            }

            if (node.Node.Equals(Members.MethodInvoke))
            {
                node.SetNode(Members.SuperConstructorInvoke);
            }
            else
            {
                node.SetNode(Members.SuperReference);
            }
        }

        /// <summary>
        /// Works on strings of types such as alpha.beta.gamma by determining the depth of the tree
        /// and then inverting it in situo.
        /// </summary>
        /// <param name="answer"></param>
        private void InvertedExpressionModifier(IModifiable node)
        {
            //TODO resolve the similarities between this function and SplitExtendedName

            //Two simple tests to determine if the answer being examined is inverted
            if (node.Code.Length == 0 || !node.Code.Contains(' '))
            {
                //no code or no space means not the right form
                return;
            }
            else if (!node.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)[0].Equals("."))
            {
                //if the code is not of the form ". alpha" it is not an inverison
                return;
            }

            IModifiable target = (IModifiable)node.Parent;
            List<IModifiable> set = new List<IModifiable>();
            set.Add(node);
            if (node.Node.Equals("expression"))
            {
                node.SetNode(Members.Variable);
            }

            List<INavigable> children = node.Children;
            if (children.Count < 1)
            {
                errorMessages.Add("ERROR: Apparent inversion but no child answer\r\n");
                target.PrintTreeText(errorMessages.Add);
            }

            IModifiable temp = ((IModifiable)node.GetNthChild(0).GetNonTrivialChild());
            while (temp.Code.StartsWith(". "))
            {
                set.Add(temp);
                if (temp.Node.Equals("expression"))
                {
                    temp.SetNode(Members.Variable);
                }

                ((IModifiable)temp.Parent).RemoveChild(temp);
                children = temp.Children;
                if (children.Count < 1)
                {
                    errorMessages.Add("ERROR: Apparent inversion but no child answer\r\n");
                    target.PrintTreeText(errorMessages.Add);
                }
                temp = ((IModifiable)temp.GetNthChild(0).GetNonTrivialChild());
            }

            ((IModifiable)temp.Parent).RemoveChild(temp);
            target.ReplaceChild(node, temp);
            for (int i = set.Count - 1; i >= 0; i--)
            {
                IModifiable dot = (IModifiable)NodeFactory.CreateNode(Members.DotOperator, false);
                dot.Parent = temp;
                set[i].Parent = dot;
                set[i].SimplifyCode(" .".ToCharArray());
                temp.CodeModify(InvertedExpressionModifier);
                temp = set[i];
            }
        }

        /// <summary>
        /// Compresses two different forms of nested expressions based on the structure of the tree at this point
        /// </summary>
        /// <param name="answer"></param>
        private void NestedExpressionModifier(IModifiable node)
        {
            if (node.Code.Equals("( )"))
            {
                //this is not node variable, this is node nested expression statement

                //there are three different things which might be in a nested statement.
                // * it might be on a return type
                // * it might part of an expresion list
                // * it might be part of another expression (i.e. nested)
                //
                //these can also be stacked on each other. The first goal is to 
                //determine what relationship these have with each other.
                //We want to identify the true root of the expression tree.

                INavigable returnLevel = node.GetAncestor(Members.Return);
                INavigable expressionLevel = node.GetAncestor("expression");
                INavigable listLevel = node.GetAncestor("expressionList");
                bool R_Before_E = returnLevel != null && returnLevel.GetAncestor("expression") == expressionLevel;
                bool L_Before_E = listLevel != null && listLevel.GetAncestor("expression") == expressionLevel;
                bool L_Before_R = listLevel != null && listLevel.GetAncestor(Members.Return) == returnLevel;

                IModifiable target = null;
                if (L_Before_E && L_Before_R)
                {
                    //List is first
                    target = (IModifiable)listLevel;
                }
                else if (!R_Before_E && !L_Before_E)
                {
                    //expression first
                    target = (IModifiable)expressionLevel;
                }
                else if (R_Before_E && !L_Before_R)
                {
                    //return first
                    target = (IModifiable)returnLevel;
                }
                else
                {
                    //unknown error type. Logically this should never occur as the three cases above cover all possibilities.
                    //if this occurs it should through an error which must be handled.
                    throw new InvalidOperationException("ANTLRTool.NestedExpressionModifier cannot determine order of expression: \r\n\t" + node + "\r\n\t" + returnLevel + "\r\n\t" + listLevel + "\r\n\t" + expressionLevel);
                }

                //modify the parent/child relationship to that node.
                IModifiable directParent = (IModifiable)node.GetDirectAncestorTo(target);
                target.ReplaceChild(directParent, (IModifiable)node.GetNthChild(0));//reparent 
            }
            else if (node.Code.Length == 0)
            {
                //this occurrs infrequently when an empty variable appears in node tree
                ReparentOnFirstChild(node);
            }
        }

        /// <summary>
        /// Because expressions are necessarily nested structures this method first recurses to the depth 
        /// of the expression tree and then modifies the expressions in reverse order to the root of the expression.
        /// </summary>
        /// <param name="node"></param>
        private void ExpressionModifier(IModifiable node)
        {
            Regex autoChange = new Regex("\\+\\+|\\-\\-|\\+=|\\-=|\\*=|/=|\\%=|\\|=|&=|<<=|>>=|\\^=");
            Regex boolean = new Regex("\\|\\||&&|^<=|^<$|^>$|^>=|==|!=|!");
            Regex ops = new Regex("/|\\*|\\+|\\-|\\%|^&$|^\\|$|> >|< <|\\^|~");

            if (node.Code.Equals("="))
            {
                AssignmentModifier(node);
            }
            else if (node.Code.Equals("( )"))
            {
                if (node.GetNthChild(0).Node.Equals("type") || node.GetNthChild(0).Node.Equals(Members.TypeName))
                {
                    CasteModifier(node);
                }
                else
                {
                    MethodInvokeModifier(node);
                }
            }
            else if (autoChange.IsMatch(node.Code))
            {
                AutoChangeModifier(node);
            }
            else if (boolean.IsMatch(node.Code))
            {
                BooleanModifier(node);
            }
            else if (ops.IsMatch(node.Code))
            {
                node.SetNode(Members.Operator);
            }
            else if (node.Code.Equals("[ ]"))
            {
                ArrayInvokeModifier(node);
            }
            else if (node.Code.Equals("? :"))
            {
                TrinaryModifier(node);
            }
            else if (node.Code.Equals("instanceof"))
            {
                //no structural change, just node name change
                node.SetNode(Members.LanguageTypeCheck);
            }
        }

        /// <summary>
        /// Formats the structure of the Trinary operator 'a ? b : c'
        /// </summary>
        /// <param name="node"></param>
        private void TrinaryModifier(IModifiable node)
        {
            node.SetNode(Members.Trinary);
            node.ClearCode(ClearCodeOptions.KeepAll);
            List<INavigable> children = node.Children;
            node.DropChildren();

            IModifiable boolean = (IModifiable)NodeFactory.CreateNode(Members.Boolean, true);
            boolean.Parent = node;
            children[0].Parent = boolean;

            IModifiable stmt = (IModifiable)NodeFactory.CreateNode(Members.TrinaryScope, true);
            stmt.Parent = node;

            IModifiable right = (IModifiable)NodeFactory.CreateNode(Members.RightScope, true);
            right.Parent = stmt;
            children[1].Parent = right;

            IModifiable wrong = (IModifiable)NodeFactory.CreateNode(Members.WrongScope, true);
            wrong.Parent = stmt;
            children[2].Parent = wrong;
        }

        /// <summary>
        /// Reformats assignments i.e code in the form x = y
        /// </summary>
        /// <param name="answer"></param>
        private void AssignmentModifier(IModifiable node)
        {
            //sometimes an assignment has node trivial parent so we ignore it
            //identifying the true targetNode will help us remove the trivial parent in the way.
            IModifiable target = (IModifiable)node.GetNonTrivialParent();
            INavigable directParent = node.GetDirectAncestorTo(target);
            List<INavigable> children = node.Children;
            List<INavigable> tChildren = target.Children;
            target.DropChildren();

            node.ClearCode(ClearCodeOptions.ClearAll);
            node.SetNode(Members.Write);

            foreach (IModifiable tchild in tChildren)
            {
                if (tchild == directParent)
                {
                    //this switches the order of the child nodes
                    //this always consists of an expression-variable followed by what is being written
                    //even in node nested write statement as in node=b=2; each level is handled separately
                    IModifiable var = (IModifiable)node.GetNthChild(0);
                    node.RemoveChild(var);
                    var.Parent = target;
                    node.Parent = var;
                }
                else
                {
                    //reparent and other children of the targetNode
                    tchild.Parent = target;
                }
            }
        }

        /// <summary>
        /// Reformats casts i.e. code in the form (X) y
        /// </summary>
        /// <param name="node"></param>
        private void CasteModifier(IModifiable node)
        {
            node.SetNode(Members.Cast);
            node.ClearCode(ClearCodeOptions.ClearAll);
            IModifiable t = (IModifiable)node.GetNthChild(0);
            t.SetNode(Members.Type);
            t.IsNatural = false;
        }

        /// <summary>
        /// Reformats unary assignment operators i.e. code in the form x++ or x+=y
        /// </summary>
        /// <param name="node"></param>
        private void AutoChangeModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;

            List<INavigable> children = node.Children;

            //these children are both expressions containing the relevant nodes
            //collapsing the expression on this one gets rid of trival layers without removing nested layers
            IModifiable variable = (IModifiable)children[0];

            target.ReplaceChild(node, variable);//move the variable up node level in the specific place of this answer;
            node.Parent = variable;//reverse the parenting order
            node.RemoveChild((IModifiable)children[0]);//remove the circular reference from this answer
            node.SetNode(Members.Write);
        }

        /// <summary>
        /// Formats various kinds of boolean expressions into a usable tree structure
        /// </summary>
        /// <param name="node"></param>
        private void BooleanModifier(IModifiable node)
        {
            if (node.Code.Equals("&&"))
            {
                node.SetNode(Members.Boolean_And);
            }
            else if (node.Code.Equals("||"))
            {
                node.SetNode(Members.Boolean_Or);
            }
            else if (node.Code.Equals("<"))
            {
                node.SetNode(Members.Boolean_LessThan);
            }
            else if (node.Code.Equals("<="))
            {
                node.SetNode(Members.Boolean_LessThanEqual);
            }
            else if (node.Code.Equals(">"))
            {
                node.SetNode(Members.Boolean_GreaterThan);
            }
            else if (node.Code.Equals(">="))
            {
                node.SetNode(Members.Boolean_GreaterThanEqual);
            }
            else if (node.Code.Equals("!="))
            {
                node.SetNode(Members.Boolean_NotEqual);
            }
            else if (node.Code.Equals("=="))
            {
                node.SetNode(Members.Boolean_Equal);
            }
            else if (node.Code.Equals("!"))
            {
                node.SetNode(Members.Boolean_Not);
            }
            else
            {
                //TODO verify that i have all valid boolean expression in the grammar
                throw new InvalidCastException("Boolean expression " + node + " not recognized");
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Formats array invocations which are found in within other expressions
        /// as in 'new int[]{1,2,3,4}'
        /// </summary>
        /// <param name="answer"></param>
        private void ArrayInvokeModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;

            //removes the variable being indexed and leaves it as the only child of this answer
            List<INavigable> children = node.Children;

            node.DropChildren();
            IModifiable variable = (IModifiable)children[0];

            variable.Parent = node;

            IModifiable index = (IModifiable)NodeFactory.CreateNode(Members.Index, false);
            index.Parent = variable;
            IModifiable indexValue = (IModifiable)children[1];
            indexValue.Parent = index;

            //the [] expression in node is no longer of use and will be replaced
            //to avoid any recursive checking on that we need to remove any child it currently has (i.e. variable)
            //and change the expression.
            node.DropChildren();//no more expressions below this to review except those in variable which we have already done.
            node.SetNode("none");//avoid any error over the node type.
            target.ReplaceChild(node, variable);
        }
        #endregion

        #region Control Structures
        /// <summary>
        /// Formats any control structure which depends on a "parexpression" node (While, 
        /// do-while, switch, if, if-else, and synchronized). After identifying the exact 
        /// type of controls statement the code is forwarded for further classification
        /// </summary>
        /// <param name="answer"></param>
        private void WhileSwitchIfModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            if (target.Code.Contains("while"))
            {
                FormatWhile(node);
            }
            else if (target.Code.Contains("switch"))
            {
                FormatSwitch(node);
            }
            else if (target.Code.Contains("if"))
            {
                //determine if this is an if-else or just if and parse recursively
                IModifiable result = null;
                if (target.Code.Contains("else"))
                {
                    result = FormatIfElse(node);
                }
                else
                {
                    result = FormatIf(node);
                }

                IModifiable elseBlock = (IModifiable)result.GetFirstSingleLayer(Members.Else);
                if (elseBlock.GetNthChild(0).GetChildCount() == 0)
                {
                    //empty else block
                    //get the line from the targetNode and then force the else to retain that line number.
                    elseBlock.CopyCode(target);
                    elseBlock.ClearCode(ClearCodeOptions.KeepLine);
                    IModifiable scope = (IModifiable)elseBlock.GetNthChild(0);
                    scope.CopyCode(target);
                    scope.ClearCode(ClearCodeOptions.KeepLine);
                }

                //now that the recursively parsed result answer is known, reparent it in place of the original statement
                ((IModifiable)target.Parent).ReplaceChild(target, result);
            }
            else if (target.Code.Contains("synchronized"))
            {
                FormatSynchronized(node);
            }
            else
            {
                errorMessages.Add("ERROR: Not a while, switch, if or synchronized statement at " + node + System.Environment.NewLine);
                node.PrintTreeText(errorMessages.Add);
                //should never occur. this method parses while, switches, if and if-else
                //anything else would be caught by this branch and is unexpected.
            }
        }

        /// <summary>
        /// Formats the While and do-while control structures
        /// </summary>
        /// <param name="answer"></param>
        private void FormatWhile(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;
            target.DropChildren();

            IModifiable boolean = (IModifiable)NodeFactory.CreateNode(Members.Boolean, false);
            boolean.Parent = target;

            foreach (IModifiable child in children)
            {
                if (child == node)//catches the parexpression (i.e. the boolean control for this loop)
                {
                    child.GetNthChild(0).Parent = boolean;
                }
                else
                {
                    if (child.GetChildCount() == 1 && child.GetNthChild(0).Node.Equals(Members.Scope))
                    {
                        //reparent the scope on the while loop
                        child.GetNthChild(0).Parent = target;
                    }
                    else
                    {
                        IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                        //BSD scope
                        scope.Parent = target;

                        child.Parent = scope;
                    }
                }
            }

            if (target.Code.Contains("do"))
            {
                //doWhile loop
                target.SetNode(Members.DoWhile);
            }
            else
            {
                //regular while
                target.SetNode(Members.While);
            }
            target.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Formats the switch control structure
        /// </summary>
        /// <param name="answer"></param>
        private void FormatSwitch(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;
            target.DropChildren();

            target.ClearCode(ClearCodeOptions.KeepLine);
            target.SetNode(Members.Switch);

            IModifiable value = (IModifiable)NodeFactory.CreateNode(Members.Value, false);
            value.Parent = target;

            IModifiable blocks = (IModifiable)NodeFactory.CreateNode(Members.Blocks, false);
            blocks.Parent = target;

            foreach (IModifiable child in children)
            {
                if (child == node)
                {
                    //this is the parameter statement;
                    //Case 1: child is an expression; child within that is our value.
                    //Case 2: expression is node meaningful bit of code with relevant children.
                    //Case 1 will collapse. Case 2 will not. Keep the expression.

                    child.GetNthChild(0).Parent = value;
                }
                else
                {
                    IModifiable b = (IModifiable)NodeFactory.CreateNode(Members.Block, true);
                    b.Parent = blocks;

                    IModifiable v = (IModifiable)NodeFactory.CreateNode(Members.Value, false);
                    v.Parent = b;

                    IModifiable s = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                    s.Parent = b;

                    foreach (IModifiable c in child.Children)
                    {
                        if (c.Node.Equals("switchLabel") && c.GetChildCount() > 0)
                        {
                            c.GetNthChild(0).Parent = v;//assign the value for this block
                        }
                        else if (c.Node.Equals("switchLabel") && c.GetChildCount() == 0)
                        {
                            //NOTE: default blocks will simply have an empty value
                            c.SetNode(Members.Default);
                            c.ClearCode(ClearCodeOptions.KeepLine);
                            c.Parent = v;//assign the value for this block
                        }
                        else
                        {
                            c.Parent = s;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Used by both If and If-Else to uniformly prepare the statements
        /// </summary>
        /// <param name="answer"></param>
        /// <param name="elseBranch"></param>
        private void PrepareIf(IModifiable node, out IModifiable elseBranch)
        {
            List<INavigable> children2 = node.Children;
            IModifiable target = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;

            if (children2.Count < 1)
            {
                errorMessages.Add("ERROR: If or If-Else does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: If or If-Else does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }
            node.SetNode(Members.Branch);
            node.ClearCode(ClearCodeOptions.KeepLine);
            node.DropChildren();

            IModifiable boolean = (IModifiable)NodeFactory.CreateNode(Members.Boolean, true);
            boolean.Parent = node;
            children2[0].Parent = boolean;//reparent boolean expression

            //second child of parent is always the scope of the if branch
            IModifiable ifBranch = (IModifiable)NodeFactory.CreateNode(Members.Then, true);
            ifBranch.Parent = node;

            //the Then statement takes one of three forms:
            // * statement-scope - this is the normal version from code like if(b) { doX() }
            // * statement-statementExpression - this is node non-scoped version which happens to include node method call
            //   as in if(b) doX()
            // * almost anything else which is not an expression as in if(b) break;
            //Because the choice of form is node style issue we have to account for all three forms.

            //Assume that thenChild is only some node without node scope
            IModifiable thenChild = (IModifiable)children[1];
            if (thenChild.Node.Equals("statement") && thenChild.Code.Length == 0)
            {
                //when node statement is found we have to dig to the next level
                thenChild = (IModifiable)thenChild.GetNthChild(0);
            }

            if (thenChild.Node.Equals(Members.Scope))
            {
                //thenChild is node scope so we can keep it as is
                thenChild.Parent = ifBranch;
            }
            else
            {
                //single statement needs node scope
                IModifiable scp = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                //BSD scope
                scp.Parent = ifBranch;
                thenChild.Parent = scp;
            }

            elseBranch = (IModifiable)NodeFactory.CreateNode(Members.Else, true);
            elseBranch.Parent = node;
            IModifiable elsescope = (IModifiable)NodeFactory.CreateNode(Members.ElseScope, true);
            elsescope.Parent = elseBranch;
        }

        /// <summary>
        /// Formats an If-then structure with no else
        /// </summary>
        /// <param name="answer"></param>
        /// <returns></returns>
        private IModifiable FormatIf(IModifiable node)
        {
            IModifiable elseBranch;
            PrepareIf(node, out elseBranch);
            //no action with else branch in this case

            return node;
        }

        /// <summary>
        /// Formats an If-then-else structure possibly with further nesting of the if-else
        /// </summary>
        /// <param name="answer"></param>
        /// <returns></returns>
        private IModifiable FormatIfElse(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;
            if (children.Count < 3)
            {
                errorMessages.Add("ERROR: If-Else does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            IModifiable elseBranch;
            PrepareIf(node, out elseBranch);

            //examine the else branch for next recursive layer
            //this is node statement. Either the statement is parent to node Scope or it is
            //another recursive layer itself
            if (children[2].Code.Equals("if else"))
            {
                //this is an if-else again recurse to same method
                IModifiable next = FormatIfElse((IModifiable)children[2].GetNthChild(0));
                next.Parent = elseBranch.GetNthChild(0);
            }
            else if (children[2].Code.Equals("if"))
            {
                //this is just an if recurse to if method
                IModifiable next = FormatIf((IModifiable)children[2].GetNthChild(0));
                next.Parent = elseBranch.GetNthChild(0);
            }
            else if (children[2].GetChildCount() > 0 && children[2].GetNthChild(0).Node.Equals(Members.Scope))
            {
                //plain else, so just replace the scope blocks
                elseBranch.DropChildren();
                ((IModifiable)children[2].GetNthChild(0)).SetNode(Members.ElseScope);
                children[2].GetNthChild(0).Parent = elseBranch;
            }
            else
            {
                //this is node statement directly representing else with no scope.
                children[2].Parent = elseBranch.GetNthChild(0);
            }
            return node;
        }

        /// <summary>
        /// Formats the synchronized control structure
        /// </summary>
        /// <param name="answer"></param>
        private void FormatSynchronized(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            //this is already in the tree structure we want for node locked variable
            List<INavigable> children = target.Children;

            target.ClearCode(ClearCodeOptions.KeepLine);
            target.SetNode(Members.SynchBlock);

            if (children.Count != 2)
            {
                errorMessages.Add("ERROR: Synchronize answer does not contain node locked value and block of execution\r\n");
                target.PrintTreeText(errorMessages.Add);
                return;
            }

            ((IModifiable)children[0]).SetNode(Members.Lock);
            ((IModifiable)children[0]).ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Formats the foreach control structure as distinct from the for(;;) structure
        /// </summary>
        /// <param name="answer"></param>
        private void ForEachModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor("statement");
            target.SetNode(Members.ForEachLoop);
            target.ClearCode(ClearCodeOptions.ClearAll);

            List<INavigable> children = target.Children;
            target.DropChildren();

            List<INavigable> children2 = node.Children;
            if (children2.Count < 2)
            {
                errorMessages.Add("ERROR: For each loop does not have sufficient children nodes\r\n");
                target.PrintTreeText(errorMessages.Add);
            }

            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: For each loop does not have sufficient children nodes\r\n");
                target.PrintTreeText(errorMessages.Add);
            }

            //prepare the variable node which is currently mixed up with the structure of the foreach
            if (node.Code.Length == 0)
            {
                errorMessages.Add("ERROR: No variable names defined for Foreach loop\r\n");
                target.PrintTreeText(errorMessages.Add);
            }
            IModifiable v = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
            v.CopyCode(node, 0);//set the variable name for this field

            //create the write node which will go between the variable and the collection
            IModifiable write = (IModifiable)NodeFactory.CreateNode(Members.Write, true);

            //need to parse the list of items in the field so we have only Variable, Modifier and type.
            List<INavigable> parts = new List<INavigable>();
            parts.Add(v);//add the created variable to the parts
            foreach (IModifiable c in children2)
            {
                if (c.Node.Equals("modifier"))
                {
                    parts.Add(CreateModifier(c));
                }
                else if (c.Node.Equals("type"))
                {
                    //we need the TypeName or Primitive which is under this parent.
                    parts.Add(c.GetNthChild(0));
                }
                else if (c.Node.Equals(Members.Primitive))
                {
                    parts.Add(c);
                }
                else if (c.Node.Equals(Members.TypeName))
                {
                    parts.Add(c);
                }
                else
                {
                    //this is the collection of parts used in the for each.
                    //just parent this off the write as expected
                    c.Parent = write;
                }
            }

            //format the field as per usual and then parent the collection writing to the variable.
            FormatField(target, parts, true);
            write.Parent = v;

            if (children[1].Node.Equals("statement") && children[1].Code.Length == 0)//normally node freach has node statement which holds the scope
            {
                children[1].GetFirstSingleLayer(Members.Scope).Parent = target;//add the scope block onto the for loop
            }
            else
            {
                //when the block is directly parented on this you must artificially create the scope and parent everything
                IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                children[1].Parent = scope;
                scope.Parent = target;
            }
        }

        /// <summary>
        /// Formats the for(;;) control structure as distinct from the foreach structure
        /// </summary>
        /// <param name="answer"></param>
        private void ForThreePartModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            target.SetNode(Members.For3Loop);
            target.ClearCode(ClearCodeOptions.KeepLine);

            List<INavigable> children = target.Children;
            target.DropChildren();

            List<INavigable> children2 = node.Children;

            IModifiable for1 = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, "", false);
            for1.Parent = target;
            IModifiable for1a = (IModifiable)NodeFactory.CreateNode(Members.ForInitial, "", false);
            for1a.Parent = target;
            IModifiable for2 = (IModifiable)NodeFactory.CreateNode(Members.Boolean, "", false);
            for2.Parent = target;
            IModifiable for3 = (IModifiable)NodeFactory.CreateNode(Members.Update, "", false);
            for3.Parent = target;
            IModifiable for3Scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, "", true);
            for3Scope.Parent = for3;

            if (children2.Count < 1)
            {
                //this is node for with no portions. That is equivalent to "while(true)"

                IModifiable exp = (IModifiable)NodeFactory.CreateNode("expression", "", true);

                IModifiable lit = (IModifiable)NodeFactory.CreateNode(Members.Literal, true);
                lit.AddCode("true", node);

                IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, true);

                IModifiable t = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);
                t.AddCode("Boolean", lit);

                //by connecting these artificial nodes we create the single required boolean literal
                t.Parent = type;
                type.Parent = lit;
                lit.Parent = exp;
                children2.Add(exp);
            }

            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: For loop does not have sufficient children nodes\r\n");
                target.PrintTreeText(errorMessages.Add);
                return;
            }

            //because node for loop can be missing either the init, update or both, 
            //we use this forcontrolIndex to control which block we are modifying.
            int forControlIndex = 0;
            IModifiable var = (IModifiable)children2[forControlIndex].GetFirstRecursive("forInit");
            if (var != null)
            {
                //there is an init block
                var = (IModifiable)children2[forControlIndex].GetFirstRecursive("localVariableDeclaration");
                if (var != null)
                {
                    //need to parse the list of items in the field so we have only Variable, Modifier and type.
                    List<INavigable> parts = new List<INavigable>();
                    foreach (IModifiable c in var.Children)
                    {
                        if (c.Node.Equals("modifier"))
                        {
                            parts.Add(CreateModifier(c));
                        }
                        else if (c.Node.Equals("type"))
                        {
                            //we need the TypeName or Primitive which is under this parent.
                            parts.Add(c.GetNthChild(0));
                        }
                        else if (c.Node.Equals(Members.TypeName))
                        {
                            parts.Add(c);
                        }
                        else if (c.Node.Equals(Members.Variable))
                        {
                            //actual variable
                            parts.Add(c);
                        }
                        else
                        {
                            throw new InvalidOperationException("Unknown field member " + c + " in node for3loop.");
                        }
                    }

                    //format the field as per usual and then parent the collection writing to the variable.
                    FormatField(target, parts, true);
                }
                else
                {
                    //find the expression list and evaluate the expression for each 
                    var = (IModifiable)children2[forControlIndex].GetFirstRecursive("expressionList");
                    foreach (IModifiable exp in var.Children)
                    {
                        exp.Parent = for1a;
                    }
                }
                forControlIndex++;//it has now been handled
            }

            //first, we only need to parse this if there are more nodes
            if (forControlIndex < children2.Count)
            {
                //second, we need to determine if this is an update or not.
                if (children2[forControlIndex].GetFirstRecursive("forUpdate") == null)
                {
                    //Anything else will be the boolean expression.
                    children2[forControlIndex++].Parent = for2;
                }
            }

            //Again check to see if there are enough nodes
            if (forControlIndex < children2.Count)
            {
                var = (IModifiable)children2[forControlIndex].GetFirstRecursive("forUpdate");
                List<INavigable> updates = children2[forControlIndex].BreadthFirstSearch("expression");
                foreach (IModifiable child in updates)
                {
                    child.Parent = for3.GetNthChild(0);
                    child.Collapse("expression");
                    child.RootUpModify("expression", "expression", ExpressionModifier);
                }
            }

            //reparent the for block
            IModifiable scope = (IModifiable)children[1].GetFirstSingleLayer(Members.Scope);
            if (scope == null)
            {
                //this is node single line of node for loop
                scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                //BSD scope
                children[1].Parent = scope;
            }
            scope.Parent = target;
        }
        #endregion

        #region Invocations
        /// <summary>
        /// ??? I don't remember what this is for. Something to do with generic types as in '?'
        /// TODO investigate the use of this method
        /// </summary>
        /// <param name="node"></param>
        private void GenericInvocationModifier(IModifiable node)
        {
            //setting the type associated with the invoked method which is declared with node wildcard
            //We need to correctly reparent this so that the type relationship is still clear.

            IModifiable dotexpression = (IModifiable)node.Parent;//this is the dot operator which indicates the point of invocation
            IModifiable target = (IModifiable)dotexpression.Parent;//point on which the exchange will take place

            List<INavigable> children = node.Children;//the children control the generic type relationship with this method

            //there are always two children: the type arguments and the method suffix 
            if (children.Count != 2)
            {
                throw new InvalidDataException("Generic information improperly formated: " + node);
            }

            //the remainder is everything else in the chain which we don't want to disturb
            IModifiable remainder = (IModifiable)dotexpression.GetNthChild(0);

            //this expands the code of that child to indicate the . operator as well
            IModifiable methodSuffix = (IModifiable)children[1];
            string code = methodSuffix.Code;
            methodSuffix.ClearCode(ClearCodeOptions.ClearAll);
            methodSuffix.AddCode(".", dotexpression);
            methodSuffix.AddCode(code, methodSuffix);

            //there is only one child of the method which contains the parameters or arguments of the call.
            if (methodSuffix.GetChildCount() != 1)
            {
                throw new InvalidDataException("Generic invocation improperly formated: " + methodSuffix);
            }

            //make the method invocation into an expression for future parsing
            IModifiable expression = (IModifiable)methodSuffix.GetNthChild(0);
            expression.SetNode("expression");

            //recursive search for additional generic invokations
            IModifiable next = (IModifiable)expression.GetFirstRecursive("explicitGenericInvocation");
            if (next != null)
            {
                GenericInvocationModifier(next);
            }

            //save any children of expression if any
            List<INavigable> arguments = expression.Children;
            expression.DropChildren();

            //in order to make the method invocation structure we have to reorder the parenting.
            methodSuffix.Parent = expression;
            methodSuffix.DropChildren();
            methodSuffix.SetNode("expression");

            //insert the method suffix into the remainder
            if (remainder.Code.Length == 0)
            {
                //in most cases there is an empty expression between the dot operator and the next identifier
                //skip that empty expression.
                remainder.GetNthChild(0).Parent = methodSuffix;
            }
            else
            {
                //in some cases an expression already exists e.g. ". something"
                //don't skip that one.
                remainder.Parent = methodSuffix;
            }

            foreach (IModifiable arg in arguments)
            {
                arg.Parent = expression;
            }

            //reparent the method under the targetNode
            target.ReplaceChild(dotexpression, expression);
        }

        /// <summary>
        /// Changes the node type to identify it as a self-reference
        /// </summary>
        /// <param name="node"></param>
        private void ThisModifier(IModifiable node)
        {
            if (node.Code.Equals("this"))
            {
                node.SetNode(Members.SelfReference);
            }
        }

        /// <summary>
        /// Takes methods which are called on node super type, alters their structure to reparent with
        /// the super as in all nested expressions and then calls the mothod modifier to finish.
        /// </summary>
        /// <param name="answer"></param>
        private void SuperMethodModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent.Parent;
            IModifiable parent = (IModifiable)node.Parent;

            IModifiable exp = (IModifiable)NodeFactory.CreateNode("expression", true);
            IModifiable parameters = (IModifiable)node.GetNthChild(0);
            exp.AddCode("( )", parameters);
            node.RemoveChild(parameters);

            parent.RemoveChild(node);
            target.ReplaceChild(parent, exp);
            node.Parent = exp;
            parent.Parent = node;

            if (parameters.GetChildCount() > 0)
            {
                parameters.GetNthChild(0).Parent = exp;
            }

            MethodInvokeModifier(exp);
        }

        /// <summary>
        /// Formats the structure of node method invoked (called) with actual parameters
        /// </summary>
        /// <param name="answer"></param>
        private void MethodInvokeModifier(IModifiable node)
        {
            //node.Parent.PrintTreeText();
            node.SetNode(Members.MethodInvoke);
            IModifiable method = ((IModifiable)node.GetNthChild(0).GetNonTrivialChild());
            String s = method.Code;
            node.RemoveChild((IModifiable)node.GetNthChild(0));
            List<INavigable> argList = node.Children;
            node.DropChildren();
            node.ClearCode(ClearCodeOptions.ClearAll);

            if (s.Equals("this"))
            {
                //only occurs where node constructor is used as node prototype for node more complex constructor
                //this changes the meaning of the method invoke and no "new" is used in this case
                //other than that treat like any other method
                node.SetNode(Members.SelfConstructorInvoke);
            }

            //all methods have node name
            node.AddCode(s, method);

            //children of the method can only be chained accessors; 
            //maintain that chain so the next level can be assessed.
            foreach (IModifiable child in method.Children)
            {
                child.Parent = node;
            }

            //create the parameter list
            IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
            param.Parent = node;
            FormatParameterList(param, argList);
        }

        /// <summary>
        /// Identifies classes which are defined entirely within a method or constructor. 
        /// Such classes can be counted as private classes within the main type. They are
        /// known as "anonymous" classes
        /// </summary>
        /// <param name="node"></param>
        private void HiddenClassModifier(IModifiable node)
        {
            INavigable classDeclaration = node.GetFirstRecursive("classDeclaration");
            INavigable parentClassBody = node.GetAncestor("classBody");

            while (classDeclaration != null)
            {
                IModifiable block = (IModifiable)classDeclaration.GetAncestor("block");
                IModifiable direct = (IModifiable)classDeclaration.GetDirectAncestorTo(block);
                block.RemoveChild(direct);

                IModifiable classBodyDeclaration = (IModifiable)NodeFactory.CreateNode("classBodyDeclaration", true);

                IModifiable memberDeclaration = (IModifiable)NodeFactory.CreateNode("memberDeclaration", true);

                classBodyDeclaration.Parent = parentClassBody;
                memberDeclaration.Parent = classBodyDeclaration;
                classDeclaration.Parent = memberDeclaration;

                classDeclaration = (IModifiable)node.GetFirstRecursive("classDeclaration");
            }
        }

        /// <summary>
        /// Parse the static method for a class (i.e. the method which is run when the class
        /// is first referenced.
        /// </summary>
        /// <param name="node"></param>
        private void StaticMethodModifier(IModifiable node)
        {
            if (node.Code.Equals("static"))
            {
                //this is node the static method. I want to reformat it to look like node normal method

                //get the block which belongs with the static method
                List<INavigable> methodBlock = node.Children;
                if (methodBlock.Count != 1 || !methodBlock[0].Node.Equals("block"))
                {
                    throw new InvalidOperationException("Static method has unexpected structure in " + node);
                }
                node.DropChildren();

                //create the nodes which go into the new structure
                IModifiable declaration = (IModifiable)NodeFactory.CreateNode("memberDeclaration", true);
                IModifiable methDeclaration = (IModifiable)NodeFactory.CreateNode("methodDeclaration", true);
                methDeclaration.AddCode("void static", node);
                IModifiable paramaters = (IModifiable)NodeFactory.CreateNode("formalParameters", true);
                paramaters.AddCode("( )", node);
                IModifiable body = (IModifiable)NodeFactory.CreateNode("methodBody", true);
                node.ClearCode(ClearCodeOptions.ClearAll);

                //creat eht new structure
                declaration.Parent = node;
                methDeclaration.Parent = declaration;
                paramaters.Parent = methDeclaration;
                body.Parent = methDeclaration;
                methodBlock[0].Parent = body;
            }
        }

        /// <summary>
        /// Identifies and structure any block of code i.e. { } used to create a new scope.
        /// </summary>
        /// <param name="node"></param>
        private void InlineCodeModifier(IModifiable node)
        {
            IModifiable scope = (IModifiable)node.GetFirstSingleLayer("block");
            if (scope == null)
            {
                return;
            }

            node.SetNode(Members.Inline);
        }

        /// <summary>
        /// Formates the structure of a constructor method
        /// </summary>
        /// <param name="node"></param>
        private void ClassConstructorModifier(IModifiable node)
        {
            List<INavigable> children = node.Children;
            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: Constructor does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            INavigable rest = children[1];

            IModifiable classBody = (IModifiable)rest.GetFirstSingleLayer("classBody");
            if (classBody == null)
            {
                //exits for all normal constructors
                return;
            }

            //this is node constructor invoke, BUT with node class definition as part of the constructor. 
            //This needs to be defined as its own type and insert correctly into the class structure
            INavigable parentClassBody = node.GetAncestor("classBody");

            if (parentClassBody == null)
            {
                parentClassBody = node.GetAncestor("interfaceBody");
            }

            if (parentClassBody == null)
            {
                parentClassBody = node.GetAncestor("enumBodyDeclarations");
            }


            //first prepare node new classBodyDeclaration with all the class structure elements
            IModifiable declaration = (IModifiable)NodeFactory.CreateNode("classBodyDeclaration", true);
            declaration.Parent = parentClassBody;

            IModifiable name = (IModifiable)children[0];

            //artificially set up this as node type within major class
            IModifiable typeDef = (IModifiable)NodeFactory.CreateNode("classDeclaration", true);
            typeDef.AddCode("class", name);
            string anonName = NodeFactory.GenerateAnonymous(name);
            typeDef.AddCode(anonName, name);
            typeDef.AddCode("implements", name);
            typeDef.Parent = declaration;
            classBody.Parent = typeDef;

            IModifiable typeNode = (IModifiable)NodeFactory.CreateNode("typeList", false);
            IModifiable typeName = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);
            typeName.AddCode(name.Code, name);//parent class is the declared constructor name
            typeName.Parent = typeNode;
            typeNode.Parent = typeDef;

            //remove class body from constructor
            IModifiable arguments = (IModifiable)rest.GetNthChild(0);
            ((IModifiable)rest).DropChildren();
            arguments.Parent = rest;

            IModifiable constructor = (IModifiable)children[0];
            IModifiable link = (IModifiable)NodeFactory.CreateNode(Members.AnonymousLink, true);
            link.AddCode(anonName, constructor);
            link.Parent = constructor;

            //recursive check for additional creators
            classBody.RootUpModify("creator", "creator", ClassConstructorModifier);
        }

        /// <summary>
        /// ??? I forget what this does. Something to do with non-constructor methods
        /// 
        /// TODO investigate this to identify what it does.
        /// </summary>
        /// <param name="node"></param>
        private void InnerConstructionModifier(IModifiable node)
        {
            List<INavigable> children = node.Children;
            if (children.Count < 1)
            {
                errorMessages.Add("ERROR: Constructor does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            //parent of this answer is "new". Next non-trivial parent is the expression or statement where this will be parented.
            IModifiable target = ((IModifiable)node.Parent.GetNonTrivialParent());
            target.DropChildren();
            node.Parent = target;

            //format the parameter list
            IModifiable list = (IModifiable)children[0];
            list.SetNode(Members.ParameterList);
            list.IsNatural = false;
            list.ClearCode(ClearCodeOptions.ClearAll);

            INavigable argList = list.GetNthChild(0);
            list.DropChildren();
            FormatParameterList(list, argList.Children);
        }

        /// <summary>
        /// Common method to find all parameters for a method.
        /// </summary>
        /// <param name="list"></param>
        /// <param name="argList"></param>
        private void FormatParameterList(IModifiable list, List<INavigable> argList)
        {
            foreach (IModifiable child in argList)
            {
                if (child.Node.Equals("expressionList"))
                {
                    foreach (IModifiable c in child.Children)
                    {
                        IModifiable p = (IModifiable)NodeFactory.CreateNode(Members.Parameter, true);
                        p.Parent = list;
                        c.Parent = p;
                    }
                }
                else
                {
                    //this is known to occur when node parameter is also an assignment as in method(var = new Sometype());
                    IModifiable p = (IModifiable)NodeFactory.CreateNode(Members.Parameter, true);
                    p.Parent = list;
                    child.Parent = p;
                }
            }
        }

        /// <summary>
        /// SpecialCase of SplitExtendedName which avoid Literals.
        /// </summary>
        /// <param name="other"></param>
        private void OtherDotModifier(IModifiable other)
        {
            if (!other.Node.Equals(Members.Literal))
            {
                SplitExtendedName(other);
            }
        }

        /// <summary>
        /// Take a name like 'x.y.z' and creates a structure which represents the hierarchy.
        /// </summary>
        /// <param name="other"></param>
        private void SplitExtendedName(IModifiable other)
        {
            //TODO Resolve the similarities between this and InvertedExpressionModifier

            if (other.Code.Contains(" . "))
            {
                //this type name is node compound of some number of packages
                //needs to be reformated

                INavigable target = other.Parent;
                //find the length of the chain
                string[] parts = other.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                //add the members in reverse order to node stack
                List<IModifiable> stack = new List<IModifiable>();
                for (int i = 1; i < parts.Length - 1; i += 2)
                {
                    IModifiable n = (IModifiable)NodeFactory.CreateNode("expression", true);
                    n.AddCode(parts[i], other);
                    n.AddCode(parts[i + 1], other);
                    stack.Add(n);
                }

                //the last one in the stack is the first name in the list
                IModifiable last = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
                last.AddCode(parts[0], other);

                //get the first item which will replace the existing type name
                IModifiable first = stack[stack.Count - 1];
                stack.RemoveAt(stack.Count - 1);

                //substitute names of first element
                other.ClearCode(ClearCodeOptions.ClearAll);
                other.CopyCode(first);

                //store and drop any children
                List<INavigable> children = other.Children;
                other.DropChildren();

                //rebuild the children from the stack
                //add each element in the stack
                IModifiable current = other;
                while (stack.Count > 0)
                {
                    IModifiable next = stack[stack.Count - 1];
                    stack.RemoveAt(stack.Count - 1);
                    next.Parent = current;
                    current = next;
                }

                last.Parent = current;

                //readd all other children.
                foreach (INavigable n in children)
                {
                    n.Parent = other;
                }
            }
        }

        /// <summary>
        /// Formats the structure of node constructor invoked or called with actual parameters
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructionModifier(IModifiable node)
        {
            List<INavigable> children = node.Children;
            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: Constructor does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            //parent of this answer is "new". Next non-trivial parent is the expression or statement where this will be parented.
            IModifiable target = (IModifiable)node.Parent.GetNonTrivialParent();
            INavigable directParent = node.GetDirectAncestorTo(target);
            List<INavigable> targetChildren = target.Children;
            target.DropChildren();

            bool arrayInvokation = false;
            IModifiable constructor = (IModifiable)NodeFactory.CreateNode(Members.ConstructorInvoke, true);
            if (node.GetFirstSingleLayer("arrayCreatorRest") != null)
            {
                constructor.SetNode(Members.ArrayInvoke);
                constructor.ArrayDegree = (node.GetNthChild(1).Code.LastIndexOf(']') - 2) / 4 + 1;
                arrayInvokation = true;
            }

            foreach (IModifiable child in targetChildren)
            {
                if (child == directParent)//parent that is being replaced
                {
                    constructor.Parent = target;
                }
                else
                {
                    child.Parent = target;
                }
            }

            IModifiable typeName = (IModifiable)children[0];

            //for primitive types (arrays, not constructors) the typename is actually empty
            //there is a child node which has the real type name.
            if (typeName.Code.Length == 0)
            {
                typeName = (IModifiable)typeName.GetNthChild(0);
            }

            constructor.CopyCode(typeName);
            SplitExtendedName(constructor);
            foreach (IModifiable c in typeName.Children)
            {
                c.Parent = constructor;
            }

            IModifiable list = (IModifiable)children[1];
            list.SetNode(Members.ParameterList);
            list.IsNatural = false;
            list.ClearCode(ClearCodeOptions.ClearAll);
            list.Parent = constructor;
            if (arrayInvokation && list.GetNthChild(0).Node.Equals("arrayInitializer"))
            {
                //there are two kinds of array constructors
                //node = new int[7];
                //node = new int[]{7,6,5,4,3,2,1};
                //this only needs to catch the later which will have an arrayInitializer node.
                //the other will be handeled like any other constructor.
                ParseArrayInvokeParameters(list);
            }
            else if (arrayInvokation)
            {
                //the children of list are already the parameters.
            }
            else
            {
                //validate parameter list structure.
                if (list.GetChildCount() != 1)
                {
                    throw new InvalidOperationException("Malformed constructor at " + constructor);
                }

                //The arguments are under the list object
                INavigable argList = list.GetNthChild(0);
                list.DropChildren();

                FormatParameterList(list, argList.Children);
            }
        }

        private void ParseArrayInvokeParameters(IModifiable list)
        {
            //the list node is node parameter list
            //the next node is the array initializer which we will remove
            INavigable arrayInit = list.GetNthChild(0);
            //the next set of nodes will be the indivifal parameters
            List<INavigable> parameters = arrayInit.Children;
            ((IModifiable)list).DropChildren();

            //check for additional array depth
            if (parameters.Count > 0 && parameters[0].GetFirstRecursive("arrayInitializer") != null)
            {
                //each parameter is actually another array
                List<IModifiable> used = new List<IModifiable>();
                foreach (INavigable p in parameters)
                {
                    //recurse
                    IModifiable m = (IModifiable)p;
                    m.SetNode(Members.ParameterList);
                    ParseArrayInvokeParameters(m);

                    //attach parameter to list
                    IModifiable p2 = (IModifiable)NodeFactory.CreateNode(Members.Parameter, true);
                    p2.Parent = list;
                    m.Parent = p2;
                }
            }
            else
            {
                List<IModifiable> used = new List<IModifiable>();
                foreach (INavigable v in parameters)
                {
                    //work under variableInitializer to the expression.
                    IModifiable t = (IModifiable)v;
                    IModifiable p = (IModifiable)NodeFactory.CreateNode(Members.Parameter, true);
                    t.Parent = p;
                    p.Parent = list;
                }
            }
        }
        #endregion

        #region Major components
        /// <summary>
        /// Identify the class initializer if it exists and perform an abbreviated version of the method formating
        /// </summary>
        /// <param name="answer"></param>
        private void staticMethodModifier(IModifiable node)
        {
            if (node.Node.Equals("classBodyDeclaration") && node.Code.Equals("static"))
            {
                //use the static method name as node modifier
                IModifiable set = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                set.Parent = node;

                IModifiable mod = (IModifiable)NodeFactory.CreateNode(Members.Static, false);
                mod.Parent = node;

                node.SetNode(Members.Method);
                node.ClearCode(ClearCodeOptions.ClearAll);

                //null return type
                IModifiable returnSet = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
                returnSet.Parent = node;

                //no exceptions are valid here
                //no parameters here, just an empty parameterlist

                //add the parameter list
                IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                param.Parent = node;

                //add the scope
                IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, "");

                if (scope != null)
                {
                    IModifiable directChild = (IModifiable)scope.GetDirectAncestorTo(node);
                    scope.SetNode(Members.MethodScope);
                    scope.Parent = node;
                    node.RemoveChild(directChild);
                }
                else
                {
                    //this is an error because node non-abstract method is missing the method scope
                    errorMessages.Add("ERROR: Non-abstract method without method scope\r\n");
                    node.PrintTreeText(errorMessages.Add);
                }
            }
        }

        /// <summary>
        /// Formats the structure of a method definition
        /// </summary>
        /// <param name="node"></param>
        /// <param name="target"></param>
        private void SingleMethodModifier(IModifiable node, IModifiable target)
        {
            target.SetNode(Members.Method);

            //add the modifiers set
            FormatModifiers(target);

            //add the return value
            IModifiable returnSet = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
            returnSet.Parent = target;

            //add the exceptions set
            //naively assume that there is no throws statement
            IModifiable exceptionSet = null;
            string[] code = node.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            if (node.Code.EndsWith("throws") || node.Code.EndsWith("throws ;"))
            {
                //redefine the code split to include node throw statement
                code = node.Code.Substring(0, node.Code.Length - 6).Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                exceptionSet = (IModifiable)NodeFactory.CreateNode(Members.Exceptions, false);
                exceptionSet.Parent = target;
            }

            //add the parameter list
            IModifiable param = (IModifiable)node.GetFirstRecursive(Members.ParameterList);
            param.ClearCode(ClearCodeOptions.ClearAll);
            param.Parent = target;
            node.RemoveChild(param);

            //add any exception types
            IModifiable except = (IModifiable)node.GetFirstSingleLayer("qualifiedNameList");
            if (except != null)
            {
                foreach (IModifiable c in except.Children)
                {
                    c.Parent = exceptionSet;
                    c.SetNode(Members.Exception);
                }
                node.RemoveChild(except);
            }
            else
            {
                except = (IModifiable)node.GetFirstSingleLayer("qualifiedName");
                if (except != null)
                {
                    except.Parent = exceptionSet;
                    except.SetNode(Members.Exception);
                    node.RemoveChild(except);
                }
            }

            //get the return type
            int methodNameIndex = 0;//assumes name of method only b/c of child for return type
            if (code[0].Equals("void"))
            {
                methodNameIndex++;//revises for void return types
            }
            else
            {
                //add return type
                IModifiable ret = (IModifiable)node.GetNthChild(0);
                ret.Parent = returnSet;
                node.RemoveChild(ret);
            }

            //add method name
            target.AddCode(code[methodNameIndex], node);
        }

        /// <summary>
        /// Formats node method as node major type under the class defintion
        /// </summary>
        /// <param name="answer"></param>
        private void ClassMethodModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");

            if (target == null)
            {
                throw new InvalidCastException("Class method has no body declaration: " + node);
            }

            //find the scope and remove it from the method
            IModifiable scope = (IModifiable)node.GetFirstRecursive(Members.Scope);
            if (scope != null)
            {
                IModifiable directChild = (IModifiable)scope.GetDirectAncestorTo(node);
                scope.SetNode(Members.MethodScope);
                node.RemoveChild(directChild);
            }

            SingleMethodModifier(node, target);

            List<INavigable> modifiers = target.GetFirstSingleLayer(MemberSets.ModifierSet).Children;
            bool isAbstract = false;
            foreach (IModifiable m in modifiers)
            {
                if (m.Node.Equals(Members.Abstract))
                {
                    isAbstract = true;
                    break;
                }
                else if (m.Node.Equals(Members.Native))
                {
                    isAbstract = true;
                    break;
                }
            }

            //add the scope
            if (scope != null)
            {
                scope.Parent = target;
            }
            else if (!isAbstract)
            {
                //this is an error because node non-abstract method is missing the method scope
                errorMessages.Add("ERROR: Non-abstract method without method scope\r\n");
                target.PrintTreeText(errorMessages.Add);
            }
        }

        /// <summary>
        /// Formats the structure of node constructor defintion as node form of method
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructorModifier(IModifiable node)
        {
            //store the targetNode
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");

            //add node temporary return type to make this like any other method answer
            ((IModifiable)NodeFactory.CreateNode("FakeReturnType", false)).Parent = node;

            //treat as any other Method
            ClassMethodModifier(node);

            //small alterations for constructors
            target.SetNode(Members.Constructor);//not node method
            IModifiable returnType = (IModifiable)target.GetFirstRecursive(Members.ReturnType).GetNthChild(0);
            returnType.SetNode(Members.TypeName);
            returnType.CopyCode(target);
            returnType.IsNatural = true;
        }

        /// <summary>
        /// The method declared by an interface is necessarily different than that defined
        /// in the implementation class.
        /// </summary>
        /// <param name="node"></param>
        private void InterfaceMethodModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor("interfaceBodyDeclaration");

            if (target == null)
            {
                throw new InvalidCastException("Interface method has no body declaration: " + node);
            }

            SingleMethodModifier(node, target);
        }

        /// <summary>
        /// Formats the structure of an enumeration
        /// </summary>
        /// <param name="node"></param>
        private void enumModifier(IModifiable node)
        {
            if (node.Code.StartsWith("enum "))
            {
                IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");
                IModifiable targetI = (IModifiable)node.GetAncestor("interfaceBodyDeclaration");
                if (target != null && targetI != null)
                {
                    //this class/interface is nested and the enum is only on the lower of them.
                    INavigable link = targetI.GetDirectAncestorTo(target);
                    if (link != null)
                    {
                        //The interface is the child of the class so the target is now the interface
                        target = targetI;
                    }
                }

                target.SetNode(Members.Enumerator);
                FormatModifiers(target);

                target.CopyCode(node, 1);

                List<INavigable> enums = node.BreadthFirstSearch("enumConstant");
                IModifiable directParent = (IModifiable)node.GetDirectAncestorTo(target);
                target.RemoveChild(directParent);

                IModifiable set = (IModifiable)NodeFactory.CreateNode(MemberSets.Values, false);
                set.Parent = target;

                foreach (IModifiable c in enums)
                {
                    c.SetNode(Members.Value);
                    c.Parent = set;
                }
            }
        }

        /// <summary>
        /// Formats the main class definition and any nested types
        /// </summary>
        /// <param name="answer"></param>
        private void TypeModifier(IModifiable node)
        {
            //Start by assuming this will be node private type
            //find the head node wihting the parent declaration
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");
            if (target == null)
            {
                //we also check for node something nested within an interface
                target = (IModifiable)node.GetAncestor("interfaceBodyDeclaration");
            }

            if (target == null)
            {
                //we also check for node something nested within an enum
                target = (IModifiable)node.GetAncestor("enumBodyDeclaration");
            }

            if (target == null)//if neither case is true, then this must be the main type
            {
                target = (IModifiable)node.GetAncestor("typeDeclaration");
            }

            FormatModifiers(target);

            try
            {
                target.ModifyToTypeDeclaration(node);
            }
            catch (InvalidOperationException e)
            {
                errorMessages.Add(e.Message);
                target.PrintTreeText(errorMessages.Add);
            }

            Dictionary<MemberSets, IModifiable> sets = new Dictionary<MemberSets, IModifiable>();
            foreach (MemberSets ms in Enum.GetValues(typeof(MemberSets)))
            {
                if (ms == MemberSets.Classification || ms == MemberSets.ModifierSet || ms == MemberSets.Fields)
                {
                    //these three members are added in other locations and not part of this loop
                    continue;
                }
                IModifiable tempNode = (IModifiable)NodeFactory.CreateNode(ms, false);
                tempNode.Parent = target;
                sets.Add(ms, tempNode);
            }

            //look at the children of this answer
            foreach (IModifiable child in node.Children)
            {
                if (child.Node.Equals("classBody") || child.Node.Equals("interfaceBody") || child.Node.Equals("enumBodyDeclarations"))
                {
                    //reparent all body declarations on this class/interface
                    foreach (IModifiable grandChild in child.Children)
                    {
                        if (grandChild.Node.Equals(Members.Method))
                        {
                            grandChild.Parent = sets[MemberSets.Methods];
                        }
                        else if (grandChild.Node.Equals(Members.Constructor))
                        {
                            grandChild.Parent = sets[MemberSets.Constructors];
                        }
                        else if (grandChild.Node.Equals("Enumerator"))
                        {
                            grandChild.Parent = sets[MemberSets.Enumerations];
                        }
                        else if (grandChild.Node.Equals(MemberSets.Fields))
                        {
                            //leave it parented on the type as it should be
                            //another modifier will move all Fields into the fieldSet
                            grandChild.Parent = target;
                        }
                        else if (grandChild.Node.Equals(Members.TypeDeclaration))
                        {
                            //this is node nested type
                            grandChild.Parent = sets[MemberSets.Types];
                        }
                        else if (grandChild.Node.Equals(Members.Inline))
                        {
                            //this is an inline code block
                            grandChild.Parent = sets[MemberSets.Inlines];
                        }
                        else
                        {
                            //everything else
                            grandChild.Parent = target;
                        }
                    }
                }
                else if (child.Node.Equals("enumConstants"))
                {
                    foreach (IModifiable c in child.Children)
                    {
                        c.SetNode(Members.Value);
                        c.Parent = sets[MemberSets.Values];
                        if (c.GetChildCount() > 0)
                        {
                            List<INavigable> children = c.Children;
                            c.DropChildren();
                            IModifiable parameters = (IModifiable)children[0].GetFirstRecursive("expressionList");
                            if (parameters == null)
                            {
                                continue;
                            }

                            IModifiable list = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, true);
                            list.Parent = c;

                            foreach (IModifiable param in parameters.Children)
                            {
                                param.Parent = list;
                            }
                        }
                    }
                }
                else //private declarations of internal types
                {
                    //this occurs for types with node generic component
                    //currently we ignore the generic component.
                    if (child.Node.Equals("typeParameters"))
                    {
                        continue;
                    }

                    List<INavigable> allMy = new List<INavigable>();

                    //the one parent class will be in node tree starting with "type"
                    NodeType classification = NodeType.CreateNodeType(Members.CLASS);

                    if (NodeFactory.IsAnonymous(target.Code))
                    {
                        classification = NodeType.CreateNodeType(Members.ANONYMOUS);

                        //there is one type. Could be node class or an interface
                        allMy.Add(child.GetNthChild(0));
                    }
                    else if (child.Node.Equals("typeList"))
                    {
                        //the alternative is node list of 1 or more interfaces
                        classification = NodeType.CreateNodeType(Members.INTERFACE);
                        foreach (INavigable n in child.Children)
                        {
                            //the direct child is node "type" the grandchild is the interface TypeName
                            allMy.Add(n.GetNthChild(0));
                        }
                    }
                    else
                    {
                        //there is one class;
                        allMy.Add(child.GetNthChild(0));
                    }

                    //we now know explicitly if the parent type is an interface or class


                    foreach (IModifiable oneOf in allMy)
                    {
                        //reparent and type any SuperTypes
                        IModifiable temp = (IModifiable)NodeFactory.CreateNode(Members.SuperType, true);
                        temp.CopyCode(oneOf);
                        foreach (IModifiable c in oneOf.Children)
                        {
                            c.Parent = temp;
                        }
                        //add classfication under this new super type declaration
                        IModifiable classType = (IModifiable)NodeFactory.CreateNode(classification, true);
                        classType.Parent = temp;
                        temp.Parent = sets[MemberSets.SuperTypes];
                    }
                }
            }

            if (target.GetFirstSingleLayer(MemberSets.Classification).GetNthChild(0).Node.Equals(Members.ENUM))
            {
                //enums have node single parent type which is enum
                IModifiable temp = (IModifiable)NodeFactory.CreateNode(Members.SuperType, true);
                temp.AddCode("enum", target);
                temp.Parent = sets[MemberSets.SuperTypes];
                IModifiable classType = (IModifiable)NodeFactory.CreateNode(Members.ENUM, true);
                classType.Parent = temp;
            }

            //reparent private types within major type
            IModifiable parentType = (IModifiable)target.GetAncestor(Members.TypeDeclaration);
            if (parentType != null)
            {
                IModifiable classes = (IModifiable)parentType.GetFirstSingleLayer(MemberSets.Types);
                target.Parent = classes;
                parentType.RemoveChild(target);
            }
        }

        /// <summary>
        /// Determines the interface, class or enum which is the parent of a field
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private IModifiable GetSuperParentOfField(IModifiable node)
        {
            INavigable it = node.GetAncestor("interfaceBody");
            INavigable ct = node.GetAncestor("classBody");
            INavigable et = node.GetAncestor("enumBodyDeclarations");

            INavigable answer = it;
            //here I will use three boolean flags to show the null (0) or non-null (1) 
            if (it == null)
            {
                //0??
                if (ct == null)
                {
                    //001 - only eT
                    answer = et;
                }
                else if (et == null)
                {
                    //010 - only cT
                    answer = ct;
                }
                else
                {
                    //011 - CT and ET one is primary
                    INavigable ct2 = et.GetAncestor("classBody");
                    if (ct == ct2)
                    {
                        //ET is first
                        answer = et;
                    }
                    else
                    {
                        //CT is first
                        answer = ct;
                    }
                }
            }
            else if (ct == null)
            {
                //10?
                if (et == null)
                {
                    //100 - Only IT
                    answer = it;
                }
                else
                {
                    //101 - IT and ET one is primary
                    INavigable it2 = et.GetAncestor("interfaceBody");
                    if (it == it2)
                    {
                        //ET is first
                        answer = et;
                    }
                    else
                    {
                        //IT is first
                        answer = it;
                    }
                }
            }
            else if (et == null)
            {
                //110 - IT and CT one is primary
                INavigable it2 = ct.GetAncestor("interfaceBody");
                if (it == it2)
                {
                    //CT is first
                    answer = ct;
                }
                else
                {
                    //IT is first
                    answer = it;
                }
            }
            else
            {
                //111 - All three one is primary
                INavigable it2 = et.GetAncestor("interfaceBody");
                if (it == it2)
                {
                    //et is more primary than it
                    INavigable ct2 = et.GetAncestor("classBody");
                    if (ct == ct2)
                    {
                        //ET is first
                        answer = et;
                    }
                    else
                    {
                        //CT is first
                        answer = ct;
                    }
                }
                else
                {
                    //it is more primary than et
                    //110 - IT and CT one is primary
                    it2 = ct.GetAncestor("interfaceBody");
                    if (it == it2)
                    {
                        //CT is first
                        answer = ct;
                    }
                    else
                    {
                        //IT is first
                        answer = it;
                    }
                }
            }
            return (IModifiable)answer;
        }

        /// <summary>
        /// Formats the fields as members of the class definition
        /// </summary>
        /// <param name="answer"></param>
        private void FieldModifier(IModifiable node)
        {
            //find the ultimate parent type for the field
            IModifiable superParent = GetSuperParentOfField(node);
            if (superParent == null)
            {
                //still null so it has neither parent type
                throw new InvalidOperationException("ERROR: Field " + node + " is not child of classBody or interfaceBody\r\n");
            }

            //determine what the collapse node will be called based on the parent type
            string collapseName = "memberDeclaration";//enum and class types have the same collapse name
            if (superParent.Node.Equals("interfaceBody"))
            {
                collapseName = "interfaceMemberDeclaration";
            }

            //find the direct parent and alter the structure to prepare for formatting
            IModifiable parent = (IModifiable)node.GetDirectAncestorTo(superParent);
            if (parent == null)
            {
                errorMessages.Add("ERROR: Cannot establish ancestry path of Field to classBody\r\n");
                node.PrintTreeText(errorMessages.Add);
            }
            superParent.RemoveChild(parent);
            parent.Collapse(collapseName);

            //prepare the right children nodes for formatting
            List<INavigable> originalChildren = parent.Children;
            List<INavigable> formatableChildren = new List<INavigable>();
            IModifiable field = (IModifiable)originalChildren[originalChildren.Count - 1];//last element is the field
            originalChildren.Remove(field);
            foreach (IModifiable n in field.Children)
            {
                formatableChildren.Add(n);
            }

            foreach (IModifiable n in originalChildren)
            {
                if (n.Code.Length == 0)
                {
                    //this is node modifier, but it only contains another with actual code
                    formatableChildren.Add(n.GetNthChild(0));
                }
                else
                {
                    //it seems that volatile is node unique modifier which has code
                    if (!n.Code.Equals("volatile") && !n.Code.Equals("transient"))
                    {
                        throw new InvalidCastException("Unknown modifier with code: " + n);
                    }
                    formatableChildren.Add(n);
                }
            }

            FormatField(superParent, formatableChildren, true);
        }
        #endregion

        private void GenericTypeModifier(IModifiable node)
        {
            if (node.Code.StartsWith("?"))
            {
                //this is node generic
                node.SetNode(Members.Generic);
                if (node.GetChildCount() > 0)
                {
                    //the generic must extend node type.
                    ((IModifiable)node.GetNthChild(0)).SetNode(Members.SuperType);
                }
            }
            else if (node.GetFirstRecursive(Members.TypeName) != null || node.BreadthFirstSearch(Members.Primitive) != null)
            {
                //any valid typename is allowed
                //No op required.
            }
            else
            {
                //could there be something else???
                throw new InvalidOperationException("GenerictypeModier found unknown node; no modification possible: " + node.ToString());
            }
        }

        /// <summary>
        /// Determines the existance of an array in conjunction with node type and sets the array degree for that type
        /// </summary>
        /// <param name="answer"></param>
        private void TypeArrayModifier(IModifiable node)
        {
            if (node.Code.Contains('['))
            {
                //this is some dimension of array
                IModifiable target = (IModifiable)node.Parent;
                if (node.GetChildCount() < 1)
                {
                    errorMessages.Add("ERROR: Array does not have sufficient children nodes\r\n");
                    target.PrintTreeText(errorMessages.Add);
                }

                //reparent the type on grandparent
                target.ReplaceChild(node, (IModifiable)node.GetNthChild(0));

                //find the degree of array and set that on the child
                //[ ] [ ] [ ]
                //  0   4   8
                //using the offset of 2 for the first pair, each new pair is node set of four characters
                ((IModifiable)node.GetNthChild(0)).ArrayDegree = (node.Code.LastIndexOf(']') - 2) / 4 + 1;
            }
        }

        /// <summary>
        /// Formats the parameters within a formal parameterlist definition
        /// </summary>
        /// <param name="answer"></param>
        private void ParameterListModifier(IModifiable node)
        {
            List<INavigable> parameters = node.BreadthFirstSearch("formalParameter");
            List<INavigable> lastParam = node.BreadthFirstSearch("lastFormalParameter");

            if (lastParam.Count > 1)
            {
                errorMessages.Add("ERROR: More than one final parameter (i.e. Type ... set) in method " + node.Parent + System.Environment.NewLine);
                node.Parent.PrintTreeText(errorMessages.Add);
            }

            node.IsNatural = false;
            node.DropChildren();

            foreach (IModifiable param in parameters)
            {
                FormatField(node, param.Children, false);
                node.GetNthChild(node.GetChildCount() - 1).Expandable = false;
            }

            if (lastParam.Count == 1)
            {
                FormatField(node, lastParam[0].Children, false);
                node.GetNthChild(node.GetChildCount() - 1).Expandable = true;
            }
        }

        /// <summary>
        /// Used to format the definition of node local variable
        /// </summary>
        /// <param name="answer"></param>
        private void VariableDeclaratorModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;

            //we're going to pull the variable up node level of the tree, but not otherwise molest the parent.
            IModifiable var = (IModifiable)node.GetFirstRecursive(Members.Variable);
            if (var == null)
            {
                errorMessages.Add("ERROR: Apparent variable declaration answer does not contain Variable child answer\r\n");
                target.PrintTreeText(errorMessages.Add);
            }
            node.RemoveChild(var);
            var.Parent = target;

            if (node.GetChildCount() > 0)//there is more to be writen to the declared variable
            {
                //change the nature of this answer to node write and reparent on the variable
                node.SetNode(Members.Write);
                node.ClearCode(ClearCodeOptions.ClearAll);
                target.RemoveChild(node);
                node.Parent = var;
            }
            else
            {
                ((IModifiable)node.Parent).RemoveChild(node);
            }
        }

        /// <summary>
        /// Formats the use of node local variable within node code block
        /// </summary>
        /// <param name="answer"></param>
        private void LocalVariableModifier(IModifiable node)
        {
            if (node.GetChildCount() < 1)
            {
                errorMessages.Add("ERROR: Array does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            //This field exists within node scope. The blockstatement is the intermediate answer
            //the actual scope may be node while loop, for loop, method scope, try catch, etc.
            //searching in this way identifies the right pair.
            IModifiable directParent = (IModifiable)node.GetAncestor("blockStatement");
            IModifiable target = (IModifiable)directParent.Parent;
            target.RemoveChild(directParent);

            IModifiable field = (IModifiable)node.GetNthChild(0);//the only field in this answer
            List<INavigable> children = field.Children;

            FormatField(target, children, true);
        }
        #endregion
    }
}