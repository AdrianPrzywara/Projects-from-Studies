using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public class InGame : GameState
    {
        private ComputerGame game;
        public InGame(ComputerGame _game)
        {
            game = _game;
        }
        public override void EnterButton()
        {
            game.ChangeState(new ChatOpened(game));
        }
        public override void EscapeButton() { }
        public override void TabButton()
        {
            game.ChangeState(new ShopOpened(game));
        }
        public override void KeyboardInput(string s) { }
        public override void Exit()
        {
            game.ChangeState(new GameMenu(game));
        }
    }
}
