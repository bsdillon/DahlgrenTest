namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    partial class SourceUpdatePanel
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.SuspendButton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.output = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.ParseProgress = new System.Windows.Forms.ProgressBar();
            this.newFiles = new System.Windows.Forms.Label();
            this.emptyFiles = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.filesRegistered = new System.Windows.Forms.Label();
            this.TotalFilesToRegister = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.registerProgress = new System.Windows.Forms.ProgressBar();
            this.linkProgress = new System.Windows.Forms.ProgressBar();
            this.label5 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.InitialLinksDone = new System.Windows.Forms.Label();
            this.TotalInitialLinks = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.InitialLinkProgress = new System.Windows.Forms.ProgressBar();
            this.LinkPercent = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // SuspendButton
            // 
            this.SuspendButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.SuspendButton.Enabled = false;
            this.SuspendButton.Location = new System.Drawing.Point(178, 14);
            this.SuspendButton.Name = "SuspendButton";
            this.SuspendButton.Size = new System.Drawing.Size(58, 23);
            this.SuspendButton.TabIndex = 0;
            this.SuspendButton.Text = "Suspend";
            this.SuspendButton.UseVisualStyleBackColor = true;
            this.SuspendButton.Click += new System.EventHandler(this.SuspendButton_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Files Checked";
            // 
            // output
            // 
            this.output.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.output.Location = new System.Drawing.Point(3, 9);
            this.output.Name = "output";
            this.output.Size = new System.Drawing.Size(172, 28);
            this.output.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "New Files";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 71);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Empty Files";
            // 
            // ParseProgress
            // 
            this.ParseProgress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ParseProgress.Location = new System.Drawing.Point(87, 20);
            this.ParseProgress.Name = "ParseProgress";
            this.ParseProgress.Size = new System.Drawing.Size(149, 20);
            this.ParseProgress.TabIndex = 9;
            // 
            // newFiles
            // 
            this.newFiles.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.newFiles.Location = new System.Drawing.Point(87, 46);
            this.newFiles.Name = "newFiles";
            this.newFiles.Size = new System.Drawing.Size(149, 13);
            this.newFiles.TabIndex = 10;
            this.newFiles.Text = "0";
            this.newFiles.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // emptyFiles
            // 
            this.emptyFiles.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.emptyFiles.Location = new System.Drawing.Point(87, 71);
            this.emptyFiles.Name = "emptyFiles";
            this.emptyFiles.Size = new System.Drawing.Size(149, 13);
            this.emptyFiles.TabIndex = 11;
            this.emptyFiles.Text = "0";
            this.emptyFiles.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.emptyFiles);
            this.groupBox1.Controls.Add(this.newFiles);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.ParseProgress);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Location = new System.Drawing.Point(0, 40);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(242, 96);
            this.groupBox1.TabIndex = 12;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Source Parsing";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.filesRegistered);
            this.groupBox2.Controls.Add(this.TotalFilesToRegister);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.registerProgress);
            this.groupBox2.Location = new System.Drawing.Point(0, 142);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(242, 75);
            this.groupBox2.TabIndex = 13;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Graph Registration";
            // 
            // filesRegistered
            // 
            this.filesRegistered.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filesRegistered.Location = new System.Drawing.Point(3, 42);
            this.filesRegistered.Name = "filesRegistered";
            this.filesRegistered.Size = new System.Drawing.Size(98, 22);
            this.filesRegistered.TabIndex = 15;
            this.filesRegistered.Text = "0";
            this.filesRegistered.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // TotalFilesToRegister
            // 
            this.TotalFilesToRegister.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TotalFilesToRegister.Location = new System.Drawing.Point(138, 42);
            this.TotalFilesToRegister.Name = "TotalFilesToRegister";
            this.TotalFilesToRegister.Size = new System.Drawing.Size(98, 22);
            this.TotalFilesToRegister.TabIndex = 14;
            this.TotalFilesToRegister.Text = "0";
            this.TotalFilesToRegister.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 23);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(82, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Files Registered";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(112, 47);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(16, 13);
            this.label8.TabIndex = 12;
            this.label8.Text = "of";
            // 
            // registerProgress
            // 
            this.registerProgress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.registerProgress.Location = new System.Drawing.Point(90, 19);
            this.registerProgress.Name = "registerProgress";
            this.registerProgress.Size = new System.Drawing.Size(146, 20);
            this.registerProgress.TabIndex = 9;
            // 
            // linkProgress
            // 
            this.linkProgress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.linkProgress.Location = new System.Drawing.Point(93, 91);
            this.linkProgress.Name = "linkProgress";
            this.linkProgress.Size = new System.Drawing.Size(146, 20);
            this.linkProgress.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 25);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Types Linked";
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.LinkPercent);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.InitialLinksDone);
            this.groupBox3.Controls.Add(this.TotalInitialLinks);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Controls.Add(this.InitialLinkProgress);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.linkProgress);
            this.groupBox3.Location = new System.Drawing.Point(0, 232);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(242, 147);
            this.groupBox3.TabIndex = 14;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Graph Linking";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 98);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(85, 13);
            this.label3.TabIndex = 25;
            this.label3.Text = "Members Linked";
            // 
            // InitialLinksDone
            // 
            this.InitialLinksDone.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.InitialLinksDone.Location = new System.Drawing.Point(3, 57);
            this.InitialLinksDone.Name = "InitialLinksDone";
            this.InitialLinksDone.Size = new System.Drawing.Size(98, 22);
            this.InitialLinksDone.TabIndex = 24;
            this.InitialLinksDone.Text = "0";
            this.InitialLinksDone.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // TotalInitialLinks
            // 
            this.TotalInitialLinks.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TotalInitialLinks.Location = new System.Drawing.Point(138, 57);
            this.TotalInitialLinks.Name = "TotalInitialLinks";
            this.TotalInitialLinks.Size = new System.Drawing.Size(98, 22);
            this.TotalInitialLinks.TabIndex = 23;
            this.TotalInitialLinks.Text = "0";
            this.TotalInitialLinks.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(112, 62);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(16, 13);
            this.label11.TabIndex = 22;
            this.label11.Text = "of";
            // 
            // InitialLinkProgress
            // 
            this.InitialLinkProgress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.InitialLinkProgress.Location = new System.Drawing.Point(90, 25);
            this.InitialLinkProgress.Name = "InitialLinkProgress";
            this.InitialLinkProgress.Size = new System.Drawing.Size(146, 20);
            this.InitialLinkProgress.TabIndex = 21;
            // 
            // LinkPercent
            // 
            this.LinkPercent.Location = new System.Drawing.Point(141, 114);
            this.LinkPercent.Name = "LinkPercent";
            this.LinkPercent.Size = new System.Drawing.Size(34, 18);
            this.LinkPercent.TabIndex = 26;
            this.LinkPercent.Text = "of";
            this.LinkPercent.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // SourceUpdatePanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.output);
            this.Controls.Add(this.SuspendButton);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "SourceUpdatePanel";
            this.Size = new System.Drawing.Size(242, 525);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button SuspendButton;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label output;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ProgressBar ParseProgress;
        private System.Windows.Forms.Label newFiles;
        private System.Windows.Forms.Label emptyFiles;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ProgressBar registerProgress;
        private System.Windows.Forms.ProgressBar linkProgress;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label TotalFilesToRegister;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label filesRegistered;
        private System.Windows.Forms.Label InitialLinksDone;
        private System.Windows.Forms.Label TotalInitialLinks;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ProgressBar InitialLinkProgress;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label LinkPercent;
    }
}
