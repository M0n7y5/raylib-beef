using System;
namespace raylib_beef
{
	static
	{
		/// Clamp float value
		public static float Clamp(float value, float min, float max)
		{
			float res = value < min ? min : value;
			return res > max ? max : res;
		}

		/// Calculate linear interpolation between two vectors
		public static float Lerp(float start, float end, float amount)
		{
			return start + amount * (end - start);
		}

		/// Normalize input value within input range
		public static float Normalize(float value, float start, float end)
		{
			return (value - start) / (end - start);
		}


		/// Remap input value within input range to output range
		public static float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
		{
			return (value - inputStart) / (inputEnd - inputStart) * (outputEnd - outputStart) + outputStart;
		}

	}
}
