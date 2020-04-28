using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct CharInfo
	{
		public int value;// Character value (Unicode)
		public int offsetX;// Character offset X when drawing
		public int offsetY;// Character offset Y when drawing
		public int advanceX;// Character advance position X
		public Image image;// Character image data
	}
}
