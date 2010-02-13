using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Karate.Data.Entities
{
    public abstract class Entity
    {
        public virtual int Id { get; private set; }
    }
}
