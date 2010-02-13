using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public class Stage : Entity
    {
        public virtual int Number { get; set; }
        public virtual string Name { get; set; }
        public virtual IList<Round> Rounds { get; private set; }

        public Stage()
        {
            Rounds = new List<Round>();
        }
    }
}
