using System;
using System.Collections.Generic;
using System.Text;

namespace Decorator
{
    abstract public class Decorator : IWeatherAlert
    {
        protected IWeatherAlert weatherAlert;
        public Decorator(IWeatherAlert alert)
        {
            weatherAlert = alert;
        }
        public string CurrentDay { get; set; }
        abstract public void Alert();
    }
}
