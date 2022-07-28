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
    class PlantUMLAPI
    {
        // TODO: Needs to return an int if used as reportCount in ModuleNavigator.cs
        private static string PlantUMLAPIReport = "";
        internal static void CreatePlantUMLAPI(string filename)
        {
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();

            // Create server (run Python server file)
            // string cmdText = "python server.py";
            // System.Diagnostics.Process.Start("powershell.exe", cmdText);

            //Console.WriteLine("\n\n\n\n\n");
            PopulateData();
            writer.WriteLine(PlantUMLAPIReport);
            writer.Close();
        }
        internal static void PopulateData()
        {
            PlantUMLAPIReport += "@startuml \r\n";
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                // Console.WriteLine(type);
                if (type.Represented.Node.Equals(Members.INTERFACE) || type.Represented.FileName.Equals("--"))
                {
                    
                    //skip any interface or external nodes. We don't classify them as the program interfaceD
                    continue;
                }
                if (type.Represented.Node.Equals(Members.CLASS))
                {
                    // Console.WriteLine(type.Represented.Code);
                    // System.Diagnostics.Process.Start("http://localhost:8080/create_class/" + type.Represented.Code);
                    PlantUMLAPIReport += type.Represented.Node.ToString() + " " + type.Represented.Code + " {" + System.Environment.NewLine;  
                }
                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);
                // AbbreviatedGraph[] relationship = MetricUtilities.GetMembersOf(type);
                if (members.Length == 0)
                {
                    //this class has no members
                    continue;
                }
                foreach (AbbreviatedGraph member in members)
                {                    
                    if (member.Represented.Node.Equals(Members.Method))
                    {
                        PlantUMLAPIReport += member.Represented.Node.ToString() + " " + member.Represented.Code + "()" + System.Environment.NewLine;
                        // Console.WriteLine("    " + member.Represented.Code + "\n");
                        foreach (AbbreviatedGraph m in member.GetEdges(Relationship.Annotation).Keys.ToArray()) 
                        {
                            if (m.Represented.Node.Equals(Members.Static)) 
                            {
                                PlantUMLAPIReport += "Static" + System.Environment.NewLine;
                                // Console.WriteLine("        Static\n");
                            }
                            if (m.Represented.Node.Equals(Members.Public))
                            {
                                PlantUMLAPIReport += "Public" + System.Environment.NewLine;
                                // Console.WriteLine("        Public\n");
                            } else if (m.Represented.Node.Equals(Members.Private))
                            {
                                PlantUMLAPIReport += "Private" + System.Environment.NewLine;
                                // Console.WriteLine("        Private\n");
                            } else if (m.Represented.Node.Equals(Members.Protected))
                            {
                                PlantUMLAPIReport += "Protected" + System.Environment.NewLine;
                                // Console.WriteLine("        Protected\n");
                            }
                        }
                    }
                    // Todo: Accessing relationships between methods
                    // Todo: Access return type
                }
                PlantUMLAPIReport += "} \r\n";
            }
            PlantUMLAPIReport += "@enduml";
        }
    }
}
