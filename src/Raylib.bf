using System;
using raylib_beef.Enums;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	public class Raylib
	{
		public const char8* RAYLIB_VERSION = "3.7";

		public const float DEG2RAD = (float)Math.PI_f / 180.0f;
		public const float RAD2DEG = 180.0f / (float)Math.PI_f;

		public const int MAX_SHADER_LOCATIONS = 32;
		public const int MAX_MATERIAL_MAPS = 12;
		public const int MAX_TOUCH_POINTS = 10;



		// NOT USED -----------------------------------------------------------------------

		// position for a unicode character on font
		/*[CLink]
		public static extern c_int GetGlyphIndex(Font font, c_int character);
		/// Text strings management functions NOTE: Some strings allocate memory internally for returned strings, just
		// be careful!
		/// Check if two text string are equal
		[CLink]
		public static extern bool TextIsEqual(char8* text1, char8* text2);
		/// Get text length, checks for '\0' ending
		[CLink]
		public static extern c_uint TextLength(char8* text);
		/// Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern c_uint TextCountCodepoints(char8* text);
		/// Text formatting with variables (sprintf style)
		[CLink]
		public static extern char8* TextFormat(char8* text);
		/// Get a piece of a text string
		[CLink]
		public static extern char8* TextSubtext(char8* text, c_int position, c_int length);
		/// Replace text char8*(memory should be freed!)
		[CLink]
		public static extern char8* TextReplace(char8* text, char8* replace, char8* by);
		/// Insert text in a position (memory should be freed!)
		[CLink]
		public static extern char8* TextInsert(char8* text, char8* insert, c_int position);
		/// Join text strings with delimiter
		[CLink]
		public static extern char8* TextJoin(char8** textList, c_int count, char8* delimiter);
		/// Split text into multiple strings
		[CLink]
		public static extern char8** TextSplit(char8* text, char8 delimiter, c_int* count);
		/// Append text at specific position and move cursor!
		[CLink]
		public static extern void TextAppend(char8* text, char8* @append, c_int* position);
		/// Find first text occurrence within a string
		[CLink]
		public static extern c_int TextFindIndex(char8* text, char8* find);
		/// Get upper case version of provided string
		[CLink]
		public static extern char8* TextToUpper(char8* text);
		/// Get lower case version of provided string
		[CLink]
		public static extern char8* TextToLower(char8* text);
		/// Get Pascal case notation version of provided string
		[CLink]
		public static extern char8* TextToPascal(char8* text);
		/// Get integer value from text (negative values not supported)
		[CLink]
		public static extern c_int TextToInteger(char8* text);
		/// Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern char8* TextToUtf8(char8* text, c_int length);*/


		/// UTF8 text strings management functions
		/*/// Returns next codepoint in a UTF8 encoded string
		[CLink]
		public static extern c_int* GetCodepoints(char8* text, c_int* count);
		/// Get all codepoints in a string, codepoints count returned by parameters
		[CLink]
		public static extern c_int GetCodepointsCount(char8* text);
		/// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
		[CLink]
		public static extern c_int GetNextCodepoint(char8* text, c_int* bytesProcessed);
		/// Encode codepoint into utf8 text (char array length returned as parameter)
		[CLink]
		public static extern char8* CodepointToUtf8(char8* text, c_int* byteLength);*/

	}
}
