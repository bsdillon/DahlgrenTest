using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class NodePatternMetrics
    {
        private static List<AbbreviatedGraph> decoratorMethods = new List<AbbreviatedGraph>();

        internal static void FindPatterns()
        {
            JoinDecoratorMethods();
            JoinGetterSetter();
        }

        private static void JoinDecoratorMethods()
        {
            foreach (GephiNode m in MetricUtilities.AllNodes)
            {
                NodeType mType = m.Category;

                if (!(mType.Equals(Members.Method) && MetricUtilities.GetLinksInvolving(m).Length > 0 && MetricUtilities.IsImportantConnection(m)))
                {
                    continue;//we are only interested in methods with connections and not in external classes
                }

                AbbreviatedGraph method = MetricUtilities.GraphFromGephi(m);
                AbbreviatedGraph[] parameters = method.GetEdges(Relationship.FormalParameter).Keys.ToArray();
                AbbreviatedGraph[] returnType = method.GetEdges(Relationship.ReturnType).Keys.ToArray();
                
                if (parameters.Length != 1)
                {
                    //we are only interested in methods with exactly one parameter.
                    continue;
                }     
              
                AbbreviatedGraph[] returnFromMethod = method.GetEdges(Relationship.ReturnValue).Keys.ToArray();

                AbbreviatedGraph[] paramType = parameters[0].GetEdges(Relationship.InstanceOf).Keys.ToArray();                

                if (paramType.Length != 1)
                {
                    //there is an error in the graph formulation
                    throw new InvalidDataException("Malformatted graph: " + method + " does not have a required parameter");
                }
                
                if(returnType.Length != 0)
                {
                    if (!paramType[0].Equals(returnType[0]))
                    {
                        //we are only interested in methods with a return type which matches that type.
                        continue;
                    }
                }

                

                //this method may in fact be a decorator
                bool allConnected = true;
                foreach (AbbreviatedGraph a in returnFromMethod)
                {
                    if (a.Represented.Node.Equals(Members.Literal) || a.Represented.Code.Equals("NaN"))
                    {
                        continue;
                    }

                    List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                    path.Add(a);
                    if (!MetricUtilities.DFS(a, parameters[0], method, path))
                    {
                        allConnected = false;
                        break;
                    }
                }

                if (!allConnected)
                {
                    //unfortunately at least one return statement had no connection to the parameter
                    //so this is NOT a decorator method.
                    continue;
                }

                //This is a decorator method
                m.SetProperty(NodeProperties.AccessPattern, (int)AccessPatterns.Decorator);
                decoratorMethods.Add(method);
            }
        }

        private static void JoinGetterSetter()
        {
            inappropriate = new Dictionary<AbbreviatedGraph,List<AbbreviatedGraph>>();
            foreach (GephiNode f in MetricUtilities.AllNodes)
            {
                if (!(f.Category.Equals(Members.Field) && MetricUtilities.IsImportantConnection(f)))
                {
                    continue;//we are only interested in looking at fields and not those in external classes
                }

                string fFile = (string)f.GetProperty(NodeProperties.File);

                List<GephiNode> nonAccessorMethods = new List<GephiNode>();
                bool foundOne = false;//this local field helps to track whether the field is part of a getter/setter
                foreach (GephiNode m in MetricUtilities.GetLinksInvolving(f))
                {
                    NodeType mtype = m.Category;
                    if (!mtype.Equals(Members.Method))
                    {
                        continue;//we only want methods
                    }

                    string mFile = (string)m.GetProperty(NodeProperties.File);

                    if (!fFile.Equals(mFile))
                    {
                        nonAccessorMethods.Add(m);//remember this is an external method
                        continue;//we are only interested in methods which are in the same file.
                    }

                    //this is a method connected to this field
                    AbbreviatedGraph method = MetricUtilities.GraphFromGephi(m);

                    if (method.Represented.Code.Equals("equals") || method.Represented.Code.Equals("hashcode"))
                    {
                        //equality or representation can sometimes be connected with accesors.
                        continue;
                    }

                    AbbreviatedGraph[] parameters = method.GetEdges(Relationship.FormalParameter).Keys.ToArray();
                    if (parameters.Length > 1)
                    {
                        continue;//we can ignore methods with more than one parameter. Those aren't getters or setters
                    }

                    if (MetricUtilities.IsThereADirectedLink(m, f))
                    {
                        //we are only interested in methods which link to the field (not the other way around)

                        int fieldCount = 0;
                        foreach (GephiNode o in MetricUtilities.GetDirectedLinksFrom(m))
                        {
                            if (o == f)
                            {
                                //we are not interested in counting the original field.
                                continue;
                            }

                            NodeType oType = o.Category;
                            string oFile = (string)o.GetProperty(NodeProperties.File);
                            if (oType.Equals(Members.Field) && oFile.Equals(fFile))
                            {
                                //NOTE: The restriction to same-file interactions prevents connections 
                                //which occur in other classes. For example field1 = method() can occur
                                //in another class and we want to ignore that.

                                //this is another in-class field which is accessed by the method.
                                //this can't be a getter.
                                fieldCount++;
                                break;
                            }
                        }

                        if (fieldCount > 0)
                        {
                            continue;//it can't be a getter/setter if it is accessing other fields.
                        }

                        //find relationship of the method to the field
                        AbbreviatedGraph field = MetricUtilities.GraphFromGephi(f);

                        Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> getFields = method.GetEdges(Relationship.ReturnValue);
                        Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> setFields = MetricUtilities.LimitContext(field.GetEdges(Relationship.WrittenBy), method);

                        //find direct path from field to return value
                        if (!getFields.ContainsKey(field))
                        {
                            foreach (AbbreviatedGraph key in getFields.Keys.ToArray())
                            {
                                //this needs to be fixed
                                //if (key.Represented.Node.Equals(Members.Field) || key.Represented.Node.IsMethodDefinition)//this avoids connecting to literals and other similar code elements
                                if (key.Represented.Node.IsDefinedMember)//this avoids connecting to literals and other similar code elements
                                {
                                    //include DFS connection between return value and actual field.
                                    List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                                    path.Add(key);
                                    if (MetricUtilities.DFS(key, field, method, path))
                                    {
                                        Console.WriteLine("Adding " + field);
                                        getFields.Add(field, new List<AbbreviatedGraph>());
                                    }
                                }
                            }
                        }

                        //link through any decorator methods
                        foreach (AbbreviatedGraph key in setFields.Keys.ToArray())
                        {
                            foreach (AbbreviatedGraph para in parameters)
                            {
                                //includ DFS connection between set value and parameter.
                                List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                                path.Add(key);
                                if (!setFields.ContainsKey(para) && MetricUtilities.DFS(key, para, method, path))
                                {
                                    setFields.Add(para, new List<AbbreviatedGraph>());
                                }
                            }
                        }

                        bool couldBeGetter = false;
                        bool couldBeSetter = false;
                        if (getFields.ContainsKey(field))//do the number of parameters matter?
                        {
                            couldBeGetter = true;
                        }

                        foreach (AbbreviatedGraph par in parameters)
                        {
                            if (setFields.ContainsKey(par))
                            {
                                couldBeSetter = true;
                                break;
                            }
                        }

                        if (couldBeGetter != couldBeSetter && (couldBeGetter || couldBeSetter))
                        {
                            foundOne = true;
                            //must be exclusively one or the other

                            MetricUtilities.LinkToControlledVariable(MetricUtilities.GraphFromGephi(m), MetricUtilities.GraphFromGephi(f));
                            MetricUtilities.DisconnectIncomingEdges(m, f);
                            m.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.Interface);
                            m.SetProperty(NodeProperties.AccessPattern, (int)AccessPatterns.GetterSetter);
                            m.SetProperty(NodeProperties.QState, false);

                            nonAccessorMethods.Remove(m);//this method is a valid accessor
                        }
                    }
                }

                if (foundOne)
                {
                    //each of the nonAccessorMethods should NOT be directly reading or writing this variable.
                    FindBadConnections(f);
                    f.SetProperty(NodeProperties.AccessPattern, (int)AccessPatterns.ControlledField);
                }
            }
        }

        private static void FindBadConnections(GephiNode accesorField)
        {
            //if this is a getter/setter group, then we want to look for 
            //and identify direct connections from non-class nodes;
            AbbreviatedGraph af = MetricUtilities.GraphFromGephi(accesorField);

            //what code tries to access this field?
            List<AbbreviatedGraph> badAccesses = new List<AbbreviatedGraph>();
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> calls = af.GetEdges(Relationship.CandidateRead);
            foreach (AbbreviatedGraph caller in calls.Keys)
            {
                foreach (AbbreviatedGraph location in calls[caller])
                {
                    if (!location.Represented.FileName.Equals(af.Represented.FileName))
                    {
                        //this is a non-file portion of the code which is reading the variable
                        AbbreviatedGraph reference = MetricUtilities.FindMethod(location);
                        if (reference == null)
                        {
                            reference = MetricUtilities.FindType(location);
                        }

                        if (!badAccesses.Contains(reference))
                        {
                            badAccesses.Add(reference);
                            if (MetricUtilities.GephiExists(reference))
                            {
                                //should do something about gephis that don't exist
                                GephiNode gn = MetricUtilities.GephiFromGraph(reference);

                                if (!gn.HasProperty(NodeProperties.InAppropriateAccess))
                                {
                                    gn.SetProperty(NodeProperties.InAppropriateAccess, 0);
                                }
                                int x = (int)gn.GetProperty(NodeProperties.InAppropriateAccess);
                                gn.SetProperty(NodeProperties.InAppropriateAccess, x + 1);
                            }
                        }
                    }
                }
            }

            //what code tries to write to this field
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = af.GetEdges(Relationship.WrittenBy);
            foreach (AbbreviatedGraph writer in writes.Keys)
            {
                foreach (AbbreviatedGraph location in writes[writer])
                {
                    if (!location.Represented.FileName.Equals(af.Represented.FileName))
                    {
                        //this is a non-file portion of the code which is writing to the variable
                        AbbreviatedGraph reference = MetricUtilities.FindMethod(location);
                        if (reference == null)
                        {
                            reference = MetricUtilities.FindType(location);
                        }

                        if (!badAccesses.Contains(reference))
                        {
                            badAccesses.Add(reference);
                        }
                    }
                }
            }

            if (badAccesses.Count > 0)
            {
                inappropriate.Add(af, badAccesses);
            }
        }

        private void CreateAccessorDiagram()
        {
            /* NodePatternMetrics.cs
            * 
            * Get the corresponding classes for the field
            * MBSE Create homeClassBox and add field's class name
            * MBSE Add field name to box
            * Create list: externalClassNames[]
            * From the field, find all read/write access: directFieldAccessors[]
            *    Get the corresponding classes from each dFA
            *    If classes match (field and dFA)
            *        MBSE Add class name to homeClassBox
            *        MBSE Create light blue circle: homeMethodCircle
            *        MBSE Add dFA name to homeMethodCircle
            *    Else if classes do not match
            *        MBSE Create new externalClassBox
            *        Add class name to externalClassNames[]
            *        MBSE Create dark blue circle: externalMethodCircle
            *        MBSE Add dFA names to externalMethodCircle
            *        MBSE Add red highlighted line between externalMethodCircle and homeMethodCircle boxes
            * From the controlling methods: controlledFieldAccessors[] (accessing getter/setter without messing with direct field)
            *    If class matches homeClassBox
            *        MBSE Create light green circle: homeMethodCircle
            *        MBSE Add cFA name to homeMethodCircle
            *    Else if class matches name in externalClassName[]
            *        MBSE Add cFA name to externalClassBox
            *        MBSE Create dark green circle: externalMethodCircle
            *        MBSE Add cFA name to externalMethodCircle
            *    Else
            *        MBSE Create new externalClassBox
            *        Add class name to externalClassNames[]
            *        MBSE Create dark green circle: externalMethodCircle
            *        MBSE Add cFA name to externalMethodCircle   
            * 
            * 
            * What if the same class appears twice?
            *   + Add to same box
            *   + Keep track in list
            * What other considerations am I missing? 
            *   + Highlight
            *   + Circle
            *   + externalClassNames[]
            *   - Colors for different types of classes 
            *       - ANONYMOUS - purple
            *       - CLASS - white
            *       - ENUM - orange
            *       - INTERFACE - grey
            *       - NAMESPACE (packages) - pink
            */
        }

        internal static int DecoratorReport(string filename)
        {
            int count = 1;
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();

            sb.Append("The following methods have been identified as decorators. This means \r\n");
            sb.Append("\tthey return the same value they received as an input, possibly \r\n");
            sb.Append("\treading, altering, or otherwise processing the value. Decorator \r\n");
            sb.Append("\tmethods are a valid design pattern and may further assist the novice\r\n");
            sb.Append("\tto understand a new code base.\r\n");
            foreach (AbbreviatedGraph method in decoratorMethods)
            {
                sb.Append("*************Decorator Report ( " + count + " )*************\r\n");
                sb.Append("\t" + method + " @ " + method.Represented.FileName + System.Environment.NewLine);
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }
            writer.WriteLine(sb);
            writer.Close();

            return decoratorMethods.Count;
        }

        internal static int AccessorReport(string filename)
        {
            int count = 1;
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();

            sb.Append(System.Environment.NewLine);
            AbbreviatedGraph[] vars = MetricUtilities.GetAllControlledVariables();
            List<AbbreviatedGraph> singles = new List<AbbreviatedGraph>();
            badReports = new List<AbbreviatedGraph>();
            bigReports = new List<AbbreviatedGraph>();
            foreach (AbbreviatedGraph variable in vars)
            {
                if (inappropriate.ContainsKey(variable))
                {
                    badReports.Add(variable);
                    GephiNode tmp = MetricUtilities.GephiFromGraph(variable);
                    tmp.SetProperty(NodeProperties.AccessPattern, AccessPatterns.OverlyControlledField);
                    continue;
                }

                AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(variable);
                if (methods.Length == 1)
                {
                    singles.Add(variable);
                    continue;
                }

                if (methods.Length > 2)
                {
                    bigReports.Add(variable);
                    continue;
                }
                
                sb.Append("*************Accessor Report ( " + count + " )*************\r\n");
                sb.Append("\tfor " + variable + " @ " + variable.Represented.FileName+System.Environment.NewLine);
                sb.Append("********************Accessors************************\r\n");
                foreach (AbbreviatedGraph method in methods)
                {
                    sb.Append("\t" + method + System.Environment.NewLine);
                }                
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }

            foreach (AbbreviatedGraph variable in singles)
            {
                AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(variable);
                sb.Append("*************Accessor Report ( " + count + " )*************\r\n");
                sb.Append("\tfor " + variable + " @ " + variable.Represented.FileName + System.Environment.NewLine);
                sb.Append("********************Accessors************************\r\n");
                foreach (AbbreviatedGraph method in methods)
                {
                    sb.Append("\t" + method + System.Environment.NewLine);
                }
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }

            writer.WriteLine(sb);
            writer.Close();

            return count;
        }

        private static List<AbbreviatedGraph> badReports;
        private static List<AbbreviatedGraph> bigReports;
        private static Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> inappropriate;

        internal static int BadAccessorReport(string filename)
        {
            int count = 1;
            StreamWriter writer = new StreamWriter(filename);
            StringBuilder sb = new StringBuilder();
            sb.Append("Accessors should be limited to a pair of getter/setter methods and\r\n");
            sb.Append("\ta single controlled variable. Sometimes that pattern is disrupted\r\n");
            sb.Append("\tby additional accessors which duplicate the functionality or by a\r\n");
            sb.Append("\tmethod which has inappropriate access to the controlled variable.\r\n");

            sb.Append(System.Environment.NewLine);
            List<AbbreviatedGraph> singles = new List<AbbreviatedGraph>();
            foreach (AbbreviatedGraph variable in badReports)
            {
                GephiNode gv = MetricUtilities.GephiFromGraph(variable);
                AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(variable);
                if (methods.Length == 1)
                {
                    singles.Add(variable);
                    continue;
                }

                sb.Append("*************Inappropriate Access Report ( " + count + " )*************\r\n");
                sb.Append("\tfor " + variable + " @ " + variable.Represented.FileName + System.Environment.NewLine);
                sb.Append("********************Accessors************************\r\n");
                foreach (AbbreviatedGraph method in methods)
                {
                    sb.Append("\t" + method + System.Environment.NewLine);
                }
                sb.Append("\t----Inappropriate Access----\r\n");
                foreach (AbbreviatedGraph ag in inappropriate[variable])
                {
                    sb.Append("\t" + ag + " in "+ag.Represented.FileName+System.Environment.NewLine);
                }
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }

            foreach (AbbreviatedGraph variable in singles)
            {
                GephiNode gv = MetricUtilities.GephiFromGraph(variable);
                AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(variable);

                sb.Append("*************Inappropriate Access Report ( " + count + " )*************\r\n");
                sb.Append("\tfor " + variable + " @ " + variable.Represented.FileName + System.Environment.NewLine);
                sb.Append("********************Accessors************************\r\n");
                foreach (AbbreviatedGraph method in methods)
                {
                    sb.Append("\t" + method + System.Environment.NewLine);
                }
                sb.Append("\t----Inappropriate Access----\r\n");
                foreach (AbbreviatedGraph ag in inappropriate[variable])
                {
                    sb.Append("\t" + ag + " in " + ag.Represented.FileName + System.Environment.NewLine);
                }
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }

            foreach (AbbreviatedGraph variable in bigReports)
            {
                AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(variable);
                sb.Append("*************Inappropriate Access Report ( " + count + " )*************\r\n");
                sb.Append("\tfor " + variable + " @ " + variable.Represented.FileName + System.Environment.NewLine);
                sb.Append("********************Accessors************************\r\n");
                foreach (AbbreviatedGraph method in methods)
                {
                    sb.Append("\t" + method + System.Environment.NewLine);
                }
                sb.Append("**************************************************\r\n");
                sb.Append("\r\n\r\n");
                count++;
            }

            writer.WriteLine(sb);
            writer.Close();

            return count-1;
        }
    }
}
