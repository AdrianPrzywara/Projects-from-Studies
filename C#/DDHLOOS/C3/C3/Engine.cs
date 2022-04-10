using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    class Engine
    {
        protected FuelTank tank;
        protected Waste waste;
        public Engine(FuelTank _tank,Waste _waste)
        {
            tank = _tank;
            waste = _waste;
        }
        public double GetVelocity(double submarineWeight)
        {
            return tank.CheckFuelMaterial() switch
            {
                "Diesel" => 20000 / submarineWeight * 5,
                "Nuclear" => 20000 / submarineWeight * 10,
                _ => -1,
            };
        }
        public bool CheckFuelBeforeTravel(double travelTime)
        {
            return ((tank.GetVolume() / tank.GetMaxCapacity()) > (travelTime / 148));
        }
        public void Travel(double travelTime)
        {
            if (CheckFuelBeforeTravel(travelTime))
            {
                tank.SetVolume(tank.GetVolume() - (tank.GetMaxCapacity() * (travelTime / 148)));
                waste.SetVolume(waste.GetVolume()+travelTime / 45);
            }
        }
    }
}
