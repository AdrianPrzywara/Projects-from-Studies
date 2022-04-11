using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class Truck : Wehicle
    {
        private double capacity;
        public double Capacity
        {
            get { return capacity; }
            set { capacity = value; }
        }
        public Truck(double _weight,double _length, double _capacity) : base(_weight, _length)
        {
            capacity = _capacity;
        }
    }
}
