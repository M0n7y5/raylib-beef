using System;
using raylib_beef.Types;
using System.Interop;
using raylib_beef.Enums;
namespace raylib_beef
{
	extension Raylib
	{
		// NOTE: This module is only partially implemented
		// because string operations are already included
		// in corlib (see String class)

		// Font loading/unloading functions
		[CLink]
		/// Get the default Font
		public static extern Font GetFontDefault();

		[CLink]
		/// Load font from file into GPU memory (VRAM)
		public static extern Font LoadFont(char8* fileName);

		[CLink]
		/// Load font from file with extended parameters
		public static extern Font LoadFontEx(char8* fileName, c_int fontSize, c_int* fontChars, c_int charsCount);

		[CLink]
		/// Load font from Image (XNA style)
		public static extern Font LoadFontFromImage(Image image, Color key, c_int firstChar);

		[CLink]
		/// Load font from memory buffer
		public static extern Font LoadFontFromMemory(char8 *fileType, uint8 *fileData, c_int dataSize, c_int fontSize, c_int *fontChars, c_int charsCount);

		[CLink]
		/// Load font data for further use
		public static extern CharInfo* LoadFontData(uint8* filedata, c_int datasize, c_int fontSize, c_int* fontChars, c_int charsCount, FontType type);

		[CLink]
		/// Generate image font atlas using chars info
		public static extern Image GenImageFontAtlas(CharInfo* chars, Rectangle** recs, c_int charsCount, c_int fontSize, c_int padding, c_int packMethod);

		[CLink]
		/// Unload font chars info data (RAM)
		public static extern void UnloadFontData(CharInfo *chars, int charsCount);  

		[CLink]
		/// Unload Font from GPU memory (VRAM)
		public static extern void UnloadFont(Font font);

		/// Text drawing functions
		[CLink]
		/// Shows current FPS
		public static extern void DrawFPS(c_int posX, c_int posY);

		[CLink]
		/// Draw text (using default font)
		public static extern void DrawText(char8* text, c_int posX, c_int posY, c_int fontSize, Color color);

		[CLink]
		/// Draw text using font and additional parameters
		public static extern void DrawTextEx(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);

		[CLink]
		/// Draw text using font inside rectangle limits
		public static extern void DrawTextRec(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);

		[CLink]
		/// Draw text using font inside rectangle limits with support for text selection
		public static extern void DrawTextRecEx(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint, c_int selectStart, c_int selectLength, Color selectText, Color selectBack);

		[CLink]
		/// Draw one character (codepoint)
		public static extern void DrawTextCodepoint(Font font, c_int codepoint, Vector2 position, float scale, Color tint);

		// Text misc. functions --------------------
		[CLink]
		/// Measure string width for default font
		public static extern c_int MeasureText(char8* text, c_int fontSize);

		[CLink]
		/// Measure string size for Font
		public static extern Vector2 MeasureTextEx(Font font, char8* text, float fontSize, float spacing);/// Get index

		[CLink]
		// Text formatting with variables (sprintf style)
		public static extern char8* TextFormat(char8* text, void* args);

		

	}
}
