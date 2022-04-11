using System;
using System.Collections.Generic;
using System.Text;

namespace State
{
    public class LiquidState : DropletState
    {
        private WaterDroplet waterDroplet;
        public LiquidState(WaterDroplet _waterDroplet)
        {
            waterDroplet = _waterDroplet;
            HeatCapacity = 20;
        }
        public override void Heat()
        {
            waterDroplet.ChangeState(new VaporState(waterDroplet));
        }
        public override void Cool()
        {
            waterDroplet.ChangeState(new IceState(waterDroplet));
        }
    }
}
