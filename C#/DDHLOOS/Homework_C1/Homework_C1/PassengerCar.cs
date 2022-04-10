using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class PassengerCar : Wehicle
    {
        private int numberOfSeats;
        public int NumberOfSeats
        {
            get { return numberOfSeats; }
            set { numberOfSeats = value; }
        }
        public PassengerCar(double _weight, double _length , int _numberOfSeats) : base(_weight, _length)
        {
            numberOfSeats = _numberOfSeats;
        }
        public string OpenTrunk()
        {
            return "Trunk Opened";
        }
    }
}
