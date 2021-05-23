using System;
using System.Interop;
using raylib_beef.Types;
using raylib_beef.Enums;
namespace raylib_beef
{
	extension Raylib
	{

		// TODO. dodelat

		// Shader loading/unloading functions

		[CLink]
		/// Load shader from files and bind default locations
		public static extern Shader LoadShader(char8* vsFileName, char8* fsFileName);

		[CLink]
		/// Load shader from code strings and bind default locations
		public static extern Shader LoadShaderFromMemory(char8* vsCode, char8* fsCode);

		[CLink]
		/// Get shader uniform location
		public static extern c_int GetShaderLocation(Shader shader, char8* uniformName);

		[CLink]
		/// Get shader attribute location
		public static extern c_int GetShaderLocationAttrib(Shader shader, char8* attribName);

		[CLink]
		/// Set shader uniform value value refers to a const void *
		public static extern void SetShaderValue(Shader shader, c_int locIndex, void* value, ShaderUniformDataType uniformType);

		[CLink]
		/// Set shader uniform value vector value refers to a const void *
		public static extern void SetShaderValueV(Shader shader, c_int uniformLoc, void* value, ShaderUniformDataType uniformType, c_int count);

		[CLink]
		/// Set shader uniform value (matrix 4x4)
		public static extern void SetShaderValueMatrix(Shader shader, c_int uniformLoc, Matrix mat);

		[CLink]
		/// Set shader uniform value for texture
		public static extern void SetShaderValueTexture(Shader shader, c_int uniformLoc, Texture2D texture);

		[CLink]
		/// Unload shader from GPU memory (VRAM)
		public static extern void UnloadShader(Shader shader);
	}
}
