using System;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Load file data as byte array (read)
		public static extern uint8* LoadFileData(char8* fileName, c_uint* bytesRead);

		[CLink]
		/// Unload file data allocated by LoadFileData()
		public static extern void UnloadFileData(uint8* data);

		[CLink]
		/// Save data to file from byte array (write)
		public static extern bool SaveFileData(char8* fileName, void* data, c_int bytesToWrite);

		[CLink]
		/// Load text data from file (read), returns a '\0' terminated string
		public static extern char8* LoadFileText(char8* fileName);

		[CLink]
		/// Unload file text data allocated by LoadFileText()
		public static extern void UnloadFileText(char8* text);

		[CLink]
		/// Save text data to file (write), string must be '\0' terminated, returns true on success
		public static extern bool SaveFileText(char8* fileName, char8* text);

		[CLink]
		/// Check if file exists
		public static extern bool FileExists(char8* fileName);

		[CLink]
		/// Check if a directory path exists
		public static extern bool DirectoryExists(char8* dirPath);

		[CLink]
		/// Check file extension
		public static extern bool IsFileExtension(char8* fileName, char8* ext);

		[CLink]
		/// Get pointer to extension for a filename char8*
		public static extern char8* GetFileExtension(char8* fileName);

		[CLink]
		/// Get pointer to filename for a path char8*
		public static extern char8* GetFileName(char8* filePath);

		[CLink]
		/// Get filename string without extension (uses static string)
		public static extern char8* GetFileNameWithoutExt(char8* filePath);

		[CLink]
		/// Get full path for a given fileName (uses static string)
		public static extern char8* GetDirectoryPath(char8* fileName);

		[CLink]
		/// Get previous directory path for a given path (uses static string)
		public static extern char8* GetPrevDirectoryPath(char8* dirPath);

		[CLink]
		/// Get current working directory (uses static string)
		public static extern char8* GetWorkingDirectory();

		[CLink]
		/// Get filenames in a directory path (memory should be freed)
		public static extern char8** GetDirectoryFiles(char8* dirPath, c_int* count);

		[CLink]
		/// Clear directory files paths buffers (free memory)
		public static extern void ClearDirectoryFiles();

		[CLink]
		/// Change working directory, returns true if success
		public static extern bool ChangeDirectory(char8* dir);

		[CLink]
		/// Check if a file has been dropped into window
		public static extern bool IsFileDropped();

		[CLink]
		/// Get dropped files names (memory should be freed)
		public static extern char8** GetDroppedFiles(c_int* count);

		[CLink]
		/// Clear dropped files paths buffer (free memory)
		public static extern void ClearDroppedFiles();

		[CLink]
		/// Get file modification time (last write time)
		public static extern c_int GetFileModTime(char8* fileName);

		[CLink]
		/// Compress data (DEFLATE algorithm)
		public static extern uint8* CompressData(uint8* data, c_int dataLength, c_int* compDataLength);

		[CLink]
		/// Decompress data (DEFLATE algorithm)
		public static extern uint8* DecompressData(uint8* compData, c_int compDataLength, c_int* dataLength);
	}
}
