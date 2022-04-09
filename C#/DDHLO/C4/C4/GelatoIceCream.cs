using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class GelatoIceCream : IceCream
    {
        private bool waffle;
        private bool chocolateSprinkles;
        public bool Waffle { get { return waffle; } }
        public bool ChocolateSprinkles { get { return chocolateSprinkles; } }
        public GelatoIceCream(int _price, string _mainFlavor, bool _waffle, bool _chocolateSprinkles) :
            base(_price, _mainFlavor)
        {
            waffle = _waffle;
            chocolateSprinkles = _chocolateSprinkles;
        }
    }
}
