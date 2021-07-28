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
   * LLVMTool assumes the commands `clang++` and `opt` exist on the system PATH.
   * `opt[.exe]` is used to run zpasstestmodule, and environment variables
   * are used to pass state into/out of the analysis program.
   */
  class LLVMTool : ITool
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
            throw new InvalidOperationException("Please set LLVMTool.project before calling Itool.Analyze()");
          }
          if (!DirectoryAnalysisPerformed) {
            
            string rootPath = project.GetProperty(ProjectProperties.RootDirectory);

            string llvm_link_out_dir = project.GetProperty(ProjectProperties.FilePath).TrimEnd(Path.DirectorySeparatorChar);

            Process p = new Process();
            p.StartInfo.FileName = "clang++";
            p.StartInfo.Arguments = String.Join(" ",
              "-O0",
              "-g",
              "-gcolumn-info",
              "-Xclang",
              "-disable-llvm-passes",
              "-S",
              "-emit-llvm",
              "-I"+rootPath
            );

            foreach (string c_file in Directory.GetFiles(rootPath, "*.c", SearchOption.AllDirectories)) {
              p.StartInfo.Arguments += " "+Path.GetFullPath(c_file);
            }
            foreach (string cpp_file in Directory.GetFiles(rootPath, "*.cpp", SearchOption.AllDirectories)) {
              p.StartInfo.Arguments += " "+Path.GetFullPath(cpp_file);
            }
            
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.WorkingDirectory = llvm_link_out_dir;
            p.Start();

            p.WaitForExit(301000);

            string llvm_link_out_file = llvm_link_out_dir + Path.DirectorySeparatorChar + "ZPassTestModule.ll";
            if (!File.Exists(llvm_link_out_file)) {
              string err = "No LLVM bitcode generated! Expected file to exist: "+llvm_link_out_file;
              errorMessages.Add(err);
              Console.WriteLine(err);
              return;
            }

            p = new Process();
            p.StartInfo.FileName = Environment.GetEnvironmentVariable("SQM_LLVM_PASS_OPT_BIN") ?? "opt";
            p.StartInfo.Arguments = String.Join(" ",
              "-disable-output",
              llvm_link_out_file,
              "-passes=zpasstestmodule"
            );
            
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.WorkingDirectory = project.GetProperty(ProjectProperties.FilePath).TrimEnd(Path.DirectorySeparatorChar);
            p.Start();
            // Thread p_stdin_t = new Thread(() => {
            //   try {
            //     p.StandardInput.WriteLine(doxygen_config);
            //     p.StandardInput.Flush();
            //     p.StandardInput.Close();
            //   }
            //   catch (Exception e)
            //   {
            //       errorMessages.Add("ERROR: source file i/o:" + e.Message + System.Environment.NewLine + e.StackTrace + System.Environment.NewLine);
            //   }
            // });
            // p_stdin_t.Start();

            // Let llvm churn for max 301 seconds
            bool process_completed = p.WaitForExit(301000);
            if (!process_completed) {
              Console.WriteLine("[ Warning ] llvm did not complete in 301 seconds.");
            }

            
            // TODO turn gph into HEAD?
            if (this.head == null) {
              this.head = (IModifiable) NodeFactory.CreateNode(NodeType.CreateNodeType("HEAD"), "");
            }
            
            DirectoryAnalysisPerformed = true;
          }
      }
      
  }
}