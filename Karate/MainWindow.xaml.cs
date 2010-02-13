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
using Karate.Models;
using Karate.Data.Entities;

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
            dynamic spit = ruby.UseFile("spit.rb");

            rubyLabel.Content = spit.hello("bitch");

            var personModel = ruby.Globals.GetVariable("PersonModel");
            var p = ruby.Operations.CreateInstance(personModel);

            p.Name = "Stalin";

            var test = ruby.Globals.GetVariable("Test");
            var t = ruby.Operations.CreateInstance(test);

            t.notify = "TEST";

            var test2 = ruby.Globals.GetVariable("Test2");
            var t2 = ruby.Operations.CreateInstance(test2);

            t2.notify = "TEST";

            pythonLabel.DataContext = t2;

            spit.hibernate();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dynamic t = pythonLabel.DataContext;
            t.notify = "NOTIFIED!";
        }
    }
}
