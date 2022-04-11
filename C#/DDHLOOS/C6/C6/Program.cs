using System;

namespace C6
{
    class Program
    {
        static void Main()
        {
            ComputerGame game = new ComputerGame();
            game.EnterButton();
            game.EnterButton();
            game.KeyboardInput("Hello");
            game.EnterButton();
            game.EscapeButton();
            game.TabButton();
            game.Exit();
            game.EnterButton();
            game.TabButton();
            game.KeyboardInput("Armor");
            game.KeyboardInput("Necklace");
            game.EnterButton();
            game.KeyboardInput("I've bought armor");
            game.EnterButton();
            game.EscapeButton();
            game.EscapeButton();
            game.Exit();
            game.Exit();
        }
    }
}
