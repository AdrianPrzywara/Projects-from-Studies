using System;

namespace Decorator
{
    public class RainAlert : IWeatherAlert
    {
        public string CurrentDay { get; set; }
        public RainAlert(string day)
        {
            CurrentDay = day;
        }
        public void Alert()
        {
            Console.WriteLine(CurrentDay);
            Console.WriteLine("Today expexted: rain");
        }
    }
}