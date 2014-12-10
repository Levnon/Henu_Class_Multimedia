using System;
using System.Collections.Generic;
using System.Linq;
using System.Speech.Synthesis;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TTSExample
{
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
        }

        private void StartRead_Click(object sender, RoutedEventArgs e)
        {
            SpeechSynthesizer s = new SpeechSynthesizer();
            s.Rate = (int)(speed.Value);
            s.SpeakAsync(textInputer.Text);
        }
    }
}
