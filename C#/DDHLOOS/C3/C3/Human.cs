using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    abstract class Human : ITransportable
    {
        protected double volume, weight;
        public double Volume
        {
            get { return volume; }
            set
            {
                volume = value;
                weight = value * 0.1;
            }
        }
        public double Weight
        {
            get { return weight; }
            set
            {
                weight = value;
                volume = value / 0.1;
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
    }
}
