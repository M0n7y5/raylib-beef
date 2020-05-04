using System;
namespace raylib_beef.Types
{
	[CRepr]
	// N-Patch layout info
	public struct NPatchInfo
	{
		public Rectangle sourceRec;// Region in the texture
		public int32 left;// left border offset
		public int32 top;// top border offset
		public int32 right;// right border offset
		public int32 bottom;// bottom border offset
		public int32 type;// layout of the n-patch: 3x3, 1x3 or 3x1
	}
}
