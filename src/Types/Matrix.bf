using System;
namespace raylib_beef.Types
{
	// Matrix type (OpenGL style 4x4 - right handed, column major)
	[CRepr]
	public struct Matrix
	{
		public float m0, m4, m8, m12;
		public float m1, m5, m9, m13;
		public float m2, m6, m10, m14;
		public float m3, m7, m11, m15;

		/*public float m11, m12, m13, m14;
		public float m21, m22, m23, m24;
		public float m31, m32, m33, m34;
		public float m41, m42, m43, m44;*/

		public static Matrix operator*(Matrix a, Matrix b)
		{
			Matrix m = default;

			var a, b;

			float* pA = (float*)(void*)&a;
			float* pB = (float*)(void*)&b;

			Span<float> mA = .(pA, 16);
			Span<float> mB = .(pB, 16);


			return m;
		}

	}
}
