using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public class Tourney : Entity
    {
        public virtual string Name { get; set; }
        public virtual DateTime Date { get; set; }
        public virtual string Address { get; set; }

        public virtual IList<Person> Persons { get; private set; }

        public Tourney()
        {
            Persons = new List<Person>();
        }
    }
}
