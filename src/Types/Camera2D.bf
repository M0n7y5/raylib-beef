using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Camera2D
	{
		public Vector2 offset;// Camera offset (displacement from target)
		public Vector2 target;// Camera target (rotation and zoom origin)
		public float rotation;// Camera rotation in degrees
		public float zoom;// Camera zoom (scaling), should be 1.0f by default

		public this(Vector2 offset, Vector2 target, float rotation, float zoom)
		{
			this.offset = offset;
			this.target = target;
			this.rotation = rotation;
			this.zoom = zoom;
		}
	}
}
