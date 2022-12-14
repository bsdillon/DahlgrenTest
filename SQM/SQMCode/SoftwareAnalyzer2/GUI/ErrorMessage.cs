using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SoftwareAnalyzer2.GUI
{
    public partial class ErrorMessage : Form
    {
        private ErrorMessage()
        {
            InitializeComponent();
        }


        public static void Show(string file, string toolType, List<string> errors)
        {
            ErrorMessage p = new ErrorMessage();

            p.FileLabel.Text = file;
            p.ToolLabel.Text = toolType;
            StringBuilder sb = new StringBuilder();
            foreach (string s in errors)
            {
                sb.Append(s);
            }
            p.errorText.Text = sb.ToString();

            p.ShowDialog();
        }
    }
}
