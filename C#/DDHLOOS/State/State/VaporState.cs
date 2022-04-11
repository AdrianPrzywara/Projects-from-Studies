using System;
using System.Collections.Generic;
using System.Text;

namespace State
{
    class VaporState : DropletState
    {
        private WaterDroplet waterDroplet;
        public VaporState(WaterDroplet _waterDroplet)
        {
            waterDroplet = _waterDroplet;
            HeatCapacity = 100;
        }
        public override void Heat()
        {
        }
        public override void Cool()
        {
            waterDroplet.ChangeState(new LiquidState(waterDroplet));
        }
    }
}
