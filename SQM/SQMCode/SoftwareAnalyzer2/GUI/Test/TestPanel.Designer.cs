namespace SoftwareAnalyzer2.GUI.Test
{
    partial class TestPanel
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
            this.TestButton = new System.Windows.Forms.Button();
            this.testProgress = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // TestButton
            // 
            this.TestButton.Location = new System.Drawing.Point(84, 20);
            this.TestButton.Name = "TestButton";
            this.TestButton.Size = new System.Drawing.Size(75, 23);
            this.TestButton.TabIndex = 0;
            this.TestButton.Text = "Run test";
            this.TestButton.UseVisualStyleBackColor = true;
            this.TestButton.Click += new System.EventHandler(this.TestButton_Click);
            // 
            // testProgress
            // 
            this.testProgress.Location = new System.Drawing.Point(47, 61);
            this.testProgress.Name = "testProgress";
            this.testProgress.Size = new System.Drawing.Size(141, 16);
            this.testProgress.TabIndex = 1;
            // 
            // TestPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.testProgress);
            this.Controls.Add(this.TestButton);
            this.Name = "TestPanel";
            this.Size = new System.Drawing.Size(236, 396);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button TestButton;
        private System.Windows.Forms.ProgressBar testProgress;
    }
}
