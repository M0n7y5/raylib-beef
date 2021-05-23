using System.Interop;
namespace raylib_beef.Enums
{
	public enum GamepadAxis	: c_int
	{
		// Left stick
		GAMEPAD_AXIS_LEFT_X = 0,
		GAMEPAD_AXIS_LEFT_Y = 1,

		// Right stick
		GAMEPAD_AXIS_RIGHT_X = 2,
		GAMEPAD_AXIS_RIGHT_Y = 3,

		// Pressure levels for the back triggers
		GAMEPAD_AXIS_LEFT_TRIGGER = 4,      // [1..-1] (pressure-level)
		GAMEPAD_AXIS_RIGHT_TRIGGER = 5      // [1..-1] (pressure-level)
	}
}
