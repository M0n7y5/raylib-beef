using System.Interop;
namespace raylib_beef.Enums
{
	// Mouse buttons
	public enum MouseButton	: c_int
	{
		MOUSE_BUTTON_LEFT = 0,
		MOUSE_BUTTON_RIGHT = 1,
		MOUSE_BUTTON_MIDDLE = 2,
		MOUSE_BUTTON_SIDE = 3,
		MOUSE_BUTTON_EXTRA = 4,
		MOUSE_BUTTON_FORWARD = 5,
		MOUSE_BUTTON_BACK = 6
	}
}
