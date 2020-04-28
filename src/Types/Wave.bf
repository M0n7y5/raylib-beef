using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Wave
	{
		public uint sampleCount;// Number of samples
		public uint sampleRate;// Frequency (samples per second)
		public uint sampleSize;// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
		public uint channels;// Number of channels (1-mono, 2-stereo)

		// data refers to a void *
		public void* data;// Buffer data pointer
	}
}
