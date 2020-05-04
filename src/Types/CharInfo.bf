using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct CharInfo
	{
		public int32 value;// Character value (Unicode)
		public int32 offsetX;// Character offset X when drawing
		public int32 offsetY;// Character offset Y when drawing
		public int32 advanceX;// Character advance position X
		public Image image;// Character image data
	}
}
