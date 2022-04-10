using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class Tank : Truck
    {
        private string substanceType;
        private string substanceSafety;
        public string SubstanceType
        {
            get { return substanceType; }
            set { substanceType = value; }
        }
        public string SubstanceSafety
        {
            get { return substanceSafety; }
            set { substanceSafety = value; }
        }
        public Tank(double _weight, double _length, double _capacity, string _substanceType, string _substanceSafety):
            base(_weight, _length, _capacity)
        {
            substanceType = _substanceType;
            substanceSafety = _substanceSafety;
        }
    }
}
