using System.Interop;
namespace raylib_beef.Enums
{
	// Gamepad Buttons
	public enum GamepadButton : c_int
	{
		// This is here just for error checking
		GAMEPAD_BUTTON_UNKNOWN = 0,

		// This is normally a DPAD
		GAMEPAD_BUTTON_LEFT_FACE_UP,
		GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
		GAMEPAD_BUTTON_LEFT_FACE_DOWN,
		GAMEPAD_BUTTON_LEFT_FACE_LEFT,

		// This normally corresponds with PlayStation and Xbox controllers
		// XBOX: [Y,X,A,B]
		// PS3: [Triangle,Square,Cross,Circle]
		// No support for 6 button controllers though..
		GAMEPAD_BUTTON_RIGHT_FACE_UP,
		GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
		GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
		GAMEPAD_BUTTON_RIGHT_FACE_LEFT,

		// Triggers
		GAMEPAD_BUTTON_LEFT_TRIGGER_1,
		GAMEPAD_BUTTON_LEFT_TRIGGER_2,
		GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
		GAMEPAD_BUTTON_RIGHT_TRIGGER_2,

		// These are buttons in the center of the gamepad
		GAMEPAD_BUTTON_MIDDLE_LEFT,     // PS3 Select
		GAMEPAD_BUTTON_MIDDLE,          // PS Button/XBOX Button
		GAMEPAD_BUTTON_MIDDLE_RIGHT,    // PS3 Start

		// These are the joystick press in buttons
		GAMEPAD_BUTTON_LEFT_THUMB,
		GAMEPAD_BUTTON_RIGHT_THUMB
	}
}
