using System;
using System.Collections.Generic;
using System.Text;

namespace State
{
    public class WaterDroplet
    {
        // the current droplet state is stored here
        private DropletState currentState; 
	

        // constructor
        public WaterDroplet()
        {
			// we start in the liquid state 
			// keyword "this" means that this particular WaterDroplet object should be also used as the constructor argument
            currentState = new LiquidState(this); 
        }

        // a method to change one state to another
        public void ChangeState(DropletState newState) 
        {
            currentState = newState;
        }
		
		// a method to check the current heat capacity
		public double GetHeatCapacity()
		{
			return currentState.HeatCapacity;
		}

        // methods to increase or decrease the temperature of the droplet
        public void Heat()
        {
            currentState.Heat();
        }
        public void Cool()
        {
            currentState.Cool();
        }
		
    }
}
