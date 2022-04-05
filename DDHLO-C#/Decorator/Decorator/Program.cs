using System;
using System.Collections.Generic;

namespace Decorator
{
    class Program
    {
        static void Main(string[] args)
        {

            IWeatherAlert monday = new RainAlert("Monday");
            monday = new WindDecorator(monday);
            IWeatherAlert tuesday = new NoAlert("Tuesday");
            tuesday = new FogDecorator(tuesday);
            IWeatherAlert wednesday = new RainAlert("Wednesday");
            wednesday = new WindDecorator(wednesday);
            wednesday = new SnowDecorator(wednesday);
            Console.WriteLine();
            monday.Alert();
            Console.WriteLine();
            tuesday.Alert();
            Console.WriteLine();
            wednesday.Alert();

        }
    }
}
