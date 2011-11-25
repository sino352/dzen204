namespace PLC
{
    partial class Form1
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.TB_source_file = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.B_select_source_file = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.TB_dest_file = new System.Windows.Forms.TextBox();
            this.TB_server_ip = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.TB_server_port = new System.Windows.Forms.TextBox();
            this.B_parse = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // TB_source_file
            // 
            this.TB_source_file.Enabled = false;
            this.TB_source_file.Location = new System.Drawing.Point(106, 13);
            this.TB_source_file.Name = "TB_source_file";
            this.TB_source_file.Size = new System.Drawing.Size(232, 20);
            this.TB_source_file.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(87, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Исходный файл";
            // 
            // B_select_source_file
            // 
            this.B_select_source_file.Location = new System.Drawing.Point(344, 11);
            this.B_select_source_file.Name = "B_select_source_file";
            this.B_select_source_file.Size = new System.Drawing.Size(75, 23);
            this.B_select_source_file.TabIndex = 2;
            this.B_select_source_file.Text = "Выбрать";
            this.B_select_source_file.UseVisualStyleBackColor = true;
            this.B_select_source_file.Click += new System.EventHandler(this.B_select_source_file_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Конечный файл";
            // 
            // TB_dest_file
            // 
            this.TB_dest_file.Location = new System.Drawing.Point(106, 40);
            this.TB_dest_file.Name = "TB_dest_file";
            this.TB_dest_file.Size = new System.Drawing.Size(232, 20);
            this.TB_dest_file.TabIndex = 4;
            // 
            // TB_server_ip
            // 
            this.TB_server_ip.Location = new System.Drawing.Point(163, 77);
            this.TB_server_ip.Name = "TB_server_ip";
            this.TB_server_ip.Size = new System.Drawing.Size(85, 20);
            this.TB_server_ip.TabIndex = 5;
            this.TB_server_ip.Text = "192.168.0.1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 80);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(145, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Адрес локального сервера";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(254, 80);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(32, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Порт";
            // 
            // TB_server_port
            // 
            this.TB_server_port.Location = new System.Drawing.Point(292, 77);
            this.TB_server_port.Name = "TB_server_port";
            this.TB_server_port.Size = new System.Drawing.Size(46, 20);
            this.TB_server_port.TabIndex = 8;
            // 
            // B_parse
            // 
            this.B_parse.Location = new System.Drawing.Point(344, 53);
            this.B_parse.Name = "B_parse";
            this.B_parse.Size = new System.Drawing.Size(75, 44);
            this.B_parse.TabIndex = 9;
            this.B_parse.Text = "Обработать";
            this.B_parse.UseVisualStyleBackColor = true;
            this.B_parse.Click += new System.EventHandler(this.B_parse_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(427, 111);
            this.Controls.Add(this.B_parse);
            this.Controls.Add(this.TB_server_port);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.TB_server_ip);
            this.Controls.Add(this.TB_dest_file);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.B_select_source_file);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.TB_source_file);
            this.Name = "Form1";
            this.Text = "PLC";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.TextBox TB_source_file;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button B_select_source_file;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox TB_dest_file;
        private System.Windows.Forms.TextBox TB_server_ip;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox TB_server_port;
        private System.Windows.Forms.Button B_parse;
    }
}

