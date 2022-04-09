using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    class SpaceshipExtraCannon : Spaceship
    {
        // spaceship with an extra cannon - 30% chance to fire another attack
        public override int GetNextAttack()
        {
            Random RNG = new Random();
            if (RNG.Next(10) < 7) return base.GetNextAttack();
            else return base.GetNextAttack() + base.GetNextAttack();
        }
        public override string Type()
        {
            return "spaceship-cannon";
        }
    }
}
