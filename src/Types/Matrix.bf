using System;
namespace raylib_beef.Types
{
	// Matrix type (OpenGL style 4x4 - right handed, column major)
	[CRepr]
	public struct Matrix
		: this(
		float m0, float m4, float m8, float m12,
		float m1, float m5, float m9, float m13,
		float m2, float m6, float m10, float m14,
		float m3, float m7, float m11, float m15
		)
	{
		/*public float m0, m4, m8, m12;
		public float m1, m5, m9, m13;
		public float m2, m6, m10, m14;
		public float m3, m7, m11, m15;*/

		/*public float m11, m12, m13, m14;
		public float m21, m22, m23, m24;
		public float m31, m32, m33, m34;
		public float m41, m42, m43, m44;*/

		/*public static Matrix operator*(Matrix a, Matrix b)
		{
			Matrix m = default;

			var a, b;

			float* pA = (float*)(void*)&a;
			float* pB = (float*)(void*)&b;

			Span<float> mA = .(pA, 16);
			Span<float> mB = .(pB, 16);


			return m;
		}*/

		[Inline]
		/// Compute matrix determinant
		public float Determinant()
		{
			// Cache the matrix values (speed optimization)
			float a00 = this.m0, a01 = this.m1, a02 = this.m2, a03 = this.m3;
			float a10 = this.m4, a11 = this.m5, a12 = this.m6, a13 = this.m7;
			float a20 = this.m8, a21 = this.m9, a22 = this.m10, a23 = this.m11;
			float a30 = this.m12, a31 = this.m13, a32 = this.m14, a33 = this.m15;

			float result =
				a30 * a21 * a12 * a03 - a20 * a31 * a12 * a03 - a30 * a11 * a22 * a03 + a10 * a31 * a22 * a03 +
				a20 * a11 * a32 * a03 - a10 * a21 * a32 * a03 - a30 * a21 * a02 * a13 + a20 * a31 * a02 * a13 +
				a30 * a01 * a22 * a13 - a00 * a31 * a22 * a13 - a20 * a01 * a32 * a13 + a00 * a21 * a32 * a13 +
				a30 * a11 * a02 * a23 - a10 * a31 * a02 * a23 - a30 * a01 * a12 * a23 + a00 * a31 * a12 * a23 +
				a10 * a01 * a32 * a23 - a00 * a11 * a32 * a23 - a20 * a11 * a02 * a33 + a10 * a21 * a02 * a33 +
				a20 * a01 * a12 * a33 - a00 * a21 * a12 * a33 - a10 * a01 * a22 * a33 + a00 * a11 * a22 * a33;

			return result;
		}

		[Inline]
		/// Returns the trace of the matrix (sum of the values along the diagonal)
		public float Trace()
		{
			return (this.m0 + this.m5 + this.m10 + this.m15);
		}

		[Inline]
		/// Transposes provided matrix
		public Matrix Transpose()
		{
			Matrix result = default;

			result.m0 = this.m0;
			result.m1 = this.m4;
			result.m2 = this.m8;
			result.m3 = this.m12;
			result.m4 = this.m1;
			result.m5 = this.m5;
			result.m6 = this.m9;
			result.m7 = this.m13;
			result.m8 = this.m2;
			result.m9 = this.m6;
			result.m10 = this.m10;
			result.m11 = this.m14;
			result.m12 = this.m3;
			result.m13 = this.m7;
			result.m14 = this.m11;
			result.m15 = this.m15;

			return result;
		}

		[Inline]
		/// Invert provided matrix
		public Matrix Invert()
		{
			Matrix result = default;

			// Cache the matrix values (speed optimization)
			float a00 = this.m0, a01 = this.m1, a02 = this.m2, a03 = this.m3;
			float a10 = this.m4, a11 = this.m5, a12 = this.m6, a13 = this.m7;
			float a20 = this.m8, a21 = this.m9, a22 = this.m10, a23 = this.m11;
			float a30 = this.m12, a31 = this.m13, a32 = this.m14, a33 = this.m15;

			float b00 = a00 * a11 - a01 * a10;
			float b01 = a00 * a12 - a02 * a10;
			float b02 = a00 * a13 - a03 * a10;
			float b03 = a01 * a12 - a02 * a11;
			float b04 = a01 * a13 - a03 * a11;
			float b05 = a02 * a13 - a03 * a12;
			float b06 = a20 * a31 - a21 * a30;
			float b07 = a20 * a32 - a22 * a30;
			float b08 = a20 * a33 - a23 * a30;
			float b09 = a21 * a32 - a22 * a31;
			float b10 = a21 * a33 - a23 * a31;
			float b11 = a22 * a33 - a23 * a32;

			// Calculate the invert determinant (inlined to avoid double-caching)
			float invDet = 1.0f / (b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06);

			result.m0 = (a11 * b11 - a12 * b10 + a13 * b09) * invDet;
			result.m1 = (-a01 * b11 + a02 * b10 - a03 * b09) * invDet;
			result.m2 = (a31 * b05 - a32 * b04 + a33 * b03) * invDet;
			result.m3 = (-a21 * b05 + a22 * b04 - a23 * b03) * invDet;
			result.m4 = (-a10 * b11 + a12 * b08 - a13 * b07) * invDet;
			result.m5 = (a00 * b11 - a02 * b08 + a03 * b07) * invDet;
			result.m6 = (-a30 * b05 + a32 * b02 - a33 * b01) * invDet;
			result.m7 = (a20 * b05 - a22 * b02 + a23 * b01) * invDet;
			result.m8 = (a10 * b10 - a11 * b08 + a13 * b06) * invDet;
			result.m9 = (-a00 * b10 + a01 * b08 - a03 * b06) * invDet;
			result.m10 = (a30 * b04 - a31 * b02 + a33 * b00) * invDet;
			result.m11 = (-a20 * b04 + a21 * b02 - a23 * b00) * invDet;
			result.m12 = (-a10 * b09 + a11 * b07 - a12 * b06) * invDet;
			result.m13 = (a00 * b09 - a01 * b07 + a02 * b06) * invDet;
			result.m14 = (-a30 * b03 + a31 * b01 - a32 * b00) * invDet;
			result.m15 = (a20 * b03 - a21 * b01 + a22 * b00) * invDet;

			return result;
		}


		[Inline]
		/// Normalize provided matrix
		public Matrix Normalize()
		{
			Matrix result = default;

			float det = this.Determinant();

			result.m0 = this.m0 / det;
			result.m1 = this.m1 / det;
			result.m2 = this.m2 / det;
			result.m3 = this.m3 / det;
			result.m4 = this.m4 / det;
			result.m5 = this.m5 / det;
			result.m6 = this.m6 / det;
			result.m7 = this.m7 / det;
			result.m8 = this.m8 / det;
			result.m9 = this.m9 / det;
			result.m10 = this.m10 / det;
			result.m11 = this.m11 / det;
			result.m12 = this.m12 / det;
			result.m13 = this.m13 / det;
			result.m14 = this.m14 / det;
			result.m15 = this.m15 / det;

			return result;
		}

		[Inline]
		/// Returns identity matrix
		public static Matrix Identity()
		{
			return .(
				1.0f, 0.0f, 0.0f, 0.0f,
				0.0f, 1.0f, 0.0f, 0.0f,
				0.0f, 0.0f, 1.0f, 0.0f,
				0.0f, 0.0f, 0.0f, 1.0f
				);
		}

		[Inline]
		public static Matrix operator+(Matrix left, Matrix right)
		{
			Matrix result = Identity();

			result.m0 = left.m0 + right.m0;
			result.m1 = left.m1 + right.m1;
			result.m2 = left.m2 + right.m2;
			result.m3 = left.m3 + right.m3;
			result.m4 = left.m4 + right.m4;
			result.m5 = left.m5 + right.m5;
			result.m6 = left.m6 + right.m6;
			result.m7 = left.m7 + right.m7;
			result.m8 = left.m8 + right.m8;
			result.m9 = left.m9 + right.m9;
			result.m10 = left.m10 + right.m10;
			result.m11 = left.m11 + right.m11;
			result.m12 = left.m12 + right.m12;
			result.m13 = left.m13 + right.m13;
			result.m14 = left.m14 + right.m14;
			result.m15 = left.m15 + right.m15;

			return result;
		}

		[Inline]
		public static Matrix operator-(Matrix left, Matrix right)
		{
			Matrix result = Identity();

			result.m0 = left.m0 - right.m0;
			result.m1 = left.m1 - right.m1;
			result.m2 = left.m2 - right.m2;
			result.m3 = left.m3 - right.m3;
			result.m4 = left.m4 - right.m4;
			result.m5 = left.m5 - right.m5;
			result.m6 = left.m6 - right.m6;
			result.m7 = left.m7 - right.m7;
			result.m8 = left.m8 - right.m8;
			result.m9 = left.m9 - right.m9;
			result.m10 = left.m10 - right.m10;
			result.m11 = left.m11 - right.m11;
			result.m12 = left.m12 - right.m12;
			result.m13 = left.m13 - right.m13;
			result.m14 = left.m14 - right.m14;
			result.m15 = left.m15 - right.m15;

			return result;
		}

		[Inline]
		public static Matrix operator*(Matrix left, Matrix right)
		{
			Matrix result = Identity();

			result.m0 = left.m0 * right.m0 + left.m1 * right.m4 + left.m2 * right.m8 + left.m3 * right.m12;
			result.m1 = left.m0 * right.m1 + left.m1 * right.m5 + left.m2 * right.m9 + left.m3 * right.m13;
			result.m2 = left.m0 * right.m2 + left.m1 * right.m6 + left.m2 * right.m10 + left.m3 * right.m14;
			result.m3 = left.m0 * right.m3 + left.m1 * right.m7 + left.m2 * right.m11 + left.m3 * right.m15;
			result.m4 = left.m4 * right.m0 + left.m5 * right.m4 + left.m6 * right.m8 + left.m7 * right.m12;
			result.m5 = left.m4 * right.m1 + left.m5 * right.m5 + left.m6 * right.m9 + left.m7 * right.m13;
			result.m6 = left.m4 * right.m2 + left.m5 * right.m6 + left.m6 * right.m10 + left.m7 * right.m14;
			result.m7 = left.m4 * right.m3 + left.m5 * right.m7 + left.m6 * right.m11 + left.m7 * right.m15;
			result.m8 = left.m8 * right.m0 + left.m9 * right.m4 + left.m10 * right.m8 + left.m11 * right.m12;
			result.m9 = left.m8 * right.m1 + left.m9 * right.m5 + left.m10 * right.m9 + left.m11 * right.m13;
			result.m10 = left.m8 * right.m2 + left.m9 * right.m6 + left.m10 * right.m10 + left.m11 * right.m14;
			result.m11 = left.m8 * right.m3 + left.m9 * right.m7 + left.m10 * right.m11 + left.m11 * right.m15;
			result.m12 = left.m12 * right.m0 + left.m13 * right.m4 + left.m14 * right.m8 + left.m15 * right.m12;
			result.m13 = left.m12 * right.m1 + left.m13 * right.m5 + left.m14 * right.m9 + left.m15 * right.m13;
			result.m14 = left.m12 * right.m2 + left.m13 * right.m6 + left.m14 * right.m10 + left.m15 * right.m14;
			result.m15 = left.m12 * right.m3 + left.m13 * right.m7 + left.m14 * right.m11 + left.m15 * right.m15;

			return result;
		}

		[Inline]
		/// Returns translation matrix
		public static Matrix Translate(float x, float y, float z)
		{
			return .(
				1.0f, 0.0f, 0.0f, x,
				0.0f, 1.0f, 0.0f, y,
				0.0f, 0.0f, 1.0f, z,
				0.0f, 0.0f, 0.0f, 1.0f
				);
		}

		[Inline]
		/// Create rotation matrix from axis and angle
		/// NOTE: Angle should be provided in radians
		public static Matrix Rotate(Vector3 axis, float angle)
		{
			Matrix result = default;

			float x = axis.x, y = axis.y, z = axis.z;

			float lengthSquared = x * x + y * y + z * z;

			if ((lengthSquared != 1.0f) && (lengthSquared != 0.0f))
			{
				float inverseLength = 1.0f / Math.Sqrt(lengthSquared);
				x *= inverseLength;
				y *= inverseLength;
				z *= inverseLength;
			}

			float sinres = Math.Sin(angle);
			float cosres = Math.Cos(angle);
			float t = 1.0f - cosres;

			result.m0 = x * x * t + cosres;
			result.m1 = y * x * t + z * sinres;
			result.m2 = z * x * t - y * sinres;
			result.m3 = 0.0f;

			result.m4 = x * y * t - z * sinres;
			result.m5 = y * y * t + cosres;
			result.m6 = z * y * t + x * sinres;
			result.m7 = 0.0f;

			result.m8 = x * z * t + y * sinres;
			result.m9 = y * z * t - x * sinres;
			result.m10 = z * z * t + cosres;
			result.m11 = 0.0f;

			result.m12 = 0.0f;
			result.m13 = 0.0f;
			result.m14 = 0.0f;
			result.m15 = 1.0f;

			return result;
		}

		[Inline]
		/// Returns x-rotation matrix (angle in radians)
		public static Matrix RotateX(Vector3 axis, float angle)
		{
			Matrix result = Identity();

			float cosres = Math.Cos(angle);
			float sinres = Math.Sin(angle);

			result.m5 = cosres;
			result.m6 = -sinres;
			result.m9 = sinres;
			result.m10 = cosres;
			return result;
		}

		[Inline]
		/// Returns y-rotation matrix (angle in radians)
		public static Matrix RotateY(Vector3 axis, float angle)
		{
			Matrix result = Identity();

			float cosres = Math.Cos(angle);
			float sinres = Math.Sin(angle);

			result.m0 = cosres;
			result.m2 = sinres;
			result.m8 = -sinres;
			result.m10 = cosres;
			return result;
		}

		[Inline]
		/// Returns z-rotation matrix (angle in radians)
		public static Matrix RotateZ(Vector3 axis, float angle)
		{
			Matrix result = Identity();

			float cosres = Math.Cos(angle);
			float sinres = Math.Sin(angle);

			result.m0 = cosres;
			result.m1 = -sinres;
			result.m4 = sinres;
			result.m5 = cosres;
			return result;
		}

		[Inline]
		/// Returns xyz-rotation matrix (angles in radians)
		public static Matrix RotateXYZ(Vector3 ang)
		{
			Matrix result = Identity();

			float cosz = Math.Cos(-ang.z);
			float sinz = Math.Sin(-ang.z);
			float cosy = Math.Cos(-ang.y);
			float siny = Math.Sin(-ang.y);
			float cosx = Math.Cos(-ang.x);
			float sinx = Math.Sin(-ang.x);

			result.m0 = cosz * cosy;
			result.m4 = (cosz * siny * sinx) - (sinz * cosx);
			result.m8 = (cosz * siny * cosx) + (sinz * sinx);

			result.m1 = sinz * cosy;
			result.m5 = (sinz * siny * sinx) + (cosz * cosx);
			result.m9 = (sinz * siny * cosx) - (cosz * sinx);

			result.m2 = -siny;
			result.m6 = cosy * sinx;
			result.m10 = cosy * cosx;
			return result;
		}

		[Inline]
		/// Returns zyx-rotation matrix (angles in radians)
		public static Matrix RotateZYX(Vector3 ang)
		{
			Matrix result = Identity();

			float cz = Math.Cos(ang.z);
			float sz = Math.Sin(ang.z);
			float cy = Math.Cos(ang.y);
			float sy = Math.Sin(ang.y);
			float cx = Math.Cos(ang.x);
			float sx = Math.Sin(ang.x);

			result.m0 = cz * cy;
			result.m1 = cz * sy * sx - cx * sz;
			result.m2 = sz * sx + cz * cx * sy;
			result.m3 = 0;

			result.m4 = cy * sz;
			result.m5 = cz * cx + sz * sy * sx;
			result.m6 = cx * sz * sy - cz * sx;
			result.m7 = 0;

			result.m8 = -sy;
			result.m9 = cy * sx;
			result.m10 = cy * cx;
			result.m11 = 0;

			result.m12 = 0;
			result.m13 = 0;
			result.m14 = 0;
			result.m15 = 1;
			return result;
		}

		[Inline]
		/// Returns scaling matrix
		public static Matrix Scale(float x, float y, float z)
		{
			return .(
				x, 0.0f, 0.0f, 0.0f,
				0.0f, y, 0.0f, 0.0f,
				0.0f, 0.0f, z, 0.0f,
				0.0f, 0.0f, 0.0f, 1.0f
				);
		}

		[Inline]
		/// Returns perspective projection matrix
		public static Matrix Frustum(
			double left, double right, double bottom,
			double top, double near, double far)
		{
			Matrix result = default;

			float rl = (float)(right - left);
			float tb = (float)(top - bottom);
			float fn = (float)(far - near);

			result.m0 = ((float)near * 2.0f) / rl;
			result.m1 = 0.0f;
			result.m2 = 0.0f;
			result.m3 = 0.0f;

			result.m4 = 0.0f;
			result.m5 = ((float)near * 2.0f) / tb;
			result.m6 = 0.0f;
			result.m7 = 0.0f;

			result.m8 = ((float)right + (float)left) / rl;
			result.m9 = ((float)top + (float)bottom) / tb;
			result.m10 = -((float)far + (float)near) / fn;
			result.m11 = -1.0f;

			result.m12 = 0.0f;
			result.m13 = 0.0f;
			result.m14 = -((float)far * (float)near * 2.0f) / fn;
			result.m15 = 0.0f;

			return result;
		}

		[Inline]
		/// Returns perspective projection matrix
		/// NOTE: Angle should be provided in radians
		public static Matrix Perspective(double fovy, double aspect, double near, double far)
		{
			double top = near * Math.Tan(fovy * 0.5);
			double right = top * aspect;
			Matrix result = Frustum(-right, right, -top, top, near, far);

			return result;
		}

		[Inline]
		/// Returns orthographic projection matrix
		public static Matrix Ortho(double left, double right, double bottom, double top, double near, double far)
		{
			Matrix result = default;

			float rl = (float)(right - left);
			float tb = (float)(top - bottom);
			float fn = (float)(far - near);

			result.m0 = 2.0f / rl;
			result.m1 = 0.0f;
			result.m2 = 0.0f;
			result.m3 = 0.0f;
			result.m4 = 0.0f;
			result.m5 = 2.0f / tb;
			result.m6 = 0.0f;
			result.m7 = 0.0f;
			result.m8 = 0.0f;
			result.m9 = 0.0f;
			result.m10 = -2.0f / fn;
			result.m11 = 0.0f;
			result.m12 = -((float)left + (float)right) / rl;
			result.m13 = -((float)top + (float)bottom) / tb;
			result.m14 = -((float)far + (float)near) / fn;
			result.m15 = 1.0f;

			return result;
		}

		[Inline]
		/// Returns camera look-at matrix (view matrix)
		public static Matrix LookAt(Vector3 eye, Vector3 target, Vector3 up)
		{
			Matrix result = default;

			Vector3 z = eye - target;
			z.Normalize();
			Vector3 x = up.CrossProduct(z);
			x.Normalize();
			Vector3 y = z.CrossProduct(x);

			result.m0 = x.x;
			result.m1 = y.x;
			result.m2 = z.x;
			result.m3 = 0.0f;
			result.m4 = x.y;
			result.m5 = y.y;
			result.m6 = z.y;
			result.m7 = 0.0f;
			result.m8 = x.z;
			result.m9 = y.z;
			result.m10 = z.z;
			result.m11 = 0.0f;
			result.m12 = -x.DotProduct(eye);
			result.m13 = -y.DotProduct(eye);
			result.m14 = -z.DotProduct(eye);
			result.m15 = 1.0f;

			return result;
		}

		
		[Inline]
		/// Returns float array of matrix data
		public float16 ToFloatV()
		{
			float16 buffer = default;

			buffer.v[0] = this.m0;
			buffer.v[1] = this.m1;
			buffer.v[2] = this.m2;
			buffer.v[3] = this.m3;
			buffer.v[4] = this.m4;
			buffer.v[5] = this.m5;
			buffer.v[6] = this.m6;
			buffer.v[7] = this.m7;
			buffer.v[8] = this.m8;
			buffer.v[9] = this.m9;
			buffer.v[10] = this.m10;
			buffer.v[11] = this.m11;
			buffer.v[12] = this.m12;
			buffer.v[13] = this.m13;
			buffer.v[14] = this.m14;
			buffer.v[15] = this.m15;

			return buffer;
		}
	}
}
