using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public class Match : Entity
    {
        public virtual int Number { get; set; }
        public virtual Person Host { get; set; }
        public virtual Person Guest { get; set; }
        public virtual string Result { get; set; }
    }
}
