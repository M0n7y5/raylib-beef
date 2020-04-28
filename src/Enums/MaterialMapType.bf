namespace raylib_beef.Enums
{
	// Material map type
	public enum MaterialMapType	: int
	{
		MAP_ALBEDO		= 0,	// MAP_DIFFUSE
		MAP_METALNESS 	= 1,	// MAP_SPECULAR
		MAP_NORMAL 		= 2,
		MAP_ROUGHNESS 	= 3,
		MAP_OCCLUSION,
		MAP_EMISSION,
		MAP_HEIGHT,
		MAP_CUBEMAP,		// NOTE: Uses GL_TEXTURE_CUBE_MAP
		MAP_IRRADIANCE,		// NOTE: Uses GL_TEXTURE_CUBE_MAP
		MAP_PREFILTER,		// NOTE: Uses GL_TEXTURE_CUBE_MAP
		MAP_BRDF
	}
}
