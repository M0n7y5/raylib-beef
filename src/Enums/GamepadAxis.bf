namespace raylib_beef.Enums
{
	public enum GamepadAxis	: int32
	{
	    // This is here just for error checking
	    GAMEPAD_AXIS_UNKNOWN = 0,

	    // Left stick
	    GAMEPAD_AXIS_LEFT_X,
	    GAMEPAD_AXIS_LEFT_Y,

	    // Right stick
	    GAMEPAD_AXIS_RIGHT_X,
	    GAMEPAD_AXIS_RIGHT_Y,

	    // Pressure levels for the back triggers
	    GAMEPAD_AXIS_LEFT_TRIGGER,      // [1..-1] (pressure-level)
	    GAMEPAD_AXIS_RIGHT_TRIGGER      // [1..-1] (pressure-level)
	}
}
