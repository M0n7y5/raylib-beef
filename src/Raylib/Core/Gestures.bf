using System;
using raylib_beef.Enums;
using System.Interop;
using raylib_beef.Types;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Enable a set of gestures using flags
		public static extern void SetGesturesEnabled(GestureType gestureFlags);

		[CLink]
		/// Check if a gesture have been detected
		public static extern bool IsGestureDetected(GestureType gesture);

		[CLink]
		/// Get latest detected gesture
		public static extern c_int GetGestureDetected();

		[CLink]
		/// Get touch points count
		public static extern c_int GetTouchPointsCount();

		[CLink]
		/// Get gesture hold time in milliseconds
		public static extern float GetGestureHoldDuration();

		[CLink]
		/// Get gesture drag vector
		public static extern Vector2 GetGestureDragVector();

		[CLink]
		/// Get gesture drag angle
		public static extern float GetGestureDragAngle();

		[CLink]
		/// Get gesture pinch delta
		public static extern Vector2 GetGesturePinchVector();

		[CLink]
		/// Get gesture pinch angle
		public static extern float GetGesturePinchAngle();
	}
}
