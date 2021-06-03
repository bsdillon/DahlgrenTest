using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    /// <summary>
    /// Integrity values are used to deteremine what portion of a class or module
    /// is collocated in the same class or module. In a perfect class only one module
    /// is represented. In a perfect module, only one class is represented.
    /// </summary>
    class IntegrityMetrics
    {
        /// <summary>
        /// Head method to statically examine all integrity values for classes
        /// and modules within the graph. After calculating all values, each 
        /// node in the graph is attributed the specific integrity values calculated
        /// </summary>
        public static void CalculateAllItegrityValues()
        {
            CalculateTypeIntegrity();
            CalculateModuleIntegrity();
        }

        /// <summary>
        /// Calculate the integrity value for each class and attributes that value of all members
        /// </summary>
        private static void CalculateTypeIntegrity()
        {
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                //initialize a variety of module counts for this type
                Dictionary<long, List<AbbreviatedGraph>> modulesInType = new Dictionary<long, List<AbbreviatedGraph>>();
                Dictionary<long, int> moduleCount = new Dictionary<long, int>();
                int totalMemberCount = 0;
                int largestNonSeparatedModule = 0;
                int nonSeparatedCount = 0;
                List<GephiNode> nonSeparatedMembers = new List<GephiNode>();
                List<GephiNode> separatedMembers = new List<GephiNode>();

                foreach (AbbreviatedGraph ag in MetricUtilities.GetMembersOf(type))
                {
                    //determine the module affiliation of the type member
                    GephiNode member = MetricUtilities.GephiFromGraph(ag);
                    long mod = (long)member.GetProperty(NodeProperties.Module);

                    //update module counts
                    if (!modulesInType.ContainsKey(mod))
                    {
                        modulesInType.Add(mod, new List<AbbreviatedGraph>());
                    }
                    modulesInType[mod].Add(ag);

                    if (!moduleCount.ContainsKey(mod))
                    {
                        moduleCount.Add(mod, 0);
                    }
                    moduleCount[mod]++;

                    //divide the separated members and the non-separated members in the type
                    totalMemberCount++;
                    if (MetricUtilities.IsImportantConnection(member))
                    {
                        nonSeparatedCount++;
                        nonSeparatedMembers.Add(member);

                        //track the largest of all module numbers
                        if (moduleCount[mod] > largestNonSeparatedModule)
                        {
                            largestNonSeparatedModule = moduleCount[mod];
                        }
                    }
                    else
                    {
                        separatedMembers.Add(member);
                    }
                }

                //class integrity value is the percentage of the largest module within the class
                //for the purposes of this value, separated values are not included in the calculation
                double integrityValue = 100.0 * largestNonSeparatedModule / nonSeparatedCount;
                if (totalMemberCount != nonSeparatedCount)
                {
                    //this class has separated values, so they ALL get the same integrity value;
                    foreach (GephiNode member in separatedMembers)
                    {
                        member.SetProperty(NodeProperties.ClassIntegrity, 100.0);
                    }
                }

                //assign the same integrity value to ALL nonseparated nodes
                foreach (GephiNode member in nonSeparatedMembers)
                {
                    member.SetProperty(NodeProperties.ClassIntegrity, integrityValue);
                }
            }
        }

        /// <summary>
        /// Calculate the integrity value for each module and attributes that value of all members
        /// </summary>
        private static void CalculateModuleIntegrity()
        {
            foreach (long module in MetricUtilities.ModuleIds)
            {
                //initialize a variety of class counts for this module
                Dictionary<string, int> classCount = new Dictionary<string, int>();
                double totalCounts = 0;
                int max = 0;

                foreach (GephiNode member in MetricUtilities.GetModule(module))
                {
                    //for whatever class is actually associated with the member we have
                    //to credit the ultimate host of all nested types.
                    AbbreviatedGraph gm = MetricUtilities.GraphFromGephi(member);
                    AbbreviatedGraph type = MetricUtilities.FindHostType(gm);

                    //determine the class affiliation of the module member
                    string className = type.Represented.FileName + "-" + type.Represented.Code;
                    //The old way to determine "class" depended on the class of the member.
                    //The new method looks at the class of the file host.
                    //string className = member.GetProperty(NodeProperties.File) + "-" + member.GetProperty(NodeProperties.TypeName);
                    if (!classCount.ContainsKey(className))
                    {
                        classCount.Add(className, 0);
                    }

                    //update module counts
                    classCount[className]++;
                    totalCounts++;

                    //track the largest of all class numbers
                    if (classCount[className] > max)
                    {
                        max = classCount[className];
                    }
                }

                //module integrity is the percentage of the largest class within the module
                double integrity = 100 * max / totalCounts;

                //assign the same integrity value to ALL nodes in the module
                foreach (GephiNode member in MetricUtilities.GetModule(module))
                {
                    member.SetProperty(NodeProperties.ModuleIntegrity, integrity);
                }
            }
        }
    }
}
