using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Tools
{
    enum ToolTypes
    {
        ANTLR
    }

    class ToolManager
    {
        public static ITool GetTool(string toolDescription)
        {
            ToolTypes type = (ToolTypes)Enum.Parse(typeof(ToolTypes), toolDescription);
            ITool tool = null;
            switch (type)
            {
                case ToolTypes.ANTLR:
                    tool = new ANTLRTool();
                    break;
                default:
                    Exception e = new ArgumentOutOfRangeException("type", "Value of " + type + " has not been implemented and is invalid as an argument at this time");
                    throw e;
            }

            return tool;
        }
    }
}
