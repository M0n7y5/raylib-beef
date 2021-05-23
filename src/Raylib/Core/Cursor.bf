using System;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Shows cursor
		public static extern void ShowCursor();

		[CLink]
		/// Hides cursor
		public static extern void HideCursor();

		[CLink]
		/// Check if cursor is not visible
		public static extern bool IsCursorHidden();

		[CLink]
		/// Enables cursor (unlock cursor)
		public static extern void EnableCursor();

		[CLink]
		/// Disables cursor (lock cursor)
		public static extern void DisableCursor();

		[CLink]
		/// Check if cursor is on the current screen.
		public static extern bool IsCursorOnScreen();
	}
}
