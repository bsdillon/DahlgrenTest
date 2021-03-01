using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.ProjectCoordination
{
    interface IProjectUser
    {
        void ProjectLoaded(object sender, EventArgs e);
        void ProjectChanged(object sender, EventArgs e);
    }
}
