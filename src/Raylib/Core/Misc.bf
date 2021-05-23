using System;
using raylib_beef.Enums;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		// Misc. functions

		[CLink]
		/// Returns
		// a random value between min and max (both included)
		public static extern c_int GetRandomValue(c_int min, c_int max);

		[CLink]
		/// Takes
		// a screenshot of current screen (saved a .png)
		public static extern void TakeScreenshot(char8* fileName);

		[CLink]
		/// Setup
		// window configuration flags (view FLAGS)
		public static extern void SetConfigFlags(ConfigFlag flags);

		[CLink]
		/// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
		public static extern void TraceLog(TraceLogType logType, char8* text);

		[CLink]
		/// Set the
		// current threshold (minimum) log level
		public static extern void SetTraceLogLevel(TraceLogType logType);

		// NOT USED
		/*void* MemAlloc(int size);// Internal memory allocator
		void* MemRealloc(void* ptr, int size);// Internal memory reallocator
		void MemFree(void* ptr);// Internal memory free*/

	}
}
