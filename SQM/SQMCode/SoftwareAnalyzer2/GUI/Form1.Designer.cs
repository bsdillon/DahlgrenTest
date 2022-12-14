using SoftwareAnalyzer2.GUI.ProjectForms;
namespace SoftwareAnalyzer2.GUI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.mainTabControl = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.tabPage6 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage8 = new System.Windows.Forms.TabPage();
            this.tabPage7 = new System.Windows.Forms.TabPage();
            this.tabPage9 = new System.Windows.Forms.TabPage();
            this.newProjectPanel1 = new SoftwareAnalyzer2.GUI.ProjectForms.NewProjectPanel();
            this.openProjectPanel1 = new SoftwareAnalyzer2.GUI.ProjectForms.OpenProjectPanel();
            this.editProjectPanel1 = new SoftwareAnalyzer2.GUI.ProjectForms.EditProjectPanel();
            this.testPanel1 = new SoftwareAnalyzer2.GUI.Test.TestPanel();
            this.sourceUpdatePanel1 = new SoftwareAnalyzer2.GUI.AnaylsisForms.SourceUpdatePanel();
            this.graphPanel1 = new SoftwareAnalyzer2.GUI.AnaylsisForms.GraphPanel();
            this.metricPanel1 = new SoftwareAnalyzer2.GUI.AnaylsisForms.MetricPanel();
            this.mainTabControl.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabControl2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabPage5.SuspendLayout();
            this.tabPage6.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage8.SuspendLayout();
            this.tabPage7.SuspendLayout();
            this.tabPage9.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainTabControl
            // 
            this.mainTabControl.Alignment = System.Windows.Forms.TabAlignment.Bottom;
            this.mainTabControl.Controls.Add(this.tabPage1);
            this.mainTabControl.Controls.Add(this.tabPage2);
            this.mainTabControl.Dock = System.Windows.Forms.DockStyle.Left;
            this.mainTabControl.Location = new System.Drawing.Point(0, 0);
            this.mainTabControl.Multiline = true;
            this.mainTabControl.Name = "mainTabControl";
            this.mainTabControl.SelectedIndex = 0;
            this.mainTabControl.Size = new System.Drawing.Size(272, 494);
            this.mainTabControl.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.tabControl2);
            this.tabPage1.Location = new System.Drawing.Point(4, 4);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(264, 468);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "File";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabControl2
            // 
            this.tabControl2.Alignment = System.Windows.Forms.TabAlignment.Left;
            this.tabControl2.Controls.Add(this.tabPage3);
            this.tabControl2.Controls.Add(this.tabPage4);
            this.tabControl2.Controls.Add(this.tabPage5);
            this.tabControl2.Controls.Add(this.tabPage6);
            this.tabControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl2.HotTrack = true;
            this.tabControl2.Location = new System.Drawing.Point(3, 3);
            this.tabControl2.Multiline = true;
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(258, 462);
            this.tabControl2.TabIndex = 1;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.newProjectPanel1);
            this.tabPage3.Location = new System.Drawing.Point(23, 4);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(231, 454);
            this.tabPage3.TabIndex = 0;
            this.tabPage3.Text = "New";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.openProjectPanel1);
            this.tabPage4.Location = new System.Drawing.Point(23, 4);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(231, 454);
            this.tabPage4.TabIndex = 1;
            this.tabPage4.Text = "Open";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.editProjectPanel1);
            this.tabPage5.Location = new System.Drawing.Point(23, 4);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(231, 454);
            this.tabPage5.TabIndex = 2;
            this.tabPage5.Text = "Edit";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // tabPage6
            // 
            this.tabPage6.Controls.Add(this.testPanel1);
            this.tabPage6.Location = new System.Drawing.Point(23, 4);
            this.tabPage6.Name = "tabPage6";
            this.tabPage6.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage6.Size = new System.Drawing.Size(231, 454);
            this.tabPage6.TabIndex = 3;
            this.tabPage6.Text = "Test";
            this.tabPage6.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.tabControl1);
            this.tabPage2.Location = new System.Drawing.Point(4, 4);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(264, 468);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Analysis";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tabControl1
            // 
            this.tabControl1.Alignment = System.Windows.Forms.TabAlignment.Left;
            this.tabControl1.Controls.Add(this.tabPage8);
            this.tabControl1.Controls.Add(this.tabPage9);
            this.tabControl1.Controls.Add(this.tabPage7);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.HotTrack = true;
            this.tabControl1.Location = new System.Drawing.Point(3, 3);
            this.tabControl1.Multiline = true;
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(258, 462);
            this.tabControl1.TabIndex = 2;
            // 
            // tabPage8
            // 
            this.tabPage8.Controls.Add(this.sourceUpdatePanel1);
            this.tabPage8.Location = new System.Drawing.Point(23, 4);
            this.tabPage8.Name = "tabPage8";
            this.tabPage8.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage8.Size = new System.Drawing.Size(231, 454);
            this.tabPage8.TabIndex = 2;
            this.tabPage8.Text = "Source";
            this.tabPage8.UseVisualStyleBackColor = true;
            // 
            // tabPage7
            // 
            this.tabPage7.Controls.Add(this.graphPanel1);
            this.tabPage7.Location = new System.Drawing.Point(23, 4);
            this.tabPage7.Name = "tabPage7";
            this.tabPage7.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage7.Size = new System.Drawing.Size(231, 454);
            this.tabPage7.TabIndex = 3;
            this.tabPage7.Text = "Graph";
            this.tabPage7.UseVisualStyleBackColor = true;
            // 
            // tabPage9
            // 
            this.tabPage9.Controls.Add(this.metricPanel1);
            this.tabPage9.Location = new System.Drawing.Point(23, 4);
            this.tabPage9.Name = "tabPage9";
            this.tabPage9.Size = new System.Drawing.Size(231, 454);
            this.tabPage9.TabIndex = 4;
            this.tabPage9.Text = "Metrics";
            this.tabPage9.UseVisualStyleBackColor = true;
            // 
            // newProjectPanel1
            // 
            this.newProjectPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.newProjectPanel1.Location = new System.Drawing.Point(3, 3);
            this.newProjectPanel1.Name = "newProjectPanel1";
            this.newProjectPanel1.Size = new System.Drawing.Size(225, 448);
            this.newProjectPanel1.TabIndex = 0;
            // 
            // openProjectPanel1
            // 
            this.openProjectPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.openProjectPanel1.Location = new System.Drawing.Point(3, 3);
            this.openProjectPanel1.Name = "openProjectPanel1";
            this.openProjectPanel1.Size = new System.Drawing.Size(225, 448);
            this.openProjectPanel1.TabIndex = 0;
            // 
            // editProjectPanel1
            // 
            this.editProjectPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.editProjectPanel1.Location = new System.Drawing.Point(3, 3);
            this.editProjectPanel1.Name = "editProjectPanel1";
            this.editProjectPanel1.Size = new System.Drawing.Size(225, 448);
            this.editProjectPanel1.TabIndex = 0;
            // 
            // testPanel1
            // 
            this.testPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.testPanel1.Location = new System.Drawing.Point(3, 3);
            this.testPanel1.Name = "testPanel1";
            this.testPanel1.Size = new System.Drawing.Size(225, 448);
            this.testPanel1.TabIndex = 0;
            // 
            // sourceUpdatePanel1
            // 
            this.sourceUpdatePanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sourceUpdatePanel1.Location = new System.Drawing.Point(3, 3);
            this.sourceUpdatePanel1.Name = "sourceUpdatePanel1";
            this.sourceUpdatePanel1.Size = new System.Drawing.Size(225, 448);
            this.sourceUpdatePanel1.TabIndex = 0;
            // 
            // graphPanel1
            // 
            this.graphPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.graphPanel1.Location = new System.Drawing.Point(3, 3);
            this.graphPanel1.Name = "graphPanel1";
            this.graphPanel1.Size = new System.Drawing.Size(225, 448);
            this.graphPanel1.TabIndex = 0;
            // 
            // metricPanel1
            // 
            this.metricPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.metricPanel1.Location = new System.Drawing.Point(0, 0);
            this.metricPanel1.Name = "metricPanel1";
            this.metricPanel1.Size = new System.Drawing.Size(231, 454);
            this.metricPanel1.TabIndex = 0;
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(1015, 494);
            this.Controls.Add(this.mainTabControl);
            this.Name = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.mainTabControl.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabControl2.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            this.tabPage5.ResumeLayout(false);
            this.tabPage6.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage8.ResumeLayout(false);
            this.tabPage7.ResumeLayout(false);
            this.tabPage9.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl mainTabControl;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private NewProjectPanel newProjectPanel1;
        private System.Windows.Forms.TabControl tabControl2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TabPage tabPage4;
        private OpenProjectPanel openProjectPanel1;
        private System.Windows.Forms.TabPage tabPage5;
        private EditProjectPanel editProjectPanel1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage8;
        private AnaylsisForms.SourceUpdatePanel sourceUpdatePanel1;
        private System.Windows.Forms.TabPage tabPage6;
        private Test.TestPanel testPanel1;
        private System.Windows.Forms.TabPage tabPage7;
        private AnaylsisForms.GraphPanel graphPanel1;
        private System.Windows.Forms.TabPage tabPage9;
        private AnaylsisForms.MetricPanel metricPanel1;
    }
}