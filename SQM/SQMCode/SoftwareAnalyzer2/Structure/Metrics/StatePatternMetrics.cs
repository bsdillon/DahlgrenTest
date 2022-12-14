using SoftwareAnalyzer2.Structure.Gephi;
using SoftwareAnalyzer2.Structure.Graphing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure.Graphing.Specifics;

namespace SoftwareAnalyzer2.Structure.Metrics
{
    class StatePatternMetrics
    {
        private static List<AbbreviatedGraph> constants = new List<AbbreviatedGraph>();
        private static List<AbbreviatedGraph> settings = new List<AbbreviatedGraph>();

        private static Dictionary<AbbreviatedGraph, VariableWriteLocations> writeLocations = new Dictionary<AbbreviatedGraph, VariableWriteLocations>();
        private static List<AbbreviatedGraph> uncategorizedStates = new List<AbbreviatedGraph>();
        private static Dictionary<AbbreviatedGraph, StateMachine> categorizedStates = new Dictionary<AbbreviatedGraph, StateMachine>();

        internal static void FindPatterns()
        {
            AssessMethods();

            AssessNonMethods();
        }

        #region Initial Assessments
        internal static void AssessMethods()
        {
            foreach (AbbreviatedGraph n in MetricUtilities.StateMembers)
            {
                GephiNode gn = MetricUtilities.GephiFromGraph(n);

                if ((StatePatterns)gn.GetProperty(NodeProperties.StateMember) != StatePatterns.SomeState)
                {
                    //this one has already been looked at from another method/field. Don't reexamine.
                    continue;
                }

                if (!gn.Category.IsMethodDefinition)
                {
                    continue;
                }

                //let's see how this state member is managed.
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = n.GetEdges(Relationship.WrittenBy);
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = n.GetEdges(Relationship.CandidateRead);

                int wCount = 0;
                foreach (AbbreviatedGraph k in writes.Keys)
                {
                    if (MetricUtilities.GephiExists(k))
                    {
                        GephiNode kg = MetricUtilities.GephiFromGraph(k);
                        if ((AccessPatterns)kg.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.ControlledField)
                        {
                            continue;
                        }
                    }
                    wCount += writes[k].Count;
                }

                List<AbbreviatedGraph> acceptedReads = new List<AbbreviatedGraph>();
                int rCount = 0;
                foreach (AbbreviatedGraph k in reads.Keys)
                {
                    if (k.Represented.Code.Equals(NodeFactory.SelfReference))
                    {
                        continue;
                    }

                    if (k.Represented.Node.IsClassification)
                    {
                        continue;
                    }

                    if (MetricUtilities.GephiExists(k))
                    {
                        GephiNode kg = MetricUtilities.GephiFromGraph(k);
                        if ((AccessPatterns)kg.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.ControlledField)
                        {
                            bool match = false;
                            foreach (AbbreviatedGraph meth in MetricUtilities.GetVariableControlMethods(k))
                            {
                                if (meth == n)
                                {
                                    match = true;
                                    break;
                                }
                            }

                            if (match)
                            {
                                continue;
                            }
                        }
                    }

                    rCount += reads[k].Count;

                    AbbreviatedGraph ag = MetricUtilities.FindMethod(k);
                    if (ag == null)
                    {
                        ag = MetricUtilities.FindMethod(reads[k][0]);
                    }

                    if (ag == null)
                    {
                        ag = MetricUtilities.FindField(k);
                    }

                    if (!acceptedReads.Contains(ag))
                    {
                        acceptedReads.Add(ag);
                    }
                }

                AbbreviatedGraph cvg = MetricUtilities.GetControlledVariable(n);

                bool isInterface = n.GetEdges(Relationship.MemberOf).Keys.ToArray()[0].Represented.Node.Equals(Members.INTERFACE);
                if (wCount == 0 && rCount > 0 && isInterface)
                {
                    //in this case all/some of the reads are occuring on the interface
                    StateMachine tmp = new StateMachine();
                    tmp.AddSuperState(n);
                    RecursiveStateProperty(gn, n, StatePatterns.SuperStateMember, tmp);
                    MetricUtilities.AddStateMachine(tmp);
                    continue;
                }

                //if both counts are zero this is suspicious
                if (wCount == 0 && rCount == 0)
                {
                    if (isInterface)
                    {
                        //if this is a part of an interface, then we have a super-state member, 
                        //it has no uses itself, but it's children overrides are getting enough action to identify it.

                        StateMachine tmp = new StateMachine();
                        tmp.AddSuperState(n);
                        RecursiveStateProperty(gn, n, StatePatterns.SuperStateMember, tmp);
                        MetricUtilities.AddStateMachine(tmp);
                        continue;
                    }
                    else
                    {
                        gn.SetProperty(NodeProperties.StateMember, (int)StatePatterns.UncalledStateMethod);
                        continue;
                    }
                }

                if (wCount == 0)
                {
                    //this is a method with any number of calls. Totally normal. No big deal
                    foreach (AbbreviatedGraph g in acceptedReads)
                    {
                        OverWriteState(g, StatePatterns.StateLogic);
                        if (cvg == null)
                        {
                            MetricUtilities.CreateEdge(n, g, EdgePatterns.StateRead);
                        }
                        else
                        {
                            MetricUtilities.CreateEdge(cvg, g, EdgePatterns.StateRead);
                        }
                    }

                    continue;
                }
            }
        }

        internal static void AssessNonMethods()
        {
            #region First loop
            foreach (AbbreviatedGraph n in MetricUtilities.StateMembers)
            {
                GephiNode gn = MetricUtilities.GephiFromGraph(n);

                if ((StatePatterns)gn.GetProperty(NodeProperties.StateMember) != StatePatterns.SomeState)
                {
                    //this one has already been looked at from another method/field. Don't reexamine.
                    continue;
                }

                if ((AccessPatterns)gn.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.GetterSetter)
                {
                    //we are skipping the accessors
                    continue;
                }

                //let's see how this state member is managed.
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = n.GetEdges(Relationship.WrittenBy);
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = n.GetEdges(Relationship.CandidateRead);

                int wCount = 0;
                List<AbbreviatedGraph> writeLocations = new List<AbbreviatedGraph>();
                foreach (AbbreviatedGraph k in writes.Keys)
                {
                    if (MetricUtilities.GephiExists(k))
                    {
                        GephiNode kg = MetricUtilities.GephiFromGraph(k);
                        if ((AccessPatterns)kg.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.GetterSetter)
                        {
                            if ((StatePatterns)kg.GetProperty(NodeProperties.StateMember) == StatePatterns.UncalledStateMethod)
                            {
                                continue;
                            }
                        }
                    }

                    wCount += writes[k].Count;
                    writeLocations.AddRange(writes[k]);
                }

                int rCount = 0;
                foreach (AbbreviatedGraph k in reads.Keys)
                {
                    if (k.Represented.Code.Equals(NodeFactory.SelfReference))
                    {
                        continue;
                    }

                    if (k.Represented.Node.IsClassification)
                    {
                        continue;
                    }

                    if (MetricUtilities.GephiExists(k))
                    {
                        GephiNode kg = MetricUtilities.GephiFromGraph(k);
                        if ((AccessPatterns)kg.GetProperty(NodeProperties.AccessPattern) == AccessPatterns.GetterSetter)
                        {
                            if ((StatePatterns)kg.GetProperty(NodeProperties.StateMember) == StatePatterns.UncalledStateMethod)
                            {
                                continue;
                            }
                        }
                    }

                    rCount += reads[k].Count;
                }

                bool isInterface = n.GetEdges(Relationship.MemberOf).Keys.ToArray()[0].Represented.Node.Equals(Members.INTERFACE);
                if (wCount == 0 && rCount > 0 && isInterface)
                {
                    //in this case all/some of the reads are occuring on the interface
                    StateMachine tmp = new StateMachine();
                    tmp.AddSuperState(n);
                    RecursiveStateProperty(gn, n, StatePatterns.SuperStateMember, tmp);
                    MetricUtilities.AddStateMachine(tmp);
                    continue;
                }

                //if both counts are zero this is suspicious
                if (wCount == 0 && rCount == 0)
                {
                    if (isInterface)
                    {
                        //if this is a part of an interface, then we have a super-state member, 
                        //it has no uses itself, but it's children overrides are getting enough action to identify it.

                        StateMachine tmp = new StateMachine();
                        tmp.AddSuperState(n);
                        RecursiveStateProperty(gn, n, StatePatterns.SuperStateMember, tmp);
                        MetricUtilities.AddStateMachine(tmp);
                        continue;
                    }
                    else
                    {
                        gn.SetProperty(NodeProperties.StateMember, (int)StatePatterns.UncalledStateMethod);
                        continue;
                    }
                }

                if (wCount == 0 && n.Represented.Node.IsMethodDefinition)
                {
                    //this is a method with any number of calls. Totally normal. No big deal
                    continue;
                }

                if (rCount == 0 && n.Represented.Node.IsField)
                {
                    //this is a field with a write, but no read
                    gn.SetProperty(NodeProperties.StateMember, (int)StatePatterns.UnreadStateField);

                    StateMachine sm = new StateMachine();
                    sm.AddPrimaryField(n);
                    bool valid = false;

                    List<AbbreviatedGraph> locations = new List<AbbreviatedGraph>();

                    AbbreviatedGraph[] methods = MetricUtilities.GetVariableControlMethods(n);
                    if (methods != null)
                    {
                        foreach (AbbreviatedGraph mg in methods)
                        {
                            GephiNode m = MetricUtilities.GephiFromGraph(mg);
                            if ((StatePatterns)m.GetProperty(NodeProperties.StateMember) != StatePatterns.UncalledStateMethod)
                            {
                                valid = true;
                                //this is a field which has no reads, yet this setter is used at least once.
                                m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.CasualCancer);

                                sm.AddWriteChain(mg, n, 1);
                                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> mreads = mg.GetEdges(Relationship.CandidateRead);

                                //each of the locations where the method is called is doing something which is casual cancer
                                foreach (AbbreviatedGraph k in mreads.Keys)
                                {
                                    foreach (AbbreviatedGraph l in mreads[k])
                                    {
                                        AbbreviatedGraph ab = MetricUtilities.FindMethod(l);
                                        if (ab == null)
                                        {
                                            ab = l;
                                        }

                                        if (!locations.Contains(ab))
                                        {
                                            sm.AddWriteChain(ab, mg, 2);
                                            locations.Add(ab);
                                            OverWriteState(ab, StatePatterns.CasualCancer);
                                        }
                                    }
                                }
                            }
                        }
                    }

                    //captures new, non-setter write locations
                    foreach (AbbreviatedGraph l in writeLocations)
                    {
                        AbbreviatedGraph ab = MetricUtilities.FindMethod(l);
                        if (ab == null)
                        {
                            ab = l;
                        }

                        if (!locations.Contains(ab))
                        {
                            sm.AddWriteChain(ab, n, 1);
                            locations.Add(ab);
                            OverWriteState(ab, StatePatterns.CasualCancer);
                            valid = true;
                        }
                    }

                    if (valid)
                    {
                        //the proposed state machine is real; some setter is operational
                        MetricUtilities.AddStateMachine(sm);
                    }

                    continue;
                }

                InitialCategorization(n, writes, reads);
            }
            #endregion

            //at this point we have identified all the state variables and categorized some.
            foreach (AbbreviatedGraph n in categorizedStates.Keys)
            {
                FollowField(n, categorizedStates[n], categorizedStates[n].Type, 1);
            }

            FinalCategorization(uncategorizedStates.ToArray());
        }
        #endregion

        private static void InitialCategorization(AbbreviatedGraph n, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads)
        {
            //find out how many constructors are in this class vs the number of writes
            List<AbbreviatedGraph> unCoveredConstructors = new List<AbbreviatedGraph>();
            AbbreviatedGraph theClass = n.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];
            foreach (AbbreviatedGraph member in theClass.GetEdges(Relationship.Member).Keys)
            {
                if (member.Represented.Node.Equals(Members.Constructor))
                {
                    unCoveredConstructors.Add(member);
                }
            }

            VariableWriteLocations mine = new VariableWriteLocations();
            int constructors = unCoveredConstructors.Count;
            unCoveredConstructors = DiscoverVariableWriteLocations(n, unCoveredConstructors, mine);

            if (unCoveredConstructors.Count == 0)
            {
                if (constructors > 0)
                {
                    //all constructors have contributed a value to the state variable.
                    //the default value does not matter anymore.
                    mine.RemoveLoneDefault();
                }
            }

            writeLocations.Add(n, mine);

            if (mine.IsSetting)
            {
                //state is finalized at construction. This is a setting
                MakeStateMachine(n, mine, StatePatterns.SettingVariable);
            }
            else if (mine.IsConstant)
            {
                //this is a constant by virtue of the fact that it is only written with one literal
                MakeStateMachine(n, mine, StatePatterns.ConstantVariable);
            }
            else if (mine.IsState)
            {
                //at some point after construction a state change is made
                MakeStateMachine(n, mine, StatePatterns.StateVariable);
            }
            else
            {
                //This variable isn't obviously a setting, state, or constant.
                //for now we will store this informaiton and revisit it at a later date
                uncategorizedStates.Add(n);
            }
        }

        private static List<AbbreviatedGraph> DiscoverVariableWriteLocations(AbbreviatedGraph n, List<AbbreviatedGraph> constructors, VariableWriteLocations mine)
        {
            List<AbbreviatedGraph> coveredConstructors = new List<AbbreviatedGraph>();
            List<AbbreviatedGraph> unCoveredConstructors = new List<AbbreviatedGraph>();
            unCoveredConstructors.AddRange(constructors);

            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = n.GetEdges(Relationship.WrittenBy);
            //sort all the write locations by value and type of location
            foreach (AbbreviatedGraph k in writes.Keys)
            {
                foreach (AbbreviatedGraph l in writes[k])
                {
                    //find the location of the writing
                    AbbreviatedGraph loc = MetricUtilities.FindMethod(l);
                    //there may be class-level writes, but those will be immediately caught as the default

                    if (l.Represented.Node.IsClassification)
                    {
                        //the location is actually the field written to
                        //this is the default write at the beginning
                        mine.Default = k;
                    }
                    else if (l == n)
                    {
                        //the location is actually the field written to
                        //this is the default write at the beginning
                        mine.Default = k;
                    }
                    else if (loc.Represented.Node.Equals(Members.Constructor))
                    {
                        //this is a write from a constructor; if the constructor is called
                        //then we can assume it will have an effect on the value
                        if (unCoveredConstructors.Contains(loc) && loc.GetEdges(Relationship.CandidateRead).Count > 0)
                        {
                            unCoveredConstructors.Remove(loc);
                            coveredConstructors.Add(loc);
                        }

                        //the location is in a constructor
                        SourceMethod(k, loc, mine, Members.Constructor);
                    }
                    else if (loc.Represented.Node.IsMethodDefinition && loc.Represented.Code.Equals("static"))
                    {
                        //static constructors
                        mine.AddLocation(k, loc, Members.Static);
                        List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                        path.Add(loc);
                        mine.AddPath(k, path);
                    }
                    else if (loc.Represented.Node.IsMethodDefinition)
                    {
                        if (MetricUtilities.GetControlledVariable(loc) == n)
                        {
                            //this is the setter
                            //setters might be uncalled, or they could have valid inputs.
                            GephiNode mg = MetricUtilities.GephiFromGraph(loc);
                            if ((StatePatterns)mg.GetProperty(NodeProperties.StateMember) != StatePatterns.UncalledStateMethod)
                            {
                                SourceMethod(k, loc, mine, Members.SelfReference);
                            }
                            else
                            {
                                //this is the setter, but it never is called. We still want to recognize it
                                mine.AddUnusedLocation(loc);
                            }
                        }
                        else
                        {
                            SourceMethod(k, loc, mine, Members.Method);
                        }
                    }
                    else
                    {
                        throw new InvalidCastException("Non-method write location: " + l + " " + l.Represented.FileName);
                    }
                }
            }

            return unCoveredConstructors;
        }

        private static void SourceMethod(AbbreviatedGraph writeValue, AbbreviatedGraph method, VariableWriteLocations mine, Members type)
        {
            List<AbbreviatedGraph> values = new List<AbbreviatedGraph>();
            if (writeValue.Represented.Node.Equals(Members.Parameter))
            {
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> srcs = FindParameterSource(writeValue);

                if (srcs.Count == 0)
                {
                    mine.AddUnusedLocation(method);
                }

                //we will add these directly to the values
                foreach (AbbreviatedGraph s in srcs.Keys)
                {
                    foreach (AbbreviatedGraph l in srcs[s])
                    {
                        AbbreviatedGraph loc = MetricUtilities.FindMethod(l);
                        if (loc == null)
                        {
                            loc = l;
                        }

                        mine.AddLocation(s, loc, type);

                        List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                        path.Add(loc);
                        path.Add(method);
                        mine.AddPath(s, path);
                    }
                }
            }
            else if (writeValue.Represented.Node.Equals(Members.Literal) || writeValue.Represented.Node.Equals(Members.Value) ||
                !MetricUtilities.GephiExists(writeValue) || writeValue.Represented.Node.Equals(Members.Method) ||
                writeValue.Represented.Node.Equals(Members.Constructor) || writeValue.Represented.Node.Equals(Members.Field))
            {
                //Writing from any of these hard to trace or litteral values, makes the method directly responsible
                mine.AddLocation(writeValue, method, type);
                List<AbbreviatedGraph> path = new List<AbbreviatedGraph>();
                path.Add(method);
                mine.AddPath(writeValue, path);
            }
            else
            {
                //the data comes from some other source within the method
                //what kinds of sources are there here?
                throw new InvalidCastException("Unknown source of value within method " + method + " " + method.Represented.FileName);
            }
        }

        private static void MakeStateMachine(AbbreviatedGraph n, VariableWriteLocations mine, StatePatterns type)
        {
            //label the field and remember the sources
            OverwriteVariableState(n, type);

            //create the state machine
            StateMachine sm = new StateMachine();
            sm.AddPrimaryField(n);
            MetricUtilities.AddStateMachine(sm);

            //put write links into the machine
            mine.PopulateMachine(n, sm);

            categorizedStates.Add(n, sm);
        }

        private static void FinalCategorization(AbbreviatedGraph[] stateVariables)
        {
            List<AbbreviatedGraph> remainder = new List<AbbreviatedGraph>();

            foreach (AbbreviatedGraph sv in stateVariables)
            {
                if (!uncategorizedStates.Contains(sv))
                {
                    continue;//this state variable was part of another state machine
                }

                VariableWriteLocations mine = writeLocations[sv];
                List<AbbreviatedGraph> nonLiterals = mine.NonLiterals;

                //check each non-literal
                StatePatterns pattern = StatePatterns.None;
                foreach (AbbreviatedGraph n in nonLiterals.ToArray())
                {
                    VariableWriteLocations source = new VariableWriteLocations();
                    List<AbbreviatedGraph> unCoveredConstructors = new List<AbbreviatedGraph>();
                    AbbreviatedGraph theClass = n.GetEdges(Relationship.MemberOf).Keys.ToArray()[0];

                    if (theClass.Represented.Node.Equals(Members.INTERFACE))
                    {
                        continue;
                    }

                    foreach (AbbreviatedGraph member in theClass.GetEdges(Relationship.Member).Keys)
                    {
                        if (member.Represented.Node.Equals(Members.Constructor))
                        {
                            unCoveredConstructors.Add(member);
                        }
                    }

                    int constructors = unCoveredConstructors.Count;
                    unCoveredConstructors = DiscoverVariableWriteLocations(n, unCoveredConstructors, source);

                    if (unCoveredConstructors.Count == 0)
                    {
                        if (constructors > 0)
                        {
                            //all constructors have contributed a value to the state variable.
                            //the default value does not matter anymore.
                            source.RemoveLoneDefault();
                        }
                    }

                    //now we update our counts to see what we have added.
                    mine.Absorb(n, source);
                }

                if (mine.IsConstant)
                {
                    //this is a constant by virtue of the fact that it is only written with one literal
                    pattern = StatePatterns.ConstantVariable;
                }
                else if (mine.IsSetting)
                {
                    //state is finalized at construction. This is a setting
                    pattern = StatePatterns.SettingVariable;
                }
                else if (mine.IsState)
                {
                    //at some point after construction a state change is made
                    pattern = StatePatterns.StateVariable;
                }

                if (pattern == StatePatterns.None)
                {
                    //This variable isn't obviously a setting, state, or constant.
                    //for now we will store this informaiton and revisit it at a later date
                    remainder.Add(sv);
                }
                else
                {
                    MakeStateMachine(sv, mine, pattern);
                    FollowField(sv, categorizedStates[sv], pattern, 1);
                }
            }

            //will not categorize the remaining variables at this time.
            //they are all contained in the remainder
        }

        private static void FollowField(AbbreviatedGraph currentVariable, StateMachine sm, StatePatterns t, int level)
        {
            if (uncategorizedStates.Contains(currentVariable))
            {
                //if an uncatoroized state variable every shows up in another tree, we 
                //will dismiss it from other output. No need to double up.

                uncategorizedStates.Remove(currentVariable);
            }

            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = currentVariable.GetEdges(Relationship.CandidateRead);
            foreach (AbbreviatedGraph r in reads.Keys)
            {
                if (r.Represented.Node.IsClassification)
                {
                    //skip types
                }
                else if (r.Represented.Code.Equals(NodeFactory.SelfReference))
                {
                    //not sure.
                    //not concerned with self reference reads. That is just
                    //access through the type name.
                }
                else if (r.Represented.Node.IsControlStructure)
                {
                    AffectedMethod(r, currentVariable, sm, t, level);
                }
                else if (r.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    //no concern over array invokes.
                }
                else if (r.Represented.Node.Equals(Members.Parameter))
                {
                    //if the formal parameter is being set by a constant it may be the transition to 
                    //making another field into a constant. This is a recursive step
                    MarkEdgeWithState(currentVariable, r);
                    FindAffectedLogicThroughParameter(r, currentVariable, sm, t, level + 1);
                }
                else if (r.Represented.Node.IsMethodDefinition)
                {
                    if (r.IsSimulated)
                    {
                        //this is just linking a parameter to a simulated method instead of a formal parameters
                        //the logic of that method may be affected. We should just add it to the state machine
                        //but not otherwise be concerned over it.
                        if (sm.AddReadChain(r, currentVariable, level))
                        {
                            //non-repeat
                            MarkEdgeWithState(currentVariable, r);
                        }
                    }
                    else
                    {
                        //this is a method which returns the value
                        FindAffectedLogicThroughReturnValue(r, currentVariable, sm, t, level + 1);
                    }
                }
                else if (r.Represented.Node.Equals(Members.Field))
                {
                    //this is probably a variable accessing another as in int value = var.member;
                    //to exclude these we will check for access in the reverse direction
                    Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> access = r.GetEdges(Relationship.Accesses);
                    if (!access.ContainsKey(currentVariable))
                    {
                        //this field must be actually written to from the current variable
                        //it may be a local variable or a class variable.
                        if (MetricUtilities.GephiExists(r))
                        {
                            //this is a global variable. We will add it to our state machine and discontinue
                            //if it is also a state variable it will be affected by our connection in the state machine
                            sm.AddReadChain(r, currentVariable, level);
                        }
                        else
                        {
                            //this is a local variable, so we have to link to it and follow it further
                            FindAffectedLogicThroughLocalVariable(r, currentVariable, sm, t, level + 1);
                        }
                    }
                }
                else
                {
                    throw new InvalidCastException("Unknown read type:" + currentVariable + " " + r + " " + reads[r][0].Represented.FileName);
                }
            }
        }


        private enum Disruptions
        {
            None,
            Partial,
            Complete
        }

        private static void FindAffectedLogicThroughField(AbbreviatedGraph currentVariable, AbbreviatedGraph source, StateMachine sm, StatePatterns initial, int level)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = currentVariable.GetEdges(Relationship.WrittenBy);

            //under some conditions, a variable may not be traceable e.g. it is written 
            //by multiple sources and so it cannot be solely attributed to this cause.
            Disruptions disrupted = Disruptions.None;
            foreach (AbbreviatedGraph w in writes.Keys)
            {
                if (w.Equals(source))
                {
                    //this is the write we are tracking
                    //no op
                }
                else if (w.Represented.Node.Equals(Members.Parameter))
                {
                    //this is written by another method; for now assume that the method is the source of multiple values
                    disrupted = Disruptions.Complete;
                    break;
                }
                else if (w.Represented.Node.Equals(Members.Literal) || w.Represented.Node.Equals(Members.Value))
                {
                    //if we are currently tracking a constant we can compare them
                    if (initial == StatePatterns.ConstantVariable)
                    {
                        //the state machine is from a constant, so it MAY match this literal
                        if (writeLocations[sm.PrimaryField].HasValue(w))
                        {
                            //the sources are the same, so this is also a constant
                            //no disruption
                        }
                        else
                        {
                            //it's already disrupted
                            disrupted = Disruptions.Partial;
                        }
                    }
                    else
                    {
                        //this does not disrupt a non-constant
                    }
                }
                else if (w.Represented.Node.Equals(Members.Field))
                {
                    if (MetricUtilities.GephiExists(w))
                    {
                        //this is a class variable and may also be a state source
                    }
                    else
                    {
                        //this is a local variable and is a unknown source
                        disrupted = Disruptions.Partial;
                    }
                }
                else if (w.Represented.Node.Equals(Members.Method) || w.Represented.Node.Equals(Members.Constructor))
                {
                    //this is a method which returns a value to the parameter. Right now we cannot tell what the 
                    //return value would be we have to assume that this changes the way the parameter could be set.
                    disrupted = Disruptions.Complete;
                }
                else
                {
                    throw new InvalidCastException("Unknown parameter write type:" + currentVariable + " " + w + " " + writes[w][0].Represented.FileName);
                }
            }

            //add the connection to this method from the variable
            //this is established from the parameter at the previous level
            AbbreviatedGraph src = source;

            if (!MetricUtilities.GephiExists(source))
            {
                //this must be linked from something inside a method
                src = MetricUtilities.FindMethod(source);
            }

            AbbreviatedGraph currLink = currentVariable;
            if (MetricUtilities.GephiExists(currentVariable))
            {
                //if this is a class variable, let's set it's stateness
                OverwriteVariableState(currentVariable, initial);
            }
            else
            {
                currLink = MetricUtilities.FindMethod(currentVariable);
            }

            if (!sm.AddReadChain(currLink, src, level - 1))
            {
                //this is a repeated member
                return;
            }

            MetricUtilities.CreateEdge(src, currLink, EdgePatterns.StateWrite);

            if (disrupted == Disruptions.Complete)
            {
                //this parameter cannot continue the state type from the primary state variable
                sm.AddTerminalNode(StateMachine.Disrupted, currLink);
                return;
            }

            StatePatterns t = initial;
            if (disrupted == Disruptions.Partial)
            {
                //this causes a downgrade
                sm.AddTerminalNode(StateMachine.Disrupted, currLink);
                return;
            }

            FollowField(currentVariable, sm, t, level);
        }

        private static void FindAffectedLogicThroughParameter(AbbreviatedGraph currentParameter, AbbreviatedGraph source, StateMachine sm, StatePatterns initial, int level)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = currentParameter.GetEdges(Relationship.WrittenBy);

            //under some conditions, a parameter may not be traceable e.g. it is written 
            //by multiple sources and so it cannot be solely attributed to this cause.
            Disruptions disrupted = Disruptions.None;
            foreach (AbbreviatedGraph w in writes.Keys)
            {
                if (w.Equals(source))
                {
                    //this is the write we are tracking
                    //no op
                }
                else if (w.Represented.Node.Equals(Members.Parameter))
                {
                    //this is written by another method; for now assume that the method is the source of multiple values
                    disrupted = Disruptions.Complete;
                    break;
                }
                else if (w.Represented.Node.Equals(Members.Literal) || w.Represented.Node.Equals(Members.Value))
                {
                    //if we are currently tracking a constant we can compare them
                    if (initial == StatePatterns.ConstantVariable)
                    {
                        //the state machine is from a constant, so it MAY match this literal
                        if (writeLocations[sm.PrimaryField].HasValue(w))
                        {
                            //the sources are the same, so this is also a constant
                            //no disruption
                        }
                        else
                        {
                            //it's already disrupted
                            disrupted = Disruptions.Partial;
                        }
                    }
                    else
                    {
                        //this does not disrupt a non-constant
                    }
                }
                else if (w.Represented.Node.Equals(Members.Field))
                {
                    if (MetricUtilities.GephiExists(w))
                    {
                        //this is a class variable and may also be a state source

                    }
                    else
                    {
                        //this is a local variable and is a unknown source
                        disrupted = Disruptions.Partial;
                    }
                }
                else if (w.Represented.Node.Equals(Members.Method))
                {
                    //this is a method which returns a value to the parameter. Right now we cannot tell what the 
                    //return value would be we have to assume that this changes the way the parameter could be set.
                    disrupted = Disruptions.Complete;
                }
                else if (w.Represented.Node.Equals(Members.Constructor))
                {
                    //this is a method which returns a value to the parameter. Right now we cannot tell what the 
                    //return value would be we have to assume that this changes the way the parameter could be set.
                    disrupted = Disruptions.Complete;
                }
                else if (w.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    //writing to an array will completely disrupt the value as there are at least two possible values
                    //to read from the array.
                    disrupted = Disruptions.Complete;
                }
                else
                {
                    throw new InvalidCastException("Unknown parameter write type:" + currentParameter + " " + w + " " + writes[w][0].Represented.FileName);
                }
            }

            //add the connection to this method from the variable
            //this is established from the parameter at the previous level
            AbbreviatedGraph method = MetricUtilities.FindMethod(currentParameter);

            AbbreviatedGraph src = source;

            if (!MetricUtilities.GephiExists(source))
            {
                //this must be linked from something inside a method
                src = MetricUtilities.FindMethod(source);
            }

            if (!sm.AddReadChain(method, src, level - 1))
            {
                //this is a repeated member
                return;
            }

            MetricUtilities.CreateEdge(src, method, EdgePatterns.StateWrite);

            if (disrupted == Disruptions.Complete)
            {
                //this parameter cannot continue the state type from the primary state variable
                sm.AddTerminalNode(StateMachine.Disrupted, method);
                return;
            }

            StatePatterns t = initial;
            if (disrupted == Disruptions.Partial)
            {
                //this causes a downgrade
                sm.AddTerminalNode(StateMachine.Disrupted, method);
                return;
            }

            //now we determine the effect ov this parameter on the rest of the code
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = currentParameter.GetEdges(Relationship.CandidateRead);
            foreach (AbbreviatedGraph r in reads.Keys)
            {
                if (r == source)
                {
                    //this is a circular reference, probably only prevented in the code by temporal differences
                }
                else if (r.Represented.Node.Equals(Members.Field))
                {
                    FindAffectedLogicThroughField(r, currentParameter, sm, t, level + 1);
                }
                else if (r.Represented.Node.Equals(Members.Parameter))
                {
                    //parameters themselves are not members of the class, only a method
                    //therefore, they have no state pattern
                    FindAffectedLogicThroughParameter(r, method, sm, t, level + 1);
                }
                else if (r.Represented.Node.IsMethodDefinition)
                {
                    //this is the method where this parameter exists
                    if (method == r)
                    {
                        //is this a return value???
                        Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> set = method.GetEdges(Relationship.ReturnValue);
                        if (set.ContainsKey(currentParameter))
                        {
                            if (sm.AddReadChain(r, method, level))
                            {
                                //non-repeat
                                //this is how it worked in another method, but I haven't seen anything trip this location yet
                                OverwriteLogicState(r, t);
                                MarkEdgeWithState(method, r);
                                FindAffectedLogicThroughReturnValue(r, currentParameter, sm, t, level + 1);
                            }
                        }
                        //if it is not returning, then we will ignore the reference.
                    }
                    else if (r.IsSimulated)
                    {
                        //this is just linking a parameter to a simulated method instead of a formal parameters
                        //the logic of that method may be affected. We should just add it to the state machine
                        //but not otherwise be concerned over it.
                        if (sm.AddReadChain(r, method, level))
                        {
                            //non-repeat
                            MarkEdgeWithState(method, r);
                        }
                    }
                    else
                    {
                        //TODO Determine what if anything should be done with this case
                    }
                }
                else if (r.Represented.Node.IsControlStructure)
                {
                    AffectedMethod(r, method, sm, t, level);
                }
                else
                {
                    throw new InvalidCastException("Unknown parameter read type:" + currentParameter + " " + r + " " + reads[r][0].Represented.FileName);
                }
            }
        }

        private static void FindAffectedLogicThroughLocalVariable(AbbreviatedGraph local, AbbreviatedGraph variableSource, StateMachine sm, StatePatterns initial, int level)
        {
            //first question is what else is used to write to this local variable.
            //if there are any disruptions we can't follow state through here

            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = local.GetEdges(Relationship.WrittenBy);

            //under some conditions, a local variable may not be traceable e.g. it is written 
            //by multiple sources and so it cannot be solely attributed to this cause.
            Disruptions disrupted = Disruptions.None;
            foreach (AbbreviatedGraph w in writes.Keys)
            {
                if (w == variableSource)
                {
                    continue;//this is the write which brought us here. Not and issue.
                }

                if (w.Represented.Node.Equals(Members.Method) || w.Represented.Node.Equals(Members.Constructor))
                {
                    disrupted = Disruptions.Partial;
                    continue;
                }

                if (w.Represented.Node.Equals(Members.Literal) || w.Represented.Node.Equals(Members.Value))
                {
                    //if this is the default write on that variable, it makes no difference.
                    //????

                    //if we are currently tracking a constant we can compare them
                    if (initial == StatePatterns.ConstantVariable)
                    {
                        //the state machine is from a constant, so it MAY match this literal
                        if (writeLocations[sm.PrimaryField].HasValue(w))
                        {
                            //the sources are the same, so this is also a constant
                            //no disruption
                        }
                        else
                        {
                            //it's already disrupted
                            disrupted = Disruptions.Partial;
                        }
                    }
                    else
                    {
                        //this does not disrupt a non-constant
                    }
                    continue;
                }

                if (w.Represented.Node.Equals(Members.Parameter))
                {
                    disrupted = Disruptions.Partial;
                    continue;
                }

                if (w.Represented.Node.Equals(Members.Field))
                {
                    disrupted = Disruptions.Partial;
                    continue;
                }

                if (w.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    disrupted = Disruptions.Complete;
                    continue;
                }

                //TODO Implement silent logging of error state
                throw new InvalidOperationException("Unknown write found from local variable "+local+" in "+local.Represented.FileName);
            }

            //add the connection to this method from the variable
            //the relationship was established at the previous level
            AbbreviatedGraph method = MetricUtilities.FindMethod(local);
            AbbreviatedGraph src = variableSource;

            if (!MetricUtilities.GephiExists(variableSource))
            {
                //this must be linked from something inside a method
                src = MetricUtilities.FindMethod(variableSource);
            }

            if (!sm.AddReadChain(method, src, level - 1))
            {
                //this is a repeated member
                return;
            }

            MetricUtilities.CreateEdge(src, method, EdgePatterns.StateWrite);

            if (disrupted == Disruptions.Complete)
            {
                //this local cannot continue the state type from the primary state variable
                sm.AddTerminalNode(StateMachine.Disrupted, method);
                return;
            }

            StatePatterns t = initial;
            if (disrupted == Disruptions.Partial)
            {
                //this causes a downgrade
                sm.AddTerminalNode(StateMachine.Disrupted, method);
                return;
            }

            //now we determine the effect ov this parameter on the rest of the code
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = local.GetEdges(Relationship.CandidateRead);
            foreach (AbbreviatedGraph r in reads.Keys)
            {
                if (r.Represented.Node.IsMethodDefinition)
                {
                    //this is the method where this parameter exists
                    if (method == r)
                    {
                        //is this a return value???
                        Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> set = method.GetEdges(Relationship.ReturnValue);
                        if (set.ContainsKey(local))
                        {
                            if (sm.AddReadChain(r, method, level))
                            {
                                //non-repeat
                                //this is how it worked in another method, but I haven't seen anything trip this location yet
                                OverwriteLogicState(r, t);
                                MarkEdgeWithState(method, r);
                                FindAffectedLogicThroughReturnValue(r, local, sm, t, level + 1);
                            }
                        }
                        //if it is not returning, then we will ignore the reference.
                    }
                    else if (r.IsSimulated)
                    {
                        //this is just linking a parameter to a simulated method instead of a formal parameters
                        //the logic of that method may be affected. We should just add it to the state machine
                        //but not otherwise be concerned over it.
                        if (sm.AddReadChain(r, method, level))
                        {
                            //non-repeated 
                            MarkEdgeWithState(method, r);
                        }
                    }
                    else
                    {
                        //TODO determine what if anything should be done here
                    }
                }
                else if (r.Represented.Node.IsControlStructure)
                {
                    AffectedMethod(r, method, sm, t, level);
                }
                else if (r.Represented.Node.Equals(Members.Parameter))
                {
                    FindAffectedLogicThroughParameter(r, local, sm, t, level + 1);
                }
                else if (r.Represented.Node.Equals(Members.Field))
                {
                    FindAffectedLogicThroughField(r, local, sm, t, level + 1);
                }
                else if (r.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    //TODO Determine if this logic is require or what action should be taken.
                    //FindAffectedLogicThroughField(r, local, sm, t, level + 1);
                }
                else
                {
                    throw new InvalidOperationException("Unknown read type " + r.Represented.Node + " in local variable logic");
                }
            }
        }

        private static void FindAffectedLogicThroughReturnValue(AbbreviatedGraph method, AbbreviatedGraph currentVariable, StateMachine sm, StatePatterns initial, int level)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = method.GetEdges(Relationship.WrittenBy);

            //under some conditions, a method may not be traceable e.g. it returns 
            //multiple values and so it cannot be solely attributed to this cause.
            Disruptions disrupted = Disruptions.None;
            foreach (AbbreviatedGraph w in writes.Keys)
            {
                if (w == currentVariable)
                {
                    continue;//this is the write which brought us here. Not an issue.
                }

                if (w.Represented.Node.Equals(Members.Literal) || w.Represented.Node.Equals(Members.Value))
                {
                    //if this is the default write on that variable, it makes no difference.
                    //????

                    //if we are currently tracking a constant we can compare them
                    if (initial == StatePatterns.ConstantVariable)
                    {
                        //the state machine is from a constant, so it MAY match this literal
                        if (writeLocations[sm.PrimaryField].HasValue(w))
                        {
                            //the sources are the same, so this is also a constant
                            //no disruption
                        }
                        else
                        {
                            //it's already disrupted
                            disrupted = Disruptions.Partial;
                        }
                    }
                    else
                    {
                        //this does not disrupt a non-constant
                    }
                    continue;
                }

                if (w.Represented.Node.Equals(Members.Method))
                {
                    if (!w.IsSimulated)
                    {
                        //TODO implement silent logging of errors
                        throw new InvalidOperationException("Method returns to method, but not simulated " + method+ " "+w);
                    }
                    continue;
                }

                if (w.Represented.Node.Equals(Members.Field))
                {
                    continue;
                }

                //TODO implement silent loggin of errors
                throw new InvalidOperationException("Unknown write found from " + method + " to "+w+" in " + w.Represented.FileName);
            }

            //add the connection to this method from the variable
            //we use the previous level because this connection was established in the previous level.
            AbbreviatedGraph src = currentVariable;

            if (!MetricUtilities.GephiExists(currentVariable))
            {
                //this must be linked from something inside a method
                src = MetricUtilities.FindMethod(currentVariable);
            }

            if (!sm.AddReadChain(method, src, level - 1))
            {
                //this is a repeated member
                return;
            }

            //create connection
            OverwriteLogicState(method, initial);
            MetricUtilities.CreateEdge(src, method, EdgePatterns.StateWrite);

            if (disrupted == Disruptions.Complete)
            {
                //this local cannot continue the state type from the primary state variable
                sm.AddTerminalNode(StateMachine.Disrupted, src);
                return;
            }

            StatePatterns t = initial;
            if (disrupted == Disruptions.Partial)
            {
                //this causes a downgrade
                t = StatePatterns.StateVariable;
            }

            //now we determine the effect of this method on the rest of the code
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = method.GetEdges(Relationship.CandidateRead);
            foreach (AbbreviatedGraph r in reads.Keys)
            {
                if (r.Represented.Node.IsClassification)
                {
                    continue;
                }

                if (r.Represented.Node.IsControlStructure)
                {
                    AffectedMethod(r, method, sm, t, level);
                    continue;
                }

                if (r.Represented.Node.Equals(Members.Field))
                {
                    //this is probably a variable accessing another as in int value = var.member;
                    //to exclude these we will check for access in the reverse direction
                    Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> access = r.GetEdges(Relationship.Accesses);
                    if (!access.ContainsKey(method))
                    {
                        //this field must be actually written to from the current variable
                        //it may be a local variable or a class variable.
                        if (MetricUtilities.GephiExists(r))
                        {
                            //this is a global variable. We will add it to our state machine and discontinue
                            //if it is also a state variable it will be affected by our connection in the state machine
                            sm.AddReadChain(r, method, level);
                        }
                        else
                        {
                            //this is a local variable, so we have to link to it and follow it further
                            FindAffectedLogicThroughLocalVariable(r, method, sm, t, level + 1);
                        }
                    }

                    continue;
                }

                if (r.Represented.Node.Equals(Members.Method) || r.Represented.Node.Equals(Members.Constructor))
                {
                    if (!r.IsSimulated)
                    {
                        Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> access = r.GetEdges(Relationship.Accesses);
                        if (!access.ContainsKey(method))
                        {
                            //this method returns the value of the other method
                            FindAffectedLogicThroughReturnValue(r, method, sm, t, level + 1);
                        }
                    }
                    continue;
                }

                if (r.Represented.Node.Equals(Members.Parameter))
                {
                    //parameters themselves are not members of the class, only a method
                    //therefore, they have no state pattern
                    FindAffectedLogicThroughParameter(r, method, sm, t, level + 1);
                    continue;
                }

                if (r.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    //nothing to follow
                    continue;
                }

                //TODO implement silent loggin of errors.
                throw new InvalidOperationException("Unknown read from " + method + " to " + r + " in " + r.Represented.FileName);
            }
        }

        private static void TraceThroughMethod(AbbreviatedGraph curr, AbbreviatedGraph previousLayer, StateMachine sm, StatePatterns t, int level)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> reads = curr.GetEdges(Relationship.CandidateRead);

            foreach (AbbreviatedGraph r in reads.Keys)
            {
                if (r.IsSimulated)
                {
                    //no value added from simulated members
                    continue;
                }

                if (r.Represented.Node.IsClassification)
                {
                    continue;
                }

                if (r.Represented.Node.IsControlStructure)
                {
                    //this is a method sensetive to settings
                    AbbreviatedGraph current = MetricUtilities.FindMethod(r);
                    MarkEdgeWithState(curr, r);

                    //this is the method where a control structure depends on this constant
                    switch (t)
                    {
                        case StatePatterns.ConstantVariable:
                            OverWriteState(current, StatePatterns.ConstantLogic);
                            break;
                        case StatePatterns.SettingVariable:
                            OverWriteState(current, StatePatterns.SettingLogic);
                            break;
                        case StatePatterns.StateVariable:
                            OverWriteState(current, StatePatterns.StateLogic);
                            break;
                    }
                    continue;
                }

                if (r.Represented.Node.IsField)
                {
                    //Generally, this is a field accessing the method but I feel like 
                    //there must be at few fields written to from the method return value.
                    //instead of worrying about this, we will simply link to the method where the call occurs.
                    //are there, in fact, other modes? How do I distinguish them?

                    foreach (AbbreviatedGraph loc in reads[r])
                    {
                        AbbreviatedGraph ab = MetricUtilities.FindMethod(loc);
                        if (ab == null)
                        {
                            //this is a field which is written by the source
                            switch (t)
                            {
                                case StatePatterns.ConstantVariable:
                                    OverWriteState(loc, StatePatterns.ConstantVariable);
                                    break;
                                case StatePatterns.SettingVariable:
                                    OverWriteState(loc, StatePatterns.SettingVariable);
                                    break;
                                case StatePatterns.StateVariable:
                                    OverWriteState(loc, StatePatterns.StateVariable);
                                    break;
                            }
                        }
                        else
                        {
                            AbbreviatedGraph org = curr;
                            if ((AccessPatterns)MetricUtilities.GephiFromGraph(curr).GetProperty(NodeProperties.AccessPattern) == AccessPatterns.GetterSetter)
                            {
                                org = previousLayer;
                            }

                            MetricUtilities.CreateEdge(org, ab, EdgePatterns.StateWrite);
                            switch (t)
                            {
                                case StatePatterns.ConstantVariable:
                                    OverWriteState(ab, StatePatterns.ConstantLogic);
                                    break;
                                case StatePatterns.SettingVariable:
                                    OverWriteState(ab, StatePatterns.SettingLogic);
                                    break;
                                case StatePatterns.StateVariable:
                                    OverWriteState(ab, StatePatterns.StateLogic);
                                    break;
                            }
                        }
                    }
                    continue;
                }

                if (r.Represented.Node.IsMethodDefinition)
                {
                    if (r.GetEdges(Relationship.WrittenBy).Count == 1)
                    {
                        //this is returned from the method and is the only thing returned from the method
                        FindAffectedLogicThroughField(r, curr, sm, t, level + 1);
                    }
                    continue;
                }

                throw new InvalidCastException("Unknown constant read type:" + curr + " " + r + " " + reads[r][0].Represented.FileName);
            }
        }


        private static void OverWriteState(AbbreviatedGraph g, StatePatterns newPattern)
        {
            //constants overwrite everything
            //settings overwrite everything else
            //normal state overwrite none or somestate

            GephiNode m = MetricUtilities.GephiFromGraph(g);
            StatePatterns old = (StatePatterns)m.GetProperty(NodeProperties.StateMember);

            //no prior pattern, just overwrite
            if (old == StatePatterns.None || old == StatePatterns.SomeState || old == StatePatterns.StateVariable)
            {
                m.SetProperty(NodeProperties.StateMember, (int)newPattern);
                return;
            }

            //no change
            if (old == newPattern)
            {
                return;
            }

            switch (newPattern)
            {
                case StatePatterns.ConstantLogic:
                    //constant wins over everythign
                    m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.ConstantLogic);
                    break;
                case StatePatterns.SettingLogic:
                    if (old != StatePatterns.ConstantLogic)
                    {
                        m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.SettingLogic);
                    }
                    break;
                case StatePatterns.StateLogic:
                    break;
                case StatePatterns.ConstantVariable:
                    //constant wins over everything
                    m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.ConstantVariable);
                    break;
                case StatePatterns.SettingVariable:
                    //not sure if this is the way to handle it. Maybe only constants should 
                    //transfer but I see that this is a new field with a source in settings
                    if (old != StatePatterns.ConstantLogic)
                    {
                        m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.SettingVariable);
                    }
                    break;
                case StatePatterns.StateVariable:
                    break;
                case StatePatterns.ConstantSource:
                    m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.ConstantSource);
                    break;
                case StatePatterns.SettingSource:
                    if (old != StatePatterns.ConstantSource)
                    {
                        m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.SettingSource);
                    }
                    break;
                case StatePatterns.StateSource:
                    break;
            }
        }

        #region Probalby Useless
        //private static bool Match(AbbreviatedGraph other, AbbreviatedGraph value)
        //{
        //    GephiNode fn = MetricUtilities.GephiFromGraph(other);
        //    StatePatterns p = (StatePatterns)fn.GetProperty(NodeProperties.StateMember);
        //    switch (t)
        //    {
        //        case StateTypes.Constant:
        //            //the new type is a constant, so the other field had better also be a constant
        //            if (p == StatePatterns.ConstantVariable)
        //            {
        //                //BSD took this out because it was never used except for constants. 
        //                //Do I really need this?

        //                int adslfkjsadf = 0;

        //                //thus far they are a match, what about the values? Do they match?
        //                //if (value == constantValues[other])
        //                //{
        //                //    //they are a match
        //                //    return true;
        //                //}
        //            }
        //            break;
        //        case StateTypes.Setting:
        //            if (p == StatePatterns.SettingVariable)
        //            {
        //                return true;
        //            }
        //            break;
        //        case StateTypes.None:
        //            int adflkjads = 0;
        //            break;
        //    }
        //    return false;
        //}

        //private static void FindSources(AbbreviatedGraph n, StatePatterns type, StateMachine sm)
        //{
        //    List<AbbreviatedGraph> sources = new List<AbbreviatedGraph>();

        //    Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = n.GetEdges(Relationship.WrittenBy);
        //    GephiNode me = MetricUtilities.GephiFromGraph(n);

        //    //find any setting source
        //    foreach (AbbreviatedGraph w in writes.Keys)
        //    {
        //        if (w.IsSimulated)
        //        {
        //            //don't care about simulated stuff either.
        //            continue;
        //        }

        //        if (w.Represented.Node.Equals(Members.Parameter))
        //        {
        //            AbbreviatedGraph m = MetricUtilities.FindMethod(w);
        //            GephiNode mg = MetricUtilities.GephiFromGraph(m);
        //            AbbreviatedGraph v = MetricUtilities.GetControlledVariable(m);
        //            if (v == null)
        //            {
        //                //this is not a setter but it does write to this field.
        //                //this method needs to be associated with the source
        //                sources.Add(m);
        //            }
        //            else if((StatePatterns)mg.GetProperty(NodeProperties.StateMember) == StatePatterns.UncalledStateMethod)
        //            {
        //                //this is the setter, but it does not actually get called, so this is not a source
        //                continue;
        //            }

        //            //setter or other method which writes to this field through a parameter
        //            //BSD Handle this special case
        //            ///sources.AddRange(FindParameterSource(w));
        //            continue;
        //        }

        //        if (w.Represented.Node.Equals(Members.Literal))
        //        {
        //            //literals are written to the  from various methods and the source of that value is unknown
        //            sources.AddRange(FindLiteralLocations(n, writes[w]));
        //            continue;
        //        }

        //        if (!MetricUtilities.GephiExists(w))
        //        {
        //            //must be local member; we need to link to the the method
        //            sources.Add(MetricUtilities.FindMethod(w));
        //            continue;
        //        }

        //        sources.Add(w);
        //    }

        //    //now that we have found all the sources, let's go through them and look for unique write locations.
        //    List<AbbreviatedGraph> locations = new List<AbbreviatedGraph>();
        //    foreach (AbbreviatedGraph l in sources)
        //    {
        //        if (!locations.Contains(l))
        //        {
        //            CreateEdge(l, n, EdgePatterns.StateWrite);
        //            locations.Add(l);
        //            sm.AddWriteChain(l, n, 1);
        //        }
        //    }
        //}
        #endregion

        #region Utilities
        #region Overwrite state values
        private static void OverwriteVariableState(AbbreviatedGraph g, StatePatterns newPattern)
        {
            if (!MetricUtilities.GephiExists(g))
            {
                return;
            }

            GephiNode m = MetricUtilities.GephiFromGraph(g);
            StatePatterns old = (StatePatterns)m.GetProperty(NodeProperties.StateMember);

            //no prior pattern, just overwrite
            if (old == StatePatterns.None || old == StatePatterns.SomeState || old == StatePatterns.StateVariable)
            {
                m.SetProperty(NodeProperties.StateMember, (int)newPattern);
                return;
            }

            //no change
            if (old == newPattern)
            {
                return;
            }

            //constants overwrite everything
            //settings overwrite everything else
            //normal state overwrite none or somestate
            switch (newPattern)
            {
                case StatePatterns.ConstantVariable:
                    //constant wins over everything
                    m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.ConstantVariable);
                    break;
                case StatePatterns.SettingVariable:
                    //not sure if this is the way to handle it. Maybe only constants should 
                    //transfer but I see that this is a new field with a source in settings
                    if (old != StatePatterns.ConstantLogic)
                    {
                        m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.SettingVariable);
                    }
                    break;
                case StatePatterns.StateVariable:
                    break;
            }
        }

        private static void OverwriteLogicState(AbbreviatedGraph g, StatePatterns newPattern)
        {
            GephiNode m = MetricUtilities.GephiFromGraph(g);
            StatePatterns old = (StatePatterns)m.GetProperty(NodeProperties.StateMember);

            //no prior pattern, just overwrite
            if (old == StatePatterns.None || old == StatePatterns.SomeState || old == StatePatterns.StateVariable)
            {
                m.SetProperty(NodeProperties.StateMember, (int)newPattern);
                return;
            }

            //no change
            if (old == newPattern)
            {
                return;
            }

            //constants overwrite everything
            //settings overwrite everything else
            //normal state overwrite none or somestate
            switch (newPattern)
            {
                case StatePatterns.ConstantVariable:
                    //constant wins over everythign
                    m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.ConstantLogic);
                    break;
                case StatePatterns.SettingVariable:
                    if (old != StatePatterns.ConstantLogic)
                    {
                        m.SetProperty(NodeProperties.StateMember, (int)StatePatterns.SettingLogic);
                    }
                    break;
                case StatePatterns.StateVariable:
                    break;
            }
        }
        #endregion

        private static void AffectedMethod(AbbreviatedGraph r, AbbreviatedGraph variable, StateMachine sm, StatePatterns t, int level)
        {
            //this is a method sensetive to settings
            AbbreviatedGraph method = MetricUtilities.FindMethod(r);
            if (sm.AddTerminalNode(method, variable))
            {
                //non-repeat
                MarkEdgeWithState(variable, r);
                OverwriteLogicState(method, t);
            }
        }

        private static Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> FindParameterSource(AbbreviatedGraph par)
        {
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> writes = par.GetEdges(Relationship.WrittenBy);
            Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> answer = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            foreach (AbbreviatedGraph r in writes.Keys)
            {
                if (r.Represented.Node.Equals(Members.Field))
                {
                    if (MetricUtilities.GephiExists(r))
                    {
                        //this is a class-level field which is itself the source of the data point
                        if (!answer.ContainsKey(r))
                        {
                            answer.Add(r, new List<AbbreviatedGraph>());
                        }

                        foreach (AbbreviatedGraph l in writes[r])
                        {
                            AbbreviatedGraph loc = MetricUtilities.FindMethod(l);
                            if (loc == null)
                            {
                                loc = l;
                            }

                            if (!answer[r].Contains(loc))
                            {
                                answer[r].Add(loc);
                            }
                        }
                    }
                    else
                    {
                        //this is a local field
                        //attribute the setting to the method which contains it.
                        AbbreviatedGraph m = MetricUtilities.FindMethod(writes[r][0]);
                        if (!answer.ContainsKey(m))
                        {
                            answer.Add(m, new List<AbbreviatedGraph>());
                        }

                        if (!answer[m].Contains(m))
                        {
                            answer[m].Add(m);
                        }
                    }
                }
                else if (r.Represented.Node.Equals(Members.Literal) || r.Represented.Node.Equals(Members.Value))
                {
                    //this parameter is set by a literal or an enumerated value. Either way that is not 
                    //really data. We want to link to the method where those literals were set
                    if (!answer.ContainsKey(r))
                    {
                        answer.Add(r, new List<AbbreviatedGraph>());
                    }

                    foreach (AbbreviatedGraph l in writes[r])
                    {
                        AbbreviatedGraph loc = MetricUtilities.FindMethod(l);
                        if (loc == null)
                        {
                            //this is a value set on a field
                            loc = MetricUtilities.FindType(l);
                        }

                        if (!answer[r].Contains(loc))
                        {
                            answer[r].Add(loc);
                        }
                    }
                }
                else if (r.Represented.Node.Equals(Members.Parameter))
                {
                    AbbreviatedGraph method = MetricUtilities.FindMethod(r);

                    Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> temp = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
                    if (r != par)
                    {
                        //this is a parameter in another method which is used to write to this parameter.
                        temp = FindParameterSource(r);
                    }

                    if (temp.Count == 0)
                    {
                        //this method is NOT ever used and still tries to set the value
                        //I'm just not sure how to handle this under the new paradigm

                        //for now, it would appear that this makes no contribution to the state variable because it is never called.
                        OverWriteState(MetricUtilities.FindMethod(r), StatePatterns.UncalledStateMethod);
                    }
                    else
                    {
                        foreach (AbbreviatedGraph k in temp.Keys)
                        {
                            if (!answer.ContainsKey(k))
                            {
                                answer.Add(k, new List<AbbreviatedGraph>());
                            }

                            foreach (AbbreviatedGraph loc in temp[k])
                            {
                                if (!answer[k].Contains(loc))
                                {
                                    answer[k].Add(loc);
                                }
                            }
                        }
                    }
                }
                else if (r.Represented.Node.IsMethodDefinition)
                {
                    if (!r.IsSimulated)
                    {
                        //this is a method which returns the value
                        if (!answer.ContainsKey(r))
                        {
                            answer.Add(r, new List<AbbreviatedGraph>());
                        }

                        foreach (AbbreviatedGraph l in writes[r])
                        {
                            AbbreviatedGraph loc = MetricUtilities.FindMethod(l);
                            if (loc == null)
                            {
                                throw new InvalidOperationException("Method write to state variable, but not from method:" + l + " " + l.Represented.FileName);
                            }

                            if (!answer[r].Contains(loc))
                            {
                                answer[r].Add(loc);
                            }
                        }
                    }
                } //I have not seen anything else go past this point, so I can't validate them yet.
                else if (r.Represented.Node.IsClassification)
                {
                    //skip types
                    //no op
                }
                else if (r.Represented.Code.Equals(NodeFactory.SelfReference))
                {
                    //not concerned with self reference reads. That is just
                    //access through the type name.
                    //no op
                }
                else if (r.Represented.Node.IsControlStructure)
                {
                    //this is a method which writes the parameter
                    //no op
                }
                else if (r.Represented.Node.Equals(Members.ArrayInvoke))
                {
                    //TODO determine how this should be handled
                }
                else
                {
                    throw new InvalidCastException("Unknown constant read type:" + par + " " + r + " " + writes[r][0].Represented.FileName);
                }
            }

            return answer;
        }

        private static void RecursiveStateProperty(GephiNode gn, AbbreviatedGraph n, StatePatterns p, StateMachine sm)
        {
            gn.SetProperty(NodeProperties.StateMember, (int)p);

            AbbreviatedGraph[] child = n.GetEdges(Relationship.NewImplementation).Keys.ToArray();

            foreach (AbbreviatedGraph c in child)
            {
                sm.AddSuperState(c);
                RecursiveStateProperty(MetricUtilities.GephiFromGraph(c), c, p, sm);
            }
        }

        private static AbbreviatedGraph[] FindLiteralLocations(AbbreviatedGraph origin, List<AbbreviatedGraph> locations)
        {
            List<AbbreviatedGraph> answer = new List<AbbreviatedGraph>();
            foreach (AbbreviatedGraph src in locations)
            {
                if (src == origin)
                {
                    //this is the default write which is onto the variable
                    continue;
                }

                AbbreviatedGraph ab = MetricUtilities.FindMethod(src);
                if (ab == null)
                {
                    ab = src;
                }
                answer.Add(ab);
            }
            return answer.ToArray();
        }

        //private static void SecondLook()
        //{
        //    //Checking on the non-literal members is more time consuming.
        //    //the goal is to examine each field, method, etc to see if another 
        //    //literal emerges. As soon as this happens, the variable is a state

        //    AbbreviatedGraph firstLiteral = null;
        //    if (literals.Count == 1)
        //    {
        //        firstLiteral = literals[0];
        //    }

        //    int stateCount = 0;
        //    int settingCount = 0;
        //    foreach (AbbreviatedGraph nl in nonLiterals)
        //    {
        //        if (nl.Represented.Node.Equals(Members.Field))
        //        {
        //            if (SourceField(nl, firstLiteral))
        //            {
        //                //this field has at least one other value than the first literal.
        //                if (mine.InStateLocation(nl))
        //                {
        //                    stateCount++;
        //                    break;//as we have found one indication of state count, this must be a state
        //                }
        //                else
        //                {
        //                    settingCount++;
        //                }
        //            }
        //        }
        //        else if (nl.Represented.Node.Equals(Members.Method))
        //        {
        //            SourceReturnValue(nl, firstLiteral);
        //        }
        //        else
        //        {
        //            //what else is there?
        //            int adlfskjasdf = 0;
        //        }
        //    }

        //    if (stateCount > 0)
        //    {
        //        //at some point after construction a state change is made
        //        MakeStateMachine(StatePatterns.StateVariable);
        //    }
        //    else if (settingCount > 0)
        //    {
        //        //state is finalized at construction. This is a setting
        //        MakeStateMachine(StatePatterns.SettingVariable);
        //    }
        //    else
        //    {
        //        counter++;
        //        Console.WriteLine("(" + counter + "):" + n);
        //        mine.Output();
        //        Console.WriteLine();
        //        Console.WriteLine();
        //    }
        //}

        private static void MarkEdgeWithState(AbbreviatedGraph previousLayer, AbbreviatedGraph nextLayer)
        {
            //we will try to find the method and type in each case.
            AbbreviatedGraph m1 = MetricUtilities.FindMethod(previousLayer);
            if (m1 == null)
            {
                m1 = previousLayer;
            }
            AbbreviatedGraph m2 = MetricUtilities.FindMethod(nextLayer);
            if (m2 == null)
            {
                m2 = nextLayer;
            }

            if (m1 == m2)//same method, this is an internal write to some local variable
            {
                return;
            }

            AbbreviatedGraph t1 = MetricUtilities.FindType(m1);
            AbbreviatedGraph t2 = MetricUtilities.FindType(m2);

            GephiNode g1 = MetricUtilities.GephiFromGraph(m1);
            GephiNode g2 = MetricUtilities.GephiFromGraph(m2);

            //looking for the reads from one to the other
            GephiEdge[] edges = MetricUtilities.GetEdges(g2, g1);

            List<GephiEdge> reads = new List<GephiEdge>();
            List<GephiEdge> writes = new List<GephiEdge>();
            foreach (GephiEdge e in edges)
            {
                if (e.GetEdgeType() == Relationship.CandidateRead)
                {
                    reads.Add(e);
                }
                else if (e.GetEdgeType() == Relationship.WrittenBy)
                {
                    writes.Add(e);
                }
            }

            //TODO
            //what follows is meant to catch reads and writes which occur just once, HOWEVER,
            //there is no thought for higher counts. This condition may or may not exist, but
            //it needs to be considered.

            if (reads.Count == 1)
            {
                reads[0].SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.StateRead);
            }

            if (writes.Count == 1)
            {
                writes[0].SetProperty(NodeProperties.EdgeFlag, (int)EdgePatterns.StateWrite);
            }
        }

        #endregion

        #region WriteLocations Class
        private class VariableWriteLocations
        {
            internal VariableWriteLocations()
            {
                sets.Add(Members.Method, methodLocations);
                sets.Add(Members.Constructor, constructorLocations);
                sets.Add(Members.Static, staticLocations);
                sets.Add(Members.SelfReference, setterLocations);
            }

            private void AddValue(AbbreviatedGraph k)
            {
                if (!values.Contains(k))
                {
                    values.Add(k);
                }
            }

            #region Location Collections
            private AbbreviatedGraph defaultValue = null;
            private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> methodLocations = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> constructorLocations = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> staticLocations = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            private Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> setterLocations = new Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>();
            private List<AbbreviatedGraph> values = new List<AbbreviatedGraph>();
            private Dictionary<Members, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>> sets = new Dictionary<Members, Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>>>();

            internal AbbreviatedGraph Default
            {
                get
                {
                    return defaultValue;
                }
                set
                {
                    defaultValue = value;
                    AddValue(value);
                }
            }

            public bool HasDefaultValue
            {
                get
                {
                    return defaultValue != null;
                }
            }

            internal void RemoveLoneDefault()
            {
                if (defaultValue == null)
                {
                    //no default. No op
                }
                else if (constructorLocations.ContainsKey(defaultValue))
                {
                    //this same value is already in the constructors
                    //no op
                }
                else
                {
                    //we will remove the default value as it is misleading.
                    //first look for it in another collection
                    if (methodLocations.ContainsKey(defaultValue))
                    {
                        return;
                    }
                    else if (staticLocations.ContainsKey(defaultValue))
                    {
                        return;
                    }
                    else if (setterLocations.ContainsKey(defaultValue))
                    {
                        return;
                    }
                    else
                    {
                        values.Remove(defaultValue);
                        defaultValue = null;//kill the default value
                    }
                }
            }

            internal int TotalCount
            {
                get
                {
                    return constructorLocations.Count + staticLocations.Count + setterLocations.Count + methodLocations.Count;
                }
            }

            internal bool HasValue(AbbreviatedGraph w)
            {
                return values.Contains(w);
            }

            internal bool InStateLocation(AbbreviatedGraph nl)
            {
                return methodLocations.ContainsKey(nl) || setterLocations.ContainsKey(nl);
            }

            internal Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> GetLocations(Members m)
            {
                return sets[m];
            }

            private List<AbbreviatedGraph> unusedLocations = new List<AbbreviatedGraph>();
            internal void AddUnusedLocation(AbbreviatedGraph loc)
            {
                if (!unusedLocations.Contains(loc))
                {
                    unusedLocations.Add(loc);
                }
            }

            internal void AddLocation(AbbreviatedGraph value, AbbreviatedGraph source, Members type)
            {
                Dictionary<AbbreviatedGraph, List<AbbreviatedGraph>> locations = sets[type];
                AddValue(value);

                if (!locations.ContainsKey(value))
                {
                    locations.Add(value, new List<AbbreviatedGraph>());
                }

                if (!locations[value].Contains(source))
                {
                    locations[value].Add(source);
                }
            }
            #endregion

            #region Counts
            private List<AbbreviatedGraph> literals = new List<AbbreviatedGraph>();
            private List<AbbreviatedGraph> nonLiterals = new List<AbbreviatedGraph>();
            private List<AbbreviatedGraph> simulated = new List<AbbreviatedGraph>();
            private int regularTypes = 0;
            private int stateCount = 0;
            private bool wasCounted = false;
            private void CountAll()
            {
                foreach (AbbreviatedGraph v in values)
                {
                    bool add = false;
                    if (v.Represented.Node.Equals(Members.Literal) || v.Represented.Node.Equals(Members.Value))
                    {
                        if (methodLocations.ContainsKey(v))
                        {
                            stateCount += methodLocations[v].Count;
                            add = true;
                        }

                        if (setterLocations.ContainsKey(v))
                        {
                            stateCount += setterLocations[v].Count;
                            add = true;
                        }

                        if (add || staticLocations.ContainsKey(v) || constructorLocations.ContainsKey(v) || (defaultValue != null && defaultValue.Equals(v)))
                        {
                            literals.Add(v);
                        }
                    }
                    else
                    {
                        if (methodLocations.ContainsKey(v))
                        {
                            stateCount += methodLocations[v].Count;
                            add = true;
                        }

                        if (setterLocations.ContainsKey(v))
                        {
                            stateCount += setterLocations[v].Count;
                            add = true;
                        }

                        nonLiterals.Add(v);
                        if (v.IsSimulated)
                        {
                            simulated.Add(v);
                        }

                        if (v.Represented.Node.Equals(Members.Constructor))
                        {
                            regularTypes++;
                        }
                    }
                }

                wasCounted = true;
            }

            internal List<AbbreviatedGraph> Literals
            {
                get
                {
                    if (!wasCounted)
                    {
                        CountAll();
                    }
                    return literals;
                }
            }

            internal List<AbbreviatedGraph> NonLiterals
            {
                get
                {
                    if (!wasCounted)
                    {
                        CountAll();
                    }
                    return nonLiterals;
                }
            }

            public int RegularTypes
            {
                get
                {
                    if (!wasCounted)
                    {
                        CountAll();
                    }
                    return regularTypes;
                }
            }

            public int StateCount
            {
                get
                {
                    if (!wasCounted)
                    {
                        CountAll();
                    }
                    return stateCount;
                }
            }

            public List<AbbreviatedGraph> SimulatedMembers
            {
                get
                {
                    if (!wasCounted)
                    {
                        CountAll();
                    }
                    return simulated;
                }
            }
            #endregion

            internal void Output()
            {
                foreach (AbbreviatedGraph v in values)
                {
                    Console.WriteLine("\t" + v);
                    if (defaultValue == v)
                    {
                        Console.WriteLine("\t\tDefault");
                    }

                    if (constructorLocations.ContainsKey(v))
                    {
                        foreach (AbbreviatedGraph c in constructorLocations[v])
                        {
                            Console.WriteLine("\t\tC:" + c);
                        }
                    }

                    if (staticLocations.ContainsKey(v))
                    {
                        foreach (AbbreviatedGraph c in staticLocations[v])
                        {
                            Console.WriteLine("\t\tS:" + c);
                        }
                    }

                    if (setterLocations.ContainsKey(v))
                    {
                        foreach (AbbreviatedGraph c in setterLocations[v])
                        {
                            Console.WriteLine("\t\t((S)):" + c);
                        }
                    }

                    if (methodLocations.ContainsKey(v))
                    {
                        foreach (AbbreviatedGraph c in methodLocations[v])
                        {
                            Console.WriteLine("\t\tm:" + c);
                        }
                    }
                }

                int a = 0;
                foreach (AbbreviatedGraph l in links.Keys)
                {
                    VariableWriteLocations loc = links[l];
                    Console.WriteLine("Link[" + a + "]: ");
                    loc.Output();
                    a++;
                }
            }

            internal void PopulateMachine(AbbreviatedGraph n, StateMachine sm)
            {
                foreach (Members m in sets.Keys)
                {
                    foreach (AbbreviatedGraph v in sets[m].Keys)
                    {
                        foreach (AbbreviatedGraph l in sets[m][v])
                        {
                            MetricUtilities.CreateEdge(l, n, EdgePatterns.StateWrite);
                        }
                    }
                }

                foreach (List<AbbreviatedGraph> path in paths.Keys)
                {
                    AbbreviatedGraph last = n;
                    for (int i = path.Count - 1; i >= 0; i--)
                    {
                        sm.AddWriteChain(path[i], last, path.Count - i);
                        last = path[i];

                        if (i == path.Count - 1)
                        {
                            sm.AddWriteValue(path[i], paths[path]);
                        }
                    }
                }

                if (defaultValue != null)
                {
                    sm.AddDefaultWrite(defaultValue);
                }

                foreach (AbbreviatedGraph v in unusedLocations)
                {
                    sm.AddUnusedWrite(v);
                }
            }

            Dictionary<List<AbbreviatedGraph>, AbbreviatedGraph> paths = new Dictionary<List<AbbreviatedGraph>, AbbreviatedGraph>();
            internal void AddPath(AbbreviatedGraph value, List<AbbreviatedGraph> path)
            {
                paths.Add(path, value);
            }

            Dictionary<AbbreviatedGraph, VariableWriteLocations> links = new Dictionary<AbbreviatedGraph, VariableWriteLocations>();

            internal void Absorb(AbbreviatedGraph variable, VariableWriteLocations source)
            {
                if (source.TotalCount == 0)
                {
                    return;
                }

                //add the link into the set
                links.Add(variable, source);

                //adjust all counts
                nonLiterals.Remove(variable);

                foreach (AbbreviatedGraph l in source.Literals)
                {
                    if (!literals.Contains(l))
                    {
                        literals.Add(l);
                    }
                }

                foreach (AbbreviatedGraph l in source.NonLiterals)
                {
                    if (!nonLiterals.Contains(l))
                    {
                        nonLiterals.Add(l);
                    }
                }

                //determine if this variable is in a constructor or something else
                int nonConstructorLocation = 0;
                if (sets[Members.Method].ContainsKey(variable))
                {
                    nonConstructorLocation += sets[Members.Method][variable].Count;
                }

                if (sets[Members.SelfReference].ContainsKey(variable))
                {
                    nonConstructorLocation += sets[Members.SelfReference][variable].Count;
                }

                if (nonConstructorLocation > 0)
                {
                    stateCount += source.Literals.Count;
                }

                regularTypes += source.RegularTypes;
            }

            public bool IsConstant
            {
                get
                {
                    return SimulatedMembers.Count == 0 && (Literals.Count == 1 && NonLiterals.Count == 0 || TotalCount == 0 && NonLiterals.Count == 1);
                }
            }

            public bool IsSetting
            {
                get
                {
                    return !IsConstant && (Literals.Count > 1 || SimulatedMembers.Count > 0) && StateCount == 0;
                }
            }

            public bool IsState
            {
                get
                {
                    if (!IsConstant && (Literals.Count > 1 || SimulatedMembers.Count > 0) && StateCount > 0)
                    {
                        return true;
                    }

                    return regularTypes > 0;
                }
            }
        }
        #endregion
    }
}
