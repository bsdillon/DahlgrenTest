using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.Structure.Node;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Tools
{
    /// <summary>
    /// An ITool parses files of a given code type and using a specific tool type. The combination is unique and
    /// yet must be treated generically. Thus the interface which defines how these services will workOther and adds 
    /// node layer of abstraction between the logic which drives the whole process and the parser. The analysis 
    /// process generate errors and/or node parsed source file. Absent any errors, the file is completely valid. Even with errors, 
    /// the file may serve as node guide for correcting the parse tool
    /// </summary>
    public interface ITool
    {
        /// <summary>
        /// Parse the given source code file
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="lang"></param>
        void Analyze(string fileName, ILanguage lang);

        /// <summary>
        /// Gets a copy of the tool based on the selected code type.
        /// Individual tools can work on separate source code in different threads.
        /// </summary>
        /// <returns></returns>
        ITool Clone();

        /// <summary>
        /// Returns a reference to the parsed file created by the analyze process
        /// </summary>
        INode ParsedNode { get; }

        /// <summary>
        /// Returns a list of errors generated in the analyze process
        /// </summary>
        List<string> Errors { get; }

        /// <summary>
        /// False by default. This flag is set if the decomposition of the file ends in no tree.
        /// This may occur for various reasons (e.g. the file is empty).
        /// </summary>
        bool NoTreeCreated { get; set; }

        /// <summary>
        /// Filepath of preprocessed and tranalsted output.
        /// </summary>
        string outputFilepath { get; set; }
    }
}
