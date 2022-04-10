using System;

namespace C4
{
    class Program
    {
        static void Main(string[] args)
        {
            IceCreamFactory grycan = new GrycanFactory();
            IceCreamFactory koral = new KoralFactory();
            IceCreamShop shop = new IceCreamShop();

            shop.Factory = grycan;

            Console.WriteLine(shop.AdvertiseDailySpecial(WeekDay.Monday));
            Console.WriteLine(shop.AdvertiseDailySpecial(WeekDay.Tuesday));
            Console.WriteLine(shop.AdvertiseDailySpecial(WeekDay.Wednesday));

            shop.Factory = koral;

            Console.WriteLine(shop.AdvertiseDailySpecial(WeekDay.Thursday));
            Console.WriteLine(shop.AdvertiseDailySpecial(WeekDay.Friday));
        }
    }
}
