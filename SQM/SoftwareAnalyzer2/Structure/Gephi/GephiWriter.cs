using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace SoftwareAnalyzer2.Structure.Gephi
{
    /// <summary>
    /// This class was constructed to help with reading the graph, but that functionality
    /// was never developed, using instead a more direct metric capability.
    /// </summary>
    public class GephiWriter
    {
        private GephiWriter()
        {
            //no construction
        }

        internal static bool FileExists(string fileName)
        {
            return File.Exists(fileName + ".nod");
        }

        internal static void WriteFile(string baseFileName, List<GephiNode> nodes, List<GephiEdge> edges)
        {
            StreamWriter nodeFile = new StreamWriter(baseFileName + ".nod");
            StreamWriter edgeFile = new StreamWriter(baseFileName + ".edg");
            Debug.Assert(nodes.Count > 0 , "number of nodes is assumed > 0, got nodes.Count == "+nodes.Count);
            if (nodes.Count <= 0) {
                return;
            }
            Debug.Assert(edges.Count > 0 , "number of edges is assumed > 0, got edges.Count == "+edges.Count);
            if (edges.Count <= 0) {
                return;
            }
            nodeFile.WriteLine(nodes[0].Header);
            edgeFile.WriteLine(edges[0].Header);

            foreach (GephiNode n in nodes)
            {
                nodeFile.WriteLine(n.ToString());
            }

            foreach (GephiEdge e in edges)
            {
                if (e.ValidEdge())
                {
                    edgeFile.WriteLine(e.ToString());
                }
            }
            nodeFile.Close();
            edgeFile.Close();
        }
    }
}