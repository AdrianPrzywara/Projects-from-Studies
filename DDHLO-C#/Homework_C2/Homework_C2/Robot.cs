using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C2
{
    abstract class Robot
    {
        private string type;
        public Robot(string _type)
        {
            type = _type;
        }
        public int AnnualCost()
        {
            return type switch
            {
                "Computer" => 200,
                "MechanicalRobot" => 300,
                _ => -1,
            };
        }
    }
}
