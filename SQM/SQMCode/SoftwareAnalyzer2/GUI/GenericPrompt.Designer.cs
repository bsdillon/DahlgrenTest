namespace SoftwareAnalyzer2.GUI
{
    partial class GenericPrompt
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
            this.OKButton1 = new System.Windows.Forms.Button();
            this.prompt = new System.Windows.Forms.Label();
            this.response = new System.Windows.Forms.TextBox();
            this.Cancel_Button = new System.Windows.Forms.Button();
            this.OKButton2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // OKButton1
            // 
            this.OKButton1.Enabled = false;
            this.OKButton1.Location = new System.Drawing.Point(14, 76);
            this.OKButton1.Name = "OKButton1";
            this.OKButton1.Size = new System.Drawing.Size(75, 23);
            this.OKButton1.TabIndex = 0;
            this.OKButton1.Text = "OK";
            this.OKButton1.UseVisualStyleBackColor = true;
            this.OKButton1.Click += new System.EventHandler(this.closeClick);
            // 
            // prompt
            // 
            this.prompt.Location = new System.Drawing.Point(12, 9);
            this.prompt.Name = "prompt";
            this.prompt.Size = new System.Drawing.Size(240, 38);
            this.prompt.TabIndex = 1;
            this.prompt.Text = "label1";
            this.prompt.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // response
            // 
            this.response.Location = new System.Drawing.Point(12, 50);
            this.response.Name = "response";
            this.response.Size = new System.Drawing.Size(240, 20);
            this.response.TabIndex = 2;
            this.response.TextChanged += new System.EventHandler(this.response_TextChanged);
            // 
            // Cancel_Button
            // 
            this.Cancel_Button.Enabled = false;
            this.Cancel_Button.Location = new System.Drawing.Point(176, 76);
            this.Cancel_Button.Name = "Cancel_Button";
            this.Cancel_Button.Size = new System.Drawing.Size(75, 23);
            this.Cancel_Button.TabIndex = 3;
            this.Cancel_Button.Text = "Cancel";
            this.Cancel_Button.UseVisualStyleBackColor = true;
            this.Cancel_Button.Click += new System.EventHandler(this.closeClick);
            // 
            // OKButton2
            // 
            this.OKButton2.Enabled = false;
            this.OKButton2.Location = new System.Drawing.Point(95, 76);
            this.OKButton2.Name = "OKButton2";
            this.OKButton2.Size = new System.Drawing.Size(75, 23);
            this.OKButton2.TabIndex = 4;
            this.OKButton2.Text = "OK";
            this.OKButton2.UseVisualStyleBackColor = true;
            this.OKButton2.Click += new System.EventHandler(this.closeClick);
            // 
            // GenericPrompt
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(264, 105);
            this.ControlBox = false;
            this.Controls.Add(this.OKButton2);
            this.Controls.Add(this.Cancel_Button);
            this.Controls.Add(this.response);
            this.Controls.Add(this.prompt);
            this.Controls.Add(this.OKButton1);
            this.Name = "GenericPrompt";
            this.Text = "GenericPrompt";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button OKButton1;
        private System.Windows.Forms.Label prompt;
        private System.Windows.Forms.TextBox response;
        private System.Windows.Forms.Button Cancel_Button;
        private System.Windows.Forms.Button OKButton2;
    }
}