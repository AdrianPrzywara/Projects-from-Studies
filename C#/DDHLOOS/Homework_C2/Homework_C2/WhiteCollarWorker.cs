using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C2
{
    class WhiteCollarWorker : Human, IInternetConnection
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
        public override int Cost(int months)
        {
            return 35 * months;
        }
    }
}
