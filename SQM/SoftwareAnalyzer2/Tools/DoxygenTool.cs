using SoftwareAnalyzer2.Structure.Node;
using SoftwareAnalyzer2.Structure;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using SoftwareAnalyzer2.Language;
using SoftwareAnalyzer2.ProjectCoordination;

using System.Xml;

namespace SoftwareAnalyzer2.Tools
{ 
  /**
   * DoxygenTool assumes the command `doxygen` exists on the system PATH.
   * It generates a config file, passes it into doxygen's stdin, and reads
   * generated .xml data to produce SQM graph files.
   */
  class DoxygenTool : ITool
  {

      private List<string> errorMessages = new List<string>();

      //see implementation in ITool
      public List<string> Errors
      {
          get
          {
              return errorMessages;
          }
      }

      private IModifiable head;
      private ILanguage myLang;

      //see implementation in ITool
      public INode ParsedNode
      {
          get
          {
              return head;
          }
      }

      //see implementation in ITool
      public bool NoTreeCreated { get; set; }

      // Doxygen performs analysis at the directory level, not the file level.
      // The first time Analyze() is called 
      private bool DirectoryAnalysisPerformed = false;

      // We use this to get high-level project data such as the directory of code to
      // pass to doxygen. This is currently only added in the batch processing of Program.cs
      public Project project;


      //see implementation in ITool
      public ITool Clone()
      {
          return this;
      }

      //see implementation in ITool
      public void Analyze(string fileName, ILanguage lang)
      {
          if (myLang == null){
            myLang = lang;
          }
          if (project == null) {
            throw new InvalidOperationException("Please set DoxygenTool.project before calling Itool.Analyze()");
          }
          if (!DirectoryAnalysisPerformed) {
            
            string rootPath = project.GetProperty(ProjectProperties.RootDirectory);

            string doxygen_xml_out_dir = project.GetProperty(ProjectProperties.FilePath).TrimEnd(Path.DirectorySeparatorChar) + Path.DirectorySeparatorChar + "doxygen_xml";

            // Generate doxygin config as a string
            String doxygen_config = "";
            doxygen_config += "PROJECT_NAME = "+ project.GetProperty(ProjectProperties.ProjectName) + Environment.NewLine;
            doxygen_config += "OUTPUT_DIRECTORY = "+ doxygen_xml_out_dir + Environment.NewLine;
            doxygen_config += "INPUT = "+ project.GetProperty(ProjectProperties.RootDirectory) + Environment.NewLine;
            doxygen_config += "FILE_PATTERNS = *.c *.cpp *.h *.hpp" + Environment.NewLine; // TODO grab tool data
            doxygen_config += "GENERATE_XML=YES" + Environment.NewLine;
            doxygen_config += "" + Environment.NewLine;

            Process p = new Process();
            p.StartInfo.FileName = "doxygen";
            p.StartInfo.Arguments = "-";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.Start();
            Thread p_stdin_t = new Thread(() => {
              try {
                p.StandardInput.WriteLine(doxygen_config);
                p.StandardInput.Flush();
                p.StandardInput.Close();
              }
              catch (Exception e)
              {
                  errorMessages.Add("ERROR: source file i/o:" + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
              }
            });
            p_stdin_t.Start();

            // Let doxygen churn for max 901 seconds
            if (Environment.GetEnvironmentVariable("SQM_SKIP_DOXYGEN") != null) {
              Console.WriteLine("Skipping doxygen b/c SQM_SKIP_DOXYGEN is set");
            }
            else {
              Console.WriteLine("Waiting for doxygen to generate xml directory...");
              bool process_completed = p.WaitForExit(901000);
              if (!process_completed) {
                Console.WriteLine("[ Warning ] doxygen did not complete xml gen in 901 seconds.");
              }
            }

            // Read xml from directory to produce this.head
            doxygen_xml_out_dir = doxygen_xml_out_dir + Path.DirectorySeparatorChar + "xml";

            string[] xml_files = Directory.GetFiles(doxygen_xml_out_dir, "*.xml", SearchOption.AllDirectories);
            foreach (string xml_file in xml_files) {
              readXML(xml_file);
            }

            DirectoryAnalysisPerformed = true;
          }
      }

      private void readXML(string xml_file) {
        // TODO how do we know what this.head should be until we scan everything?
        if (this.head == null) {
          this.head = (IModifiable) NodeFactory.CreateNode(NodeType.CreateNodeType("HEAD"), "");
        }

        Console.WriteLine("TODO read xml from "+xml_file);

        XmlDocument doc = new XmlDocument();
        doc.Load(xml_file);

        // foreach(XmlNode node in doc.DocumentElement.ChildNodes){
        //    string text = node.InnerText; //or loop through its children as well
        //    //Console.WriteLine("text="+text);
        // }

        // Grab all class definitions
        // Below is list of all XML kind=* generated by doxygen.
        // kind=class
        // kind=compound
        // kind=define
        // kind=dir
        // kind=enum
        // kind=enumvalue
        // kind=file
        // kind=func
        // kind=function
        // kind=group
        // kind=member
        // kind=note
        // kind=page
        // kind=public-attrib
        // kind=public-func
        // kind=public-static-func
        // kind=public-type
        // kind=see
        // kind=struct
        // kind=typedef
        // kind=user-defined
        // kind=var
        // kind=variable

        XmlNodeList xnList = doc.GetElementsByTagName("compounddef"); 
        foreach (XmlNode xn in xnList)
        {
          if (xn.Attributes["kind"] != null && xn.Attributes["kind"].Value == "class") {
            Console.WriteLine("compounddef[kind=class] > "+xn.InnerText);
          }

        }

        // XmlNodeList xnList = doc.SelectNodes("/doxygen/compounddef/compounddef[@kind='class']");
        // foreach (XmlNode xn in xnList)
        // {
        //   Console.WriteLine("1 kind=class > "+xn.InnerText);
        // }


      }
  }
}