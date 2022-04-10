using System;
using System.Collections.Generic;
using System.Text;

namespace C3
{
    abstract class Fuel : ITransportable
    {

        protected double volume, weight;
        public string Material { get; set; }
        protected double density;
        public double Volume
        {
            get { return volume; }
            set
            {
                volume = value;
                weight = value * density;
            }
        }
        public double Weight
        {
            get { return weight; }
            set
            {
                weight = value;
                volume = value / density;
            }
        }
        public double Density { get { return density; } }
        public Fuel(string material, double den)
        {
            Material = material;
            density = den;
        }
        public string GetMaterial()
        {
            return Material;
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
