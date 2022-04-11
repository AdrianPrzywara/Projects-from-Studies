using System;
using System.Collections.Generic;
using System.Text;

namespace Command
{
    public class SetThermostatCommand : ISmartHomeExecutable
    {
        private Thermostat thermostat;
        private int temperature;
        public SetThermostatCommand(Thermostat _thermostat, int _temperature)
        {
            thermostat = _thermostat;
            temperature = _temperature;
        }
        public void Execute()
        {
            thermostat.TargetTemperature = temperature;
        }
    }
}
