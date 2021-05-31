using System;
using raylib_beef.Enums;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	public class Raylib
	{
		public const char8* RAYLIB_VERSION = "3.7";

		public const float DEG2RAD = Math.PI_f / 180.0f;
		public const float RAD2DEG = 180.0f / Math.PI_f;

		public const int MAX_SHADER_LOCATIONS = 32;
		public const int MAX_MATERIAL_MAPS = 12;
		public const int MAX_TOUCH_POINTS = 10;

		[CLink]
		public static extern char8* TextFormat(char8* text, void args);
	}
}
