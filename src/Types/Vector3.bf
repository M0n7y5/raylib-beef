using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Vector3
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

		public override void ToString(String outString)
		{
			outString
				.Append(scope $"Vector3({x:00.0},{y:00.0},{z:00.0})");
		}

		// Common values
		public const Vector3 Zero = .(0);
		public const Vector3 One = .(1);
		public const Vector3 UnitX = .(1, 0, 0);
		public const Vector3 UnitY = .(0, 1, 0);
		public const Vector3 UnitZ = .(0, 0, 1);

		// Convienient operators
		[Inline]
		public static Vector3 operator+(Vector3 v1, Vector3 v2)
		{
			return .(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
		}

		[Inline]
		public static Vector3 operator+(Vector3 v, float add)
		{
			return .(v.x + add, v.y + add, v.z + add);
		}

		[Inline]
		public static Vector3 operator-(Vector3 v1, Vector3 v2)
		{
			return .(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
		}

		[Inline]
		public static Vector3 operator-(Vector3 v, float sub)
		{
			return .(v.x - sub, v.y - sub, v.z - sub);
		}

		[Inline]
		public static Vector3 operator*(Vector3 v, float scalar)
		{
			return .(v.x * scalar, v.y * scalar, v.z * scalar);
		}

		[Inline]
		public static Vector3 operator*(Vector3 v1, Vector3 v2)
		{
			return .(v1.x * v2.x, v1.y * v2.y, v1.z * v2.z);
		}

		[Inline]
		/// Calculate two vectors cross product
		public Vector3 CrossProduct(Vector3 v2)
		{
			return .(
				this.y * v2.z - this.z * v2.y,
				this.z * v2.x - this.x * v2.z,
				this.x * v2.y - this.y * v2.x
				);
		}

		[Inline]
		/// Calculate one vector perpendicular vector
		public Vector3 Perpendicular()
		{
			Vector3 result = default;

			float min = Math.Abs(this.x);
			Vector3 cardinalAxis = .(1.0f, 0.0f, 0.0f);

			if (Math.Abs(this.y) < min)
			{
				min = Math.Abs(this.y);
				Vector3 tmp = .(0.0f, 1.0f, 0.0f);
				cardinalAxis = tmp;
			}

			if (Math.Abs(this.z) < min)
			{
				Vector3 tmp = .(0.0f, 0.0f, 1.0f);
				cardinalAxis = tmp;
			}

			result = CrossProduct(cardinalAxis);

			return result;
		}

		[Inline]
		/// Calculate vector length
		public float Length()
		{
			return Math.Sqrt(
				this.x * this.x +
				this.y * this.y +
				this.z * this.z
				);
		}

		[Inline]
		/// Calculate vector square length
		public float LengthSqr()
		{
			return (this.x * this.x + this.y * this.y + this.z * this.z);
		}

		[Inline]
		/// Calculate vector square length
		public float DotProduct(Vector3 v2)
		{
			return (this.x * v2.x + this.y * v2.y + this.z * v2.z);
		}

		[Inline]
		///  Calculate distance between two vectors
		public float Distance(Vector3 v2)
		{
			float dx = v2.x - this.x;
			float dy = v2.y - this.y;
			float dz = v2.z - this.z;
			float result = Math.Sqrt(dx * dx + dy * dy + dz * dz);
			return result;
		}

		[Inline]
		public static Vector3 operator-(Vector3 v)
		{
			return .(-v.x, -v.y, -v.z);
		}

		[Inline]
		public static Vector3 operator/(Vector3 v1, Vector3 v2)
		{
			return .(v1.x / v2.x, v1.y / v2.y, v1.z / v2.z);
		}

		[Inline]
		public static Vector3 operator/(Vector3 v1, float div)
		{
			return .(v1.x / div, v1.y / div, v1.z / div);
		}

		[Inline]
		/// Normalize provided vector
		public Vector3 Normalize()
		{
			Vector3 result = default;


			float length, ilength;
			length = Length();

			if (length == 0.0f)
				length = 1.0f;

			ilength = 1.0f / length;

			result.x *= ilength;
			result.y *= ilength;
			result.z *= ilength;

			return result;
		}

		[Inline]
		/// Orthonormalize provided vectors
		/// Makes vectors normalized and orthogonal to each other
		/// Gram-Schmidt function implementation
		public void OrthoNormalize(Vector3* v2) mut
		{
			this = this.Normalize();
			Vector3 vn = this.CrossProduct(*v2);
			vn.Normalize();
			*v2 = vn.CrossProduct(this);
		}

		[Inline]
		///  Transforms a Vector3 by a given Matrix
		public Vector3 Transform(Matrix mat)
		{
			Vector3 result = default;
			float x = this.x;
			float y = this.y;
			float z = this.z;

			result.x = mat.m0 * x + mat.m4 * y + mat.m8 * z + mat.m12;
			result.y = mat.m1 * x + mat.m5 * y + mat.m9 * z + mat.m13;
			result.z = mat.m2 * x + mat.m6 * y + mat.m10 * z + mat.m14;

			return result;
		}

		[Inline]
		///  Transform a vector by quaternion rotation
		public Vector3 RotateByQuaternion(Quaternion q)
		{
			Vector3 result = default;

			result.x =
				this.x * (q.x * q.x + q.w * q.w - q.y * q.y - q.z * q.z) +
				this.y * (2 * q.x * q.y - 2 * q.w * q.z) +
				this.z * (2 * q.x * q.z + 2 * q.w * q.y);

			result.y =
				this.x * (2 * q.w * q.z + 2 * q.x * q.y) +
				this.y * (q.w * q.w - q.x * q.x + q.y * q.y - q.z * q.z) +
				this.z * (-2 * q.w * q.x + 2 * q.y * q.z);

			result.z =
				this.x * (-2 * q.w * q.y + 2 * q.x * q.z) +
				this.y * (2 * q.w * q.x + 2 * q.y * q.z) +
				this.z * (q.w * q.w - q.x * q.x - q.y * q.y + q.z * q.z);

			return result;
		}

		[Inline]
		///  Calculate linear interpolation between two vectors
		public Vector3 Lerp(Vector3 v2, float amount)
		{
			Vector3 result = default;

			result.x = this.x + amount * (v2.x - this.x);
			result.y = this.y + amount * (v2.y - this.y);
			result.z = this.z + amount * (v2.z - this.z);

			return result;
		}

		[Inline]
		///  Calculate reflected vector to normal
		public Vector3 Reflect(Vector3 normal)
		{
			// I is the original vector
			// N is the normal of the incident plane
			// R = I - (2*N*( DotProduct[ I,N] ))

			Vector3 result = default;

			float dotProduct = this.DotProduct(normal);

			result.x = this.x - (2.0f * normal.x) * dotProduct;
			result.y = this.y - (2.0f * normal.y) * dotProduct;
			result.z = this.z - (2.0f * normal.z) * dotProduct;

			return result;
		}

		[Inline]
		///  Return min value for each pair of components
		public Vector3 Min(Vector3 v2)
		{
			Vector3 result = default;

			result.x = Math.Min<float>(this.x, v2.x);
			result.y = Math.Min<float>(this.y, v2.y);
			result.z = Math.Min<float>(this.z, v2.z);

			return result;
		}

		[Inline]
		///  Return max value for each pair of components
		public Vector3 Max(Vector3 v2)
		{
			Vector3 result = default;

			result.x = Math.Max<float>(this.x, v2.x);
			result.y = Math.Max<float>(this.y, v2.y);
			result.z = Math.Max<float>(this.z, v2.z);

			return result;
		}

		[Inline]
		/// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
		/// NOTE: Assumes P is on the plane of the triangle
		public static Vector3 Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c)
		{
			Vector3 v0 = b - a;
			Vector3 v1 = c - a;
			Vector3 v2 = p - a;
			float d00 = v0.DotProduct(v0);
			float d01 = v0.DotProduct(v1);
			float d11 = v1.DotProduct(v1);
			float d20 = v2.DotProduct(v0);
			float d21 = v2.DotProduct(v1);

			float denom = d00 * d11 - d01 * d01;

			Vector3 result = default;

			result.y = (d11 * d20 - d01 * d21) / denom;
			result.z = (d00 * d21 - d01 * d20) / denom;
			result.x = 1.0f - (result.z + result.y);

			return result;
		}

		[Inline]
		/// Returns Vector3 as float array
		public float3 ToFloatV()
		{
			float3 buffer = default;

			buffer.v[0] = this.x;
			buffer.v[1] = this.y;
			buffer.v[2] = this.z;

			return buffer;
		}

		[Inline]
		/// Projects a Vector3 from screen space into object space
		public Vector3 Unproject(Matrix projection, Matrix view)
		{
			var source = this;
			Vector3 result = Vector3.Zero;

			// Calculate unproject matrix (multiply view patrix by projection matrix) and invert it
			Matrix matViewProj = view * projection;
			matViewProj = matViewProj.Invert();

			// Create quaternion from source point
			Quaternion quat = .(source.x, source.y, source.z, 1.0f);

			// Multiply quat point by unproject matrix
			quat = quat.Transform(matViewProj);

			// Normalized world points in vectors
			result.x = quat.x / quat.w;
			result.y = quat.y / quat.w;
			result.z = quat.z / quat.w;

			return result;
		}


		[Inline]
		public static bool operator==(Vector3 v1, Vector3 v2)
		{
			return (v1.x == v2.x && v1.y == v2.y && v1.z == v2.z);
		}

		[Inline]
		public static bool operator!=(Vector3 v1, Vector3 v2)
		{
			return !(v1 == v2);
		}

		[Inline]
		public static bool operator>(Vector3 v1, Vector3 v2)
		{
			return v1.x > v2.x && v1.y > v2.y && v1.z > v2.z;
		}

		[Inline]
		public static bool operator<(Vector3 v1, Vector3 v2)
		{
			return v1.x < v2.x && v1.y < v2.y && v1.z < v2.z;
		}
	}
}
