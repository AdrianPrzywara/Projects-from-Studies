using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public abstract class Decorator : Spaceship
    {
        protected Spaceship spaceship;
        public override int Attack
        {
            get { return spaceship.Attack; }
            set { spaceship.Attack = value; }
        }
        public override int Health
        {
            get { return spaceship.Health; }
            set { spaceship.Health = value; }
        }
        public Decorator(Spaceship _spaceship)
        {
            spaceship = _spaceship;
        }
        public override int GetNextAttack()
        {
            return spaceship.GetNextAttack();
        }
    }
}
