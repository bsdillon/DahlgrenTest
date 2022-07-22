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
        public string[] FileExtensionGlobs
        {
            get
            {
                return new string[]{"*.cpp", "*.c", "*.hpp", "*.h"};
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
            packages.Add("std");
            
            interfaces = new List<string>();
            interfaces.Add("std");
            
            classes = new List<string>();
            
            
            // TODO these are structs OR types in c++/ada/fortran/c/rust/zig/go
            classes.Add("void");
            classes.Add("int");
            classes.Add("long");
            classes.Add("short");
            classes.Add("char");
            classes.Add("bool");
            classes.Add("float");
            classes.Add("double");
            classes.Add("Object");
            classes.Add("string");
            classes.Add("Enum");

            // because this is C, every class (aka struct OR type) may have a pointer variant
            foreach (string s in new List<string>(classes)) {
                classes.Add(s+"*");
            }

            mapping = new Dictionary<string, string>();
            mapping.Add("Object", "Object");
            mapping.Add("void", "void");
            mapping.Add("Integer", "int");
            mapping.Add("int", "int");
            mapping.Add("long", "long");
            mapping.Add("Long", "long");
            mapping.Add("char", "char");
            mapping.Add("Character", "char");
            mapping.Add("bool", "bool");
            mapping.Add("boolean", "bool");
            mapping.Add("Boolean", "bool");
            mapping.Add("double", "double");//dec(long)  type(long) -> type("long long")
            mapping.Add("Double", "double");
            mapping.Add("Float", "float");
            mapping.Add("float", "float");
            mapping.Add("short", "short");
            mapping.Add("Short", "short");
            mapping.Add("long long", "64_int");
            //This is just to handle string literals
            mapping.Add("String", "string");
            

            defaultVal = new Dictionary<string, string>();
            defaultVal.Add("int", "0");
            defaultVal.Add("long", "0");
            defaultVal.Add("char", "0");
            defaultVal.Add("char*", "0");
            defaultVal.Add("bool", "false");
            defaultVal.Add("double", "0");
            defaultVal.Add("float", "0");
            defaultVal.Add("short", "0");
            defaultVal.Add("Object", "nullptr");
            defaultVal.Add("string", "0");
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
                return "void";
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
                return "CPP14 translationUnit";
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

        public string PackageDelimitator { 
            get
            {
                return "::";
            }
        }
    }
}
