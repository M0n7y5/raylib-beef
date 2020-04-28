using System;
namespace raylib_beef.Types
{
	[CRepr]
	// Rectangle type
	public struct Rectangle
	{
		public float x;
		public float y;
		public float width;
		public float height;

		public this(float x, float y, float width, float height)
		{
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
		}
	}
}
