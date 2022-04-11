using System;
using System.Collections.Generic;
using System.Text;

namespace C6
{
    public abstract class GameState
    {
        public abstract void EnterButton();
        public abstract void EscapeButton();
        public abstract void TabButton();
        public abstract void KeyboardInput(string s);
        public abstract void Exit();
    }
}
