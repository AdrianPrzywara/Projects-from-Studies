using System;

namespace State
{
    class Program
    {
        static void Main(string[] args)
        {
            WaterDroplet waterDroplet = new WaterDroplet();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
            waterDroplet.Heat();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
            waterDroplet.Heat();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
            waterDroplet.Cool();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
            waterDroplet.Cool();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
            waterDroplet.Cool();
            Console.WriteLine(waterDroplet.GetHeatCapacity());
        }
    }
}
