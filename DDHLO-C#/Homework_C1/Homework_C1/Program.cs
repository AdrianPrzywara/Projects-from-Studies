using System;

namespace Homework_C1
{
    class Program
    {
        static void Main(string[] args)
        {
            DumperTruck dumper = new DumperTruck(5000,500,4499,"Sand");
            Console.WriteLine(dumper.Refuel());
            Console.WriteLine(dumper.DumpCargo());
            Console.WriteLine(dumper.Capacity);
        }
    }
}
