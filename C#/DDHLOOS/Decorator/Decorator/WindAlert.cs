using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    public class WindAlert : IWeatherAlert
    {
        public string CurrentDay { get; set; }
        public WindAlert(string day)
        {
            CurrentDay = day;
        }
        public void Alert()
        {
            Console.WriteLine(CurrentDay);
            Console.WriteLine("Today expexted: wind");
        }
    }
}
