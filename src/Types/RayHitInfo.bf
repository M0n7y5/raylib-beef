using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct RayHitInfo
	{
		public int32 hit;// Did the ray hit something?
		public float distance;// Distance to nearest hit
		public Vector3 position;// Position of nearest hit
		public Vector3 normal;// Surface normal of hit
	}
}
