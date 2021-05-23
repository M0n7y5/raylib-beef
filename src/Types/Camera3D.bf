using raylib_beef.Enums;
using System;
namespace raylib_beef.Types
{
	typealias Camera = Camera3D;

	[CRepr]
	public struct Camera3D
	{
		public Vector3 position;// Camera position
		public Vector3 target;// Camera target it looks-at
		public Vector3 up;// Camera up vector (rotation over its axis)
		public float fovy;// Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in
		// orthographic
		public CameraType projection;// Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

		public this(Vector3 position, Vector3 target, Vector3 up, float fovy = 90, CameraType projection = CameraType.CAMERA_PERSPECTIVE)
		{
			this.position = position;
			this.target = target;
			this.up = up;
			this.fovy = fovy;
			this.projection = projection;
		}

		public this()
		{
			this = default;
		}
	}
}
