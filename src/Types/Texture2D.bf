using System;
using raylib_beef.Enums;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Texture2D
	{
	    public uint32 id;            // OpenGL texture id
	    public int32 width;          // Texture base width
	    public int32 height;         // Texture base height
	    public int32 mipmaps;        // Mipmap levels, 1 by default
	    public uint32 format;   // Data format (PixelFormat type)
	}
}
