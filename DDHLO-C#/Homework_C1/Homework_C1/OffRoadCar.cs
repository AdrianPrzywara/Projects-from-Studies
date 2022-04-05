using System;
using System.Collections.Generic;
using System.Text;

namespace Homework_C1
{
    class OffRoadCar : PassengerCar
    {
        private double bodyHeight;
        private bool winchPresence;
        public double BodyHeight
        {
            get { return bodyHeight; }
            set { bodyHeight = value; }
        }
        public bool WinchPresence
        {
            get { return winchPresence; }
            set { winchPresence = value; }
        }
        public OffRoadCar(double _weight, double _length, int _numberOfSeats, double _bodyHeiht, bool _winchPresence):
            base(_weight, _length, _numberOfSeats)
        {
            bodyHeight = _bodyHeiht;
            winchPresence = _winchPresence;
        }
        public string WinchTurnOn()
        {
            if (winchPresence) return "Winch Turned On";
            else return "Winch not presence";
        }
    }
}
