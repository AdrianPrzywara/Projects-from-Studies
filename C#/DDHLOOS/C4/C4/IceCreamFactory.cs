using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    abstract class IceCreamFactory
    {
        public abstract IceCream DailySpecial(WeekDay day);
    }
}
