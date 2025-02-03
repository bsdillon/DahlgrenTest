using Microsoft.Extensions.Logging;
using SoftwareAnalyzer2.Source;
using System;

namespace SoftwareAnalyzer2
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            Console.WriteLine("*******************************************");
            Console.WriteLine("*                                         *");
            Console.WriteLine("*        Software Quality Metrics         *");
            Console.WriteLine("*                                         *");
            Console.WriteLine("*******************************************");

            var logger = CrossCutting.GetLogger(typeof(Program));
            try
            {
                logger.LogInformation("Starting analysis");
                StartAnalysis.BatchProcess();

                logger.LogInformation("Processing completed successfully.");
                System.Console.Beep();
            }
            catch (Exception e)
            {
                logger.LogError($"Error during processing: {e.Message}");
                logger.LogError(e.StackTrace);
                System.Console.Beep();
                Environment.Exit(1); // Exit with an error code if processing fails
            }                
        }
    }
}
