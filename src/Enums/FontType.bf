using System.Interop;
namespace raylib_beef.Enums
{
	// Font type, defines generation method
	public enum FontType : c_int
	{
	    FONT_DEFAULT = 0,       // Default font generation, anti-aliased
	    FONT_BITMAP,            // Bitmap font generation, no anti-aliasing
	    FONT_SDF                // SDF font generation, requires external shader
	}
}
