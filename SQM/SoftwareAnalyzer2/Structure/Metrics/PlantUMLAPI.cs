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
        internal static void CreatePlantUMLAPI(string filename)
        {
            // Create server (run Python server file)
            string cmdText = "python server.py";
            // System.Diagnostics.Process.Start("powershell.exe", cmdText);
            Console.WriteLine("\n\n\n\n\n");
            PopulateData();
        }
        internal static void PopulateData()
        {
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                if (type.Represented.Node.Equals(Members.INTERFACE) || type.Represented.FileName.Equals("--"))
                {
                    
                    //skip any interface or external nodes. We don't classify them as the program interface
                    continue;
                }
                if (type.Represented.Node.Equals(Members.CLASS))
                {
                    Console.WriteLine("Code: \n" + type.Represented.Code);
                    // System.Diagnostics.Process.Start("http://localhost:8080/create_class/" + type.Represented.Code);
                }
                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);
                AbbreviatedGraph[] relationship = MetricUtilities.GetMembersOf(type);
                if (members.Length == 0)
                {
                    //this class has no members
                    continue;
                }
                foreach (AbbreviatedGraph member in members)
                {
                    // Console.WriteLine("\n\n\n\n\n\n\n\n" + "This is the member graph: \n" + members + "\n\n\n\n\n\n\n\n");
                    if (member.Represented.Node.Equals(Members.Method))
                    {
                        Console.WriteLine("    " + member.Represented.Code + "\n");
                        Console.WriteLine("    " + member.Represented.Code + "\n");

                        // member.Represented.Node.ToString() + " " + member.Represented.Code + System.Environment.NewLine;
                    }
                    if (member.Represented.Node.Equals(Members.Static))
                    {
                        Console.WriteLine("    " + member.Represented.Code + "\n");
                        // member.Represented.Node.ToString() + " " + member.Represented.Code + System.Environment.NewLine;
                    }
                    // Attempting to access return type
                }
            }
        }
    }
}
