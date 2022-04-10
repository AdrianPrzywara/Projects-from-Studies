using System;

namespace Decorator
{
	public interface IWeatherAlert
    {
        string CurrentDay { get; set; }
        void Alert();
    }
}