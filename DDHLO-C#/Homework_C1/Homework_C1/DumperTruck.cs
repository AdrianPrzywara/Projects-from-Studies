using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class DumperTruck : Truck
    {
        private string typeOfCargo;
        public string TypeOfCargo
        {
            get { return typeOfCargo; }
            set { typeOfCargo = value; }
        }
        public DumperTruck(double _weight, double _length, double _capacity, string _typeOfCargo) : 
            base(_weight, _length, _capacity)
        {
            typeOfCargo = _typeOfCargo;
        }
        public string DumpCargo()
        {
            typeOfCargo = "None";
            return "Cargo Dumped";
        }
    }
}
