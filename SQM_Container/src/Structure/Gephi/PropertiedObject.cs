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
        FileLineRange
    }

    /// <summary>
    /// Class which embodies a set of properties defined by the NodeProperties enum. Each
    /// property has a unique attribute value accessible in O(1) time.
    /// </summary>
    /// 

    //AddProperty, SetProperty, RemoveProperty, etc. now support strings as an overloaded argument
    public abstract class PropertiedObject
    {
        private Dictionary<string, object> properties = new Dictionary<string, object>();
        //static dictionary that contains all of the properties from all nodes
        private static Dictionary<string, int> allProps = new Dictionary<string, int>();
        public abstract String Header { get; }
        string errorStr = "Duplicate dictionary entry: ";
        
        //returns a string of all the properties that exist within ALL nodes
        public string getHeader()
        {
            //might be easier (someto make this an array and say foreach x in array, print out properties[x]
            StringBuilder sb = new StringBuilder();
            sb.Append("Id,Label,Category");
            //remove edge specific properties
            allProps.Remove("Weight");
            allProps.Remove("EdgeFlag");
            foreach (string p in allProps.Keys)
            {
                sb.Append(',');
                sb.Append(p);
            }

            return sb.ToString();
        }
        public IEnumerable<string> GetAllProps()
        {
            return allProps.Keys;
        }
        public IEnumerable<string> GetProperties()
        {
            return properties.Keys;
        }

        public void AddProperty(NodeProperties p, object value)
        {
            //rarely used function, should not be adding properties that already exist
            if (properties.ContainsKey(p.ToString()))
            {
                throw new InvalidOperationException(errorStr + p.ToString());
            }
            //if the static dictionary does not have the property, add it to the static dictionary
            if(!allProps.ContainsKey(p.ToString()))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Add(p.ToString(), 1);
            }
            properties.Add(p.ToString(), value);
        }

        public void AddProperty(NodeProperties p)
        {
            //rarely used function, should not be adding properties that already exist
            if (properties.ContainsKey(p.ToString()))
            {
                throw new InvalidOperationException(errorStr + p.ToString());
            }
            //if the static dictionary does not have the property, add it to the static dictionary
            if (!allProps.ContainsKey(p.ToString()))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Add(p.ToString(), 1);
            }
            properties.Add(p.ToString(), new object());
        }

        //this function is used to add properties from the csv input file. all of the properties were premptively checked, so there should be no issues.
        public void AddProperty(string p, object value)
        {
            //only adding non-duplicate values
            if (!properties.ContainsKey(p))
            {
                properties.Add(p, value);
            }

            //if the static dictionary does not have the property, add it to the static dictionary
            if (!allProps.ContainsKey(p))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Add(p, 1);
            }
        }

        //rarely used function, should not be adding properties that already exist
        public void AddProperty(string p)
        {
            if (properties.ContainsKey(p))
            {
                throw new InvalidOperationException(errorStr + p);
            }
            //if the static dictionary does not have the property, add it to the static dictionary
            if (!allProps.ContainsKey(p))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Add(p, 1);
            }
            properties.Add(p, new object());
        }

        public void SetProperty(NodeProperties p, object value)
        {
            if (properties.ContainsKey(p.ToString()))
            {
                properties[p.ToString()] = value;
            }
            else
            {
                //if the static dictionary does not have the property, add it to the static dictionary
                if (!allProps.ContainsKey(p.ToString()))
                {
                    //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                    allProps.Add(p.ToString(), 1);
                }
                properties.Add(p.ToString(), value);
            }
        }

        public void SetProperty(string p, object value)
        {
            if (properties.ContainsKey(p))
            {
                properties[p] = value;
            }
            else
            {
                //if the static dictionary does not have the property, add it to the static dictionary
                if (!allProps.ContainsKey(p))
                {
                    //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                    allProps.Add(p, 1);
                }
                properties.Add(p, value);
            }
        }

        public bool HasProperty(NodeProperties p)
        {
            return properties.ContainsKey(p.ToString());
        }

        public bool HasProperty(string p)
        {
            return properties.ContainsKey(p);
        }
        public object GetProperty(NodeProperties p)
        {
            return properties[p.ToString()];
        }

        public object GetProperty(string p)
        {
            return properties[p];
        }
        public void RemoveProperty(NodeProperties p)
        {
            //if the static dictionary has the property, remove it from the static dictionary
            if (allProps.ContainsKey(p.ToString()))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Remove(p.ToString());
            }
            properties.Remove(p.ToString());
        }

        public void RemoveProperty(string p)
        {
            //if the static dictionary has the property, remove it from the static dictionary
            if (allProps.ContainsKey(p.ToString()))
            {
                //using a dictionary with the standard value of 1 as the integer to avoid duplicates. easier than dealing with lists...
                allProps.Remove(p.ToString());
            }
            properties.Remove(p);
        }
 
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(base.ToString());
            sb.Append("\n\r\t");
            foreach (string n in properties.Keys)
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
