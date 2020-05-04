using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Wave
	{
		public uint32 sampleCount;// Number of samples
		public uint32 sampleRate;// Frequency (samples per second)
		public uint32 sampleSize;// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
		public uint32 channels;// Number of channels (1-mono, 2-stereo)

		// data refers to a void *
		public void* data;// Buffer data pointer
	}
}
