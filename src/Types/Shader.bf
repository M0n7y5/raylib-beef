using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Shader
	{
		public uint32 id;// Shader program id

		// locs refers to a int *
		public int32* locs;// Shader locations array (MAX_SHADER_LOCATIONS)
	}
}
