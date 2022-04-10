using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class KoralFactory : IceCreamFactory
    {
        public override IceCream DailySpecial(WeekDay day)
        {
            return day switch
            {
                WeekDay.Monday => _ = new FruitBasedIceCream(11, "Watermelon", false, "Strawberry"),
                WeekDay.Tuesday => _ = new GelatoIceCream(7, "Chocolate", false, true),
                WeekDay.Wednesday => _ = new RegularIceCream(12, "Peanut", true, "Chocolate", true),
                WeekDay.Thursday => _ = new RegularIceCream(8, "Vanilla", true, "Chocolate", true),
                WeekDay.Friday => _ = new GelatoIceCream(9, "Peaunut", true, false),
                WeekDay.Saturday => _ = new FruitBasedIceCream(10, "Raspberry", true, "Chocolate"),
                WeekDay.Sunday => _ = new SorbetIceCream(5, "Vanilla"),
                _ => _ = new RegularIceCream(1, "Null", false, "Null", false),
            };
        }
    }
}
