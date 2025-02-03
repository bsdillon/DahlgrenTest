using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure.Graphing
{
    interface IGraphNavigator
    {
        //navigates the graph using the current node as the root
        void Navigate(AbbreviatedGraph current);
        
    }
}
