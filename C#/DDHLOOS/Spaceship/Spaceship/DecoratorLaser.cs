using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class DecoratorLaser : Decorator
    {
        public DecoratorLaser(Spaceship spaceship) : base(spaceship)
        {
            spaceship.Attack += 50;
        }
        public override string Type()
        {
            return (spaceship.Type() + "-laser");
        }
    }
}
