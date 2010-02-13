using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public class Person : Entity
    {
        public virtual string Name { get; set; }
        public virtual string LastName { get; set; }
        public virtual DateTime BirthDate { get; set; }
        public virtual string Photo { get; set; }
    }
}
