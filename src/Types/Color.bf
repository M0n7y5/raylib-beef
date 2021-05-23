using System;
using static raylib_beef.Raylib;
namespace raylib_beef.Types
{
	// Color type, RGBA (32bit)
	[CRepr]
	public struct Color
	{
		public uint8 r;
		public uint8 g;
		public uint8 b;
		public uint8 a;

		// Example - Color.RED instead of RED
		// Custom raylib color palette for amazing visuals
		public static Color LIGHTGRAY = Color(200, 200, 200, 255);
		public static Color GRAY = Color(130, 130, 130, 255);
		public static Color DARKGRAY = Color(80, 80, 80, 255);
		public static Color YELLOW = Color(253, 249, 0, 255);
		public static Color GOLD = Color(255, 203, 0, 255);
		public static Color ORANGE = Color(255, 161, 0, 255);
		public static Color PINK = Color(255, 109, 194, 255);
		public static Color RED = Color(230, 41, 55, 255);
		public static Color MAROON = Color(190, 33, 55, 255);
		public static Color GREEN = Color(0, 228, 48, 255);
		public static Color LIME = Color(0, 158, 47, 255);
		public static Color DARKGREEN = Color(0, 117, 44, 255);
		public static Color SKYBLUE = Color(102, 191, 255, 255);
		public static Color BLUE = Color(0, 121, 241, 255);
		public static Color DARKBLUE = Color(0, 82, 172, 255);
		public static Color PURPLE = Color(200, 122, 255, 255);
		public static Color VIOLET = Color(135, 60, 190, 255);
		public static Color DARKPURPLE = Color(112, 31, 126, 255);
		public static Color BEIGE = Color(211, 176, 131, 255);
		public static Color BROWN = Color(127, 106, 79, 255);
		public static Color DARKBROWN = Color(76, 63, 47, 255);
		public static Color WHITE = Color(255, 255, 255, 255);
		public static Color BLACK = Color(0, 0, 0, 255);
		public static Color BLANK = Color(0, 0, 0, 0);
		public static Color MAGENTA = Color(255, 0, 255, 255);
		public static Color RAYWHITE = Color(245, 245, 245, 255);

		public static Color operator+(Color a, Color b)
		{
			return .(a.r + b.r, a.g + b.g, a.b + b.b, a.a + b.a);
		}

		public static Color operator-(Color a, Color b)
		{
			return .((.)a.r - b.r, (.)a.g - b.g, (.)a.b - b.b, (.)a.a - b.a);
		}

		public static Color operator*(Color a, float b)
		{
			return .(a.r + (.)(255 * b),
				a.g + (.)(255 * b),
				a.b + (.)(255 * b),
				a.a + (.)(255 * b));
		}

		public this(uint8 r, uint8 g, uint8 b, uint8 a)
		{
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
		}

		public static Color LerpRGB(Color a, Color b, float t)
		{
			return Color
				(
				(.)(a.r + (b.r - a.r) * t),
				(.)(a.g + (b.g - a.g) * t),
				(.)(a.b + (b.b - a.b) * t),
				(.)(a.a + (b.a - a.a) * t)
				);
		}

		public static Color LerpBlend(Color color, Color color2, float param)
		{
			return ColorAlphaBlend(color, color2, ColorAlpha(.WHITE, param));
		}
	}
}
