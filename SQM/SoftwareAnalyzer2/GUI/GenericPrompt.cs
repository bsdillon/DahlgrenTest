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
    public enum PromptButtonOptions
    {
        OK_Cancel,
        OK_only
    }

    public partial class GenericPrompt : Form
    {
        private GenericPrompt()
        {
            InitializeComponent();
        }

        public static string Prompt(IWin32Window owner, string title, string prompt, PromptButtonOptions options)
        {
            GenericPrompt p = new GenericPrompt();

            if (options == PromptButtonOptions.OK_Cancel)
            {
                p.OKButton2.Visible = false;
            }
            else
            {
                p.OKButton1.Visible = false;
                p.Cancel_Button.Visible = false;
            }

            p.Text = title;
            p.prompt.Text = prompt;

            p.ShowDialog(owner);

            return p.response.Text;
        }

        private void closeClick(object sender, EventArgs e)
        {
            if (sender == OKButton1 || sender == OKButton2)
            {
                DialogResult = DialogResult.OK;
            }
            else
            {
                DialogResult = DialogResult.Cancel;
            }
            this.Close();
        }

        private void response_TextChanged(object sender, EventArgs e)
        {
            bool b = (response.Text.Length > 0);
            OKButton1.Enabled = b;
            OKButton2.Enabled = b;
            Cancel_Button.Enabled = b;
        }
    }
}
