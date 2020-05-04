using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Music
	{
		public int32 ctxType;// Type of music context (audio filetype)

		// ctxData refers to a void *
		public void* ctxData;// Audio context data, depends on type

		public uint32 sampleCount;// Total number of samples
		public uint32 loopCount;// Loops count (times music will play), 0 means infinite loop

		public AudioStream stream;// Audio stream
	}
}
