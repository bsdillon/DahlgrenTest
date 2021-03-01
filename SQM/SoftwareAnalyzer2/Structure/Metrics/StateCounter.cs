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
    class StateCounter
    {
        private enum StateReportable
        {
            KilledMethod,
            NativeState,
            FirstCount,
            FinalCount,
            FinalLink,
            MethodLinked,
            FinalDecision
        }

        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> eqCheck = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> compBoundary = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> litCheck = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> litBoundary = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> nullCheck = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> typeCheck = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static List<AbbreviatedGraph> someMember = new List<AbbreviatedGraph>();

        private static Dictionary<AbbreviatedGraph, Dictionary<StateReportable, int>> reportData = new Dictionary<AbbreviatedGraph, Dictionary<StateReportable, int>>();

        private static StringBuilder Report = new StringBuilder();
        private static StringBuilder ReportExtra = new StringBuilder();
        private static Dictionary<int, int> histogram;
        
        public static string StateReport
        {
            get
            {
                return "Target: "+targetNode+"\r\n"+ReportExtra.ToString()+Report.ToString();
            }
        }

        public static void GetSummary(string file)
        {
            StreamWriter writer = new StreamWriter(file);
            StringBuilder sb = new StringBuilder();

            sb.Append("nZ\u03c3 Target value:\t" + targetNode+"\r\n");
            sb.Append("*******************Histogram Data*******************\r\n");
            List<int> orderedKeys = new List<int>();
            foreach (int count in histogram.Keys)
            {
                orderedKeys.Add(count);
            }
            orderedKeys.Sort();

            foreach (int k in orderedKeys)
            {
                sb.Append(k+"\t:\t"+histogram[k]+"\r\n");
            }
            sb.Append("*******************Histogram Data*******************\r\n\r\n");

            sb.Append("*******************Member Data*******************\r\n\r\n");
            sb.Append("Member\tfile\tNative\tCount1\tLink1\tNumLinks\tCount2\tLink2\tDecision\r\n");
            foreach (AbbreviatedGraph member in reportData.Keys)
            {
                sb.Append(member.Represented.ToString() + "\t" + member.Represented.FileName);

                switch (reportData[member][StateReportable.NativeState])
                {
                    case -1:
                        sb.Append("\tNONE");
                        break;
                    case (int)(Members.ENUM):
                        sb.Append("\tENUM");
                        break;
                    case (int)(Members.Boolean):
                        sb.Append("\tBoolean");
                        break;
                }

                sb.Append("\t" + reportData[member][StateReportable.FirstCount]);

                if (reportData[member].ContainsKey(StateReportable.KilledMethod))
                {
                    sb.Append("\tKilled\t"+reportData[member][StateReportable.KilledMethod]);
                }
                else if (reportData[member].ContainsKey(StateReportable.MethodLinked))
                {
                    int delta = reportData[member][StateReportable.MethodLinked];
                    sb.Append("\tLinked\t" + delta);
                }
                else
                {
                    sb.Append("\tNoData\t0");
                }

                sb.Append("\t" + reportData[member][StateReportable.FinalCount]);

                if (reportData[member].ContainsKey(StateReportable.FinalLink))
                {
                    sb.Append("\tFinal");
                }
                else
                {
                    sb.Append("\tNoData");
                }

                if (reportData[member][StateReportable.FinalDecision] == 1)
                {
                    sb.Append("\tSTATE\r\n");
                }
                else
                {
                    sb.Append("\tNOT\r\n");
                }
            }
            sb.Append("\r\n\r\n");

            writer.WriteLine(sb);
            writer.Close();
        }

        private static double tStar = 1.75;
        private static Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> stateUses = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
        private static Dictionary<AbbreviatedGraph, int> stateCounts = new Dictionary<AbbreviatedGraph, int>();
        private static Dictionary<AbbreviatedGraph, bool> nativeState = new Dictionary<AbbreviatedGraph, bool>();
        private static double targetNode = 0;

        internal static void CountAllStates()
        {
            stateUses = new Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();
            stateCounts = new Dictionary<AbbreviatedGraph, int>();
            nativeState = new Dictionary<AbbreviatedGraph, bool>();

            //this finds all members in all types and classifies them as native state.
            //it also counts the total number of state uses per member.
            AssessTypes();

            //this finds the total counts per member and links them to parent methods if any exist
            LinkMembers();

            //this figures out the sigma and outputs the graph data
            CalculateStatistices();

            LinkState();
        }

        private static void AssessTypes()
        {
            foreach (AbbreviatedGraph current in MetricUtilities.AllMembers)
            {
                AbbreviatedGraph[] members = MetricUtilities.GetMembersOf(current);

                foreach (AbbreviatedGraph m in members)
                {
                    if ((m.Represented.Node.Equals(Members.Field) || m.Represented.Node.Equals(Members.Method)) && !m.IsSimulated && !m.Represented.Code.Equals(NodeFactory.SelfReference))
                    {
                        reportData.Add(m, new Dictionary<StateReportable, int>());
                        reportData[m].Add(StateReportable.FirstCount, 0);
                        reportData[m].Add(StateReportable.FinalCount, 0);
                        reportData[m].Add(StateReportable.NativeState, -1);
                        reportData[m].Add(StateReportable.FinalDecision, 0);
                        stateUses.Add(m, m.GetEdges(Relationship.Control));
                        eqCheck.Add(m, m.GetEdges(Relationship.EqualityCheck));
                        compBoundary.Add(m, m.GetEdges(Relationship.CompareBoundary));
                        litCheck.Add(m, m.GetEdges(Relationship.LiteralCheck));
                        litBoundary.Add(m, m.GetEdges(Relationship.LiteralBoundary));
                        nullCheck.Add(m, m.GetEdges(Relationship.NullCheck));
                        typeCheck.Add(m, m.GetEdges(Relationship.TypeCheck));

                        someMember.Add(m);

                        bool isState = false;

                        foreach (AbbreviatedGraph d in m.GetEdges(Relationship.InstanceOf).Keys)
                        {
                            if (d.Represented.Code.Equals("Boolean"))
                            {
                                //the type of this field is the boolean; therefore it is automatically node state variable.
                                isState = true;
                                reportData[m][StateReportable.NativeState]=(int)Members.Boolean;
                                reportData[m][StateReportable.FinalDecision]=1;
                            }
                            else if (d.Represented.Node.Equals(Members.Enumerator))
                            {
                                isState = true;
                                reportData[m][StateReportable.NativeState] = (int)Members.ENUM;
                                reportData[m][StateReportable.FinalDecision]=1;
                            }
                            else if (!d.IsSimulated)
                            {
                                if (d.Represented.Node.Equals(Members.ENUM))
                                {
                                    isState = true;
                                    reportData[m][StateReportable.NativeState] = (int)Members.ENUM;
                                    reportData[m][StateReportable.FinalDecision]=1;
                                }
                            }
                        }
                        nativeState.Add(m, isState);
                    }
                }
            }
        }

        private static void LinkMembers()
        {
            foreach (AbbreviatedGraph member in stateUses.Keys)
            {
                if (stateUses[member].Count == 0)
                {
                    stateCounts.Add(member, 0);
                    continue;
                }

                int count = 0;
                foreach (AbbreviatedGraph a in stateUses[member].Keys)
                {
                    count += stateUses[member][a].Count;
                    if (stateUses[member][a].Count > 1)
                    {
                        //TODO Implement silent logging of error state
                        throw new InvalidOperationException("State member " + member + " contains " + stateUses[member][a].Count + " state uses.");
                    }
                }

                reportData[member][StateReportable.FirstCount] = count;
                reportData[member][StateReportable.FinalCount] = count;
                stateCounts.Add(member, count);
                if (nativeState[member])
                {
                    Console.WriteLine("Native:\t" + count);
                }
            }

            foreach (AbbreviatedGraph member in stateUses.Keys)
            {
                if (stateCounts[member] == 0)
                {
                    continue;
                }

                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> source = member.GetEdges(Relationship.OverridesImplementation);

                if(source.Count==0)
                {
                    //no overrides. keep as is
                    continue;
                }

                //find the one source which is not simulated
                AbbreviatedGraph s = GetBestSource(source.Keys.ToArray());
                if (s==null)
                {
                    //no non-simulated member
                    //methods which override simulated members do not count
                    //stateCounts[member] = 0;
                    stateCounts.Remove(member);
                    someMember.Remove(member);
                    reportData[member].Add(StateReportable.KilledMethod, 0);
                    reportData[member][StateReportable.FinalCount] = 0;
                    continue;
                }

                //may need to find ultimate source.
                source = s.GetEdges(Relationship.OverridesImplementation);
                while (source.Count > 0 && !source.Keys.ToArray()[0].IsSimulated)
                {
                    s = GetBestSource(source.Keys.ToArray());
                    source = s.GetEdges(Relationship.OverridesImplementation);
                }

                if (source.Count > 0 && source.Keys.ToArray()[0].IsSimulated)
                {
                    //this method must have had at least once source which was simulated
                    //methods which override simulated members do not count
                    //stateCounts[member] = 0;
                    stateCounts.Remove(member);
                    someMember.Remove(member);
                    reportData[member].Add(StateReportable.KilledMethod, 1);
                    reportData[member][StateReportable.FinalCount] = 0;
                    continue;
                }

                if (!s.IsSimulated)
                {
                    //there is an ultimate non-simulated source for this method
                    //add total count to ultimate source and forget that the override every had any uses.
                    Console.WriteLine("Removal:\t" + member);
                    Console.WriteLine("Increment:\t" + s +"\t"+stateCounts[s]+"\t"+stateCounts[member]);

                    if (!reportData[s].ContainsKey(StateReportable.MethodLinked))
                    {
                        reportData[s].Add(StateReportable.MethodLinked, 0);
                    }
                    reportData[s][StateReportable.MethodLinked]++;
                    reportData[s][StateReportable.FinalCount] += stateCounts[member];
                    stateCounts[s] += stateCounts[member];
                    stateCounts.Remove(member);
                    someMember.Remove(member);
                    reportData[member].Add(StateReportable.MethodLinked, 0);
                    reportData[member][StateReportable.FinalCount] = 0;
                }
                else
                {
                    //TODO deteremine what if anything should happen here
                }
            }

            StringBuilder ReportHead = new StringBuilder();
            StringBuilder ReportBody = new StringBuilder();
            ReportHead.Append("Member\tFile\tState\tEquality\tBoundary\tLiteral\tLitBoundary\tNull\tType\tNative\r\n");
            foreach (AbbreviatedGraph m in someMember)
            {
                int stateCount = 0;
                int equalCount = 0;
                int compBoundaryCount = 0;
                int litCheckCount = 0;
                int litBoundaryCount = 0;
                int nullCount = 0;
                int typeCount = 0;

                foreach (AbbreviatedGraph g in stateUses[m].Keys)
                {
                    stateCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tState\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in eqCheck[m].Keys)
                {
                    equalCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tEquality\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in compBoundary[m].Keys)
                {
                    compBoundaryCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tBoundary\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in litCheck[m].Keys)
                {
                    litCheckCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tLiteral\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in litBoundary[m].Keys)
                {
                    litBoundaryCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tLitBoundary\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in nullCheck[m].Keys)
                {
                    nullCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tNull\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }

                foreach (AbbreviatedGraph g in typeCheck[m].Keys)
                {
                    typeCount++;
                    ReportBody.Append(m + "\t" + m.Represented.FileName + "\tType\t" + g + "\t" + g.Represented.FileName + "\r\n");
                }


                int totalCount = stateCount + equalCount + compBoundaryCount + litCheckCount + litBoundaryCount + nullCount + typeCount;

                if (totalCount > 0 || nativeState[m])
                {
                    ReportHead.Append(m + "\t" + m.Represented.FileName + "\t" + stateCount + "\t" + equalCount + "\t" + compBoundaryCount + "\t" +
                    litCheckCount + "\t" + litBoundaryCount + "\t" + nullCount + "\t" + typeCount +
                    "\t" + nativeState[m] + "\r\n");
                }
            }

            Report.Append(ReportHead);
            Report.Append(ReportBody);
        }

        private static AbbreviatedGraph GetBestSource(AbbreviatedGraph[] set)
        {
            AbbreviatedGraph best = null;
            foreach (AbbreviatedGraph k in set)
            {
                if (k.IsSimulated)
                {
                    continue;
                }

                AbbreviatedGraph classWithK = k.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];
                if (classWithK.Represented.Node.Equals(Members.CLASS))
                {
                    best = k;
                }

                if (best == null)
                {
                    best = k;
                }
            }
            return best;
        }

        private static void CalculateStatistices()
        {
            int numberFields = 0;
            double sum = 0;
            double stdev = 0;

            histogram = new Dictionary<int, int>();

            foreach (AbbreviatedGraph g in stateCounts.Keys)
            {
                int val = stateCounts[g];
                if (!histogram.ContainsKey(val))
                {
                    histogram.Add(val,0);
                }

                histogram[val]++;
            }

            foreach (int count in histogram.Keys)
            {
                double d = histogram[count];
                Console.WriteLine("Histo["+count+"]:\t"+d);
                numberFields += (int)d;
                sum += (count * d);
                stdev += d * (count * count);
            }

            stdev /= numberFields - 1;
            stdev = Math.Sqrt(stdev);

            targetNode = tStar * 2 * stdev;//based on experimental evidence, the majority of cases can be seens as state after 2 standard deviations.
            Console.WriteLine("Target:\t"+targetNode);
            foreach (AbbreviatedGraph g in stateCounts.Keys)
            {
                if (nativeState[g] || stateCounts[g] > targetNode)
                {
                    MetricUtilities.GephiFromGraph(g).SetProperty(NodeProperties.StateMember, (int)StatePatterns.SomeState);
                    MetricUtilities.AddStateMember(g);
                    reportData[g][StateReportable.FinalDecision]=1;
                }
            }
        }

        private static void LinkState()
        {
            //this method will link any methods which access state variables so that all
            //state-related members can be discovered.

            bool someChange = true;
            while (someChange)
            {
                someChange = false;//start each loop with the assumption that there are no new state methods/fields

                List<AbbreviatedGraph> relatedState = new List<AbbreviatedGraph>();
                AbbreviatedGraph[] stateOnly = MetricUtilities.StateMembers;
                foreach (AbbreviatedGraph m in stateOnly)
                {
                    GephiNode g = MetricUtilities.GephiFromGraph(m);

                    if ((AccessPatterns)g.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.GetterSetter)
                    {
                        //this is a getter or setter which might have a non-state control variable
                        AbbreviatedGraph cv = MetricUtilities.GetControlledVariable(m);

                        if (cv == null)
                        {
                            throw new InvalidOperationException("Supposed getter/setter has no control variable: " + g);
                        }

                        relatedState.Add(cv);
                    }
                    else if ((AccessPatterns)g.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.ControlledField)
                    {
                        //this is a controlled variable which might have a non-state accessor
                        AbbreviatedGraph[] cm = MetricUtilities.GetVariableControlMethods(m);
                        if (cm == null)
                        {
                            throw new InvalidOperationException("Supposed controlled variable has no getter/setter : " + g);
                        }

                        relatedState.AddRange(cm);
                    }
                }

                foreach (AbbreviatedGraph m2 in relatedState)
                {
                    if (!MetricUtilities.IsStateMember(m2))
                    {
                        if (stateCounts.ContainsKey(m2))
                        {
                            Console.WriteLine("Linked:\t" + m2 + "\t" + stateCounts[m2]);
                        }
                        else
                        {
                            Console.WriteLine("Linked:\t" + m2 + "\t--");
                        }
                        reportData[m2].Add(StateReportable.FinalLink, 0);
                        reportData[m2][StateReportable.FinalDecision]=1;
                        MetricUtilities.AddStateMember(m2);
                        ReportExtra.Append("Added\t" + m2 + "\t" + m2.Represented.FileName + "\r\n");
                        MetricUtilities.GephiFromGraph(m2).SetProperty(NodeProperties.StateMember, (int)StatePatterns.SomeState);
                        someChange = true;
                    }
                }
            }
            //loop repeats until all related state variables and methods have been identified
        }
    }
}
