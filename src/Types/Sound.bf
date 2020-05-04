using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Sound
	{
		public uint32 sampleCount;// Total number of samples
		public AudioStream stream;// Audio stream
	}
}
