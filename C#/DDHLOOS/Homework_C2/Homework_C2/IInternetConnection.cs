using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C2
{
    interface IInternetConnection
    {
        bool InternetConnection { get; }
        void TurnOnInternet();
        void TurnOffInternet();
    }
}
