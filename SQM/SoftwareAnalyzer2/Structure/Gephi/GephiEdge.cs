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
    public class GephiEdge : PropertiedObject
    {
        private static Dictionary<Relationship, int> EdgeWeights = new Dictionary<Relationship, int>();
        private static Dictionary<Relationship, int> EdgeCategory = new Dictionary<Relationship, int>();

        static GephiEdge()
        {
            EdgeWeights.Add(Relationship.Member, 10);
            EdgeWeights.Add(Relationship.MemberOf, 10);
            EdgeWeights.Add(Relationship.ChildType, 8);
            EdgeWeights.Add(Relationship.DefinitionOf, 8);
            EdgeWeights.Add(Relationship.SubDefinitionOf, 8);
            EdgeWeights.Add(Relationship.SubDefinition, 8);
            EdgeWeights.Add(Relationship.Imports, 5);
            EdgeWeights.Add(Relationship.CandidateRead, 2);
            EdgeWeights.Add(Relationship.ReturnType, 2);
            EdgeWeights.Add(Relationship.WrittenBy, 2);
            EdgeWeights.Add(Relationship.FormalParameter, 2);
            EdgeWeights.Add(Relationship.Control, 2);

            EdgeCategory.Add(Relationship.Member, 1);
            EdgeCategory.Add(Relationship.MemberOf, 1);
            EdgeCategory.Add(Relationship.ChildType, 2);
            EdgeCategory.Add(Relationship.DefinitionOf, 3);
            EdgeCategory.Add(Relationship.SubDefinitionOf, 4);
            EdgeCategory.Add(Relationship.Imports, 5);
            EdgeCategory.Add(Relationship.CandidateRead, 6);
            EdgeCategory.Add(Relationship.ReturnType, 8);
            EdgeCategory.Add(Relationship.WrittenBy, 9);
            EdgeCategory.Add(Relationship.FormalParameter, 10);
            EdgeCategory.Add(Relationship.Control, 11);
            EdgeCategory.Add(Relationship.SubDefinition, 12);
        }

        private GephiNode source;
        private GephiNode sink;
        private Relationship myEdgeType;
        public GephiEdge(GephiNode edgeSource, GephiNode edgeSink, Relationship edgeType)
        {
            source = edgeSource;
            sink = edgeSink;
            myEdgeType = edgeType;
        }

        public Relationship GetEdgeType()
        {
            return myEdgeType;
        }

        public GephiNode GetSource()
        {
            return source;
        }

        public GephiNode GetSink()
        {
            return sink;
        }

        public override string Header
        {
            get
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Source,Target,Label");
                foreach (NodeProperties n in this.GetProperties())
                {
                    sb.Append(',');
                    sb.Append(n);
                }

                return sb.ToString();
            }
        }

        public bool ValidEdge()
        {
            return EdgeWeights.ContainsKey(myEdgeType);
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(source.ID);
            sb.Append(',');
            sb.Append(sink.ID);
            sb.Append(',');
            sb.Append(myEdgeType);

            //BSD I used to have categories and defined weights for all nodes, but I now find myself
            //needing to define new weights for specific outputs.
            //We may consider the need for EdgeWeights[type] and EdgeCategory[type] later

            foreach (NodeProperties n in this.GetProperties())
            {
                sb.Append(',');
                sb.Append(GetProperty(n));
            }

            return sb.ToString();
        }

        public override bool Equals(object o)
        {
            if (o is GephiEdge)
            {
                GephiEdge other = (GephiEdge)o;

                return other.source.ID == source.ID && other.sink.ID == sink.ID && myEdgeType == other.myEdgeType;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return source.GetHashCode() * sink.GetHashCode() * myEdgeType.GetHashCode();
        }
    }
}
