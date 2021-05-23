using System;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		// Persistent storage management ------------------
		[CLink]
		/// Save integer value to storage file (to defined position)
		public static extern void SaveStorageValue(c_int position, c_int value);

		[CLink]
		/// Load integer value from storage file (from defined position)
		public static extern c_int LoadStorageValue(c_int position);


		// --- TODO: MOVE SOMEWHERE
		[CLink]
		/// Open URL with default system browser (if available)
		public static extern void OpenURL(char8* url);
	}
}
