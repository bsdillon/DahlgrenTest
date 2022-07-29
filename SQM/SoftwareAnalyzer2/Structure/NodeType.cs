using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace SoftwareAnalyzer2.Structure
{
    /// <summary>
    /// NodeType is the primary identification for any node in the AST or graph. The NodeType
    /// determines what the node is and how it will be handled. All NodeTypes are unique and 
    /// may be directly compared using the == operator. NodeTypes from the source code start 
    /// as strings. The allowed types come from the Members or MemberSets enumerations. This
    /// triple relation with NodeType complicates various features (construction, equality, etc.)
    /// 
    /// Because these types are enumerated and defined, they can also be put into groups of
    /// related types e.g. methods, constructors, inlines are all invokable method calls. This 
    /// makes it possible to create methods purely for the purpose of verifying that a NodeType
    /// is one of the members of a set.
    /// </summary>
    public class NodeType
    {
        #region Static Membership
        private enum Designation
        {
            Unknown,
            Member,
            Set
        }

        private static readonly NodeType nullRef = new NodeType();
        public static NodeType NULL
        {
            get
            {
                return nullRef;
            }
        }

        #region Text representation
        internal static NodeType ReadFromFile(XmlReader reader)
        {
            string name = reader.Name;

            NodeType answer = null;
            switch ((Designation)Enum.Parse(typeof(Designation), reader.GetAttribute("designation")))
            {
                case Designation.Member:
                    answer = NodeType.CreateNodeType((Members)Enum.Parse(typeof(Members), name));
                    break;
                case Designation.Set:
                    answer = NodeType.CreateNodeType((MemberSets)Enum.Parse(typeof(MemberSets), name));
                    break;
                case Designation.Unknown:
                    answer = NodeType.CreateNodeType(name);
                    break;
            }
            return answer;
        }

        internal static NodeType FromString(string p)
        {
            NodeType answer = NodeType.NULL;

            try
            {
                answer = NodeType.CreateNodeType((Members)Enum.Parse(typeof(Members), p));
            }
            catch (Exception)
            {
                answer = NodeType.CreateNodeType((MemberSets)Enum.Parse(typeof(MemberSets), p));
            }

            return answer;
        }
        #endregion

        #region Group Definitions
        private static List<Members> Invocations;
        private static List<Members> DefinedMembers;
        private static List<Members> ControlStructures;
        private static List<Members> UseTypes;
        private static List<Members> FieldTypes;
        private static List<Members> ScopeTypes;
        private static List<Members> BooleanControlledTypes;
        private static List<Members> MethodDefinitions;
        private static List<Members> OtherTypes;
        private static List<Members> ClassTypes;
        private static List<Members> ModifierTypes;
        private static List<Members> TypeReferences;
        private static List<Members> NamedType;
        private static List<Members> BooleanExpressions;
        private static List<Members> BooleanBoundaries;
        private static List<Members> BooleanEqualities;

        static NodeType()
        {
            List<Members> temp = new List<Members>();
            temp.Add(Members.MethodInvoke);
            temp.Add(Members.ConstructorInvoke);
            temp.Add(Members.SelfConstructorInvoke);
            temp.Add(Members.SuperConstructorInvoke);
            Invocations = temp;

            temp = new List<Members>();
            temp.Add(Members.TypeName);
            temp.Add(Members.ConstructorInvoke);
            NamedType = temp;

            temp = new List<Members>();
            temp.Add(Members.SuperReference);
            temp.Add(Members.SelfReference);
            temp.Add(Members.ConstructorInvoke);
            temp.Add(Members.SelfConstructorInvoke);
            temp.Add(Members.SuperConstructorInvoke);
            temp.Add(Members.TypeName);
            TypeReferences = temp;

            temp = new List<Members>();
            temp.Add(Members.CLASS);
            temp.Add(Members.INTERFACE);
            temp.Add(Members.ENUM);
            temp.Add(Members.ANONYMOUS);
            temp.Add(Members.NAMESPACE);
            temp.Add(Members.TYPEDEF); //CPP
            ClassTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.Constructor);
            temp.Add(Members.Method);
            temp.Add(Members.Inline);
            temp.Add(Members.Destructor);
            MethodDefinitions = temp;

            temp = new List<Members>();
            temp.Add(Members.Field);
            temp.Add(Members.Parameter);
            FieldTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.DoWhile);
            temp.Add(Members.While);
            temp.Add(Members.For3Loop);
            temp.Add(Members.Branch);
            temp.Add(Members.Trinary);
            BooleanControlledTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.MethodScope);
            temp.Add(Members.Scope);
            temp.Add(Members.ElseScope);
            temp.Add(Members.TryScope);
            temp.Add(Members.CatchScope);
            temp.Add(Members.RightScope);
            temp.Add(Members.WrongScope);
            ScopeTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.MethodInvoke);
            temp.Add(Members.SelfConstructorInvoke);
            temp.Add(Members.ConstructorInvoke);
            temp.Add(Members.SuperConstructorInvoke);
            temp.Add(Members.Variable);
            temp.Add(Members.SelfReference);
            temp.Add(Members.SuperReference);
            temp.Add(Members.TypeName);
            DefinedMembers = temp;

            temp = new List<Members>();
            temp.Add(Members.Switch);
            temp.Add(Members.Branch);
            temp.Add(Members.For3Loop);
            temp.Add(Members.ForEachLoop);
            temp.Add(Members.DoWhile);
            temp.Add(Members.Try_Catch);
            temp.Add(Members.Trinary);
            temp.Add(Members.While);
            temp.Add(Members.SynchBlock);
            ControlStructures = temp;

            temp = new List<Members>();
            temp.Add(Members.Variable);
            temp.Add(Members.Literal);
            temp.Add(Members.MethodInvoke);
            temp.Add(Members.ConstructorInvoke);
            temp.Add(Members.SelfReference);
            temp.Add(Members.SuperReference);
            temp.Add(Members.ArrayInvoke);
            temp.Add(Members.TypeName);
            temp.Add(Members.LanguageTypeCheck);
            UseTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.Variable);
            temp.Add(Members.Field);
            temp.Add(Members.Parameter);
            temp.Add(Members.Value);
            OtherTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.Abstract);
            temp.Add(Members.Final);
            temp.Add(Members.Native);
            temp.Add(Members.Private);
            temp.Add(Members.Protected);
            temp.Add(Members.Public);
            temp.Add(Members.Static);
            temp.Add(Members.Synchronized);
            temp.Add(Members.Transient);
            temp.Add(Members.Volatile);
            ModifierTypes = temp;

            temp = new List<Members>();
            temp.Add(Members.Boolean_And);
            temp.Add(Members.Boolean_Or);
            temp.Add(Members.Boolean_Not);
            BooleanExpressions = temp;

            temp = new List<Members>();
            temp.Add(Members.Boolean_GreaterThan);
            temp.Add(Members.Boolean_GreaterThanEqual);
            temp.Add(Members.Boolean_LessThan);
            temp.Add(Members.Boolean_LessThanEqual);
            BooleanBoundaries = temp;

            temp = new List<Members>();
            temp.Add(Members.Boolean_Equal);
            temp.Add(Members.Boolean_NotEqual);
            BooleanEqualities = temp;
        }
        #endregion

        #region Create Unique NodeTypes
        private static Dictionary<string, NodeType> trivalNodes = new Dictionary<string, NodeType>();
        private static Dictionary<Members, NodeType> memberNodes = new Dictionary<Members, NodeType>();
        private static Dictionary<MemberSets, NodeType> setNodes = new Dictionary<MemberSets, NodeType>();

        /// <summary>
        /// Returns the reference of a NodeType matching this string OR creates it if it has not existed previously.
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public static NodeType CreateNodeType(string m)
        {
            lock (trivalNodes)
            {
                if (!trivalNodes.ContainsKey(m))
                {
                    NodeType n = new NodeType();
                    n.myString = m;
                    trivalNodes.Add(m, n);
                }
            }
            return trivalNodes[m];
        }

        /// <summary>
        /// Returns the reference of a NodeType matching this value in Members
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public static NodeType CreateNodeType(Members m)
        {
            lock (memberNodes)
            {
                if (!memberNodes.ContainsKey(m))
                {
                    NodeType n = new NodeType();
                    n.designation = Designation.Member;
                    n.myMember = m;
                    memberNodes.Add(m, n);
                }
            }
            return memberNodes[m];
        }

        /// <summary>
        /// Returns the reference of a NodeType matching this value in MemberSets
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public static NodeType CreateNodeType(MemberSets m)
        {
            lock (setNodes)
            {
                if (!setNodes.ContainsKey(m))
                {
                    NodeType n = new NodeType();
                    n.designation = Designation.Set;
                    n.mySet = m;
                    setNodes.Add(m, n);
                }
            }
            return setNodes[m];
        }
        #endregion
        #endregion

        #region Instance Membership
        private Members myMember;
        private MemberSets mySet;
        private string myString;
        private Designation designation = Designation.Unknown;

        /// <summary>
        /// Get the MemberSets value from this NodeType.
        /// Throws an error if this NodeType is not a MemberSets value.
        /// </summary>
        /// <returns></returns>
        internal MemberSets GetMemberSets()
        {
            if (designation != Designation.Set)
            {
                throw new InvalidCastException("NodeType " + this.ToString() + " is not node MemberSets type");
            }

            return mySet;
        }

        /// <summary>
        /// Get the Members value from this NodeType.
        /// Throws an error if this NodeType is not a Members value.
        /// </summary>
        /// <returns></returns>
        internal Members GetMembers()
        {
            if (designation != Designation.Member)
            {
                throw new InvalidCastException("NodeType " + this.ToString() + " is not node Members type");
            }

            return myMember;
        }

        //having a blank constructor simplifies the comlexity of three different 
        //construction methods.
        private NodeType()
        {
            designation = Designation.Unknown;
        }

        #region Equality and comparisons
        /// <summary>
        /// Allows for the comparison of this NodeType with a specific value of Members
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public bool Equals(Members m)
        {
            return (designation == Designation.Member && myMember == m);
        }

        /// <summary>
        /// Allows for the comparison of this NodeType with a specific value of MemberSets
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public bool Equals(MemberSets m)
        {
            return (designation == Designation.Set && mySet == m);
        }

        /// <summary>
        /// Allows for the comparison of this NodeType with a specific string
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public bool Equals(string s)
        {
            bool answer = false;
            lock (trivalNodes)
            {
                answer = (designation == Designation.Unknown && trivalNodes.ContainsKey(s) && trivalNodes[s] == this);
            }
            return answer;
        }

        //ties the parent equals method into the type-specific equality methods above
        public override bool Equals(object o)
        {
            bool answer = false;
            if (o is NodeType)
            {
                NodeType obj = (NodeType)o;
                switch (obj.designation)
                {
                    case Designation.Member:
                        answer = Equals(obj.myMember);
                        break;
                    case Designation.Set:
                        answer = Equals(obj.mySet);
                        break;
                    case Designation.Unknown:
                        answer = Equals(obj.myString);
                        break;
                }
            }
            else if (o is Members)
            {
                return Equals((Members)o);
            }
            else if (o is MemberSets)
            {
                return Equals((MemberSets)o);
            }
            else
            {
                return Equals(o.ToString());
            }

            return answer;
        }

        public Members GetMyMember()
        {
            return myMember;
        }
        public override int GetHashCode()
        {
            int baseVal = designation.GetHashCode();
            int power = 1;
            switch (designation)
            {
                case Designation.Member:
                    power = myMember.GetHashCode();
                    break;
                case Designation.Set:
                    power = mySet.GetHashCode();
                    break;
                case Designation.Unknown:
                    power = myString.GetHashCode();
                    break;
            }

            return baseVal ^ power;
        }
        #endregion

        #region Group Characterization
        /// <summary>
        /// Given the type of this node, find the set of complimentary node types which correlate with the 
        /// definition of the node. For example a variable would be defined by a Field, Parameter or enum Value.
        /// </summary>
        internal List<NodeType> GetCompliments()
        {
            List<NodeType> answer = new List<NodeType>();
            if (designation == Designation.Member)
            {
                switch (myMember)
                {
                    case Members.ConstructorInvoke:
                        answer.Add(NodeType.CreateNodeType(Members.Constructor));
                        break;
                    case Members.MethodInvoke:
                        answer.Add(NodeType.CreateNodeType(Members.Method));
                        break;
                    case Members.SuperConstructorInvoke:
                        answer.Add(NodeType.CreateNodeType(Members.Constructor));
                        break;
                    case Members.SelfConstructorInvoke:
                        answer.Add(NodeType.CreateNodeType(Members.Constructor));
                        break;
                    case Members.Variable:
                        answer.Add(NodeType.CreateNodeType(Members.Field));
                        answer.Add(NodeType.CreateNodeType(Members.Value));
                        answer.Add(NodeType.CreateNodeType(Members.Parameter));
                        break;
                    case Members.TypeName:
                        answer.Add(NodeType.CreateNodeType(Members.TypeDeclaration));
                        break;
                }
            }
            else
            {
                throw new InvalidCastException("NodeType has no compliment for " + this);
            }
            return answer;
        }

        public bool IsClassification
        {
            get
            {
                return (designation == Designation.Member && ClassTypes.Contains(myMember));
            }
        }

        public bool IsUnknown
        {
            get
            {
                return designation == Designation.Unknown;
            }
        }

        public bool IsNamedType
        {
            get
            {
                return (designation == Designation.Member && NamedType.Contains(myMember));
            }
        }

        public bool IsTypeReference
        {
            get
            {
                return (designation == Designation.Member && TypeReferences.Contains(myMember));
            }
        }

        public bool IsBooleanControlled
        {
            get
            {
                return (designation == Designation.Member && BooleanControlledTypes.Contains(myMember));
            }
        }

        public bool IsModifier
        {
            get
            {
                return (designation == Designation.Member && ModifierTypes.Contains(myMember));
            }
        }

        public bool IsOtherType
        {
            get
            {
                return (designation == Designation.Member && OtherTypes.Contains(myMember));
            }
        }

        public bool IsScope
        {
            get
            {
                return (designation == Designation.Member && ScopeTypes.Contains(myMember));
            }
        }

        public bool IsMethodDefinition
        {
            get
            {
                return (designation == Designation.Member && MethodDefinitions.Contains(myMember));
            }
        }

        public bool IsField
        {
            get
            {
                return (designation == Designation.Member && FieldTypes.Contains(myMember));
            }
        }

        public bool IsUseType
        {
            get
            {
                return (designation == Designation.Member && UseTypes.Contains(myMember));
            }
        }

        public bool IsInvocation
        {
            get
            {
                return (designation == Designation.Member && Invocations.Contains(myMember));
            }
        }

        public bool IsDefinedMember
        {
            get
            {
                return (designation == Designation.Member && DefinedMembers.Contains(myMember));
            }
        }

        public bool IsControlStructure
        {
            get
            {
                return (designation == Designation.Member && ControlStructures.Contains(myMember));
            }
        }

        public bool IsBooleanExpression
        {
            get
            {
                return (designation == Designation.Member && BooleanExpressions.Contains(myMember));
            }
        }

        public bool IsBooleanBoundary
        {
            get
            {
                return (designation == Designation.Member && BooleanBoundaries.Contains(myMember));
            }
        }

        public bool IsBooleanEquality
        {
            get
            {
                return (designation == Designation.Member && BooleanEqualities.Contains(myMember));
            }
        }
        #endregion

        #region Text representation
        public override string ToString()
        {
            string answer = "";
            switch (designation)
            {
                case Designation.Member:
                    answer = myMember.ToString();
                    break;
                case Designation.Set:
                    answer = mySet.ToString();
                    break;
                case Designation.Unknown:
                    answer = myString;
                    break;
            }
            return answer;
        }

        /// <summary>
        /// Write this NodeType to a file as XML
        /// </summary>
        /// <param name="writer"></param>
        internal void WriteToFile(XmlWriter writer)
        {
            writer.WriteStartElement(this.ToString());
            writer.WriteAttributeString("designation", designation.ToString());
        }

        internal bool IsXMLTagEquivalent(XmlReader reader)
        {
            return reader.Name.Equals(this.ToString());
        }
        #endregion
        #endregion
    }
}
