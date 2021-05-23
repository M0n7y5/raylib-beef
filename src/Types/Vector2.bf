using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Vector2 : IHashable
	{
		public float x;
		public float y;

		public this(float x, float y)
		{
			this.x = x;
			this.y = y;
		}

		public this(float value)
		{
			this.x = value;
			this.y = value;
		}

		public int GetHashCode()
		{
			return x.GetHashCode() + y.GetHashCode();
		}

		public override void ToString(String outStr)
		{
			outStr.AppendF("Vector2({}, {})", x, y);
		}

		// Common values
		public static Vector2 Zero { get { return Raymath.Vector2Zero(); } }
		public static Vector2 One { get { return Raymath.Vector2One(); } }
		public static Vector2 UnitX { get { return Vector2(1, 0); } }
		public static Vector2 UnitY { get { return Vector2(0, 1); } }

		// Convienient operators
		public static bool operator==(Vector2 v1, Vector2 v2)
		{
			return (v1.x == v2.x && v1.y == v2.y);
		}

		public static bool operator!=(Vector2 v1, Vector2 v2)
		{
			return !(v1 == v2);
		}

		public static bool operator>(Vector2 v1, Vector2 v2)
		{
			return v1.x > v2.x && v1.y > v2.y;
		}

		public static bool operator<(Vector2 v1, Vector2 v2)
		{
			return v1.x < v2.x && v1.y < v2.y;
		}

		public static Vector2 operator+(Vector2 v1, Vector2 v2)
		{
			return Raymath.Vector2Add(v1, v2);
		}

		public static Vector2 operator+(Vector2 v1, float v2)
		{
			return .(v1.x + v2, v1.y + v2);
		}

		public static Vector2 operator-(Vector2 v1, Vector2 v2)
		{
			return Raymath.Vector2Subtract(v1, v2);
		}

		public static Vector2 operator*(Vector2 v1, Vector2 v2)
		{
			return Raymath.Vector2MultiplyV(v1, v2);
		}

		public static Vector2 operator*(Vector2 v, float scale)
		{
			return Raymath.Vector2Scale(v, scale);
		}

		public static Vector2 operator*(float scale, Vector2 v)
		{
			return Raymath.Vector2Scale(v, scale);
		}

		public static Vector2 operator/(Vector2 v1, Vector2 v2)
		{
			return Raymath.Vector2DivideV(v1, v2);
		}

		public static Vector2 operator/(Vector2 v1, float div)
		{
			return Raymath.Vector2Divide(v1, div);
		}

		public static Vector2 operator-(Vector2 v1)
		{
			return Raymath.Vector2Negate(v1);
		}
	}
}
