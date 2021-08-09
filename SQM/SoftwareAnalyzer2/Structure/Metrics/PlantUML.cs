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
        private static string PlantUMLReport = "";
    
        // TODO: Needs to return an int if used as reportCount in ModuleNavigator.cs
        internal static void CreatePlantUML(string filename)
        {
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();
            PopulateData();
            writer.WriteLine(PlantUMLReport);
            writer.Close();

        }
        internal static void PopulateData()
        {
            PlantUMLReport += "@startuml \r\n";
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                if (type.Represented.Node.Equals(Members.INTERFACE) || type.Represented.FileName.Equals("--"))
                {
                    //skip any interface or external nodes. We don't classify them as the program interface
                    continue;
                }
                if (type.Represented.Node.Equals(Members.CLASS))
                {
                    PlantUMLReport += type.Represented.Node.ToString() + " " + type.Represented.FileName + " " + type.Represented.Code + System.Environment.NewLine;  
                }
                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);
                if (members.Length == 0)
                {
                    //this class has no members
                    continue;
                }
            foreach (AbbreviatedGraph member in members)
                {
                    if (member.Represented.Node.Equals(Members.Method))
                    {
                        PlantUMLReport += member.Represented.Node.ToString() + " " + member.Represented.FileName + " " + member.Represented.Code + System.Environment.NewLine;
                    }              
                }
                PlantUMLReport += "@enduml";
            }
        }
    }
}
