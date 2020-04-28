using System;
namespace raylib_beef.Types
{
	[CRepr]
	// N-Patch layout info
	public struct NPatchInfo
	{
		public Rectangle sourceRec;// Region in the texture
		public int left;// left border offset
		public int top;// top border offset
		public int right;// right border offset
		public int bottom;// bottom border offset
		public int type;// layout of the n-patch: 3x3, 1x3 or 3x1
	}
}
