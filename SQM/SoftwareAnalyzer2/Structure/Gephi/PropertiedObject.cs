using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Gephi
{
    /// <summary>
    /// Attributes used in metrics
    /// </summary>
    public enum NodeProperties
    {
        ZDepth,
        Visited,
        Weight,
        Module,
        File,
        TypeName,
        NodePattern,
        ModuleIntegrity,
        ClassIntegrity,
        QState,
        EdgeFlag,
        AccessPattern,
        StateMember,
        ClassID,
        Rank,
        InAppropriateAccess,
        FileLineRange,
        MiscData 
    }

    /// <summary>
    /// Class which embodies a set of properties defined by the NodeProperties enum. Each
    /// property has a unique attribute value accessible in O(1) time.
    /// </summary>
    public abstract class PropertiedObject
    {
        private Dictionary<NodeProperties, object> properties = new Dictionary<NodeProperties, object>();

        public abstract String Header { get; }

        public IEnumerable<NodeProperties> GetProperties()
        {
            return properties.Keys;
        }

        public void AddProperty(NodeProperties p, object value)
        {
            properties.Add(p, value);
        }

        public void AddProperty(NodeProperties p)
        {
            properties.Add(p, new object());
        }

        public void SetProperty(NodeProperties p, object value)
        {
            if (properties.ContainsKey(p))
            {
                properties[p] = value;
            }
            else
            {
                properties.Add(p, value);
            }
        }

        public bool HasProperty(NodeProperties p)
        {
            return properties.ContainsKey(p);
        }

        public object GetProperty(NodeProperties p)
        {
            return properties[p];
        }

        public void RemoveProperty(NodeProperties p)
        {
            properties.Remove(p);
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToString());
            sb.Append("\n\r\t");
            foreach (NodeProperties n in properties.Keys)
            {
                sb.Append(n);
                sb.Append(": ");
                sb.Append(properties[n]);
                sb.Append("\n\r\t");
            }
            return sb.ToString();
        }
    }
}
