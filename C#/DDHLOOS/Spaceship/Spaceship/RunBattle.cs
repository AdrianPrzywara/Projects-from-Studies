using System;
using System.Collections.Generic;
using System.Linq;

namespace Spaceship
{
    class RunBattle
    {
        public static void Run()
        {
            // prepare spaceships
            Spaceship s1 = new SpaceshipLaser();
            s1 = new DecoratorArmor(s1);
            Spaceship s2 = new SpaceshipArmor();
            s2 = new DecoratorLaser(s2);
            Spaceship s3 = new SpaceshipArmor();
            s3 = new DecoratorArmor(s3);
            Spaceship s4 = new SpaceshipExtraCannon();
            s4 = new DecoratorLaser(s4);
            Spaceship s5 = new SpaceshipMachineLearning();
            s5 = new DecoratorExtraCannon(s5);
            Spaceship s6 = new SpaceshipNanobots();
            s6 = new DecoratorArmor(s6);
            Spaceship s7 = new SpaceshipLaser();
            s7 = new DecoratorMachineLearning(s7);
            s7 = new DecoratorExtraCannon(s7);

            List<Spaceship> tournamentList = new List<Spaceship>() { s1, s2, s3, s4, s5, s6, s7 };
            List<int> wins = new List<int>(new int[tournamentList.Count]);

            // run tournament
            for (int i = 0; i < tournamentList.Count; i++)
            {
                for (int j = 0; j < i; j++)
                {
                    // remember original statistics
                    int hp1 = tournamentList[i].Health;
                    int hp2 = tournamentList[j].Health;
                    int at1 = tournamentList[i].Attack;
                    int at2 = tournamentList[j].Attack;
                    // play this round
                    Console.WriteLine();
                    Console.WriteLine(tournamentList[i].Type() + " (" + tournamentList[i].Health + " HP) vs "
                            + tournamentList[j].Type() + " (" + tournamentList[j].Health + " HP)");
                    do
                    {
                        int attack1 = tournamentList[i].GetNextAttack();
                        int attack2 = tournamentList[j].GetNextAttack();
                        tournamentList[j].Health -= attack1;
                        tournamentList[i].Health -= attack2;
                        Console.WriteLine(tournamentList[i].Type() + " (" + tournamentList[i].Health + " HP) vs "
                            + tournamentList[j].Type() + " (" + tournamentList[j].Health + " HP)");
                    } while (tournamentList[j].Health > 0 && tournamentList[i].Health > 0);
                    if (tournamentList[j].Health > tournamentList[i].Health)
                    {
                        Console.WriteLine("winner: " + tournamentList[j].Type());
                        wins[j]++;
                    }
                    else if (tournamentList[i].Health > tournamentList[j].Health)
                    {
                        Console.WriteLine("winner: " + tournamentList[i].Type());
                        wins[i]++;
                    }
                    else Console.WriteLine("draw!");
                    // restore original statistics
                    tournamentList[i].Health = hp1;
                    tournamentList[j].Health = hp2;
                    tournamentList[i].Attack = at1;
                    tournamentList[j].Attack = at2;
                }
            }

            // display tournament results
            Console.WriteLine("\n");
            var currentColor = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("TOURNAMENT RESULTS");
            var result = tournamentList.OrderByDescending(ship => wins[tournamentList.IndexOf(ship)])
                .Zip(wins.OrderByDescending(i => i), (ship, winNum) => ship.Type().PadRight(32) + "\t" + winNum.ToString() + " wins");
            for (int i = 0; i < result.Count(); i++) Console.WriteLine((i+1) + ". " + result.ElementAt(i));
            Console.ForegroundColor = currentColor;

        }
    }
}
