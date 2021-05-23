using System.Interop;
namespace raylib_beef.Enums
{
	// Texture parameters: filter mode
	// NOTE 1: Filtering considers mipmaps if available in the texture
	// NOTE 2: Filter is accordingly set for minification and magnification
	public enum TextureFilter : c_int
	{
		TEXTURE_FILTER_POINT = 0,               // No filter, just pixel aproximation
		TEXTURE_FILTER_BILINEAR,                // Linear filtering
		TEXTURE_FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
		TEXTURE_FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
		TEXTURE_FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
		TEXTURE_FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
	}
}
