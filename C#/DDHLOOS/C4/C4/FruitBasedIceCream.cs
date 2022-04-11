using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class FruitBasedIceCream : IceCream
    {
        private bool waffle;
        private string toppingFlavor;
        public bool Waffle { get { return waffle; } }
        public string ToppingFlavor { get { return toppingFlavor; } }
        public FruitBasedIceCream(int _price, string _mainFlavor, bool _waffle, string _toppingFlavor) :
            base(_price, _mainFlavor)
        {
            waffle = _waffle;
            toppingFlavor = _toppingFlavor;
        }
    }
}
