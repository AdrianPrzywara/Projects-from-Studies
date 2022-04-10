using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    abstract class IceCream
    {
        private int price;
        private string mainFlavor;
        public int Price { get { return price; } }
        public string MainFlavor { get { return mainFlavor; } }
        public IceCream(int _price, string _mainFlavor)
        {
            price = _price;
            mainFlavor = _mainFlavor;
        }
    }
}
