using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class SorbetIceCream : IceCream
    {
        public SorbetIceCream(int _price, string _mainFlavor) : base(_price, _mainFlavor) { }
    }
}
