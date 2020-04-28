using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Ray
	{
		public Vector3 position;// Ray position (origin)
		public Vector3 direction;// Ray direction

		public this(Vector3 position, Vector3 direction)
		{
			this.position = position;
			this.direction = direction;
		}
	}
}
