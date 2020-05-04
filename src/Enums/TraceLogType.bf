namespace raylib_beef.Enums
{
	// Trace log type
	public enum TraceLogType : int32
	{
		LOG_ALL = 0,	// Display all logs
		LOG_TRACE,
		LOG_DEBUG,
		LOG_INFO,
		LOG_WARNING,
		LOG_ERROR,
		LOG_FATAL,
		LOG_NONE		// Disable logging
	}
}
