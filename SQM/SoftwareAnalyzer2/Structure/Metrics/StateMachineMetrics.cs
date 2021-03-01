using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class StateMachineMetrics
    {
        internal static int CreateReport(string filename, StatePatterns statePatterns)
        {
            int answer = 0;
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();
            switch (statePatterns)
            {
                case StatePatterns.ConstantVariable:
                    sb.Append("The following logic may be shortened by the use of a constant.\r\n\tConsider the effects on the method in question and the class it belongs to.\r\n");
                    answer = ConstantReport(sb);
                    break;
                case StatePatterns.SettingVariable:
                    sb.Append("The following logic may be shortened by the use of a setting which is\r\n\tconstant throughout the object's lifetime. Consider the effects on \r\n\tthe method in question and the class it belongs to.\r\n");
                    answer = SettingReport(sb);
                    break;
                case StatePatterns.UnreadStateField:
                    sb.Append("This is clearly meant to be a state variable and is updated, but is never read.\r\n");
                    sb.Append("\tThe program's logic may be considerably reduced by removing this field and any\r\n");
                    sb.Append("\tlogic dedicated to feeding the state variable.\r\n");
                    answer = UnreadReport(sb);
                    break;
                case StatePatterns.SuperStateMember:
                    sb.Append("These methods are related and active in determining state. Because they\r\n");
                    sb.Append("\texist in a type hierarchy that relevance to state is shared universally.\r\n");
                    answer = SuperStateReport(sb);
                    break;
                case StatePatterns.SettingSource:
                    sb.Append("Based on usage patterns the following classes have been identified as likely\r\n");
                    sb.Append("\tsources for settings within the program\r\n");
                    answer = SourceReport(sb);
                    break;
                case StatePatterns.StateVariable:
                    sb.Append("These variables has been identified as healthy and normal state.\r\n");
                    answer = StateReport(sb);
                    break;
                case StatePatterns.SomeState:
                    answer = StateObjectReport(sb);
                    break;
            }
            writer.WriteLine(sb);
            writer.Close();
            return answer;
        }

        private static List<StateMachine> excess = new List<StateMachine>();

        private static int ConstantReport(StringBuilder sb)
        {
            int count = 1;
            StateMachine[] set = MetricUtilities.GetStateMachines(StatePatterns.ConstantVariable);
            foreach (StateMachine sm in set)
            {
                if (sm.CountTerminalNodes() > 0)
                {
                    sb.Append("*************Constant Variable Report ( " + count + " )*************\r\n");
                    sm.WritePrimary(sb);
                    sm.WriteDefaultValue(sb);
                    sm.WriteAllValues(sb);
                    sm.WriteUnusedSetters(sb);
                    sb.Append("**************************************************\r\n");
                    sm.WriteTerminalNodeDetail(sb);
                    sb.Append("**************************************************\r\n");
                    sm.WriteBothTrees(sb);
                    sb.Append("\r\n\r\n");
                    count++;
                    AbbreviatedGraph type = MetricUtilities.FindType(sm.PrimaryField);
                    if (!stateMembers.ContainsKey(type))
                    {
                        stateMembers.Add(type, new List<AbbreviatedGraph>());
                    }
                    stateMembers[type].Add(sm.PrimaryField);
                }
            }
            return count - 1;
        }

        private static int SettingReport(StringBuilder sb)
        {
            StateMachine[] set = MetricUtilities.GetStateMachines(StatePatterns.SettingVariable);
            int count = 1;
            Dictionary<AbbreviatedGraph, int> sources = new Dictionary<AbbreviatedGraph, int>();
            foreach (StateMachine sm in set)
            {
                sb.Append("*************Setting Variable Report ( " + count + " )*************\r\n");
                sm.WritePrimary(sb);
                sm.WriteDefaultValue(sb);
                sm.WriteUnusedSetters(sb);
                sb.Append("**************************************************\r\n");
                sm.WriteTerminalNodeDetail(sb);
                sb.Append("**************************************************\r\n");
                sm.WriteBothTrees(sb);
                sb.Append("\r\n\r\n");
                sm.AddSources(sources);
                count++;
                AbbreviatedGraph type = MetricUtilities.FindType(sm.PrimaryField);
                if (!stateMembers.ContainsKey(type))
                {
                    stateMembers.Add(type, new List<AbbreviatedGraph>());
                }
                stateMembers[type].Add(sm.PrimaryField);
            }

            Dictionary<int, List<AbbreviatedGraph>> reverse = new Dictionary<int, List<AbbreviatedGraph>>();

            double sum = 0;
            double stdev = 0;
            int n = 0;
            foreach (AbbreviatedGraph g in sources.Keys)
            {
                if (!reverse.ContainsKey(sources[g]))
                {
                    reverse.Add(sources[g], new List<AbbreviatedGraph>());
                }

                if (sources[g] > 1)
                {
                    reverse[sources[g]].Add(g);

                    //in collecting statistics for our standardeviation we treat 1 as the mean.
                    //a lot of sources may be used once without any clear purpose
                    //we are only interested in far outliers that are reliable as sources.
                    sum += sources[g]-1;
                    stdev += (sources[g] - 1) * (sources[g] - 1);
                }

                //in this sample there are a variety of 1-use-only variables. These are at 
                //the mean, so they don't affect the sum or stdev, but they do affect the count.
                n++;
            }

            //based on the sample, we can now identify clear outliers greater than 2xSigma
            stdev /= n - 1;
            stdev = Math.Sqrt(stdev);
            double targetNode = 2 * stdev;

            foreach (int i in reverse.Keys)
            {
                if (i > targetNode)
                {
                    foreach(AbbreviatedGraph c in reverse[i])
                    {
                        settingSources.Add(c, i);
                    }
                }
            }
            return count - 1;
        }

        private static Dictionary<AbbreviatedGraph, int> settingSources = new Dictionary<AbbreviatedGraph, int>();

        private static int SourceReport(StringBuilder sb)
        {
            int count = 1;
            sb.Append("*************Setting Source Objects*************\r\n");
            foreach (AbbreviatedGraph a in settingSources.Keys)
            {
                CountAll.AddSourceObject(a, settingSources[a]);
                sb.Append("\t" + a + " @ " + a.Represented.FileName+"\r\n");
                count++;
            }
            return count - 1;
        }

        private static int UnreadReport(StringBuilder sb)
        {
            StateMachine[] set = MetricUtilities.GetStateMachines(StatePatterns.UnreadStateField);
            int count = 1;
            foreach (StateMachine sm in set)
            {
                sb.Append("*************Unread State Variable Report ( " + count + " )*************\r\n");
                sm.WritePrimary(sb);
                sm.WriteUnusedSetters(sb);
                sb.Append("**************************************************\r\n");
                sm.WriteBothTrees(sb);
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
                AbbreviatedGraph type = MetricUtilities.FindType(sm.PrimaryField);
                if (!stateMembers.ContainsKey(type))
                {
                    stateMembers.Add(type, new List<AbbreviatedGraph>());
                }
                stateMembers[type].Add(sm.PrimaryField);
            }
            return count - 1;
        }

        private static int SuperStateReport(StringBuilder sb)
        {
            StateMachine[] set = MetricUtilities.GetStateMachines(StatePatterns.SuperStateMember);
            int count = 1;
            foreach (StateMachine sm in set)
            {
                sb.Append("*************Super State Method Report ( " + count + " )*************\r\n");
                sm.WriteSuperState(sb);
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }
            return count - 1;
        }

        private static Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> stateMembers = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();

        private static int StateReport(StringBuilder sb)
        {
            StateMachine[] set = MetricUtilities.GetStateMachines(StatePatterns.StateVariable);
            int count = 1;
            Dictionary<AbbreviatedGraph, Dictionary<AbbreviatedGraph, int>> relationships = new Dictionary<AbbreviatedGraph,Dictionary<AbbreviatedGraph,int>>();
            foreach (StateMachine sm in set)
            {
                sb.Append("*************State Variable Report ( " + count + " )*************\r\n");
                sm.WritePrimary(sb);
                sb.Append("**************************************************\r\n");
                sm.WriteDefaultValue(sb);
                sm.WriteUnusedSetters(sb);
                sb.Append("**************************************************\r\n");
                sm.WriteBothTrees(sb);
                sb.Append("\r\n\r\n");
                count++;
                AbbreviatedGraph type = MetricUtilities.FindType(sm.PrimaryField);
                if (!stateMembers.ContainsKey(type))
                {
                    stateMembers.Add(type, new List<AbbreviatedGraph>());
                }
                stateMembers[type].Add(sm.PrimaryField);
            }
            return count - 1;
        }

        private static int StateObjectReport(StringBuilder sb)
        {
            Dictionary<int, List<AbbreviatedGraph>> reverse = new Dictionary<int, List<AbbreviatedGraph>>();

            double sum = 0;
            double stdev = 0;
            int n = 0;
            foreach (AbbreviatedGraph type in stateMembers.Keys)
            {
                int num = stateMembers[type].Count;
                if (!reverse.ContainsKey(num))
                {
                    reverse.Add(num, new List<AbbreviatedGraph>());
                }

                if (num > 1)
                {
                    reverse[num].Add(type);

                    //in collecting statistics for our standardeviation we treat 1 as the mean.
                    //a lot of sources may be used once without any clear purpose
                    //we are only interested in far outliers that are reliable as sources.
                    sum += num - 1;
                    stdev += (num - 1) * (num - 1);
                }

                //in this sample there are a variety of 1-use-only variables. These are at 
                //the mean, so they don't affect the sum or stdev, but they do affect the count.
                n++;
            }

            //based on the sample, we can now identify clear outliers greater than 2xSigma
            stdev /= n - 1;
            stdev = Math.Sqrt(stdev);
            double targetNode = 2 * stdev;

            List<AbbreviatedGraph> stateObjects = new List<AbbreviatedGraph>();

            foreach (int i in reverse.Keys)
            {
                if (i > targetNode)
                {
                    foreach (AbbreviatedGraph r in reverse[i])
                    {
                        stateObjects.Add(r);
                    }
                }
            }

            //these are the state objects. If I can find a relationship to another class, 
            //that is a good indicator of how they operate together.
            int reportCount = 1;
            foreach (AbbreviatedGraph so in stateObjects)
            {
                List<AbbreviatedGraph> constant = new List<AbbreviatedGraph>();
                List<AbbreviatedGraph> setting = new List<AbbreviatedGraph>();
                List<AbbreviatedGraph> unread = new List<AbbreviatedGraph>();
                List<AbbreviatedGraph> healthy = new List<AbbreviatedGraph>();

                Dictionary<AbbreviatedGraph, int> useCounts = new Dictionary<AbbreviatedGraph, int>();
                foreach (AbbreviatedGraph m in stateMembers[so])
                {
                    //for each one of these we want to get its state machine
                    StateMachine sm = MetricUtilities.GetStateMachine(m);
                    switch (sm.Type)
                    {
                        case StatePatterns.ConstantVariable:
                            constant.Add(m);
                            break;
                        case StatePatterns.SettingVariable:
                            setting.Add(m);
                            break;
                        case StatePatterns.UnreadStateField:
                            unread.Add(m);
                            break;
                        case StatePatterns.StateVariable:
                            healthy.Add(m);
                            break;
                    }

                    //find the terminal nodes
                    AbbreviatedGraph [] terminals = sm.GetTerminalNodes();
                    
                    foreach (AbbreviatedGraph t in terminals)
                    {
                        //identify their classes
                        AbbreviatedGraph type = MetricUtilities.FindType(t);
    
                        //add them to the count
                        if (!useCounts.ContainsKey(type))
                        {
                            useCounts.Add(type, 0);
                        }
                        useCounts[type]++;
                    }
                }

                //order them by number of uses
                List<int> counts = new List<int>();
                Dictionary<int, List<AbbreviatedGraph>> reverse2 = new Dictionary<int, List<AbbreviatedGraph>>();
                n = 0;
                sum = 0;
                stdev = 0;
                foreach (AbbreviatedGraph t in useCounts.Keys)
                {
                    int num = useCounts[t];
                    if (!reverse2.ContainsKey(num))
                    {
                        reverse2.Add(num, new List<AbbreviatedGraph>());

                        if (num > 1)
                        {
                            counts.Add(num);
                            if (t != so)
                            {
                                sum += num - 1;
                                stdev += (num - 1) * (num - 1);
                            }
                        }
                    }
                    reverse2[num].Add(t);
                    n++;
                }

                //based on the sample, we can now identify clear outliers greater than 2xSigma
                stdev /= n - 1;
                stdev = Math.Sqrt(stdev);
                targetNode = 2 * stdev;

                CountAll.AddStateObject(so, stateMembers[so].Count); 
                sb.Append("*************State Object Report ( " + reportCount + " )*************\r\n");
                sb.Append("\tfor " + so + " @ " + so.Represented.FileName + "\r\n");
                sb.Append("**************************************************\r\n");
                sb.Append("There are " + stateMembers[so].Count + " state variables indentifed in this type.\r\n");
                sb.Append("\tConstant Variables: " + constant.Count + "\r\n");
                foreach (AbbreviatedGraph var in constant)
                {
                    sb.Append("\t\t" + var + "\r\n");
                }

                sb.Append("\tUnread Variables  : " + unread.Count + "\r\n");
                foreach (AbbreviatedGraph var in unread)
                {
                    sb.Append("\t\t" + var + "\r\n");
                }

                sb.Append("\tSetting Variables : " + setting.Count + "\r\n");
                foreach (AbbreviatedGraph var in setting)
                {
                    sb.Append("\t\t" + var + "\r\n");
                }

                sb.Append("\tHealthy Variables : " + healthy.Count + "\r\n");
                foreach (AbbreviatedGraph var in healthy)
                {
                    sb.Append("\t\t" + var + "\r\n");
                }
                sb.Append("**************************************************\r\n");

                if (counts.Count == 0)
                {
                    sb.Append("Inspite of these state members no object appears to use the state object.\r\n");
                    sb.Append("**************************************************\r\n");
                }
                else
                {
                    //remove insignificant numbers
                    foreach (int c in counts.ToArray())
                    {
                        if (c < targetNode)
                        {
                            counts.Remove(c);
                        }
                    }
                    counts.Sort();

                    if (counts.Count > 0)
                    {
                        sb.Append("The following classes show a strong user-class relationship with this state object.\r\n");
                        int last = 0;
                        string data = "";
                        int max = counts[counts.Count - 1];
                        for (int k = counts.Count - 1; k >= 0; k--)
                        {
                            //get the next number
                            int i = counts[k];

                            if (last != i)
                            {
                                //if they are different we update the data
                                data = " |";
                                for (int j = 0; j < i; j++)
                                {
                                    data += "*";
                                }

                                for (int j = i; j < max; j++)
                                {
                                    data += " ";
                                }
                                data += "|\t";
                            }

                            //and now output a graphic to show that dependency
                            foreach (AbbreviatedGraph t in reverse2[i])
                            {
                                if (t == so)
                                {
                                    sb.Append(data + "[SELF]\r\n");
                                }
                                else
                                {
                                    sb.Append(data + t + " @ " + t.Represented.FileName + "\r\n");
                                }
                            }
                        }
                        sb.Append("**************************************************\r\n");
                    }
                }
                sb.Append("\r\n\r\n");
                reportCount++;
            }
            return reportCount - 1;
        }
    }
}