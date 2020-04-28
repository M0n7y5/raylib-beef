using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Font
	{
		public int baseSize;// Base size (default chars height)
		public int charsCount;// Number of characters
		public Texture2D texture;// Font texture

		// recs refers to a Rectangle *
		public Rectangle* recs;// Characters rectangles in texture

		// chars refers to a CharInfo *
		public CharInfo* chars;// Characters info data
	}
}
