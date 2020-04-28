using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Texture2D
	{
	    public uint id;            // OpenGL texture id
	    public int width;          // Texture base width
	    public int height;         // Texture base height
	    public int mipmaps;        // Mipmap levels, 1 by default
	    public int format;         // Data format (PixelFormat type)
	}
}
