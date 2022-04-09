using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    class FuelTank : IVisitPort
    {
        protected double volume, weight;
        protected Fuel fuel;
        public double MaxCapacity { get; set; }
        public double Volume
        {
            get { return volume; }
            set
            {
                volume = value;
                weight = value * fuel.Density;
            }
        }
        public double Weight
        {
            get { return weight; }
            set
            {
                weight = value;
                volume = value / fuel.Density;
            }
        }
        public FuelTank(double capacity, Fuel _fuel)
        {
            MaxCapacity = capacity;
            fuel = _fuel;
        }
        public double GetMaxCapacity()
        {
            return MaxCapacity;
        }
        public string CheckFuelMaterial()
        {
            return fuel.GetMaterial();
        }

        public void SetVolume(double _volume)
        {
            Volume = _volume;
        }
        public double GetVolume()
        {
            return Volume;
        }
        public void SetWeight(double _weight)
        {
            Weight = _weight;
        }
        public double GetWeight()
        {
            return Weight;
        }
        public double VisitPort()
        {
            SetVolume(MaxCapacity);
            return 750;
        }
    }
}
