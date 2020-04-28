using System;
namespace raylib_beef.Types
{
	// Matrix type (OpenGL style 4x4 - right handed, column major)
	[CRepr]
	public struct Matrix
	{
		public float m0;
		public float m4;
		public float m8;
		public float m12;
		public float m1;
		public float m5;
		public float m9;
		public float m13;
		public float m2;
		public float m6;
		public float m10;
		public float m14;
		public float m3;
		public float m7;
		public float m11;
		public float m15;
	}
}
