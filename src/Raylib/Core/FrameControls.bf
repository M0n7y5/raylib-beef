using System;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		//Functions for custom frame controls
		//WARNING: These depend on the library built and only work if certain parameter are set
		// To control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL

		[CLink]
		///This might not work depending on how you built your lib
		public static extern void SwapScreenBuffer();

		[CLink]
		///This might not work depending on how you built your lib
		public static extern void PollInputEvents();

		[CLink]
		///This might not work depending on how you built your lib
		public static extern void WaitTime(float ms);
	}
}
