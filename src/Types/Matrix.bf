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

		/*public void ToString(ref String str, bool newline)
		{
			let n = newline ? "\n" : "";

		}*/

	}
}
