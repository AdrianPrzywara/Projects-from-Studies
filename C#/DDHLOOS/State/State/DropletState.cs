using System;
using System.Collections.Generic;
using System.Text;

namespace State
{
    public abstract class DropletState
    {
        public double HeatCapacity { get; set; }
        public abstract void Heat();
        public abstract void Cool();
    }
}
