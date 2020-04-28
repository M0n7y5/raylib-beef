using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Image
	{
		// data refers to a void *
		public void* data;// Image raw data
		public int width;// Image base width
		public int height;// Image base height
		public int mipmaps;// Mipmap levels, 1 by default
		public int format;// Data format (PixelFormat type)
	}
}
