using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class Bus : Wehicle
    {
        private int passengerLimit;
        public int PassengerLimit
        {
            get { return passengerLimit; }
            set { passengerLimit = value; }
        }
        public Bus(double _weight, double _length, int _passengerLimit) : base(_weight, _length)
        {
            passengerLimit = _passengerLimit;
        }
        public string OpenDoors()
        {
            return "Doors Opened";
        }
    }
}
