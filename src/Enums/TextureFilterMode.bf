namespace raylib_beef.Enums
{
	// Texture parameters: filter mode
	// NOTE 1: Filtering considers mipmaps if available in the texture
	// NOTE 2: Filter is accordingly set for minification and magnification
	public enum TextureFilterMode : int32
	{
	    FILTER_POINT = 0,               // No filter, just pixel aproximation
	    FILTER_BILINEAR,                // Linear filtering
	    FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
	    FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
	    FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
	    FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
	}
}
