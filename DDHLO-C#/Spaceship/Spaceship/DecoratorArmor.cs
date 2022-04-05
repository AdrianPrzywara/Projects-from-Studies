using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class DecoratorArmor : Decorator
    {
        public DecoratorArmor(Spaceship spaceship) : base(spaceship)
        {
            spaceship.Health += 150;
        }
        public override string Type()
        {
            return (spaceship.Type() + "-armor");
        }

    }
}
