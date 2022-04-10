using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    class FoodContainer : IVisitPort
    {
        protected double volume, weight;
        public double MaxCapacity { get; set; }
        public FoodContainer(double capacity)
        {
            MaxCapacity = capacity;
        }
        public double GetMaxCapacity()
        {
            return MaxCapacity;
        }
        public double Volume
        {
            get { return volume; }
            set
            {
                volume = value;
                weight = value * 6;
            }
        }
        public double Weight
        {
            get { return weight; }
            set
            {
                weight = value;
                volume = value / 6;
            }
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
            return 550;
        }
    }
}
