using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public class Round : Entity
    {
        public virtual int Number { get; set; }
        public virtual IList<Match> Matches { get; private set; }

        public Round()
        {
            Matches = new List<Match>();
        }
    }
}
