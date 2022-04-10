using System;

namespace Decorator
{
    public class NoAlert : IWeatherAlert
    {
        public string CurrentDay { get; set; }
        public NoAlert(string day)
        {
            CurrentDay = day;
        }
        public void Alert() 
        { 
            Console.WriteLine(CurrentDay);
        }
	}
}