using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    public class WindDecorator : Decorator
    {
        public WindDecorator(IWeatherAlert alert) : base(alert) { }
        public override void Alert()
        {
            weatherAlert.Alert();
            Console.WriteLine("Today expexted: wind");
        }
    }
}
