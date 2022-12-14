//Commented out because you need DahlgrenTest/Automated_MBSE to run. 
//In order to run this. Get MBSE_library and server.py from Automated_MBSE
//and change line 34 to be the path to the location of server.py
//ensure server.py and MBSE_library are in the same directory
//The MBSE outputs will be in the directory as well
//This will only work on windows if you want it to work on Linux
//change line 35 to run server.py in Linux fashion

/*using SoftwareAnalyzer2.Structure.Metrics;
using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Specialized;
using System.Net;
using System.Text;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class PlantUMLAPI
    {
        // TODO: Needs to return an int if used as reportCount in ModuleNavigator.cs
        private static string url = "http://localhost:8080";
        internal static void CreatePlantUMLAPI(string filename)
        {

            // Create server (run Python server file) 
            // TODO: run server in linux
            string cmdText = "python server.py"; //change this to path of server.py
            System.Diagnostics.Process.Start("powershell.exe", cmdText);
            PopulateData();
        }
        internal static void PopulateData()
        {
           
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                string Class_name = "";   
                // Console.WriteLine(type);
                if (type.Represented.Node.Equals(Members.INTERFACE) || type.Represented.FileName.Equals("--"))
                {
                    
                    //skip any interface or external nodes. We don't classify them as the program interfaceD
                    continue;
                }
                if (type.Represented.Node.Equals(Members.CLASS))
                {
                    Class_name = type.Represented.Code;   
                using (var wb = new WebClient())
            {
                    wb.UploadString(url, "http://localhost:8080?&create_class=" + Class_name);
                    }
                }
                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);
                // AbbreviatedGraph[] relationship = MetricUtilities.GetMembersOf(type);
                if (members.Length == 0)
                {
                    //this class has no members
                    continue;
                }
                foreach (AbbreviatedGraph member in members) {
                    if (member.Represented.Node.Equals(Members.Method))
                    {
                        Console.WriteLine("First loop");
                        Console.WriteLine(member.Represented.Code);
                        string scope = "";
                        bool isStatic = false;
                        foreach (AbbreviatedGraph m in member.GetEdges(Relationship.Annotation).Keys.ToArray())
                        {
                            Console.WriteLine("Second loop");
                            Console.WriteLine(m.Represented.Node.ToString());
                       
                            if (m.Represented.Node.Equals(Members.Static))
                            {
                                isStatic = true;
                            }
                            if (m.Represented.Node.Equals(Members.Public))
                            {
                                scope = "public";
                            }
                            else if (m.Represented.Node.Equals(Members.Private))
                            {
                                scope = "private";
                            }
                            else if (m.Represented.Node.Equals(Members.Protected))
                            {
                                scope = "protected";
                            }
                        }
			                using (var wb = new WebClient())
                            {
                            Console.WriteLine(isStatic);
                                wb.UploadString(url, "http://localhost:8080?&create_method=" + Class_name + "&method_name="+ member.Represented.Code + "&scope=" + scope + "&static=" + isStatic + "&return_type= ");
                            }
                       }
                    // Todo: Accessing relationships between methods
                    // Todo: Access return type
                }
            }
        }
    }
}*/
