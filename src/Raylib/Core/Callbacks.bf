using System;
using raylib_beef.Enums;
using System.Interop;

namespace raylib_beef
{
	extension Raylib
	{
		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function void TraceLogCallback(TraceLogType logType, char8* text, void* varArgs);

		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function uint8* LoadFileDataCallback(char8* fileName, c_uint bytesRead);

		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function bool SaveFileDataCallback(char8* fileName, void* data, c_uint bytesToWrite);

		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function uint8* LoadFileTextCallback(char8* fileName);

		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function bool SaveFileTextCallback(char8* fileName, char8* text);


		[CLink]
		/// Logging: Redirect trace log messages
		public static extern void SetTraceLogCallback(TraceLogCallback callback);

		[CLink]
		/// FileIO: Load binary data
		public static extern void SetLoadFileDataCallback(LoadFileDataCallback callback);            // Set custom file binary data loader

		[CLink]
		/// FileIO: Save binary data
		public static extern void SetSaveFileDataCallback(SaveFileDataCallback callback);            // Set custom file binary data saver

		[CLink]
		/// FileIO: Load text data
		public static extern void SetLoadFileTextCallback(LoadFileTextCallback callback);            // Set custom file text data loader

		[CLink]
		/// FileIO: Save text data
		public static extern void SetSaveFileTextCallback(SaveFileTextCallback callback);            // Set custom file text data saver

	}
}
