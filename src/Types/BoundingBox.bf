using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct BoundingBox
	{
		public Vector3 min;// Minimum vertex box-corner
		public Vector3 max;// Maximum vertex box-corner

		public this(Vector3 min, Vector3 max)
		{
			this.min = min;
			this.max = max;
		}
	}
}
