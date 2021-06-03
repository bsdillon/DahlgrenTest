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
    class QAlgorithm
    {
        private static QAlgorithm only;
        private QAlgorithm()
        {
        }

        internal static QAlgorithm Instance
        {
            get
            {
                if (only == null)
                {
                    only = new QAlgorithm();
                }
                return only;
            }
        }

        internal void MainAlgorithm()
        {
            //The original algorithm had a minimum number of modules which would be acceptable as a solution.
            //This assumes some known information about the graph.
            double minDiff = .00001;//this value defines the minimum gain between iterations

            double q1 = CalcModularityQ();//get initial modularity
            double q0 = q1 + 1;//force the first iteration
            int iteration = 0;

            bool GraphRevised = false;
            //iterate until no significant difference is acheived
            //the old algorithm included an escape clause here which depended on the minimum nodes 
            while (Math.Abs(q0 - q1) > minDiff || GraphRevised)
            {
                GraphRevised = false;
                q0 = q1;//remember the last measure of modularity
                GraphRevised = CombineModules();//attempt to combine modules
                q1 = CalcModularityQ();//find new modularity
                iteration++;
            }
        }

        private double CalcModularityQ()
        {
            double mValue = 0;
            double sum = 0;
            long module1 = 0;
            long module2 = 0;

            foreach (GephiNode first in MetricUtilities.AllNodes)
            {
                //this node has at least one connection
                module1 = (long)first.GetProperty(NodeProperties.Module);
                foreach (GephiNode second in MetricUtilities.GetDirectedLinksFrom(first))
                {
                    if (second == first)
                    {
                        throw new InvalidDataException("No self-referential links allowed in Q algorithm");
                    }

                    module2 = (long)second.GetProperty(NodeProperties.Module);
                    double qVal = MetricUtilities.GetDirectedLink(first, second);
                    mValue += qVal;
                    if (module2 == module1)//this is an inter-module connection
                    {
                        sum += qVal;//count this weight.
                    }
                }
            }
            return sum / mValue;
        }

        /// <summary>
        /// Examines the benefit in terms of Q from joining n1 to n2.
        /// Returns a positive number if there is an advantage
        /// Returns a negative number if the joining should be reversed (i.e. n2 --> n1)
        /// Returns 0 if there is no advantage in either direction
        /// </summary>
        /// <param name="firstNode"></param>
        /// <param name="secondNode"></param>
        /// <param name="deltaQ"></param>
        /// <returns></returns>
        private int CalcShortQ(GephiNode firstNode, GephiNode secondNode, out double deltaQ)
        {
            long firstModule = (long)firstNode.GetProperty(NodeProperties.Module);
            long secondModule = (long)secondNode.GetProperty(NodeProperties.Module);

            //we need to find the value lost from links between n1 and its co-module members
            double firstModuleDelta = 0;
            foreach (GephiNode firstModuleNode in MetricUtilities.GetModule(firstModule))
            {
                //skip the same node
                if (firstModuleNode == firstNode)
                {
                    continue;
                }

                //update the firstModuleDelta negatively because we LOSE these links
                firstModuleDelta -= MetricUtilities.GetDirectedLink(firstNode,firstModuleNode);
                firstModuleDelta -= MetricUtilities.GetDirectedLink(firstModuleNode, firstNode);
            }

            //we need to find the value gained from links between n1 and the new module
            foreach (GephiNode secondModuleNode in MetricUtilities.GetModule(secondModule))
            {
                //skip any second module node which doesn't link to the first node
                if (!MetricUtilities.IsThereALinkBetween(firstNode,secondModuleNode))
                {
                    continue;
                }

                //update the firstModuleDelta positively because we GAIN these links
                firstModuleDelta += MetricUtilities.GetDirectedLink(firstNode, secondModuleNode);
                firstModuleDelta += MetricUtilities.GetDirectedLink(secondModuleNode, firstNode);
            }

            //we need to find the value lost from links between n2 and its co-module members
            double secondModuleDelta = 0;
            foreach (GephiNode secondModuleNode in MetricUtilities.GetModule(secondModule))
            {
                //skip the same node
                if (secondModuleNode == secondNode)
                {
                    continue;
                }

                //update the secondModuleDelta negatively because we LOSE these links
                secondModuleDelta -= MetricUtilities.GetDirectedLink(secondNode,secondModuleNode);
                secondModuleDelta -= MetricUtilities.GetDirectedLink(secondModuleNode, secondNode);
            }

            //we need to find the value gained from links between n2 and the new module
            foreach (GephiNode firstModuleNode in MetricUtilities.GetModule(firstModule))
            {
                //skip any first module node which doesn't link to the second node
                if (!MetricUtilities.IsThereALinkBetween(secondNode,firstModuleNode))
                {
                    continue;
                }

                //update the secondModuleDelta positively because we will GAIN these links
                secondModuleDelta += MetricUtilities.GetDirectedLink(secondNode,firstModuleNode);
                secondModuleDelta += MetricUtilities.GetDirectedLink(firstModuleNode, secondNode);
            }

            //determine the best answer
            int direction = 0;
            deltaQ = 0;
            if (firstModuleDelta >= secondModuleDelta && firstModuleDelta > 0)//favor answer1 if it is superior or equal
            {
                deltaQ = firstModuleDelta;
                direction = 1;
            }
            else if (secondModuleDelta > firstModuleDelta && secondModuleDelta > 0)
            {
                deltaQ = secondModuleDelta;
                direction = -1;
            }

            return direction;
        }

        private bool CombineModules()
        {
            bool answer = false;

            #region Move single node
            //consider moving each node in the QNode set
            foreach (GephiNode mover in MetricUtilities.AllNodes)
            {
                AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(mover);
                if (!((bool)mover.GetProperty(NodeProperties.QState) && MetricUtilities.IsImportantConnection(mover)))
                {
                    continue;// no outgoing edges from this node
                }
                
                //configure answer values which indicate the most advantageous movement
                //default values indicate no change is preferrable.
                double bestDeltaQ = 0;
                GephiNode bestLink = mover;
                int change = 0;

                long moverModuleID = (long)mover.GetProperty(NodeProperties.Module);//saved to allow temporary changes with reversion

                foreach (GephiNode linked in MetricUtilities.GetDirectedLinksFrom(mover))
                {
                    long linkedModule = (long)linked.GetProperty(NodeProperties.Module);
                    bool inQAlgorithm = (bool)linked.GetProperty(NodeProperties.QState);
                    if (linkedModule == moverModuleID || !inQAlgorithm)
                    {
                        //we do not consider linked nodes in the same module our outside the q algorithm
                        continue;
                    }

                    //find the best value of the proposed change
                    double deltaQ;
                    int direction = CalcShortQ(mover, linked, out deltaQ);

                    //continue if the value is not more advantageous
                    if (deltaQ <= bestDeltaQ)
                    {
                        continue;
                    }

                    //recall the direction and value of the proposed change
                    change = direction;
                    bestLink = linked;
                    bestDeltaQ = deltaQ;
                }

                //effect the best change
                long otherModuleID = (long)bestLink.GetProperty(NodeProperties.Module);

                if (change == 1)//mover goes to other module
                {
                    MetricUtilities.ChangeModule(mover, otherModuleID);
                    answer = true;//remember that the graph has been revised.
                }
                else if (change == -1) // moving some node to g's module
                {
                    MetricUtilities.ChangeModule(bestLink, moverModuleID);
                    answer = true;//remember that the graph has been revised.
                }
            }
            #endregion

            //recall any module which is well separated
            List<long> separatedModules = new List<long>();

            //consider any super modules
            long myModule = -1;
            long otherModule = -1;
            bool allowSuperModule = true;
            foreach (long mod in MetricUtilities.ModuleIds)
            {
                //reset search parameters
                myModule = mod;
                otherModule = -1;
                allowSuperModule = true;
                bool someValidQ = false;

                //look at each node in the module
                if (MetricUtilities.ModuleExists(mod))
                {
                    //this module has not been removed by creating a super module
                    foreach (GephiNode n in MetricUtilities.GetModule(mod))
                    {
                        AbbreviatedGraph ag = MetricUtilities.GraphFromGephi(n);

                        if ((bool)n.GetProperty(NodeProperties.QState))
                        {
                            someValidQ = true;

                            //examine connections to other modules
                            foreach (GephiNode g2 in MetricUtilities.GetLinksInvolving(n))
                            {
                                long otherMod = (long)g2.GetProperty(NodeProperties.Module);
                                bool inQAlgorithm = (bool)g2.GetProperty(NodeProperties.QState);
                                if (otherMod == myModule || !inQAlgorithm)
                                {
                                    //we do not consider linked nodes in the same or external modules
                                    continue;
                                }

                                if (otherModule != -1 && otherMod != otherModule)
                                {
                                    //we already have a connection to one module
                                    //but this node is from a different module
                                    //therefore they cannot become a super module
                                    allowSuperModule = false;
                                    break;//leave one for loop
                                }
                                else if (otherModule == -1)
                                {
                                    //we have not found any external module
                                    //so we will recall the potential for linking a module.
                                    otherModule = otherMod;
                                }
                            }

                            if (!allowSuperModule)
                            {
                                //we have already established that at least two other modules touch this one.
                                break;//preempt rest of module loop
                            }
                        }
                    }
                }

                //finished examining members of one module

                if (!someValidQ)
                {
                    //this module has no q members, so we won't move it
                    allowSuperModule = false;
                }
                else if (otherModule == -1)
                {
                    //module was not connected to any other module and at least one node was still in the q state
                    separatedModules.Add(myModule);
                    allowSuperModule = false;
                }

                if (allowSuperModule)
                {
                    //we found one super module; combine the two modules
                    answer = true;//remember that the graph has been revised.

                    //remove the other module from the list of separatedModules as it might have been put there.
                    separatedModules.Remove(otherModule);

                    GephiNode[] otherList = new GephiNode[MetricUtilities.SizeOfModule(otherModule)];

                    foreach (GephiNode n in MetricUtilities.GetModule(otherModule))
                    {
                        MetricUtilities.ChangeModule(n, myModule);
                    }
                }
            }

            //create any separated modules
            foreach (long moduleID in separatedModules)
            {
                answer = true;//remember that the graph has been revised.

                //remove those nodes from the Q algorithm and tag them as external
                foreach (GephiNode n in MetricUtilities.GetModule(moduleID))
                {
                    n.SetProperty(NodeProperties.QState, false);
                    n.SetProperty(NodeProperties.NodePattern, (int)NodePatterns.Separated);
                }
            }

            return answer;
        }
    }
}
