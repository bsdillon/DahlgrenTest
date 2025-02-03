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
    class JavaANTLR : ANTLRTool
    {
        public JavaANTLR() : base(new JavaLanguage(), CrossCutting.GetLogger(typeof(JavaANTLR)))
        {
            classType = new Regex(@"^.+\.class$");
            stringType = new Regex("^\".*\"$");
            boolType   = new Regex(@"^(true|false)$");
            intType    = new Regex(@"^-?(\d(_+\d+)?|0(x|b)([a-f]|[A-F]|[0-9]|((\d|[a-f]|[A-F])+_+(\d|[a-f]|[A-F])+)?){1,8})+$");
            longType   = new Regex(@"^-?((\d(_+\d+)?)+|(0(x|X)([a-f]|[A-F]|[0-9]|((\d|[a-f]|[A-F])+_+(\d|[a-f]|[A-F])+))+))(L|l)$");
            floatType  = new Regex(@"^-?(\d+(_+\d+)?(\.(\d)*(_\d+)?)?|\.\d+(_\d+)?)((E|e)-?\d+)?(F|f)$");
            doubleType = new Regex(@"^-?(\d+(_+\d+)?(\.\d*(_+\d+)?)?|\d*\.\d*)((e|E)(-|\+)?\d+)?(D|d)?$");
            charType   = new Regex(@"^'(((\\)?.+|\\u([node-f]|[A-F]|[0-9]){4})|\\[0-7]{3})'$");
        }

        //see implementation in ITool
        public override ITool Clone()
        {
            return new JavaANTLR();
        }

        protected override INavigable findFirstType(IModifiable head)
        {
            return head.GetFirstRecursive("typeDeclaration");
        }

        protected override void ModifyTree()
        {
            //rename several nodes to improve readability
            head.Rename("primitiveType", Members.Primitive);
            head.Rename("classOrInterfaceModifier", "modifier");
            head.Rename("variableModifier", "modifier");
            head.Rename("modifier", "modifier");
            head.Rename("identifier", Members.Variable);
            head.RootUpModify("enumDeclaration", "enumDeclaration", EnumBodyInserter); // reformats the body of an enum declaration
            head.RootUpModify("methodCall", Members.MethodInvoke, MethodInvokeModifer); //identifies the "variable" name as a MethodInvoke

            //modify and simplify the structure
            //Dependencies may exist in this list so order is important
            head.RootUpModify("classOrInterfaceType", Members.TypeName, TypeNameModifier); //consolidates x.y.z type names as a tree into a single node
            head.CodeModify(AssertModifier); //simple rename on Assert statements
            head.RootUpModify("literal", Members.Literal, LiteralModifier); //translates any literal value e.g. "1.23" into a "Literal", appending a Type child node with the right type name
            head.RootUpModify("annotationTypeDeclaration", "annotationTypeDeclaration", RemoveAnnotationModifier); //no op; actually an error; should not be found in tree
            head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", StaticMethodModifier1);
            head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", InlineCodeModifier); // if a scope {} exists, it changes the type to Inline
            head.RootUpModify("creator", "creator", AnonymousClassConstructor); //Find and alter any anonymous class construction
            head.RootUpModify("methodBody", "methodBody", HiddenClassModifier); //It is my opinion that neither of these lines does anything anymore.
            head.RootUpModify("constructorBody", "constructorBody", HiddenClassModifier); //It is my opinion that neither of these lines does anything anymore.
            head.RootUpModify("classBodyDeclaration", "classBodyDeclaration", EmptyDeclarationRemover); // removes any empy declarations e.g. ;
            head.RootUpModify("annotation", Members.Annotation, AnnotationModifier); //TODO need to figure out how this applies to various annotation types
            head.RootUpModify("constantDeclarator", "variableDeclarator", ConstantModifier);
            head.RootUpModify("variableDeclaratorId", Members.Variable, ReparentOnFirstChild); // In this case it simply collapses a layer
            head.RootUpModify("statement", "statement", StatementModifier); //TODO need to figure out the various statements
            head.RootUpModify("compilationUnit", Members.File, Unnatural); //Just a rename and tags the node as unnatural
            head.RootUpModify("packageDeclaration", Members.Package, PackageModifier); //TODO not entirely sure this is right, but have created packages
            head.RootUpModify("importDeclaration", Members.Import, ImportModifier); //TODO again, not entirely sure this is right.
            head.RootUpModify("block", Members.Scope, ClearCode);
            head.RootUpModify("typeType", "typeType", TypeArrayModifier);//TODO should this be typeType? or remain 'type'; seems to be fine....
            head.RootUpModify(Members.TypeName, Members.TypeName, TypeArrayModifier);
            head.RootUpModify("typeArguments", Members.Sub_Type, ClearCode);
            head.RootUpModify("typeArgument", "typeArgument", GenericTypeModifier); //looks for ? wildcards
            head.RootUpModify("typeArgumentsOrDiamond", "typeArgumentsOrDiamond", ClearCode);
            head.RootUpModify("formalParameters", Members.ParameterList, ParameterListModifier); // Goes through the list of parameters and uses FormatField
            head.RootUpModify("variableDeclarators", "variableDeclarators", ReparentChildren);
            head.RootUpModify("explicitGenericInvocation", "explicitGenericInvocation", GenericInvocationModifier); // TODO probably no longer in use
            head.RootUpModify("primary", Members.Variable, NestedExpressionModifier); // effectively collapses the expression into a return statement, list of expressions, etc.
            head.RootUpModify("variableDeclarator", "variableDeclarator", VariableDeclaratorModifier); //effectively collapses the variableDeclarator into just a variable.
            head.RootUpModify("fieldDeclaration", "fieldDeclaration", FieldModifier); //standardize format of fields in a collection
            head.RootUpModify("constDeclaration", "constDeclaration", FieldModifier); //standardize format of fields in a collection
            head.Rename("identifier", Members.Variable);

            head.RootUpModify("methodDeclaration", "droppingMethod", ClassMethodModifier); // creates a common format for method definitions
            head.RootUpModify("interfaceMethodDeclaration", "droppingMethod", InterfaceMethodModifier); // creates a common format for method definitions
            head.CodeModify(StaticMethodModifier2); //TODO appears to be OBE
            head.RootUpModify("constructorDeclaration", "droppingConstructor", ConstructorModifier); // creates a common format for method definitions
            head.RootUpModify("enumDeclaration", "droppingType", TypeModifier); //standardizes all class/enum/interface declarations
            head.RootUpModify("interfaceDeclaration", "droppingType", TypeModifier); //standardizes all class/enum/interface declarations
            head.RootUpModify("classDeclaration", "droppingType", TypeModifier); //standardizes all class/enum/interface declarations
            head.RootUpModify("enumConstants", "droppingConstants", enumModifier); // relocates the enumeration constants to Values set
            head.RootUpModify("innerCreator", Members.ConstructorInvoke, InnerConstructionModifier);
            head.RootUpModify("localVariableDeclaration", "droppingLocal", LocalVariableModifier); // ??? was localVariableDeclarationStatement, but maybe that is OBE
            head.RootUpModify("enhancedForControl", "enhancedForControl", ForEachModifier);
            head.RootUpModify("forControl", "forControl", ForThreePartModifier);
            head.RootUpModify("parExpression", "parExpression", WhileSwitchIfModifier);
            head.Collapse("expression");
            head.LeafDownModify("expression", "expression", ExpressionModifier);
            head.RootUpModify("creator", Members.ConstructorInvoke, ConstructionModifier);
            head.RootUpModify("arrayInitializer", Members.Array, ClearCode);
            head.RootUpModify("superSuffix", "droppingMethod", SuperMethodModifier);
            head.CodeModify(OtherDotModifier);
            head.CodeModify(InvertedExpressionModifier);
            head.CodeModify(SuperTypeModifier);
            head.RootUpModify(Members.Variable, Members.Variable, ThisModifier);
            head.Rename("typeIdentifier", Members.TypeName);
            head.RootUpModify("blockStatement", "blockStatement", ClearCode);

            //collapse unnecessary nodes
            head.Collapse("blockStatement");
            head.Collapse("expression");
            head.Collapse("type");
            // head.Collapse(Members.Variable); // Was this OBE?
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
    
        #region Common Operations
        /// <summary>
        /// Occurs in any case where a stray ';' exists.
        /// </summary>
        /// <param name="answer"></param>
        private void EmptyDeclarationRemover(IModifiable node)
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
            logger.LogError($"Annotation type discovered; {node}");
            throw new InvalidDataException("Annotation type discovered; " + node);
        }

        /// <summary>
        /// Identifies constant variables, which must be treated differently than parameters or fields
        /// </summary>
        /// <param name="node"></param>
        private void ConstantModifier(IModifiable node)
        {           
            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);
            throw new InvalidOperationException($"Not at all sure if constants are working");

            logger.LogDebug($"Input:\n{sb}");
            if (node.Code.EndsWith(" ="))
            {
                //constants always have a declarator which incorporates the = operation.

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
        /// Removes the { } from the enum and inserts an enumBodyDeclaration
        /// Apparently this was part of the original syntax, but not the current syntax
        /// </summary>
        private void EnumBodyInserter(IModifiable node)
        {
            if(node.Node.Equals("enumDeclaration"))
            {
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.AddCode("enum", node);

                //There may already be an enumBodyDeclarations node (if there are constructors, etc.)
                IModifiable existing = (IModifiable)node.GetFirstSingleLayer("enumBodyDeclarations");

                List<INavigable> children = node.Children;
                node.DropChildren();
                children[0].Parent = node; //this will be the NAME of the enum
                children.RemoveAt(0);

                if(existing != null)
                {
                    children.Remove(existing);
                    //Now add any children to the list.
                    List<INavigable> existing_children = existing.Children;
                    foreach(INavigable ec in existing_children)
                    {
                        children.Add(ec);
                    }
                }

                IModifiable body = (IModifiable)NodeFactory.CreateNode("enumBodyDeclarations", true);
                body.Parent = node;

                foreach(INavigable child in children)
                {
                    child.Parent = body;
                }
            }
        }

        private void MethodInvokeModifer(IModifiable node)
        {
            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);

            IModifiable methodChild = (IModifiable)node.GetNthChild(0);
            node.ClearCode(ClearCodeOptions.ClearAll);
            node.CopyCode(methodChild);
            node.RemoveChild(methodChild);

            IModifiable args = (IModifiable)node.Children[0];
            node.DropChildren();
            IModifiable pList = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
            pList.Parent = node;
            if (args.GetChildCount()>0)
            {
                IModifiable actualList = (IModifiable)args.Children[0];
                foreach (INavigable p in actualList.Children)
                {
                    p.Parent = pList;
                }
            }

            StringBuilder sb2 = new StringBuilder();
            node.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Changes a full type name e.g. "x.y.z" into a structure of expressions.
        /// </summary>
        /// <param name="typeName"></param>
        private void TypeNameModifier(IModifiable typeName)
        {
            if (typeName.Code.Contains("."))
            {
                //this type name is a compound of some number of packages
                //needs to be reformated

                //  input:
                //  typeType(-1): 
                //     classOrInterfaceType(12:9-15): . .  <----- should indicate the number of members n+1
                //        identifier(12:4-8): other
                //        identifier(12:10-14): Thing
                //        typeIdentifier(12:16-21): Second
                //        othernodes.....

                //  goal:
                //  typeType(-1): 
                //     TypeName(12:4-8): other
                //        expression(12:10-14): Thing
                //           Variable(12:16-21): Second
                //        othernodes.....

                int identifierCount = typeName.CodeCount;

                INavigable target = typeName.Parent;
                StringBuilder sb = new StringBuilder();
                target.PrintTreeText(sb);

                List<INavigable> children = typeName.Children;
                typeName.DropChildren();

                IModifiable last = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);

                List<IModifiable> stack = new List<IModifiable>();
                List<INavigable> others = new List<INavigable>();
                IModifiable first = null;
                foreach (INavigable child in children)
                {
                    if (child.Node.Equals(Members.Variable) || child.Node.Equals("typeIdentifier"))
                    {
                        if(first==null)
                        {
                            first = typeName;
                            first.ClearCode(ClearCodeOptions.ClearAll);
                            first.CopyCode((IModifiable)child);
                        }
                        else
                        {
                            //these are the types in the name
                            IModifiable n = (IModifiable)NodeFactory.CreateNode("expression", true);
                            n.CopyCode((IModifiable)child);
                            stack.Add(n);
                        }
                    }
                    else
                    {
                        //keep any other children
                        others.Add(child);
                    }
                }

                //Error checking. The recorded number of . . operations should match the stacked identifiers
                if (stack.Count!=identifierCount)
                {
                    throw new InvalidOperationException($"Stacked type (e.g. A.B.C) does not have the right number of identifiers\n{sb}");
                }

                stack[stack.Count-1].SetNode(Members.Variable);

                //add each element in the stack
                IModifiable current = first;
                string code = first.Code;
                foreach (IModifiable next in stack)
                {
                    code += ".";
                    code += next.Code;
                    // next.Parent = current;
                    // current = next;
                }
                first.ClearCode(ClearCodeOptions.KeepAll);
                first.AddCode(code, first);

                //add the children back onto the type name
                foreach (INavigable n in others)
                {
                    n.Parent = typeName;
                }

                StringBuilder sb2 = new StringBuilder();
                target.PrintTreeText(sb2);
                logger.LogDebug($"Input:\n{sb}\n\nOutput\n{sb2}");
            }
        }

        /// <summary>
        /// Uniformly formats fields for all types (catch, parameters, local, global, etc.).
        /// </summary>
        /// <param name="parent">The answer on which the set of fields has a scope. This will be populated with a Fields subnode for all fields defined in that scope.</param>
        /// <param name="assorted">The set of all nodes which are Variable, Modifier or a TypeName</param>
        /// <param name="fieldType">True for all local, general and catch fields, false for parameters</param>
        private void FormatField(IModifiable parent, List<INavigable> assorted, bool fieldType)
        {
            // Input
            //         ParameterList(19:19-25): ( ) <--- Parent
            //            formalParameterList(-1): 
            //               formalParameter(-1): <--- Field of interest
            // assorted[0] ---> typeType(-1): 
            //                     Primitive(19:20-22): int
            // assorted[1] ---> identifier(19:24-24): x
            //
            // Output
            // ParameterList: (19:19-25): ( )
            //    Parameter(19:24-24): x         <--- THIS IS PROBABLY THE ONLY NAME REQUIRED
            //       ModifierSet: (-1):          <--- none in this case
            //       Type: (-1): 
            //          Primitive(19:20-22): int <--- field type
            //       identifier(19:24-24): x     <--- field name

            // See below for methods. This is the right way to have the method name and likely the same for Field names
            // Method(10:4-9): static

            // Input
            //         classBody(7-50): { } <--- (super) parent
            //            classBodyDeclaration(-1): 
            //               modifier(-1): 
            // assorted[2] ---> modifier(8:4-9): static
            //               memberDeclaration(-1): 
            //                  fieldDeclaration(8:25-25): ; <--- Field of interest
            // assorted[0] --->    typeType(-1): 
            //                        Primitive(8:11-13): int
            // assorted[1] --->    Variable(8:15-24): classValue

            //         classBody(7-50): { } <--- (super) parent
            //            ... some other members ...
            //            Fields: (-1): <--- newly created set
            //               Field(8:15-24): classValue
            //                  ModifierSet: (-1): 
            //                     Static(-1):                <--- Modifier
            //                  Type: (-1):                   <--- Field Type
            //                     Primitive(8:11-13): int
            //                  Variable(8:15-24): classValue <--- Field Name

            //establish if the parent has a fieldset group and create it if it does not already exist
            IModifiable fieldset = (IModifiable)parent.GetFirstSingleLayer(MemberSets.Fields);
            if (fieldset == null && fieldType)
            {
                //no declarations have been made at this level
                fieldset        = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, false);
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
                if (child.Node.Equals("identifier") || child.Node.Equals(Members.Variable))
                {
                    //this just adds the parameters into a list so we can create separate fields for each one.
                    variables.Add(child);
                }
                else if (child.Node.Equals("modifier"))
                {
                    CreateModifier(child).Parent = mods;
                }
                else if (child.Node.IsModifier)
                {
                    //Different kind of modifier; one of several allowed modifiers
                    child.Parent = mods;
                }
                else
                {
                    //type only
                    if (child.Node.Equals("typeType"))
                    {
                        //this is not the type, but the parent of the type.
                        IModifiable sub = (IModifiable)child.GetNthChild(0);
                        sub.Parent = t;
                    }
                    else
                    {
                        child.Parent = t;
                        child.SetNode(Members.TypeName);
                    }
                }
            }

            for (int i = 1; i < variables.Count; i++) // TODO, does this even do anything?
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

            // TODO not sure if this is right or not. The variable is still here; why copy code?
            // variables[0].Parent = f;
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
            String  s = modifier.Code;
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
        /// Bumps the annotation node up to the level of the class member
        /// </summary>
        /// <param name="node"></param>
        private void AnnotationModifier(IModifiable node)
        {
            throw new InvalidOperationException("Not at all sure if annotations are working");
            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);

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
                logger.LogDebug($"Expected one annotation, found {node.GetNthChild(0).GetChildCount()}\n{sb}");
                throw new InvalidDataException($"Expected one annotation, found {node.GetNthChild(0).GetChildCount()}\n{sb}");
            }

            //set the modifier code
            foreach (INavigable n in notes[0].Children)
            {
                n.Parent = t;
                ((IModifiable)n).SetNode("modifier");
                INode temp = NodeFactory.CreateNode(Members.Annotation, false);
                ((IModifiable)temp).Parent = n;
            }

            StringBuilder sb2 = new StringBuilder();
            node.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOutput:\n{sb2}");

        }

        /// <summary>
        /// Keeps any modifiers associated with the targetNode answer, but as an extra bonus divorces all other children in that process.
        /// </summary>
        /// <param name="target"></param>
        private void FormatModifiers(IModifiable target)
        {
            //Disassociate the current children set so we can workOther with it in a foreach
            List<INavigable> children = target.Children;
            target.DropChildren();

            IModifiable set = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
            set.Parent      = target;
            set.SetLine(target);

            //reassert Modifiers to the class/interface only
            foreach (IModifiable child in children)
            {
                if (child.Node.Equals("modifier") && child.Code.Length == 0)
                {
                    //not an actual modifier, but contains a modifier
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
        /// Categorizes most statements as a specific type
        /// </summary>
        /// <param name="answer"></param>
        private void StatementModifier(IModifiable node)
        {
            if (node.Code.StartsWith("continue "))
            {
                throw new InvalidOperationException("Check on a continue statement");
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
                throw new InvalidOperationException("Check on a try statement");
                TryCatchModifier(node);
            }
            else if (node.Code.Equals("return ;"))
            {
                node.SetNode(Members.Return);
                node.ClearCode(ClearCodeOptions.KeepLine);
            }
            else if (node.Code.Equals("throw ;"))
            {
                throw new InvalidOperationException("Check on a throw statement");
                node.SetNode(Members.Exception);
                node.ClearCode(ClearCodeOptions.KeepLine);
            }
            else if (node.Code.EndsWith(":"))
            {
                throw new InvalidOperationException("Check on a ':' statement");
                string s = node.Code;
                s        = s.Substring(0, s.Length - 2);
                node.ClearCode(ClearCodeOptions.KeepLine);
                node.AddCode(s, node);
                node.SetNode(Members.Label);
            }
        }

        /// <summary>
        /// Formates the try-catch-finally block as a reasonable set of nodes in the tree
        /// Catches are sequential
        /// Catches and finally are parented off of try
        /// Catches contain their own parameters just as methods do in relation to the exception
        /// </summary>
        /// <param name="answer"></param>
        private void TryCatchModifier(IModifiable node)
        {
            IModifiable tryer = (IModifiable)node.GetNthChild(0);
            IModifiable tryChild;
            List<IModifiable> catchers = new List<IModifiable>();

            tryer.SetNode(Members.TryScope);
            tryer.ClearCode(ClearCodeOptions.KeepLine);

            tryChild = (IModifiable)node.GetFirstSingleLayer("catchClause");
            while (tryChild != null)//identifies multiple catch clauses
            {
                List<INavigable> children = tryChild.Children;
                tryChild.DropChildren();

                while (children[0].Node.Equals("modifier"))
                {
                    //if there is a modifier on the field it will interfere with the expected order of the catch block, etc.
                    //this moves it to the back of the set so it is still added as a modifier in FormatField, but has no effect
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

                //create a new variable with the name used in the catch block;
                IModifiable v = (IModifiable)NodeFactory.CreateNode(Members.Variable, true);
                //Code tokens are "catch" "(" exceptionName and ")"
                v.CopyCode(tryChild, 2);
                children.Add(v);

                FormatField(catcher, children, true);

                node.RemoveChild(tryChild);
                tryChild = (IModifiable)node.GetFirstSingleLayer("catchClause");
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
            // Input
            // Package(1:0-21): package ;
            //    qualifiedName(1:11-15): . .
            //       identifier(1:8-10): one
            //       identifier(1:12-14): two
            //       identifier(1:16-20): three
            //
            // Ouput:
            // Package(1:8-20): one.two.three
            // TODO - It is by no means certain that this is the right way to build a package.

            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);
            
            List<INavigable> children = node.Children;

            if (children.Count != 1)
            {
                logger.LogError($"Package does not have sufficient children at {node}:\n{sb}");
                throw new InvalidOperationException($"Package does not have sufficient children at {node}:\n{sb}");
            }

            node.DropChildren();
            node.ClearCode(ClearCodeOptions.ClearAll);

            List<INavigable> allChildren = children[0].Children;
            StringBuilder allPackage = new StringBuilder();
            foreach (INavigable child in allChildren)
            {
                if(allPackage.Length>0)
                {
                    allPackage.Append(".");
                }
                allPackage.Append(child.Code);
            }

            node.AddCode(allPackage.ToString(), (IModifiable)allChildren[0]);
            StringBuilder sb2 = new StringBuilder();
            node.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOuput:\n{sb2}");
        }

        /// <summary>
        /// Parses the string of space names for the endNode in an import and appends the * or class for this import
        /// </summary>
        /// <param name="answer"></param>
        private void ImportModifier(IModifiable node)
        {
            // Input:
            // Import(3:0-14): import . * ;
            //    qualifiedName(-1): 
            //       identifier(3:7-11): other


            // Ouput:
            // Import(3:7-13): other.*

            // Input:
            // Import(4:0-31): import static . * ;
            //    qualifiedName(4:19-19): .
            //       identifier(4:14-18): other
            //       identifier(4:20-28): SomeClass
            // Ouput:
            // Import(4:14-30): other.SomeClass.*
            //    ModifierSet: (-1): 
            //       Static(-1): 
            //TODO it is my belief that these are the right ways to make an import.

            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);

            //there will be one endNode name associated with it
            List<INavigable> children = node.Children;

            if (children.Count != 1)
            {
                errorMessages.Add("ERROR: Import does not have sufficient children at " + node + System.Environment.NewLine);
                node.PrintTreeText(errorMessages.Add);
            }

            node.DropChildren();

            StringBuilder packageNameBuilder = new StringBuilder();
            foreach(INavigable child in children[0].Children)
            {
                if(packageNameBuilder.Length>0)
                {
                    packageNameBuilder.Append(".");
                }
                packageNameBuilder.Append(child.Code);
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

                    //any parts found which are not . are a modifier of some sort
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
            node.AddCode(packageNameBuilder.ToString(), (IModifiable)children[0].Children[0]);

            StringBuilder sb2 = new StringBuilder();
            node.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOuput:\n{sb2}");
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
            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);
            throw new InvalidOperationException("Has not been refactored " + sb);

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
            if(node.Code.Equals("."))
            {
                IModifiable target = (IModifiable)node.Parent;
                StringBuilder sb = new StringBuilder();
                target.PrintTreeText(sb);

                //TODO resolve the similarities between this function and SplitExtendedName

                // //Two simple tests to determine if the answer being examined is inverted
                // if (node.Code.Length == 0 || !node.Code.Contains(' '))
                // {
                //     //no code or no space means not the right form
                //     return;
                // }
                // else if (!node.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)[0].Equals("."))
                // {
                //     //if the code is not of the form ". alpha" it is not an inverison
                //     return;
                // }

                List<IModifiable> set = new List<IModifiable>();
                set.Add(node);
                if (node.Node.Equals("expression"))
                {
                    node.SetNode(Members.Variable);//Need to find the "variable child and lose it.
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
                    dot.Parent      = temp;
                    set[i].Parent   = dot;
                    set[i].SimplifyCode(" .".ToCharArray());
                    temp.CodeModify(InvertedExpressionModifier);
                    temp = set[i];
                }

                //We need to find the Variable which is a child of the expression and STEAL it's code.
                IModifiable methodChild = (IModifiable)node.GetFirstSingleLayer(Members.MethodInvoke);
                IModifiable variableChild = (IModifiable)node.GetFirstSingleLayer(Members.Variable);
                node.ClearCode(ClearCodeOptions.ClearAll);
                if(variableChild!=null)
                {
                    node.CopyCode(variableChild);
                    node.RemoveChild(variableChild);
                }
                else if (methodChild!=null) // we didn't find a variable, so this may be a method call.
                {
                    node.CopyCode(methodChild);
                    node.RemoveChild(methodChild);
                    List<INavigable> mChildren = methodChild.Children;
                    methodChild.DropChildren();
                    foreach(INavigable mChild in mChildren)
                    {
                        mChild.Parent = node;
                    }
                }

                StringBuilder sb2 = new StringBuilder();
                target.PrintTreeText(sb2);
                logger.LogDebug($"Input\n{sb}\nOutput:\n{sb2}");
            }
        }

        /// <summary>
        /// Compresses two different forms of nested expressions based on the structure of the tree at this point
        /// </summary>
        /// <param name="answer"></param>
        private void NestedExpressionModifier(IModifiable node)
        {
            if ( node.Code.Length == 0)//node.Code.Equals("( )"))
            {
                //this is not a variable, this is a nested expression statement

                //there are three different things which might be in a nested statement.
                // * it might be on a return type
                // * it might part of an expresion list
                // * it might be part of another expression (i.e. nested)
                //
                //these can also be stacked on each other. The first goal is to 
                //determine what relationship these have with each other.
                //We want to identify the true root of the expression tree.

                INavigable returnLevel     = node.GetAncestor(Members.Return);
                INavigable expressionLevel = node.GetAncestor("expression");
                INavigable listLevel       = node.GetAncestor("expressionList");
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

                StringBuilder sb = new StringBuilder();
                target.PrintTreeText(sb);

                IModifiable child0 = (IModifiable) node.GetNthChild(0);
                if (child0.Node.Equals("identifier")) 
                {
                    //    expression(-1): <-- new parent
                    //       Variable(-1): <-- skipping
                    //          identifier(42:31-34): item <-- needs to be a Variable

                    child0.SetNode(Members.Variable);
                }
                target.ReplaceChild(directParent, child0);//reparent 

                StringBuilder sb2 = new StringBuilder();
                target.PrintTreeText(sb2);
                logger.LogDebug($"Input\n{sb}\nOutput:\n{sb2}");
            }
            else if (node.Code.Length == 0)
            {
                //this occurrs infrequently when an empty variable appears in a tree
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
            Regex boolean    = new Regex("\\|\\||&&|^<=|^<$|^>$|^>=|==|!=|!");
            Regex ops        = new Regex("/|\\*|\\+|\\-|\\%|^&$|^\\|$|> >|< <|\\^|~");

            if (node.Code.Equals("="))
            {
                AssignmentModifier(node);
            }
            else if (node.Code.Equals("( )"))
            {
                if (node.GetNthChild(0).Node.Equals("type") || node.GetNthChild(0).Node.Equals(Members.TypeName))
                {
                    StringBuilder sb = new StringBuilder();
                    node.PrintTreeText(sb);
                    throw new InvalidOperationException("Caste has not been refactored " + sb);
                    CasteModifier(node);
                }
                else
                {
                    StringBuilder sb = new StringBuilder();
                    node.PrintTreeText(sb);
                    throw new InvalidOperationException("Invoke Has not been refactored " + sb);
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
                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);
                throw new InvalidOperationException("Trianary has not been refactored " + sb);
                TrinaryModifier(node);
            }
            else if (node.Code.Equals("instanceof"))
            {
                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);
                throw new InvalidOperationException("Instance Of has not been refactored " + sb);
                //no structural change, just a name change
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
            //sometimes an assignment has a trivial parent so we ignore it
            //identifying the true targetNode will help us remove the trivial parent in the way.
            IModifiable target       = (IModifiable)node.GetNonTrivialParent();
            INavigable  directParent = node.GetDirectAncestorTo(target);
            List<INavigable> children  = node.Children;
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
                    //even in a nested write statement as in node=b=2; each level is handled separately
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

            target.ReplaceChild(node, variable);//move the variable up a level in the specific place of this answer;
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
            index.Parent      = variable;
            IModifiable indexValue = (IModifiable)children[1];
            indexValue.Parent      = index;

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
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

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
                        //scope
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
            IModifiable target        = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;
            target.DropChildren();

            target.ClearCode(ClearCodeOptions.KeepLine);
            target.SetNode(Members.Switch);

            IModifiable value = (IModifiable)NodeFactory.CreateNode(Members.Value, false);
            value.Parent      = target;

            IModifiable blocks = (IModifiable)NodeFactory.CreateNode(Members.Blocks, false);
            blocks.Parent      = target;

            foreach (IModifiable child in children)
            {
                if (child == node)
                {
                    //this is the parameter statement;
                    //Case 1: child is an expression; child within that is our value.
                    //Case 2: expression is a meaningful bit of code with relevant children.
                    //Case 1 will collapse. Case 2 will not. Keep the expression.

                    child.GetNthChild(0).Parent = value;
                }
                else
                {
                    IModifiable b = (IModifiable)NodeFactory.CreateNode(Members.Block, true);
                    b.Parent      = blocks;

                    IModifiable v = (IModifiable)NodeFactory.CreateNode(Members.Value, false);
                    v.Parent      = b;

                    IModifiable s = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                    s.Parent      = b;

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
        private void PrepareIf(IModifiable node, out IModifiable elseBranch) //Used for Java
        {
            List<INavigable> children2 = node.Children;
            IModifiable      target    = (IModifiable)node.Parent;
            List<INavigable> children  = target.Children;

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
            boolean.Parent      = node;
            children2[0].Parent = boolean;//reparent boolean expression

            //second child of parent is always the scope of the if branch
            IModifiable ifBranch = (IModifiable)NodeFactory.CreateNode(Members.Then, true);
            ifBranch.Parent      = node;

            //the Then statement takes one of three forms:
            // * statement-scope - this is the normal version from code like if(b) { doX() }
            // * statement-statementExpression - this is a non-scoped version which happens to include a method call
            //   as in if(b) doX()
            // * almost anything else which is not an expression as in if(b) break;
            //Because the choice of form is a style issue we have to account for all three forms.

            //Assume that thenChild is only some node without a scope
            IModifiable thenChild = (IModifiable)children[1];
            if (thenChild.Node.Equals("statement") && thenChild.Code.Length == 0)
            {
                //when a statement is found we have to dig to the next level
                thenChild = (IModifiable)thenChild.GetNthChild(0);
            }

            if (thenChild.Node.Equals(Members.Scope))
            {
                //thenChild is a scope so we can keep it as is
                thenChild.Parent = ifBranch;
            }
            else
            {
                //single statement needs a scope
                IModifiable scp = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                //scope
                scp.Parent = ifBranch;
                thenChild.Parent = scp;
            }

            elseBranch        = (IModifiable)NodeFactory.CreateNode(Members.Else, true);
            elseBranch.Parent = node;
            IModifiable elsescope = (IModifiable)NodeFactory.CreateNode(Members.ElseScope, true);
            elsescope.Parent      = elseBranch;
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
            IModifiable      target   = (IModifiable)node.Parent;
            List<INavigable> children = target.Children;
            if (children.Count < 3)
            {
                errorMessages.Add("ERROR: If-Else does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            IModifiable elseBranch;
            PrepareIf(node, out elseBranch);

            //examine the else branch for next recursive layer
            //this is a statement. Either the statement is parent to a Scope or it is
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
                //this is a statement directly representing else with no scope.
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
            //this is already in the tree structure we want for a locked variable
            List<INavigable> children = target.Children;

            target.ClearCode(ClearCodeOptions.KeepLine);
            target.SetNode(Members.SynchBlock);

            if (children.Count != 2)
            {
                errorMessages.Add("ERROR: Synchronize answer does not contain a locked value and block of execution\r\n");
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
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            // throw new InvalidOperationException("Has not been refactored " + sb);

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

            if (children[1].Node.Equals("statement") && children[1].Code.Length == 0)//normally a foreach has a statement which holds the scope
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

            IModifiable for1  = (IModifiable)NodeFactory.CreateNode(MemberSets.Fields, "", false);
            for1.Parent       = target;
            IModifiable for1a = (IModifiable)NodeFactory.CreateNode(Members.ForInitial, "", false);
            for1a.Parent      = target;
            IModifiable for2  = (IModifiable)NodeFactory.CreateNode(Members.Boolean, "", false);
            for2.Parent       = target;
            IModifiable for3  = (IModifiable)NodeFactory.CreateNode(Members.Update, "", false);
            for3.Parent       = target;
            IModifiable for3Scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, "", true);
            for3Scope.Parent      = for3;

            if (children2.Count < 1)
            {
                //this is a for with no portions. That is equivalent to "while(true)"

                IModifiable exp = (IModifiable)NodeFactory.CreateNode("expression", "", true);

                IModifiable lit = (IModifiable)NodeFactory.CreateNode(Members.Literal, true);
                lit.AddCode("true", node);

                IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, true);

                IModifiable t = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);
                t.AddCode("Boolean", lit);

                //by connecting these artificial nodes we create the single required boolean literal
                t.Parent    = type;
                type.Parent = lit;
                lit.Parent  = exp;
                children2.Add(exp);
            }

            if (children.Count < 2)
            {
                errorMessages.Add("ERROR: For loop does not have sufficient children nodes\r\n");
                target.PrintTreeText(errorMessages.Add);
                return;
            }

            //because a for loop can be missing either the init, update or both, 
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
                            throw new InvalidOperationException("Unknown field member " + c + " in a for3loop.");
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
                //this is a single line of a for loop
                scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, true);
                //scope
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
            throw new InvalidDataException("Probably no longer valid");
            //setting the type associated with the invoked method which is declared with a wildcard
            //We need to correctly reparent this so that the type relationship is still clear.

            IModifiable dotexpression = (IModifiable)node.Parent;//this is the dot operator which indicates the point of invocation
            IModifiable target        = (IModifiable)dotexpression.Parent;//point on which the exchange will take place

            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            List<INavigable> children = node.Children;//the children control the generic type relationship with this method

            //there are always two children: the type arguments and the method suffix 
            if (children.Count != 2)
            {
                logger.LogError($"Improperly formatted {sb}");
                throw new InvalidDataException($"Improperly formatted {sb}");
            }

            //the remainder is everything else in the chain which we don't want to disturb
            IModifiable remainder = (IModifiable)dotexpression.GetNthChild(0);

            //this expands the code of that child to indicate the . operator as well
            IModifiable methodSuffix = (IModifiable)children[1];
            string      code         = methodSuffix.Code;
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

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOuput:\n{sb2}");
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
        /// Takes methods which are called on a super type, alters their structure to reparent with
        /// the super as in all nested expressions and then calls the mothod modifier to finish.
        /// </summary>
        /// <param name="answer"></param>
        private void SuperMethodModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent.Parent;
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            throw new InvalidOperationException("Has not been refactored " + sb);

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
        /// Formats the structure of a method invoked (called) with actual parameters
        /// </summary>
        /// <param name="answer"></param>
        private void MethodInvokeModifier(IModifiable node)
        {
            node.SetNode(Members.MethodInvoke);
            IModifiable method = ((IModifiable)node.GetNthChild(0).GetNonTrivialChild());
            String      s      = method.Code;
            node.RemoveChild((IModifiable)node.GetNthChild(0));
            List<INavigable> argList = node.Children;
            node.DropChildren();
            node.ClearCode(ClearCodeOptions.ClearAll);

            if (s.Equals("this"))
            {
                //only occurs where a constructor is used as a prototype for a more complex constructor
                //this changes the meaning of the method invoke and no "new" is used in this case
                //other than that treat like any other method
                node.SetNode(Members.SelfConstructorInvoke);
            }

            //all methods have a name
            node.AddCode(s, method);

            //children of the method can only be chained accessors; 
            //maintain that chain so the next level can be assessed.
            foreach (IModifiable child in method.Children)
            {
                child.Parent = node;
            }

            //create the parameter list
            IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
            param.Parent      = node;
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
            INavigable parentClassBody  = node.GetAncestor("classBody");

            while (classDeclaration != null)
            {
                //TODO it is my belief that after AnonymousClassConstructor there is no other anonymous class.
                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);
                throw new InvalidOperationException($"Unexpectedly found anonymousclass {sb}");

                IModifiable block  = (IModifiable)classDeclaration.GetAncestor("block");
                IModifiable direct = (IModifiable)classDeclaration.GetDirectAncestorTo(block);
                block.RemoveChild(direct);

                IModifiable classBodyDeclaration = (IModifiable)NodeFactory.CreateNode("classBodyDeclaration", true);
                
                IModifiable memberDeclaration    = (IModifiable)NodeFactory.CreateNode("memberDeclaration", true);

                classBodyDeclaration.Parent = parentClassBody;
                memberDeclaration.Parent    = classBodyDeclaration;
                classDeclaration.Parent     = memberDeclaration;

                classDeclaration = (IModifiable)node.GetFirstRecursive("classDeclaration");
            }
        }

        /// <summary>
        /// Parse the static method for a class (i.e. the method which is run when the class
        /// is first referenced.
        /// </summary>
        /// <param name="node"></param>
        private void StaticMethodModifier1(IModifiable node)
        {
            if (node.Code.Equals("static"))
            {
                // Input
                // classBodyDeclaration(7:4-9): static
                //    block(7-9): { }
                //       other Nodes....
                //
                // Output
                // classBodyDeclaration(-1): 
                //    memberDeclaration(-1): 
                //       methodDeclaration(-1): 
                //          typeTypeOrVoid(7:4-7): void
                //          identifier(7:4-9): static
                //          formalParameters(7:4-6): ( )
                //          methodBody(-1): 
                //             block(7-9): { }
                //                other Nodes....

                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);

                //this is a static method. I want to reformat it to look like a normal method

                //get the block which belongs with the static method
                List<INavigable> methodBlock = node.Children;
                if (methodBlock.Count != 1 || !methodBlock[0].Node.Equals("block"))
                {
                    logger.LogError($"Static method has unexpected structure {sb}");
                    throw new InvalidOperationException($"Static method has unexpected structure {sb}");
                }
                node.DropChildren();

                //create the nodes which go into the new structure
                IModifiable declaration     = (IModifiable)NodeFactory.CreateNode("memberDeclaration", true);
                IModifiable methDeclaration = (IModifiable)NodeFactory.CreateNode("methodDeclaration", true);

                //          typeTypeOrVoid(11:4-7): void
                //          identifier(11:9-14): static
                IModifiable returnType = (IModifiable)NodeFactory.CreateNode("typeTypeOrVoid", true);
                returnType.AddCode("void", node);
                IModifiable methodIdentifier = (IModifiable)NodeFactory.CreateNode("identifier", true);
                methodIdentifier.AddCode("static", node);
                IModifiable paramaters = (IModifiable)NodeFactory.CreateNode("formalParameters", true);
                paramaters.AddCode("( )", node);
                IModifiable body = (IModifiable)NodeFactory.CreateNode("methodBody", true);
                node.ClearCode(ClearCodeOptions.ClearAll);

                //creat eht new structure
                declaration.Parent = node;
                methDeclaration.Parent = declaration;
                returnType.Parent = methDeclaration;
                methodIdentifier.Parent = methDeclaration;
                paramaters.Parent = methDeclaration;
                body.Parent = methDeclaration;
                methodBlock[0].Parent = body;

                StringBuilder sb2 = new StringBuilder();
                node.PrintTreeText(sb2);

                logger.LogDebug($"Input:\n{sb}\n\nOuput:\n{sb2}");
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
            throw new InvalidOperationException("Need to identify any code that hits InlineCodeModifier");

            node.SetNode(Members.Inline);
        }

        /// <summary>
        /// Searches for any constructor and modified Anonymous class types
        /// </summary>
        /// <param name="node"></param>
        private void AnonymousClassConstructor(IModifiable node)
        {
            StringBuilder sb = new StringBuilder();
            node.PrintTreeText(sb);
            
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
                // Input
                // creator(-1): <--- this is the construction 
                //    createdName(-1): 
                //       identifier(30:12-19): CheckAll <--- of this class
                //    classCreatorRest(-1): 
                //       arguments(30:20-21): ( )

                // We have no interest in changing this type of constructor

                StringBuilder sb2 = new StringBuilder();
                node.PrintTreeText(sb2);
                logger.LogDebug($"Input:\n{sb}\n\nOutput (normal):\n{sb2}");
                return;
            }

            //this constructor has some class definition and therefore an anonymous class 
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

            //first prepare a new classBodyDeclaration with all the class structure elements
            IModifiable declaration = (IModifiable)NodeFactory.CreateNode("classBodyDeclaration", true);
            declaration.Parent      = parentClassBody;

            IModifiable constructor = (IModifiable)children[0];
            IModifiable anonParentType = (IModifiable)constructor.Children[0];
            constructor.DropChildren(); //TODO this would remove the identifier after the fact

            // Input
            // creator(-1): <--- this is the construction of an anonymous class
            //    createdName(-1): <--- constructor
            //       identifier(18:30-35): Filter <--- anonParentType
            //    classCreatorRest(-1): 
            //       arguments(18:36-37): ( )
            //       classBody(18-20): { } <--- With at least some class member declared
            //          Some class members....

            // Output (special):
            // creator(-1):  <--- this is the construction 
            //    createdName(-1):  <--- constructor
            //-------identifier(18:30-35): Filter------------REMOVED
            //       AnonymousLink(-1): Anonymous_18_30_35 <--- of this anonymous class
            //    classCreatorRest(-1): 
            //       arguments(18:36-37): ( )

            // classDeclaration(21:30-39): class implements
            //    identifier(21:30-47): Anonymous_21_30_35 <--- this is an anonymous class definition
            //    classBody(18-20): { } <--- with the actual members as previously defined
            //          Some class members....
            //    typeList: (-1): <--- this is the set of all parent types
            //       TypeName(18:30-35): Filter 

            //artificially set up this as a type within major class
            // droppingType(6:0-4): class
            //    identifier(6:6-13): CheckAll
            IModifiable typeDef = (IModifiable)NodeFactory.CreateNode("classDeclaration", true);
            typeDef.AddCode("class", anonParentType);
            string anonName = NodeFactory.GenerateAnonymous(anonParentType);
            IModifiable ident = (IModifiable)NodeFactory.CreateNode("identifier", true);
            ident.AddCode(anonName, anonParentType);
            ident.Parent = typeDef;

            typeDef.AddCode("implements", anonParentType);
            typeDef.Parent = declaration;
            classBody.Parent = typeDef;

            IModifiable typeNode = (IModifiable)NodeFactory.CreateNode("typeList", false);
            IModifiable typeName = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);
            typeName.AddCode(anonParentType.Code, anonParentType);//parent class is the declared constructor name
            typeName.Parent = typeNode;
            typeNode.Parent = typeDef;

            //remove class body from constructor
            IModifiable arguments = (IModifiable)rest.GetNthChild(0);
            ((IModifiable)rest).DropChildren();
            arguments.Parent = rest;

            IModifiable link = (IModifiable)NodeFactory.CreateNode(Members.AnonymousLink, true);
            link.AddCode(anonName, constructor);
            link.Parent = constructor;

            StringBuilder sb3 = new StringBuilder();
            node.PrintTreeText(sb3);
            typeDef.PrintTreeText(sb3);
            logger.LogDebug($"Input:\n{sb}\n\nOutput (special):\n{sb3}");

            //recursive check for additional creators
            classBody.RootUpModify("creator", "creator", AnonymousClassConstructor);
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
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            throw new InvalidOperationException("Has not been refactored " + sb);

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
            StringBuilder sb = new StringBuilder();
            list.PrintTreeText(sb);
            logger.LogDebug($"Input:\n{sb}");

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
                    //this is known to occur when a parameter is also an assignment as in method(var = new Sometype());
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
                //this type name is a compound of some number of packages
                //needs to be reformated

                INavigable target = other.Parent;
                StringBuilder sb = new StringBuilder();
                target.PrintTreeText(sb);
                throw new InvalidCastException("Probably OBE " + sb);


                //find the length of the chain
                string[] parts = other.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                //add the members in reverse order to a stack
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
                    current     = next;
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
        /// Formats the structure of a constructor invoked or called with actual parameters
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
                arrayInvokation         = true;
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
            //the list node is a parameter list
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
        private void StaticMethodModifier2(IModifiable node)
        {
            if (node.Node.Equals("classBodyDeclaration") && node.Code.Equals("static"))
            {
                //TODO this method appears to be OBE but we can watch for the event to occur.
                throw new InvalidOperationException("Running Static Method #2");

                //use the static method name as a modifier
                IModifiable set = (IModifiable)NodeFactory.CreateNode(MemberSets.ModifierSet, false);
                set.Parent      = node;

                IModifiable mod = (IModifiable)NodeFactory.CreateNode(Members.Static, false);
                mod.Parent      = node;

                node.SetNode(Members.Method);
                node.ClearCode(ClearCodeOptions.ClearAll);

                //null return type
                IModifiable returnSet = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
                returnSet.Parent      = node;

                //no exceptions are valid here
                //no parameters here, just an empty parameterlist

                //add the parameter list
                IModifiable param = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, false);
                param.Parent      = node;

                //add the scope
                IModifiable scope = (IModifiable)NodeFactory.CreateNode(Members.Scope, "");

                if (scope != null)
                {
                    MethodScopeModifier(scope, node);
                    scope.Parent = node;
                }
                else
                {
                    //this is an error because a non-abstract method is missing the method scope
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
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            logger.LogDebug($"Input:]n{sb}");

            target.SetNode(Members.Method);

            //add method name
            IModifiable identifier = (IModifiable)node.GetFirstSingleLayer(Members.Variable);
            target.CopyCode(identifier);

            //add the modifiers set
            FormatModifiers(target);

            //add the return value
            IModifiable returnSet = (IModifiable)NodeFactory.CreateNode(Members.ReturnType, false);
            returnSet.Parent = target;

            //get the return type
            IModifiable returnType = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
            returnType.Parent = returnSet;
            string typeCode = null;
            IModifiable typeNode = (IModifiable)node.GetFirstSingleLayer("typeTypeOrVoid");
            IModifiable fakeTypeNode = (IModifiable)node.GetFirstSingleLayer("FakeReturnType");
            if (typeNode != null)
            {
                typeCode = typeNode.Code;
            }

            if (fakeTypeNode!=null)
            {
                //sepcial case for constructors
                //ignore the return type
            }
            else if (typeCode.Equals("void"))
            {
                //this is a void return type so we have to create that node
                returnType.CopyCode(typeNode);
            }
            else
            {
                //get the actual name and copy that into our return type
                IModifiable tnNode = (IModifiable)node.GetFirstRecursive(Members.TypeName);
                IModifiable actualName = (IModifiable)tnNode.GetNthChild(0);
                returnType.CopyCode(actualName);
            }

            //add the exceptions set
            //naively assume that there is no throws statement
            IModifiable exceptionSet = null;
            string[] code = node.Code.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            if (node.Code.EndsWith("throws") || node.Code.EndsWith("throws ;"))
            {
                //redefine the code split to include a throw statement
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
        }

        private void MethodScopeModifier(IModifiable scope, IModifiable parent)
        {
            IModifiable directChild = (IModifiable)scope.GetDirectAncestorTo(parent);
            scope.SetNode(Members.MethodScope);
            parent.RemoveChild(directChild);
        }

        /// <summary>
        /// Formats a method as a major type under the class defintion
        /// </summary>
        /// <param name="answer"></param>
        private void ClassMethodModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");

            if (target == null)
            {
                throw new InvalidCastException("Class method has no body declaration: " + node);
            }
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // Input
            // classBodyDeclaration(-1-0): 
            //    memberDeclaration(-1): 
            //       droppingMethod(-1): 
            //          typeTypeOrVoid(10:4-7): void
            //          identifier(10:4-9): static
            //          ParameterList(10:4-6): ( )
            //          methodBody(-1): 
            //             Scope(-1-0): 
            //                blockStatement(-1): 
            //                   statement(11:22-22): ;
            //                      expression(11:19-19): =
            //                         expression(-1): 
            //                            Variable(11:8-17): classValue
            //                         expression(-1): 
            //                            Literal(11:21-21): 4
            //                               Type(-1): 
            //                                  TypeName(11:21-27): Integer

            // Output:
            // Method(10:4-9): static
            //    ModifierSet: (-1): 
            //    ReturnType: (-1): 
            //       TypeName: (10:4-7): void
            //    ParameterList(-1-0): 
            //    MethodScope(-1-0): 
            //       blockStatement(-1): 
            //          statement(11:22-22): ;
            //             expression(11:19-19): =
            //                expression(-1): 
            //                   Variable(11:8-17): classValue
            //                expression(-1): 
            //                   Literal(11:21-21): 4
            //                      Type(-1): 
            //                         TypeName(11:21-27): Integer

            //find the scope and remove it from the method
            IModifiable scope = (IModifiable)node.GetFirstRecursive(Members.Scope);
            if (scope != null)
            {
                MethodScopeModifier(scope, node);
            }

            SingleMethodModifier(node, target);

            List<INavigable> modifiers  = target.GetFirstSingleLayer(MemberSets.ModifierSet).Children;
            bool             isAbstract = false;
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
                //this is an error because a non-abstract method is missing the method scope
                errorMessages.Add("ERROR: Non-abstract method without method scope\r\n");
                target.PrintTreeText(errorMessages.Add);
            }

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input\n{sb}\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Formats the structure of a constructor defintion as a form of method
        /// </summary>
        /// <param name="answer"></param>
        private void ConstructorModifier(IModifiable node)
        {
            //store the targetNode
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");

            //add a temporary return type to make this like any other method answer
            ((IModifiable)NodeFactory.CreateNode("FakeReturnType", false)).Parent = node;

            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // classBodyDeclaration(-1): 
            //    modifier(-1): 
            //       modifier(19:4-9): public
            //    memberDeclaration(-1): 
            //       droppingConstructor(-1): 
            //          identifier(19:11-18): CheckAll
            //          ParameterList: (19:19-25): ( )
            //             Parameter(19:24-24): x
            //                ModifierSet: (-1): 
            //                Type: (-1): 
            //                   Primitive(19:20-22): int
            //                identifier(19:24-24): x
            //          Scope(-1-0): 
            //             other stuff...
            //          FakeReturnType: (-1): 
            //
            // Output
            // Constructor(19:11-18): CheckAll
            //    ModifierSet: (19): 
            //       Public(-1): 
            //    ReturnType: (-1): 
            //       TypeName(19:11-18): CheckAll
            //    ParameterList: (-1-0): 
            //       Parameter(19:24-24): x
            //          ModifierSet: (-1): 
            //          Type: (-1): 
            //             Primitive(19:20-22): int
            //          identifier(19:24-24): x
            //    MethodScope(-1-0): 
            //       other stuff....

            //treat as any other Method
            ClassMethodModifier(node);

            //small alterations for constructors
            target.SetNode(Members.Constructor);//not a method
            IModifiable returnType = (IModifiable)target.GetFirstRecursive(Members.ReturnType).GetNthChild(0);
            returnType.SetNode(Members.TypeName);
            returnType.CopyCode(target);
            returnType.IsNatural = true;

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\nOutput:\n{sb2}");
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
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            SingleMethodModifier(node, target);

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Formats the structure of an enumeration
        /// </summary>
        /// <param name="node"></param>
        private void enumModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;

            // TODO this may be OBE
            // IModifiable target  = (IModifiable)node.GetAncestor("classBodyDeclaration");
            // IModifiable targetI = (IModifiable)node.GetAncestor("interfaceBodyDeclaration");
            // if (target != null && targetI != null)
            // {
            //     //this class/interface is nested and the enum is only on the lower of them.
            //     INavigable link = targetI.GetDirectAncestorTo(target);
            //     if (link != null)
            //     {
            //         //The interface is the child of the class so the target is now the interface
            //         target = targetI;
            //     }
            // }

            // Input:
            // TypeDeclaration(7:5-16): NumericLevel     <---- target
            //    ModifierSet: (-1): 
            //    Classification: (-1): 
            //       2ENUM: (-1): 
            //    SuperTypes: (-1): 
            //       2SuperType(7:5-8): enum
            //          3ENUM(-1): 
            //    Enumerations: (-1): 
            //    Values: (-1): 
            //    ...
            //    Inlines: (-1): 
            //    enumConstants(8-9): , ,                <---- node
            //       enumConstant(-1): 
            //          Variable(8:1-3): LOW
            //          arguments(8:5-7): ( )
            //             expressionList(-1): 
            //                expression(-1): 
            //                   Literal(8:6-6): 0
            //                      Type(-1): 
            //                         TypeName(8:6-12): Integer
            //       enumConstant(-1): 
            //          OTHER STUFF....
            //
            //  Output (just focusiong on the values)
            //   Values: (-1): 
            //      Value(8:1-3): LOW
            //         ParameterList(-1): 
            //            expression(-1): 
            //               Literal(8:6-6): 0
            //                  Type(-1): 
            //                     TypeName(8:6-12): Integer

            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // Again, possibly OBE
            // FormatModifiers(target);

            List<INavigable> values = node.Children; //get all enumConstant as children
            target.RemoveChild(node);               //remove the enumConstants object

            // identify the existing set of values
            IModifiable set = (IModifiable)target.GetFirstSingleLayer(MemberSets.Values);

            logger.LogDebug($"Input\n{sb}");
            foreach (IModifiable c in values)
            {
                StringBuilder sb4 = new StringBuilder();
                c.PrintTreeText(sb4);
                logger.LogDebug($"Other:\n{sb4}");

                if (c.Node.Equals("enumConstant"))
                {
                    //   enumConstant(-1): 
                    //      Variable(8:1-3): LOW
                    //      arguments(8:5-7): ( )

                    List<INavigable> children = c.Children;
                    c.DropChildren();

                    // Makes the Enum constate into a Value and gets the code from the Variable
                    c.SetNode(Members.Value);
                    c.Parent = set;
                    c.CopyCode((IModifiable)(children[0]));

                    if (children.Count > 1) // this is value with some parameter
                    {
                        IModifiable parameters = (IModifiable)children[1].GetFirstRecursive("expressionList");
                        if (parameters == null)
                        {
                            continue;
                        }

                        IModifiable list = (IModifiable)NodeFactory.CreateNode(Members.ParameterList, true);
                        list.Parent      = c;

                        foreach (IModifiable param in parameters.Children)
                        {
                            param.Parent = list;
                        }
                    }
                }
                else
                {
                    StringBuilder sb3 = new StringBuilder();
                    target.PrintTreeText(sb3);
                    logger.LogDebug($"Input\n{sb}\nOther:\n{sb3}");
                }
            }

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input\n{sb}\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Formats the main class definition and any nested types
        /// </summary>
        /// <param name="answer"></param>
        private void TypeModifier(IModifiable node)
        {
            //Start by assuming this will be a private type
            //find the head node within the parent declaration
            IModifiable target = (IModifiable)node.GetAncestor("classBodyDeclaration");
            if (target == null)
            {
                //we also check for a something nested within an interface
                target = (IModifiable)node.GetAncestor("interfaceBodyDeclaration");
            }

            if (target == null)
            {
                //we also check for something nested within an enum
                target = (IModifiable)node.GetAncestor("enumBodyDeclaration");
            }

            if (target == null)//if neither case is true, then this must be the main type
            {
                target = (IModifiable)node.GetAncestor("typeDeclaration");
            }

            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // Input
            // droppingType(6:0-24): class implements
            //    identifier(6:6-13): CheckAll
            //    typeList(-1): 
            //       typeType(-1): 
            //          TypeName(-1): 
            //             typeIdentifier(6:26-35): OtherClass
            //    classBody(7-50): { }
            //       other stuff...
            //
            // Output
            // TypeDeclaration(6:6-13): CheckAll
            //    ModifierSet: (-1): 
            //    Classification: (-1): 
            //       CLASS: (-1): 
            //    SuperTypes: (-1): 
            //       SuperType(-1): 
            //          typeIdentifier(6:26-35): OtherClass
            //          INTERFACE(-1): 
            //    Enumerations: (-1): 
            //    Constructors: (-1): 
            //       some constructors...
            //    Methods: (-1):
            //       some methods...
            //   Types: (-1): 
            //   Values: (-1): 
            //   Inlines: (-1): 
            //   classBodyDeclaration(-1): 
            //      classDeclaration(21:30-39): class Anonymous_21_30_35 implements
            //         classBody(21-23): { }
            //            Method(22:24-30): doThing
            //               ModifierSet: (22): 
            //                  Public(-1): 
            //               ReturnType: (-1): 
            //                  TypeName: (22:19-22): void
            //               ParameterList(-1-0): 
            //               MethodScope(-1-0): 
            //         typeList: (-1): 
            //            TypeName(21:30-35): Filter
            //   Fields: (-1): 
            //      some fields...

            // Input
            // classBodyDeclaration(-1): 
            //    droppingType(21:30-39): class implements
            //       identifier(21:30-47): Anonymous_21_30_35
            //       classBody(21-23): { }
            //          Method(22:24-30): doThing
            //             ModifierSet: (22): 
            //                Public(-1): 
            //             ReturnType: (-1): 
            //                TypeName: (22:19-22): void
            //             ParameterList(-1-0): 
            //             MethodScope(-1-0): 
            //       typeList: (-1): 
            //          TypeName(21:30-35): Filter
            //
            // Output
            // TypeDeclaration(21:30-47): Anonymous_21_30_35
            //    ModifierSet: (-1): 
            //    Classification: (-1): 
            //       CLASS: (-1): 
            //    SuperTypes: (-1): 
            //       SuperType(21:30-35): Filter
            //          ANONYMOUS(-1): 
            //    Enumerations: (-1): 
            //    Constructors: (-1): 
            //    Methods: (-1): 
            //       Method(22:24-30): doThing
            //          ModifierSet: (22): 
            //             Public(-1): 
            //          ReturnType: (-1): 
            //             TypeName: (22:19-22): void
            //          ParameterList(-1-0): 
            //          MethodScope(-1-0): 
            //    Types: (-1): 
            //    Values: (-1): 
            //    Inlines: (-1): 

            // Input:
            // typeDeclaration(-1): 
            //    droppingType(7): enum
            //       Variable(7:5-16): NumericLevel
            //       enumBodyDeclarations(-1): 
            //          enumConstants(8-9): , ,
            //             enumConstant(-1): 
            //                Variable(8:1-3): LOW
            //                   OTHER STUFF....
            //
            // Output:
            // TypeDeclaration(7:5-16): NumericLevel
            //    ModifierSet: (-1): 
            //    Classification: (-1): 
            //       2ENUM: (-1): 
            //    SuperTypes: (-1): 
            //       2SuperType(7:5-8): enum
            //          3ENUM(-1): 
            //    Enumerations: (-1): 
            //    ...
            //    Inlines: (-1): 
            //    enumConstants(8-9): , ,
            //       enumConstant(-1): 
            //          Variable(8:1-3): LOW
            //    OTHER STUFF....

            FormatModifiers(target);

            ModifyToTypeDeclaration(target, node);

            Dictionary<MemberSets, IModifiable> sets = new Dictionary<MemberSets, IModifiable>();
            foreach (MemberSets ms in Enum.GetValues(typeof(MemberSets)))
            {
                if (ms == MemberSets.Classification || ms == MemberSets.ModifierSet || ms == MemberSets.Fields)
                {
                    //these three members are added in other locations and not part of this loop
                    continue;
                }
                IModifiable tempNode = (IModifiable)NodeFactory.CreateNode(ms, false);
                tempNode.Parent      = target;
                sets.Add(ms, tempNode);
            }

            //look at the children of this type
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
                            //this is a nested type
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
                else //private declarations of internal types
                {
                    //this occurs for types with a generic component
                    //currently we ignore the generic component.
                    if (child.Node.Equals("typeParameters"))
                    {
                        continue;
                    }

                    List<INavigable> allMy = new List<INavigable>();

                    //the one parent class will be in a tree starting with "type"
                    NodeType classification = NodeType.CreateNodeType(Members.CLASS);

                    if (NodeFactory.IsAnonymous(target.Code))
                    {
                        classification = NodeType.CreateNodeType(Members.ANONYMOUS);

                        //there is one type. Could be a class or an interface
                        allMy.Add(child.GetNthChild(0));
                    }
                    else if (child.Node.Equals("typeList"))
                    {
                        //the alternative is a list of 1 or more interfaces
                        classification = NodeType.CreateNodeType(Members.INTERFACE);
                        foreach (INavigable n in child.Children)
                        {
                            //the direct child is a "type" the grandchild is the interface TypeName
                            allMy.Add(n.GetNthChild(0));
                        }
                    }
                    else
                    {
                        logger.LogTrace($"Catch-all for 'one class' {child.Node}");
                        StringBuilder sb2 = new StringBuilder();
                        child.PrintTreeText(sb2);
                        logger.LogDebug($"SUB-TREE\n{sb2}");

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
                //enums have a single parent type which is enum
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

            StringBuilder sb3 = new StringBuilder();
            target.PrintTreeText(sb3);
            logger.LogDebug($"Input\n{sb}\nOutput:\n{sb3}");
        }

        private void ModifyToTypeDeclaration(IModifiable target, IModifiable node)
        {
            if (node.CodeCount < 1)
            {
                string msg = "ERROR: CreateTypeDeclaration does not have sufficient code elements:\r\n\tNeeds 'class' or other type designation\r\n";
                errorMessages.Add(msg);
                target.PrintTreeText(errorMessages.Add);
                throw new InvalidOperationException(msg);
            }

            //we need to remove any "implements" or "extends" in the type, leaving just enum, class, or interface
            string oldCode = node.Code;
            oldCode = oldCode.Replace("implements","");
            oldCode = oldCode.Replace("extends","");
            node.ReplaceCode(oldCode);

            target.SetNode(Members.TypeDeclaration);
            target.ClearCode(ClearCodeOptions.ClearAll);
            IModifiable identifier = (IModifiable)node.GetFirstSingleLayer(Members.Variable);
            target.CopyCode(identifier);
            node.RemoveChild(identifier);

            IModifiable myType = (IModifiable)NodeFactory.CreateNode(MemberSets.Classification, false);
            IModifiable subType = (IModifiable)NodeFactory.CreateNode((Members)Enum.Parse(typeof(Members), node.Code.ToUpper()), false);
            subType.Parent = myType;
            myType.Parent = target;
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
            //find the ultimate parent type for the field (e.g. a class/interface body)
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
            StringBuilder sb = new StringBuilder();
            parent.PrintTreeText(sb);

            // Input:
            // classBodyDeclaration(-1): 
            //    modifier(-1): 
            //       modifier(8:4-9): static
            //    memberDeclaration(-1): 
            //       fieldDeclaration(8:25-25): ;
            //          typeType(-1): 
            //             Primitive(8:11-13): int
            //          Variable(8:15-24): classValue
            //
            // Output:
            // Field(8:15-24): classValue
            //    ModifierSet: (-1): 
            //       Static(-1):
            //    Type: (-1):
            //       Primitive(8:11-13): int
            //    Variable(8:15-24): classValue

            parent.Collapse(collapseName);

            //prepare the right children nodes for formatting
            //  some are off the parent and some are off the field (the n-1 child of parent)
            List<INavigable> originalChildren   = parent.Children;
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
                    //this is a modifier, but it only contains another with actual code
                    formatableChildren.Add(n.GetNthChild(0));
                }
                else
                {
                    //it seems that volatile is a unique modifier which has code
                    if (!n.Code.Equals("volatile") && !n.Code.Equals("transient"))
                    {
                        throw new InvalidCastException("Unknown modifier with code: " + n);
                    }
                    formatableChildren.Add(n);
                }
            }

            //all children have been added to the set
            FormatField(superParent, formatableChildren, true);

            INavigable newParent = superParent.GetFirstSingleLayer(MemberSets.Fields);
            StringBuilder sb2 = new StringBuilder();
            newParent.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\nOutput:\n{sb2}");
        }
        #endregion

        private void GenericTypeModifier(IModifiable node)
        {
            if (node.Code.StartsWith("?"))
            {
                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);

                //this is a generic
                node.SetNode(Members.Generic);
                if (node.GetChildCount() > 0)
                {
                    //the generic must extend a type.
                    ((IModifiable)node.GetNthChild(0)).SetNode(Members.SuperType);
                }
                StringBuilder sb2 = new StringBuilder();
                node.PrintTreeText(sb2);
                logger.LogDebug($"Input:\n{sb}\n\nOutput:\n{sb2}");
            }
            else if (node.GetFirstRecursive(Members.TypeName) != null || node.BreadthFirstSearch(Members.Primitive) != null)
            {
                //any valid typename is allowed
                //No op required.
            }
            else
            {
                //could there be something else???
                StringBuilder sb = new StringBuilder();
                node.PrintTreeText(sb);
                logger.LogError($"Unknown node found {sb}");
                throw new InvalidOperationException($"Unknown node found {sb}");
            }
        }

        /// <summary>
        /// Determines the existance of an array in conjunction with a type and sets the array degree for that type
        /// </summary>
        /// <param name="answer"></param>
        private void TypeArrayModifier(IModifiable node)
        {
            if (node.Code.Contains('['))
            {
                //this is some dimension of array
                IModifiable target = (IModifiable)node.Parent;
                StringBuilder sb = new StringBuilder();
                target.PrintTreeText(sb);

                if (node.GetChildCount() < 1)
                {
                    logger.LogError("ERROR: Array does not have sufficient children nodes\r\n");
                    errorMessages.Add("ERROR: Array does not have sufficient children nodes\r\n");
                    target.PrintTreeText(errorMessages.Add);
                    throw new InvalidOperationException("ERROR: Array does not have sufficient children nodes");
                }

                // Two input options depending on the root type
                // typeType(29:8-13): [ ] [ ] [ ]
                //    Primitive(29:4-6): int
                //
                // Output:
                // Primitive(29:4-6): int [] [] []


                // typeType(30:13-16): [ ] [ ]
                //    TypeName(-1): 
                //       typeIdentifier(30:4-11): MyObject
                //
                // Output:
                // TypeName(30:4-11): MyObject [ ] [ ]

                INavigable namedType = (IModifiable)node.GetNthChild(0);
                if (namedType.Node.Equals(Members.TypeName))
                {
                    //TODO how should this be handled?
                    // TypeName(30:4-11): MyObject [ ] [ ]
                    namedType = (IModifiable)namedType.GetNthChild(0);
                }
                else if (namedType.Node.Equals(Members.Primitive))
                {
                    //allowed
                    //take no action
                }
                else
                {
                    //some other unknown type
                    logger.LogError($"Unknown array type {sb}");
                    throw new InvalidOperationException($"Unknown array type {sb}");
                }

                //reparent the type on grandparent
                target.ReplaceChild(node, (IModifiable)namedType);

                //find the degree of array and set that on the child
                //[ ] [ ] [ ]
                //  0   4   8
                //using the offset of 2 for the first pair, each new pair is a set of four characters
                ((IModifiable)node.GetNthChild(0)).ArrayDegree = (node.Code.LastIndexOf(']') - 2) / 4 + 1;
                StringBuilder sb2 = new StringBuilder();
                target.PrintTreeText(sb2);
                logger.LogDebug($"Input:\n{sb}\n\nOutput:\n{sb2}");
            }
        }

        /// <summary>
        /// Formats the parameters within a formal parameterlist definition
        /// </summary>
        /// <param name="answer"></param>
        private void ParameterListModifier(IModifiable node)
        {
            if (node.GetChildCount()==0)
            {
                //this is an empty parameter list; no action
                return;
            }

            IModifiable target = (IModifiable)node.Parent;
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // Input
            // methodDeclaration(-1):               <--- Parent
            //    typeTypeOrVoid(2:16-19): void
            //    Variable(2:21-24): main
            //    ParameterList(2:25-39): ( )       <--- Node
            //       formalParameterList(-1): 
            //          formalParameter(-1): 
            //             Variable(2:26-31): String
            //             Variable(2:35-38): args
            //    methodBody(-1):             
            //
            // Output

            // Input
            // constructorDeclaration(-1): 
            //    <<< No return type in a constructor >>>
            //    identifier(19:11-18): CheckAll
            //    ParameterList(19:19-25): ( )
            //       formalParameterList(-1): 
            //          formalParameter(-1): 
            //             typeType(-1): 
            //                Primitive(19:20-22): int
            //             identifier(19:24-24): x
            //    Scope(-1-0): 
            //       more stuff...
            //
            // Output
            // constructorDeclaration(-1): 
            //    identifier(19:11-18): CheckAll
            //    ParameterList: (19:19-25): ( )
            //       Parameter(19:24-24): x
            //          ModifierSet: (-1): 
            //          Type: (-1): 
            //             Primitive(19:20-22): int
            //          identifier(19:24-24): x
            //    Scope(-1-0): 
            //       more stuff...

            List<INavigable> parameters = node.BreadthFirstSearch("formalParameter");
            List<INavigable> lastParam  = node.BreadthFirstSearch("lastFormalParameter");

            // You can have 0 to n formalParameters
            // You can have 0 or 1 lastFormalParameters.

            if (lastParam.Count > 1)
            {
                logger.LogError($"More than one final parameter (i.e. Type ... set) {sb}");
                throw new InvalidOperationException($"More than one final parameter (i.e. Type ... set) {sb}");
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

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Used to format the definition of a local variable
        /// </summary>
        /// <param name="answer"></param>
        private void VariableDeclaratorModifier(IModifiable node)
        {
            IModifiable target = (IModifiable)node.Parent;
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            logger.LogDebug($"Input:\n{sb}");

            // Input
            // fieldDeclaration(8:25-25): ;
            //    typeType(-1): 
            //       Primitive(8:11-13): int
            //    variableDeclarator(-1): 
            //       identifier(8:15-24): classValue
            //
            // Output
            // fieldDeclaration(8:25-25): ;
            //    typeType(-1): 
            //       Primitive(8:11-13): int
            //    Variable(8:15-24): classValue

            // Input
            // fieldDeclaration(30:49-49): ;
            //    typeIdentifier(30:4-11): MyObject
            //    variableDeclarator(30:29-29): =
            //       identifier(30:18-27): someobject
            //       variableInitializer(-1): 
            //          other stuff....
            //
            // Output
            // fieldDeclaration(30:49-49): ;
            //    typeIdentifier(30:4-11): MyObject
            //    Variable(30:18-27): someobject
            //       Write(-1-0): 

            // Input
            // variableDeclarator(12:14-14): =
            //    identifier(12:12-12): z
            //    variableInitializer(-1): 
            //       expression(12:21-21): .
            //          expression(-1): 
            //             Variable(12:16-20): other    <---- variable???
            //          methodCall(-1): 
            //             identifier(12:22-28): method1
            //             arguments(12:29-30): ( )
            //
            // Output


            //we're going to pull the variable up a level of the tree, but not otherwise molest the parent.
            IModifiable var = (IModifiable)node.GetFirstRecursive(Members.Variable);
            
            if (var == null)
            {
                var = (IModifiable)node.GetFirstRecursive("identifier");
            }

            if (var == null)
            {
                errorMessages.Add("ERROR: Apparent variable declaration answer does not contain Variable child node\r\n");
                target.PrintTreeText(errorMessages.Add);
            }
            var.SetNode(Members.Variable);
            StringBuilder sb4 = new StringBuilder();
            node.PrintTreeText(sb4);
            var.PrintTreeText(sb4);
            logger.LogDebug($"Trouble:\n{sb4}");
            node.RemoveChild(var);
            var.Parent = target;

            if (node.GetChildCount() > 0)//there is more to be writen to the declared variable
            {
                //change the nature of this answer to a write and reparent on the variable
                node.SetNode(Members.Write);
                node.ClearCode(ClearCodeOptions.ClearAll);
                target.RemoveChild(node);
                node.Parent = var;
            }
            else
            {
                ((IModifiable)node.Parent).RemoveChild(node);
            }

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\nOutput:\n{sb2}");
        }

        /// <summary>
        /// Formats the use of a local variable within a code block
        /// </summary>
        /// <param name="answer"></param>
        private void LocalVariableModifier(IModifiable node)
        {
            if (node.GetChildCount() < 1)
            {
                errorMessages.Add("ERROR: Array does not have sufficient children nodes\r\n");
                node.PrintTreeText(errorMessages.Add);
            }

            //This field exists within a scope. The blockstatement is the intermediate answer
            //the actual scope may be a while loop, for loop, method scope, try catch, etc.
            //searching in this way identifies the right pair.
            IModifiable directParent = (IModifiable)node.GetAncestor("blockStatement");
            IModifiable target       = (IModifiable)directParent.Parent;
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);
            logger.LogDebug($"{node}\nInput:\n{sb}");

            target.RemoveChild(directParent);

            // IModifiable field = (IModifiable)node.GetNthChild(0);//the only field in this answer
            // List<INavigable> children = field.Children;

            FormatField(target, node.Children, true);
        }

        /// <summary>
        /// Requires a change from the default version of the method.
        /// In this Java grammar, the Literal has no code, but the child
        /// suggests a type AND the code of interest, so we must gather
        /// that data, drop the child, parse the type, and assert the 
        /// new structure.
        /// </summary>
        /// <param name="literal"></param>
        /// <exception cref="NotImplementedException"></exception>
        protected override void LiteralModifier(IModifiable literal)
        {
            INavigable target = literal;
            StringBuilder sb = new StringBuilder();
            target.PrintTreeText(sb);

            // INPUT
            // primary(-1):                      <--- parent
            //    Literal(-1):                   <--- parameter
            //       integerLiteral(17:18-21): 2.47  <--- literalType

            // Output:
            // primary(-1): 
            //    Literal(17:18-21): 2.47 
            //       Type(-1): 
            //          TypeName(-1): Double

            // INPUT -- appears to be unique to strings; no child nodes
            // Literal(48:27-36): "Hi there"

            string literalCode = literal.Code;
            List<INavigable> children = literal.Children;
            if (children.Count > 1)
            {
                logger.LogDebug($"Literal type expected ONE type, but found more\n {sb}");
            }
            else if (children.Count == 1)
            {
                INavigable literalType = children[0];
                literal.DropChildren();
                literalCode = literalType.Code;
                literal.CopyCode((IModifiable)literalType);
            }
            //if there are zero children, that is acceptable and there is no code to copy; no children to drop.

            IModifiable type = (IModifiable)NodeFactory.CreateNode(Members.Type, true);
            IModifiable t    = (IModifiable)NodeFactory.CreateNode(Members.TypeName, true);

            t.Parent    = type;
            type.Parent = literal;

            if (stringType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.String.ToString(), literal);
            }
            else if (charType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Character.ToString(), literal);
            }
            else if (boolType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Boolean.ToString(), literal);
            }
            else if (intType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Integer.ToString(), literal);
            }
            else if (longType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Long.ToString(), literal);
            }
            else if (floatType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Float.ToString(), literal);
            }
            else if (doubleType.IsMatch(literalCode))
            {
                t.AddCode(ApprovedLiterals.Double.ToString(), literal);
            }
            else if (classType.IsMatch(literalCode))
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
                logger.LogError($"Need to implement new literal type for {literalCode}");
                throw new NotImplementedException($"Need to implement new literal type for {literalCode}");
            }

            StringBuilder sb2 = new StringBuilder();
            target.PrintTreeText(sb2);
            logger.LogDebug($"Input:\n{sb}\n\nOutput:\n{sb2}");

        }
    }
}