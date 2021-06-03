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
            this.SuspendLayout();
            // 
            // fileNameLabel
            // 
            this.fileNameLabel.AutoSize = true;
            this.fileNameLabel.Location = new System.Drawing.Point(3, 16);
            this.fileNameLabel.Name = "fileNameLabel";
            this.fileNameLabel.Size = new System.Drawing.Size(52, 13);
            this.fileNameLabel.TabIndex = 0;
            this.fileNameLabel.Text = "File name";
            // 
            // FileText
            // 
            this.FileText.Location = new System.Drawing.Point(72, 13);
            this.FileText.Name = "FileText";
            this.FileText.Size = new System.Drawing.Size(136, 20);
            this.FileText.TabIndex = 1;
            // 
            // fileOverwrite
            // 
            this.fileOverwrite.AutoSize = true;
            this.fileOverwrite.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fileOverwrite.ForeColor = System.Drawing.Color.Red;
            this.fileOverwrite.Location = new System.Drawing.Point(58, 16);
            this.fileOverwrite.Name = "fileOverwrite";
            this.fileOverwrite.Size = new System.Drawing.Size(11, 13);
            this.fileOverwrite.TabIndex = 3;
            this.fileOverwrite.Text = "!";
            // 
            // ModuleButton
            // 
            this.ModuleButton.Location = new System.Drawing.Point(29, 224);
            this.ModuleButton.Name = "ModuleButton";
            this.ModuleButton.Size = new System.Drawing.Size(142, 22);
            this.ModuleButton.TabIndex = 4;
            this.ModuleButton.Text = "Create Module Graph";
            this.ModuleButton.UseVisualStyleBackColor = true;
            this.ModuleButton.Click += new System.EventHandler(this.ModuleButton_Click);
            // 
            // output
            // 
            this.output.Location = new System.Drawing.Point(6, 36);
            this.output.Name = "output";
            this.output.Size = new System.Drawing.Size(202, 40);
            this.output.TabIndex = 5;
            this.output.Text = "label1";
            this.output.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // csvCheckBox
            // 
            this.csvCheckBox.AutoSize = true;
            this.csvCheckBox.Location = new System.Drawing.Point(8, 69);
            this.csvCheckBox.Margin = new System.Windows.Forms.Padding(2);
            this.csvCheckBox.Name = "csvCheckBox";
            this.csvCheckBox.Size = new System.Drawing.Size(110, 17);
            this.csvCheckBox.TabIndex = 6;
            this.csvCheckBox.Text = "CSV Input File(s)?";
            this.csvCheckBox.UseVisualStyleBackColor = true;
            this.csvCheckBox.CheckedChanged += new System.EventHandler(this.csvCheckBox_CheckedChanged);
            // 
            // filePathTextBox
            // 
            this.filePathTextBox.Location = new System.Drawing.Point(8, 91);
            this.filePathTextBox.Margin = new System.Windows.Forms.Padding(2);
            this.filePathTextBox.Multiline = true;
            this.filePathTextBox.Name = "filePathTextBox";
            this.filePathTextBox.ReadOnly = true;
            this.filePathTextBox.Size = new System.Drawing.Size(189, 85);
            this.filePathTextBox.TabIndex = 7;
            this.filePathTextBox.Visible = false;
            // 
            // browseButton
            // 
            this.browseButton.Location = new System.Drawing.Point(8, 194);
            this.browseButton.Margin = new System.Windows.Forms.Padding(2);
            this.browseButton.Name = "browseButton";
            this.browseButton.Size = new System.Drawing.Size(70, 24);
            this.browseButton.TabIndex = 8;
            this.browseButton.Text = "Browse";
            this.browseButton.UseVisualStyleBackColor = true;
            this.browseButton.Visible = false;
            this.browseButton.Click += new System.EventHandler(this.browseButton_Click);
            // 
            // formatExample
            // 
            this.formatExample.AutoSize = true;
            this.formatExample.Location = new System.Drawing.Point(6, 178);
            this.formatExample.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.formatExample.Name = "formatExample";
            this.formatExample.Size = new System.Drawing.Size(166, 13);
            this.formatExample.TabIndex = 9;
            this.formatExample.Text = "Format: file, line, error, property, ...";
            this.formatExample.Visible = false;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // MetricPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.formatExample);
            this.Controls.Add(this.browseButton);
            this.Controls.Add(this.filePathTextBox);
            this.Controls.Add(this.csvCheckBox);
            this.Controls.Add(this.output);
            this.Controls.Add(this.ModuleButton);
            this.Controls.Add(this.fileOverwrite);
            this.Controls.Add(this.FileText);
            this.Controls.Add(this.fileNameLabel);
            this.Name = "MetricPanel";
            this.Size = new System.Drawing.Size(211, 409);
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
    }
}
