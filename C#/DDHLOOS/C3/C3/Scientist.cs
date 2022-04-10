using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    class Scientist : Human
    {
        protected Equipment equipment;
        public Scientist(Equipment _equipment)
        {
            equipment = _equipment;
        }
        public void Work(double time)
        {
            for(int i = 0; i < (time / 24.0); i++)
            {
                equipment.GatherData();
            }
        }
    }
}
