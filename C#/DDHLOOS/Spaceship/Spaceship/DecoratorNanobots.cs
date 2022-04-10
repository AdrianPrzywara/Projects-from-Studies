using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class DecoratorNanobots : Decorator
    {
        public DecoratorNanobots(Spaceship spaceship) : base(spaceship) { }
        public override int GetNextAttack()
        {
            spaceship.Health += 50;
            return spaceship.GetNextAttack();
        }
        public override string Type()
        {
            return (spaceship.Type() + "-nanobots");
        }
    }
}
