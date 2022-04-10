using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public abstract class Spaceship
    {
        public virtual int Attack { get; set; } = 100;
        public virtual int Health { get; set; } = 300;
        public virtual int GetNextAttack()
        {
            return Attack;
        }
        public virtual string Type()
        {
            return "spaceship";
        }
    }
}
