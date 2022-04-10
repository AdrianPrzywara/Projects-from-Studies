using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class Wehicle
    {
        private double weight;
        private double length;
        public double Weight
        {
            get { return weight; }
            set { weight = value; }
        }
        public double Length
        {
            get { return length; }
            set { length = value; }
        }
        public Wehicle(double _weight,double _length)
        {
            weight = _weight;
            length = _length;
        }
        public string Refuel()
        {
            return "Refueled";
        }
    }
}
