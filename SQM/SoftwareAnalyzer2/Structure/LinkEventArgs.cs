using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareAnalyzer2.Structure
{
    public class LinkEventArgs : EventArgs
    {
        public int Done { get; set; }
        public int Total { get; set; }
        public long ID { get; set; }

        public LinkEventArgs(int done, int total, long id)
        {
            Done = done;
            Total = total;
            ID = id;
        }
    }

    public delegate void LinkEventHandler(object sender, LinkEventArgs e);
}
