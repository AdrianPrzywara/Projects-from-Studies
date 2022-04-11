using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class DecoratorExtraCannon : Decorator
    {
        public DecoratorExtraCannon(Spaceship spaceship) : base(spaceship) { }
        public override int GetNextAttack()
        {
            Random RNG = new Random();
            if (RNG.Next(10) < 7) return spaceship.GetNextAttack();
            else return spaceship.GetNextAttack() + spaceship.GetNextAttack();
        }
        public override string Type()
        {
            return (spaceship.Type() + "-cannon");
        }
    }
}
