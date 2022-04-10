using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class GrycanFactory : IceCreamFactory
    {
        public override IceCream DailySpecial(WeekDay day)
        {
            return day switch
            {
                WeekDay.Monday => _ = new RegularIceCream(10, "Vanilla", true, "Chocolate", true),
                WeekDay.Tuesday => _ = new SorbetIceCream(8, "Chocolate"),
                WeekDay.Wednesday => _ = new GelatoIceCream(7, "Peaunut", true, false),
                WeekDay.Thursday => _ = new FruitBasedIceCream(11, "Strawberry", true, "Banana"),
                WeekDay.Friday => _ = new GelatoIceCream(6, "Vanilla", false, true),
                WeekDay.Saturday => _ = new RegularIceCream(9, "Chocolate", true, "Peanut", true),
                WeekDay.Sunday => _ = new FruitBasedIceCream(12, "Lemon", false, "Mint"),
                _ => _ = new RegularIceCream(1, "Null", false, "Null", false),
            };
        }
    }
}
