using System;
using System.Interop;
using raylib_beef.Types;
using raylib_beef.Enums;
namespace raylib_beef
{
	extension Raylib
	{
		// Input-related functions: keyboard -----------------------
		[CLink]
		/// Detect if a key has been pressed once
		public static extern bool IsKeyPressed(KeyboardKey key);

		[CLink]
		/// Detect if a key is being pressed
		public static extern bool IsKeyDown(KeyboardKey key);

		[CLink]
		/// Detect if a key has been released once
		public static extern bool IsKeyReleased(KeyboardKey key);

		[CLink]
		/// Detect if a key is NOT being pressed
		public static extern bool IsKeyUp(KeyboardKey key);

		[CLink]
		/// Set a custom key to exit program (default is ESC)
		public static extern void SetExitKey(KeyboardKey key);

		[CLink]
		/// Get key pressed, call it multiple times for chars queued
		public static extern c_int GetKeyPressed();

		[CLink]
		/// Get char pressed (unicode), call it multiple times for chars queued
		public static extern c_int GetCharPressed();


		// Input-related functions: gamepads ----------------------

		[CLink]
		/// Detect if a gamepad is available
		public static extern bool IsGamepadAvailable(GamepadNumber gamepad);

		[CLink]
		/// Check gamepad name (if available)
		public static extern bool IsGamepadName(GamepadNumber gamepad, char8* name);

		[CLink]
		/// Return gamepad internal name id
		public static extern char8* GetGamepadName(GamepadNumber gamepad);

		[CLink]
		/// Detect if a gamepad button has been pressed once
		public static extern bool IsGamepadButtonPressed(GamepadNumber gamepad, GamepadButton button);

		[CLink]
		/// Detect if a gamepad button is being pressed
		public static extern bool IsGamepadButtonDown(GamepadNumber gamepad, GamepadButton button);

		[CLink]
		/// Detect if a gamepad button has been released once
		public static extern bool IsGamepadButtonReleased(GamepadNumber gamepad, GamepadButton button);

		[CLink]
		/// Detect if a gamepad button is NOT being pressed
		public static extern bool IsGamepadButtonUp(GamepadNumber gamepad, GamepadButton button);

		[CLink]
		/// Get the last gamepad button pressed
		public static extern c_int GetGamepadButtonPressed();

		[CLink]
		/// Return gamepad axis count for a gamepad
		public static extern c_int GetGamepadAxisCount(GamepadNumber gamepad);

		[CLink]
		/// Return axis movement value for a gamepad axis
		public static extern float GetGamepadAxisMovement(GamepadNumber gamepad, GamepadAxis axis);

		// Set internal gamepad mappings (SDL_GameControllerDB)
		//int SetGamepadMappings(const char *mappings);


		// Input-related functions: mouse
		[CLink]
		/// Detect if a mouse button has been pressed once
		public static extern bool IsMouseButtonPressed(MouseButton button);

		[CLink]
		/// Detect if a mouse button is being pressed
		public static extern bool IsMouseButtonDown(MouseButton button);

		[CLink]
		/// Detect if a mouse button has been released once
		public static extern bool IsMouseButtonReleased(MouseButton button);

		[CLink]
		/// Detect if a mouse button is NOT being pressed
		public static extern bool IsMouseButtonUp(MouseButton button);

		[CLink]
		/// Returns mouse position X
		public static extern c_int GetMouseX();

		[CLink]
		/// Returns mouse position Y
		public static extern c_int GetMouseY();

		[CLink]
		/// Returns mouse position XY
		public static extern Vector2 GetMousePosition();

		[CLink]
		/// Set mouse position XY
		public static extern void SetMousePosition(c_int x, c_int y);

		[CLink]
		/// Set mouse offset
		public static extern void SetMouseOffset(c_int offsetX, c_int offsetY);

		[CLink]
		/// Set mouse scaling
		public static extern void SetMouseScale(float scaleX, float scaleY);

		[CLink]
		/// Returns mouse wheel movement Y
		public static extern float GetMouseWheelMove();

		[CLink]
		/// Set mouse cursor
		public static extern float SetMouseCursor(c_int cursor);


		/// Input-related functions: touch
		[CLink]
		/// Returns touch position X for touch point 0 (relative to screen size)
		public static extern c_int GetTouchX();

		[CLink]
		/// Returns touch position Y for touch point 0 (relative to screen size)
		public static extern c_int GetTouchY();

		[CLink]
		/// Returns touch position XY for a touch point index (relative to screen size)
		public static extern Vector2 GetTouchPosition(c_int index);
	}
}
