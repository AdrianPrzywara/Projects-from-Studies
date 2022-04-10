using System;
using System.Collections.Generic;
using System.Text;

namespace Command
{
    public class StartWiFiCommand : ISmartHomeExecutable
    {
        private WiFi wifi;
        private string password;
        public StartWiFiCommand(WiFi _wifi,string _password)
        {
            wifi = _wifi;
            password = _password;
        }
        public void Execute()
        {
            wifi.IsCurrentlyOn = true;
            wifi.Login(password);
        }
    }
}
