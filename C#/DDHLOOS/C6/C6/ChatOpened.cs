using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public class ChatOpened : GameState
    {
        private ComputerGame game;
        private string message = "";
        public ChatOpened(ComputerGame _game)
        {
            game = _game;
        }
        public override void EnterButton()
        {
            Console.WriteLine(message);
        }
        public override void EscapeButton()
        {
            game.ChangeState(new InGame(game));
        }
        public override void TabButton() { }
        public override void KeyboardInput(string s)
        {
            message = s;
        }
        public override void Exit()
        {
            game.ChangeState(new GameMenu(game));
        }
    }
}
