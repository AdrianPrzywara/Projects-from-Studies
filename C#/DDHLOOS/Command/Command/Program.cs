using System;

namespace Command
{
    class Program
    {
        static void Main(string[] args)
        {
            WiFi myWiFi = new WiFi("routerXYZ", "bezpieczneHaslo1");
            Thermostat myThermostat = new Thermostat();
            SecurityAlarm myAlarm = new SecurityAlarm("bezpieczneHaslo2");


            // version without using command pattern - we come home at 17
            // we will have to repeat these activities every day
            
            myWiFi.IsCurrentlyOn = true; 
            myWiFi.Login("bezpieczneHaslo1"); // call method with parameters - any class that wants to use WiFi must provide the password
            myThermostat.TargetTemperature = 22; // unfortunately, the thermostat needs some time to warm up - getting to 22 degrees will take one hour
            // after a while...
            myAlarm.Lock("bezpieczneHaslo2"); // I go to bed at 23, but first I need to set up my alaram
            


            // version with command pattern - we still come home at 17
            // let's define activities that will be performed automatically every day 
            
            SmartHomeScheduler controller = new SmartHomeScheduler();
            StartWiFiCommand command1 = new StartWiFiCommand(myWiFi, "bezpieczneHaslo1"); // the command will store its parameters for future usage - a class that wants to use WiFi doesn't need to provide the password anymore, it can just use the command object instead
            SetThermostatCommand command2 = new SetThermostatCommand(myThermostat, 22);
            SetAlarmCommand command3 = new SetAlarmCommand(myAlarm, "bezpieczneHaslo2");
            controller.Commands.Add(16, command2); // the thermostat should be turned on automatically at 16
            controller.Commands.Add(17, command1); // the wifi should be turned on automatically at 17
            controller.Commands.Add(23, command3); // the alarm should be turned on automatically at 23
            controller.Run();
            


        }
    }
}
