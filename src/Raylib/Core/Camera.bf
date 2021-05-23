using System;
using raylib_beef.Enums;
using raylib_beef.Types;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Set camera mode (multiple camera modes available)
		public static extern void SetCameraMode(Camera3D camera, CameraMode mode);

		[CLink]
		/// Update camera position for selected mode
		public static extern void UpdateCamera(Camera3D* camera);

		[CLink]
		/// Set camera pan key to combine with mouse movement (free camera)
		public static extern void SetCameraPanControl(KeyboardKey panKey);

		[CLink]
		/// Set camera alt key to combine with mouse movement (free camera)
		public static extern void SetCameraAltControl(KeyboardKey altKey);

		[CLink]
		/// Set camera smooth zoom key to combine with mouse (free camera)
		public static extern void SetCameraSmoothZoomControl(KeyboardKey szKey);

		[CLink]
		/// Set camera move controls (1st person and 3rd person cameras)
		public static extern void SetCameraMoveControls(KeyboardKey frontKey,
			KeyboardKey backKey, KeyboardKey rightKey, KeyboardKey leftKey,
			KeyboardKey upKey, KeyboardKey downKey);
	}
}
