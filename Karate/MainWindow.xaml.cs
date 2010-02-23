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
            dynamic scope = ruby.UseFile("view_model.rb");

            var view_model = ruby.Operations.CreateInstance(ruby.Globals.GetVariable("AddEditPersonViewModel"));
            var person_model = ruby.Operations.CreateInstance(ruby.Globals.GetVariable("PersonModel"));

            view_model.current_person = person_model;
            person_model.name.data_value = "Hitler";
            person_model.address.data_value = "Berlin";

            this.DataContext = view_model;
            label.DataContext = person_model;
        }
    }
}
