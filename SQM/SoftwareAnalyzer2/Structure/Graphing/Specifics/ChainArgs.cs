using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing.Specifics
{
    public class ChainArgs
    {
        private GraphNode myScope;
        private bool myCheck;
        private Statement myState;
        private bool type;

        public GraphNode ParameterScope
        {
            get
            {
                return myScope;
            }
        }

        public bool CheckOtherChildren
        {
            get
            {
                return myCheck;
            }
        }

        public Statement OriginStatement
        {
            get
            {
                return myState;
            }
        }

        public bool CheckTypeOnly
        {
            get
            {
                return type;
            }
        }

        public DefinedMember LastMember { get; set; }

        public ChainArgs(GraphNode parameterScope, bool checkOtherChildren, Statement statement, bool typeOnly)
        {
            myScope = parameterScope;
            myCheck = checkOtherChildren;
            myState = statement;
            type = typeOnly;
        }
    }
}
