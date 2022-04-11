using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public class ShopOpened : GameState
    {
        private ComputerGame game;
        private List<string> shop = new List<string> { "Gun", "Knife", "Armor", "Helmet", "Gloves", "Shoes" };
        public ShopOpened(ComputerGame _game)
        {
            game = _game;
        }
        public override void EnterButton()
        {
            game.ChangeState(new ChatOpened(game));
        }
        public override void EscapeButton()
        {
            game.ChangeState(new InGame(game));
        }
        public override void TabButton()
        {
            game.ChangeState(new InGame(game));
        }
        public override void KeyboardInput(string s)
        {
            if (shop.IndexOf(s) == -1)
            {
                Console.WriteLine("Item not existing in shop");
            }
            else
            {
                Console.WriteLine(s + " was bought");
            }
        }
        public override void Exit()
        {
            game.ChangeState(new GameMenu(game));
        }
    }
}
