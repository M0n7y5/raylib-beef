using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct AudioStream
	{
	    public uint32 sampleRate;        // Frequency (samples per second)
	    public uint32 sampleSize;        // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	    public uint32 channels;          // Number of channels (1-mono, 2-stereo)

	    // audioBuffer refers to a rAudioBuffer *
	    public void* audioBuffer;     // Pointer to internal data used by the audio system
	}
}
