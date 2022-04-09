using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class RegularIceCream : IceCream
    {
        private bool waffle;
        private string toppingFlavor;
        private bool chocolateSprinkles;
        public bool Waffle { get { return waffle; } }
        public string ToppingFlavor { get { return toppingFlavor; } }
        public bool ChocolateSprinkles { get { return chocolateSprinkles; } }
        public RegularIceCream(int _price,string _mainFlavor,bool _waffle, string _toppingFlavor, bool _chocolateSprinkles):
            base(_price, _mainFlavor)
        {
            waffle = _waffle;
            toppingFlavor = _toppingFlavor;
            chocolateSprinkles = _chocolateSprinkles;
        }
    }
}
