using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public class ComputerGame
    {
        private GameState state;
        public ComputerGame()
        {
            state = new GameMenu(this);
        }
        public void ChangeState(GameState newState)
        {
            string oldType = state.GetType().Name;
            state = newState;
            Console.WriteLine("Changed state " + oldType + " => " + state.GetType().Name);
        }
        public void EnterButton()
        {
            state.EnterButton();
        }
        public void EscapeButton()
        {
            state.EscapeButton();
        }
        public void TabButton()
        {
            state.TabButton();
        }
        public void KeyboardInput(string s)
        {
            state.KeyboardInput(s);
        }
        public void Exit()
        {
            state.Exit();
        }
    }
}
