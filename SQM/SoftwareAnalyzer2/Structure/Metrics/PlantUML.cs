using SoftwareAnalyzer2.Structure.Metrics;
using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
   class PlantUML
    {
        internal static int CreateReport2(string filename)
        {
            int answer = 0;
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();
            sb.Append("@startuml\r\n");
            sb.Append("@enduml\r\n");
            writer.WriteLine(sb);
            writer.Close();
            return answer;
        }    
    }
}
