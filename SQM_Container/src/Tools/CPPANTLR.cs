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
    class CPPANTLR : ANTLRTool
    {
        public CPPANTLR() : base(new CPPLanguage(), CrossCutting.GetLogger(typeof(CPPANTLR)))
        {
            classType = new Regex(@"^.+\.class$");
            stringType = new Regex("^(u8|L|u|U|R)?\".*\"$");
            boolType   = new Regex(@"^(true|false)$");
            intType    = new Regex(@"^-?(\d+|(0(x|X|b)([a-f]|[A-F]|[0-9]){1,16}))(U|u|(ui|Ui)\d+)?$");
            longType   = new Regex(@"^-?(\d+|(0(x|X|b)([a-f]|[A-F]|[0-9])+))((L|l){0,2}|((U|u)(L|l){1,2}|(L|l){1,2}(U|u)))?$");
            floatType  = new Regex(@"^-?((\d+(\.(\d)*)?|\.\d+)((e|E|p|P)(-|\+)?\d*)?(F|f)|0(x|X)(([a-f]|[A-F]|[0-9])|(\d+(\.(\d)*)?|\.\d+))+p-?[0-9]+)$");
            doubleType = new Regex(@"^-?(\d+(\.\d*)?|\d*\.\d*|(0(x|X)([a-f]|[A-F]|[0-9])*\.([a-f]|[A-F]|[0-9])*))((e|E|p|P)(-|\+)?\d*)?(D|d|L|l)?$");
            charType   = new Regex(@"^(u8|L|u|U)?'(((\\)?.+)|(\\u([node-f]|[a-f]|[A-F]|[0-9]){4,8}){1,2}|(\\[0-7]{3}))'$");
        }

        //see implementation in ITool
        public override ITool Clone()
        {
            return new CPPANTLR();
        }

        protected override void ModifyTree()
        {
            head.Rename("className", Members.TypeName);
            head.Rename("functionDefinition", Members.Method);
            head.Rename("translationUnit", Members.File);
            head.Rename("enumHead", Members.TypeDeclaration);
            head.Rename("enumerator", Members.Value);
            head.Rename("parametersAndQualifiers", Members.ParameterList);
            head.Rename("parameterDeclaration", Members.Parameter);
            head.Rename("condition", Members.Boolean);
            head.Rename("braceOrEqualInitializer", Members.Write);
            head.Rename("templateName", Members.TypeName);
            head.Rename("templateArgumentList", Members.Sub_Type);
            head.Rename("enumeratorList", MemberSets.Values);
            head.Rename("exceptionDeclaration", Members.Field);
            head.Rename("unqualifiedId", Members.Variable);
            head.Rename("qualifiedId", Members.Variable);
            head.Rename("throwExpression", Members.Exception);
            head.Rename("forInitStatement", Members.ForInitial);
            head.Rename("labeledStatement", Members.Label);
            head.Rename("originalNamespaceName", Members.Import);
            head.Collapse("namespaceName");
            head.Collapse("usingDirective", "using namespace ;");
            head.Rename("noeExceptSpecification", Members.Noexcept);

            // clear out pointer stuff early since SQM doesn't care for it
            head.Collapse("pointerOperator", "*");
            head.Collapse("pointerOperator", "&");
            head.Collapse("pointerOperator", "&&");
            head.Collapse("unaryOperator", "&");
            head.Collapse("unaryOperator", "*");

            //TODO: handle decltype specifier stuff better when our understanding of them has improved
            head.RootUpModify("decltypeSpecifier", "decltypeSpecifier", DecltypeHandler);
            head.RootUpModify("linkageSpecification", "linkageSpecification", SeverBranch);
            head.RootUpModify("functionBody", "functionBody", FunctionDeleteDeleter);
            head.RootUpModify(Members.File, Members.File, FileDefaultNamespaceAdder);
            head.RootUpModify("namespaceDefinition", Members.TypeDeclaration, NamespaceHandler);
            head.RootUpModify("templateDeclaration", "templateDeclaration", TemplateDefinitionHandler);
            head.RootUpModify("declSpecifier", "declSpecifier", TypedefHandler);
            head.RootUpModify("classSpecifier", Members.TypeDeclaration, ClassSpecifierHandler);
            head.RootUpModify("logicalOrExpression", "logicalOrExpression", ExpressionHandler);
            head.RootUpModify("pointerDeclarator", "pointerDeclarator", ExpressionHandler);
            head.Rename("castExpression", Members.Cast);
            head.RootUpModify("parameterDeclarationList", "parameterDeclarationList", ReparentChildren);
            head.RootUpModify("parameterDeclarationClause", "parameterDeclarationClause", ReparentChildren);
            head.RootUpModify("simpleTemplateId", "simpleTemplateId", TemplateUsageHandler);
            head.RootUpModify("nestedNameSpecifier", "nestedNameSpecifier", NestedNameHandler);
            head.RootUpModify("noPointerDeclarator", "noPointerDeclarator", EarlyNoPointerDeclaratorHandler);
            head.RootUpModify("selectionStatement", "selectionStatement", SelectionStatementIdentifier);
            head.RootUpModify("statementSeq", Members.Scope, ScopeDescriber);
            head.RootUpModify(Members.Else, Members.Else, ElseIfScopeAdder);
            head.LeafDownModify(Members.Switch, Members.Switch, SwitchSetup);
            head.RootUpModify("conditionalExpression", "conditionalExpression", ConditionalExpressionHandler);
            head.RootUpModify("iterationStatement", "iterationStatement", IterationStatementHandler);
            head.RootUpModify("jumpStatement", "jumpStatement", JumpStatementHandler);
            head.RootUpModify("assignmentExpression", "assignmentExpression", AssignmentExpressionHandler);
            head.RootUpModify("initializerList", Members.ParameterList, InitializerListChecker);
            head.RootUpModify("postfixExpression", "postfixExpression", PostFixHandler);
            head.RootUpModify("unaryExpression", "unaryExpression", UnaryExpressionHandler);
            head.RootUpModify("equalityExpression", "equalityExpression", EqualityExpressionHandler);
            head.RootUpModify("relationalExpression", "relationalExpression", RelationalExpressionHandler);
            head.RootUpModify("simpleTypeSpecifier", "simpleTypeSpecifier", SimpleTypeHandler);

            head.LeafDownModify("memberDeclaratorList", "memberDeclaratorList", MultipleMemberDeclarationsHandler);
            head.RootUpModify("initDeclaratorList", "initDeclaratorList", MultipleInitDeclarationsHandler);
            head.RootUpModify("memberSpecification", "memberSpecification", MemberSpecificationHandler);
            head.RootUpModify("classKey", "classKey", ClassKeyHandler);
            head.RootUpModify("declarator", "declarator", DeclaratorHandler);
            head.RootUpModify(Members.Method, Members.Method, MethodNameCorrector);
            head.RootUpModify(Members.MethodInvoke, Members.MethodInvoke, ScopeResolutionHandler);
            head.LeafDownModify("indexNode", "indexNode", IndexOrderer);

            head.RootUpModify("primaryExpression", "primaryExpression", PrimaryExpressionHandler);
            head.RootUpModify("dotOperatorNode", "dotOperatorNode", DotOperatorOrderer);
            head.RootUpModify("enumSpecifier", "enumSpecifier", EnumSpecifierHandler);
            head.RootUpModify("declSpecifierSeq", "declSpecifierSeq", DeclSpecifierHandler); 
            head.RootUpModify("storageClassSpecifier", "storageClassSpecifier", ModifierModifier);
            
            head.RootUpModify(Members.Parameter, Members.Parameter, ParameterHandler);
            head.RootUpModify(Members.Write, Members.Write, WriteNodeOrderer);
            head.RootUpModify("memberdeclaration", "memberdeclaration", MemberModifierSetAdjuster);
            head.RootUpModify("simpleDeclaration", "simpleDeclaration", FieldIdentifier); 
            head.RootUpModify("forRangeDeclaration", "forRangeDeclaration", FieldIdentifier);
            head.RootUpModify("shiftExpression", Members.Operator, ShiftExpressionCompressor); // Handles <<
            head.RootUpModify("memberdeclaration", "memberdeclaration", MemberFieldIdentifier);
            head.RootUpModify("initializer", "initializer", ConstructorIdentifier);
            head.RootUpModify("constructorInitializer", Members.MethodScope, ConstructorInitializerHandler);
            head.RootUpModify("newExpression", "newExpression", NewExpressionHandler);  //Messes up arrays
            head.RootUpModify("tryBlock", Members.Try_Catch, TryCatchHandler);
            head.RootUpModify("handlerSeq", "handlerSeq",ReparentChildren);
            head.RootUpModify("enumeratorDefinition", "enumeratorDefinition", EnumeratorDefinitionHandler);
            head.RootUpModify("deleteExpression", Members.MethodInvoke, DeleteHandler);
            head.RootUpModify(Members.TypeName, Members.TypeName, TypeNameParameterCheck);
            head.RootUpModify("virtualSpecifier", "virtualSpecifierSeq", ModifierSender);
            head.RootUpModify("virtualSpecifierSeq", "virtualSpecifierSeq", ModifierModifier);
            head.RootUpModify("functionSpecifier", "functionSpecifier", ModifierSender);
            head.RootUpModify("functionSpecifier", "functionSpecifier", ModifierModifier);
            head.RootUpModify(Members.Public, Members.Public, ModifierSender);
            head.RootUpModify(Members.Private, Members.Private, ModifierSender);
            head.RootUpModify(Members.Protected, Members.Protected, ModifierSender);
            head.RootUpModify(Members.Static, Members.Static, ModifierSender);
            head.RootUpModify(Members.Noexcept, Members.Noexcept, ModifierSender);
            head.RootUpModify(Members.Sub_Type, Members.Sub_Type, Sub_TypeModifier);
            head.Collapse("virtualSpecifierSeq");
            head.Collapse("memberdeclaration");
            head.Collapse("memberdeclaration", ";");
            head.Collapse("statement");
            head.Collapse("declarationStatement");
            // Try removing declarations from here
            head.RootUpModify("blockDeclaration", "blockDeclaration", ForwardDeclarationRemover);
            head.Collapse("blockDeclaration");
            head.Collapse("declaration");

            head.RootUpModify(Members.Field, Members.Field, FieldRelevantNodeIncluder);
            head.RootUpModify("memberSpecification", "memberSpecification", ReparentChildren);

            //head.RootUpModify("simpleDeclaration", "simpleDeclaration", ReparentChildren);
            head.Collapse("simpleDeclaration");
            head.Collapse("simpleDeclaration", ";");

            head.RootUpModify("declarationseq", "declarationseq", ReparentChildren);
            head.RootUpModify(Members.TypeDeclaration, Members.TypeDeclaration, TypeDeclarationMemberSetAdder); //Important for typedef

            head.RootUpModify(Members.Destructor, Members.Destructor, DestructorMover);
            head.RootUpModify(Members.Import, Members.Import, ImportMover);
            head.Collapse("typeSpecifier");
            head.Collapse("trailingTypeSpecifier");
            head.Collapse("declarator");
            head.RootUpModify("cvQualifier", "cvQualifier", ModifierSender);
            head.RootUpModify("declSpecifier", "declSpecifier", ModifierSender);

            head.LeafDownModify("noPointerDeclarator", "noPointerDeclarator", LateNoPointerDeclaratorHandler);
            head.Rename("multiplicativeExpression", Members.Operator);
            head.Rename("additiveExpression", Members.Operator);
            head.Rename("logicalAndExpression", Members.Boolean_And);
            head.Rename("logicalOrExpression", Members.Boolean_Or);
            head.Rename("inclusiveOrExpression", Members.Operator);
            head.Rename("exclusiveOrExpression", Members.Operator);
            head.Rename("andExpression", Members.Operator);
            head.LeafDownModify(Members.Operator, Members.Operator, OperatorOrderer);

            head.RootUpModify("literal", Members.Literal, LiteralModifier);
            head.RootUpModify("cvQualifier", "cvQualifier", ModifierModifier);
            head.RootUpModify("declSpecifier", "declSpecifier", ModifierModifier);

            head.Collapse("enumeratorDefinition");

            head.Collapse("abstractDeclarator");
            head.Collapse("pointerAbstractDeclarator");
            head.Collapse("theTypeId");
            head.Collapse("typeSpecifierSeq");
            head.Collapse("virtualSpecifierSeq");
            head.Collapse("initializerClause");
            head.Collapse("templateArgument");
            head.Collapse("declSpecifier");
            head.Collapse("simpleTypeSpecifier");
            head.Collapse("theTypeName");
            head.Collapse("compoundStatement");
            head.Collapse("compoundStatement", "{ }");
            // TODO: move this?
            head.RootUpModify("functionBody", "functionBody", MultipleMethodScopeCombiner);
            head.Collapse("functionBody");
            // TODO: apparently there exist expression nodes with commas????
            head.Collapse("expression");
            head.Collapse("expressionStatement", ";");
            head.Collapse("bracedInitList", "{ }");
            head.Collapse("postfixExpression");
            //head.Collapse("postfixExpression", "( )");
            //head.Collapse("primaryExpression", "( )");
            head.Collapse("assignmentExpression");
            head.Collapse("initializer");
            head.Collapse("initializer", "( )");
            head.Collapse("newInitializer", "( )");
            head.Collapse("initDeclarator");
            head.RootUpModify("initDeclaratorList", "initDeclaratorList", ReparentChildren);
            head.Collapse("memberDeclarator");
            head.Collapse("memberDeclaratorList");
            head.Collapse("constantExpression");
            head.Collapse("expressionList");
            head.Collapse("handler", "catch ( )");

            head.RootUpModify(Members.Boolean, Members.Boolean, BooleanCorrector);
            // TODO: move all these up above the collapses
            head.RootUpModify(Members.Field, Members.Field, ConstructorInvokeCheck);
            head.RootUpModify(Members.MethodInvoke, Members.MethodInvoke, DestructorCorrector);
            head.RootUpModify(Members.Method, Members.Method, DestructorCorrector);
            head.RootUpModify(Members.TypeDeclaration, Members.TypeDeclaration, TypeDeclarationMover);
            // TODO:? probably should merge this with some other code and remove this
            head.RootUpModify(Members.Field, Members.Field, FieldNamer);
            head.RootUpModify(Members.Parameter, Members.Parameter, ParameterNamer);
            //Need to turn :: into dotOperators
            head.RootUpModify(Members.MethodInvoke, Members.MethodInvoke, ScopeResolutionOperator);
            head.RootUpModify(Members.Variable, Members.Variable, ScopeResolutionOperator);
            head.RootUpModify(Members.Method, Members.Method, ScopeResolutionOperator);
            head.RootUpModify(Members.TypeName, Members.TypeName, ScopeResolutionOperator);
            //Renames function operators
            head.RootUpModify("operatorFunctionId", "operatorFunctionId", FunctionOperatorCorrector);
            //Reworks Boolean structure
            head.NormalizeLines();
        }

        /// <summary>
        /// Preprocesses C++ source file.
        /// </summary>
        /// <param name="filename">File to be preprocessed</param>
        /// <param name="timeToWait">Milliseconds to wait for preproessing to finish</param>
        /// <returns>Filename and path to preprocessed file</returns>
        protected override string preprocessFile(string filename, int timeToWait) {
            // Preprocesses twice. First round is to extract all macro definitions
            // and second round is to use those macro definitions to preprocess
            // the original file before ANTLR process without output from #include directives.
            
            // Creating temporary filenames for macro, preprocessed, and (if header) cleaned output
            string[] prefixAndSuffix = filename.Split('.');
            string   name            = prefixAndSuffix[0];
            string   extension       = prefixAndSuffix[1];
            string   macros          = filename+"-macros";
            string   preprocessed    = outputFilepath+"-preprocessed."+extension;
            string   cleaned         = name+"-cleaned."+extension;

            // Checks if the source file is a header file
            Boolean isHeaderFile = filename.EndsWith(".h") || filename.EndsWith(".hpp") ||
                                   filename.EndsWith(".hh");

            // If header file, cleans it of associated #if statements so we see all code even with preprocessing
            File.Copy(filename, cleaned, true);
            if (isHeaderFile) cleanUpSourceFile(cleaned, true);

            // Execute C++ preprocessing depending on platform
            OperatingSystem    os  = Environment.OSVersion;
            PlatformID        pid  = os.Platform;
            Process       iMacros  = new Process();
            Process         clang  = new Process();
            string       filepath  = "";
            string macroArguments  = "\""+filename+"\" -dM -E -o \""+macros+"\"";
            string clangArguments  = "\""+cleaned+"\" -P -dI -E -imacros \""+macros+"\" -o \""+preprocessed+"\"";
            switch (pid) {
                case PlatformID.Win32NT:
                case PlatformID.Win32S:
                case PlatformID.Win32Windows:
                case PlatformID.WinCE:
                    filepath = "C:/Program Files/LLVM/bin/clang++";
                    break;
                case PlatformID.Unix:
                case PlatformID.MacOSX:
                case (PlatformID) 128:
                    filepath = "/bin/clang++";
                    break;
                default:
                    // If issue in matching OS, kills unused process
                    iMacros.Kill();
                    clang.Kill();
                    break;
            }
            
            // Executes clang++ FILENAME -dM -E -o FILENAME-macros to extract found macros
            startProcess(iMacros, filepath, macroArguments, timeToWait);
            
            // Executes clang++ FILENAME -P -dI -E -imacros FILENAME-macros -o FILENAME-preprocessed to 
            // use extracted macros and translate them without extra line or include directive output
            startProcess(clang, filepath, clangArguments, timeToWait);

            // Translate tricky ANTLR spots and clean up empty lines if preprocessing was successful
            if (System.IO.File.Exists(preprocessed)) cleanUpSourceFile(preprocessed, false);

            // Deletes the temporary macro and cleaned files if they were created
            if (System.IO.File.Exists(macros)) {
                File.SetAttributes(macros, FileAttributes.Normal);
                System.IO.File.Delete(macros);
            }
            if (System.IO.File.Exists(cleaned)) {
                File.SetAttributes(cleaned, FileAttributes.Normal);
                System.IO.File.Delete(cleaned);
            } 

            // If preprocessing failed, we will still attempt to process the original file
            if (!System.IO.File.Exists(preprocessed)) preprocessed = filename;

            return preprocessed;
        }

        protected override INavigable findFirstType(IModifiable head)
        {
            return head.GetFirstRecursive("declaration");
        }

        /// <summary>
        /// Cleans up provided source file before/after preprocessing to be without
        /// empty lines or with #ifndef directives for .h or .hpp files. Translates
        /// all tricky keywords ahead of time before ANTLR sees them. Then output is
        /// seen in Parse folder with all translations and preprocessing.
        /// </summary>
        /// <param name="filename">File to be cleaned up</param>
        /// <param name="isHeaderFile">Specifies file needs to be treated like a header file</param>
        /// <returns>Filename and path to cleaned file</returns>
        private void cleanUpSourceFile(string filename, Boolean isHeaderFile) {
            string tempFile = Path.GetTempFileName();
            string line;
            
            using (StreamReader reader = new StreamReader(filename)) 
            using (StreamWriter writer = new StreamWriter(tempFile))
            {
                while ((line = reader.ReadLine()) != null) {
                    if (line == string.Empty || line.StartsWith("//")) continue;
                    writer.WriteLine(line);
                }
            } 

            File.Copy(tempFile, filename, true);

            if (isHeaderFile) {
                Boolean hasIfNDef = false;
                using (StreamReader reader = new StreamReader(filename)) 
                using (StreamWriter writer = new StreamWriter(tempFile))
                {
                    string nextLine;
                    line = reader.ReadLine();
                    if (line != null && line.StartsWith("#ifndef")) hasIfNDef = true;
                    else writer.WriteLine(line);
                    
                    line = reader.ReadLine();
                    while (line != null) {
                        nextLine = reader.ReadLine();
                        if (line.StartsWith("#endif") && nextLine == null && hasIfNDef) break;
                        // removes the nodiscard C++17 keyword in the case of operator overloading for us to analyze it
                        else if (line.Contains("operator")) {
                            line = Regex.Replace(line, @"[^\s]*(?i)nodiscard[^\s]*", "");
                        }
                        // removes the nodiscard C++17 keyword in the case of template definitions for us to analyze it
                        else if (line.Contains("template")) {
                            line     = Regex.Replace(line,     @"[^\s]*(?i)nodiscard[^\s]*", "");
                            nextLine = Regex.Replace(nextLine, @"[^\s]*(?i)nodiscard[^\s]*", "");
                        }
                        // otherwise, if there is a pulbicly defined method, we make sure the next statement ends with a semicolon
                        else if (line.Contains("public")) {
                            nextLine = Regex.Replace(nextLine, @"[^\s]+\(.+\)$", "$0;");
                        }
                        writer.WriteLine(line);
                        line = nextLine;
                    }   
                }
            }
            else 
            {
                using (StreamReader reader = new StreamReader(filename)) 
                using (StreamWriter writer = new StreamWriter(tempFile))
                {
                    while ((line = reader.ReadLine()) != null) {
                        string translated_line = line;
                        // Transform "*(T*)x" into "*((T*)x)", which is accepted by the grammar
                        // as long as there is a left-hand token (=, <<, etc.) to accept the value.
                        Match m = Regex.Match(translated_line, @"\*(\s*\()");
                        if (m.Success) {
                            // Ensures that this does not catch operator overloading with similar syntax
                            Match m2 = Regex.Match(translated_line, @"operator\*(\s*\()");
                            if (!m2.Success) {
                                translated_line = Regex.Replace(line, @"\*(\s*\()", "$1");
                            }
                        }

                        // Transform operator /= to / which is accepted by ANTLR
                        translated_line = Regex.Replace(translated_line, @"(operator\s*)(\/)(=\s*)", "$1$2");
                        
                        // Transform variadic macro "va_arg" to add variadic identifier to second macro parameter type T keyword
                        translated_line = Regex.Replace(translated_line, @"((?i)va_arg)(\()([a-zA-Z0-9_]*)(,*)([\s]*)([^\)]*)(\){1})", "$1$2$3$4$5VARIADIC_$6$7");

                        // Transform all primitive T[*][*] into T* because ANTLR
                        // does not appear to understand array type widths like "int[][3]"
                        // and they compile to "T*" anyway. This syntax is only valid as a 
                        // parameter and not assignment, therefore, three parameter cases 
                        // are handled below.
                        string justTypeReplacement    = @"$1$2*$5";
                        string typeAndNameReplacement = @"$1*$2$3$6";
                        translated_line = Regex.Replace(translated_line, @"(\(\s*){1}([a-zA-Z0-9]+)(\s+[a-zA-Z0-9]+)(\s*\[\]\s*){1}(\[[0-9]+\])+(\s*,){1}", "$1$2*$3$6");
                        translated_line = Regex.Replace(translated_line, @"(\(\s*){1}([a-zA-Z0-9]+)(\s*\[\]\s*){1}(\[[0-9]+\])+(\s*,){1}", justTypeReplacement);
                        translated_line = Regex.Replace(translated_line, @"([a-zA-Z0-9]+)(\s+)([a-zA-Z0-9]+)(\s*\[\]\s*){1}(\[[0-9]+\])+(\s*,){1}", typeAndNameReplacement);
                        translated_line = Regex.Replace(translated_line, @"(\s?)([a-zA-Z0-9]+)\s*(\[\]\s*){1}(\[[0-9]+\])+(\s*,){1}", justTypeReplacement);
                        translated_line = Regex.Replace(translated_line, @"([a-zA-Z0-9]+)(\s+)([a-zA-Z0-9]+)\s*(\[\]\s*){1}(\[[0-9]+\])+(\s*\)){1}", typeAndNameReplacement);
                        translated_line = Regex.Replace(translated_line, @"(\s?)([a-zA-Z0-9]+)(\s*\[\]\s*){1}(\[[0-9]+\])+(\s*\)){1}", justTypeReplacement);
                    
                        // Compiler-specific keyword and operator translations
                        String[] compilerKeywords = new String[] {// Compiler function attributes:
                                                                    @"(\w*\s*)(__attribute__)(\({2})(.+)(\){2})", @"(\w*\s*)(__declspec)(\()(\w+)(\))", @"__thread",
                                                                    // Keywords and operators:
                                                                    @"__align\(\d+\)", @"((__asm_{0,2}\s*)(\(|{)(.)+(\)|}))|(^(\t|\s)*(__asm_{0,2}\s*)(\(|{)(.)+(\)|});?)", 
                                                                    @"__asm_{0,2}", @"__global_reg\(\d+\)", "__irq", "__packed", "__pure", @"__smc\(\d+\)", 
                                                                    "__softfp", @"__svc\(\d+\)", @"__svc_indirect\(\d+\)", @"__svc_indirect_r7\(\d+\)",
                                                                    "__value_in_regs", "__weak",
                                                                    // Intrinsic keywords:
                                                                    @"__breakpoint\(.+\);?", @"(__cdp)(\(|\s*)(\w|\d|\s)+,(\w|\d|\s)+,(\w|\d|\s)+(\)|\s*);?", 
                                                                    @"__clrex\(\);?", @"^(\s|\t)+__disable_fiq\(\);?",
                                                                    @"^(\s|\t)*__disable_irq\(\);?", @"__dmb\(.+\);?", @"__dsb\(.+\);?", @"__enable_fiq\(\);?", 
                                                                    @"__enable_irq\(\);?", @"__force_loads\(\);?", @"__force_stores\(\);?", @"__isb\(.+\);?",
                                                                    @"__memory_changed\(\);?", @"__nop\(\);?", @"__pld\(.+\);?", @"__pli\(.+\);?", 
                                                                    @"__schedule_barrier\(\);?", @"__sev\(\);?", 
                                                                    @"__strt\(.+\);?", @"__wfe\(\);?", @"__wfi\(\);?", @"__yield\(\);?",
                                                                    // C++ Function specifiers:
                                                                    "_{1,2}cdecl", "_Export", "_Noreturn"};
                        
                        // Compiler keywords in string array above that can just be removed
                        foreach (String keyword in compilerKeywords) {
                            translated_line = Regex.Replace(translated_line, keyword, "");
                        }

                        // Compiler keywords to be replaced with something specific cases:
                        translated_line = Regex.Replace(translated_line, @"(__(?i:ALIGNOF)_{0,2})(\((\w|\d|_|\s)+\))", "alignof$2");
                        translated_line = Regex.Replace(translated_line, @"__forceinline|__inline", "inline");
                        translated_line = Regex.Replace(translated_line, @"__int64", "long long");
                        translated_line = Regex.Replace(translated_line, @"__writeonly", "const"); 
                        translated_line = Regex.Replace(translated_line, @"(__)(fabsf?)(\()(.)+(\))", "$2($4)");
                        translated_line = Regex.Replace(translated_line, @"(__qadd\()(.+)(,\s*)(.+)(\))", "$2+$4");
                        translated_line = Regex.Replace(translated_line, @"(__qdbl\()(.+)(\))", "$2+$2");
                        translated_line = Regex.Replace(translated_line, @"(__qsub\()(.+)(,\s*)(.+)(\))", "$2-$4");
                        translated_line = Regex.Replace(translated_line, @"(__sqrtf?\()(.+)(\))", "sqrt($2)");

                        // Compiler keywords to be replaced with default integer 0
                        String[] integerCompilerWords = new String[] {@"(__INTADDR__)(\()(.)+(\))", @"__clz\(.+\)", @"__current_pc\(\)", @"__current_sp\(\)", 
                                                                        @"__disable_fiq\(\)", @"__disable_irq\(\)", @"__ldrex\(.+\)", @"__ldrexd\(.+\)",
                                                                        @"__ldrt\(.+\)", @"__rbit\(.+\)", @"__rev\(.+\)", @"__return_address\(\)", @"__ror\(.+\)", 
                                                                        @"__semihost\(.+\)", @"__ssat\(.+\)", @"__strexd?\(.+\)", @"__swp\(.+\)", @"__usat\(.+\)",
                                                                        @"__vfp_status\(.+\)"};
                        foreach (String integerCompilerWord in integerCompilerWords) {
                            translated_line = Regex.Replace(translated_line, integerCompilerWord, "0");
                        }

                        // "final" is an identifier when used in a member function declaration or class head
                        // however, other contexts it is NOT, can can be used to name objects and functions
                        // ANTLR reads this as a keyword, however, and we may need to translate it for ANTLR to
                        // distinguish between when final is being used as an identifier and a keyword
                        Match m3 = Regex.Match(translated_line, @".+final.*");
                        if (m3.Success) {
                            Match m4 = Regex.Match(translated_line, @"(virtual|class).+final.*");
                            if (!m4.Success) {
                                translated_line = Regex.Replace(translated_line, @"final", "FINAL_VAR");
                            }
                        }
                        
                        writer.WriteLine(translated_line);
                    }
                }   
            }
            File.Copy(tempFile, filename, true);
        }

         /// <summary>
        /// Recursively collapses C++ nodes containing "Expression"
        /// </summary>
        /// <param name="answer"></param>
        private void ExpressionHandler(IModifiable node)
        {
            if (node.GetChildCount() == 1)
            {
                // if node has one child and this node is trivial, delete this node, move child up the tree, and recurse 
                IModifiable temp = (IModifiable)node.GetNthChild(0);
                if (node.IsTrivial()) {
                    ((IModifiable)node.Parent).ReplaceChild(node, temp);
                }
                ExpressionHandler(temp);
            }
            else if (node.GetChildCount() > 1)
            {
                // skip this node and recurse on the children
                foreach (IModifiable child in node.Children)
                {
                    ExpressionHandler(child);
                }
            }
        }
        
        /// <summary>
        /// Reparents empty noPointerDeclarators early in the program
        /// </summary>
        /// <param name="answer"></param>
        private void EarlyNoPointerDeclaratorHandler(IModifiable node)
        {
            if (node.Code.Equals(""))
            {
                ReparentChildren(node);
            }
            else if (node.Code.Equals("( )"))
            {
                if (node.Parent.GetFirstSingleLayer(Members.ParameterList) != null)
                {
                    if (node.Parent.Parent.Parent.Parent.Node.Equals("memberdeclaration"))
                    {
                        IModifiable ancestorNode = (IModifiable)node.GetAncestor("memberdeclaration");
                        ancestorNode.ReplaceChild((IModifiable)ancestorNode.GetFirstSingleLayer("memberDeclaratorList"), (IModifiable)node.Parent.Parent);
                        ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));

                        IModifiable methodNode = (IModifiable)NodeFactory.CreateNode(Members.Method, false);
                        List<INavigable> children = ancestorNode.Children;
                        ancestorNode.DropChildren();
                        methodNode.Parent = ancestorNode;
                        foreach (IModifiable child in children)
                        {
                            child.Parent = methodNode;
                        }
                    }
                    else
                    {
                        // i don't know enough yet!
                        // throw new InvalidOperationException("Unsupported node structure\a: " + node);
                    }
                }
                else
                {
                    IModifiable willBeParamNode = (IModifiable)node.GetNthChild(0);
                    node.RemoveChild(willBeParamNode);
                    IModifiable realMethodNode;
                    IModifiable parameterListNode = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                    IModifiable parameterNode = (IModifiable)NodeFactory.CreateNode(Members.Parameter, false);
                    if (node.Parent.Node.Equals(Members.Parameter))
                    {
                        realMethodNode = (IModifiable)node.Parent.GetFirstSingleLayer(Members.TypeName);
                        if (realMethodNode != null)
                        {
                            ((IModifiable)node.Parent).RemoveChild(realMethodNode);
                            realMethodNode.SetNode(Members.MethodInvoke);
                            realMethodNode.Parent = node;
                            parameterListNode.Parent = realMethodNode;
                        }
                        else
                        {
                            // TODO: Test properly???
                            throw new InvalidOperationException("Unsupported node structure\a: " + node);
                        }
                    }
                    else
                    {
                        /*
                        IModifiable targetDeclNode = (IModifiable)node.GetAncestor("memberdeclaration");
                        if (targetDeclNode == null)
                        {
                            targetDeclNode = (IModifiable)node.GetAncestor("simpleDeclaration");
                        }
                        */
                        IModifiable targetDeclNode = (IModifiable)node.GetAncestor("simpleDeclaration");
                        IModifiable declSpecNode = (IModifiable)targetDeclNode.GetFirstSingleLayer("declSpecifierSeq");
                        realMethodNode = (IModifiable)declSpecNode.GetFirstRecursive(Members.TypeName);
                        targetDeclNode.RemoveChild(declSpecNode);
                        realMethodNode.SetNode(Members.Variable);
                        realMethodNode.Parent = node;
                        parameterListNode.Parent = node;
                    }
                    parameterNode.Parent = parameterListNode;
                    willBeParamNode.Parent = parameterNode;

                    ReparentChildren(node);
                }
            }
        }

        /// <summary>
        /// Converts Scope nodes to MethodScope or ElseScope nodes as appropriate
        /// </summary>
        /// <param name="answer"></param>
        private void ScopeDescriber(IModifiable node)
        {
            if (node.Parent.Parent == node.GetAncestor("functionBody"))
            {
                node.SetNode(Members.MethodScope);
            }
            else if (node.Parent == node.GetAncestor(Members.Else))
            {
                node.SetNode(Members.ElseScope);
            }
            else if (node.Parent.Parent == node.GetAncestor("tryBlock"))
            {
                node.SetNode(Members.TryScope);
            }
            else if (node.Parent.Parent == node.GetAncestor("handler"))
            {
                node.SetNode(Members.CatchScope);
            }
            else
            {
                node.SetNode(Members.Scope);
            }
        }

        /// <summary>
        /// Moves Method name from declarator to actual Method node
        /// Also names methods as Constructors when no declSpecifierSeq node exists
        /// Also adds in the ModifierSet node for methods
        /// </summary>
        /// <param name="answer"></param>
        private void MethodNameCorrector(IModifiable node)
        {
            IModifiable declarator = (IModifiable)node.GetFirstRecursive("declarator");
            if (declarator == null)
            {
                // since I've moved MethodNameCorrector to be below DeclaratorHandler, this change was needed
                if (node.Code.Equals(node.Parent.Parent.Parent.Code))
                {
                    node.SetNode(Members.Constructor);
                    IModifiable returnTypeNode = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
                    returnTypeNode.Parent = node;
                    IModifiable typeNameNode = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
                    typeNameNode.Parent = returnTypeNode;
                    typeNameNode.CopyCode(node);
                }
                return;
            }
            // get into the declarator node, the first entry should be something other than a parameter, find the Variable
            // if no Variable, try operatorFunctionId

            // possibly GetNthChild(0) will work instead
            IModifiable varNode = (IModifiable)declarator.GetFirstSingleLayer(Members.Variable);
            if (varNode == null)
            {
                varNode = (IModifiable)declarator.GetFirstSingleLayer("operatorFunctionId").GetNthChild(0);
            }
            
            node.CopyCode(varNode);
            if (node.Code.Equals(node.Parent.Parent.Parent.Code))
            {
                node.SetNode(Members.Constructor);
            }
            // excise the original afterwards - it no longer needs to exist
            // but, if you have a destructor, there will be a typename attached to the variable that you need to move up so the later destructor handlers can use it
            if (varNode.Code.Equals("~") && varNode.GetChildCount() > 0)
            {
                varNode.GetNthChild(0).Parent = varNode.GetAncestor(Members.Method);
            }
            ((IModifiable)varNode.Parent).RemoveChild(varNode);

            ScopeResolutionHandler(node);

            // rename to constructor if appropriate
            if (node.GetFirstSingleLayer("declSpecifierSeq") == null)
            {
                if (node.Code.Contains("~"))
                {
                    node.SetNode(Members.Destructor);
                    IModifiable returnTypeNode = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
                    returnTypeNode.Parent = node;
                    node.AddCode(node.GetFirstSingleLayer(Members.TypeName).Code, node);
                    node.RemoveChild((IModifiable)node.GetFirstSingleLayer(Members.TypeName));
                    IModifiable voidNode = (IModifiable)NodeFactory.CreateNode(Members.Primitive, false);
                    voidNode.AddCode(" void", voidNode);
                    voidNode.Parent = returnTypeNode;
                }
                else
                {
                    node.SetNode(Members.Constructor);
                    IModifiable returnTypeNode = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
                    returnTypeNode.Parent = node;
                    IModifiable typeNameNode = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
                    typeNameNode.Parent = returnTypeNode;
                    typeNameNode.CopyCode(node);
                }
            }

            // add ModifierSet node
            IModifiable modNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            modNode.Parent = node;
        }

        /// <summary>
        /// Resolves floating scope resolution operators
        /// </summary>
        /// <param name="answer"></param>
        private void ScopeResolutionHandler(IModifiable node)
        {
            if (node.Code.StartsWith("::"))
            {
                IModifiable targetParent = null;
                if (node.Node.Equals(Members.Method)) {
                    targetParent = node;
                }
                else if (node.Node.Equals(Members.MethodInvoke))
                {
                    targetParent = (IModifiable)node.GetAncestor("simpleDeclaration");
                }
                IModifiable targetNode = (IModifiable)targetParent.GetFirstSingleLayer("declSpecifierSeq");

                if (targetNode != null)
                {
                    while (targetNode.GetChildCount() > 0)
                    {
                        targetNode = (IModifiable)targetNode.GetNthChild(0);
                    }
                    targetNode.AddCode(node.Code, node);
                    node.ClearCode(ClearCodeOptions.KeepLine);
                    node.CopyCode(targetNode);
                    targetParent.RemoveChild((IModifiable)targetParent.GetFirstSingleLayer("declSpecifierSeq"));
                }
            }
        }

        /// <summary>
        /// Makes sure Destructors and MethodInvokes have their full names
        /// </summary>
        /// <param name="answer"></param>
        private void DestructorCorrector(IModifiable node)
        {
            //MethodInvokes
            if (node.Code.Equals("~"))
            {
                if (node.Node.Equals(Members.Method))
                {
                    node.SetNode(Members.Destructor);
                }
                IModifiable typeNameNode = (IModifiable)node.GetFirstSingleLayer(Members.TypeName);
                node.AddCode(typeNameNode.Code, typeNameNode);
                node.RemoveChild(typeNameNode);
            }
        }

        /// <summary>
        /// Identifies and sets selectionStatement nodes to the proper SQM node
        /// </summary>
        /// <param name="answer"></param>
        private void SelectionStatementIdentifier(IModifiable node)
        {
            // Only called once
            if (node.Code.Equals("switch ( )"))
            {
                node.SetNode(Members.Switch);
            }
            else if (node.Code.Equals("if ( )") || node.Code.Equals("if ( ) else"))
            {
                node.SetNode(Members.Branch);
                bool ThenOccured = false;
                foreach (INavigable child in node.Children)
                {
                    if (child.Node.Equals("statement"))
                    {
                        if(!ThenOccured)//Replace child with Then and scope
                        {
                            ((IModifiable)child).SetNode(Members.Then);
                            List<INavigable> children = child.Children;
                            ((IModifiable)child).DropChildren();
                            IModifiable ThenScope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                            ThenScope.Parent = child;
                            foreach(INavigable kid in children)
                            {
                                kid.Parent = ThenScope;
                            }
                            ThenOccured = true;
                        }
                        else
                        {
                            ((IModifiable)child).SetNode(Members.Else);
                            List<INavigable> children = child.Children;
                            ((IModifiable)child).DropChildren();
                            IModifiable ElseScope = (IModifiable)NodeFactory.CreateNode(Members.ElseScope, false);
                            ElseScope.Parent = child;
                            foreach(INavigable kid in children)
                            {
                                kid.Parent = ElseScope;
                            }
                        }
                    }
                }
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Switch statement cleanup
        /// </summary>
        /// <param name="answer"></param>
        private void SwitchSetup(IModifiable node)
        {
            IModifiable blocksNode = (IModifiable)node.GetFirstRecursive(Members.Label).Parent.Parent;
            if (blocksNode != node)
            {
                blocksNode.SetNode(Members.Blocks);
            }
            else
            {
                //insert a new Blocks node after condition, set this to be the parent of each node afterwards, and make this scopeNode
                List<INavigable> subBlockNodes = blocksNode.GetAllFirstLayer("statement");
                blocksNode = (IModifiable)NodeFactory.CreateNode(Members.Blocks, false);
                blocksNode.Parent = node;
                foreach (IModifiable subBlockNode in subBlockNodes)
                {
                    subBlockNode.Parent = blocksNode;
                    node.RemoveChild(subBlockNode);
                }
            }
            foreach (IModifiable child in blocksNode.Children)
            {
                if (child.GetNthChild(0).Code == "case :" || child.GetNthChild(0).Code == "default :")
                {
                    //identify Block nodes, and set non-literal cases to Variable, which occurs for enumerated Values, etc.
                    child.SetNode(Members.Block);
                    IModifiable childRecursion = (IModifiable)child.GetFirstRecursive("constantExpression");
                    if (childRecursion != null && childRecursion.GetFirstRecursive(Members.Variable) != null) {
                        ((IModifiable)childRecursion.GetFirstRecursive(Members.Variable)).SetNode(Members.Variable);
                    }

                    //insert a Scope node and then move the statement into that
                    IModifiable statementHolderScopeNode = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                    statementHolderScopeNode.Parent = child;
                    IModifiable statementNode = (IModifiable)child.GetFirstRecursive("statement");
                    ((IModifiable)statementNode.Parent).RemoveChild(statementNode);
                    statementNode.Parent = statementHolderScopeNode;

                    //setup the labeledStatement nodes to be Value nodes and create a node for Defaults
                    IModifiable valueNode = (IModifiable)child.GetFirstRecursive(Members.Label);
                    if (valueNode.Code == "default :")
                    {
                        IModifiable defaultNode = (IModifiable)NodeFactory.CreateNode(Members.Default, false);
                        defaultNode.Parent = valueNode;
                        defaultNode.CopyCode(valueNode);
                        defaultNode.ClearCode(ClearCodeOptions.KeepLine);
                    }
                    valueNode.ClearCode(ClearCodeOptions.KeepLine);
                    valueNode.SetNode(Members.Value);

                    //move labeledStatements in the Scope of a Block to the Value, where they belong
                    //do some kind of loop or recursion here?
                    List<INavigable> labeledStatements = new List<INavigable>();
                    statementHolderScopeNode.FullRecursiveSearch(Members.Label, labeledStatements);
                    foreach (IModifiable labeledStatement in labeledStatements)
                    {
                        if (labeledStatement.Code.Equals("case :") || labeledStatement.Code.Equals("default :"))
                        {
                            labeledStatement.GetNthChild(0).Parent = child.GetNthChild(0);
                            labeledStatement.RemoveChild((IModifiable)labeledStatement.GetNthChild(0));
                            ((IModifiable)labeledStatement.Parent.Parent).ReplaceChild((IModifiable)labeledStatement.Parent, (IModifiable)labeledStatement.GetNthChild(0));
                        }
                    }
                }
            }
            // here...?
            // copy children of BLOCKS node, then add them back in order
            // if it's a BLOCK, add it under BLOCKS
            // if it's a STATEMENT, add it under the SCOPE of the LAST BLOCK added under BLOCKS
            List<INavigable> blocksNodeChildren = blocksNode.Children;
            blocksNode.DropChildren();
            foreach (IModifiable child in blocksNodeChildren)
            {
                if (child.Node.Equals(Members.Block))
                {
                    child.Parent = blocksNode;
                }
                else
                {
                    child.Parent = blocksNode.GetNthChild(blocksNode.GetChildCount() - 1).GetNthChild(1);
                }
            }
            // replace the Boolean node with a Value
            IModifiable controlNode = (IModifiable)node.GetFirstSingleLayer(Members.Boolean);
            if (controlNode != null)
            {
                controlNode.SetNode(Members.Value);

                if (controlNode.Code.Equals("="))
                {
                    IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                    writeNode.Parent = controlNode.GetNthChild(1).GetNthChild(0);
                    controlNode.GetNthChild(2).Parent = writeNode;
                    controlNode.RemoveChild((IModifiable)controlNode.GetNthChild(2));
                }
            }
        }

        /// <summary>
        /// Turns jumpStatement nodes into the relevant SQM nodes, where possible
        /// </summary>
        /// <param name="answer"></param>
        private void JumpStatementHandler(IModifiable node)
        {
            if (node.Code.Equals("break ;"))
            {
                node.SetNode(Members.Break);
            }
            else if (node.Code.Equals("continue ;"))
            {
                node.SetNode(Members.Continue);
            }
            else if (node.Code.Equals("return ;"))
            {
                node.SetNode(Members.Return);
            }
            else if (node.Code.Contains("goto"))
            {
                // May want to do something about that label stuff in the code
                node.SetNode(Members.Goto);
            }
            else
            {
                errorMessages.Add("ERROR: Unsupported jumpStatement code " + node + System.Environment.NewLine);
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Crushes down nestedNameSpecifier nodes
        /// </summary>
        /// <param name="answer"></param>
        private void NestedNameHandler(IModifiable node)
        {
            if (node.GetChildCount() > 1)
            {
                // not sure if this goes here or someplace else
                if (node.Parent.Code.StartsWith("typename "))
                {
                    string codeString = node.Parent.Code;
                    codeString = codeString.Remove(0, 9);
                    ((IModifiable)node.Parent).ClearCode(ClearCodeOptions.KeepLine);
                    ((IModifiable)node.Parent).AddCode(codeString, (IModifiable)node.Parent);
                    ((IModifiable)node.Parent).SetNode(Members.TypeName);
                    IModifiable withinNode = (IModifiable)NodeFactory.CreateNode(Members.Within, false);
                    withinNode.Parent = node.Parent;
                    ((IModifiable)node.Parent).RemoveChild(node);
                    node.Parent = withinNode;
                }
                // this does go here
                ReparentChildren(node);
                return;
            }
            while (node.GetChildCount() > 0)
            {
                ((IModifiable)node.GetNthChild(0)).AddCode(node.Code, node);
                node.ClearCode(ClearCodeOptions.ClearAll);
                node.CopyCode((IModifiable)node.GetNthChild(0));
                ReparentChildren((IModifiable)node.GetNthChild(0));
            }

            IModifiable otherNode = (IModifiable)node.Parent.GetNthChild(1);

            node.AddCode(otherNode.Code, otherNode);
            otherNode.ClearCode(ClearCodeOptions.ClearAll);
            otherNode.CopyCode(node);

            if (otherNode.GetChildCount() > 0 && !otherNode.GetNthChild(0).Node.Equals(Members.Sub_Type))
            {
                otherNode.AddCode(otherNode.GetNthChild(0).Code, (IModifiable)otherNode.GetNthChild(0));
                otherNode.SetNode(otherNode.GetNthChild(0).Node);
                //otherNode.DropChildren();
                if (otherNode.GetNthChild(0).GetChildCount() > 0)
                {
                    otherNode.ReplaceChild((IModifiable)otherNode.GetNthChild(0), (IModifiable)otherNode.GetNthChild(0).GetNthChild(0));
                }
                else
                {
                    otherNode.DropChildren();
                }
            }

            if (node.Parent.Node.Equals(Members.Variable))
            {
                ((IModifiable)node.Parent).CopyCode(otherNode);
                ((IModifiable)node.Parent).RemoveChild((IModifiable)node.Parent.GetNthChild(0));
            }

            ((IModifiable)node.Parent).RemoveChild((IModifiable)node.Parent.GetNthChild(0));
        }

        /// <summary>
        /// Changes modifiers into their respective node type.
        /// </summary>
        /// <param name="node"></param>
        private void ModifierModifier(IModifiable node)
        {
            if (node.Node.Equals("cvQualifier"))
            {
                switch (node.Code)
                {
                    case "const":
                        node.SetNode(Members.Const);
                        break;
                    case "volatile":
                        node.SetNode(Members.Volatile);
                        break;
                    default:
                        throw new InvalidCastException("Unknown modifier: " + node);
                }
            }
            else if (node.Node.Equals("declSpecifier"))
            {
                switch (node.Code)
                {
                    case "constexpr":
                        node.SetNode(Members.Constexpr);
                        break;
                    case "friend":
                        node.SetNode(Members.Friend);
                        break;
                    case "":
                        break;
                    default:
                        throw new InvalidCastException("Unknown modifier: " + node);
                }
            }
            else if (node.Node.Equals("functionSpecifier"))
            {
                switch (node.Code)
                {
                    case "inline":
                        node.SetNode(Members.Inline);
                        break;
                    case "virtual":
                        node.SetNode(Members.Virtual);
                        break;
                    case "explicit":
                        node.SetNode(Members.Explicit);
                        break;
                    default:
                        throw new InvalidCastException("Unknown modifier: " + node);
                }
            }
            else if (node.Node.Equals("virtualSpecifierSeq"))
            {
                switch (node.Code)
                {
                    case "override":
                        node.SetNode(Members.Override);
                        break;
                    case "":
                    if (node.Node.Equals("virtualSpecifierSeq"))
                    {
                         node.SetNode(Members.Virtual);
                    }
                    break;
                    default:
                        logger.LogError($"Node code: [{node.Code}]");
                        throw new InvalidCastException("Unknown modifier: " + node);
                }
            }
            else if (node.Node.Equals("storageClassSpecifier"))
            {
                switch (node.Code)
                {
                    case "static":
                        node.SetNode(Members.Static);
                        break;
                    case "thread_local":
                        // TODO
                        break;
                    default:
                        throw new InvalidCastException("Unknown modifier: " + node);
                }
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Handles Try_Catch nodes
        /// </summary>
        /// <param name="node"></param>
        private void TryCatchHandler(IModifiable node)
        {
            List<INavigable> handlerNodes = node.GetFirstSingleLayer("handlerSeq").Children;
            foreach (IModifiable handlerNode in handlerNodes)
            {
                IModifiable catchScopeNode;
                if (handlerNode.GetFirstSingleLayer("compoundStatement").GetChildCount() == 0)
                {
                    catchScopeNode = (IModifiable)NodeFactory.CreateNode(Members.CatchScope, false);
                    catchScopeNode.Parent = handlerNode.GetFirstSingleLayer("compoundStatement");
                }
                else
                {
                    catchScopeNode = (IModifiable)handlerNode.GetFirstSingleLayer("compoundStatement").GetNthChild(0);
                }
                IModifiable fieldNode = (IModifiable)handlerNode.GetFirstSingleLayer(Members.Field);
                fieldNode.Parent = catchScopeNode;
                handlerNode.RemoveChild(fieldNode);
                // FOR GETTING RID OF typeSpecifierSeq nodes
                if (fieldNode.GetChildCount() > 0 && fieldNode.GetFirstSingleLayer("declarator") == null)
                {
                    IModifiable typeSeqNode = (IModifiable)fieldNode.GetFirstRecursive("typeSpecifierSeq");
                    IModifiable variableNode = (IModifiable)typeSeqNode.GetNthChild(typeSeqNode.GetChildCount() - 1).GetFirstRecursive(Members.TypeName);
                    typeSeqNode.RemoveChild((IModifiable)typeSeqNode.GetNthChild(typeSeqNode.GetChildCount() - 1));
                    variableNode.Parent = fieldNode;
                    variableNode.SetNode(Members.Variable);
                }
                IModifiable typeNameNode = (IModifiable)fieldNode.GetFirstRecursive(Members.TypeName);
                if (typeNameNode != null)
                {
                    IModifiable oldParent = (IModifiable)typeNameNode.Parent;
                    IModifiable typeNode = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                    typeNode.Parent = fieldNode;
                    typeNameNode.Parent = typeNode;
                    oldParent.RemoveChild(typeNameNode);
                }
            }

            //This is going to be ugly, but it's what I need to do (Vitaliy)
            //The catch field isn't set up correctly in some cases

            if (node.GetFirstSingleLayer("handlerSeq").GetFirstSingleLayer("handler").GetFirstSingleLayer("compoundStatement").GetFirstSingleLayer(Members.CatchScope).GetFirstSingleLayer(Members.Field).GetFirstSingleLayer(Members.Variable) != null)
            {
                IModifiable field = (IModifiable)node.GetFirstSingleLayer("handlerSeq").GetFirstSingleLayer("handler").GetFirstSingleLayer("compoundStatement").GetFirstSingleLayer(Members.CatchScope).GetFirstSingleLayer(Members.Field);
                List<INavigable> fieldChildren = field.Children;
                field.DropChildren();

                IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                IModifiable modifierSet = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                bool typeAdded = false;

                foreach (INavigable child in fieldChildren)
                {
                    if (child.Node.Equals("typeSpecifierSeq"))
                    {
                        if (child.GetChildCount() == 2)
                        {
                            if (child.GetNthChild(0).GetNthChild(0).GetNthChild(0).Code.Equals("const"))
                            {
                                IModifiable cons = (IModifiable)NodeFactory.CreateNode(Members.Const, false);
                                cons.Parent = modifierSet;

                                if (!typeAdded)
                                {
                                    child.GetNthChild(1).GetNthChild(0).GetNthChild(0).Parent = type;
                                    typeAdded = true;
                                }
                            }
                            else if (child.GetNthChild(0).GetNthChild(0).GetNthChild(0).Code.Equals("volatile"))
                            {
                                IModifiable volat = (IModifiable)NodeFactory.CreateNode(Members.Volatile, false);
                                volat.Parent = modifierSet;
                                if (!typeAdded)
                                {
                                    child.GetNthChild(1).GetNthChild(0).GetNthChild(0).Parent = type;
                                    typeAdded = true;
                                }
                            }
                            else
                            {
                                if (!typeAdded)
                                {
                                    child.GetNthChild(0).GetNthChild(0).GetNthChild(0).Parent = type;
                                    typeAdded = true;
                                }
                            }
                        }
                        else if (child.GetChildCount() == 1)
                        {
                            child.GetNthChild(0).GetNthChild(0).GetNthChild(0).Parent = type;
                        }
                        else
                        {
                            throw new InvalidCastException("Unexpected child format: " + child);
                        }

                    }
                    else if (child.Node.Equals(Members.Variable))
                    {
                        child.Parent = field;
                    }
                    else
                    {
                        throw new InvalidCastException("Unknown Field child: " + child);
                    }
                }

                type.Parent = field;
                modifierSet.Parent = field;
            }
        }

        /// <summary>
        /// Converts initializerList nodes to ParameterList nodes as appropriate
        /// </summary>
        /// <param name="answer"></param>
        private void InitializerListChecker(IModifiable node)
        {
            List<INavigable> parameterNodes = node.Children;
            node.DropChildren();
            foreach (IModifiable parameterNode in parameterNodes)
            {
                IModifiable newParamNode = (IModifiable)NodeFactory.CreateNode(Members.Parameter, false);
                newParamNode.Parent = node;
                parameterNode.Parent = newParamNode;
            }
        }

        /// <summary>
        /// Handles postfixExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void PostFixHandler(IModifiable node)
        {
            if (node.Code.Equals(".") || node.Code.Equals("->"))
            {
                node.SetNode("dotOperatorNode");
                node.ClearCode(ClearCodeOptions.KeepLine);
            }
            else if (node.Code.Equals("++") || node.Code.Equals("--"))
            {
                node.SetNode(Members.Write);
                IModifiable var = (IModifiable)node.GetNthChild(0);
                node.RemoveChild(var);
                ((IModifiable)node.Parent).ReplaceChild(node, var);
                node.Parent = var;
            }
            else if (node.Code.Equals("( )"))
            {
                IModifiable methodInvokeNode;
                if (node.GetNthChild(0).Code.Equals(".") || node.GetNthChild(0).Code.Equals("->"))
                {
                    // since PostFixHandler is RootUpModify, this node wouldn't be a DotOperator yet
                    methodInvokeNode = (IModifiable)node.GetNthChild(0).GetNthChild(1);
                    methodInvokeNode.SetNode(Members.MethodInvoke);
                }
                else
                {
                    // may be an else-if as other contexts arise
                    methodInvokeNode = (IModifiable)node.GetNthChild(0);
                    methodInvokeNode.SetNode(Members.MethodInvoke);
                }

                // in such a case, the parameters of the function follow after the would-be DotOperator
                // copy nodes, drop children, put the future DotOperator back, add a ParameterList node, add Parameter nodes for each other child
                if (node.GetChildCount() > 1)
                {
                    if (node.GetNthChild(1).Node.Equals(Members.ParameterList))
                    {
                        node.GetNthChild(1).Parent = methodInvokeNode;
                        node.RemoveChild((IModifiable)node.GetNthChild(1));
                    }
                    else
                    {
                        IModifiable parameterListNode = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                        parameterListNode.Parent = methodInvokeNode;
                        IModifiable newParamNode = (IModifiable)NodeFactory.CreateNode(Members.Parameter, false);
                        newParamNode.Parent = parameterListNode;
                        node.GetNthChild(1).Parent = newParamNode;
                        node.RemoveChild((IModifiable)node.GetNthChild(1));
                    }
                }
                else
                {
                    IModifiable parameterListNode = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                    parameterListNode.Parent = methodInvokeNode;
                }
                ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
            }
            else if (node.Code.Equals("[ ]"))
            {
                node.SetNode("indexNode");
            }
            else if (node.Code.Contains("cast"))
            {
                node.SetNode(Members.Cast);
            }
            else if (node.Code.Equals("") && node.GetChildCount() > 1 && node.GetFirstSingleLayer(Members.TypeName) != null)
            {
                IModifiable targetNode = (IModifiable)node.GetFirstSingleLayer(Members.TypeName);
                targetNode.SetNode(Members.ConstructorInvoke);
                IModifiable paramList = (IModifiable)node.GetFirstSingleLayer("bracedInitList");
                node.RemoveChild(paramList);
                paramList.Parent = targetNode;
            }
            else
            {
                errorMessages.Add("ERROR: Unsupported postfixExpression code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Handles assignmentExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void AssignmentExpressionHandler(IModifiable node)
        {
            if (node.GetChildCount() > 1)
            {
                ((IModifiable)node.GetNthChild(1)).SetNode(Members.Write);
                node.GetNthChild(2).Parent = node.GetNthChild(1);
                node.RemoveChild((IModifiable)node.GetNthChild(2));
            }
        }

        /// <summary>
        /// Handles unaryExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void UnaryExpressionHandler(IModifiable node)
        {
            if (node.GetNthChild(0).Code.Equals("!"))
            {
                ((IModifiable)node.GetNthChild(0)).SetNode(Members.Boolean_Not);
                node.GetNthChild(1).Parent = node.GetNthChild(0);
                node.RemoveChild((IModifiable)node.GetNthChild(1));
                ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
            }
            else if (node.GetNthChild(0).Code.Equals("-") || node.GetNthChild(0).Code.Equals("+"))
            {
                ((IModifiable)node.GetNthChild(0)).SetNode(Members.Operator);
                node.GetNthChild(1).Parent = node.GetNthChild(0);
                node.RemoveChild((IModifiable)node.GetNthChild(1));
                ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
            }
            else if (node.Code.Equals("++") || node.Code.Equals("--"))
            {
                node.SetNode(Members.Write);
                IModifiable var = (IModifiable)node.GetNthChild(0);
                node.RemoveChild(var);
                ((IModifiable)node.Parent).ReplaceChild(node, var);
                node.Parent = var;
            }
            else if(node.Code.Contains("sizeof"))
            {
                node.SetNode(Members.Operator);
                if (node.Code.Contains("( )"))
                {
                    //remove this so that the operator ordering function doesn't break
                    node.ClearCode(ClearCodeOptions.KeepLine);
                    node.AddCode("sizeof", node);
                }
            }
            else
            {
                errorMessages.Add("ERROR: Unsupported unaryExpression code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Handles equalityExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void EqualityExpressionHandler(IModifiable node)
        {
            if (node.Code.Equals("=="))
            {
                node.SetNode(Members.Boolean_Equal);
            }
            else if (node.Code.Equals("!="))
            {
                node.SetNode(Members.Boolean_NotEqual);
            }
            else
            {
                // only the first two should exist, but just in case...
                errorMessages.Add("ERROR: Unsupported equalityExpression code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Handles relationalExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void RelationalExpressionHandler(IModifiable node)
        {
            if (node.Code.Equals("<"))
            {
                node.SetNode(Members.Boolean_LessThan);
            }
            else if (node.Code.Equals(">"))
            {
                node.SetNode(Members.Boolean_GreaterThan);
            }
            else if (node.Code.Equals("<="))
            {
                node.SetNode(Members.Boolean_LessThanEqual);
            }
            else if (node.Code.Equals(">="))
            {
                node.SetNode(Members.Boolean_GreaterThanEqual);
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }

        /// <summary>
        /// Handles conditionalExpressions
        /// </summary>
        /// <param name="answer"></param>
        private void ConditionalExpressionHandler(IModifiable node)
        {
            if (node.Code.Equals("? :"))
            {
                node.SetNode(Members.Trinary);
                node.ClearCode(ClearCodeOptions.KeepLine);
                List<INavigable> trinaryNodes = node.Children;
                node.DropChildren();
                IModifiable booleanNode = (IModifiable)NodeFactory.CreateNode(Members.Boolean, false);
                booleanNode.Parent = node;
                IModifiable trinaryScopeNode = (IModifiable)NodeFactory.CreateNode(Members.TrinaryScope, false);
                trinaryScopeNode.Parent = node;
                trinaryNodes[0].Parent = booleanNode;

                IModifiable rightNode = (IModifiable)NodeFactory.CreateNode(Members.RightScope, false);
                rightNode.Parent = trinaryScopeNode;
                IModifiable wrongNode = (IModifiable)NodeFactory.CreateNode(Members.WrongScope, false);
                wrongNode.Parent = trinaryScopeNode;

                trinaryNodes[1].Parent = rightNode;
                trinaryNodes[2].Parent = wrongNode;
            }
            else
            {
                IModifiable temp = (IModifiable)node.GetNthChild(0);
                ((IModifiable)node.Parent).ReplaceChild(node, temp);
            }
        }

        /// <summary>
        /// Handles iterationStatements
        /// </summary>
        /// <param name="answer"></param>
        private void IterationStatementHandler(IModifiable node)
        {
            if (node.Code.Equals("for ( ; )"))
            {
                node.SetNode(Members.For3Loop);

                if (node.GetFirstSingleLayer(Members.ForInitial).GetFirstSingleLayer("expressionStatement") != null)
                {
                    IModifiable forInit = (IModifiable)node.GetFirstSingleLayer(Members.ForInitial);
                    forInit.DropChildren();
                }
                else
                {
                    IModifiable forInitNode = (IModifiable)node.GetFirstSingleLayer(Members.ForInitial);
                    List<INavigable> forInitNodeChildren = forInitNode.Children;
                    forInitNode.DropChildren();
                    foreach (IModifiable child in forInitNodeChildren)
                    {
                        //move future Field nodes out of the ForInitial
                        if (child.Node.Equals("simpleDeclaration"))
                        {
                            child.Parent = node;
                        }
                        else
                        {
                            child.Parent = forInitNode;
                        }
                    }
                }

                Boolean brackets = false;
                IModifiable statement = (IModifiable)node.GetFirstSingleLayer("statement");
                if (statement.GetFirstSingleLayer("compoundStatement") != null)
                {
                    brackets = true;
                }
                List<INavigable> statementChildren = null;
                if(brackets)
                {
                    if (statement.GetFirstSingleLayer("compoundStatement").GetChildCount() == 0)
                    {
                        statementChildren = statement.GetFirstSingleLayer("compoundStatement").Children;
                    }
                    else
                    {
                        statementChildren = statement.GetFirstSingleLayer("compoundStatement").GetFirstSingleLayer(Members.Scope).Children;
                    }
                    statement.DropChildren();
                    foreach (INavigable child in statementChildren)
                    {
                        child.Parent = statement;
                    }
                    statement.SetNode(Members.Scope);
                }
                else
                {
                    List<INavigable> nodeChildren = node.Children;
                    node.DropChildren();
                    foreach (INavigable child in nodeChildren)
                    {
                        if (!child.Node.Equals("statement"))
                        {
                            child.Parent = node;
                        }else
                        {
                            IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                            child.Parent = scope;
                            scope.Parent = node;
                        }
                    }
                }

                IModifiable updateNode = (IModifiable)node.GetFirstSingleLayer("expression");
                if (updateNode != null)
                {
                    updateNode.SetNode(Members.Update);

                    List<INavigable> updatesChildren = updateNode.Children;
                    updateNode.DropChildren();
                    IModifiable updateScope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                    updateScope.Parent = updateNode;
                    foreach (INavigable updateChild in updatesChildren)
                    {
                        updateChild.Parent = updateScope;
                    }
                }
                else
                {
                    IModifiable update = (IModifiable)NodeFactory.CreateNode(Members.Update, false);
                    IModifiable updateScope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);

                    updateScope.Parent = update;
                    update.Parent = node;
                }

                if (node.GetFirstSingleLayer(Members.Boolean) == null)
                {
                    IModifiable Boolean = (IModifiable)NodeFactory.CreateNode(Members.Boolean, false);
                    IModifiable Literal = (IModifiable)NodeFactory.CreateNode(Members.Literal, false);
                    Literal.AddCode("true", node);
                    IModifiable Type = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                    IModifiable TypeName = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
                    TypeName.AddCode("Boolean", Type);

                    TypeName.Parent = Type;
                    Type.Parent = Literal;
                    Literal.Parent = Boolean;
                    Boolean.Parent = node;
                }else
                {
                    //Booleans are already in the format we need
                }
            }
            else if (node.Code.Equals("for ( : )"))
            {
                node.SetNode(Members.ForEachLoop);
                IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                writeNode.Parent = node.GetNthChild(0).GetFirstRecursive(Members.Variable);
                IModifiable rangeNode = (IModifiable)node.GetFirstSingleLayer("forRangeInitializer").GetNthChild(0);
                node.RemoveChild((IModifiable)node.GetFirstSingleLayer("forRangeInitializer"));
                rangeNode.Parent = writeNode;

                List<INavigable> nodeChildren = node.Children;
                node.DropChildren();
                foreach (INavigable child in nodeChildren)
                {
                    if (!child.Node.Equals("statement"))
                    {
                        child.Parent = node;
                    }else
                    {
                        //if there are brackets
                        if (child.GetFirstSingleLayer("compoundStatement") == null)
                        {
                            IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                            child.GetNthChild(0).GetNthChild(0).Parent = scope;
                            scope.Parent = node;
                        }
                        else
                        {
                            child.GetNthChild(0).GetNthChild(0).Parent = node;
                        }
                    }
                }
            }
            else if (node.Code.Equals("do while ( ) ;"))
            {
                IModifiable target = (IModifiable)node.Parent;
                List<INavigable> children = target.Children;
                target.DropChildren();

                IModifiable boolean = (IModifiable)NodeFactory.CreateNode(Members.Boolean, false);
                boolean.Parent = target;

                foreach (IModifiable child in node.Children)
                {
                    if (child.Node.Equals("expression"))
                    {
                        node.GetNthChild(1).Parent = boolean;
                    }
                    else if (child.GetChildCount() == 1 && child.GetNthChild(0).GetChildCount() == 1  && child.GetNthChild(0).GetNthChild(0).Node.Equals(Members.Scope))
                    {
                        node.GetNthChild(0).GetNthChild(0).GetNthChild(0).Parent = target;
                    }
                    else if (child.Node.Equals("statement") && child.GetNthChild(0).GetChildCount() == 0)
                    {
                        IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                        scope.Parent = target;
                    }
                    else if (child.Node.Equals("statement") && child.GetNthChild(0).Node.Equals("declarationStatement"))
                    {
                        IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                        scope.Parent = target;
                        child.Parent = scope;
                    }
                    else
                    {
                        throw new ArgumentException("Tree structure of " + node + " is unexpected");
                    }
                }

                target.SetNode(Members.DoWhile);
            }
            else if (node.Code.Equals("while ( )"))
            {
                bool brackets = true;

                if (node.GetFirstSingleLayer("statement").GetFirstSingleLayer("declarationStatement") != null)
                {
                    brackets = false;
                }
                IModifiable target = (IModifiable)node.Parent;
                if (brackets)
                {
                    List<INavigable> children = node.Children;
                    target.DropChildren();

                    foreach (INavigable child in children)
                    {
                        if (!child.Node.Equals("statement") && node.GetChildCount() == 2)
                        {
                            child.Parent = target;
                        }
                        else if (child.Node.Equals("statement") && child.GetNthChild(0).GetChildCount() == 0)
                        {
                            IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                            scope.Parent = target;
                        }
                        else if (child.Node.Equals("statement") && child.GetNthChild(0).GetNthChild(0).Node.Equals(Members.Scope))
                        {
                            child.GetNthChild(0).GetNthChild(0).Parent = target;
                        }
                        else
                        {
                            throw new ArgumentException("Tree structure of " + node + " is unexpected");
                        }
                    }
                }
                else
                {
                    IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, false);
                    node.GetFirstSingleLayer("statement").Parent = scope;
                    scope.Parent = node;
                    //Now I want to remove the original from While
                    List<INavigable> whileChildren = target.GetNthChild(0).Children;
                    target.DropChildren();

                    foreach (INavigable child in whileChildren)
                    {
                        if (!child.Node.Equals("statement"))
                        {
                            child.Parent = target;
                        }
                    }
                }

                target.SetNode(Members.While);
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
        }        

        /// <summary>
        /// Handles simpleTypeSpecifier nodes
        /// </summary>
        /// <param name="answer"></param>
        private void SimpleTypeHandler(IModifiable node)
        {
            // using this reference source:
            // https://en.cppreference.com/w/cpp/language/types
            // might be missing some stuff
            //if (node.Code.Equals("void") || node.Code.Equals("int") || node.Code.Equals("bool") || node.Code.Equals("char") || node.Code.Equals("float") || node.Code.Equals("double"))
            if (node.GetChildCount() == 0)
            {
                node.SetNode(Members.Primitive);
            }
            else
            {
                //Handled otherwise?
                //throw new InvalidCastException("ERROR: Unsupported simpleTypeSpecifier code " + node);
            }
        }

        /// <summary>
        /// Handles declSpecifierSeq nodes
        /// </summary>
        /// <param name="node"></param>
        private void DeclSpecifierHandler(IModifiable node)
        {
            if (node.Parent == node.GetAncestor(Members.Method)) 
            {
                node.SetNode(Members.ReturnType);
            }
            else
            {
                node.SetNode(Members.Type);
            }
            if (node.GetFirstSingleLayer("declSpecifier") != null && node.GetFirstSingleLayer("declSpecifier").GetFirstSingleLayer("functionSpecifier") != null)
            {
                IModifiable virtualFunc = (IModifiable)node.GetFirstSingleLayer("declSpecifier").GetFirstSingleLayer("functionSpecifier");
                virtualFunc.SetNode(Members.Virtual);
            }

            //The purpose of the following is to reformat data types.
            //It doesn't catch all cases (and can't at this level)

            if (node.GetChildCount() == 0 || node.GetFirstSingleLayer("declSpecifier") == null || node.GetFirstRecursive(Members.TypeName) != null)
            {
                return;
            }
            if (node.GetNthChild(0).GetFirstSingleLayer(Members.MethodInvoke) == null && node.GetFirstSingleLayer("declSpecifier").GetFirstSingleLayer("typeSpecifier") != null)
            {
                if (node.GetFirstRecursive("typeSpecifier").GetFirstSingleLayer(Members.TypeDeclaration) != null)
                {
                    //Needs more testing, might break primitives
                    return;
                }
                List<INavigable> declChildren = node.Children;
                string primitiveName = "";
                bool lineIsAccountedFor = false;
                IModifiable source = (IModifiable)NodeFactory.CreateNode(Members.Primitive, false);
                IModifiable trailing = (IModifiable)NodeFactory.CreateNode("trailingTypeSpecifier", false);
                IModifiable declSpecifier = (IModifiable)node.GetNthChild(0);
                IModifiable typeSpecifier = (IModifiable)node.GetNthChild(0).GetNthChild(0);
                node.DropChildren();

                foreach (INavigable child in declChildren)
                {
                    trailing = (IModifiable)child.GetNthChild(0).GetFirstSingleLayer("trailingTypeSpecifier");
                    if (trailing == null && (IModifiable)child.GetFirstSingleLayer("storageClassSpecifier") != null)
                    {
                        if (!lineIsAccountedFor)
                        {
                            source = (IModifiable)child.GetFirstSingleLayer("storageClassSpecifier");
                            lineIsAccountedFor = true;
                        }
                        primitiveName = primitiveName + " " + child.GetFirstSingleLayer("storageClassSpecifier").Code;
                    }
                    else
                    {
                        //Need to check if current child is long long or long
                        if (trailing.GetFirstSingleLayer("simpleTypeSpecifier") != null)
                        {
                            if (!lineIsAccountedFor)
                            {
                                source = (IModifiable)trailing.GetFirstSingleLayer("simpleTypeSpecifier").GetNthChild(0);
                                lineIsAccountedFor = true;
                            }
                            //if it's long long
                            if (trailing.GetFirstSingleLayer("simpleTypeSpecifier").GetChildCount() == 2)
                            {
                                primitiveName = primitiveName + " long long";
                            }
                            else
                            {
                                primitiveName = primitiveName + " " + trailing.GetFirstSingleLayer("simpleTypeSpecifier").GetNthChild(0).Code;
                            }
                        }
                        else
                        {
                            if (trailing.GetFirstSingleLayer(Members.Primitive) != null)
                            {
                                if (!lineIsAccountedFor)
                                {
                                    source = (IModifiable)trailing.GetFirstSingleLayer(Members.Primitive);
                                    lineIsAccountedFor = true;
                                }
                                primitiveName = primitiveName + " " + trailing.GetFirstSingleLayer(Members.Primitive).Code;
                            }
                        }
                    }
                }
                primitiveName.Remove(0, 1);
                trailing.DropChildren();
                declSpecifier.DropChildren();
                typeSpecifier.DropChildren();
                //Now line and name are accounted for.

                IModifiable primitive = (IModifiable)NodeFactory.CreateNode(Members.Primitive, primitiveName);
                primitive.SetLine(source);

                primitive.Parent = trailing;
                trailing.Parent = typeSpecifier;
                typeSpecifier.Parent = declSpecifier;
                declSpecifier.Parent = node;
            }
        }
        /// <summary>
        /// Handles Sub_Type node datatypes
        /// </summary>
        /// <param name="node"></param>
        private void Sub_TypeModifier(IModifiable node)
        {
            List<INavigable>children = node.Children;
            node.DropChildren();
            string primitiveName = "";
            bool lineIsAccountedFor = false;
            IModifiable source = (IModifiable)NodeFactory.CreateNode(Members.Primitive, primitiveName);

            foreach (INavigable child in children)
            {
                if (!child.Node.Equals("typeSpecifierSeq"))
                {
                    
                    if (child.Node.Equals("simpleTypeSpecifier"))
                    {
                        if (!lineIsAccountedFor)
                        {
                            source = (IModifiable)child.GetNthChild(0);
                            lineIsAccountedFor = true;
                        }
                        primitiveName = primitiveName + " long long";
                    }
                    else
                    {
                        if (!lineIsAccountedFor)
                        {
                            source = (IModifiable)child;
                            lineIsAccountedFor = true;
                        }
                        primitiveName = primitiveName + " " + child.Code;
                    }
                }
                else
                {
                    List<INavigable>simpleChildren = child.Children;
                    foreach (INavigable simpleChild in simpleChildren)
                    {
                        if (simpleChild.Node.Equals("simpleTypeSpecifier"))
                        {
                            if (!lineIsAccountedFor)
                            {
                                source = (IModifiable)simpleChild.GetNthChild(0);
                                lineIsAccountedFor = true;
                            }
                            primitiveName = primitiveName + " long long";
                        }
                        else
                        {
                            if (!lineIsAccountedFor)
                            {
                                source = (IModifiable)simpleChild;
                                lineIsAccountedFor = true;
                            }
                            primitiveName = primitiveName + " "+ simpleChild.Code;
                        }
                    }
                }
            }
            primitiveName.Remove(0, 1);
            IModifiable primitive = (IModifiable)NodeFactory.CreateNode(Members.Primitive, primitiveName);
            primitive.SetLine(source);
            primitive.Parent = node;
        }
        /// <summary>
        /// SubFunction for ClassSpecifierHandler
        /// Used to format objects instantiated on the definition of a struct or union
        /// </summary>
        /// <param name="answer"></param>
        private void HandleDefinitionInstantiation(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor("simpleDeclaration");
            if (target.GetFirstSingleLayer("initDeclaratorList") != null)
            {
                IModifiable typeNameNode = (IModifiable)node.GetFirstSingleLayer("classHead").GetFirstRecursive(Members.TypeName);
                foreach (INavigable child in target.GetFirstSingleLayer("initDeclaratorList").Children)
                {
                    IModifiable Field = (IModifiable)NodeFactory.CreateNode(Members.Field, false);
                    //Need to see if the child is being assigned anything
                    if (child.GetFirstSingleLayer("initializer") != null)
                    {
                        child.GetFirstSingleLayer("initializer").GetNthChild(0).Parent = child.GetFirstRecursive(Members.Variable);
                    }
                    child.GetFirstRecursive(Members.Variable).Parent = Field;
                    IModifiable Type = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                    typeNameNode.Parent = Type;
                    Type.Parent = Field;
                    Field.Parent = target.GetAncestor("declarationseq");
                }

                target.RemoveChild((IModifiable)target.GetFirstSingleLayer("initDeclaratorList"));
            }
        }
        /// <summary>
        /// Prepares all the relevant nodes from classSpecifier nodes
        /// </summary>
        /// <param name="answer"></param>
        private void ClassSpecifierHandler(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.ClearAll);
            IModifiable classHeadNode = (IModifiable)node.GetFirstSingleLayer("classHead");
            if (classHeadNode.GetFirstSingleLayer("classHeadName") != null)
            {
                HandleDefinitionInstantiation(node);
            }
            else if (classHeadNode.GetFirstSingleLayer("classKey") != null)
            {
                if (classHeadNode.GetFirstSingleLayer("classKey").Code.Equals("struct"))
                {
                    //This is a typedef struct
                    IModifiable classHeadName = (IModifiable)NodeFactory.CreateNode("classHeadName", false);
                    IModifiable typeName = (IModifiable)NodeFactory.CreateNode("TypeName", false);
                    typeName.AddCode(node.GetAncestor(Members.TypeDeclaration).Code, (IModifiable)node.GetAncestor(Members.TypeDeclaration));
                    typeName.Parent = classHeadName;
                    classHeadName.Parent = classHeadNode;

                    IModifiable classification = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
                    IModifiable modSet = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                    classHeadNode.GetFirstSingleLayer("classKey").Parent = classification;
                    classification.Parent = node;
                    modSet.Parent = node;
                    return;
                }
            }

            if (classHeadNode.Code.Equals("union"))
            {
                if (node.GetFirstSingleLayer("classHead").GetFirstSingleLayer("classHeadName") == null)
                {
                    //Handle typedef unions
                    IModifiable classKey = (IModifiable)NodeFactory.CreateNode("classKey", false);
                    classKey.AddCode(node.GetFirstSingleLayer("classHead").Code, (IModifiable)node.GetFirstSingleLayer("classHead"));
                    classKey.Parent = classHeadNode;

                    IModifiable classHeadName = (IModifiable)NodeFactory.CreateNode("classHeadName", false);
                    IModifiable typeName = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);

                    typeName.AddCode(node.GetAncestor(Members.TypeDeclaration).Code, (IModifiable)node.GetAncestor(Members.TypeDeclaration));
                    typeName.Parent = classHeadName;
                    classHeadName.Parent = classHeadNode;

                    IModifiable classification = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
                    classKey.Parent = classification;
                    IModifiable modSet = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);

                    classification.Parent = node;
                    modSet.Parent = node;
                    return;
                }
                node.AddCode(node.GetFirstSingleLayer("classHead").GetFirstRecursive(Members.TypeName).Code, classHeadNode);

                //Adding classification
                IModifiable Classification = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
                Classification.Parent = node;
                classHeadNode.Parent = Classification;
                ((IModifiable)Classification.GetNthChild(0)).SetNode("classKey");
                ((IModifiable)Classification.GetNthChild(0)).DropChildren();

                //Adding modset
                IModifiable modset = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                modset.Parent = node;

                node.RemoveChild((IModifiable)node.GetFirstSingleLayer("classKey"));
                ((IModifiable)node.GetAncestor("declSpecifierSeq").Parent).ReplaceChild((IModifiable)node.GetAncestor("declSpecifierSeq"), node);
                return;
            }
            //Why can't we just treat unions the same way as structs?
            //Unions can only hold one data type at a time, but otherwise act very similar to structs
            else if(classHeadNode.GetFirstSingleLayer("classHeadName") != null)
            {
                node.AddCode(classHeadNode.GetFirstSingleLayer("classHeadName").GetNthChild(0).Code, (IModifiable)classHeadNode.GetFirstSingleLayer("classKey"));
            }
            else
            {
                // ANONYMOUS
                node.AddCode(NodeFactory.GenerateAnonymous((IModifiable)classHeadNode.GetFirstSingleLayer("classKey")), (IModifiable)classHeadNode.GetFirstSingleLayer("classKey"));
                List<INavigable> anonymousObjectNodesList = new List<INavigable>();
                string targetNodeKind = "";
                if (node.GetAncestor("memberdeclaration") != null)
                {
                    // TODO: need to find a way to make the listed objects have the right access specification level
                    if (node.GetAncestor("memberdeclaration").GetChildCount() > 1)
                    {
                        anonymousObjectNodesList = node.GetAncestor("memberdeclaration").GetFirstSingleLayer("memberDeclaratorList").Children;
                        ((IModifiable)node.GetAncestor("memberdeclaration")).RemoveChild((IModifiable)node.GetAncestor("memberdeclaration").GetFirstSingleLayer("memberDeclaratorList"));
                        targetNodeKind = "memberSpecification";
                    }
                }
                else
                {
                    if (node.GetAncestor("simpleDeclaration").GetChildCount() > 1)
                    {
                        anonymousObjectNodesList = node.GetAncestor("simpleDeclaration").GetFirstSingleLayer("initDeclaratorList").Children;
                        ((IModifiable)node.GetAncestor("simpleDeclaration")).RemoveChild((IModifiable)node.GetAncestor("simpleDeclaration").GetFirstSingleLayer("initDeclaratorList"));
                        targetNodeKind = "declarationseq";
                    }
                }
                // there should only be more than 0 objects in this list when one of the above conditions occur
                // so, targetNodeKind being just "" shouldn't be an issue...
                foreach (IModifiable objectNode in anonymousObjectNodesList)
                {
                    IModifiable fieldNode = (IModifiable)NodeFactory.CreateNode(Members.Field, false);
                    objectNode.GetFirstRecursive(Members.Variable).Parent = fieldNode;
                    IModifiable typeNode = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                    typeNode.Parent = fieldNode;
                    IModifiable typeNameNode = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
                    typeNameNode.Parent = typeNode;
                    typeNameNode.CopyCode(node);
                    fieldNode.Parent = node.GetAncestor(targetNodeKind);
                }
                IModifiable superTypesNode = (IModifiable)NodeFactory.CreateNode(MemberSets.SuperTypes, false);
                superTypesNode.Parent = node;
                IModifiable superTypeNode = (IModifiable)NodeFactory.CreateNode(Members.SuperType, false);
                superTypeNode.Parent = superTypesNode;
                IModifiable anonymousNode = (IModifiable)NodeFactory.CreateNode(Members.ANONYMOUS, false);
                anonymousNode.Parent = superTypeNode;

                superTypeNode.AddCode("anonymous", superTypeNode);
            }
            IModifiable classificationNode = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
            classificationNode.Parent = node;
            classHeadNode.GetFirstSingleLayer("classKey").Parent = classificationNode;
            if (classHeadNode.GetFirstSingleLayer("baseClause") != null)
            {
                IModifiable superTypesNode = (IModifiable)NodeFactory.CreateNode(MemberSets.SuperTypes, false);
                superTypesNode.Parent = node;
                foreach (IModifiable superTypeChild in classHeadNode.GetFirstRecursive("baseSpecifierList").Children)
                {
                    IModifiable superTypeNode = (IModifiable)NodeFactory.CreateNode(Members.SuperType, false);
                    superTypeNode.Parent = superTypesNode;
                    IModifiable classNode = (IModifiable)NodeFactory.CreateNode(Members.CLASS, false);
                    classNode.Parent = superTypeNode;
                    // TODO: access specifiers go where?
                    superTypeNode.CopyCode((IModifiable)superTypeChild.GetFirstRecursive(Members.TypeName));
                }
            }
            node.RemoveChild((IModifiable)node.GetNthChild(0));
            IModifiable modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            modSetNode.Parent = node;

            // get rid of type node
            ((IModifiable)node.GetAncestor("declSpecifierSeq").Parent).ReplaceChild((IModifiable)node.GetAncestor("declSpecifierSeq"), node);
        }

        /// <summary>
        /// Handles memberSpecification nodes
        /// </summary>
        /// <param name="answer"></param>
        private void MemberSpecificationHandler(IModifiable node)
        {
            List<INavigable> memberNodes = node.Children;
            node.DropChildren();
            IModifiable accessSpecNode;
            if (node.Parent.GetFirstSingleLayer(MemberSets.Classification).GetNthChild(0).Code.Equals("class"))
            {
                accessSpecNode = (IModifiable)NodeFactory.CreateNode(Members.Private, false);
            }
            else 
            {
                // struct and union are public by default
                accessSpecNode = (IModifiable)NodeFactory.CreateNode(Members.Public, false);
            }
            foreach (IModifiable memberNode in memberNodes)
            {
                if (memberNode.Node.Equals("accessSpecifier"))
                {
                    accessSpecNode = memberNode;
                    if (accessSpecNode.Code.Equals("private"))
                    {
                        accessSpecNode.SetNode(Members.Private);
                    }
                    else if (accessSpecNode.Code.Equals("public"))
                    {
                        accessSpecNode.SetNode(Members.Public);
                    }
                    else if (accessSpecNode.Code.Equals("protected"))
                    {
                        accessSpecNode.SetNode(Members.Protected);
                    }
                    accessSpecNode.ClearCode(ClearCodeOptions.KeepLine);
                }
                else
                {
                    if (!(memberNode.Node.Equals("memberdeclaration") && memberNode.GetChildCount() == 0))
                    {
                        memberNode.Parent = node;
                        accessSpecNode.Clone().Parent = memberNode;
                    }
                }
            }
        }
        /// <summary>
        ///Complimentary function to DeclaratorHandler
        ///Used to handle function pointers in CPP
        /// </summary>
        /// <param name="answer"></param>
        private void FunctionPointerHandler(IModifiable node)
        {
            IModifiable method = (IModifiable)NodeFactory.CreateNode(Members.Method, false);
            IModifiable target = (IModifiable)node.GetAncestor("simpleDeclaration");
            ((IModifiable)target.GetFirstSingleLayer("declSpecifierSeq")).Clone().Parent = method;
            IModifiable nodeClone = node.Clone();
            nodeClone.Parent = method;
            nodeClone.GetFirstSingleLayer("noPointerDeclarator").GetNthChild(0).Parent = method.GetFirstSingleLayer("declarator");
            ((IModifiable)method.GetFirstSingleLayer("declarator")).RemoveChild((IModifiable)method.GetFirstSingleLayer("declarator").GetFirstSingleLayer("noPointerDeclarator"));
            IModifiable funcBody = ((IModifiable)node.GetAncestor("functionBody")).Clone();
            funcBody.DropChildren();
            funcBody.ClearCode(ClearCodeOptions.ClearAll);
            IModifiable compStatement = (IModifiable)NodeFactory.CreateNode("compoundStatement", false);
            compStatement.Parent = funcBody;
            funcBody.Parent = method;

            //Segment for adding variables into the parameter list
            int i = 0;
            IModifiable paramtrs = (IModifiable)method.GetFirstSingleLayer("declarator").GetFirstSingleLayer(Members.ParameterList);
            foreach (INavigable parameter in paramtrs.Children)
            {
                IModifiable variable = (IModifiable)NodeFactory.CreateNode(Members.Variable, false);
                variable.AddCode("x" + i, (IModifiable)parameter.GetNthChild(0));
                variable.Parent = parameter;
                i++;
            }

            IModifiable decl = ((IModifiable)node.GetAncestor("declaration")).Clone();
            decl.DropChildren();
            decl.ClearCode(ClearCodeOptions.ClearAll);
            method.Parent = decl;
            decl.Parent = (IModifiable)node.GetAncestor(Members.Method).Parent.Parent;

            //Now I want to clean up whats left from where its called.
            ((IModifiable)node.GetAncestor("simpleDeclaration")).RemoveChild((IModifiable)node.GetAncestor("simpleDeclaration").GetFirstSingleLayer("declSpecifierSeq"));
            node.GetFirstSingleLayer("noPointerDeclarator").GetFirstSingleLayer(Members.Variable).Parent = node;
            node.RemoveChild((IModifiable)node.GetFirstSingleLayer("noPointerDeclarator"));
            node.RemoveChild((IModifiable)node.GetFirstSingleLayer(Members.ParameterList));
        }
        /// <summary>
        /// Handles declarator nodes
        /// </summary>
        /// <param name="answer"></param>
        private void DeclaratorHandler(IModifiable node)
        {
            if (!node.Parent.Node.Equals(Members.Method))
            {
                //Function pointers
                if (node.Parent.GetFirstSingleLayer("initializer") != null)
                {
                    if (node.Parent.GetFirstSingleLayer("initializer").GetFirstSingleLayer(Members.Write) != null && node.GetChildCount() == 2)
                    {
                        FunctionPointerHandler(node);
                    }
                }    
                if (node.GetChildCount() == 2 && node.GetNthChild(1).Node.Equals(Members.ParameterList))
                {
                    // TODO: operators...
                    // operators overrides?? (classConstructor)
                    // declarators in Method definitions should NOT be MethodInvokes (Polygon.AST)
                    // watch for ConstructorInvokes too, not sure how those ought to look - line 41, 40 in AST (classConstructor)
                    // maybe - if there's a type, but there is no Write = node, then it's a constructor?
                    if (node.Parent.Node.Equals("memberDeclarator"))
                    {
                        // if a class has a declared but not defined member function, like a friend function or something weird
                        ((IModifiable)node.GetNthChild(0)).SetNode(Members.Method);
                        IModifiable modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                        modSetNode.Parent = node.GetNthChild(0);
                        IModifiable memberDeclarationNode = (IModifiable)node.GetAncestor("memberdeclaration");
                        IModifiable declSpecNode = (IModifiable)memberDeclarationNode.GetFirstSingleLayer("declSpecifierSeq");
                        if (declSpecNode != null)
                        {
                            memberDeclarationNode.RemoveChild(declSpecNode);
                            declSpecNode.Parent = node.GetNthChild(0);
                        }
                        if (node.Parent.GetFirstSingleLayer("virtualSpecifierSeq") != null)
                        {
                            if (node.GetFirstSingleLayer("virtualSpecifierSeq") != null)
                            {
                                if (node.GetFirstSingleLayer("virtualSpecifierSeq").Code.Equals("override"))
                                {
                                    IModifiable oRide = (IModifiable)node.GetFirstSingleLayer("virtualSpecifierSeq");
                                    oRide.SetNode(Members.Override);
                                }
                            }
                            node.Parent.GetFirstSingleLayer("virtualSpecifierSeq").Parent = memberDeclarationNode;
                        }
                        
                        memberDeclarationNode.ReplaceChild((IModifiable)memberDeclarationNode.GetNthChild(0), (IModifiable)node.GetNthChild(0));
                    }
                    else
                    {
                        ((IModifiable)node.GetNthChild(0)).SetNode(Members.MethodInvoke);
                    }
                    
                    node.GetNthChild(1).Parent = node.GetNthChild(0);
                    node.RemoveChild((IModifiable)node.GetNthChild(1));
                }
                else if (node.Parent.GetChildCount() == 2 && node.Parent.GetNthChild(1).Code.Equals("( )"))
                {
                    ((IModifiable)node.GetNthChild(0)).SetNode(Members.MethodInvoke);
                }
            }
            else if (node.GetNthChild(0).Node.Equals("operatorFunctionId"))
            {
                IModifiable parameterList = (IModifiable)node.GetFirstSingleLayer(Members.ParameterList);
                node.RemoveChild(parameterList);
                if (node.GetNthChild(0).GetChildCount() == 0)
                {
                    parameterList.Parent = node.GetNthChild(0);
                }
                else
                {
                    parameterList.Parent = node.GetNthChild(0).GetNthChild(0);
                }
            }
        }

        /// <summary>
        /// else if statements do not produce an ElseScope node in C++ like they do in Java with only the existing code - this function corrects that
        /// </summary>
        /// <param name="answer"></param>
        /// 
        private void ElseIfScopeAdder(IModifiable node)
        {
            if (node.GetNthChild(0).Node.Equals(Members.Branch))
            {
                List<INavigable> children = node.Children;
                node.DropChildren();
                IModifiable elseScope = (IModifiable)NodeFactory.CreateNode(Members.ElseScope, false);
                elseScope.Parent = node;
                foreach (IModifiable child in children)
                {
                    child.Parent = elseScope;
                }
            }
        }

        /// <summary>
        /// Properly orders DotOperator nodes and the like
        /// </summary>
        /// <param name="answer"></param>
        private void DotOperatorOrderer(IModifiable node)
        {
            IModifiable dotOperator = (IModifiable)NodeFactory.CreateNode(Members.DotOperator, false);
            dotOperator.CopyCode(node);
            if (node.GetNthChild(0).Node.Equals("dotOperatorNode"))
            {
                dotOperator.Parent = node.GetNthChild(0).GetNthChild(1);
            }
            else
            {
                dotOperator.Parent = node.GetNthChild(0);
            }
            node.GetNthChild(1).Parent = dotOperator;
            node.RemoveChild((IModifiable)node.GetNthChild(1));
            ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
        }

        /// <summary>
        /// Handles primaryExpression nodes
        /// </summary>
        /// <param name="answer"></param>
        private void PrimaryExpressionHandler(IModifiable node)
        {
            if (node.Code.Equals("this"))
            {
                node.SetNode(Members.SelfReference);
            }
            else if (node.Code.Equals("( )"))
            {
                ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
            }
            else if (node.Code.Equals(""))
            {
                //This should join strings that have spaces between
                //Note: this is different than concatenating strings or shiftoperators
                //Turns: ["this "    "is a"  " test"] into: ["this is a test"]
                //OR large literals
                if (node.GetChildCount() > 1) 
                {
                    if (!node.GetNthChild(0).Node.Equals("literal"))
                    {
                        return;
                    }
                    string code = "";
                    if (node.GetNthChild(0).Code.Contains("\""))
                    {
                        code = "\"";
                    }
                    int i = 0;
                    foreach (INavigable child in node.Children)
                    {
                        string temp = child.Code;
                        temp = temp.Replace("\"", "");
                        code = code + temp;
                        if (i != 0)
                        {
                            node.RemoveChild((IModifiable)child);
                        }
                        i++;
                    }
                    if (node.GetNthChild(0).Code.Contains("\""))
                    {
                        code = code + "\"";
                    }
                    //If we receive unexpected nodes, it should hopefully break here
                    ((IModifiable)node.GetFirstSingleLayer("literal")).ClearCode(ClearCodeOptions.KeepLine);
                    ((IModifiable)node.GetFirstSingleLayer("literal")).AddCode(code, (IModifiable)node.GetFirstSingleLayer("literal"));
                    ReparentChildren(node);
                }
            }
            else
            {
                // TODO
                //errorMessages.Add("ERROR: Unsupported primaryExpression code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Handles template-related nodes when they are being used
        /// </summary>
        /// <param name="answer"></param>
        private void TemplateUsageHandler(IModifiable node)
        {
            if (node.GetChildCount() == 2)
            {
                node.GetNthChild(1).Parent = node.GetNthChild(0);
                node.RemoveChild((IModifiable)node.GetNthChild(1));
                if (node.Parent.Node.Equals(Members.TypeName) || node.Parent.Node.Equals(Members.Variable))
                {
                    ((IModifiable)node.Parent.Parent).ReplaceChild((IModifiable)node.Parent, (IModifiable)node.GetNthChild(0));
                }
                else
                {
                    ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
                }
            }
        }

        /// <summary>
        /// Handles template-related nodes when they are being defined
        /// </summary>
        /// <param name="answer"></param>
        private void TemplateDefinitionHandler(IModifiable node)
        {
            // Java examples not clear - for the time being I'll follow how they look and simply remove template information
            ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetFirstSingleLayer("declaration").GetNthChild(0));
        }

        /// <summary>
        /// Handles enumSpecifier nodes
        /// </summary>
        /// <param name="answer"></param>
        private void EnumSpecifierHandler(IModifiable node)
        {
            IModifiable classificationNode = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
            classificationNode.Parent = node.GetNthChild(0);
            IModifiable modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            modSetNode.Parent = node.GetNthChild(0);
            IModifiable enumNode = (IModifiable)NodeFactory.CreateNode(Members.ENUM, false);
            enumNode.Parent = classificationNode;
            IModifiable superTypesNode = (IModifiable)NodeFactory.CreateNode(MemberSets.SuperTypes, false);
            superTypesNode.Parent = node.GetNthChild(0);
            IModifiable enumkeyNode = (IModifiable)node.GetNthChild(0).GetFirstSingleLayer("enumkey");
            IModifiable enumbaseNode = (IModifiable)node.GetNthChild(0).GetFirstSingleLayer("enumbase");
            enumkeyNode.SetNode(Members.SuperType);
            enumkeyNode.Parent = superTypesNode;
            ((IModifiable)node.GetNthChild(0)).RemoveChild(enumkeyNode);
            IModifiable superClone = enumNode.Clone();
            superClone.Parent = enumkeyNode;
            if (enumbaseNode != null)
            {
                IModifiable enumSub = (IModifiable)NodeFactory.CreateNode(Members.Sub_Type, false);
                enumSub.Parent = superClone;
                ((IModifiable)node.GetNthChild(0)).RemoveChild(enumbaseNode);
                enumbaseNode.Parent = enumSub;
                enumSub.ReplaceChild(enumbaseNode, (IModifiable)enumbaseNode.GetNthChild(0));
            }

            node.GetNthChild(1).Parent = node.GetNthChild(0);
            node.RemoveChild((IModifiable)node.GetNthChild(1));
            IModifiable oldParent = (IModifiable)node.Parent;
            if (node.GetAncestor("declSpecifierSeq").Parent.Node.Equals("memberdeclaration"))
            {
                ((IModifiable)node.GetAncestor("memberdeclaration")).ReplaceChild((IModifiable)node.GetAncestor("memberdeclaration").GetNthChild(0), (IModifiable)node.GetNthChild(0));
            }
            else
            {
                ((IModifiable)node.GetAncestor("declaration")).ReplaceChild((IModifiable)node.GetAncestor("declaration").GetNthChild(0), (IModifiable)node.GetNthChild(0));
            }
            oldParent.RemoveChild(node);
        }

        /// <summary>
        /// Handles Parameter nodes
        /// </summary>
        /// <param name="answer"></param>
        private void ParameterHandler(IModifiable node)
        {
            if (node.GetChildCount() > 1)
            {
                List<INavigable> children = node.Children;
                node.DropChildren();
                IModifiable modifierSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                modifierSetNode.Parent = node;
                foreach (IModifiable child in children)
                {
                    if (child.Node.Equals(Members.Variable) || child.Node.Equals(Members.Type))
                    {
                        child.Parent = node;
                    }
                    else if (child.Node.Equals("noPointerDeclarator"))
                    {
                        // TODO: may be several noPointers in a row - multiD arrays
                        child.GetNthChild(0).Parent = node;
                    }
                    else
                    {
                        IModifiable typeNode = (IModifiable)NodeFactory.CreateNode(Members.Type, false);
                        typeNode.Parent = node;
                        child.Parent = typeNode;
                    }
                }
            }
        }

        /// <summary>
        /// Makes Write nodes have the correct parent
        /// </summary>
        /// <param name="answer"></param>
        private void WriteNodeOrderer(IModifiable node)
        {
            IModifiable parentNode = (IModifiable)node.Parent;
            if (parentNode.Node.Equals("initializer") || parentNode.Node.Equals("memberDeclarator") || parentNode.Node.Equals("assignmentExpression"))
            {
                parentNode.RemoveChild(node);
                IModifiable targetNode;
                if (parentNode.Node.Equals("memberDeclarator"))
                {
                    targetNode = (IModifiable)parentNode.GetFirstRecursive(Members.Variable);
                }
                else
                {
                    targetNode = (IModifiable)parentNode.Parent.GetFirstRecursive(Members.Variable);
                }
                while (targetNode.GetChildCount() > 0 && targetNode.GetNthChild(0).Node.Equals(Members.DotOperator))
                {
                    targetNode = (IModifiable)targetNode.GetNthChild(0).GetNthChild(0);
                }
                node.Parent = targetNode;
            }
        }

        /// <summary>
        /// Adjusts the AST when multiple member variables are declared on the same line
        /// </summary>
        /// <param name="answer"></param>
        private void MultipleMemberDeclarationsHandler(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.KeepLine);
            if (node.GetChildCount() > 1)
            {
                IModifiable memberSpecNode = (IModifiable)node.GetAncestor("memberSpecification");
                List<INavigable> memberdeclarations = memberSpecNode.Children;
                memberSpecNode.DropChildren();
                foreach (IModifiable memberdeclaration in memberdeclarations)
                {
                    IModifiable memberDeclaratorList = (IModifiable)memberdeclaration.GetFirstSingleLayer("memberDeclaratorList");
                    if (memberDeclaratorList != null && memberDeclaratorList.GetChildCount() > 1)
                    {
                        IModifiable typeNode = (IModifiable)memberdeclaration.GetNthChild(0);
                        List<INavigable> memberDeclarators = memberDeclaratorList.Children;
                        foreach (IModifiable memberDeclarator in memberDeclarators)
                        {
                            IModifiable copiedDeclaration = memberdeclaration.Clone();
                            copiedDeclaration.DropChildren();
                            copiedDeclaration.Parent = memberSpecNode;
                            IModifiable copiedTypeNode = typeNode.Clone();
                            copiedTypeNode.Parent = copiedDeclaration;
                            IModifiable copiedMemberDeclaratorList = memberDeclaratorList.Clone();
                            copiedMemberDeclaratorList.DropChildren();
                            copiedMemberDeclaratorList.Parent = copiedDeclaration;
                            memberDeclarator.Parent = copiedMemberDeclaratorList;
                        }
                    }
                    else
                    {
                        memberdeclaration.Parent = memberSpecNode;
                    }
                }
            }
        }

        /// <summary>
        /// Adjusts the AST when multiple non-member variables are declared on the same line
        /// </summary>
        /// <param name="answer"></param>
        private void MultipleInitDeclarationsHandler(IModifiable node)
        {
            if (node.GetChildCount() > 1)
            {
                List<INavigable> initDeclarators = node.Children;
                node.DropChildren();
                IModifiable ancestorNode = (IModifiable)node.GetAncestor("statement");
                if(ancestorNode == null)
                {
                    // may be outside of a function, like a global
                    ancestorNode = (IModifiable)node.GetAncestor("declaration");
                }
                IModifiable priorParent = (IModifiable)ancestorNode.Parent;
                List<INavigable> siblingNodes = priorParent.Children;
                priorParent.DropChildren();
                foreach (IModifiable child in siblingNodes)
                {
                    if (child == ancestorNode)
                    {
                        foreach (IModifiable initDeclarator in initDeclarators)
                        {
                            IModifiable newStatement = ancestorNode.Clone();
                            newStatement.Parent = priorParent;
                            IModifiable targetNode = (IModifiable)newStatement.GetFirstRecursive("initDeclaratorList");
                            initDeclarator.Parent = targetNode;
                        }
                    }
                    else
                    {
                        child.Parent = priorParent;
                    }
                }
            }
        }

        /// <summary>
        /// Properly orders Index nodes - this operation can't take place in PostFixHandler since it must be LeafDownModify
        /// </summary>
        /// <param name="answer"></param>
        private void IndexOrderer(IModifiable node)
        {
            //TODO: reorder so that Index nodes appear before DotOperator(? - needs more testing)
            IModifiable indexNode = (IModifiable)NodeFactory.CreateNode(Members.Index, false);
            IModifiable targetNode = (IModifiable)node.GetNthChild(0);
            while (!targetNode.Node.Equals(Members.Variable) && !targetNode.Node.Equals(Members.MethodInvoke))
            {
                //TODO: improve understanding of how the MethodInvokes should work in here
                if (targetNode.GetFirstSingleLayer(Members.Variable) != null)
                {
                    targetNode = (IModifiable)targetNode.GetFirstSingleLayer(Members.Variable);
                }
                else
                {
                    targetNode = (IModifiable)targetNode.GetNthChild(0);
                }
            }
            indexNode.Parent = targetNode;

            node.GetNthChild(1).Parent = indexNode;
            node.RemoveChild((IModifiable)node.GetNthChild(1));
            ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
        }

        /// <summary>
        /// Adds the ModifierSet node to member fields
        /// </summary>
        /// <param name="answer"></param>
        private void MemberModifierSetAdjuster(IModifiable node)
        {
            IModifiable modSetNode;
            if (node.GetFirstSingleLayer(Members.Type) != null)
            {
                modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                modSetNode.Parent = node;
            }
            /*
            else
            {
                modSetNode = (IModifiable)node.GetNthChild(0).GetFirstSingleLayer(MemberSets.ModifierSet);
            }
            */
        }

        /// <summary>
        /// Sends modifiers for things to their ModifierSet node
        /// </summary>
        /// <param name="answer"></param>
        private void ModifierSender(IModifiable node)
        {
            if (node.Parent.GetFirstSingleLayer(Members.Virtual) != null)
            {
                IModifiable nodeParent = (IModifiable)node.Parent;
                List<INavigable> children = nodeParent.Children;
                IModifiable vrt = (IModifiable)nodeParent.GetFirstSingleLayer(Members.Virtual);
                nodeParent.DropChildren();

                foreach (INavigable child in children)
                {
                    logger.LogDebug($"child: {child}");
                    if (!child.Node.Equals(Members.Virtual))
                    {
                        child.Parent = nodeParent;
                    }
                }

                vrt.Parent = node.Parent.GetFirstSingleLayer(Members.Method).GetFirstSingleLayer(MemberSets.ModifierSet);
            }
            if (node.Node.Equals("declSpecifier") && node.Code.Equals(""))
            {
                return;
            }
            IModifiable oldParent = (IModifiable)node.Parent;
            IModifiable targetNode = (IModifiable)node.Parent;
            while (targetNode.GetFirstSingleLayer(MemberSets.ModifierSet) == null)
            {
                if (targetNode.Node.Equals("memberdeclaration"))
                {
                    targetNode = (IModifiable)targetNode.GetNthChild(0);
                    break;
                }
                targetNode = (IModifiable)targetNode.Parent;
                
            }

            node.Parent = targetNode.GetFirstSingleLayer(MemberSets.ModifierSet);
            (oldParent).RemoveChild(node); 

        }

        /// <summary>
        /// Checks that an element is being called for the first time via the existence of a Type node, and makes that a Field node
        /// </summary>
        /// <param name="answer"></param>
        private void FieldIdentifier(IModifiable node)
        {
            logger.LogDebug($"Field node: {node.Node}    Field Code: {node.Code} Is type null? ");

            if (node.GetFirstSingleLayer(Members.Type) != null)
            {
                node.SetNode(Members.Field);
                IModifiable modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                modSetNode.Parent = node;

                logger.LogDebug($"  True");
            }
            else
            {
                logger.LogDebug($"  False");
            }
        }

        /// <summary>
        /// Checks that a memberdeclaration node has a Type node in its children, thus being Field in a class
        /// </summary>
        /// <param name="answer"></param>
        private void MemberFieldIdentifier(IModifiable node)
        {
            if (node.GetFirstSingleLayer(Members.Type) != null)
            {
                List<INavigable> fieldNodeChildren = node.Children;
                node.DropChildren();
                IModifiable fieldNode = (IModifiable)NodeFactory.CreateNode(Members.Field, false);
                fieldNode.Parent = node;
                foreach (IModifiable child in fieldNodeChildren)
                {
                    child.Parent = fieldNode;
                }
            }
        }

        /// <summary>
        /// moves shiftOperator code into the Operator, which was a shiftExpression, in order to make way for Operator-handling code
        /// </summary>
        /// <param name="answer"></param>
        private void ShiftExpressionCompressor(IModifiable node)
        {
            List<INavigable> shiftExpressionChildren = node.Children;
            node.DropChildren();
            foreach (IModifiable child in shiftExpressionChildren)
            {
                if (child.Node.Equals("shiftOperator"))
                {
                    string operatorChar = String.Concat(child.Code.Where(c => !Char.IsWhiteSpace(c)));
                    node.AddCode(operatorChar, child);
                }
                else
                {
                    child.Parent = node;
                }
            }
        }

        /// <summary>
        /// Counts the number of space-separated operators used and pairs off child nodes to make Operator nodes more resemble the Java
        /// </summary>
        /// <param name="answer"></param>
        private void OperatorOrderer(IModifiable node)
        {
            List<String> operations = node.Code.Split(' ').ToList();
            while (operations.Count > 1)
            {
                IModifiable firstOperand = (IModifiable)node.GetNthChild(0);
                IModifiable secondOperand = (IModifiable)node.GetNthChild(1);
                node.RemoveChild(secondOperand);
                IModifiable operatorNode = (IModifiable)NodeFactory.CreateNode(Members.Operator, false);
                operatorNode.AddCode(operations[0], node);
                operations.RemoveAt(0);
                firstOperand.Parent = operatorNode;
                secondOperand.Parent = operatorNode;
                node.ReplaceChild(firstOperand, operatorNode);
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
            node.AddCode(operations[0], node);
        }

        /// <summary>
        /// Identifies constructors via the initializer node and moves the parameters into place
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructorIdentifier(IModifiable node)
        {
            if (node.GetAncestor("blockDeclaration") != null && node.GetAncestor("blockDeclaration").GetFirstSingleLayer(Members.Field) != null)
            {
                
                if (node.GetChildCount() == 0)
                {
                    ((IModifiable)node.Parent).RemoveChild(node);
                }
                else if (node.Code.Equals("( )"))
                {
                    node.SetNode(Members.ConstructorInvoke);
                    node.ClearCode(ClearCodeOptions.KeepLine);
                    node.CopyCode((IModifiable)node.GetAncestor("blockDeclaration").GetFirstRecursive(Members.TypeName));

                    IModifiable oldParent = (IModifiable)node.Parent;
                    IModifiable targetVariableNode = (IModifiable)((IModifiable)node.Parent).GetFirstRecursive(Members.MethodInvoke);
                    targetVariableNode.SetNode(Members.Variable);
                    IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                    writeNode.Parent = targetVariableNode;
                    node.Parent = writeNode;
                    oldParent.RemoveChild(node);
                }
            }
            else
            {
                if (node.GetFirstRecursive(Members.ParameterList) != null)
                {
                    IModifiable oldParent = (IModifiable)node.Parent;
                    node.Parent = node.Parent.GetFirstRecursive(Members.MethodInvoke);
                    oldParent.RemoveChild(node);
                }
            }
        }

        /// <summary>
        /// Converts newExpressions into ConstructorInvokes and their related nodes
        /// </summary>
        /// <param name="answer"></param>
        private void NewExpressionHandler(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.KeepLine);
            node.SetNode(Members.ArrayInvoke);
            //TODO: Include array length data
            if (node.GetChildCount() == 1)
            {
                if (node.GetFirstSingleLayer("bracedInitList") != null)
                {
                    IModifiable parameterList = (IModifiable)node.GetFirstSingleLayer("bracedInitList").GetFirstRecursive(Members.ParameterList);
                    node.GetFirstSingleLayer("newTypeId").GetFirstSingleLayer("noPointerNewDeclarator").GetNthChild(0).Parent = parameterList; //obj reference not set to an instance of an obj 
                    node.RemoveChild((IModifiable)node.GetFirstSingleLayer("newTypeId"));
                }
                else if (node.GetFirstSingleLayer(Members.TypeName) != null)
                {
                    ((IModifiable)node.GetFirstSingleLayer(Members.TypeName)).SetNode(Members.ConstructorInvoke);
                    if (node.GetFirstSingleLayer("newPlacement") != null)
                    {
                        IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                        writeNode.Parent = node.GetFirstSingleLayer("newPlacement").GetNthChild(0);
                        node.GetFirstSingleLayer(Members.ConstructorInvoke).Parent = writeNode;
                        node.RemoveChild((IModifiable)node.GetFirstSingleLayer(Members.ConstructorInvoke));
                        node.ReplaceChild((IModifiable)node.GetFirstSingleLayer("newPlacement"), (IModifiable)node.GetFirstSingleLayer("newPlacement").GetNthChild(0));
                    }
                    node.GetFirstRecursive("newInitializer").Parent = node.GetFirstRecursive(Members.ConstructorInvoke);
                    node.RemoveChild((IModifiable)node.GetFirstSingleLayer("newInitializer"));
                    ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
                }
                else if (node.GetFirstSingleLayer("newTypeId") != null)
                {
                    if (node.GetFirstSingleLayer("newTypeId").GetFirstSingleLayer("noPointerNewDeclarator") != null)
                    {
                        string name = node.GetFirstSingleLayer("newTypeId").GetFirstSingleLayer(Members.Primitive).Code;
                        name = name + " " + node.GetFirstSingleLayer("newTypeId").GetFirstSingleLayer("noPointerNewDeclarator").Code;
                        node.AddCode(name, node);

                        List<INavigable> children = node.GetFirstSingleLayer("newTypeId").GetFirstSingleLayer("noPointerNewDeclarator").Children;
                        node.DropChildren();
                        IModifiable paramList = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                        
                        foreach (INavigable child in children)
                        {
                            IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.Parameter, false);
                            child.Parent = param;
                            param.Parent = paramList;
                        }
                        paramList.Parent = node;
                    }
                }
            }
            else if (node.GetChildCount() == 2) 
            {
                IModifiable arr = (IModifiable)NodeFactory.CreateNode(Members.Array, false);

                List<INavigable> children = node.Children;
                IModifiable parent = (IModifiable)node.Parent;
                parent.DropChildren();
                arr.Parent = parent;

                foreach (INavigable child in children)
                {
                    if (child.GetFirstSingleLayer(Members.ParameterList) != null)
                    {
                        child.GetFirstSingleLayer(Members.ParameterList).Parent = arr;
                    }
                    else if (child.GetChildCount() == 1)
                    {
                        IModifiable paramList = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                        IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.Parameter, false);
                        child.GetNthChild(0).Parent = param;
                        param.Parent = paramList;
                        paramList.Parent = arr;
                    }
                    //Now I need this to be formatted as an array
                    if (parent.GetNthChild(0).GetFirstSingleLayer(Members.ParameterList) != null)
                    {
                        List<INavigable> arrChildren = parent.GetNthChild(0).GetFirstSingleLayer(Members.ParameterList).Children;
                        arr.DropChildren();
                        foreach (INavigable arrchild in arrChildren)
                        {
                            arrchild.GetNthChild(0).Parent = parent.GetNthChild(0);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Adds Fields and ModifierSets nodes if they're missing
        /// </summary>
        /// <param name="answer"></param>
        private void FieldRelevantNodeIncluder(IModifiable node)
        {
            if (!node.Parent.Node.Equals(MemberSets.Fields))
            {
                IModifiable oldParent = (IModifiable)node.Parent;
                List<INavigable> fieldSiblings = oldParent.Children;
                oldParent.DropChildren();
                IModifiable fieldsNode = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, false);
                fieldsNode.Parent = oldParent;
                foreach (IModifiable child in fieldSiblings)
                {
                    if (child.Node.Equals(Members.Field))
                    {
                        child.Parent = fieldsNode;
                    }
                    else
                    {
                        child.Parent = oldParent;
                    }
                }
            }
            if (node.GetFirstSingleLayer(MemberSets.ModifierSet) == null)
            {
                IModifiable modSetNode = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                modSetNode.Parent = node;
            }
        }

        /// <summary>
        /// Adds in Array nodes as appropriate
        /// </summary>
        /// <param name="answer"></param>
        private void LateNoPointerDeclaratorHandler(IModifiable node)
        {
            if (node.Code.Equals("[ ]"))
            {
                // TODO: attach arraySizeParameter to uninstantiated arrays in typedef
                //IModifiable arraySizeParameter = null;
                //if (node.GetChildCount() > 1)
                //{
                //    arraySizeParameter = (IModifiable)node.GetNthChild(1);
                //    node.RemoveChild(arraySizeParameter);
                //}
                if (node.GetFirstSingleLayer("literal") != null)
                {
                    List<INavigable> children = node.Children;
                    node.DropChildren();
                    //Array length data is being dropped here
                    foreach (INavigable child in children)
                    {
                        if (!child.Node.Equals("literal"))
                        {
                            child.Parent = node;
                        }
                    }
                }

                IModifiable targetNode = (IModifiable)node.GetFirstRecursive("bracedInitList");
                if (targetNode != null)
                {
                    List<INavigable> arrayNodes;
                    if (!targetNode.Parent.Node.Equals(Members.Write))
                    {
                        arrayNodes = targetNode.Parent.Parent.GetAllFirstLayer("initializerClause");
                        for (int i = 0; i < arrayNodes.Count; ++i)
                        {
                            arrayNodes[i] = arrayNodes[i].GetNthChild(0);
                        }
                    }
                    else
                    {
                        arrayNodes = targetNode.Parent.GetAllFirstLayer("bracedInitList");
                    }

                    foreach (IModifiable arrayNode in arrayNodes)
                    {
                        arrayNode.SetNode(Members.Array);
                        arrayNode.ClearCode(ClearCodeOptions.KeepLine);
                        if (arrayNode.GetChildCount() > 0)
                        {
                            if (arrayNode.GetNthChild(0).Node.Equals(Members.ParameterList))
                            {
                                ReparentChildren((IModifiable)arrayNode.GetNthChild(0));
                                List<INavigable> parameterNodes = arrayNode.GetAllFirstLayer(Members.Parameter);
                                foreach (IModifiable parameterNode in parameterNodes)
                                {
                                    arrayNode.ReplaceChild(parameterNode, (IModifiable)parameterNode.GetNthChild(0));
                                }
                            }
                        }
                        //if (arraySizeParameter != null)
                        //{
                        //    IModifiable parameterListExtra = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                        //    parameterListExtra.Parent = arrayNode;
                        //    arraySizeParameter.Parent = parameterListExtra;
                        //}
                    }
                }
                ((IModifiable)node.Parent).ReplaceChild(node, (IModifiable)node.GetNthChild(0));
            }
            else
            {
                errorMessages.Add("ERROR: Unsupported noPointerDeclarator code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Handles classKey nodes
        /// </summary>
        /// <param name="answer"></param>
        private void ClassKeyHandler(IModifiable node)
        {
            if (node.Code.Equals("class") || node.Code.Equals("struct") || node.Code.Equals("union"))
            {
                // structs are considered classes per BD's specification
                // unions are considered like structs per Vitaliy's never ending wisdom
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.SetNode(Members.CLASS);
            }
            else
            {
                errorMessages.Add("ERROR: Unsupported classKey code " + node + System.Environment.NewLine);
            }
        }

        /// <summary>
        /// Convenience function for TypeDeclarationMemberSetAdder, checks for the presence of a MemberSet and handles that
        /// </summary>
        /// <param name="answer"></param>
        private List<INavigable> MemberSetAdderConvenience(IModifiable node, List<INavigable> children, MemberSets memberSet, Members member)
        {
            IModifiable memberSetNode;
            if (children.Any(child => child.Node.Equals(memberSet)))
            {
                memberSetNode = (IModifiable)children.FirstOrDefault(child => child.Node.Equals(memberSet));
                children.Remove(memberSetNode);
            }
            else
            {
                memberSetNode = (IModifiable)NodeFactory.CreateNode(memberSet, false);
            }
            memberSetNode.Parent = node;

            if (children.Any(child => child.Node.Equals(member)))
            {
                var memberNodes = children.Where(child => child.Node.Equals(member));
                children = children.Except(memberNodes).ToList();
                foreach (IModifiable memberNode in memberNodes)
                {
                    memberNode.Parent = memberSetNode;
                }
            }
            return children;
        }

        /// <summary>
        /// Convenience function for TypeDeclarationMemberSetAdder, checks for the presence of a MemberSet and handles that
        /// </summary>
        /// <param name="answer"></param>
        private List<INavigable> MemberSetAdderConvenience(IModifiable node, List<INavigable> children, MemberSets memberSet)
        {
            // TODO: merge this and the prior function somehow
            // default of an ENUM is the first element, but I can't really control that easily here - I can't use null either
            // and, I can't call easily one function within the other to simplfy things since the other one needs the children and memberSetNode from here
            // possibly temporary, but we all know how that goes

            IModifiable memberSetNode;
            if (children.Any(child => child.Node.Equals(memberSet)))
            {
                memberSetNode = (IModifiable)children.FirstOrDefault(child => child.Node.Equals(memberSet));
                children.Remove(memberSetNode);
            }
            else
            {
                memberSetNode = (IModifiable)NodeFactory.CreateNode(memberSet, false);
            }
            memberSetNode.Parent = node;

            return children;
        }
        /// <summary>
        /// Convenience function for TypeDeclarationMemberSetAdder, Handles all TypeDefs
        /// </summary>
        /// <param name="answer"></param>
        private void HandleTypeDefs(IModifiable node)
        {
            if (!(node.GetFirstSingleLayer(MemberSets.Classification).GetChildCount() == 0))
            {
                return;
            }
            IModifiable typedef = (IModifiable)NodeFactory.CreateNode(Members.NAMESPACE, false);
            typedef.Parent = node.GetFirstSingleLayer(MemberSets.Classification);

            if (node.GetFirstSingleLayer(MemberSets.SuperTypes) != null)
            {
                if (node.GetFirstSingleLayer(MemberSets.SuperTypes).GetFirstSingleLayer(Members.SuperType).Code == "")
                {
                    IModifiable superType = (IModifiable)node.GetFirstSingleLayer(MemberSets.SuperTypes).GetFirstSingleLayer(Members.SuperType);
                    superType.AddCode("typedef", superType);

                    IModifiable target = (IModifiable)node.GetFirstSingleLayer(MemberSets.SuperTypes).GetFirstRecursive(Members.TypeDeclaration);
                    if (target != null)
                    {
                        foreach (INavigable child in target.Children)
                        {
                            if (child.Node.Equals("classHead"))
                            {
                                continue;
                            } else if (child.Node.Equals(MemberSets.Classification))
                            {
                                ((IModifiable)node.GetFirstSingleLayer(MemberSets.Classification)).DropChildren();
                            }
                            foreach (INavigable kid in child.Children)
                            {
                            kid.Parent = node.GetFirstSingleLayer(child.Node.GetMemberSets());
                            }
                        }
                    }
                    superType.DropChildren();
                    IModifiable enumType = (IModifiable)NodeFactory.CreateNode(Members.TYPEDEF, false);
                    enumType.Parent = superType;
                }
            }
        }
        /// <summary>
        /// Adds all MemberSets to TypeDeclaration nodes as required
        /// Also adds TYPEDEFS
        /// </summary>
        /// <param name="answer"></param>
        private void TypeDeclarationMemberSetAdder(IModifiable node)
        {
            //TODO: add Destructor nodes to something...
            List<INavigable> children = node.Children;
            node.DropChildren();

            // TODO: not sure how all of these are handled quite yet
            // v
            children = MemberSetAdderConvenience(node, children, MemberSets.ModifierSet);
            children = MemberSetAdderConvenience(node, children, MemberSets.Classification);
            // ^
            children = MemberSetAdderConvenience(node, children, MemberSets.SuperTypes, Members.SuperType);
            // v
            children = MemberSetAdderConvenience(node, children, MemberSets.Enumerations);
            // ^
            children = MemberSetAdderConvenience(node, children, MemberSets.Constructors, Members.Constructor);
            children = MemberSetAdderConvenience(node, children, MemberSets.Methods, Members.Method);
            children = MemberSetAdderConvenience(node, children, MemberSets.Types, Members.TypeDeclaration);
            children = MemberSetAdderConvenience(node, children, MemberSets.Values, Members.Value);
            // v
            children = MemberSetAdderConvenience(node, children, MemberSets.Inlines);
            // ^
            children = MemberSetAdderConvenience(node, children, MemberSets.Fields, Members.Field);
            foreach (IModifiable remainder in children)
            {
                remainder.Parent = node;
            }

            //Handles TYPEDEF
            HandleTypeDefs(node);
        }

        /// <summary>
        /// Moves Destructor nodes into the Methods node, since I was too lazy to find any kind of solution using TypeDeclarationMemberSetAdder directly
        /// </summary>
        /// <param name="answer"></param>
        private void DestructorMover(IModifiable node)
        {
            IModifiable oldParent = (IModifiable)node.Parent;
            oldParent.RemoveChild(node);
            node.Parent = oldParent.GetFirstSingleLayer(MemberSets.Methods);
        }

        /// <summary>
        /// Rearranges all sorts of nodes when a typedef is found, in order to make them into TypeDeclarations
        /// </summary>
        /// <param name="answer"></param>
        private void TypedefHandler(IModifiable node)
        {
            if (node.Code.Equals("typedef"))
            {
                IModifiable seqNode = (IModifiable)node.Parent;
                seqNode.RemoveChild(node);
                IModifiable typeDeclNode = (IModifiable)seqNode.Parent.GetNthChild(1).GetFirstRecursive(Members.Variable);
                typeDeclNode.SetNode(Members.TypeDeclaration);
                ((IModifiable)seqNode.Parent).RemoveChild((IModifiable)seqNode.Parent.GetNthChild(1));
                IModifiable superTypeNode = (IModifiable)NodeFactory.CreateNode(Members.SuperType, false);
                superTypeNode.Parent = typeDeclNode;
                ((IModifiable)seqNode.Parent).RemoveChild(seqNode);
                seqNode.Parent = superTypeNode;
                if (typeDeclNode.GetAncestor("statement") != null)
                {
                    ((IModifiable)typeDeclNode.GetAncestor("statement")).ReplaceChild((IModifiable)typeDeclNode.GetAncestor("declarationStatement"), typeDeclNode);
                }
                else
                {
                    ((IModifiable)typeDeclNode.GetAncestor("declaration")).ReplaceChild((IModifiable)typeDeclNode.GetAncestor("declaration").GetNthChild(0), typeDeclNode);
                }
            }
        }

        /// <summary>
        /// Converts the constructor's member initializer list into a MethodScope and Write nodes
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructorInitializerHandler(IModifiable node)
        {
            // making an executive decision on how to represent these original AST nodes as SQM nodes
            ReparentChildren((IModifiable)node.GetNthChild(0));
            List<INavigable> children = node.Children;
            node.DropChildren();
            foreach (IModifiable child in children)
            {
                // making assumptions about the nature of member initializer lists since I don't fully understand them
                child.ReplaceChild((IModifiable)child.GetFirstSingleLayer("meminitializerid"), (IModifiable)child.GetFirstSingleLayer("meminitializerid").GetFirstRecursive(Members.TypeName));
                IModifiable firstVariable = (IModifiable)child.GetFirstSingleLayer(Members.TypeName);
                firstVariable.SetNode(Members.Variable);
                firstVariable.Parent = node;
                if (child.GetChildCount() > 1)
                {
                    IModifiable parameterListNode = (IModifiable)child.GetNthChild(1).GetFirstRecursive(Members.ParameterList);
                    if (parameterListNode != null && parameterListNode.GetFirstRecursive(Members.Parameter) != null)
                    {
                        // there's a weird case in blend2d's thread.cpp on line 68 in the unprocessed file, idk wtf i'm expected to do for handle there
                        // but that case is why this stuff is all up in this if statement
                        IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                        writeNode.Parent = firstVariable;
                        IModifiable parentNode = writeNode;

                        if (parameterListNode.GetChildCount() > 1)
                        {
                            parentNode = (IModifiable)NodeFactory.CreateNode(Members.Array, false);
                            parentNode.Parent = writeNode;
                        }

                        List<INavigable> paramChildren = parameterListNode.Children;
                        foreach (IModifiable paramChild in paramChildren)
                        {
                            paramChild.GetNthChild(0).GetNonTrivialChild().Parent = parentNode;
                        }
                    }

                    child.RemoveChild((IModifiable)child.GetNthChild(1));
                }
            }
        }

        /// <summary>
        /// Turns the relevant enumeratorDefinition nodes into Write nodes
        /// </summary>
        /// <param name="answer"></param>
        private void EnumeratorDefinitionHandler(IModifiable node)
        {
            if (node.Code.Equals("="))
            {
                node.SetNode(Members.Write);
                IModifiable futureParent = (IModifiable)node.GetNthChild(0);
                node.RemoveChild(futureParent);
                ((IModifiable)node.Parent).ReplaceChild(node, futureParent);
                node.Parent = futureParent;
            }
        }

        /// <summary>
        /// Converts the delete keyword nodes into a DotOperator/MethodInvoke sequence
        /// </summary>
        /// <param name="answer"></param>
        private void DeleteHandler(IModifiable node)
        {
            node.ClearCode(ClearCodeOptions.KeepLine);
            node.AddCode("~DESTRUCTOR", node);
            IModifiable futureParent = (IModifiable)node.GetNthChild(0);
            ((IModifiable)node.Parent).ReplaceChild(node, futureParent);
            node.DropChildren();
            IModifiable dotNode = (IModifiable)NodeFactory.CreateNode(Members.DotOperator, false);
            dotNode.Parent = futureParent;
            node.Parent = dotNode;
            IModifiable paramList = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
            paramList.Parent = node;
        }

        /// <summary>
        /// Checks that no TypeName node has a Parameter node as its direct parent, since this shouldn't happen
        /// ANTLR wrongly assigns what ought to be a Variable as a TypeName somehow
        /// </summary>
        /// <param name="answer"></param>
        private void TypeNameParameterCheck(IModifiable node)
        {
            if (node.Parent.Node.Equals(Members.Parameter))
            {
                node.SetNode(Members.Variable);
            }
        }

        /// <summary>
        /// Adds a default namespace node to the top of the file
        /// </summary>
        /// <param name="answer"></param>
        private void FileDefaultNamespaceAdder(IModifiable node)
        {
            List<INavigable> children = node.Children;
            node.DropChildren();
            IModifiable namespaceNode = (IModifiable)NodeFactory.CreateNode("namespaceDefinition", false);
            namespaceNode.AddCode("~DEFAULT", namespaceNode);
            namespaceNode.Parent = node;
            foreach (IModifiable child in children)
            {
                child.Parent = namespaceNode;
            }
        }

        /// <summary>
        /// Converts namespaceDefinitions into TypeDeclarations and includes the bare minimum MemberSets
        /// </summary>
        /// <param name="answer"></param>
        private void NamespaceHandler(IModifiable node)
        {
            IModifiable classificationNode = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
            classificationNode.Parent = node;
            IModifiable namespaceNode = (IModifiable)NodeFactory.CreateNode(Members.NAMESPACE, false);
            namespaceNode.Parent = classificationNode;
            IModifiable superTypesNode = (IModifiable)NodeFactory.CreateNode(MemberSets.SuperTypes, false);
            superTypesNode.Parent = node;
            IModifiable namespaceSuperTypeNode = (IModifiable)NodeFactory.CreateNode(Members.SuperType, false);
            namespaceSuperTypeNode.AddCode("namespace", node);
            namespaceSuperTypeNode.Parent = superTypesNode;
            namespaceNode.Clone().Parent = namespaceSuperTypeNode;
        }

        /// <summary>
        /// Moves Import nodes up to the File node
        /// </summary>
        /// <param name="answer"></param>
        private void ImportMover(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor(Members.File);
            ((IModifiable)node.Parent).RemoveChild(node);
            node.Parent = target;
        }

        /// <summary>
        /// Reorganizes nodes that should include ConstructorInvokes
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructorInvokeCheck(IModifiable node)
        {
            //TODO: figure out how to handle forward declarations, since they can break with this...
            IModifiable potentialNode = (IModifiable)node.GetFirstSingleLayer(Members.MethodInvoke);
            if (potentialNode != null)
            {
                List<INavigable> children = potentialNode.Children;
                potentialNode.DropChildren();
                potentialNode.SetNode(Members.Variable);
                IModifiable writeNode = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                writeNode.Parent = potentialNode;
                IModifiable constructorInvokeNode = (IModifiable)NodeFactory.CreateNode(Members.ConstructorInvoke, false);
                constructorInvokeNode.CopyCode((IModifiable)node.GetFirstSingleLayer(Members.Type).GetNthChild(0));
                constructorInvokeNode.Parent = writeNode;
                foreach (IModifiable child in children)
                {
                    child.Parent = constructorInvokeNode;
                }
            }
        }

        /// <summary>
        /// Removes nodes resulting from Method forward declaration
        /// </summary>
        /// <param name="answer"></param>
        private void ForwardDeclarationRemover(IModifiable node)
        {
            //((node.GetFirstRecursive("declarator") != null && node.GetFirstRecursive("declarator").GetNthChild(0).Node.Equals(Members.MethodInvoke)) || node.GetFirstRecursive("elaboratedTypeSpecifier") != null)
            if (node.Parent.Node.Equals("declaration") &&
                node.GetNthChild(0).Node.Equals(Members.Field) &&
                node.GetFirstRecursive("declarator") != null &&
                node.GetFirstRecursive("declarator").GetNthChild(0).Node.Equals(Members.MethodInvoke))
            {
                ((IModifiable)node.Parent.Parent).RemoveChild((IModifiable)node.Parent);
            }
        }

        /// <summary>
        /// Removes Methods which are declared "= delete"
        /// </summary>
        /// <param name="answer"></param>
        private void FunctionDeleteDeleter(IModifiable node)
        {
            if (node.Code.Equals("= delete ;"))
            {
                if (node.Parent.Parent.Node.Equals("memberdeclaration"))
                {
                    SeverBranch((IModifiable)node.Parent.Parent);
                }
                else
                {
                    SeverBranch((IModifiable)node.Parent);
                }
            }
        }

        /// <summary>
        /// Renames Field nodes to be the same as the relevant variable
        /// </summary>
        /// <param name="answer"></param>
        private void FieldNamer(IModifiable node)
        {
            // TODO:? probably should merge this with some other code and remove this
            if (node.GetFirstSingleLayer(Members.Variable) != null)
            {
                // the if is there to handle the <...> i found in a try-catch for
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.CopyCode((IModifiable)node.GetFirstSingleLayer(Members.Variable));
            } else
            {
                //Assuming it is always an object
                IModifiable var = (IModifiable)NodeFactory.CreateNode(Members.Variable, false);
                var.AddCode("obj", var);
                var.Parent = node;
                node.CopyCode((IModifiable)node.GetFirstSingleLayer(Members.Variable));
            }
        }

        /// <summary>
        /// Renames Parameter nodes to be the same as the relevant variable
        /// </summary>
        /// <param name="answer"></param>
        private void ParameterNamer(IModifiable node)
        {
            // TODO:? probably should merge this with some other code and remove this
            if (node.GetFirstSingleLayer(Members.Variable) != null && (node.Parent.Parent.Node.Equals(Members.Method) || node.Parent.Parent.Node.Equals(Members.Constructor)))
            {
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.CopyCode((IModifiable)node.GetFirstSingleLayer(Members.Variable));
            }
        }

        /// <summary>
        /// Merges multiple MethodScope nodes under a functionBody node into one - primarily for handling certain constructor member initializer lists
        /// </summary>
        /// <param name="answer"></param>
        private void MultipleMethodScopeCombiner(IModifiable node)
        {
            IModifiable newMethodScopeNode = (IModifiable)NodeFactory.CreateNode(Members.MethodScope, false);
            foreach (IModifiable scope in node.GetAllFirstLayer(Members.MethodScope))
            {
                foreach (IModifiable child in scope.Children)
                {
                    child.Parent = newMethodScopeNode;
                }
            }
            node.DropChildren();
            newMethodScopeNode.Parent = node;
        }
        /// <summary>
        /// Replaces the  scope resolution operator '::'.
        /// Currently, LHS is turned into namespace and last node on RHS is turned into MethodInvoke
        /// </summary>
        /// <param name="answer"></param>
        private void ScopeResolutionOperator (IModifiable node)
        {
            if (!node.Code.Contains("::") && !node.Code.Equals("~"))
            {
                return;
            }
            if (node.Code.Equals("~"))
            {
                node.SetNode(Members.Operator);
                IModifiable nodeChild = (IModifiable)node.GetNthChild(0);
                nodeChild.SetNode(Members.Variable);
                return;
            }
            string code = node.Code;
            List<INavigable> children = node.Children;
            node.DropChildren();
            IModifiable parent = (IModifiable)node.Parent;
            parent.RemoveChild(node);
            parent.ClearCode(ClearCodeOptions.KeepLine);
            IModifiable refr = node;
            string temp;
            int ind;
            int i = 0;
            int occurances = Regex.Matches(code, "::").Count;

            while (i < occurances)
            {
                ind = code.IndexOf(':');
                if (code[ind + 1] == ':')
                {
                    if (ind - 1 >= 0)
                    {
                        temp = code.Substring(0, ind - 1);
                        code = code.Remove(0, ind + 3);
                    }
                    else
                    {
                        temp = "GLOBAL";
                        code = code.Remove(0, ind + 3);
                    }
                    IModifiable nameS= (IModifiable)NodeFactory.CreateNode(Members.Variable, false);
                    nameS.AddCode(temp, nameS);
                    nameS.SetLine(node);
                    if (i == 0)
                    {
                        nameS.Parent = parent;
                        IModifiable dotOp = (IModifiable)NodeFactory.CreateNode(Members.DotOperator, false);
                        dotOp.Parent = nameS;
                        refr = dotOp;
                    }
                    else
                    {
                        nameS.Parent = refr;
                        IModifiable dotOp = (IModifiable)NodeFactory.CreateNode(Members.DotOperator, false);
                        dotOp.Parent = nameS;
                        refr = dotOp;
                    }
                } else
                {
                    throw new ArgumentException("Unexpected scope resolution operator structure for: " + node);
                }
                i++;
            }
            node.ClearCode(ClearCodeOptions.KeepLine);
            node.AddCode(code, node);
            node.Parent = refr;

            foreach (INavigable child in children)
            {
                child.Parent = node;
            }
        }
        /// <summary>
        /// Removes function operator nodes and renames the method to the operator
        /// </summary>
        /// <param name="answer"></param>
        private void FunctionOperatorCorrector (IModifiable node)
        {
            if (node.Parent.Node.Equals(Members.Method))
            {
                IModifiable parent = (IModifiable)node.Parent;
                string code = node.GetNthChild(0).Code;
                parent.AddCode(code, node);
                parent.RemoveChild(node);
            }
            else
            {
                throw new ArgumentException("Unexpected parent for function operator: " + node);
            }
        }
        /// <summary>
        /// Creates a field based off a list of elements
        /// Elements usually include type and variable
        /// </summary>
        /// <param name="answer"></param>
        private IModifiable FieldMaker(List<INavigable> elements)
        {
            IModifiable Field = (IModifiable)NodeFactory.CreateNode(Members.Field, false);
            IModifiable modSet = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            modSet.Parent = Field;
            foreach (INavigable element in elements)
            {
                if (element.Node.Equals(Members.Type))
                {
                    element.Parent = Field;
                }
                else if (element.Node.Equals(Members.Variable))
                {
                    element.Parent = Field;
                }
                else //This could be something like literal or methodInvoke
                {
                    IModifiable write = (IModifiable)NodeFactory.CreateNode(Members.Write, false);
                    write.AddCode("=", write);
                    element.Parent = write;
                    write.Parent = Field;
                }
            }
            Field.GetFirstSingleLayer(Members.Write).Parent = Field.GetFirstSingleLayer(Members.Variable);
            Field.RemoveChild((IModifiable)Field.GetFirstSingleLayer(Members.Write));
            return Field;
        }
        /// <summary>
        /// Reworks boolean expressions with 3 elements
        /// </summary>
        /// <param name="answer"></param>
        private void ThreeBoolCorrector (IModifiable node)
        {
            List<INavigable> children = node.Children;
            foreach (INavigable child in children)
            {
                if (!child.Node.Equals(Members.Variable))
                {
                    node.RemoveChild((IModifiable)child);
                }
            }
            IModifiable Field = FieldMaker(children);
            if (node.GetFirstSingleLayer(MemberSets.Fields) != null)
            {
                Field.Parent = node.GetFirstSingleLayer(MemberSets.Fields);
            }
            else
            {
                IModifiable Fields = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, false);
                Fields.Parent = node.Parent;
                Field.Parent = Fields;
            }
            IModifiable var1 = (IModifiable)NodeFactory.CreateNode(Members.Variable, false);
            var1.AddCode(node.GetFirstSingleLayer(Members.Variable).Code, (IModifiable)node.GetFirstSingleLayer(Members.Variable));
            node.RemoveChild((IModifiable)node.GetFirstSingleLayer(Members.Variable));
            var1.Parent = node;
        }

        /// <summary>
        /// Reorganizes boolean expressions in while and if statements.
        /// </summary>
        /// <param name="answer"></param>
        private void BooleanCorrector (IModifiable node)
        {
            if (node.GetChildCount() == 3)
            {
                ThreeBoolCorrector(node);
            }
            else if (node.GetFirstSingleLayer(Members.Variable) != null && node.GetChildCount() == 1)// Case of assignment
            {
                if (node.GetFirstSingleLayer(Members.Variable).GetFirstSingleLayer(Members.Write) != null)
                {
                    IModifiable var1 = (IModifiable)node.GetFirstSingleLayer(Members.Variable);
                    IModifiable var2 = (IModifiable)NodeFactory.CreateNode(Members.Variable, false);
                    var2.AddCode(var1.Code, var1);
                    node.RemoveChild(var1);
                    var2.Parent = node;
                    var1.Parent = node.Parent.Parent;
                }
            }
        }
        /// <summary>
        /// Handles decltypeSpecifier nodes that actually deal with the decltype specifier
        /// Currently just renames the node and drops all children
        /// </summary>
        /// <param name="answer"></param>
        private void DecltypeHandler(IModifiable node)
        {
            if (node.Code.Equals("decltype ( )"))
            {
                node.DropChildren();
                node.SetNode(Members.TypeName);
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.AddCode("~DECLTYPE", node);
            }
        }

        /// <summary>
        /// Moves TypeDeclaration nodes up if they aren't already in some other TypeDeclaration's Types node or under the File node - for "local classes" defined in weird locations, like MethodScopes
        /// Currently just renames the node and drops all children
        /// </summary>
        /// <param name="answer"></param>
        private void TypeDeclarationMover(IModifiable node)
        {
            if (node.Parent.Node.Equals(Members.File))
            {
                return;
            }
            else if (!node.Parent.Node.Equals(MemberSets.Types))
            {
                IModifiable oldParent = (IModifiable)node.Parent;
                IModifiable targetNode = oldParent;
                while (targetNode.GetFirstSingleLayer(MemberSets.Types) == null)
                {
                    targetNode = (IModifiable)targetNode.Parent;
                }
                node.Parent = targetNode.GetFirstSingleLayer(MemberSets.Types);
                oldParent.RemoveChild(node);
            }
        }
 
         /// <summary>
        /// Deletes a node and all children
        /// </summary>
        /// <param name="answer"></param>
        private void SeverBranch(IModifiable node)
        {
            // not sure if there's an existing alternative
            // remove if there is
            ((IModifiable)node.Parent).RemoveChild(node);
        }
    }
}