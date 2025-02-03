using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Language;

namespace SoftwareAnalyzer2.Tools
{
    enum ToolTypes
    {
        ANTLR, LLVM
    }

    class ToolManager
    {
        public static ITool GetTool(string toolDescription, ILanguage lang)
        {
            ToolTypes type = (ToolTypes)Enum.Parse(typeof(ToolTypes), toolDescription);
            switch (type)
            {
                case ToolTypes.ANTLR:
                    if (lang.LanguageName=="Java")
                    {
                        return new JavaANTLR();
                    }
                    else if (lang.LanguageName=="C++")
                    {
                        return new CPPANTLR();
                    }
                    else
                    {
                        throw new ArgumentOutOfRangeException("type", "Value of " + type + " has not been implemented and is invalid as an argument at this time");
                    }
                    
                case ToolTypes.LLVM:
                    return new LLVMTool();
                    
                default:
                    throw new ArgumentOutOfRangeException("type", "Value of " + type + " has not been implemented and is invalid as an argument at this time");
            }
        }
    }
}
