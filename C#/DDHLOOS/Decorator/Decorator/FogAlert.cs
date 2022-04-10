using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    public class FogAlert : IWeatherAlert
    {
        public string CurrentDay { get; set; }
        public FogAlert(string day)
        {
            CurrentDay = day;
        }
        public void Alert()
        {
            Console.WriteLine(CurrentDay);
            Console.WriteLine("Today expexted: fog");
        }
    }
}
