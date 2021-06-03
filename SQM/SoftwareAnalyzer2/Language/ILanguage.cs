using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Language
{
    public interface ILanguage
    {
        string[] FileExtensionGlobs { get; }
        List<string> InitialPackages { get; }
        List<string> NativeClasses { get; }
        List<string> NativeInterfaces { get; }
        string HeadNode { get; }
        string VoidNode { get; }
        string StandardLibrary { get; }
        string ProcessName { get; }
        string ANTLRInstruction { get; }
        Dictionary<string, string> LiteralMapping { get; }
        Dictionary<string, string> DefaultValues { get; }
    }
}
