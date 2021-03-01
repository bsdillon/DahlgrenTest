using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public abstract class HierarchyNode : GraphNode
    {
        private static event LinkEventHandler LinkProgressChanged;

        private static object LinkingLock = new object();
        private static int typesLinked = 0;
        private static int totalTypes = 0;
        private static int EventCounter = 0;

        protected const int MaxLinkers = 5;
        protected static int CurrentLinkers = 0;

        protected static bool allLinking = false;
        public static bool AllLinkingHub
        {
            get
            {
                return allLinking;
            }
        }

        /// <summary>
        /// Follow the dot operator from a Hierarchy node until it reaches a DefinedMember.
        /// </summary>
        /// <param name="nextMember"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        public abstract DefinedMember LinkToMember(INavigable nextMember, ChainArgs args);

        /// <summary>
        /// This method is called prior to the full linking process. It creates an update pathway to 
        /// communicate with the GUI and sets node boolean indicating that the process is ready to start.
        /// </summary>
        /// <param name="actionDelegate"></param>
        public static void HubPrepareForLink(Action<object, LinkEventArgs> actionDelegate)
        {
            LinkProgressChanged += new LinkEventHandler(actionDelegate);
            allLinking = false;
        }

        /// <summary>
        /// Called to reset the graph between runs.
        /// </summary>
        /// <param name="initialPackages"></param>
        public static void ClearGraphHub(ILanguage lang)
        {
            //this spinlock prevents entry into the rest of the method while one link is going on
            while (totalTypes > typesLinked)
            {
                Thread.Sleep(250);
            }

            typesLinked = 0;
            EventCounter = 0;

            if (LinkProgressChanged != null)
            {
                foreach (Delegate d in LinkProgressChanged.GetInvocationList())
                {
                    LinkProgressChanged -= (LinkEventHandler)d;
                }
            }

            //clear p packages and replace
            Package.ClearRootPackages(lang.InitialPackages);

            TypeDefinition.StoreNativeTypes(lang);
        }

        /// <summary>
        /// Multi-threaded method controlled by static mutex. Tallies
        /// the total number of parts which have been linked and updates GUI
        /// </summary>
        /// <param name="increment"></param>
        protected static void UpdateLinkCount(int increment)
        {
            lock (LinkingLock)
            {
                if (increment > 0)
                {
                    totalTypes++;
                    CurrentLinkers++;
                }
                else
                {
                    typesLinked++;
                    CurrentLinkers--;
                }

                EventCounter++;
                LinkProgressChanged(new object(), new LinkEventArgs(typesLinked, totalTypes, EventCounter));
            }
        }

        /// <summary>
        /// A HierarchyNode will follow the recursive structure outlined in the endNode parts and return
        /// the last node in that chain.
        /// </summary>
        /// <param name="packageParts"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        public abstract HierarchyNode RecursiveFollow(string[] packageParts, int index);

        /// <summary>
        /// Finds the HierarchyNode indicated within this node
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public abstract HierarchyNode FindInHierarchy(string name);

        #region Imports
        protected List<HierarchyNode> importedPool = new List<HierarchyNode>();

        public void WasImportedBy(HierarchyNode g)
        {
            lock (importedPool)
            {
                //atomic action; check for duplicate and add
                //duplicates are allowed, but ignored.
                if (importedPool.Contains(g))
                {
                    return;
                }

                importedPool.Add(g);
            }
        }

        public abstract TypeDefinition FindTypeDefinition(string typeName);
        #endregion
    }
}
