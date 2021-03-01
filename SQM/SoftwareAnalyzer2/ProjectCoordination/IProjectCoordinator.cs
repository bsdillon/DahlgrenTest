using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.ProjectCoordination
{
    public interface IProjectCoordinator
    {
        Project CurrentProject { get; set; }
    }
}
