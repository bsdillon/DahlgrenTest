using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Gephi
{
    /// <summary>
    /// This class is inclusive of all the funcitonality used in the metrics, but
    /// also functionality which is not required, or may be required in the future.
    /// In either case it is pretty straight forward and shouldn't need alteration.
    /// </summary>
    public class GephiNode : PropertiedObject
    {
        private static Dictionary<NodeType, int> NodeCategory = new Dictionary<NodeType, int>();

        static GephiNode()
        {
            NodeCategory.Add(NodeType.CreateNodeType(Members.Root), 0);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Package), 1);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Scope), 2);
            NodeCategory.Add(NodeType.CreateNodeType(Members.MethodScope), 3);
            NodeCategory.Add(NodeType.CreateNodeType(Members.TryScope), 4);
            NodeCategory.Add(NodeType.CreateNodeType(Members.CatchScope), 5);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Finally), 6);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Branch), 7);
            NodeCategory.Add(NodeType.CreateNodeType(Members.ForEachLoop), 8);
            NodeCategory.Add(NodeType.CreateNodeType(Members.While), 9);
            NodeCategory.Add(NodeType.CreateNodeType(Members.For3Loop), 10);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Switch), 11);
            NodeCategory.Add(NodeType.CreateNodeType(Members.ElseScope), 12);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Try_Catch), 13);

            NodeCategory.Add(NodeType.CreateNodeType(Members.CLASS), 20);
            NodeCategory.Add(NodeType.CreateNodeType(Members.INTERFACE), 21);
            NodeCategory.Add(NodeType.CreateNodeType(Members.ENUM), 22);
            NodeCategory.Add(NodeType.CreateNodeType(Members.TypeDeclaration), 23);
            NodeCategory.Add(NodeType.CreateNodeType(Members.ANONYMOUS), 24);

            NodeCategory.Add(NodeType.CreateNodeType(Members.Field), 30);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Parameter), 31);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Literal), 32);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Value), 33);
            NodeCategory.Add(NodeType.CreateNodeType(Members.ArrayInvoke), 34);

            NodeCategory.Add(NodeType.CreateNodeType(Members.Method), 40);
            NodeCategory.Add(NodeType.CreateNodeType(Members.Constructor), 41);

            NodeCategory.Add(NodeType.CreateNodeType(Members.Boolean), 50);

            //NodeCategory.Add(NodeType.CreateNodeType(),);
        }

        private long assignedID;
        public long ID
        {
            get
            {
                return assignedID;
            }
        }

        NodeType type;
        public NodeType Category
        {
            get
            {
                return type;
            }
        }
        
        string name;
        public string Label
        {
            get
            {
                return name;
            }
        }

        public GephiNode(long id, NodeType nodeType, string nodeName)
        {
            assignedID = id;
            type = nodeType;
            name = nodeName;
        }

        public override string Header
        {
            get
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Id,Label,Category");

                foreach (NodeProperties p in GetProperties())
                {
                    sb.Append(',');
                    sb.Append(p);
                }

                return sb.ToString();
            }
        }

        public string ToGephiRecord()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(assignedID);
            sb.Append(',');
            sb.Append(name);
            sb.Append(',');
            sb.Append(type);

            foreach (NodeProperties p in GetProperties())
            {
                sb.Append(',');
                sb.Append(GetProperty(p));
            }

            return sb.ToString();
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("ID: ");
            sb.Append(assignedID);
            sb.Append("   Label: ");
            sb.Append(name);
            sb.Append("   Type: ");
            sb.Append(type);

            foreach (NodeProperties p in GetProperties())
            {
                sb.Append("   ");
                sb.Append(p);
                sb.Append(": ");
                sb.Append(GetProperty(p));
            }

            return sb.ToString();
        }

        public override bool Equals(object o)
        {
            if (o is GephiNode)
            {
                GephiNode other = (GephiNode)o;

                return other.assignedID == assignedID;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return assignedID.GetHashCode();
        }
    }
}
