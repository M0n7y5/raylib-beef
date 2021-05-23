using System;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		/// Screen-space-related functions

		[CLink]
		/// Returns a ray trace from mouse position
		public static extern Ray GetMouseRay(Vector2 mousePosition, Camera camera);

		[CLink]
		/// Returns camera transform matrix (view matrix)
		public static extern Matrix GetCameraMatrix(Camera camera);

		[CLink]
		/// Returns camera 2d transform matrix
		public static extern Matrix GetCameraMatrix2D(Camera2D camera);

		[CLink]
		/// Returns the screen space position for a 3d world space position
		public static extern Vector2 GetWorldToScreen(Vector3 position, Camera camera);

		[CLink]
		/// Returns size position for a 3d world space position
		public static extern Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, c_int width, c_int height);

		[CLink]
		/// Returns the screen space position for a 2d camera world space position
		public static extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);

		[CLink]
		/// Returns the world space position for a 2d camera screen space position
		public static extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);
	}
}
