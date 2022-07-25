namespace SoftwareAnalyzer2.GUI.AnaylsisForms
{
    partial class MetricPanel
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
            this.fileNameLabel = new System.Windows.Forms.Label();
            this.FileText = new System.Windows.Forms.TextBox();
            this.fileOverwrite = new System.Windows.Forms.Label();
            this.ModuleButton = new System.Windows.Forms.Button();
            this.output = new System.Windows.Forms.Label();
            this.csvCheckBox = new System.Windows.Forms.CheckBox();
            this.filePathTextBox = new System.Windows.Forms.TextBox();
            this.browseButton = new System.Windows.Forms.Button();
            this.formatExample = new System.Windows.Forms.Label();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.criticalBrowseButton = new System.Windows.Forms.Button();
            this.criticalFilePathTextBox = new System.Windows.Forms.TextBox();
            this.criticalFormatExample = new System.Windows.Forms.Label();
            this.CriticalcheckBox1 = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // fileNameLabel
            // 
            this.fileNameLabel.AutoSize = true;
            this.fileNameLabel.Location = new System.Drawing.Point(4, 20);
            this.fileNameLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.fileNameLabel.Name = "fileNameLabel";
            this.fileNameLabel.Size = new System.Drawing.Size(69, 17);
            this.fileNameLabel.TabIndex = 0;
            this.fileNameLabel.Text = "File name";
            // 
            // FileText
            // 
            this.FileText.Location = new System.Drawing.Point(96, 16);
            this.FileText.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.FileText.Name = "FileText";
            this.FileText.Size = new System.Drawing.Size(180, 22);
            this.FileText.TabIndex = 1;
            // 
            // fileOverwrite
            // 
            this.fileOverwrite.AutoSize = true;
            this.fileOverwrite.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fileOverwrite.ForeColor = System.Drawing.Color.Red;
            this.fileOverwrite.Location = new System.Drawing.Point(77, 20);
            this.fileOverwrite.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.fileOverwrite.Name = "fileOverwrite";
            this.fileOverwrite.Size = new System.Drawing.Size(12, 17);
            this.fileOverwrite.TabIndex = 3;
            this.fileOverwrite.Text = "!";
            // 
            // ModuleButton
            // 
            this.ModuleButton.Location = new System.Drawing.Point(40, 450);
            this.ModuleButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ModuleButton.Name = "ModuleButton";
            this.ModuleButton.Size = new System.Drawing.Size(189, 27);
            this.ModuleButton.TabIndex = 4;
            this.ModuleButton.Text = "Create Module Graph";
            this.ModuleButton.UseVisualStyleBackColor = true;
            this.ModuleButton.Click += new System.EventHandler(this.ModuleButton_Click);
            // 
            // output
            // 
            this.output.Location = new System.Drawing.Point(8, 44);
            this.output.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.output.Name = "output";
            this.output.Size = new System.Drawing.Size(269, 21);
            this.output.TabIndex = 5;
            this.output.Text = "label1";
            this.output.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // csvCheckBox
            // 
            this.csvCheckBox.AutoSize = true;
            this.csvCheckBox.Location = new System.Drawing.Point(8, 68);
            this.csvCheckBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.csvCheckBox.Name = "csvCheckBox";
            this.csvCheckBox.Size = new System.Drawing.Size(143, 21);
            this.csvCheckBox.TabIndex = 6;
            this.csvCheckBox.Text = "CSV Input File(s)?";
            this.csvCheckBox.UseVisualStyleBackColor = true;
            this.csvCheckBox.CheckedChanged += new System.EventHandler(this.csvCheckBox_CheckedChanged);
            // 
            // filePathTextBox
            // 
            this.filePathTextBox.Location = new System.Drawing.Point(12, 94);
            this.filePathTextBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.filePathTextBox.Multiline = true;
            this.filePathTextBox.Name = "filePathTextBox";
            this.filePathTextBox.ReadOnly = true;
            this.filePathTextBox.Size = new System.Drawing.Size(251, 104);
            this.filePathTextBox.TabIndex = 7;
            this.filePathTextBox.Visible = false;
            // 
            // browseButton
            // 
            this.browseButton.Location = new System.Drawing.Point(8, 219);
            this.browseButton.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.browseButton.Name = "browseButton";
            this.browseButton.Size = new System.Drawing.Size(93, 30);
            this.browseButton.TabIndex = 8;
            this.browseButton.Text = "Browse";
            this.browseButton.UseVisualStyleBackColor = true;
            this.browseButton.Visible = false;
            this.browseButton.Click += new System.EventHandler(this.browseButton_Click);
            // 
            // formatExample
            // 
            this.formatExample.AutoSize = true;
            this.formatExample.Location = new System.Drawing.Point(8, 201);
            this.formatExample.Name = "formatExample";
            this.formatExample.Size = new System.Drawing.Size(228, 17);
            this.formatExample.TabIndex = 9;
            this.formatExample.Text = "Format: file, line, error, property, ...";
            this.formatExample.Visible = false;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // criticalBrowseButton
            // 
            this.criticalBrowseButton.Location = new System.Drawing.Point(8, 405);
            this.criticalBrowseButton.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.criticalBrowseButton.Name = "criticalBrowseButton";
            this.criticalBrowseButton.Size = new System.Drawing.Size(93, 30);
            this.criticalBrowseButton.TabIndex = 10;
            this.criticalBrowseButton.Text = "Browse";
            this.criticalBrowseButton.UseVisualStyleBackColor = true;
            this.criticalBrowseButton.Visible = false;
            this.criticalBrowseButton.Click += new System.EventHandler(this.criticalBrowseButton_Click);
            // 
            // criticalFilePathTextBox
            // 
            this.criticalFilePathTextBox.Location = new System.Drawing.Point(12, 279);
            this.criticalFilePathTextBox.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.criticalFilePathTextBox.Multiline = true;
            this.criticalFilePathTextBox.Name = "criticalFilePathTextBox";
            this.criticalFilePathTextBox.ReadOnly = true;
            this.criticalFilePathTextBox.Size = new System.Drawing.Size(251, 104);
            this.criticalFilePathTextBox.TabIndex = 11;
            this.criticalFilePathTextBox.Visible = false;
            this.criticalFilePathTextBox.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // criticalFormatExample
            // 
            this.criticalFormatExample.AutoSize = true;
            this.criticalFormatExample.Location = new System.Drawing.Point(8, 386);
            this.criticalFormatExample.Name = "criticalFormatExample";
            this.criticalFormatExample.Size = new System.Drawing.Size(228, 17);
            this.criticalFormatExample.TabIndex = 12;
            this.criticalFormatExample.Text = "Format: file, line, error, property, ...";
            this.criticalFormatExample.Visible = false;
            // 
            // CriticalcheckBox1
            // 
            this.CriticalcheckBox1.AutoSize = true;
            this.CriticalcheckBox1.Location = new System.Drawing.Point(8, 254);
            this.CriticalcheckBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CriticalcheckBox1.Name = "CriticalcheckBox1";
            this.CriticalcheckBox1.Size = new System.Drawing.Size(200, 21);
            this.CriticalcheckBox1.TabIndex = 13;
            this.CriticalcheckBox1.Text = "Critical Security Functions?";
            this.CriticalcheckBox1.UseVisualStyleBackColor = true;
            this.CriticalcheckBox1.Visible = false;
            this.CriticalcheckBox1.CheckedChanged += new System.EventHandler(this.CriticalcheckBox1_CheckedChanged);
            this.CriticalcheckBox1.Click += new System.EventHandler(this.criticalCsvCheckBox_CheckedChanged);
            // 
            // MetricPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.CriticalcheckBox1);
            this.Controls.Add(this.criticalFormatExample);
            this.Controls.Add(this.criticalFilePathTextBox);
            this.Controls.Add(this.criticalBrowseButton);
            this.Controls.Add(this.formatExample);
            this.Controls.Add(this.browseButton);
            this.Controls.Add(this.filePathTextBox);
            this.Controls.Add(this.csvCheckBox);
            this.Controls.Add(this.output);
            this.Controls.Add(this.ModuleButton);
            this.Controls.Add(this.fileOverwrite);
            this.Controls.Add(this.FileText);
            this.Controls.Add(this.fileNameLabel);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "MetricPanel";
            this.Size = new System.Drawing.Size(281, 503);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label fileNameLabel;
        private System.Windows.Forms.TextBox FileText;
        private System.Windows.Forms.Label fileOverwrite;
        private System.Windows.Forms.Button ModuleButton;
        private System.Windows.Forms.Label output;
        private System.Windows.Forms.CheckBox csvCheckBox;
        private System.Windows.Forms.TextBox filePathTextBox;
        private System.Windows.Forms.Button browseButton;
        private System.Windows.Forms.Label formatExample;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button criticalBrowseButton;
        private System.Windows.Forms.TextBox criticalFilePathTextBox;
        private System.Windows.Forms.Label criticalFormatExample;
        private System.Windows.Forms.CheckBox CriticalcheckBox1;
    }
}
