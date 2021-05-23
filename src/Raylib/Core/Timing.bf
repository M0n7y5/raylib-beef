using System;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Set target FPS (maximum)
		public static extern void SetTargetFPS(c_int fps);

		[CLink]
		/// Returns current FPS
		public static extern c_int GetFPS();

		[CLink]
		/// Returns time in seconds for last frame drawn
		public static extern float GetFrameTime();

		[CLink]
		/// Returns elapsed time in seconds since InitWindow()
		public static extern double GetTime();
	}
}
