using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Material
	{
		public Shader shader;// Material shader
		// maps refers to a MaterialMap *
		public MaterialMap* maps;// Material maps
		// params refers to a float *
		public float* param;// Material generic parameters (if required)
	}
}
