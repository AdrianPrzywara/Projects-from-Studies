using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    class LifeSupportSystem
    {
        protected List<OxygenBottle> oxygenBottles;
        protected FoodContainer foodContainer;
        protected Waste waste;
        protected List<Human> crew;
        public LifeSupportSystem(List<OxygenBottle> bottles,FoodContainer container,Waste _waste,List<Human> _crew)
        {
            oxygenBottles = bottles;
            foodContainer = container;
            waste = _waste;
            crew = _crew;
        }
        public bool CheckSuppliesBeforeTravel(double travelTime)
        {
            double summaryOxygen = 0;
            foreach(OxygenBottle o in oxygenBottles) { summaryOxygen += o.GetVolume(); }
            return (((summaryOxygen / 1000) > (travelTime / 24)) && ((foodContainer.GetWeight() / 100) > (travelTime / 72)));
        }
        public void Run(double travelTime)
        {
            if (CheckSuppliesBeforeTravel(travelTime))
            {
                double summaryOxygen = travelTime / 24 * 1000;
                foreach(OxygenBottle o in oxygenBottles)
                {
                    if (summaryOxygen > 0)
                    {
                        if (o.GetVolume() < summaryOxygen)
                        {
                            summaryOxygen -= o.GetVolume();
                            o.SetVolume(0);
                        }
                        else
                        {
                            o.SetVolume(o.GetVolume() - summaryOxygen);
                            summaryOxygen = 0;
                        }
                    }
                }
                foodContainer.SetWeight(foodContainer.GetWeight() - travelTime / 72 * 100);
                waste.SetVolume(waste.GetVolume() + travelTime / 55);
            }
        }
    }
}
