using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Diagnostics;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class TypeDefinition : HierarchyNode
    {
        #region Language Specifics
        private static TypeDefinition voidType;
        public static TypeDefinition VoidType
        {
            get
            {
                return voidType;
            }
        }

        internal static bool IsVoid(string typeName)
        {
            return typeName.Equals(VoidType.represented.Code);
        }

        private static TypeDefinition headType;
        public static TypeDefinition HeadType
        {
            get
            {
                return headType;
            }
        }

        private static Dictionary<string, TypeDefinition> NativeTypes;
        private static Dictionary<string, string> literalMapping;

        internal static TypeDefinition GetNativeType(string typeName)
        {
            if (NativeTypes.ContainsKey(typeName))
            {
                return NativeTypes[typeName];
            }
            else if (literalMapping.ContainsKey(typeName)) 
            {
                return NativeTypes[literalMapping[typeName]];
            }

            throw new InvalidCastException("Request for unknown native type " + typeName);
        }

        private static string standardLibrary;

        internal static void StoreNativeTypes(ILanguage lang)
        {
            standardLibrary = lang.StandardLibrary;
            literalMapping = lang.LiteralMapping;

            NativeTypes = new Dictionary<string, TypeDefinition>();

            Package.AddNativeTypes(lang.NativeClasses, NativeTypes, true);
            Package.AddNativeTypes(lang.NativeInterfaces, NativeTypes, false);

            voidType = NativeTypes[lang.VoidNode];
            headType = NativeTypes[lang.HeadNode];

            foreach (string typeName in lang.DefaultValues.Keys)
            {
                Debug.Assert(NativeTypes.ContainsKey(typeName), typeName+" (typeName) should appear in NativeTypes");
                Debug.Assert(lang.DefaultValues.ContainsKey(typeName), typeName+" (typeName) should appear in lang.DefaultValues");
                NativeTypes[typeName].CreateDefaultValue(lang.DefaultValues[typeName]);
            }
        }

        #endregion

        #region Simulated Types
        /// <summary>
        /// The only method authorized to create a simulated TypeDeclaration.
        /// </summary>
        /// <param name="other"></param>
        /// <param name="classType">If true then the given type will be a class; an interface if otherwise.</param>
        public static TypeDefinition CreateSimulatedType(string typeName, bool classType)
        {
            //need to create Object in outlibrary.
            TypeDefinition outLibraryElement = new TypeDefinition(NodeFactory.CreateNode(Members.TypeDeclaration, typeName));
            outLibraryElement.isSimulated = true;

            //need to add classification
            if (classType)
            {
                outLibraryElement.classification = NodeType.CreateNodeType(Members.CLASS);
            }
            else
            {
                outLibraryElement.classification = NodeType.CreateNodeType(Members.INTERFACE);
            }

            return outLibraryElement;
        }
        #endregion

        #region Private Fields
        private List<DefinedMember> allMembers = new List<DefinedMember>();
        private List<TypeDefinition> childrenClasses = new List<TypeDefinition>();
        private List<TypeDefinition> parentTypes = new List<TypeDefinition>();
        private List<DefinedMember> staticImports = new List<DefinedMember>();
        private List<Literal> literals = new List<Literal>();
        private List<DefinedMember> instances = new List<DefinedMember>();
        private List<DefinedMember> subTypeInstants = new List<DefinedMember>();
        private List<HierarchyNode> importStatements = new List<HierarchyNode>();
        private Dictionary<INavigable, GraphNode> anonLinks = new Dictionary<INavigable, GraphNode>();
        private GraphNode myAnonLink = null;
        private Field thisReference;
        public GraphNode defaultValue;

        public GraphNode DefaultValue
        {
            get
            {
                if (defaultValue == null)
                {
                    if (NativeTypes.ContainsKey(this.represented.Code))
                    {
                        //add default value for type
                        INode n = NodeFactory.CreateNode(Members.Literal, "~~Default_" + this.represented.Code);

                        INavigable t = (INavigable)NodeFactory.CreateNode(Members.Type, false);
                        t.Parent = (INavigable)n;

                        INavigable tn = (INavigable)NodeFactory.CreateNode(Members.TypeName, this.represented.Code);
                        tn.Parent = t;

                        defaultValue = Literal.Create(n, this);
                    }
                    else
                    {
                        //add default value for type
                        INode n = NodeFactory.CreateNode(Members.Literal, "null");

                        INavigable t = (INavigable)NodeFactory.CreateNode(Members.Type, false);
                        t.Parent = (INavigable)n;

                        INavigable tn = (INavigable)NodeFactory.CreateNode(Members.TypeName, "Object");
                        tn.Parent = t;

                        defaultValue = Literal.Create(n, this);
                    }
                }

                return defaultValue;
            }
        }

        private void CreateDefaultValue(string p)
        {
            //add default value for type
            INode n = NodeFactory.CreateNode(Members.Literal, p);

            INavigable t = (INavigable)NodeFactory.CreateNode(Members.Type, false);
            t.Parent = (INavigable)n;

            INavigable tn = (INavigable)NodeFactory.CreateNode(Members.TypeName, this.represented.Code);
            tn.Parent = t;

            defaultValue = Literal.Create(n, this);
        }

        private Dictionary<string, TypeDefinition> nestedTypes = new Dictionary<string, TypeDefinition>();

        public TypeDefinition SearchPublicNestedType(string typeName)
        {
            lock (nestedTypes)
            {
                if (nestedTypes.ContainsKey(typeName))
                {
                    INavigable set = ((INavigable)nestedTypes[typeName].represented).GetFirstSingleLayer(MemberSets.ModifierSet);
                    if (set != null)
                    {
                        foreach (INavigable m in set.Children)
                        {
                            if (m.Node.Equals(Members.Public))
                            {
                                return nestedTypes[typeName];
                            }
                        }
                    }
                }
            }

            return null;
        }

        public TypeDefinition getNestedType(string typeName)
        {
            lock (nestedTypes)
            {
                if (nestedTypes.ContainsKey(typeName))
                {
                    return nestedTypes[typeName];
                }
                else if (this.IsSimulated)
                {
                    //from simulated types we can assume new simulated types exist
                    nestedTypes.Add(typeName, TypeDefinition.CreateSimulatedType(typeName, false));
                    nestedTypes[typeName].CreateThisReference();
                    nestedTypes[typeName].ParentScope = this;
                    return nestedTypes[typeName];
                }
            }

            throw new InvalidOperationException("Non-simulated " + this + " contains no definition for " + typeName);
        }

        private TypeDefinition parentClass;
        public TypeDefinition ParentClass
        {
            get
            {
                if (parentClass == null)
                {
                    parentClass = TypeDefinition.HeadType;
                }
                return parentClass;
            }
            set
            {
                parentClass = value;
            }
        }

        private NodeType classification = null;
        public NodeType Classification
        {
            get
            {
                if (classification == null)
                {
                    throw new InvalidOperationException("Classification for " + this + " is unknown\n" + represented.FileName);
                }
                return classification;
            }
        }
        #endregion

        private TypeDefinition(INode rep)
        {
            represented = rep;
        }

        public void CreateThisReference()
        {
            if (thisReference != null)
            {
                throw new InvalidOperationException(this + " already has a defined self reference");
            }

            //add a field for this.
            INavigable tempF = (INavigable)NodeFactory.CreateNode(Members.Field, NodeFactory.SelfReference, true);
            INavigable tempV = (INavigable)NodeFactory.CreateNode(Members.Variable, NodeFactory.SelfReference, true);
            tempV.Parent = tempF;
            Field f = (Field)DefinedMember.CreateDefinedMember(tempF);
            f.Register(allMembers, this);
            f.SimulateFieldType(this);
            ((IModifiable)f.Represented).CopyFile((IModifiable)this.represented);
            f.SimulateLinking(this.represented);
            f.MakeReference();
            thisReference = f;
        }

        #region Registration
        /// <summary>
        /// Called once per file for the major type, this registers the major components with the type
        /// </summary>
        /// <param name="node"></param>
        public static void RegisterType(INode node)
        {
            INavigable myNavigable = (INavigable)node;

            //Find the endNode hierarchy for this class
            Package package = Package.CreateNaturalPackage(myNavigable.GetFirstSingleLayer(Members.Package));

            //put this type into the endNode
            TypeDefinition tNode = new TypeDefinition(myNavigable.GetFirstSingleLayer(Members.TypeDeclaration));
            package.RegisterType(tNode);

            tNode.AddImport(package);
            package.WasImportedBy(tNode);

            //Register all other members including nested types.
            tNode.RecursiveRegisterMembers();
        }

        private void AddImport(HierarchyNode g)
        {
            //duplicates are allowed, but ignored.
            if (importStatements.Contains(g))
            {
                return;
            }

            importStatements.Add(g);
        }

        private void AddImport(List<HierarchyNode> imports)
        {
            foreach (HierarchyNode h in imports)
            {
                //duplicates are allowed, but ignored.
                if (importStatements.Contains(h))
                {
                    return;
                }

                importStatements.Add(h);
            }
        }

        /// <summary>
        /// Lesser, recursive method which is used on the primary type and all nested types.
        /// </summary>
        /// <param name="endNode"></param>
        private void RecursiveRegisterMembers()
        {
            INavigable myNavigable = (INavigable)represented;

            if (myNavigable == null) { // TODO 2021-04-09, nullptr when ingesting C++ code
                Console.WriteLine("myNavigable == null");
                return;
            }

            foreach (INavigable set in myNavigable.Children)
            {
                switch (set.Node.GetMemberSets())
                {
                    case MemberSets.Constructors:
                        //Add default constructor if none exists in this type; becasue this is done here,
                        //there is no possibility of a class without a constructor in any other part of the code
                        if (myNavigable.GetFirstSingleLayer(MemberSets.Constructors).GetChildCount() == 0)
                        {
                            //create default constructor
                            IModifiable cons = (IModifiable)NodeFactory.CreateNode(Members.Constructor, false);
                            cons.CopyCode((IModifiable)represented);

                            INavigable a2 = (INavigable)NodeFactory.CreateNode(Members.ParameterList, false);
                            a2.Parent = cons;

                            INavigable a3 = (INavigable)NodeFactory.CreateNode(Members.ReturnType, false);
                            a3.Parent = cons;

                            IModifiable a4 = (IModifiable)NodeFactory.CreateNode(Members.TypeName, false);
                            a4.CopyCode(cons);
                            a4.Parent = a3;
                            
                            DefinedMember.CreateDefinedMember(cons).Register(allMembers, this);
                        }
                        else
                        {
                            foreach (INavigable child in set.Children)
                            {
                                DefinedMember.CreateDefinedMember(child).Register(allMembers, this);
                            }
                        }
                        break;
                    case MemberSets.Methods:
                        foreach (INavigable child in set.Children)
                        {
                            DefinedMember.CreateDefinedMember(child).Register(allMembers, this);
                        }
                        break;
                    case MemberSets.Inlines:
                        foreach (INavigable child in set.Children)
                        {
                            DefinedMember.CreateDefinedMember(child).Register(allMembers, this);
                        }
                        break;
                    case MemberSets.Classification:
                        //TODO: Currently can't handle typeDefs
                        //if (set.GetChildCount() != 0)
                        //{
                            classification = set.GetNthChild(0).Node;
                        //}
                        //else
                        //{
                            //Console.WriteLine("TypeDefinition.cs Membersets.Classification not fully implemented yet!");
                            //Console.WriteLine("\n\nset.Parent tree: ");
                            //set.Parent.PrintTreeText();
                            //classification = set.GetNthChild(0).Node;
                        //}
                        break;
                    case MemberSets.SuperTypes:
                        //no op - handled during linking
                        break;
                    case MemberSets.Enumerations:
                        //nested types
                        foreach (INavigable enumeration in set.Children)
                        {
                            TypeDefinition node = new TypeDefinition(enumeration);
                            node.CreateThisReference();
                            nestedTypes.Add(enumeration.Code, node);
                            nestedTypes[enumeration.Code].ParentScope = this;

                            //register each of the values
                            foreach (INavigable value in myNavigable.FromTypeGetSet(MemberSets.Values))
                            {
                                DefinedMember.CreateDefinedMember(value).Register(allMembers, this);
                            }
                        }
                        break;
                    case MemberSets.Values:
                        //main type
                        foreach (INavigable value in set.Children)
                        {
                            //register the value
                            DefinedMember.CreateDefinedMember(value).Register(allMembers, this);
                        }
                        break;
                    case MemberSets.Fields:
                        foreach (INavigable field in set.Children)
                        {
                            DefinedMember.CreateDefinedMember(field).Register(allMembers, this);
                        }
                        break;
                    case MemberSets.Types:
                        //recursive step deals with each nested type
                        foreach (INavigable nType in set.Children)
                        {
                            //create the nested type and register it within this type
                            TypeDefinition temp = new TypeDefinition(nType);
                            temp.CreateThisReference();
                            nestedTypes.Add(nType.Code, temp);
                            temp.ParentScope = this;
                            temp.RecursiveRegisterMembers();
                        }
                        break;
                    case MemberSets.ModifierSet:
                        //no op - currently of no interest
                        break;
                    default:
                        throw new InvalidCastException("Unknown member set " + set);
                }
            }
        }
        #endregion

        #region Linking
        public List<DefinedMember> GetMembers(string memberName)
        {
            //search for all defined members which match
            List<DefinedMember> answer = new List<DefinedMember>();
            foreach (DefinedMember d in allMembers)
            {
                if (d.Represented.Code.Equals(memberName))
                {
                    answer.Add(d);
                }
            }

            if (answer.Count > 0)
            {
                //this member is already known so we return it
                return answer;
            }

            //this member must be simulated
            answer.Add(AddSimulatedMember(NodeFactory.CreateNode(Members.Variable, memberName, false)));

            return answer;
        }

        private bool typeInitialized = false;
        private static object inheritanceMutex = new object();
        private bool reportCompletion = true;
        /// <summary>
        /// Called on all types to link themselves and their members to 
        /// their type definitions prior to the full linking process.
        /// </summary>
        public override void InitialLink()
        {
            if (typeInitialized)
            {
                throw new InvalidOperationException(represented + " has already been initialzed once. Duplicate initialization error");
            }
            typeInitialized = true;

            //all simulated types can avoid linking altogether.
            if (isSimulated)
            {
                return;
            }

            INavigable myNavigable = (INavigable)represented;

            //add the standard language library to all classes
            HierarchyNode standardImport = Package.GetImport((INavigable)NodeFactory.CreateNode(Members.Import, TypeDefinition.standardLibrary, false));
            AddImport(standardImport);
            standardImport.WasImportedBy(this);

            //Link my imports
            foreach (INavigable p in myNavigable.Parent.GetAllFirstLayer(Members.Import))
            {
                //determine if the import is static
                bool isStaticImport = false;//assumption
                if (p.GetChildCount() > 0)
                {
                    //disprove assumption - verify if this is a static import
                    List<INavigable> modifiers = p.GetFirstSingleLayer(MemberSets.ModifierSet).Children;
                    foreach (INavigable n in modifiers)
                    {
                        if (n.Node.Equals(Members.Static))
                        {
                            //this is a static import
                            isStaticImport = true;
                            break;
                        }
                    }
                }

                if (isStaticImport)
                {
                    //find the import base class
                    string importName;
                    TypeDefinition staticBase = Package.GetStaticImport(p, out importName);

                    //search for a nested type in the base class
                    TypeDefinition nested = null;
                    if (staticBase.nestedTypes.ContainsKey(importName))
                    {
                        nested = staticBase.nestedTypes[importName];
                    }

                    if (importName.Equals("*"))
                    {
                        //TODO Implement static import, linking all the members of this type
                        //to the type which imports them.
                        Console.WriteLine("Complete static import from " + staticBase);
                    }
                    else if (nested == null)
                    {
                        //if there was no matching nested class, this must be a member (possibly a set of overloaded methods)
                        List<DefinedMember> imports = staticBase.GetMembers(importName);
                        foreach (DefinedMember d in imports)
                        {
                            staticImports.Add(d);
                        }
                    }
                    else
                    {
                        //there is exactly one nested class
                        AddImport(nested);
                        nested.WasImportedBy(this);
                    }
                }
                else
                {
                    HierarchyNode import = Package.GetImport(p);
                    AddImport(import);
                    import.WasImportedBy(this);
                }
            }

            //Copys the imports from the parent class to the nested class (if any)
            foreach (string s in nestedTypes.Keys)
            {
                TypeDefinition tNode = nestedTypes[s];

                //add knowledge from next highest nested node.
                tNode.AddImport(importStatements);

                //adds knowledge of all siblings in this level
                foreach (string k in nestedTypes.Keys)
                {
                    tNode.AddImport(nestedTypes[k]);
                }

                //adds knowledge of the parent itself
                tNode.AddImport(this);
            }

            foreach (INavigable modifier in myNavigable.GetFirstSingleLayer(MemberSets.ModifierSet).Children)
            {
                this.AddRelationship(new Annotation(modifier), Relationship.Annotation, new Statement(this, modifier));
            }

            //Link my parent types
            foreach (INavigable superType in myNavigable.GetFirstSingleLayer(MemberSets.SuperTypes).Children)
            {
                if (superType.Node.Equals(Members.Sub_Type))
                {
                    continue;
                }

                //identify the definition and determine its classification
                List<INavigable> classes = new List<INavigable>();
                HierarchyNode superDef = null;
                if (Package.IsPackage(superType))
                {
                    //the initial node is a package name
                    superDef = Package.GetKnownPackage(superType.Code);
                }
                else
                {
                    //the initial node is a type name
                    superDef = SearchScopeForType(superType.Code);
                }

                //use recursive method to find
                TypeDefinition extends = (TypeDefinition)FindSuperTypeClasses(superType, superDef, classes);

                if (extends == TypeDefinition.HeadType)
                {
                    continue;//no need to directly extend object
                }

                if (extends.IsSimulated)
                {
                    //Simulated types will have no valid classification information
                    //use classification deduced from method of inheritance
                    extends.classification = classes[0].Node;
                }
                else if (classes[0].Node.Equals(Members.ANONYMOUS))
                {
                    //Anonymous classification only occurs in anonymous classes. We can't know
                    //what classification it is, although we could make an assumption. There is no need
                    //to make an assumption any longer, but also nothing we can learn. We will
                    //leave the declared classification as it is.
                }
                else if (!extends.Classification.Equals(classes[0].Node))
                {
                    //this occurs when the deduced classification conflicts with that of a type defined in the code.
                    throw new DataMisalignedException(extends.Classification + " " + extends + " is inherited by " + this + " as a " + classes[0]);
                }

                //add the permanent realtionship to the super class                
                lock (inheritanceMutex)
                {
                    if (extends.childrenClasses.Contains(this))
                    {
                        throw new InvalidOperationException("Parent type " + extends + " already contains a child type " + this);
                    }

                    if (extends.IsDecendantOf(this))
                    {
                        throw new InvalidOperationException("Circular inheritance between " + extends + " in " + extends.represented.FileName + " and " + this + " in " + this.represented.FileName);
                    }
                    parentTypes.Add(extends);
                    extends.childrenClasses.Add(this);
                }

                //validate multiple inheritance prohibition
                if (extends.Classification.Equals(Members.CLASS))
                {
                    lock (ParentClass)
                    {
                        //this is the assumed parent of all types
                        if (ParentClass != TypeDefinition.HeadType)
                        {
                            throw new InvalidOperationException("Multiple inheritance found in " + this);
                        }
                        ParentClass = extends;
                    }
                }
            }

            if (ParentClass == TypeDefinition.HeadType)
            {
                //this type is still the child of the object class
                lock (inheritanceMutex)
                {
                    if (ParentClass.childrenClasses.Contains(this))
                    {
                        throw new InvalidOperationException("Parent type " + ParentClass + " already contains a child type " + this);
                    }
                    ParentClass.childrenClasses.Add(this);
                }
            }

            //call each defined member to link itself
            foreach (DefinedMember m in allMembers)
            {
                m.InitialLink();
            }

            foreach (string k in nestedTypes.Keys)
            {
                nestedTypes[k].InitialLink();
            }

            if (anonLinks.Count > 0)
            {
                foreach (INavigable n in anonLinks.Keys)
                {
                    bool found = false;
                    foreach (string k in nestedTypes.Keys)
                    {
                        if (n.Code.Equals(k))
                        {
                            found = true;
                            nestedTypes[k].FinalAnonLink(anonLinks[n]);
                            break;
                        }
                    }

                    if (!found)
                    {
                        throw new InvalidCastException("Anonymous class not found: " + n.Code + "\t" + n.FileName);
                    }
                }
            }
        }

        public override HierarchyNode FindInHierarchy(string name)
        {
            return getNestedType(name);
        }

        private HierarchyNode FindSuperTypeClasses(INavigable currType, HierarchyNode currDef, List<INavigable> classes)
        {
            foreach (INavigable c in currType.Children)
            {
                if (c.Node.IsClassification)
                {
                    classes.Add(c);
                }
                else if (c.Node.Equals(Members.Sub_Type))
                {
                    //no op we will ignore sub types
                }
                else if (c.Node.Equals(Members.DotOperator))
                {
                    //this is actually a nested type.
                    //the currType is wrong and extends is invalid.
                    INavigable newType = c.GetNthChild(0);

                    HierarchyNode newDef = null;
                    if (currDef.Represented.Node.Equals(Members.Package) && newType.Node.Equals(Members.SuperType))
                    {
                        //this is the super type inside of a package. It may exist already
                        Package p = ((Package)currDef);
                        newDef = p.FindTypeDefinition(newType.Code);
                        if (newDef == null)
                        {
                            //or it may need to be simulated.
                            newDef = p.RegisterType(TypeDefinition.CreateSimulatedType(newType.Code, false));
                        }
                    }
                    else
                    {
                        newDef = currDef.FindInHierarchy(newType.Code);
                    }

                    return FindSuperTypeClasses(newType, newDef, classes);
                }
                else
                {
                    throw new InvalidOperationException("TypeDefinition.FindSuperTypeClasses unknown child node: " + c.Node);
                }
            }

            //only one classification is valid. Any other count is invalid values
            if (classes.Count != 1)
            {
                throw new IndexOutOfRangeException("Parent type " + currType + " has " + classes.Count + " classifications");
            }
            return currDef;
        }

        public override HierarchyNode RecursiveFollow(string[] packageParts, int index)
        {
            //end case - Reached the end of the indentifierSet
            if (packageParts.Length == index)
            {
                return this;
            }

            string key = packageParts[index];
            HierarchyNode next = null;
            lock (nestedTypes)
            {
                if (nestedTypes.ContainsKey(key))
                {
                    next = nestedTypes[key];
                }
                else if (this.IsSimulated)
                {
                    //create the type
                    next = TypeDefinition.CreateSimulatedType(key, false);
                    nestedTypes.Add(key, (TypeDefinition)next);
                }
                else
                {
                    throw new InvalidOperationException("Unable to locate nested type " + key + " in " + this);
                }
            }

            //recursive step
            return next.RecursiveFollow(packageParts, index + 1);
        }

        public override void FullLink()
        {
            if (!typeInitialized)
            {
                throw new InvalidOperationException(represented + " has not been initialzed prior to full Link.");
            }

            List<InvokableMember> allMethods = new List<InvokableMember>();

            //link my members (fields and methods)
            foreach (DefinedMember d in allMembers)
            {
                d.FullLink();

                if (d.Represented.Node.IsMethodDefinition)
                {
                    allMethods.Add((InvokableMember) d);
                }
            }

            lock (inheritanceMutex)
            {
                foreach (TypeDefinition c in childrenClasses)
                {
                    c.LinkParentDefinitions(new List<InvokableMember>(allMethods));
                }
            }

            foreach (string k in nestedTypes.Keys)
            {
                nestedTypes[k].reportCompletion = false;
                nestedTypes[k].FullLink();
            }

            if (reportCompletion)
            {
                UpdateLinkCount(-1);
            }
            reportCompletion = true;
        }

        private void LinkParentDefinitions(List<InvokableMember> parentMembers)
        {
            List<InvokableMember> linked = new List<InvokableMember>();
            foreach (InvokableMember parentMember in parentMembers)
            {
                if (parentMember.Represented.Code.Equals("static"))
                {
                    continue;//static members are NOT linkable.
                }

                List<InvokableMember> myCandidates = new List<InvokableMember>();
                foreach (DefinedMember myMember in allMembers)
                {
                    if (myMember.Represented.Node.IsMethodDefinition)
                    {
                        if (((InvokableMember)myMember).IsOverrideOf(parentMember))
                        {
                            myCandidates.Add((InvokableMember)myMember);
                        }
                    }
                }

                if (myCandidates.Count == 1)
                {
                    //exactly one override which is fine
                    myCandidates[0].Overrides((InvokableMember)parentMember);
                    linked.Add(parentMember);
                }
                else if (myCandidates.Count > 0 && parentMember.IsSimulated)
                {
                    //Because the method is simulated, there is no way to know which if any of these is a match
                    //Therefore we shall skip it.
                    // no op
                }
                else if (myCandidates.Count > 0)
                {
                    //more than one possible override; shouldn't happen
                    Console.WriteLine("Too many matches for "+parentMember);

                    foreach (InvokableMember im in myCandidates)
                    {
                        Console.WriteLine(im + "\tin\t" + im.Represented.FileName);
                    }

                    throw new InvalidOperationException(parentMember + " matches against multiple method definitions in child " + this);
                }
                //else no override, which is fine.
            }

            //remove any parent members which were successfully linked any child of this type
            //which overrides the same method should be linked to the definition in this type
            foreach (InvokableMember l in linked)
            {
                parentMembers.Remove(l);
            }

            if (parentMembers.Count == 0)
            {
                return;//end of parent list
            }

            lock (inheritanceMutex)
            {
                //pass on the rest of the parent list
                foreach (TypeDefinition c in childrenClasses)
                {
                    c.LinkParentDefinitions(parentMembers);
                }
            }
        }

        public override DefinedMember LinkToMember(INavigable targetNode, ChainArgs args)
        {
            INavigable next = GetDotChild(targetNode);

            if (targetNode.Node.Equals(Members.ArrayInvoke))
            {
                //array invoke should be handled at the type level
                return FindChainEnd(targetNode, args);
            }

            if (targetNode.Node.Equals(Members.TypeName))
            {
                //this is a type within another type.
                TypeDefinition targetDef = getNestedType(targetNode.Code);
                LinkAccess(this, targetDef, args.OriginStatement);
                return targetDef.LinkToMember(next, args);
            }

            if (nestedTypes.ContainsKey(targetNode.Code))
            {
                TypeDefinition nested = nestedTypes[targetNode.Code];

                DefinedMember d = null;
                if (targetNode.Node.Equals(Members.ConstructorInvoke))
                {
                    //this is a constructor from a nested class
                    d = nested.FindChainEnd(targetNode, args);
                }
                else
                {
                    //this is a member of the nested class
                    d = nested.FindChainEnd(GetDotChild(targetNode), args);
                }

                return d;
            }
            
            DefinedMember memberDef = FindMemberInTypeHierarchy(targetNode, args);            
            if (memberDef == null)
            {
                //the member does not exist in the type hierarchy; create a simulated one.
                memberDef = AddSimulatedMember(targetNode);
            }

            //link parameters for any method call
            if (targetNode.Node.IsInvocation)
            {
                ((InvokableMember)memberDef).LinkParameters(targetNode, args);
            }

            return LinkChainMember(targetNode, memberDef, next, args);
        }
        #endregion

        #region From GraphNode
        public override void ExploreGraph(ExploreModes mode)
        {
            SaveThisNode();

            if (mode == ExploreModes.Touch || explored)
            {
                return;
            }

            explored = true;

            ((IModifiable)represented).SetNode(classification.GetMembers());

            foreach (GraphNode g in FindRelationships())
            {
                g.ExploreGraph(ExploreModes.Touch);
            }

            foreach (DefinedMember d in allMembers)
            {
                d.ExploreGraph(ExploreModes.Full);
            }

            foreach (string s in nestedTypes.Keys)
            {
                nestedTypes[s].ExploreGraph(ExploreModes.Full);
            }

            foreach (TypeDefinition d in parentTypes)
            {
                d.ExploreGraph(ExploreModes.Touch);
            }

            foreach (DefinedMember d in staticImports)
            {
                d.ExploreGraph(ExploreModes.Touch);
            }

            foreach (HierarchyNode d in importStatements)
            {
                d.ExploreGraph(ExploreModes.Touch);
            }

            foreach (Literal l in literals)
            {
                l.ExploreGraph(ExploreModes.Touch);
            }

            foreach (DefinedMember d in instances)
            {
                d.ExploreGraph(ExploreModes.Touch);
            }

            foreach (DefinedMember d in subTypeInstants)
            {
                d.ExploreGraph(ExploreModes.Touch);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();

            foreach (DefinedMember d in allMembers)
            {
                WriteMember(d);
            }

            foreach (string s in nestedTypes.Keys)
            {
                WriteMember(nestedTypes[s]);
                WriteEdge(myNodeID, nestedTypes[s].SaveThisNode(), NO_SCOPE, Relationship.FileDown, 1);
                WriteEdge(nestedTypes[s].SaveThisNode(), myNodeID, NO_SCOPE, Relationship.FileUp, 1);
            }

            foreach (TypeDefinition d in parentTypes)
            {
                WriteEdge(myNodeID, d.SaveThisNode(), NO_SCOPE, Relationship.ParentType, 1);
                WriteEdge(d.SaveThisNode(), myNodeID, NO_SCOPE, Relationship.ChildType, 1);
            }

            foreach (DefinedMember d in staticImports)
            {
                WriteEdge(myNodeID, d.SaveThisNode(), NO_SCOPE, Relationship.Imports, 1);
            }

            foreach (HierarchyNode d in importStatements)
            {
                WriteEdge(myNodeID, d.SaveThisNode(), NO_SCOPE, Relationship.Imports, 1);
            }

            foreach (Literal l in literals)
            {
                long lID = l.SaveThisNode();
                WriteEdge(myNodeID, lID, lID, Relationship.DefinitionOf, 1);
                WriteEdge(lID, myNodeID, lID, Relationship.InstanceOf, 1);
            }

            foreach (DefinedMember d in instances)
            {
                long dID = d.SaveThisNode();
                WriteEdge(myNodeID, dID, dID, Relationship.DefinitionOf, 1);
                WriteEdge(dID, myNodeID, dID, Relationship.InstanceOf, 1);
            }

            foreach (DefinedMember d in subTypeInstants)
            {
                long dID = d.SaveThisNode();
                WriteEdge(myNodeID, dID, dID, Relationship.SubDefinitionOf, 1);
                WriteEdge(dID, myNodeID, dID, Relationship.SubInstanceOf, 1);
            }
        }

        public override TypeDefinition SearchUpToType()
        {
            return this;
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    TypeDefinition other = (TypeDefinition)gn;
                    INode otherNode = other.Represented;

                    bool sameCode = represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;

                    if (this.isSimulated)
                    {
                        return sameCode && other.IsSimulated && this == gn;//can perform direct comparison of memory location for simulated types
                    }

                    //non-simulated types should be on different lines and in different files.
                    bool sameLine = represented.OnSameLineAs(otherNode);
                    bool sameFile = represented.FileName.Equals(otherNode.FileName);

                    return (sameCode && sameLine && sameFile);
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override void AddAnonymousLink(GraphNode al, INavigable n)
        {
            anonLinks.Add(n,al);
        }

        private void FinalAnonLink(GraphNode g)
        {
            myAnonLink = g;
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            //all truncated searches end at the first type that is not always the type which started the search, 
            //but it is always the first type above the use of the node.
            return null;
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            INavigable next = GetDotChild(targetNode);

            if (targetNode.Node.Equals(Members.Literal))
            {
                return LinkChainMember(targetNode, Literal.Create(targetNode, args.ParameterScope), next, args);
            }

            bool myName = targetNode.Code.Equals(this.represented.Code);

            //is it a type known to this class?
            TypeDefinition foundType = null;
            if (targetNode.Node.IsNamedType)
            {
                //try each of three sources for a type
                if (myName)
                {
                    foundType = this;
                }
                else if (nestedTypes.ContainsKey(targetNode.Code))
                {
                    foundType = nestedTypes[targetNode.Code];
                }
                else //may be an imported type
                {                    
                    foreach (HierarchyNode h in importStatements)
                    {
                        foundType = h.FindTypeDefinition(targetNode.Code);
                        if (foundType != null)
                        {
                            //early end rather than keep searching
                            break;
                        }
                    }
                }
               
                if (foundType == null)
                {
                    //still no such type found
                    //original parameter scope may have type.
                    foundType = args.ParameterScope.SearchScopeForType(targetNode.Code);
                }

                if (foundType == null)
                {
                    throw new InvalidOperationException("No such type found in " + this + ": " + targetNode);
                }
            }

            //TypeNames are shortcut because they link directly to some member of that type
            if (targetNode.Node.Equals(Members.TypeName))
            {
                //need to check other children
                CheckChildren(targetNode, foundType, args);

                //continue chain
                if (next == null)
                {
                    //should never occur. This indicates that the end of a chain is a type, which makes no sense
                    throw new InvalidOperationException("End of chain found to be type:" + targetNode);
                }
                else
                {
                    return foundType.LinkToMember(next, args);
                }
            }

            //ArrayInvokes are shortcut because they are treated as a temporary variable 
            if (targetNode.Node.Equals(Members.ArrayInvoke))
            {
                AnonArray array = (AnonArray)DefinedMember.CreateDefinedMember(targetNode);
                array.Register(new List<DefinedMember>(), args.ParameterScope);
                array.InitialLink();
                array.FullLink();

                return array;
            }

            //first search within known hierary for already-existant member
            DefinedMember targetDefinition = FindMemberInTypeHierarchy(targetNode, args);

            //if (targetDefinition == null)
            //{
            //    //only applies to nested classes so they can access the next nesting up
            //    targetDefinition = FindMemberInNestedHierarchy(targetNode, args);
            //}

            if (targetNode.Node.Equals(Members.ConstructorInvoke) && !myName)
            {
                //this is a constructor from a class other than this one
                targetDefinition = foundType.FindMemberInTypeHierarchy(targetNode, args);
            }

            if (targetNode.Node.Equals(Members.SuperConstructorInvoke))
            {
                //super constructors need to be chosen from the Parent type
                targetDefinition = ParentClass.FindMemberInTypeHierarchy(targetNode, args);
            }

            //No match found yet. May be in parameterScope
            if (targetDefinition == null && targetNode.Node.Equals(Members.Variable))
            {
                //final possibility that parameter scope has type.
                targetDefinition = args.ParameterScope.TruncatedSearch(targetNode, args.ParameterScope, this);
            }

            //look for endNode matching identifier
            if (targetDefinition == null && Package.IsPackage(targetNode))
            {
                //is a endNode, already linked, return result
                DefinedMember finalDef = ParentScope.FindChainEnd(targetNode, args);
                if (finalDef == null)
                {
                    throw new InvalidOperationException("End of endNode chain returns null:" + targetNode);
                }
                return finalDef;
            }

            //check for specific types matching this variable name
            bool fromImports = false;
            if (targetDefinition == null && targetNode.Node.Equals(Members.Variable))
            {
                if (nestedTypes.ContainsKey(targetNode.Code))
                {
                    TypeDefinition d = nestedTypes[targetNode.Code];

                    if (d != null)
                    {
                        //a match is found, now continue the chain
                        if (next == null)
                        {
                            throw new InvalidOperationException("Cannot use reference " + targetNode + " to type " + d + " as a defined member.");
                        }
                        else
                        {
                            targetDefinition = d.LinkToMember(next, args);
                            fromImports = true;
                        }
                    }
                }
            }

            if (targetDefinition == null && targetNode.Node.Equals(Members.Variable))
            {
                //is this type itself a match (i.e. referring to its own static members as in Type.do()
                if (targetNode.Code.Equals(this.represented.Code))
                {
                    if (next == null)
                    {
                        throw new InvalidOperationException("Cannot use reference " + targetNode + " to type " + this + " as a defined member.");
                    }
                    else
                    {
                        return this.LinkToMember(next, args);
                    }
                }

                TypeDefinition importedType = SearchImports(targetNode);

                if (importedType != null)
                {
                    //a match is found, now continue the chain
                    if (next == null)
                    {
                        throw new InvalidOperationException("Cannot use reference " + targetNode + " to type " + importedType + " as a defined member.");
                    }
                    else
                    {
                        targetDefinition = importedType.LinkToMember(next, args);
                        fromImports = true;
                    }
                }
            }

            if (targetDefinition == null)
            {
                if (targetNode.Node.Equals(Members.ConstructorInvoke) && !myName)
                {
                    //this was an outside constructor, but one which was not found in the class
                    //So, we must simulate a member but in the indicated class
                    targetDefinition = foundType.AddSimulatedMember(targetNode);
                }
                else
                {
                    //we must simulate a member in the hierarchy
                    targetDefinition = AddSimulatedMember(targetNode);
                }
            }

            //link parameters for any method call
            if (targetNode.Node.IsInvocation)
            {
                ((InvokableMember)targetDefinition).LinkParameters(targetNode, args);
            }

            //match has been identified, either as already existent member or a newly simulated one.

            DefinedMember last = args.LastMember;
            if (last != null)
            {
                LinkAccess(last, targetDefinition, args.OriginStatement);
            }
            else if (targetNode.Node.IsInvocation)
            {
                //TODO determine what if anything should be done here
            }

            if (fromImports)
            {
                return targetDefinition;//already linked to chain
            }

            return LinkChainMember(targetNode, targetDefinition, next, args);
        }

        private TypeDefinition SearchImports(INavigable targetNode)
        {
            foreach (HierarchyNode h in importStatements)
            {
                TypeDefinition temp = null;
                if (h.Represented.Node.Equals(Members.Package))
                {
                    temp = ((Package)h).FindTypeDefinition(targetNode.Code);
                }
                else if (h.Represented.Code.Equals(targetNode.Code))
                {
                    temp = (TypeDefinition)h;
                }

                if (temp != null)
                {
                    return temp;
                }
            }
            return null;
        }

        public override TypeDefinition FindTypeDefinition(string typeName)
        {
            if (this.represented.Code.Equals(typeName))
            {
                return this;
            }
            return null;
        }

        /// <summary>
        /// Knowing that no existing member matches the description, force
        /// the creation of a simulated member on the first simulated parent class
        /// </summary>
        /// <param name="targetNode"></param>
        /// <returns></returns>
        private DefinedMember AddSimulatedMember(INode targetNode)
        {
            //simulated types have simulated members which may or may not need to be defined.
            if (isSimulated)
            {
                //no match was found so we create a stub node, add it to this member and return that
                return SimulateOutLibrary(targetNode);
            }

            //recurse up to parent definition
            return ParentClass.AddSimulatedMember(targetNode);
        }

        private DefinedMember FindMemberInNestedHierarchy(INavigable targetNode, ChainArgs args)
        {
            //search within this type.
            List<DefinedMember> matches = new List<DefinedMember>();
            GetMatches(targetNode, matches, allMembers);

            if (matches.Count > 0)
            {
                //if something is found
                return HandleMatches(targetNode, matches, args);
            }

            if (ParentScope.Represented.Node.Equals(Members.TypeDeclaration))
            {
                //the parent scope is also a type
                TypeDefinition p = ((TypeDefinition)ParentScope);
                DefinedMember d = p.FindMemberInNestedHierarchy(targetNode, args);
                if (d != null)
                {
                    return d;
                }

                d = p.FindMemberInTypeHierarchy(targetNode, args);

                if (d != null)
                {
                    return d;
                }
            }

            return null;
        }

        /// <summary>
        /// Recursive method that finds sinlge matching targetNode within this type or a parent type
        /// </summary>
        /// <param name="targetNode"></param>
        /// <param name="parameterScope"></param>
        /// <returns></returns>
        private DefinedMember FindMemberInTypeHierarchy(INavigable targetNode, ChainArgs args)
        {
            //some possible non-member matches
            if (targetNode.Node.Equals(Members.SelfReference))
            {
                return thisReference;
            }
            else if (targetNode.Node.Equals(Members.SuperReference))
            {
                return ParentClass.thisReference;
            }

            //Naive search within this Type
            List<DefinedMember> matches = new List<DefinedMember>();
            GetMatches(targetNode, matches, allMembers);

            //capture matches for all static imports as if they were normal members
            GetMatches(targetNode, matches, staticImports);

            if (matches.Count > 0)
            {
                return HandleMatches(targetNode, matches, args);
            }

            //base case will return from Object if no match has been found
            if (this == TypeDefinition.HeadType)
            {
                return null;
            }

            if (myAnonLink != null)
            {
                //this is an anonymous type and there may be a non-simulated member in the parent type of the anonymous type.
                //nothing was found so we will search up the host type and possibly create a simulated member
                DefinedMember d = myAnonLink.SearchUpToType().FindMemberInTypeHierarchy(targetNode, args);
                if (d != null)
                {
                    return d;
                }
            }

            if (ParentScope.Represented.Node.Equals(Members.TypeDeclaration))
            {
                //this is a nested type with a parent class
                DefinedMember d = ((TypeDefinition)ParentScope).FindMemberInNestedHierarchy(targetNode, args);
                if (d != null)
                {
                    return d;
                }
            }

            //recurse up to parent definition
            return ParentClass.FindMemberInTypeHierarchy(targetNode, args);
        }

        private DefinedMember HandleMatches(INavigable targetNode, List<DefinedMember> matches, ChainArgs args)
        {
            //determine if one of the matches is sufficiently accurate
            if (targetNode.Node.IsInvocation)
            {
                //we will check if there are some exact matches
                List<DefinedMember> exacts = new List<DefinedMember>();
                foreach (DefinedMember g in matches)
                {
                    List<Field> ps = ((InvokableMember)g).GetParameters();
                    //an exact match has the same number of paramters (including zero)
                    if (ps.Count == 0 || !((INavigable)ps[ps.Count - 1].Represented).Expandable)
                    {
                        exacts.Add(g);
                    }
                }

                //if there are some matches which are exact, then we can excluded expanded sets.
                if (exacts.Count > 0 && exacts.Count < matches.Count)
                {
                    matches = exacts;
                }

                //a single match is always THE right match barring a compilation error in types.
                if (matches.Count == 1)
                {
                    return matches[0];
                }
                else if (matches.Count > 1)
                {
                    List<InvokableMember> methodMatches = new List<InvokableMember>();
                    foreach (DefinedMember dm in matches)
                    {
                        methodMatches.Add((InvokableMember)dm);
                    }

                    List<GraphNode> paramTypes = new List<GraphNode>();
                    List<INavigable> myParams = targetNode.GetFirstSingleLayer(Members.ParameterList).Children;

                    foreach (INavigable p in myParams)
                    {
                        paramTypes.Add(DiscoverTypeFromParts(p.GetNthChild(0), args.ParameterScope));
                    }

                    return InvokableMember.GetBestMatch(targetNode, args.ParameterScope, methodMatches, paramTypes, myParams);
                }
            }
            else if (targetNode.Node.Equals(Members.Variable))
            {
                //parameters should have only one match or zero. Anything else is an error.
                if (matches.Count == 1)
                {
                    return matches[0];
                }
                else if (matches.Count > 1)
                {
                    throw new InvalidOperationException("SearchWithinType found more than one match for Variable type " + targetNode);
                }
                else
                {
                    //the "variable" is actually a type name and it matches this type.
                    if (this.represented.Code.Equals(targetNode.Code) && targetNode.Node.Equals(Members.Variable))
                    {
                        return thisReference;
                    }
                }
            }

            //Look for whatever else comes into this logic.
            throw new InvalidCastException("HandleMatches found unknown type " + targetNode);
        }

        private void GetMatches(INavigable targetNode, List<DefinedMember> answerList, List<DefinedMember> sourceList)
        {
            //enforce atomicity of list search.
            lock (sourceList)
            {
                foreach (DefinedMember g in sourceList)
                {
                    //disqualify non-maching identifiers
                    if (targetNode.Node.Equals(Members.SelfConstructorInvoke) || targetNode.Node.Equals(Members.SuperConstructorInvoke))
                    {
                        if (!g.Represented.Node.Equals(Members.Constructor))
                        {
                            continue;
                        }
                    }

                    if (NodeFactory.IsCasualMatch(targetNode, g.Represented, g.IsSimulated))
                    {
                        answerList.Add(g);
                    }
                }
            }
        }
        #endregion

        /// <summary>
        /// Identifies the simulated member of a simulated type, creating a new one for the collection if required.
        /// </summary>
        /// <param name="targetNode"></param>
        /// <returns></returns>
        private DefinedMember SimulateOutLibrary(INode targetNode)
        {
            //create a new member and return
            NodeType node = targetNode.Node;
            List<NodeType> compliments = node.GetCompliments();

            if (compliments[0].Equals(Members.TypeDeclaration))
            {
                throw new InvalidCastException("TypeDeclarations should not be simulated in " + this + ": " + targetNode);
            }

            lock (allMembers)
            {
                //use the first of any compliments as the simulant type
                string code = targetNode.Code;
                if (compliments[0].Equals(Members.Constructor))
                {
                    //forces super constructors added to this parent to be named correctly
                    code = this.represented.Code;
                }
                DefinedMember g = DefinedMember.CreateDefinedMember(NodeFactory.CreateNode(compliments[0], code));

                //check for and return any member which matches
                foreach (DefinedMember m in allMembers)
                {
                    if (g.Equals(m))
                    {
                        return m;
                    }
                }

                //no match found above so register and link the new member.
                g.SetSimulated(true);
                g.Register(allMembers, this);
                g.SimulateLinking(NodeFactory.CreateNode(Members.TypeDeclaration, TypeDefinition.HeadType.represented.Code, false));

                //now that we have created a new simulated member (which has just been discovered), we need to link to any child classes
                if (compliments[0].IsMethodDefinition)
                {
                    lock (inheritanceMutex)
                    {
                        foreach (TypeDefinition c in childrenClasses)
                        {
                            List<InvokableMember> newMethod = new List<InvokableMember>();
                            newMethod.Add((InvokableMember)g);

                            c.LinkParentDefinitions(newMethod);
                        }
                    }
                }

                return g;
            }
        }

        public bool IsDecendantOf(GraphNode possibleAncestor)
        {
            if (this == possibleAncestor)
            {
                return true;
            }

            if (this==TypeDefinition.HeadType)
            {
                return false;
            }

            foreach (TypeDefinition o in parentTypes)
            {
                if (o.IsDecendantOf(possibleAncestor))
                {
                    return true;
                }
            }

            return false;
        }

        public TypeDefinition FindNestedType(INavigable type, ChainArgs args, out int arrayDegree)
        {
            HierarchyNode currentH = null;
            if (Package.IsPackage(type))
            {
                //the initial node is a package name
                currentH = Package.GetKnownPackage(type.Code);
            }
            else
            {
                //the initial node is a type name
                currentH = SearchScopeForType(type.Code);
            }
            INavigable currTypeNode = type;
            INavigable child = GetDotChild(currTypeNode);

            HierarchyNode lastH = null;
            while (child != null)
            {
                currTypeNode = child;
                lastH = currentH;
                child = GetDotChild(currTypeNode);

                if (lastH.Represented.Node.Equals(Members.Package))
                {
                    currentH = ((Package)lastH).FindTypeDefinition(currTypeNode.Code);

                    if (currentH == null && child ==null)
                    {
                        //no known type was found, but a type MUST be found
                        currentH = ((Package)lastH).RegisterType(TypeDefinition.CreateSimulatedType(currTypeNode.Code, false));
                    }
                    else if (currentH == null)
                    {
                        //no known type, but it might be a package
                        //this allows you to create a simulated package
                        currentH = lastH.FindInHierarchy(currTypeNode.Code);
                    }
                }
                else
                {
                    currentH = lastH.FindInHierarchy(currTypeNode.Code);
                }
            }

            TypeDefinition answer = (TypeDefinition)currentH;
            arrayDegree = currTypeNode.ArrayDegree;
            return answer;
        }

        public TypeDefinition FindType(string typeName)
        {
            //short evaluation for primitive types. By definition these 
            //must be out of the library of code.
            if (literalMapping.ContainsKey(typeName))
            {
                return NativeTypes[literalMapping[typeName]];
            }

            //This is a type and it has the right name
            if (represented.Code.Equals(typeName))
            {
                return this;
            }

            //exceptional case for a self reference. Exits early returning the first type declaration
            if (typeName.Equals("this"))
            {
                //BSD Shouldn't this be handled by FindChainEnd?
                return this;
            }

            //exception case for a super reference. Exits early returning the parent type declaration
            if (typeName.Equals("super"))
            {
                //BSD Shouldn't this be handled by FindChainEnd?
                return ParentClass;
            }

            //search within all nested types
            if (nestedTypes.ContainsKey(typeName))
            {
                return nestedTypes[typeName];
            }

            //search within the known types and packages to find the matching type
            lock (importStatements)
            {
                int count = importStatements.Count;
                foreach (HierarchyNode h in importStatements)
                {
                    NodeType node = h.Represented.Node;

                    if (node.Equals(Members.TypeDeclaration))
                    {
                        if (h.Represented.Code.Equals(typeName))
                        {
                            return (TypeDefinition)h;
                        }
                        else
                        {
                            TypeDefinition d = ((TypeDefinition)h).SearchPublicNestedType(typeName);
                            if(d!=null)
                            {
                                return d;
                            }
                        }
                    }
                    else if (node.Equals(Members.Package))
                    {
                        TypeDefinition d = ((Package)h).FindTypeDefinition(typeName);
                        if (d != null)
                        {
                            return d;
                        }
                    }
                    else
                    {
                        throw new InvalidOperationException("GraphNode.SearchForType found unknown knowledge link in " + this + " to " + h);
                    }
                }
            }

            //the type is not primitive and it is not within the known library
            //therefore, it must be out library
            return Package.GetKnownPackage(TypeDefinition.standardLibrary).GetOrCreate(typeName);
        }

        public Literal AddLiteralInstance(Literal instance)
        {
            //We only need to create one definition for each literal. 
            //If a matching node already exists we will
            //use that definition and ignore the new one created above.
            lock (literals)
            {
                int index = literals.IndexOf(instance);
                if (index > -1)
                {
                    //the definition is already known so we return that one.
                    return literals[index];
                }

                //this is a new definition, so it needs to be linked
                literals.Add(instance);

                return instance;
            }
        }

        public void AddInstantiation(DefinedMember field)
        {
            if (field == null)
            {
                throw new InvalidOperationException("Null field set as instance of "+this);
            }

            instances.Add(field);
        }

        public void AddSubTypeInstantiation(DefinedMember field)
        {
            subTypeInstants.Add(field);
        }
    }
}
