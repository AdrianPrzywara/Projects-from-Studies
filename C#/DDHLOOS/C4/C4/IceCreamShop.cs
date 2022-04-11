using System;
using System.Collections.Generic;
using System.Text;

namespace C4
{
    class IceCreamShop
    {
        private IceCreamFactory factory;
        public IceCreamFactory Factory { set { factory = value; } }
        public string AdvertiseDailySpecial(WeekDay day)
        {
            IceCream iceCream = factory.DailySpecial(day);
            return iceCream switch
            {
                RegularIceCream cream => ("Today Special:\n" + "Regular\n" + cream.MainFlavor + "-" + cream.ToppingFlavor + "\n" + (cream.Waffle ? "With Waffle\n" : null) + (cream.ChocolateSprinkles ? "With ChocolateSprinkles\n" : null) + "Price: " + cream.Price + "\n"),
                FruitBasedIceCream cream => ("Today Special:\n" + "Fruit\n" + cream.MainFlavor + "-" + cream.ToppingFlavor + "\n" + (cream.Waffle ? "With Waffle\n" : null) + "Price: " + cream.Price + "\n"),
                SorbetIceCream cream => ("Today Special:\n" + "Sorbet\n" + cream.MainFlavor + "\n" + "Price: " + cream.Price + "\n"),
                GelatoIceCream cream => ("Today Special:\n" + "Gelato\n" + cream.MainFlavor + "\n" + (cream.Waffle ? "With Waffle\n" : null) + (cream.ChocolateSprinkles ? "With ChocolateSprinkles\n" : null) + "Price: " + cream.Price + "\n"),
                _ => "",
            };
        }
    }
}
