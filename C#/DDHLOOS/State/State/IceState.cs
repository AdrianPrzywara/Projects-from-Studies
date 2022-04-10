using System;
using System.Collections.Generic;
using System.Text;

namespace State
{
    class IceState : DropletState
    {
        private WaterDroplet waterDroplet;
        public IceState(WaterDroplet _waterDroplet)
        {
            waterDroplet = _waterDroplet;
            HeatCapacity = 0;
        }
        public override void Heat()
        {
            waterDroplet.ChangeState(new LiquidState(waterDroplet));
        }
        public override void Cool()
        {
        }
    }
}
