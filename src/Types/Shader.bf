using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Shader
	{
		public uint id;// Shader program id

		// locs refers to a int *
		public int* locs;// Shader locations array (MAX_SHADER_LOCATIONS)
	}
}
