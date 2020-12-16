using System.Text;
using System;
using System.Interop;
using raylib_beef.Types;

namespace raylib_beef
{

	// ----------------------------------------------------------------------------------
	// Types and Structures Definition
	// ----------------------------------------------------------------------------------
	public enum GlVersion
	{
		OPENGL_11 = 1,
		OPENGL_21,
		OPENGL_33,
		OPENGL_ES_20
	}

	public static class rlgl
	{
		// Used by Import to load the native library.
		public const String nativeLibName = "raylib.dll";

		public const float MAX_BATCH_ELEMENTS = 8192;
		public const float MAX_BATCH_BUFFERING = 1;
		public const float MAX_MATRIX_STACK_SIZE = 32;
		public const float MAX_DRAWCALL_REGISTERED = 256;
		public const float DEFAULT_NEAR_CULL_DISTANCE = 0.01f;
		public const float DEFAULT_FAR_CULL_DISTANCE = 1000.0f;
		public const int RL_TEXTURE_WRAP_S = 0x2802;
		public const int RL_TEXTURE_WRAP_T = 0x2803;
		public const int RL_TEXTURE_MAG_FILTER = 0x2800;
		public const int RL_TEXTURE_MIN_FILTER = 0x2801;
		public const int RL_TEXTURE_ANISOTROPIC_FILTER = 0x3000;
		public const int RL_FILTER_NEAREST = 0x2600;
		public const int RL_FILTER_LINEAR = 0x2601;
		public const int RL_FILTER_MIP_NEAREST = 0x2700;
		public const int RL_FILTER_NEAREST_MIP_LINEAR = 0x2702;
		public const int RL_FILTER_LINEAR_MIP_NEAREST = 0x2701;
		public const int RL_FILTER_MIP_LINEAR = 0x2703;
		public const int RL_WRAP_REPEAT = 0x2901;
		public const int RL_WRAP_CLAMP = 0x812F;
		public const int RL_WRAP_MIRROR_REPEAT = 0x8370;
		public const int RL_WRAP_MIRROR_CLAMP = 0x8742;
		public const int RL_MODELVIEW = 0x1700;
		public const int RL_PROJECTION = 0x1701;
		public const int RL_TEXTURE = 0x1702;
		public const int RL_LINES = 0x0001;
		public const int RL_TRIANGLES = 0x0004;
		public const int RL_QUADS = 0x0007;

		// ------------------------------------------------------------------------------------
		// Functions Declaration - Matrix operations
		// ------------------------------------------------------------------------------------




		// Choose the current matrix to be transformed
		[CLink]
		public static extern void rlMatrixMode(c_int mode);

		// Push the current matrix to stack
		[CLink]
		public static extern void rlPushMatrix();

		// Pop lattest inserted matrix from stack
		[CLink]
		public static extern void rlPopMatrix();

		// Reset current matrix to identity matrix
		[CLink]
		public static extern void rlLoadIdentity();

		// Multiply the current matrix by a translation matrix
		[CLink]
		public static extern void rlTranslatef(float x, float y, float z);

		// Multiply the current matrix by a rotation matrix
		[CLink]
		public static extern void rlRotatef(float angleDeg, float x, float y, float z);

		// Multiply the current matrix by a scaling matrix
		[CLink]
		public static extern void rlScalef(float x, float y, float z);

		// Multiply the current matrix by another matrix
		[CLink]
		public static extern void rlMultMatrixf(float* matf);

		[CLink]
		public static extern void rlFrustum(double left, double right, double bottom, double top, double znear, double zfar);

		[CLink]
		public static extern void rlOrtho(double left, double right, double bottom, double top, double znear, double zfar);

		// Set the viewport area
		[CLink]
		public static extern void rlViewport(c_int x, c_int y, c_int width, c_int height);

		// Vertex data management ---------------------
		[CLink]
		public static extern void rlDrawMeshInstanced(Mesh mesh, Material material, Matrix* transforms, int count);



	}
}
