using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Quaternion
	{
		public float x;
		public float y;
		public float z;
		public float w;

		public this(float x, float y, float z, float w)
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.w = w;
		}

		public this(float value)
		{
			x = value;
			y = value;
			z = value;
			w = value;
		}

		public int GetHashCode()
		{
			return x.GetHashCode() + y.GetHashCode() + z.GetHashCode() + w.GetHashCode();
		}

		public String ToString()
		{
			return new String()
				..AppendF("Vector4(\" {} \" \" {} \" \" {} \" \" {} \")", x, y, z, w);
		}

		// convienient operators
		public static bool operator==(Quaternion v1, Quaternion v2)
		{
			return (v1.x == v2.x && v1.y == v2.y && v1.z == v2.z && v1.w == v2.w);
		}

		public static bool operator!=(Quaternion v1, Quaternion v2)
		{
			return !(v1 == v2);
		}

		public static bool operator>(Quaternion v1, Quaternion v2)
		{
			return v1.x > v2.x && v1.y > v2.y && v1.z > v2.z && v1.w > v2.w;
		}

		public static bool operator<(Quaternion v1, Quaternion v2)
		{
			return v1.x < v2.x && v1.y < v2.y && v1.z < v2.z && v1.w < v2.w;
		}
	}
}
