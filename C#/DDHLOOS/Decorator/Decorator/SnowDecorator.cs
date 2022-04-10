using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    class SnowDecorator : Decorator
    {
        public SnowDecorator(IWeatherAlert alert) : base(alert) { }
        public override void Alert()
        {
            weatherAlert.Alert();
            Console.WriteLine("Today expexted: snow");
        }
    }
}
