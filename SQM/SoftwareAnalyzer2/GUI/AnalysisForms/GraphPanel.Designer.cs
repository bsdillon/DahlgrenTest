namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    partial class GraphPanel
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
            this.SaveFileButton = new System.Windows.Forms.Button();
            this.fileNameLabel = new System.Windows.Forms.Label();
            this.fileName = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.fileOverwrite = new System.Windows.Forms.Label();
            this.KnowledgeBox = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // SaveFileButton
            // 
            this.SaveFileButton.Enabled = false;
            this.SaveFileButton.Location = new System.Drawing.Point(19, 152);
            this.SaveFileButton.Name = "SaveFileButton";
            this.SaveFileButton.Size = new System.Drawing.Size(75, 23);
            this.SaveFileButton.TabIndex = 0;
            this.SaveFileButton.Text = "WriteFile";
            this.SaveFileButton.UseVisualStyleBackColor = true;
            this.SaveFileButton.Click += new System.EventHandler(this.SaveFile_Click);
            // 
            // fileNameLabel
            // 
            this.fileNameLabel.AutoSize = true;
            this.fileNameLabel.Location = new System.Drawing.Point(6, 20);
            this.fileNameLabel.Name = "fileNameLabel";
            this.fileNameLabel.Size = new System.Drawing.Size(52, 13);
            this.fileNameLabel.TabIndex = 1;
            this.fileNameLabel.Text = "File name";
            // 
            // fileName
            // 
            this.fileName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.fileName.Location = new System.Drawing.Point(74, 17);
            this.fileName.Name = "fileName";
            this.fileName.Size = new System.Drawing.Size(180, 20);
            this.fileName.TabIndex = 2;
            this.fileName.TextChanged += new System.EventHandler(this.fileName_TextChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.KnowledgeBox);
            this.groupBox1.Location = new System.Drawing.Point(19, 43);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(235, 103);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "groupBox1";
            // 
            // fileOverwrite
            // 
            this.fileOverwrite.AutoSize = true;
            this.fileOverwrite.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fileOverwrite.ForeColor = System.Drawing.Color.Red;
            this.fileOverwrite.Location = new System.Drawing.Point(61, 20);
            this.fileOverwrite.Name = "fileOverwrite";
            this.fileOverwrite.Size = new System.Drawing.Size(11, 13);
            this.fileOverwrite.TabIndex = 4;
            this.fileOverwrite.Text = "!";
            this.fileOverwrite.Visible = false;
            // 
            // KnowledgeBox
            // 
            this.KnowledgeBox.AutoSize = true;
            this.KnowledgeBox.Location = new System.Drawing.Point(6, 19);
            this.KnowledgeBox.Name = "KnowledgeBox";
            this.KnowledgeBox.Size = new System.Drawing.Size(140, 17);
            this.KnowledgeBox.TabIndex = 0;
            this.KnowledgeBox.Text = "Include knowledge links";
            this.KnowledgeBox.UseVisualStyleBackColor = true;
            // 
            // GraphPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.fileOverwrite);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.fileName);
            this.Controls.Add(this.fileNameLabel);
            this.Controls.Add(this.SaveFileButton);
            this.Name = "GraphPanel";
            this.Size = new System.Drawing.Size(272, 547);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button SaveFileButton;
        private System.Windows.Forms.Label fileNameLabel;
        private System.Windows.Forms.TextBox fileName;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label fileOverwrite;
        private System.Windows.Forms.CheckBox KnowledgeBox;
    }
}
