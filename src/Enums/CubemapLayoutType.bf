using System.Interop;
namespace raylib_beef.Enums
{
	// Cubemap layout type
	public enum CubemapLayout : c_int
	{
	    CUBEMAP_AUTO_DETECT = 0,        // Automatically detect layout type
	    CUBEMAP_LINE_VERTICAL,          // Layout is defined by a vertical line with faces
	    CUBEMAP_LINE_HORIZONTAL,        // Layout is defined by an horizontal line with faces
	    CUBEMAP_CROSS_THREE_BY_FOUR,    // Layout is defined by a 3x4 cross with cubemap faces
	    CUBEMAP_CROSS_FOUR_BY_THREE,    // Layout is defined by a 4x3 cross with cubemap faces
	    CUBEMAP_PANORAMA                // Layout is defined by a panorama image (equirectangular map)
	}
}
