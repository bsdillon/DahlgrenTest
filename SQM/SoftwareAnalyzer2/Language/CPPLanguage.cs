using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Language
{
    class CPPLanguage : ILanguage
    {
        public string FileExtension
        {
            get
            {
                return "*.cpp";
            }
        }

        private static List<string> packages;
        private static List<string> classes;
        private static List<string> interfaces;
        private static Dictionary<string, string> mapping;
        private static Dictionary<string, string> defaultVal;

        static CPPLanguage()
        {
            packages = new List<string>();
            // packages.Add("java");
            // packages.Add("javax");
            // packages.Add("org");
            // packages.Add("com");
            // packages.Add("junit");

            interfaces = new List<string>();
            // interfaces.Add("java.lang.Appendable");
            // interfaces.Add("java.lang.AutoCloseable");
            // interfaces.Add("java.lang.CharSequence");
            // interfaces.Add("java.lang.Cloneable");
            // interfaces.Add("java.lang.Comparable");
            // interfaces.Add("java.lang.Iterable");
            // interfaces.Add("java.lang.Readable");
            // interfaces.Add("java.lang.Runnable");

            classes = new List<string>();
            // classes.Add("java.lang.Boolean");
            // classes.Add("java.lang.Byte");
            // classes.Add("java.lang.Character");
            // classes.Add("java.lang.Class");
            // classes.Add("java.lang.ClassLoader");
            // classes.Add("java.lang.ClassValue");
            // classes.Add("java.lang.Compiler");
            // classes.Add("java.lang.Double");
            // classes.Add("java.lang.Enum");
            // classes.Add("java.lang.Float");
            // classes.Add("java.lang.InheritableThreadLocal");
            // classes.Add("java.lang.Integer");
            // classes.Add("java.lang.Long");
            // classes.Add("java.lang.Math");
            // classes.Add("java.lang.Number");
            // classes.Add("java.lang.Object");
            // classes.Add("java.lang.Package");
            // classes.Add("java.lang.Process");
            // classes.Add("java.lang.ProcessBuilder");
            // classes.Add("java.lang.Runtime");
            // classes.Add("java.lang.RuntimePermission");
            // classes.Add("java.lang.SecurityManager");
            // classes.Add("java.lang.Short");
            // classes.Add("java.lang.StackTraceElement");
            // classes.Add("java.lang.StrictMath");
            // classes.Add("java.lang.String");
            // classes.Add("java.lang.StringBuffer");
            // classes.Add("java.lang.StringBuilder");
            // classes.Add("java.lang.System");
            // classes.Add("java.lang.Thread");
            // classes.Add("java.lang.ThreadGroup");
            // classes.Add("java.lang.ThreadLocal");
            // classes.Add("java.lang.Throwable");
            // classes.Add("java.lang.Void");

            mapping = new Dictionary<string, string>();
            // mapping.Add("int", "Integer");
            // mapping.Add("Integer", "Integer");
            // mapping.Add("long", "Long");
            // mapping.Add("Long", "Long");
            // mapping.Add("char", "Character");
            // mapping.Add("Character", "Character");
            // mapping.Add("String", "String");
            // mapping.Add("string", "String");
            // mapping.Add("bool", "Boolean");
            // mapping.Add("boolean", "Boolean");
            // mapping.Add("Boolean", "Boolean");
            // mapping.Add("byte", "Byte");
            // mapping.Add("Byte", "Byte");
            // mapping.Add("double", "Double");
            // mapping.Add("Double", "Double");
            // mapping.Add("Float", "Float");
            // mapping.Add("float", "Float");
            // mapping.Add("short", "Short");
            // mapping.Add("Short", "Short");
            // mapping.Add("Object", "Object");
            //mapping.Add("", "");

            defaultVal = new Dictionary<string, string>();
            // defaultVal.Add("Integer", "0");
            // defaultVal.Add("Long", "0");
            // defaultVal.Add("Character", "u0000");
            // defaultVal.Add("String", "null");
            // defaultVal.Add("Boolean", "false");
            // defaultVal.Add("Byte", "0");
            // defaultVal.Add("Double", "0");
            // defaultVal.Add("Float", "0");
            // defaultVal.Add("Short", "0");
            // defaultVal.Add("Object", "null");
        }

        public List<string> InitialPackages
        {
            get
            {
                return packages;
            }
        }

        public List<string> NativeClasses
        {
            get
            {
                return classes;
            }
        }

        public List<string> NativeInterfaces
        {
            get
            {
                return interfaces;
            }
        }

        public string HeadNode
        {
            get
            {
                return "";
            }
        }

        public string VoidNode
        {
            get
            {
                return "void";
            }
        }

        public string StandardLibrary
        {
            get
            {
                return "std::*";
            }
        }

        public string ProcessName
        {
            get
            {
                // This is part of .net core (c# v5+)
                //if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux)) {

                // Assume the PROGRAMFILES variable will only be defined on windows systems.
                if (Environment.GetEnvironmentVariable("PROGRAMFILES") == null) {
                    return "java";
                }
                else {
                    return "javaw";
                }
            }
        }

        public string ANTLRInstruction
        {
            get
            {
                return "CPP14 compilationUnit";
            }
        }

        public Dictionary<string, string> LiteralMapping
        {
            get
            {
                return mapping;
            }
        }

        public Dictionary<string, string> DefaultValues
        {
            get
            {
                return defaultVal;
            }
        }
    }
}
