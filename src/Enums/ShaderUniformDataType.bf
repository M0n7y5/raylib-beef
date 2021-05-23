using System.Interop;
namespace raylib_beef.Enums
{
	// Shader uniform data types
	public enum ShaderUniformDataType : c_int
	{
		SHADER_UNIFORM_FLOAT = 0,
		SHADER_UNIFORM_VEC2,
		SHADER_UNIFORM_VEC3,
		SHADER_UNIFORM_VEC4,
		SHADER_UNIFORM_INT,
		SHADER_UNIFORM_IVEC2,
		SHADER_UNIFORM_IVEC3,
		SHADER_UNIFORM_IVEC4,
		SHADER_UNIFORM_SAMPLER2D
	}
}
