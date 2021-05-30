using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Vector4
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

		[Inline]
		public static Quaternion operator+(Quaternion q1, Quaternion q2)
		{
			return .(q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w);
		}

		[Inline]
		public static Quaternion operator+(Quaternion q, float add)
		{
			return .(q.x + add, q.y + add, q.z + add, q.w + add);
		}

		[Inline]
		public static Quaternion operator-(Quaternion q1, Quaternion q2)
		{
			return .(q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w);
		}

		[Inline]
		public static Quaternion operator-(Quaternion q, float sub)
		{
			return .(q.x - sub, q.y - sub, q.z - sub, q.w - sub);
		}

		[Inline]
		/// Returns identity quaternion
		public static Quaternion Identity()
		{
			return .(0.0f, 0.0f, 0.0f, 1.0f);
		}

		[Inline]
		/// Computes the length of a quaternion
		public float Length()
		{
			return Math.Sqrt(
				this.x * this.x +
				this.y * this.y +
				this.z * this.z +
				this.w * this.w);
		}

		[Inline]
		/// Computes the length of a quaternion
		public Quaternion Normalize()
		{
			Quaternion result = default;

			float length, ilength;
			length = this.Length();
			if (length == 0.0f) length = 1.0f;
			ilength = 1.0f / length;

			result.x = this.x * ilength;
			result.y = this.y * ilength;
			result.z = this.z * ilength;
			result.w = this.w * ilength;

			return result;
		}

		[Inline]
		/// Computes the length of a quaternion
		public Quaternion Invert() mut
		{
			float length = Length();
			float lengthSq = length * length;

			if (lengthSq != 0.0)
			{
				float i = 1.0f / lengthSq;

				this.x *= -i;
				this.y *= -i;
				this.z *= -i;
				this.w *= i;
			}
			return this;
		}

		[Inline]
		public static Quaternion operator*(Quaternion q1, Quaternion q2)
		{
			Quaternion result = default;

			float qax = q1.x, qay = q1.y, qaz = q1.z, qaw = q1.w;
			float qbx = q2.x, qby = q2.y, qbz = q2.z, qbw = q2.w;

			result.x = qax * qbw + qaw * qbx + qay * qbz - qaz * qby;
			result.y = qay * qbw + qaw * qby + qaz * qbx - qax * qbz;
			result.z = qaz * qbw + qaw * qbz + qax * qby - qay * qbx;
			result.w = qaw * qbw - qax * qbx - qay * qby - qaz * qbz;

			return result;
		}

		[Inline]
		public static Quaternion operator*(Quaternion q, float mul)
		{
			Quaternion result = default;

			float qax = q.x, qay = q.y, qaz = q.z, qaw = q.w;

			result.x = qax * mul + qaw * mul + qay * mul - qaz * mul;
			result.y = qay * mul + qaw * mul + qaz * mul - qax * mul;
			result.z = qaz * mul + qaw * mul + qax * mul - qay * mul;
			result.w = qaw * mul - qax * mul - qay * mul - qaz * mul;

			return result;
		}

		[Inline]
		public static Quaternion operator/(Quaternion q1, Quaternion q2)
		{
			return .(q1.x / q2.x, q1.y / q2.y, q1.z / q2.z, q1.w / q2.w);
		}

		[Inline]
		/// Calculate linear interpolation between two quaternions
		public Quaternion Lerp(Quaternion q2, float amount)
		{
			Quaternion result = default;

			result.x = this.x + amount * (q2.x - this.x);
			result.y = this.y + amount * (q2.y - this.y);
			result.z = this.z + amount * (q2.z - this.z);
			result.w = this.w + amount * (q2.w - this.w);

			return result;
		}

		[Inline]
		/// Calculate slerp-optimized interpolation between two quaternions
		public Quaternion Nlerp(Quaternion q2, float amount)
		{
			Quaternion result = Lerp(q2, amount);
			result = result.Normalize();

			return result;
		}

		[Inline]
		/// Calculates spherical linear interpolation between two quaternions
		public Quaternion Slerp(Quaternion q2, float amount)
		{
			var q2;
			Quaternion result = default;

			float cosHalfTheta = this.x * q2.x + this.y * q2.y + this.z * q2.z + this.w * q2.w;

			if (cosHalfTheta < 0)
			{
				q2.x = -q2.x;
				q2.y = -q2.y;
				q2.z = -q2.z;
				q2.w = -q2.w;
				cosHalfTheta = -cosHalfTheta;
			}

			if (Math.Abs(cosHalfTheta) >= 1.0f)
				result = this;

			else if (cosHalfTheta > 0.95f) result = Nlerp(q2, amount);
			else
			{
				float halfTheta = Math.Acos(cosHalfTheta);
				float sinHalfTheta = Math.Sqrt(1.0f - cosHalfTheta * cosHalfTheta);

				if (Math.Abs(sinHalfTheta) < 0.001f)
				{
					result.x = (this.x * 0.5f + q2.x * 0.5f);
					result.y = (this.y * 0.5f + q2.y * 0.5f);
					result.z = (this.z * 0.5f + q2.z * 0.5f);
					result.w = (this.w * 0.5f + q2.w * 0.5f);
				}
				else
				{
					float ratioA = Math.Sin((1 - amount) * halfTheta) / sinHalfTheta;
					float ratioB = Math.Sin(amount * halfTheta) / sinHalfTheta;

					result.x = (this.x * ratioA + q2.x * ratioB);
					result.y = (this.y * ratioA + q2.y * ratioB);
					result.z = (this.z * ratioA + q2.z * ratioB);
					result.w = (this.w * ratioA + q2.w * ratioB);
				}
			}

			return result;
		}

		[Inline]
		/// Calculate quaternion based on the rotation from one vector to another
		public static Quaternion FromVector3ToVector3(Vector3 from, Vector3 to)
		{
			Quaternion result = default;

			float cos2Theta = from.DotProduct(to);
			Vector3 cross = from.CrossProduct(to);

			result.x = cross.x;
			result.y = cross.y;
			result.z = cross.z;
			result.w = 1.0f + cos2Theta;// NOTE: Added QuaternioIdentity()

			// Normalize to essentially nlerp the original and identity to 0.5
			result = result.Normalize();

			// Above lines are equivalent to:
			//Quaternion result = QuaternionNlerp(q, QuaternionIdentity(), 0.5f);

			return result;
		}

		[Inline]
		/// Returns a quaternion for a given rotation matrix
		public static Quaternion FromMatrix(Matrix mat)
		{
			Quaternion result = default;

			if ((mat.m0 > mat.m5) && (mat.m0 > mat.m10))
			{
				float s = Math.Sqrt(1.0f + mat.m0 - mat.m5 - mat.m10) * 2;

				result.x = 0.25f * s;
				result.y = (mat.m4 + mat.m1) / s;
				result.z = (mat.m2 + mat.m8) / s;
				result.w = (mat.m9 - mat.m6) / s;
			}
			else if (mat.m5 > mat.m10)
			{
				float s = Math.Sqrt(1.0f + mat.m5 - mat.m0 - mat.m10) * 2;
				result.x = (mat.m4 + mat.m1) / s;
				result.y = 0.25f * s;
				result.z = (mat.m9 + mat.m6) / s;
				result.w = (mat.m2 - mat.m8) / s;
			}
			else
			{
				float s = Math.Sqrt(1.0f + mat.m10 - mat.m0 - mat.m5) * 2;
				result.x = (mat.m2 + mat.m8) / s;
				result.y = (mat.m9 + mat.m6) / s;
				result.z = 0.25f * s;
				result.w = (mat.m4 - mat.m1) / s;
			}


			return result;
		}

		[Inline]
		/// Returns a matrix for a given quaternion
		public static Matrix ToMatrix(Quaternion q)
		{
			Matrix result = Matrix.Identity();

			float a2 = q.x * q.x;
			float b2 = q.y * q.y;
			float c2 = q.z * q.z;
			float ac = q.x * q.z;
			float ab = q.x * q.y;
			float bc = q.y * q.z;
			float ad = q.w * q.x;
			float bd = q.w * q.y;
			float cd = q.w * q.z;

			result.m0 = 1 - 2 * (b2 + c2);
			result.m1 = 2 * (ab + cd);
			result.m2 = 2 * (ac - bd);

			result.m4 = 2 * (ab - cd);
			result.m5 = 1 - 2 * (a2 + c2);
			result.m6 = 2 * (bc + ad);

			result.m8 = 2 * (ac + bd);
			result.m9 = 2 * (bc - ad);
			result.m10 = 1 - 2 * (a2 + b2);

			return result;
		}

		[Inline]
		/// Returns rotation quaternion for an angle and axis
		/// NOTE: angle must be provided in radians
		public static Quaternion FromAxisAngle(Vector3 axis, float angle)
		{
			var angle, axis;
			Quaternion result = .(0.0f, 0.0f, 0.0f, 1.0f);

			if (axis.Length() != 0.0f)

				angle *= 0.5f;

			axis = axis.Normalize();

			float sinres = Math.Sin(angle);
			float cosres = Math.Cos(angle);

			result.x = axis.x * sinres;
			result.y = axis.y * sinres;
			result.z = axis.z * sinres;
			result.w = cosres;

			result = result.Normalize();

			return result;
		}

		[Inline]
		/// Returns the rotation angle and axis for a given quaternion
		public (Vector3 Axis, float Angle) ToAxisAngle()
		{
			var q = this;
			if (Math.Abs(q.w) > 1.0f)
				q = q.Normalize();

			Vector3 resAxis = .(0.0f, 0.0f, 0.0f);
			float resAngle = 2.0f * Math.Acos(q.w);
			float den = Math.Sqrt(1.0f - q.w * q.w);

			if (den > 0.0001f)
			{
				resAxis.x = q.x / den;
				resAxis.y = q.y / den;
				resAxis.z = q.z / den;
			}
			else
			{
				// This occurs when the angle is zero.
				// Not a problem: just set an arbitrary normalized axis.
				resAxis.x = 1.0f;
			}

			return (resAxis, resAngle);
		}

		[Inline]
		/// Returns the quaternion equivalent to Euler angles
		/// NOTE: Rotation order is ZYX
		public static Quaternion FromEuler(float pitch, float yaw, float roll)
		{
			Quaternion q = default;

			float x0 = Math.Cos(pitch * 0.5f);
			float x1 = Math.Sin(pitch * 0.5f);
			float y0 = Math.Cos(yaw * 0.5f);
			float y1 = Math.Sin(yaw * 0.5f);
			float z0 = Math.Cos(roll * 0.5f);
			float z1 = Math.Sin(roll * 0.5f);

			q.x = x1 * y0 * z0 - x0 * y1 * z1;
			q.y = x0 * y1 * z0 + x1 * y0 * z1;
			q.z = x0 * y0 * z1 - x1 * y1 * z0;
			q.w = x0 * y0 * z0 + x1 * y1 * z1;

			return q;
		}

		[Inline]
		/// Returns the quaternion equivalent to Euler angles
		/// NOTE: Rotation order is ZYX
		public Vector3 ToEuler()
		{
			Vector3 result = default;

			// roll (x-axis rotation)
			float x0 = 2.0f * (this.w * this.x + this.y * this.z);
			float x1 = 1.0f - 2.0f * (this.x * this.x + this.y * this.y);
			result.x = Math.Atan2(x0, x1) * Raylib.RAD2DEG;

			// pitch (y-axis rotation)
			float y0 = 2.0f * (this.w * this.y - this.z * this.x);
			y0 = y0 > 1.0f ? 1.0f : y0;
			y0 = y0 < -1.0f ? -1.0f : y0;
			result.y = Math.Asin(y0) * Raylib.RAD2DEG;

			// yaw (z-axis rotation)
			float z0 = 2.0f * (this.w * this.z + this.x * this.y);
			float z1 = 1.0f - 2.0f * (this.y * this.y + this.z * this.z);
			result.z = Math.Atan2(z0, z1) * Raylib.RAD2DEG;

			return result;
		}

		[Inline]
		/// Transform a quaternion given a transformation matrix
		public Quaternion Transform(Matrix mat)
		{
			Quaternion result = default;

			result.x =
				mat.m0 * this.x + mat.m4 * this.y +
				mat.m8 * this.z + mat.m12 * this.w;

			result.y =
				mat.m1 * this.x + mat.m5 * this.y +
				mat.m9 * this.z + mat.m13 * this.w;

			result.z =
				mat.m2 * this.x + mat.m6 * this.y +
				mat.m10 * this.z + mat.m14 * this.w;

			result.w =
				mat.m3 * this.x + mat.m7 * this.y +
				mat.m11 * this.z + mat.m15 * this.w;

			return result;
		}



		[Inline]
		public static bool operator==(Vector4 v1, Vector4 v2)
		{
			return (
				v1.x == v2.x &&
				v1.y == v2.y &&
				v1.z == v2.z &&
				v1.w == v2.w);
		}

		[Inline]
		public static bool operator!=(Vector4 v1, Vector4 v2)
		{
			return !(v1 == v2);
		}

		[Inline]
		public static bool operator>(Vector4 v1, Vector4 v2)
		{
			return v1.x > v2.x && v1.y > v2.y && v1.z > v2.z && v1.w > v2.w;
		}

		[Inline]
		public static bool operator<(Vector4 v1, Vector4 v2)
		{
			return v1.x < v2.x && v1.y < v2.y && v1.z < v2.z && v1.w < v2.w;
		}
	}
}
