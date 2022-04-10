using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C2
{
    class BlueCollarWorker : Human
    {
        public override int Cost(int months)
        {
            return 30 * months;
        }
    }
}
