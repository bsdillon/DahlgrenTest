using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;

namespace SoftwareAnalyzer2
{
    public class CrossCutting
    {
        private static readonly object logLock = new object();
        private static ILoggerFactory loggerFactory;
        public static LogLevel universalLevel = LogLevel.Trace;
        private static bool testLogging = false;
        private const string LOG_FILE = "/workspace/data/out/appLog.txt";

        public static ILogger GetLogger(Type type)
        {
            lock (logLock)
            {
                if(CrossCutting.loggerFactory == null)
                {
                    using (var writer = new StreamWriter(LOG_FILE, append: true))
                    {
                        TimeZoneInfo timeZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time"); // Change this to your desired time zone
                        DateTime localTime = TimeZoneInfo.ConvertTime(DateTime.Now, timeZone);
                        var titleLine = $"\n+++++++ New Run: {localTime:MM-dd-yy HH:mm} +++++++\n\r";
                        writer.WriteLine(titleLine);
                    }

                    loggerFactory = LoggerFactory.Create(builder =>
                    {
                        // Get the namespace of the current class
                        Type currentType = typeof(CrossCutting);

                        //Add a custom log provider to write logs to text files
                        StreamWriter logFileWriter = new StreamWriter(LOG_FILE, append: true);

                        builder.SetMinimumLevel(universalLevel)
                        .AddProvider(new CustomFileLoggerProvider(logFileWriter));
                    });

                    if(testLogging)
                    {
                        ILogger logger = loggerFactory.CreateLogger("Startup");
                        logger.LogTrace("Trace level log - Confirmed!");
                        logger.LogDebug("Debug level log - Confirmed!");
                        logger.LogInformation("Information level log - Confirmed!");
                        logger.LogWarning("Warning level log - Confirmed!");
                        logger.LogError("Error level log - Confirmed!");
                        logger.LogCritical("Critical level log - Confirmed!");
                    }
                }
            }

            return loggerFactory.CreateLogger(type.FullName ?? "UnknownType");
        }
    }

    // Customized ILoggerProvider, writes logs to text files
    public class CustomFileLoggerProvider : ILoggerProvider
    {
        private readonly StreamWriter _logFileWriter;

        public CustomFileLoggerProvider(StreamWriter logFileWriter)
        {
            _logFileWriter = logFileWriter ?? throw new ArgumentNullException(nameof(logFileWriter));
        }

        public ILogger CreateLogger(string categoryName)
        {
            return new CustomFileLogger(categoryName, _logFileWriter);
        }

        public void Dispose()
        {
            _logFileWriter.Dispose();
        }
    }

    public class CustomFileLogger : ILogger
    {
        private readonly string _categoryName;
        private readonly StreamWriter _logFileWriter;
        private HashSet<string> _blacklist = new HashSet<string>();

        public CustomFileLogger(string categoryName, StreamWriter logFileWriter)
        {
            _categoryName = categoryName;
            _logFileWriter = logFileWriter;

            //create blacklist
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.TypeNameModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.LiteralModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.StaticMethodModifier1");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.AnonymousClassConstructor");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.PackageModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.ImportModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.TypeArrayModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.GenericTypeModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.ParameterListModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.NestedExpressionModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.VariableDeclaratorModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.FieldModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.ClassMethodModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.ConstructorModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.TypeModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.SingleMethodModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.enumModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.InvertedExpressionModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.MethodInvokeModifer");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.ModifyToTypeDeclaration");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.LocalVariableModifier");
            _blacklist.Add("SoftwareAnalyzer2.Tools.JavaANTLR.FormatParameterList");
        }

        public IDisposable BeginScope<TState>(TState state)
        {
            return null;
        }

        public bool IsEnabled(LogLevel logLevel)
        {
            // Ensure that only information level and higher logs are recorded
            return logLevel >= CrossCutting.universalLevel;
        }

        public void Log<TState>(
            LogLevel logLevel,
            EventId eventId,
            TState state,
            Exception exception,
            Func<TState, Exception, string> formatter)
        {
            // Exclude any log not enabled
            if (!IsEnabled(logLevel))
            {
                return;
            }

            // Get the calling method from the stack trace (index 2 skips the current method)
            var stackTrace = new StackTrace();

            //For some reason, the stack trace of a log call SOMETIMES takes 6 levels, and sometimes takes 5
            //So this stack identifes the true target.

            // Stack
            // 0: Log                       // these are always the same
            // 1: <Log>g__LoggerLog|14_0    // these are always the same
            // 2: Log
            // 3: Log
            // 4: Log                       // this is the norm
            // 5: LogTrace
            // 6: BatchProcess <----Target Index

            // Stack
            // 0: Log                       // these are always the same
            // 1: <Log>g__LoggerLog|14_0    // these are always the same
            // 2: Log
            // 3: Log
            // 4: LogDebug                  // sometimes there are only 2 Log
            // 5: Analyze <----Target Index
            // 6: ReadFile

            int targetIndex = 2;
            for(int i=2;i<7;i++) // so far this is the largest index needed
            {
                var f1 = stackTrace.GetFrame(i);
                string mn = f1?.GetMethod()?.Name ?? "Unknown Method";
                if(mn.Equals("Log"))
                {
                    continue;
                }

                //this is NOT a log, and must be the LogDebug or LogTrace, etc.
                //so the next level is the original caller
                targetIndex = i+1;
                break;
            }

            var frame = stackTrace.GetFrame(targetIndex);
            string methodName = frame?.GetMethod()?.Name ?? "Unknown Method"; // Default in case no method is found
            string fullSource = $"{_categoryName}.{methodName}";

            // Exclude any log from a black-listed method
            if (_blacklist.Contains(fullSource))
            {
                return;
            }

            // Get the formatted log message
            string message = formatter(state, exception);
            var timestamp = DateTime.Now.ToString("HH:mm:ss");

            //Write log messages to text file
            _logFileWriter.WriteLine($"{fullSource} [{logLevel}]-{timestamp}: {message}");
            _logFileWriter.Flush();
        }
    }
}