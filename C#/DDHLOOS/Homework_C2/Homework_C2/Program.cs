using System;
using System.Collections.Generic;

namespace Homework_C2
{
    class Program
    {
        static void Main(string[] args)
        {
            MechanicalRobot mech1 = new MechanicalRobot();
            MechanicalRobot mech2 = new MechanicalRobot();

            Computer com1 = new Computer();
            Computer com2 = new Computer();
            Computer com3 = new Computer();

            BlueCollarWorker blue1 = new BlueCollarWorker();
            BlueCollarWorker blue2 = new BlueCollarWorker();
            BlueCollarWorker blue3 = new BlueCollarWorker();
            BlueCollarWorker blue4 = new BlueCollarWorker();

            WhiteCollarWorker white1 = new WhiteCollarWorker();
            WhiteCollarWorker white2 = new WhiteCollarWorker();
            WhiteCollarWorker white3 = new WhiteCollarWorker();

            List<Robot> robots = new List<Robot> { mech1, mech2, com1, com2, com3 };
            List<Human> humans = new List<Human> { blue1, blue2, blue3, blue4, white1, white2, white3 };
            List<IInternetConnection> internet = new List<IInternetConnection> { com1, com2, com3, white1, white2, white3 };

            int robotsTotalCost = 0;
            foreach(Robot r in robots) { int cost = r.AnnualCost();  Console.WriteLine(cost); robotsTotalCost += cost; }
            Console.WriteLine("Robots Total Cost: " + robotsTotalCost);

            int humansTotalCost = 0;
            foreach(Human h in humans) { int cost = h.Cost(10); Console.WriteLine(cost); humansTotalCost += cost; }
            Console.WriteLine("Humans Total Cost in 10 Months: " + humansTotalCost);

            foreach(IInternetConnection i in internet) { i.TurnOnInternet(); Console.WriteLine(i.InternetConnection); }

        }
    }
}
