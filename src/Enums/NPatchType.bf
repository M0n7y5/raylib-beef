using System.Interop;
namespace raylib_beef.Enums
{
	// Type of n-patch
	public enum NPatchType : c_int
	{
		NPATCH_NINE_PATCH = 0,           // Npatch defined by 3x3 tiles
		NPATCH_THREE_PATCH_VERTICAL,     // Npatch defined by 1x3 tiles
		NPATCH_THREE_PATCH_HORIZONTAL    // Npatch defined by 3x1 tiles
	}
}
