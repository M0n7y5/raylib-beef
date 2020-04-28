namespace raylib_beef.Enums
{
	public enum ConfigFlag : int
	{
	    FLAG_RESERVED           = 1,    // Reserved
	    FLAG_FULLSCREEN_MODE    = 2,    // Set to run program in fullscreen
	    FLAG_WINDOW_RESIZABLE   = 4,    // Set to allow resizable window
	    FLAG_WINDOW_UNDECORATED = 8,    // Set to disable window decoration (frame and buttons)
	    FLAG_WINDOW_TRANSPARENT = 16,   // Set to allow transparent window
	    FLAG_WINDOW_HIDDEN      = 128,  // Set to create the window initially hidden
	    FLAG_WINDOW_ALWAYS_RUN  = 256,  // Set to allow windows running while minimized
	    FLAG_MSAA_4X_HINT       = 32,   // Set to try enabling MSAA 4X
	    FLAG_VSYNC_HINT         = 64    // Set to try enabling V-Sync on GPU
	}
}
