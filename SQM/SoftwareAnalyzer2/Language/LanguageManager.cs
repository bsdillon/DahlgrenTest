using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Language
{
    enum LanguageTypes
    {
        Java
    }

    class LanguageManager
    {
        public static ILanguage GetLanguage(string languageDescription)
        {
            LanguageTypes type = (LanguageTypes)Enum.Parse(typeof(LanguageTypes), languageDescription);
            ILanguage lang = null;
            switch (type)
            {
                case LanguageTypes.Java:
                    lang = new JavaLanguage();
                    break;
                default:
                    Exception e = new ArgumentOutOfRangeException("type", "Value of " + type + " has not been implemented and is invalid as an argument at this time");
                    throw e;
            }

            return lang;
        }
    }
}
