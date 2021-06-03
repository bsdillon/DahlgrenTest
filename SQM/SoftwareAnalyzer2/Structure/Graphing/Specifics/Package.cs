using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class Package : HierarchyNode
    {
        #region Graph Package Hub
        private static Dictionary<string, Package> rootPackages = new Dictionary<string, Package>();

        //These are static functions which are used only to initiated graph-wide actions.
        public static bool IsPackage(INavigable targetNode)
        {
            return rootPackages.ContainsKey(targetNode.Code);
        }

        public static void ClearRootPackages(List<string> initialPackages)
        {
            lock (rootPackages)
            {
                rootPackages.Clear();

                foreach (string p in initialPackages)
                {
                    string[] parts = p.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
                    Package root = GetRootPackage(parts[0], true);
                    root.RecursiveGetPackage(parts, 1);
                }
            }
        }

        public static void AddNativeTypes(List<string> types, Dictionary<string, TypeDefinition> collection, bool classType)
        {
            foreach (string p in types)
            {
                string[] parts = p.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
                string[] packages = new string[parts.Length - 1];
                for (int i = 0; i < packages.Length; i++)
                {
                    packages[i] = parts[i];
                }

                Package root = GetRootPackage(parts[0], true);
                Package end = root.RecursiveGetPackage(packages, 1);

                TypeDefinition type = TypeDefinition.CreateSimulatedType(parts[parts.Length - 1], classType);
                collection.Add(parts[parts.Length - 1], type);
                end.RegisterType(type);
            }
        }

        private static Package DEFAULT_PACKAGE = new Package("DEFAULT");

        /// <summary>
        /// During the registration phase classes will call this method to force the 
        /// creation of their own endNode as part of the endNode structure.
        /// </summary>
        /// <param name="packageParts"></param>
        /// <returns></returns>
        public static Package CreateNaturalPackage(INavigable pNode)
        {
            if (pNode == null)
            {
                return DEFAULT_PACKAGE;
            }

            string[] parts = pNode.Code.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
            Package root = GetRootPackage(parts[0], true);
            return root.RecursiveGetPackage(parts, 1);
        }

        /// <summary>
        /// After registration all packages are assumed to be known. Any unknown endNode will
        /// throw an error and be disallowed.
        /// </summary>
        /// <param name="longDescription"></param>
        /// <returns></returns>
        public static Package GetKnownPackage(string longDescription)
        {
            string[] parts = longDescription.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
            Package root = GetRootPackage(parts[0], true);
            return root.RecursiveGetPackage(parts, 1);
        }

        private static Package GetRootPackage(string packageName, bool forceCreate)
        {
            lock (rootPackages)
            {
                bool isKnown = rootPackages.ContainsKey(packageName);
                //Allow all p packages to be created. This version ignores the forceCreate parameter.
                if (!isKnown)
                {
                    //the head endNode is unknown. Create it and add it.
                    rootPackages.Add(packageName, new Package(packageName));
                    DEFAULT_PACKAGE.AddRelationship(rootPackages[packageName],Relationship.Member,new Statement(DEFAULT_PACKAGE,DEFAULT_PACKAGE.represented));
                }

                //This code allows the boolean parameter to indicate if a libray MUST be created.
                //if (!isKnown && forceCreate)
                //{
                //    //the head endNode is unknown. Create it and add it.
                //    rootPackages.Add(packageParts[0], new Package(packageParts[0]));
                //}
                //else if (!isKnown)
                //{
                //    //the head endNode is unknow, but creation is not allowed
                //    throw new InvalidDataException("Non-standard endNode " + packageParts[0] + " found. Are you missing an imported library?");
                //}
            }

            return rootPackages[packageName];
        }

        /// <summary>
        /// The initial linking occurs only from TypeDefinitions. While Packages do not participate, the hub 
        /// is here and this method is called to obtain a hierarchically-ordered set of all TypeDefinitions.
        /// </summary>
        /// <param name="types"></param>
        /// <returns></returns>
        public static int HubGetAllTypes(List<GraphNode> types)
        {
            DEFAULT_PACKAGE.AddTypesToSet(types);

            foreach (string s in rootPackages.Keys)
            {
                rootPackages[s].AddTypesToSet(types);
            }

            return types.Count;
        }

        //Not involved in Initial Linking - that is handled from TypeDefinitions obtained in the method above

        /// <summary>
        /// This method is called to initiate the linking of the entire graph
        /// as an asynchronous process
        /// </summary>
        public static void HubLinkAll()
        {
            Thread t = new Thread(DEFAULT_PACKAGE.FullLink);
            t.Start();

            foreach (string s in rootPackages.Keys)
            {
                t = new Thread(rootPackages[s].FullLink);
                t.Start();
            }
            allLinking = true;
        }

        /// <summary>
        /// Initiates the saving function for the graph. 
        public static void HubExplore()
        {
            DEFAULT_PACKAGE.ExploreGraph(ExploreModes.Full);

            foreach (string s in rootPackages.Keys)
            {
                rootPackages[s].ExploreGraph(ExploreModes.Full);
            }
        }
        #endregion

        private Package(string name)//private to avoid further instantiation
        {
            represented = NodeFactory.CreateNode(Members.Package, name, true);
        }

        #region Package Members
        private Dictionary<string, Package> packages = new Dictionary<string, Package>();
        private Dictionary<string, TypeDefinition> packageMembers = new Dictionary<string, TypeDefinition>();
        private Object packageLock = new object();

        //see declaration in HierarchyNode
        public override TypeDefinition FindTypeDefinition(string typeName)
        {
            lock (packageLock)
            {
                if (packageMembers.ContainsKey(typeName))
                {
                    return packageMembers[typeName];
                }
                return null;
            }
        }

        /// <summary>
        /// This method assumes that all members are packages
        /// </summary>
        /// <param name="packageParts"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        private Package RecursiveGetPackage(string[] packageParts, int index)
        {
            //end case - Reached the end of the indentifierSet
            if (index < 0 || index >= packageParts.Length)
            {
                return this;
            }

            lock (packageLock)
            {
                if (index + 1 == packageParts.Length && packageParts[index].Equals("*"))
                {
                    //this is a package import all
                    return this;
                }
                
                Debug.Assert(index >= 0 && index < packageParts.Length, "index should point to a child of packageParts");

                if (!packages.ContainsKey(packageParts[index]))
                {
                    //the head endNode is unknown. Create it and add it.
                    Package p = new Package(packageParts[index]);

                    packages.Add(packageParts[index], p);
                    p.ParentScope = this;
                }
            }

            //recursive step
            return packages[packageParts[index]].RecursiveGetPackage(packageParts, index + 1);
        }

        public override HierarchyNode RecursiveFollow(string[] packageParts, int index)
        {
            //end case - Reached the end of the indentifierSet
            if (packageParts.Length == index)
            {
                return this;
            }

            return FindInHierarchy(packageParts[index]).RecursiveFollow(packageParts, index + 1);
            //string key = packageParts[index];
            //HierarchyNode next = null;
            //lock (this)
            //{
            //    if (packageMembers.ContainsKey(key))
            //    {
            //        next = packageMembers[key];
            //    }
            //    else
            //    {
            //        if (!packages.ContainsKey(key))
            //        {
            //            //the head endNode is unknown. Create it and add it.
            //            Package p = new Package(key);
            //            packages.Add(key, p);
            //            p.ParentScope = this;
            //        }
            //        next = packages[key];
            //    }
            //}

            ////recursive step
            //return next.RecursiveFollow(packageParts, index + 1);
        }

        public override HierarchyNode FindInHierarchy(string name)
        {
            lock (packageLock)
            {
                if (packageMembers.ContainsKey(name))
                {
                    return packageMembers[name];
                }
                else
                {
                    if (!packages.ContainsKey(name))
                    {
                        //the head endNode is unknown. Create it and add it.
                        Package p = new Package(name);

                        packages.Add(name, p);
                        p.ParentScope = this;
                    }
                    return packages[name];
                }
            }
        }
        #endregion

        #region Registration
        /// <summary>
        /// Adds the registration relationships between this endNode and the given type.
        /// Returns the type reference in order to allow chain of responsibility pattern.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public TypeDefinition RegisterType(TypeDefinition type)
        {
            if (type.Represented == null) { // TODO 2021-04-09, nullptr when ingesting C++ code
                Console.WriteLine("type.Represented == null");
                return type;
            }
            if (!type.Represented.Node.Equals(Members.TypeDeclaration))
            {
                throw new InvalidCastException("Package cannot register non-type definitions: " + type.Represented);
            }

            lock (packageLock)
            {
                string k = type.Represented.Code;

                if (packageMembers.ContainsKey(k))
                {
                    return packageMembers[k];
                }

                //dictionary is not thread safe
                packageMembers.Add(k, type);
                type.ParentScope = this;
                type.CreateThisReference();

                return type;
            }
        }
        #endregion

        #region Linking
        public override void InitialLink()
        {
            //no op - Packages have no initial linking action
        }

        /// <summary>
        /// The main linking function in Package. Forces all Types and child
        /// Packages to link their internal members.
        /// </summary>
        public override void FullLink()
        {
            try
            {
                List<string> keys = new List<string>();
                //create a list of the endNode members
                lock (packageLock)
                {
                    foreach (string s in packageMembers.Keys)
                    {
                        keys.Add(s);
                    }
                }

                //link everything registered as part of it recursively
                foreach (string s in keys)
                {
                    HierarchyNode next = packageMembers[s];

                    //link this object, but only if it is real and not simulated
                    if (!next.IsSimulated)
                    {
                        while ( CurrentLinkers >= MaxLinkers)
                        {
                            Thread.Sleep(250);
                        }

                        UpdateLinkCount(1);

                        //link everything registered as part of it recursively
                        Thread t = new Thread(next.FullLink);
                        t.Start();
                    }
                }

                //recursive endNode linking
                foreach (string s in packages.Keys)
                {
                    packages[s].FullLink();
                }
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show("Error linking "+this+": " + e.Message + "\n\r" + e.StackTrace);
            }
        }

        public override DefinedMember TruncatedSearch(INavigable targetNode, GraphNode parameterScope, GraphNode halt)
        {
            throw new InvalidOperationException("TruncatedSearch is not a valid operation from Package");
        }

        public override DefinedMember FindChainEnd(INavigable targetNode, ChainArgs args)
        {
            if (rootPackages.ContainsKey(targetNode.Code))
            {

                //need to check other children
                CheckChildren(targetNode, rootPackages[targetNode.Code], args);

                //this is in fact a known endNode name.
                //continue chain
                INavigable next = GetDotChild(targetNode);

                if (next == null)
                {
                    //should never occur. This indicates that the end of a chain is a endNode, which makes no sense
                    throw new InvalidOperationException("End of chain found to be endNode:" + targetNode);
                }
                else
                {
                    return rootPackages[targetNode.Code].LinkToMember(next, args);
                }
            }

            //known in the p packages. Not a endNode
            return null;
        }

        public override DefinedMember LinkToMember(INavigable nextMember, ChainArgs args)
        {
            string key = nextMember.Code;
            HierarchyNode found = null;
            INavigable grandChild = GetDotChild(nextMember);

            if (grandChild == null)
            {
                if (nextMember.Node.Equals(Members.ConstructorInvoke) || nextMember.Node.Equals(Members.ArrayInvoke))
                {
                    lock (packageLock)
                    {
                        //the end node is a constructor
                        if (packageMembers.ContainsKey(key))
                        {
                            //find existing type
                            found = packageMembers[key];
                        }
                        else
                        {
                            //create the type
                            found = this.RegisterType(TypeDefinition.CreateSimulatedType(key, false));
                        }
                    }
                    return found.LinkToMember(nextMember, args);
                }
                else
                {
                    //chain is mal-formatted
                    throw new InvalidOperationException("Package chain must contain a grandchild as member of a type");
                }
            }

            lock (packageLock)
            {
                if (packages.ContainsKey(key))
                {
                    found = packages[key];
                }
                else if (packageMembers.ContainsKey(key))
                {
                    found = packageMembers[key];
                }

                if (found == null)
                {
                    //No current member exists, so it must be simulated
                    INavigable greatGrandChild = GetDotChild(grandChild);

                    if (grandChild.Node.Equals(Members.MethodInvoke))
                    {
                        //end in sight, child is a type
                        //package_this.type_next.member_grandchild
                        found = this.RegisterType(TypeDefinition.CreateSimulatedType(key, false));
                    }
                    else if (grandChild.Node.Equals(Members.ArrayInvoke) || grandChild.Node.Equals(Members.ConstructorInvoke))
                    {
                        //must be another package.
                        Package p = new Package(key);
                        packages.Add(key, p);
                        p.ParentScope = this;
                        found = p;
                    }
                    else if (grandChild.Node.Equals(Members.Variable) && greatGrandChild == null)
                    {
                        //end in sight, child is a type
                        //package_this.type_next.member_grandchild
                        //Key should have been a type and grandchild a member
                        found = this.RegisterType(TypeDefinition.CreateSimulatedType(key, false));
                    }
                    else
                    {
                        //must be another package.
                        Package p = new Package(key);
                        packages.Add(key, p);
                        p.ParentScope = this;
                        found = p;
                    }
                }
            }

            //this is already a member of the endNode and we recurse
            return found.LinkToMember(grandChild, args);
        }
        #endregion

        public override void ExploreGraph(ExploreModes mode)
        {
            SaveThisNode();

            if (mode == ExploreModes.Touch || explored)
            {
                return;
            }

            explored = true;

            foreach (GraphNode g in FindRelationships())
            {
                g.ExploreGraph(ExploreModes.Touch);
            }

            foreach (string s in packages.Keys)
            {
                packages[s].ExploreGraph(ExploreModes.Full);
            }

            foreach (string s in packageMembers.Keys)
            {
                packageMembers[s].ExploreGraph(ExploreModes.Full);
            }
        }

        protected override void WriteEdges()
        {
            base.WriteEdges();
            
            foreach (string s in packageMembers.Keys)
            {
                WriteMember(packageMembers[s]);
            }

            foreach (string s in packages.Keys)
            {
                WriteMember(packages[s]);
            }
        }

        public override bool Equals(Object o)
        {
            if (o is GraphNode)
            {
                GraphNode gn = (GraphNode)o;
                if (gn.Represented.Node.Equals(this.represented.Node))
                {
                    INode otherNode = gn.Represented;
                    return represented.Code.Equals(otherNode.Code) && represented.Node == otherNode.Node;
                }
            }
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public void AddTypesToSet(List<GraphNode> set)
        {
            foreach (string s in packageMembers.Keys)
            {
                if (!packageMembers[s].IsSimulated)
                {
                    set.Add(packageMembers[s]);
                }
            }

            foreach (string s in packages.Keys)
            {
                packages[s].AddTypesToSet(set);
            }
        }

        internal static TypeDefinition GetStaticImport(INavigable importNode, out string memberName)
        {
            //parse the name of the endNode and import
            string[] temp = importNode.Code.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);

            //last element is the defined member
            memberName = temp[temp.Length - 1];

            string typeName = temp[temp.Length - 2];

            //other n-1 parts will be the endNode and type names
            string[] packageParts = new string[temp.Length - 2];
            for (int i = 0; i < packageParts.Length; i++)
            {
                packageParts[i] = temp[i];
            }

            Package root = Package.GetRootPackage(packageParts[0], false);


            HierarchyNode h = root.RecursiveFollow(packageParts, 1);
            TypeDefinition type = null;

            if (h.Represented.Node.Equals(Members.Package))
            {
                Package package = (Package)h;
                //we will force the type to be a type under that package
                lock (package.packageLock)
                {
                    //if the package contains the type (i.e. it is defined in our code) we can link to it
                    if (package.packageMembers.ContainsKey(typeName))
                    {
                        type = package.packageMembers[typeName];
                    }
                    else
                    {
                        //if the package does not contain the type (i.e. it is outlibrary) we must simulate it
                        type = package.RegisterType(TypeDefinition.CreateSimulatedType(typeName, false));
                    }
                }
            }
            else if (h.Represented.Node.Equals(Members.TypeDeclaration))
            {
                TypeDefinition d = (TypeDefinition)h;
                type = d.getNestedType(typeName);
            }
            return type;
        }

        public static HierarchyNode GetImport(INavigable importNode)
        {
            //parse the name of the endNode and import
            string[] temp = importNode.Code.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
            string actualImport = temp[temp.Length - 1];//last element is the true import
            string[] packageParts = new string[temp.Length - 1];//other n-1 elements are the endNode name
            for (int i = 0; i < packageParts.Length; i++)
            {
                packageParts[i] = temp[i];
            }

            Package root = Package.GetRootPackage(packageParts[0], false);

            HierarchyNode endNode = root.RecursiveFollow(packageParts, 1);

            HierarchyNode answer = null;
            if (actualImport.Equals("*"))
            {
                //TODO This logic assumes that the answer is a Package, but 
                //occasionally it is a TypeDefinition. This condition is not handled.

                //we have knowledge of the entire endNode
                answer = endNode;
            }
            else if (endNode.Represented.Node.Equals(Members.Package))
            {
                Package p = (Package)endNode;

                lock (p.packageLock)
                {
                    if (p.packages.ContainsKey(actualImport))
                    {
                        //Suppose that there is an import statement import A.B.C;
                        //C is apparently a type, but B appears to be a package.
                        //IF IN ANOTHER IMPORT B appears as an obvious type (e.g. import A.B;)
                        //the "package" B needs to be replaced with a Type B

                        p.MakePackageIntoTypeDefinition(p.packages[actualImport]);
                    }

                    //because of the way the new logic is handled this must be a type and not a endNode.
                    if (!p.packageMembers.ContainsKey(actualImport))
                    {
                        p.RegisterType(TypeDefinition.CreateSimulatedType(actualImport, false));
                    }
                }

                answer = p.packageMembers[actualImport];
            }
            else if (endNode.Represented.Node.Equals(Members.TypeDeclaration))
            {
                TypeDefinition d = (TypeDefinition)endNode;
                answer = d.getNestedType(actualImport);
            }
            else
            {
                throw new InvalidCastException("Unexpected end node from " + importNode.Code + ": " + endNode);
            }

            return answer;
        }

        private void MakePackageIntoTypeDefinition(Package nonPackage)
        {
            Console.WriteLine(nonPackage+" should be replaced with a TypeDeclaration");
            //lock (packages)
            //{
            //    lock (packageMembers)
            //    {
            //        //swap the nodes
            //        string name = nonPackage.represented.Code;
            //        TypeDefinition type = TypeDefinition.CreateSimulatedType(name, false);
            //        packages.Remove(name);
            //        RegisterType(type);

            //        //copy relationships
            //        nonPackage.CopyRelationshipsTo(type);

            //        foreach (string name in nonPackage.packageMembers)
            //        {

            //        }
            //    }
            //}
        }

        internal TypeDefinition GetOrCreate(string typeName)
        {
            lock (packageLock)
            {
                if (packageMembers.ContainsKey(typeName))
                {
                    return packageMembers[typeName];
                }
                else
                {
                    return this.RegisterType(TypeDefinition.CreateSimulatedType(typeName, false));
                }
            }
        }
    }
}
