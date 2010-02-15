using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

using Microsoft.Scripting.Hosting;
using IronRuby;

using NHibernate;
using Karate.Data;
using Karate.Data.Entities;
using IronRuby.Builtins;
using Cinch;


namespace Karate
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            var ruby = Ruby.CreateRuntime();
            dynamic model = ruby.UseFile("model.rb");

            var personModel = ruby.Globals.GetVariable("PersonModel");
            var p = ruby.Operations.CreateInstance(personModel);

            rubyLabel.DataContext = p;
            pythonLabel.DataContext = p;
            list.DataContext = p;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dynamic p = pythonLabel.DataContext;
            p.name.data_value = MutableString.Create("NOTIFIED!", RubyEncoding.Default);
        }
    }
}
