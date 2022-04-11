using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    public class FogDecorator : Decorator
    {
        public FogDecorator(IWeatherAlert alert) : base(alert) { }
        public override void Alert()
        {
            weatherAlert.Alert();
            Console.WriteLine("Today expexted: fog");
        }
    }
}
