using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Vector3 : IHashable
	{
		public float x;
		public float y;
		public float z;

		public this(float x, float y, float z)
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}

		public this(float value)
		{
			this.x = value;
			this.y = value;
			this.z = value;
		}

		public this()
		{
			this = default;
		}

		// Extensions

		public int GetHashCode()
		{
			return x.GetHashCode() + y.GetHashCode() + z.GetHashCode();
		}

		public String ToString()
		{
			return new String()
				..AppendF("Vector3(\" {} \" \" {} \" \" {} \")", x, y, z);
		}

		// Common values
		public static Vector3 Zero { get { return Raymath.Vector3Zero(); } }
		public static Vector3 One { get { return Raymath.Vector3One(); } }
		public static Vector3 UnitX { get { return Vector3(1, 0, 0); } }
		public static Vector3 UnitY { get { return Vector3(0, 1, 0); } }
		public static Vector3 UnitZ { get { return Vector3(0, 0, 1); } }

		// Convienient operators
		public static bool operator==(Vector3 v1, Vector3 v2)
		{
			return (v1.x == v2.x && v1.y == v2.y && v1.z == v2.z);
		}

		public static bool operator!=(Vector3 v1, Vector3 v2)
		{
			return !(v1 == v2);
		}

		public static bool operator>(Vector3 v1, Vector3 v2)
		{
			return v1.x > v2.x && v1.y > v2.y && v1.z > v2.z;
		}

		public static bool operator<(Vector3 v1, Vector3 v2)
		{
			return v1.x < v2.x && v1.y < v2.y && v1.z < v2.z;
		}

		public static Vector3 operator+(Vector3 v1, Vector3 v2)
		{
			return Raymath.Vector3Add(v1, v2);
		}

		public static Vector3 operator-(Vector3 v1, Vector3 v2)
		{
			return Raymath.Vector3Subtract(v1, v2);
		}

		public static Vector3 operator*(Vector3 v1, Vector3 v2)
		{
			return Raymath.Vector3MultiplyV(v1, v2);
		}

		public static Vector3 operator*(Vector3 v, float scale)
		{
			return Raymath.Vector3Scale(v, scale);
		}

		public static Vector3 operator*(float scale, Vector3 v)
		{
			return Raymath.Vector3Scale(v, scale);
		}

		public static Vector3 operator/(Vector3 v1, Vector3 v2)
		{
			return Raymath.Vector3DivideV(v1, v2);
		}

		public static Vector3 operator/(Vector3 v1, float div)
		{
			return Raymath.Vector3Divide(v1, div);
		}

		public static Vector3 operator-(Vector3 v1)
		{
			return Raymath.Vector3Negate(v1);
		}
	}
}
