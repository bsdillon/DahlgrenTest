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
    class CountAll
    {
        private static Dictionary<AbbreviatedGraph, double> GoodCount = new Dictionary<AbbreviatedGraph, double>();
        private static Dictionary<AbbreviatedGraph, double> BadCount = new Dictionary<AbbreviatedGraph, double>();

        private static Dictionary<AbbreviatedGraph, int> stateObjects = new Dictionary<AbbreviatedGraph, int>();
        private static Dictionary<AbbreviatedGraph, int> sourceObjects = new Dictionary<AbbreviatedGraph, int>();
        private static List<AbbreviatedGraph> apiObjects = new List<AbbreviatedGraph>();

        public static void Count(StreamWriter sw)
        {
            sw.Write("File\tType\tConstants\tSettings\tSource\tHealthy\tStateObj\tDecorator\tAccessor\tAPI\tUnread\tSuper\tTumor\tDysplasia\tBigAccess\tBadAccess\tFeatures\r\n");
            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                if (type.IsSimulated || NodeFactory.IsAnonymous(type.Represented.Code))
                {
                    continue;//skip this class
                }

                double settings = 0;
                double source = 0;
                double unread = 0;
                double super = 0;
                double healthy = 0;
                double stateObj = 0;
                double tumors = 0;
                double dysplasia = 0;
                double decorator = 0;
                double accessor = 0;
                double api = 0;
                double bigAccess = 0;
                double badAccess = 0;
                double features = 0;

                List<long> tumorModules = new List<long>();
                List<long> dysplasiaModules = new List<long>();
                List<long> featureModules = new List<long>();

                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(type);

                if (stateObjects.ContainsKey(type))
                {
                    stateObj = 1;
                }

                if (sourceObjects.ContainsKey(type))
                {
                    source = 1;
                }

                if (apiObjects.Contains(type))
                {
                    api = 1;
                }

                foreach (AbbreviatedGraph m in members)
                {
                    GephiNode g = MetricUtilities.GephiFromGraph(m);
                    long module = (long)g.GetProperty(NodeProperties.Module);
                    NodePatterns np = (NodePatterns) g.GetProperty(NodeProperties.NodePattern);
                    switch (np)
                    {
                        case NodePatterns.DysplasiaI:
                            if(!dysplasiaModules.Contains(module))
                            {
                                dysplasiaModules.Add(module);
                            }
                            break;
                        case NodePatterns.DysplasiaII:
                            if(!dysplasiaModules.Contains(module))
                            {
                                dysplasiaModules.Add(module);
                            }
                            break;
                        case NodePatterns.Tumor:
                            if(!tumorModules.Contains(module))
                            {
                                tumorModules.Add(module);
                            }
                            break;
                        case NodePatterns.Feature:
                            if (!featureModules.Contains(module))
                            {
                                featureModules.Add(module);
                            }
                            break;
                    }

                    //finds each method with this property; this should be rare enough that each incident has separate significance.
                    if (g.HasProperty(NodeProperties.InAppropriateAccess))
                    {
                        badAccess += (int)(g.GetProperty(NodeProperties.InAppropriateAccess));
                    }

                    AccessPatterns ap = (AccessPatterns)g.GetProperty(NodeProperties.AccessPattern);
                    switch (ap)
                    {
                        case AccessPatterns.Decorator:
                            decorator += 1;
                            break;
                        case AccessPatterns.GetterSetter:
                            //there are one or more accessor methods, but we won't count them
                            accessor += 1;
                            break;
                        case AccessPatterns.OverlyControlledField:
                            bigAccess += 1;
                            break;
                    }

                    StatePatterns sp = (StatePatterns) g.GetProperty(NodeProperties.StateMember);
                    switch (sp)
                    {
                        case StatePatterns.ConstantVariable:
                            //no effect. As close to neutral as possible
                            break;
                        case StatePatterns.UnreadStateField:
                            unread += 1;
                            break;
                        case StatePatterns.SettingVariable:
                            settings += 1;
                            break;
                        case StatePatterns.SuperStateMember:
                            super += 1;
                            break;
                        case StatePatterns.StateVariable:
                            healthy += 1;
                            break;
                    }
                }

                dysplasia += dysplasiaModules.Count;
                tumors += tumorModules.Count;
                features += featureModules.Count;

                sw.Write(type.Represented.FileName + "\t" + type.Represented.Code + "\t0\t" + settings + "\t" + source  + "\t" + healthy + "\t" + stateObj + "\t" + decorator + "\t" + accessor + "\t" + api + "\t" + unread + "\t" + super + "\t" + tumors + "\t" + dysplasia + "\t" + bigAccess + "\t" + badAccess + "\t" + features + System.Environment.NewLine);
            }
        }

        public static void FindPackages(StreamWriter nodeFile, StreamWriter edgeFile)
        {
            Dictionary<AbbreviatedGraph, long> index = new Dictionary<AbbreviatedGraph, long>();
            long next = 0;

            foreach (AbbreviatedGraph type in MetricUtilities.AllMembers)
            {
                if (!GoodCount.ContainsKey(type))
                {
                    //skip the classes which have NOT been counted
                    //e.g. they are out-library
                    continue;
                }

                AbbreviatedGraph[] parents = type.GetEdges(Relationship.MemberOf).Keys.ToArray();

                //is this class parented directly on a package?
                if (!parents[0].Represented.Node.IsClassification)
                {
                    //get and keep all new packages in this structure
                    List<AbbreviatedGraph> packages = FollowPackages(parents);
                    foreach (AbbreviatedGraph p in packages)
                    {
                        if (!index.ContainsKey(p))
                        {
                            index.Add(p, next++);
                        }
                    }

                    index.Add(type, next++);
                }
            }

            nodeFile.WriteLine("Id,Type,Label,Good,Bad,Heat");
            edgeFile.WriteLine("Source,Target,Label");
            foreach (AbbreviatedGraph ag in index.Keys.ToArray())
            {
                if (ag.Represented.Node.IsClassification)
                {
                    //type.Represented
                    //type.Represented.FileName
                    //type.Represented.Code
                    //GoodCount[type]
                    //BadCount[type]
                    double ratio = 0;
                    if (GoodCount[ag] < .00001)
                    {
                        ratio = BadCount[ag];
                    }
                    else if (BadCount[ag] < .00001)
                    {
                        ratio = -GoodCount[ag];
                    }
                    else
                    {
                        ratio = BadCount[ag] / GoodCount[ag];
                    }
                    int value = (int)Math.Ceiling(ratio);

                    nodeFile.WriteLine(index[ag] + "," + ag.Represented.Node + "," + ag.Represented.Code + "," + GoodCount[ag] + "," + BadCount[ag] + "," + value);
                }
                else
                {
                    nodeFile.WriteLine(index[ag] + "," + ag.Represented.Node + "," + ag.Represented.Code + ",0,0,0");
                }

                AbbreviatedGraph[] set = ag.GetEdges(Relationship.MemberOf).Keys.ToArray();
                if (set.Length > 0)
                {
                    AbbreviatedGraph parent = set[0];
                    edgeFile.WriteLine(index[parent] + "," + index[ag] + ",Child");
                }
            }
        }

        private static List<AbbreviatedGraph> FollowPackages(AbbreviatedGraph[] parents)
        {
            List<AbbreviatedGraph> answer = new List<AbbreviatedGraph>();

            if (parents.Length != 1)
            {
                throw new InvalidDataException("A class should have exactly 1 package as a parent. Current set has " + parents.Length);
            }

            if (!parents[0].Represented.Node.Equals(Members.Package))
            {
                throw new InvalidDataException("A class should have a package as a parent. This is a " + parents[0].Represented.Node);
            }

            answer.Add(parents[0]);

            RecursivePackages(answer, parents[0]);

            return answer;
        }

        private static void RecursivePackages(List<AbbreviatedGraph> packages, AbbreviatedGraph current)
        {
            AbbreviatedGraph[] parents = current.GetEdges(Relationship.MemberOf).Keys.ToArray();

            if (parents.Length == 0)
            {
                //end of recursion. No parent.
                return;
            }

            if (parents.Length != 1)
            {
                throw new InvalidDataException("A class or package should have exactly 1 package as a parent. Current set has " + parents.Length);
            }

            if (!parents[0].Represented.Node.Equals(Members.Package))
            {
                throw new InvalidDataException("A class should have a package as a parent. This is a " + parents[0].Represented.Node);
            }

            packages.Add(parents[0]);

            RecursivePackages(packages, parents[0]);
        }

        internal static void AddStateObject(AbbreviatedGraph a, int count)
        {
            stateObjects.Add(a, count);
        }

        internal static void AddSourceObject(AbbreviatedGraph a, int count)
        {
            sourceObjects.Add(a, count);
        }

        internal static void AddAPIClass(AbbreviatedGraph a)
        {
            apiObjects.Add(a);
        }
    }
}
