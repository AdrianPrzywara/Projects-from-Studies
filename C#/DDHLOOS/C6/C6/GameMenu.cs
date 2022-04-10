using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public class GameMenu : GameState
    {
        private ComputerGame game;
        public GameMenu(ComputerGame _game)
        {
            game = _game;
        }
        public override void EnterButton()
        {
            game.ChangeState(new InGame(game));
        }
        public override void EscapeButton() { }
        public override void TabButton() { }
        public override void KeyboardInput(string s) { }
        public override void Exit()
        {
            System.Environment.Exit(0);
        }
    }
}
