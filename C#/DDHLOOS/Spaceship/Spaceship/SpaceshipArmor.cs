using System;
using System.Collections.Generic;
using System.Text;

namespace Spaceship
{
    public class SpaceshipArmor : Spaceship
    {
        // spaceship with additional armor - more health points
        public SpaceshipArmor() : base()
        {
            Health += 150;
        }
        public override string Type()
        {
            return "spaceship-armor";
        }

    }
}
