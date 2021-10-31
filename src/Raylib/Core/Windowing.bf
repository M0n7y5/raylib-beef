using System;
using System.Interop;
using raylib_beef.Types;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Initialize window and OpenGL context
		public static extern void InitWindow(c_int width, c_int height, char8* title);

		[CLink]
		/// Check if KEY_ESCAPE pressed or Close icon pressed
		public static extern bool WindowShouldClose();

#if BF_PLATFORM_WINDOWS 
		[Import("raylib.lib"), CLink /* linker fix for user32.lib conflicting library */]
#else
		[CLink]
#endif
		/// Close window and unload OpenGL context
		public static extern void CloseWindow();

		[CLink]
		/// Check if window has been initialized successfully
		public static extern bool IsWindowReady();

		[CLink]
		/// Check if window is currently fullscreen
		public static extern bool IsWindowFullscreen();

		[CLink]
		/// Check if window is currently hidden
		public static extern bool IsWindowHidden();

		[CLink]
		/// Check if window has been minimized (or lost focus)
		public static extern bool IsWindowMinimized();

		[CLink]
		/// Check if window is currently maximized (only PLATFORM_DESKTOP)
		public static extern bool IsWindowMaximized();

		[CLink]
		/// Check if window is currently focused (only PLATFORM_DESKTOP)
		public static extern bool IsWindowFocused();

		[CLink]
		/// Check if window has been resized
		public static extern bool IsWindowResized();

		[CLink]
		/// Set window configuration state using flags
		public static extern bool IsWindowState(c_uint flags);

		[CLink]
		/// Set window configuration state using flags
		public static extern void SetWindowState(c_uint flags);

		[CLink]
		/// Clear window configuration state flags
		public static extern void ClearWindowState(c_uint flags);

		[CLink]
		/// Toggle fullscreen mode (only PLATFORM_DESKTOP)
		public static extern void ToggleFullscreen();

		[CLink]
		/// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
		public static extern void MaximizeWindow();

		[CLink]
		/// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
		public static extern void MinimizeWindow();

		[CLink]
		/// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
		public static extern void RestoreWindow();

		[CLink]
		/// Set icon for window (only PLATFORM_DESKTOP)
		public static extern void SetWindowIcon(Image image);

		[CLink]
		/// Set title for window (only PLATFORM_DESKTOP)
		public static extern void SetWindowTitle(char8* title);

		[CLink]
		/// Set window position on screen (only PLATFORM_DESKTOP)
		public static extern void SetWindowPosition(c_int x, c_int y);

		[CLink]
		/// Set monitor for the current window (fullscreen mode)
		public static extern void SetWindowMonitor(c_int monitor);

		[CLink]
		/// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
		public static extern void SetWindowMinSize(c_int width, c_int height);

		[CLink]
		/// Set window dimensions
		public static extern void SetWindowSize(c_int width, c_int height);

		[CLink]
		/// Get native window handle IntPtr refers to a void *
		public static extern void* GetWindowHandle();

		[CLink]
		/// Get current screen width
		public static extern c_int GetScreenWidth();

		[CLink]
		/// Get current screen height
		public static extern c_int GetScreenHeight();

		[CLink]
		/// Get number of connected monitors
		public static extern c_int GetMonitorCount();

		[CLink]
		/// Get current connected monitor
		public static extern c_int GetCurrentMonitor();

		[CLink]
		/// Get specified monitor position
		public static extern Vector2 GetMonitorPosition();

		[CLink]
		/// Get primary monitor width
		public static extern c_int GetMonitorWidth(c_int monitor);

		[CLink]
		/// Get primary monitor height
		public static extern c_int GetMonitorHeight(c_int monitor);

		[CLink]
		/// Get primary monitor physical width in millimetres
		public static extern c_int GetMonitorPhysicalWidth(c_int monitor);

		[CLink]
		/// Get primary monitor physical height in millimetres
		public static extern c_int GetMonitorPhysicalHeight(c_int monitor);

		[CLink]
		/// Get specified monitor refresh rate
		public static extern c_int GetMonitorRefreshRate(c_int monitor);

		[CLink]
		/// Get window position XY on monitor
		public static extern Vector2 GetWindowPosition();

		[CLink]
		/// Get window scale DPI factor
		public static extern Vector2 GetWindowScaleDPI();

		[CLink]
		/// Get the human-readable, UTF-8 encoded name of the primary monitor
		public static extern char8* GetMonitorName(c_int monitor);

		[CLink]
		/// Set clipboard text content
		public static extern void SetClipboardText(char8* text);

		[CLink]
		/// Get clipboard text content
		public static extern char8* GetClipboardText();
	}
}
