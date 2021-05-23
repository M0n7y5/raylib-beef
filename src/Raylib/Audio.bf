using System;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		// Audio device management functions
		[CLink]
		/// Initialize
		// audio device and context
		public static extern void InitAudioDevice();

		[CLink]
		/// Close
		// the audio device and context
		public static extern void CloseAudioDevice();

		[CLink]
		/// Check if audio device has been initialized successfully
		public static extern bool IsAudioDeviceReady();

		[CLink]
		/// Set master volume (listener)
		public static extern void SetMasterVolume(float volume);


		// Wave/Sound loading/unloading functions
		[CLink]
		/// Load wave data from file
		public static extern Wave LoadWave(char8* fileName);

		[CLink]
		/// Load wave from memory buffer, fileType refers to extension: i.e. "wav"
		public static extern Wave LoadWaveFromMemory(char8* fileType, uint8* fileData, c_int dataSize);

		[CLink]
		/// Load sound from file
		public static extern Sound LoadSound(char8* fileName);

		[CLink]
		/// Load sound from wave data
		public static extern Sound LoadSoundFromWave(Wave wave);

		[CLink]
		/// Update sound buffer with new data data refers to a void*
		public static extern void UpdateSound(Sound sound, void* data, c_int samplesCount);

		[CLink]
		/// Unload wave data
		public static extern void UnloadWave(Wave wave);

		[CLink]
		/// Unload sound
		public static extern void UnloadSound(Sound sound);

		[CLink]
		/// Export wave data to file
		public static extern void ExportWave(Wave wave, char8* fileName);

		[CLink]
		/// Export wave sample data to code (.h)
		public static extern void ExportWaveAsCode(Wave wave, char8* fileName);


		// Wave/Sound management functions
		[CLink]
		/// Play a sound
		public static extern void PlaySound(Sound sound);

		[CLink]
		/// Stop playing a sound
		public static extern void StopSound(Sound sound);

		[CLink]
		/// Pause a sound
		public static extern void PauseSound(Sound sound);

		[CLink]
		/// Resume a paused sound
		public static extern void ResumeSound(Sound sound);

		[CLink]
		/// Play a sound (using multichannel buffer pool)
		public static extern void PlaySoundMulti(Sound sound);

		[CLink]
		/// Stop any sound playing (using multichannel buffer pool)
		public static extern void StopSoundMulti();

		[CLink]
		/// Get number of sounds playing in the multichannel
		public static extern c_int GetSoundsPlaying();

		[CLink]
		/// Check if a sound is currently playing
		public static extern bool IsSoundPlaying(Sound sound);

		[CLink]
		/// Set volume for a sound (1.0 is max level)
		public static extern void SetSoundVolume(Sound sound, float volume);

		[CLink]
		/// Set pitch for a sound (1.0 is base level)
		public static extern void SetSoundPitch(Sound sound, float pitch);

		[CLink]
		/// Convert wave data to desired format
		public static extern void WaveFormat(Wave* wave, c_int sampleRate, c_int sampleSize, c_int channels);

		[CLink]
		/// Copy a wave to a new wave
		public static extern Wave WaveCopy(Wave wave);

		[CLink]
		/// Crop a wave to defined samples range
		public static extern void WaveCrop(Wave* wave, c_int initSample, c_int finalSample);

		[CLink]
		/// Load samples data from wave as a floats array
		public static extern float* LoadWaveSamples(Wave wave);

		[CLink]
		/// Unload samples data loaded with LoadWaveSamples()
		public static extern float* UnloadWaveSamples(float* samples);



		// Music management functions
		[CLink]
		/// Load music stream from file
		public static extern Music LoadMusicStream(char8* fileName);

		[CLink]
		/// Load music stream from data
		public static extern Music LoadMusicStreamFromMemory(char8 *fileType, uint8* data, c_int dataSize); 
		[CLink]
		/// Unload music stream
		public static extern void UnloadMusicStream(Music music);

		[CLink]
		/// Start music playing
		public static extern void PlayMusicStream(Music music);

		[CLink]
		/// Check if music is playing
		public static extern bool IsMusicPlaying(Music music);

		[CLink]
		/// Updates buffers for music streaming
		public static extern void UpdateMusicStream(Music music);

		[CLink]
		/// Stop music playing
		public static extern void StopMusicStream(Music music);

		[CLink]
		/// Pause music playing
		public static extern void PauseMusicStream(Music music);

		[CLink]
		/// Resume playing paused music
		public static extern void ResumeMusicStream(Music music);

		[CLink]
		/// Set volume for music (1.0 is max level)
		public static extern void SetMusicVolume(Music music, float volume);

		[CLink]
		/// Set pitch for a music (1.0 is base level)
		public static extern void SetMusicPitch(Music music, float pitch);

		[CLink]
		/// Get music time length (in seconds)
		public static extern float GetMusicTimeLength(Music music);

		[CLink]
		/// Get current music time played (in seconds)
		public static extern float GetMusicTimePlayed(Music music);


		// AudioStream management functions
		[CLink]
		/// Init audio stream (to stream raw audio pcm data)
		public static extern AudioStream InitAudioStream(c_uint sampleRate, c_uint sampleSize, c_uint channels);

		[CLink]
		/// Update audio stream buffers with data data refers to a const void *
		public static extern void UpdateAudioStream(AudioStream stream, void* data, c_int samplesCount);

		[CLink]
		/// Close audio stream and free memory
		public static extern void CloseAudioStream(AudioStream stream);

		[CLink]
		/// Check if any audio stream buffers requires refill
		public static extern bool IsAudioStreamProcessed(AudioStream stream);

		[CLink]
		/// Play audio stream
		public static extern void PlayAudioStream(AudioStream stream);

		[CLink]
		/// Pause audio stream
		public static extern void PauseAudioStream(AudioStream stream);

		[CLink]
		/// Resume audio stream
		public static extern void ResumeAudioStream(AudioStream stream);

		[CLink]
		/// Check if audio stream is playing
		public static extern bool IsAudioStreamPlaying(AudioStream stream);

		[CLink]
		/// Stop audio stream
		public static extern void StopAudioStream(AudioStream stream);

		[CLink]
		/// Set volume for audio stream (1.0 is max level)
		public static extern void SetAudioStreamVolume(AudioStream stream, float volume);

		[CLink]
		/// Set pitch for audio stream (1.0 is base level)
		public static extern void SetAudioStreamPitch(AudioStream stream, float pitch);

		[CLink]
		/// Default size for new audio streams
		public static extern void SetAudioStreamBufferSizeDefault(int size); 


	}
}
