using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class DecoratorMachineLearning : Decorator
    {
        public DecoratorMachineLearning(Spaceship spaceship) : base(spaceship) { }
        public override int GetNextAttack()
        {
            spaceship.Attack += 25;
            return spaceship.GetNextAttack();
        }
        public override string Type()
        {
            return (spaceship.Type() + "-AI");
        }
    }
}
