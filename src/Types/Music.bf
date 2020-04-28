using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Music
	{
		public int ctxType;// Type of music context (audio filetype)

		// ctxData refers to a void *
		public void* ctxData;// Audio context data, depends on type

		public uint sampleCount;// Total number of samples
		public uint loopCount;// Loops count (times music will play), 0 means infinite loop

		public AudioStream stream;// Audio stream
	}
}
