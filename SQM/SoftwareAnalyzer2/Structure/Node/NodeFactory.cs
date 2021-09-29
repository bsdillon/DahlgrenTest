using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node.Implementations;
using System.Text.RegularExpressions;

namespace SoftwareAnalyzer2.Structure.Node
{
    /// <summary>
    /// NodeFactory handles the creation of all INodes based on the information 
    /// provided. This includes the NodeType, the code and whether the node is natural.
    /// 
    /// NodeFactory also handles all static methods related to file IO inorder to further 
    /// encapsulate the INode.
    /// </summary>
    public static class NodeFactory
    {
        #region CreateNode variations
        public static INode CreateNode(string node, string code)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, false);
        }

        public static INode CreateNode(string node, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), "", naturalNode);
        }

        public static INode CreateNode(string node, string code, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, naturalNode);
        }

        public static INode CreateNode(Members node, string code)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, false);
        }

        public static INode CreateNode(Members node, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), "", naturalNode);
        }

        public static INode CreateNode(Members node, string code, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, naturalNode);
        }

        internal static INode CreateNode(MemberSets node, string code)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, false);
        }

        public static INode CreateNode(MemberSets node, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), "", naturalNode);
        }

        internal static INode CreateNode(MemberSets node, string code, bool naturalNode)
        {
            return CreateASTree(NodeType.CreateNodeType(node), code, naturalNode);
        }

        public static INode CreateNode(NodeType node, string code)
        {
            return CreateASTree(node, code, false);
        }

        public static INode CreateNode(NodeType node, bool naturalNode)
        {
            return CreateASTree(node, "", naturalNode);
        }

        public static INode CreateNode(NodeType node, string code, bool naturalNode)
        {
            return CreateASTree(node, code, naturalNode);
        }

        private static INode CreateASTree(NodeType node, string code, bool natural)
        {
            ASTree a = new ASTree(natural);
            a.SetNode(node);
            if (code.Length > 0)
            {
                a.AddCode(code, 0, 0);
            }
            return a;
        }

        internal static INode CreateNode(string node, string code, string file, string line)
        {
            bool codeMissing;
            bool fileMissing;
            bool lineMissing;

            if(code == null)
            {
                codeMissing = true;
            }
            else
            {
                codeMissing = code.Equals("--");
            }
            if(file == null)
            {
                fileMissing = true;
            }
            else
            {
                fileMissing = file.Equals("--");
            }
            if(line == null)
            {
                lineMissing = true;
            }
            else
            {
                lineMissing = line.Equals("--");
            }

            NodeType type = NodeType.FromString(node);

            AbbreviatedNode answer = null;
            if (codeMissing)
            {
                answer = new AbbreviatedNode(type);
            }
            else
            {
                answer = new AbbreviatedNode(type, code);
            }

            if (!fileMissing)
            {
                if (lineMissing)
                {
                    answer.FileName=file;
                }
                else
                {
                    answer.SetFile(file, line);
                }
            }

            return answer;
        }
        #endregion

        #region ASTree Open/Save
        /// <summary>
        /// Returns true if the given file is written to the current standard.
        /// </summary>
        /// <param name="xmlFile"></param>
        /// <returns></returns>
        internal static bool IsCurrentVersion(string xmlFile)
        {
            return ASTree.IsCurrentVersion(xmlFile);
        }

        /// <summary>
        /// Reads the given XML file and returns the head INode of the tree
        /// </summary>
        /// <param name="xmlFile"></param>
        /// <returns></returns>
        internal static INode ReadXMLTree(string xmlFile)
        {
            return ASTree.ReadXMLTree(xmlFile);
        }

        /// <summary>
        /// Writes the given tree to the given file as a tree-structured text file
        /// </summary>
        /// <param name="tree"></param>
        /// <param name="file"></param>
        internal static void WriteTextFile(INode tree, string file)
        {
            StreamWriter sw = new StreamWriter(File.Create(file + ASTree.FileExtension));
            ((ASTree)tree).PrintTreeText(sw.WriteLine);
            sw.Close();
        }

        /// <summary>
        /// Writes the given tree to the given file as an XML file. Because the shortened
        /// name of the file will appear as an attribute in the XML file, the path is 
        /// required.
        /// </summary>
        /// <param name="tree"></param>
        /// <param name="fileName"></param>
        /// <param name="path"></param>
        internal static void WriteXMLFile(INode tree, string fileName, string path)
        {
            ((ASTree)tree).WriteXMLTree(fileName, path);
        }
        #endregion

        #region Method matching
        /// <summary>
        /// Returns true if the target method definition and candidate method invocation match.
        /// This method can ignore the exact type of parameters, but will match on method
        /// identifiers.
        /// Even when the parameters are considered, the match may not be perfect.
        /// </summary>
        /// <param name="target"></param>
        /// <param name="candidate"></param>
        /// <param name="allowAllParameters"></param>
        /// <returns></returns>
        internal static bool IsCasualMatch(INode target, INode candidate, bool allowAllParameters)
        {
            return ((ASTree)target).IsCasualMatch((ASTree)candidate, allowAllParameters);
        }
        #endregion

        #region Anonymous Class identifiers
        /// <summary>
        /// Returns a string which represents the name and location of the anonymous 
        /// class according to the standard for representation.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static string GenerateAnonymous(IModifiable name)
        {
            string line = name.GetFileLineRange();
            int colon = line.IndexOf(':');
            int dash = line.IndexOf('-', colon);
            int paren = line.IndexOf(')', dash);
            string line1 = line.Substring(1, colon - 1);
            string line2 = line.Substring(colon + 1, dash - colon - 1);
            string line3 = line.Substring(dash + 1, paren - dash - 1);

            return "Anonymous_" + line1 + "_" + line2 + "_" + line3;
        }

        /// <summary>
        /// Returns true if the given name matches the standard for representing an 
        /// anonymous class.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static bool IsAnonymous(string name)
        {
            Regex reg = new Regex("Anonymous(_(\\d)+){3}");
            return reg.IsMatch(name);
        }
        #endregion

        /// <summary>
        /// String representation for class self-reference
        /// </summary>
        public static readonly string SelfReference = "~~this~~";
    }
}
