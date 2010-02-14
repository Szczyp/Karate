using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using Cinch;
using Karate.Data.Entities;

namespace Karate.Models
{
    public class PersonModel : EditableValidatingObject
    {

        #region Property Test
        static readonly PropertyChangedEventArgs testChangeArgs = ObservableHelper.CreateArgs<PersonModel>(x => x.Test);
        
        private DataWrapper<string> test;
        
        public DataWrapper<string> Test
        {
            get { return test; }
            private set
            {
                if (test == value) return;
                test = value;
                NotifyPropertyChanged(testChangeArgs);
            }
        }
        #endregion

        public PersonModel()
        {
            Test = new DataWrapper<string>(this, testChangeArgs);
        }

    }
}
