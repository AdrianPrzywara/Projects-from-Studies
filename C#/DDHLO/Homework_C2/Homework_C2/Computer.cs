using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C2
{
    class Computer : Robot, IInternetConnection
    {
        private bool internetConnection = false;
        public bool InternetConnection
        {
            get { return internetConnection; }
        }
        public void TurnOnInternet()
        {
            internetConnection = true;
        }
        public void TurnOffInternet()
        {
            internetConnection = false;
        }
        public Computer() : base("Computer") { }
    }
}
