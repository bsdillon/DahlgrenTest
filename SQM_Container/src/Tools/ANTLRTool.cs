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
using Microsoft.Extensions.Logging;

namespace SoftwareAnalyzer2.Tools
{
    /// <summary>
    /// ANTLRTool is the only implementation of ITool to date. It's purpose is to use ANTLR libraries
    /// to parse code into abstract syntax tree and token representations. In ANTLR the AST gives
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
    abstract class ANTLRTool : ITool
    {
        #region Abstract class-iness
        public ANTLRTool(ILanguage lang, ILogger log)
        {
            myLang = lang;
            logger = log;
        }

        protected Regex stringType, boolType, intType, longType, floatType, doubleType, charType, classType;

        /// <summary>
        /// In the parent class, the input file name is the output filename
        /// May be overridden in a language that requires preprocessing so as
        /// to create a different file that has been completely processed.
        /// </summary>
        protected virtual string preprocessFile(string fileName, int timeToWait)
        {
            return fileName;
        }

        protected abstract INavigable findFirstType(IModifiable head);
        public abstract ITool Clone();
        protected abstract void ModifyTree();
        #endregion

        #region ITool Implementation
        protected List<string> errorMessages = new List<string>();

        //see implementation in ITool
        public List<string> Errors
        {
            get
            {
                return errorMessages;
            }
        }

        protected IModifiable head;
        protected ILanguage   myLang;

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
        public string outputFilepath { get; set; }

        protected ILogger logger;

        /// <summary>
        /// See implementation in ITool
        /// </summary>
        /// <param name="filename">File to be analyzed</param>
        /// <param name="lang">Language it is in</param>
        public void Analyze(string fileName, ILanguage lang)
        {
            if(!myLang.LanguageName.Equals(lang.LanguageName))
            {
                errorMessages.Add($"Cannot parse {lang.LanguageName} file {fileName} with {myLang.LanguageName}");
                return;
            }
            logger.LogDebug($"Analyzing {fileName} in language {myLang.LanguageName}");
            //creates two ANTLR output files by using these two commands and then combines them to create an IModifiable.
            //The IModifiable is then modified to the preferred form and the process terminates

            //this process is prone to errors and although even a partial tree is instructive, all errors must be 
            //captured and brought to the user's attention as they are fatal to the process.
            try
            {
                string processName = lang.ProcessName;
                string instruction = lang.ANTLRInstruction;
                
                // timeout after 2 seconds
                int timeToWait = 2000;

                string fileToBeAnalyzed = preprocessFile(fileName, timeToWait);

                //run -tree fileName
                Process p = new Process();
                startProcess(p, processName, "org.antlr.v4.gui.TestRig "+instruction+" -tree "+fileToBeAnalyzed, timeToWait);
                
                //run -tokens fileName
                Process p2 = new Process();
                startProcess(p2, processName, "org.antlr.v4.gui.TestRig "+instruction+" -tokens "+fileToBeAnalyzed, timeToWait);

                //save the output from each process
                string[] tokens = p2.StandardOutput.ReadToEnd().Split(System.Environment.NewLine.ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                // ----------- THESE ARE SOME BUG FIXES ----------- //
                // We remove all tokens with "<WS>" (whitespace), "<COMMENT>", or "<Directive>"
                tokens = tokens.Where(
                    t => !(
                        t.Contains("<WS>") ||
                        t.Contains("<COMMENT>") ||
                        t.Contains("<Directive>")
                    )
                ).ToArray();
                
                // restore original second macro parameter type T keyword
                for (int i = 0; i < tokens.Length; i++) {
                    tokens[i] = Regex.Replace(tokens[i], @"VARIADIC_", "");
                }

                string[] tree = p.StandardOutput.ReadToEnd().Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i< tree.Length; i++) {
                    tree[i] = Regex.Replace(tree[i], @"VARIADIC_", "");
                }
                // ----------- THESE ARE SOME BUG FIXES ----------- //

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
                    errorMessages.Add($"   {fileName} - FATAL ERROR: Could not run tool");
                    return;
                }

                //combine the line and character references from the tokens with the structure
                //again gracefully fail if combination is not possible
                logger.LogDebug($"    {fileName} - Combining ANTLR results");
                if (!Combine(tree, tokens))
                {
                    errorMessages.Add($"   {fileName} - FATAL ERROR: Could not combine outputs");
                    return;
                }

                //based on the grammar, find the first type in the file.
                INavigable firstType = findFirstType(head);

                //we will preclude tree operations for any one of several reasons
                if (firstType == null)
                {
                    //no type defined in this file; of no interest currently
                    NoTreeCreated = true;
                    StringBuilder sb = new StringBuilder();
                    head.PrintTreeText(sb);
                    errorMessages.Add($"   {fileName} - FATAL ERROR: No declarations in file {sb.ToString()}");
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
                    logger.LogDebug($"    {fileName} - Modifying AST");
                    ModifyTree();

                    //Check for errors in the post-modification tree
                    logger.LogDebug($"    {fileName} - Searching for errors");
                    head.ErrorScan(errorMessages);
                }
            }
            catch (Exception e)
            {
                //error causes node crash; capture the error and finish
                errorMessages.Add("FATAL ERROR: File Analysis incomplete:" + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Takes created process, filepath/filename of executable, arguments, 
        /// starts it, and waits for it to finish by specified milliseconds
        /// </summary>
        /// <param name="p">Process to be populated</param>
        /// <param name="filename">Where the executable is located</param>
        /// <param name="arguments">What arguments to give it</param>
        /// <param name="timeToWait">How long we wait until it finishes</param>
        protected void startProcess(Process p, string filename, string arguments, int timeToWait) {
            try {
                if (p != null) {
                    p.StartInfo.FileName        = filename;
                    p.StartInfo.Arguments       = arguments;
                    p.StartInfo.UseShellExecute = false;
                    p.StartInfo.RedirectStandardInput  = true;
                    p.StartInfo.RedirectStandardOutput = true;
                    p.StartInfo.RedirectStandardError  = true;
                    p.Start();
                    logger.LogDebug($"startProcess {filename} {p.StartInfo.Arguments}");
                    switch (timeToWait) {
                        // Wait indefinitely if -1 is used as timeToWait parameter
                        case -1:
                            p.WaitForExit();
                            break;
                        // Otherwise, wait for time specified
                        default:
                            p.WaitForExit(timeToWait);
                            break;
                    }
                    // Check that process has finished with a successful status, if not, throw error
                    if (p.HasExited) {
                        if (p.ExitCode != 0) {
                            throw new Exception("Preprocessing did not terminate successfully: " + System.Environment.NewLine + p.StandardError.ReadToEnd());
                        }
                    }
                }
                else {
                    throw new Exception("Process is NULL.");
                }
            }
            catch (Exception e) {
                errorMessages.Add("ERROR: PREPROCESSING FAILED: " + System.Environment.NewLine + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// This fn is responsible for passing along filename input to specified 
        /// standard input.
        /// </summary>
        /// <param name="filename">File to be fed into ANTLR</param>
        /// <param name="lang">What language it is in</param>
        /// <param name="stdin">Where we write ANTLR output to</param>
        private void writeFileToANTLR(string filename, ILanguage lang, StreamWriter stdin) {
            try {
                stdin.AutoFlush = true;            
                
                // This writes the file to ANTLR standard input.
                using (StreamReader reader = new StreamReader(filename)) {
                    string line;
                    while ((line = reader.ReadLine()) != null) {
                        stdin.WriteLine(line);
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
        #endregion

        #region Decomposition ANTLR Outputs
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
                    int      endText = 0;

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
                        endText    = tree[i].IndexOf(startC, 1);
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
                        endText    = nextC;
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
            int indexDelim  = str.IndexOf(delim, startIndex);
            int indexEscape = str.IndexOf(@"\", startIndex);

            while (indexEscape < indexDelim && indexEscape > -1 && indexDelim > -1)//need to skip any escaped characters
            {
                startIndex  = indexEscape + 2;
                indexDelim  = str.IndexOf(delim, startIndex);
                indexEscape = str.IndexOf(@"\", startIndex);
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
            //int token2 = expectedToken.LastIndexOf('\'', expectedToken.Length - 1);
            int token2 = expectedToken.LastIndexOf(",<", expectedToken.Length - 1) - 1;
            if (token2 < 0 || token2 == token1 - 1) //  token2 == 0 || token2 == token1
            {
                errorMessages.Add("ERROR: Secondary token character ' not found\r\n");
                return false;
            }

            //extracts the token as defined by those bounds
            string   candidateToken = expectedToken.Substring(token1 + 1, (token2 - token1) - 1);

            string[] parts =
            {
                expectedToken.Substring(expectedToken.IndexOf(",<") + 1, (expectedToken.IndexOf(">,")) - expectedToken.IndexOf(",<")),
                expectedToken.Substring(expectedToken.IndexOf(">,") + 2, expectedToken.LastIndexOf(":") - (expectedToken.IndexOf(">,") + 2)),
                expectedToken.Substring(expectedToken.LastIndexOf(":") + 1, (expectedToken.Length-1) - (expectedToken.LastIndexOf(":") + 1))
            };
            //Incorrect  =[@18,454:454=',',<','>,12:25])
            //string[] parts          = expectedToken.Substring(token2 + 1).Split(",:]".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
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
            int line      = int.Parse(parts[1]);
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

        #region Common Modifiers
        /// <summary>
        /// Reparents all children of this answer onto the parent of this answer
        /// Given node relationship x--y--(z1-z*) it creates the relationship x--(z1-z*)
        /// </summary>
        /// <param name="answer"></param>
        protected void ReparentChildren(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            target.RemoveChild(node);

            foreach (IModifiable child in node.Children)
            {
                child.Parent = target;
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
        protected virtual void LiteralModifier(IModifiable literal)
        {
            IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, true);
            IModifiable t    = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);

            StringBuilder sb = new StringBuilder();
            literal.Parent.PrintTreeText(sb);
            logger.LogDebug($"Literal tree:\n{sb}");

            t.Parent    = type;
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
            else if (classType.IsMatch(literal.Code))
            {
                t.AddCode(ApprovedLiterals.Class.ToString(), literal);
            }
            else if (literal.Code.Equals("null") || literal.Code.Equals("nullptr"))
            {
                t.AddCode(myLang.HeadNode, literal);
            }
            else
            {
                //TODO get correct RegEx from grammar
                throw new NotImplementedException("Need to implement new literal type for " + literal);
            }
        }

        /// <summary>
        /// Reparents all children on the first child and reparents that on the parent of this answer
        /// Given node relationship x--y--(z1-z4) it creates the relationship x--z1--(z2-z4)
        /// </summary>
        /// <param name="answer"></param>
        protected void ReparentOnFirstChild(IModifiable node)
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

        /// <summary>
        /// Makes the matching node unnatural
        /// </summary>
        /// <param name="answer"></param>
        protected void Unnatural(IModifiable node)
        {
            node.IsNatural = false;
        }

        /// <summary>
        /// Removes all code from the identified node
        /// </summary>
        /// <param name="node"></param>
        protected void ClearCode(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.ClearAll);
        }
        #endregion
    }
}
