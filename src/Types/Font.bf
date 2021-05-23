using System;
using System.Interop;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Font
	{
		public c_int baseSize;// Base size (default chars height)
		public c_int charsCount;// Number of characters
		public c_int charsPadding;

		public Texture2D texture;// Font texture

		// recs refers to a Rectangle *
		public Rectangle* recs;// Characters rectangles in texture

		// chars refers to a CharInfo *
		public CharInfo* chars;// Characters info data
	}
}
