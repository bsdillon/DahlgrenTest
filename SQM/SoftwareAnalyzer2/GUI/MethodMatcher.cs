using SoftwareAnalyzer2.Structure.Node;
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
    public partial class MethodMatcher : Form
    {
        private List<string> finalMatches;

        public MethodMatcher()
        {
            InitializeComponent();
        }

        public MethodMatcher(INavigable unknownMethod, string parameterTree, List<string> candidates)
        {
            InitializeComponent();
            this.finalMatches = candidates;

            MethodName.Text = unknownMethod.Code;

            ParameterOutput.Text = parameterTree;

            for (int i = 0; i < candidates.Count; i++)
            {
                CandidateList.Items.Add(candidates[i]);
            }

            if (candidates.Count == 0)
            {
                CandidateList.Items.Add("NONE");
            }
        }

        private int answerIndex = -1;
        public int AnswerIndex
        {
            get
            {
                return answerIndex;
            }
        }

        private void DoneButton_Click(object sender, EventArgs e)
        {
            if (CandidateList.SelectedIndex > -1)
            {
                answerIndex = CandidateList.SelectedIndex;
                this.Close();
            }
        }
    }
}
