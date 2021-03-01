using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SoftwareAnalyzer2.GUI.Test
{
    public partial class TestReport : Form
    {
        public TestReport()
        {
            InitializeComponent();
        }

        public TestReport(List<string> errors, List<string> changes, string file)
            : this()
        {
            StringBuilder sb = new StringBuilder();
            foreach (string s in errors)
            {
                sb.Append(s);
            }
            errorText.Text = sb.ToString();

            sb.Clear();
            foreach (string s in changes)
            {
                sb.Append(s);
            }

            changeText.Text = sb.ToString();

            FileText.Text = file;
        }
    }
}
