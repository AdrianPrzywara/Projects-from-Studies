using System;
using System.Collections.Generic;
using System.Text;

namespace Command
{
    public class SetAlarmCommand : ISmartHomeExecutable
    {
        private SecurityAlarm alarm;
        private string password;
        public SetAlarmCommand(SecurityAlarm _alarm,string _password)
        {
            alarm = _alarm;
            password = _password;
        }
        public void Execute()
        {
            alarm.Lock(password);
        }
    }
}
