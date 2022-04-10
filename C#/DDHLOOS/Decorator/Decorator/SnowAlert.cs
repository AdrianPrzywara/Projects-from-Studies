using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    public class SnowAlert : IWeatherAlert
    {
        public string CurrentDay { get; set; }
        public SnowAlert(string day)
        {
            CurrentDay = day;
        }
        public void Alert()
        {
            Console.WriteLine(CurrentDay);
            Console.WriteLine("Today expexted: snow");
        }
    }
}
