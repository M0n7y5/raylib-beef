using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Image
	{
		// data refers to a void *
		public void* data;// Image raw data
		public int32 width;// Image base width
		public int32 height;// Image base height
		public int32 mipmaps;// Mipmap levels, 1 by default
		public int32 format;// Data format (PixelFormat type)
	}
}
