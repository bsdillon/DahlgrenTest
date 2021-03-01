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
            this.ModuleButton.Location = new System.Drawing.Point(31, 79);
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
            // MetricPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
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
    }
}
