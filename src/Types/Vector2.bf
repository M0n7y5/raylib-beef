using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Vector2
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

		public override void ToString(String outStr)
		{
			outStr.AppendF("Vector2({}, {})", x, y);
		}

		// Common values
		public const Vector2 Zero = .(0);
		public const Vector2 One = .(1f);
		public const Vector2 UnitX = .(1, 0);
		public const Vector2 UnitY = .(0, 1);

		// Convenient operators

		[Inline]
		public static Vector2 operator+(Vector2 v1, Vector2 v2)
		{
			return .(v1.x + v2.x, v1.y + v2.y);
		}

		[Inline]
		public static Vector2 operator+(Vector2 v1, float f)
		{
			return .(v1.x + f, v1.y + f);
		}

		[Inline]
		public static Vector2 operator-(Vector2 v1, Vector2 v2)
		{
			return .(v1.x - v2.x, v1.y - v2.y);
		}

		[Inline]
		public static Vector2 operator-(Vector2 v1, float f)
		{
			return .(v1.x - f, v1.y - f);
		}

		[Inline]
		/// Calculate vector length
		public float Length()
		{
			return Math.Sqrt((this.x * this.x) + (this.y * this.y));
		}

		[Inline]
		/// Calculate vector square length
		public float LengthSqr()
		{
			return (this.x * this.x) + (this.y * this.y);
		}

		[Inline]
		/// Calculate two vectors dot product
		public float DotProduct(Vector2 v2)
		{
			return (this.x * v2.x + this.y * v2.y);
		}

		[Inline]
		/// Calculate distance between two vectors
		public float Distance(Vector2 v2)
		{
			return Math.Sqrt((this.x - v2.x) * (this.x - v2.x) +
				(this.y - v2.y) * (this.y - v2.y));
		}

		[Inline]
		/// Calculate angle from two vectors in X-axis
		public float Angle(Vector2 v2)
		{
			var result =
				Math.Atan2(v2.y - this.y, v2.x - this.x)
				* 180 / Math.PI_f;
			if (result < 0) result += 360.0f;
			return result;
		}

		[Inline]
		public static Vector2 operator*(Vector2 v, float scale)
		{
			return .(v.x * scale, v.y * scale);
		}

		[Inline]
		public static Vector2 operator*(Vector2 v1, Vector2 v2)
		{
			return .(v1.x * v2.x, v1.y * v2.y);
		}

		[Inline]
		public static Vector2 operator-(Vector2 v1)
		{
			return .(-v1.x, -v1.y);
		}

		[Inline]
		public static Vector2 operator/(Vector2 v1, Vector2 v2)
		{
			return .(v1.x / v2.x, v1.y / v2.y);
		}

		[Inline]
		public static Vector2 operator/(Vector2 v1, float div)
		{
			return .(v1.x / div, v1.y / div);
		}

		[Inline]
		/// Normalize provided vector
		public Vector2 Normalize(Vector2 v2)
		{
			return this * (1 / Length());
		}

		[Inline]
		/// Calculate linear interpolation between two vectors
		public Vector2 Lerp(Vector2 v2, float amount)
		{
			Vector2 result = default;

			result.x = this.x + amount * (v2.x - this.x);
			result.y = this.y + amount * (v2.y - this.y);

			return result;
		}

		[Inline]
		/// Calculate reflected vector to normal
		public Vector2 Reflect(Vector2 normal)
		{
			Vector2 result = default;

			float dotProduct = DotProduct(normal);
			result.x = this.x - (2.0f * normal.x) * dotProduct;
			result.y = this.y - (2.0f * normal.y) * dotProduct;

			return result;
		}

		[Inline]
		/// Rotate Vector by float in Degrees.
		public Vector2 Rotate(float degs)
		{
			float rads = degs * Raylib.DEG2RAD;
			Vector2 result = .(
				this.x * Math.Cos(rads) - this.y * Math.Sin(rads),
				this.x * Math.Sin(rads) + this.y * Math.Cos(rads)
				);
			return result;
		}

		[Inline]
		/// Move Vector towards target
		public Vector2 MoveTowards(Vector2 target, float maxDistance)
		{
			Vector2 result = default;
			float dx = target.x - this.x;
			float dy = target.y - this.y;
			float value = (dx * dx) + (dy * dy);

			if ((value == 0) || ((maxDistance >= 0) &&
				(value <= maxDistance * maxDistance)))
				result = target;

			float dist = Math.Sqrt(value);

			result.x = this.x + dx / dist * maxDistance;
			result.y = this.y + dy / dist * maxDistance;

			return result;
		}

		// CUSTOMS -------------------------------------------
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
	}
}
