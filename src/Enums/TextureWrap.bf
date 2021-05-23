using System.Interop;
namespace raylib_beef.Enums
{
	// Texture parameters: wrap mode
	public enum TextureWrap	: c_int
	{
	    WRAP_REPEAT = 0,        // Repeats texture in tiled mode
	    WRAP_CLAMP,             // Clamps texture to edge pixel in tiled mode
	    WRAP_MIRROR_REPEAT,     // Mirrors and repeats the texture in tiled mode
	    WRAP_MIRROR_CLAMP       // Mirrors and clamps to border the texture in tiled mode
	}
}
