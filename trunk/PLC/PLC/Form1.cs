using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;

using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Text.RegularExpressions;


namespace PLC
{
    public partial class Form1 : Form
    {
        bool source_file_selected;

        public Form1()
        {
            source_file_selected = false;
            InitializeComponent();
        }

        private void B_select_source_file_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Список воспроизведения *.m3u|*.m3u|Any files*.*|*.*";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                TB_source_file.Text = ofd.FileName;
                TB_dest_file.Text = ofd.FileName;
                TB_dest_file.Text.Trim();
                TB_dest_file.Text = Regex.Replace(TB_dest_file.Text, @"(.m3u$)", "_new.m3u");

                source_file_selected = true;
            }
        }

        private void B_parse_Click(object sender, EventArgs e)
        {
            //проверка был ли выбран файл
            if (!source_file_selected)
            {
                MessageBox.Show("Не выбран исходный файл");
                return;
            }

            //проверка валидности ип адреса
            TB_server_ip.Text = Regex.Replace(TB_server_ip.Text, @",", ".");
            TB_server_ip.Text.Trim();
            if (!Regex.IsMatch(TB_server_ip.Text, @"^([0-9]{1,3}.){3}[0-9]{1,3}$"))
            {
                MessageBox.Show("Не правильно указан IP адрес сервера");
                return;
            }

            //проверка валидности порта
            TB_server_port.Text.Trim();
            if (!Regex.IsMatch(TB_server_port.Text, @"^[0-9]{1,5}$"))
            {
                MessageBox.Show("Не правильно указан порт сервера");
                return;
            }

            

            string text = "";
            //попытка чтения содержимого файла
            try
            {
                text = File.ReadAllText(TB_source_file.Text);
            }
            catch (Exception ee)
            {
                MessageBox.Show(ee.Message);
                return;
            }
            
            //обработка файла
            text = Regex.Replace(text, @"udp://@", "http://" + TB_server_ip.Text + ":" + TB_server_port.Text + "/udp/");

            //попытка записи в конечный файл
            try
            {
                File.WriteAllText(TB_dest_file.Text, text);

            }
            catch (Exception ee)
            {
                MessageBox.Show(ee.Message);
                return;
            }

            MessageBox.Show("Обработка завершена успешно");
        }


    } //class
} //namespace
