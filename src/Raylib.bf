using System;
using raylib_beef.Enums;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	public class Raylib
	{
		// Used by
		// DllImport to load the native library.
		public const char8* nativeLibName = "raylib";

		public const char8* RAYLIB_VERSION = "3.0";

		public const float DEG2RAD = (float)Math.PI_f / 180.0f;
		public const float RAD2DEG = 180.0f / (float)Math.PI_f;

		public const int MAX_SHADER_LOCATIONS = 32;
		public const int MAX_MATERIAL_MAPS = 12;
		public const int MAX_TOUCH_POINTS = 10;


		/// Callback delegate used in SetTraceLogCallback to allow for custom logging
		public function void TraceLogCallback(TraceLogType logType, char8* text, void* args);



		///------------------------------------------------------------------------------------ Window and Graphics
		// Device Functions (Module: core) 
		// ------------------------------------------------------------------------------------

		// Window-related functions

		[CLink]
		/// Initialize window and OpenGL context
		public static extern void InitWindow(c_int width, c_int height, char8* title);
		[CLink]
		/// Check if KEY_ESCAPE pressed or Close icon pressed
		public static extern bool WindowShouldClose();
		[LinkName("rCloseWindow")]
		/// Close window and unload OpenGL context
		public static extern void CloseWindow();
		[CLink]
		/// Check if window has been initialized successfully
		public static extern bool IsWindowReady();
		[CLink]
		/// Check if window is currently focused (only PLATFORM_DESKTOP)
		public static extern bool IsWindowFocused();
		[CLink]
		/// Check if window has been minimized (or lost focus)
		public static extern bool IsWindowMinimized();
		[CLink]
		/// Check if window has been resized
		public static extern bool IsWindowResized();
		[CLink]
		/// Check if window is currently hidden
		public static extern bool IsWindowHidden();
		[CLink]
		/// Check if window is currently fullscreen
		public static extern void IsWindowFullscreen();
		[CLink]
		/// Toggle fullscreen mode (only PLATFORM_DESKTOP)
		public static extern void ToggleFullscreen();
		[CLink]
		/// Set window configuration state using flags
		public static extern void SetWindowState(c_uint flags);
		[CLink]
		/// Clear window configuration state flags
		public static extern void ClearWindowState();
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
		/// Get primary monitor width
		public static extern c_int GetMonitorWidth(c_int monitor);
		[CLink]
		/// Get specified monitor refresh rate
		public static extern c_int GetMonitorRefreshRate(c_int monitor);
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
		/// Get window position XY on monitor
		public static extern Vector2 GetWindowPosition();
		[CLink]
		/// Get window scale DPI factor
		public static extern Vector2 GetWindowScaleDPI();
		[CLink]
		/// Get the human-readable, UTF-8 encoded name of the primary monitor
		public static extern char8* GetMonitorName(c_int monitor);
		[CLink]
		/// Get clipboard text content
		public static extern char8* GetClipboardText();
		[CLink]
		/// Set clipboard text content
		public static extern void SetClipboardText(char8* text);


		/// Cursor-related functions ------------
		[CLink]
		/// Shows cursor
		public static extern void ShowCursor();
		[CLink]
		/// Hides cursor
		public static extern void HideCursor();
		[CLink]
		/// Check if cursor is not visible
		public static extern bool IsCursorHidden();
		[CLink]
		/// Enables cursor (unlock cursor)
		public static extern void EnableCursor();
		[CLink]
		/// Disables cursor (lock cursor)
		public static extern void DisableCursor();
		[CLink]
		/// Check if cursor is on the current screen.
		public static extern bool IsCursorOnScreen();


		/// Drawing-related functions ----------------
		[CLink]
		/// Set background color (framebuffer clear color)
		public static extern void ClearBackground(Color color);
		[CLink]
		/// Setup canvas (framebuffer) to start drawing
		public static extern void BeginDrawing();
		[CLink]
		/// End canvas drawing and swap buffers (double buffering)
		public static extern void EndDrawing();
		[CLink]
		/// Initialize 2D mode with custom camera (2D)
		public static extern void BeginMode2D(Camera2D camera);
		[CLink]
		/// Ends 2D mode with custom camera
		public static extern void EndMode2D();
		[CLink]
		/// Initializes 3D mode with custom camera (3D)
		public static extern void BeginMode3D(Camera3D camera);
		[CLink]
		/// Ends 3D mode and returns to default 2D orthographic mode
		public static extern void EndMode3D();
		[CLink]
		/// Initializes render texture for drawing
		public static extern void BeginTextureMode(RenderTexture2D target);
		[CLink]
		/// Ends drawing to render texture
		public static extern void EndTextureMode();
		[CLink]
		/// Begin scissor mode (define screen area for following drawing)
		public static extern void BeginScissorMode(c_int x, c_int y, c_int width, c_int height);
		[CLink]
		/// End scissor mode
		public static extern void EndScissorMode();


		/// Screen-space-related functions
		[CLink]
		/// Returns a ray trace from mouse position
		public static extern Ray GetMouseRay(Vector2 mousePosition, Camera3D camera);
		[CLink]
		/// Returns camera transform matrix (view matrix)
		public static extern Matrix GetCameraMatrix(Camera3D camera);
		[CLink]
		/// Returns camera 2d transform matrix
		public static extern Matrix GetCameraMatrix2D(Camera2D camera);
		[CLink]
		/// Returns the screen space position for a 3d world space position
		public static extern Vector2 GetWorldToScreen(Vector3 position, Camera3D camera);
		[CLink]
		/// Returns size position for a 3d world space position
		public static extern Vector2 GetWorldToScreenEx(Vector3 position, Camera3D camera, c_int width, c_int height);
		[CLink]
		/// Returns the screen space position for a 2d camera world space position
		public static extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);
		[CLink]
		/// Returns the world space position for a 2d camera screen space position
		public static extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);


		/// Timing-related functions
		[CLink]
		/// Set target FPS (maximum)
		public static extern void SetTargetFPS(c_int fps);
		[CLink]
		/// Returns current FPS
		public static extern c_int GetFPS();
		[CLink]
		/// Returns time in seconds for last frame drawn
		public static extern float GetFrameTime();
		[CLink]
		/// Returns elapsed time in seconds since InitWindow()
		public static extern double GetTime();


		/// Color-related functions
		[CLink]
		/// Returns hexadecimal value for a Color
		public static extern c_int ColorToInt(Color color);
		[CLink]
		/// Returns color normalized as float [0..1]
		public static extern Vector4 ColorNormalize(Color color);
		[CLink]
		/// Returns color from normalized values [0..1]
		public static extern Color ColorFromNormalized(Vector4 normalized);
		[CLink]
		/// Returns HSV values for a Color
		public static extern Vector3 ColorToHSV(Color color);
		[CLink]
		/// Returns a Color from HSV values
		public static extern Color ColorFromHSV(Vector3 hsv);
		[CLink]
		/// Returns color with alpha applied, alpha goes from 0.0f to 1.0f
		public static extern Color ColorAlpha(Color color, float alpha);
		[CLink]
		/// Returns src alpha-blended into dst color with tint
		public static extern Color ColorAlphaBlend(Color dst, Color src, Color tint);
		[CLink]
		/// Returns a Color struct from hexadecimal value
		public static extern Color GetColor(c_int hexValue);
		[CLink]
		/// Get Color from a source pixel pointer of certain format
		public static extern Color GetPixelColor(void* srcPtr, int format);
		[CLink]
		/// Set color formatted into destination pixel pointer
		public static extern void SetPixelColor(void* dstPtr, Color color, int format);
		[CLink]
		/// Get pixel data size in bytes for certain format
		public static extern c_int GetPixelDataSize(int width, int height, int format);


		// Misc. functions
		[CLink]
		/// Setup window configuration flags (view FLAGS)
		public static extern void SetConfigFlags(ConfigFlag flags);
		[CLink]
		/// Set the current threshold (minimum) log level
		public static extern void SetTraceLogLevel(TraceLogType logType);
		[CLink]
		/// Set the exit threshold (minimum) log level
		public static extern void SetTraceLogExit(TraceLogType logType);
		[CLink]
		/// Set a trace log callback to enable custom logging
		public static extern void SetTraceLogCallback(TraceLogCallback callback);
		[CLink]
		/// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
		public static extern void TraceLog(TraceLogType logType, char8* text);
		[CLink]
		/// Takes a screenshot of current screen (saved a .png)
		public static extern void TakeScreenshot(char8* fileName);
		[CLink]
		/// Returns a random value between min and max (both included)
		public static extern c_int GetRandomValue(c_int min, c_int max);

		// Files management functions -----------------------------
		[CLink]
		/// Load file data as byte array (read)
		public static extern uint8* LoadFileData(char8* fileName, c_int* bytesRead);

		[CLink]
		/// Unload file data allocated by LoadFileData()
		public static extern void UnloadFileData(uint8* data);

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
		/// Save data to file from byte array (write)
		public static extern bool SaveFileData(char8* fileName, void* data, c_int bytesToWrite);

		[CLink]
		/// Check if file exists
		public static extern bool FileExists(char8* fileName);

		[CLink]
		/// Check file extension
		public static extern bool IsFileExtension(char8* fileName, char8* ext);

		[CLink]
		/// Check if a directory path exists
		public static extern bool DirectoryExists(char8* dirPath);

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

		// ----

		[CLink]
		/// Compress data (DEFLATE algorithm)
		public static extern uint8* CompressData(uint8* data, c_int dataLength, c_int* compDataLength);

		[CLink]
		/// Decompress data (DEFLATE algorithm)
		public static extern uint8* DecompressData(uint8* compData, c_int compDataLength, c_int* dataLength);

		// Persistent storage management ------------------
		[CLink]
		/// Save integer value to storage file (to defined position)
		public static extern void StorageSaveValue(c_int position, c_int value);

		[CLink]
		/// Load integer value from storage file (from defined position)
		public static extern c_int StorageLoadValue(c_int position);

		[CLink]
		/// Open URL with default system browser (if available)
		public static extern void OpenURL(char8* url);


		///------------------------------------------------------------------------------------
		// Input Handling Functions (Module: core)
		/// -----------------------------------------------------------------------------------
		// Input-related functions: keyboard -----------------------
		[CLink]
		/// Detect if a key has been pressed once
		public static extern bool IsKeyPressed(KeyboardKey key);
		[CLink]
		/// Detect if a key is being pressed
		public static extern bool IsKeyDown(KeyboardKey key);
		[CLink]
		/// Detect if a key has been released once
		public static extern bool IsKeyReleased(KeyboardKey key);
		[CLink]
		/// Detect if a key is NOT being pressed
		public static extern bool IsKeyUp(KeyboardKey key);
		[CLink]
		/// Set a custom key to exit program (default is ESC)
		public static extern void SetExitKey(KeyboardKey key);
		[CLink]
		/// Get key pressed, call it multiple times for chars queued
		public static extern c_int GetKeyPressed();


		// Input-related functions: gamepads ----------------------
		[CLink]
		/// Detect if a gamepad is available
		public static extern bool IsGamepadAvailable(GamepadNumber gamepad);
		[CLink]
		/// Check gamepad name (if available)
		public static extern bool IsGamepadName(GamepadNumber gamepad, char8* name);
		[CLink]
		/// Return gamepad internal name id
		public static extern char8* GetGamepadName(GamepadNumber gamepad);
		[CLink]
		/// Detect if a gamepad button has been pressed once
		public static extern bool IsGamepadButtonPressed(GamepadNumber gamepad, GamepadButton button);
		[CLink]
		/// Detect if a gamepad button is being pressed
		public static extern bool IsGamepadButtonDown(GamepadNumber gamepad, GamepadButton button);
		[CLink]
		/// Detect if a gamepad button has been released once
		public static extern bool IsGamepadButtonReleased(GamepadNumber gamepad, GamepadButton button);
		[CLink]
		/// Detect if a gamepad button is NOT being pressed
		public static extern bool IsGamepadButtonUp(GamepadNumber gamepad, GamepadButton button);
		[CLink]
		/// Get the last gamepad button pressed
		public static extern c_int GetGamepadButtonPressed();
		[CLink]
		/// Return gamepad axis count for a gamepad
		public static extern c_int GetGamepadAxisCount(GamepadNumber gamepad);
		[CLink]
		/// Return axis movement value for a gamepad axis
		public static extern float GetGamepadAxisMovement(GamepadNumber gamepad, GamepadAxis axis);


		// Input-related functions: mouse
		[CLink]
		/// Detect if a mouse button has been pressed once
		public static extern bool IsMouseButtonPressed(MouseButton button);
		[CLink]
		/// Detect if a mouse button is being pressed
		public static extern bool IsMouseButtonDown(MouseButton button);
		[CLink]
		/// Detect if a mouse button has been released once
		public static extern bool IsMouseButtonReleased(MouseButton button);
		[CLink]
		/// Detect if a mouse button is NOT being pressed
		public static extern bool IsMouseButtonUp(MouseButton button);
		[CLink]
		/// Returns mouse position X
		public static extern c_int GetMouseX();
		[CLink]
		/// Returns mouse position Y
		public static extern c_int GetMouseY();
		[CLink]
		/// Returns mouse position XY
		public static extern Vector2 GetMousePosition();
		[CLink]
		/// Set mouse position XY
		public static extern void SetMousePosition(c_int x, c_int y);
		[CLink]
		/// Set mouse offset
		public static extern void SetMouseOffset(c_int offsetX, c_int offsetY);
		[CLink]
		/// Set mouse scaling
		public static extern void SetMouseScale(float scaleX, float scaleY);
		[CLink]
		/// Returns mouse wheel movement Y
		public static extern float GetMouseWheelMove();


		/// Input-related functions: touch
		[CLink]
		/// Returns touch position X for touch point 0 (relative to screen size)
		public static extern c_int GetTouchX();
		[CLink]
		/// Returns touch position Y for touch point 0 (relative to screen size)
		public static extern c_int GetTouchY();
		[CLink]
		/// Returns touch position XY for a touch point index (relative to screen size)
		public static extern Vector2 GetTouchPosition(c_int index);


		///------------------------------------------------------------------------------------ Gestures and Touch
		// Handling Functions (Module: gestures) 
		// ------------------------------------------------------------------------------------
		[CLink]
		/// Enable a set of gestures using flags
		public static extern void SetGesturesEnabled(GestureType gestureFlags);
		[CLink]
		/// Check if a gesture have been detected
		public static extern bool IsGestureDetected(GestureType gesture);
		[CLink]
		/// Get latest detected gesture
		public static extern c_int GetGestureDetected();
		[CLink]
		/// Get touch points count
		public static extern c_int GetTouchPointsCount();
		[CLink]
		/// Get gesture hold time in milliseconds
		public static extern float GetGestureHoldDuration();
		[CLink]
		/// Get gesture drag vector
		public static extern Vector2 GetGestureDragVector();
		[CLink]
		/// Get gesture drag angle
		public static extern float GetGestureDragAngle();
		[CLink]
		/// Get gesture pinch delta
		public static extern Vector2 GetGesturePinchVector();
		[CLink]
		/// Get gesture pinch angle
		public static extern float GetGesturePinchAngle();


		///------------------------------------------------------------------------------------ Camera System
		// Functions (Module: camera) 
		// ------------------------------------------------------------------------------------
		[CLink]
		/// Set camera mode (multiple camera modes available)
		public static extern void SetCameraMode(Camera3D camera, CameraMode mode);
		[CLink]
		/// Update camera position for selected mode
		public static extern void UpdateCamera(Camera3D* camera);
		[CLink]
		/// Set camera pan key to combine with mouse movement (free camera)
		public static extern void SetCameraPanControl(KeyboardKey panKey);
		[CLink]
		/// Set camera alt key to combine with mouse movement (free camera)
		public static extern void SetCameraAltControl(KeyboardKey altKey);
		[CLink]
		/// Set camera smooth zoom key to combine with mouse (free camera)
		public static extern void SetCameraSmoothZoomControl(KeyboardKey szKey);
		[CLink]
		/// Set camera move controls (1st person and 3rd person cameras)
		public static extern void SetCameraMoveControls(KeyboardKey frontKey, KeyboardKey backKey, KeyboardKey rightKey, KeyboardKey leftKey, KeyboardKey upKey, KeyboardKey downKey);


		///------------------------------------------------------------------------------------ Basic Shapes Drawing
		// Functions (Module: shapes) 
		// ------------------------------------------------------------------------------------
		// Basic shapes drawing functions
		[CLink]
		/// Draw a pixel
		public static extern void DrawPixel(c_int posX, c_int posY, Color color);
		[CLink]
		/// Draw a pixel (Vector version)
		public static extern void DrawPixelV(Vector2 position, Color color);
		[CLink]
		/// Draw a line
		public static extern void DrawLine(c_int startPosX, c_int startPosY, c_int endPosX, c_int endPosY, Color color);
		[CLink]
		/// Draw a line (Vector version)
		public static extern void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
		[CLink]
		/// Draw a line defining thickness
		public static extern void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
		[CLink]
		/// Draw a line using cubic-bezier curves in-out
		public static extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
		[CLink]
		/// Draw lines sequence
		public static extern void DrawLineStrip(Vector2* points, c_int numPoints, Color color);
		[CLink]
		/// Draw a color-filled circle
		public static extern void DrawCircle(c_int centerX, c_int centerY, float radius, Color color);
		[CLink]
		/// Draw a piece of a circle
		public static extern void DrawCircleSector(Vector2 center, float radius, c_int startAngle, c_int endAngle, c_int segments, Color color);
		[CLink]
		/// Draw circle sector outline
		public static extern void DrawCircleSectorLines(Vector2 center, float radius, c_int startAngle, c_int endAngle, c_int segments, Color color);
		[CLink]
		/// Draw a gradient-filled circle
		public static extern void DrawCircleGradient(c_int centerX, c_int centerY, float radius, Color color1, Color color2);
		[CLink]
		/// Draw a color-filled circle (Vector version)
		public static extern void DrawCircleV(Vector2 center, float radius, Color color);
		[CLink]
		/// Draw circle outline
		public static extern void DrawCircleLines(c_int centerX, c_int centerY, float radius, Color color);
		[CLink]
		/// Draw ellipse
		public static extern void DrawEllipse(c_int centerX, c_int centerY, float radiusH, float radiusV, Color color);
		[CLink]
		/// Draw ellipse outline
		public static extern void DrawEllipseLines(c_int centerX, c_int centerY, float radiusH, float radiusV, Color color);
		[CLink]
		/// Draw ring
		public static extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, c_int startAngle, c_int endAngle, c_int segments, Color color);
		[CLink]
		/// Draw ring outline
		public static extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, c_int startAngle, c_int endAngle, c_int segments, Color color);
		[CLink]
		/// Draw a color-filled rectangle
		public static extern void DrawRectangle(c_int posX, c_int posY, c_int width, c_int height, Color color);
		[CLink]
		/// Draw a color-filled rectangle (Vector version)
		public static extern void DrawRectangleV(Vector2 position, Vector2 size, Color color);
		[CLink]
		/// Draw a color-filled rectangle
		public static extern void DrawRectangleRec(Rectangle rec, Color color);
		[CLink]
		/// Draw a color-filled rectangle with pro parameters
		public static extern void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
		[CLink]
		/// Draw a vertical-gradient-filled rectangle
		public static extern void DrawRectangleGradientV(c_int posX, c_int posY, c_int width, c_int height, Color color1, Color color2);
		[CLink]
		/// Draw a horizontal-gradient-filled rectangle
		public static extern void DrawRectangleGradientH(c_int posX, c_int posY, c_int width, c_int height, Color color1, Color color2);
		[CLink]
		/// Draw a gradient-filled rectangle with custom vertex colors
		public static extern void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
		[CLink]
		/// Draw rectangle outline
		public static extern void DrawRectangleLines(c_int posX, c_int posY, c_int width, c_int height, Color color);
		[CLink]
		/// Draw rectangle outline with extended parameters
		public static extern void DrawRectangleLinesEx(Rectangle rec, c_int lineThick, Color color);
		[CLink]
		/// Draw rectangle with rounded edges
		public static extern void DrawRectangleRounded(Rectangle rec, float roundness, c_int segments, Color color);
		[CLink]
		/// Draw rectangle with rounded edges outline
		public static extern void DrawRectangleRoundedLines(Rectangle rec, float roundness, c_int segments, c_int lineThick, Color color);
		[CLink]
		/// Draw a color-filled triangle (vertex in counter-clockwise order!)
		public static extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
		[CLink]
		/// Draw triangle outline (vertex in counter-clockwise order!)
		public static extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
		[CLink]
		/// Draw a triangle fan defined by points (first vertex is the center)
		public static extern void DrawTriangleFan(Vector2* points, c_int numPoints, Color color);
		[CLink]
		/// Draw a triangle strip defined by points
		public static extern void DrawTriangleStrip(Vector2* points, c_int pointsCount, Color color);
		[CLink]
		/// Draw a regular polygon (Vector version)
		public static extern void DrawPoly(Vector2 center, c_int sides, float radius, float rotation, Color color);
		[CLink]
		/// Draw a polygon outline of n sides
		public static extern void DrawPolyLines(Vector2 center, c_int sides, float radius, float rotation, Color color);


		// Basic shapes collision detection functions --------------------------
		[CLink]
		/// Check collision between two rectangles
		public static extern bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
		[CLink]
		/// Check collision between two circles
		public static extern bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
		[CLink]
		/// Check collision between circle and rectangle
		public static extern bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
		[CLink]
		/// Get collision rectangle for two rectangles collision
		public static extern Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);
		[CLink]
		/// Check if point is inside rectangle
		public static extern bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
		[CLink]
		/// Check if point is inside circle
		public static extern bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
		[CLink]
		/// Check if point is inside a triangle
		public static extern bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);

		// ------------------------------------------------------------------------------------ 
		// Texture Loading and Drawing Functions (Module: textures) 
		// ------------------------------------------------------------------------------------

		// Image loading functions
		// NOTE: This functions do not require GPU access
		[CLink]
		/// Load image from file into CPU memory (RAM)
		public static extern Image LoadImage(char8* fileName);
		[CLink]
		/// Load image from RAW file data
		public static extern Image LoadImageRaw(char8* fileName, c_int width, c_int height, c_int format, c_int headerSize);
		[CLink]
		/// Load image sequence from file (frames appended to image.data)
		public static extern Image LoadImageAnim(char8* fileName, int* frames);

		[CLink]
		/// Load image from memory buffer, fileType refers to extension: i.e. "png"
		public static extern Image LoadImageFromMemory(char8* fileType, uint8* fileData, c_int dataSize);

		[CLink]
		/// Unload image from CPU memory (RAM)
		public static extern void UnloadImage(Image image);
		[CLink]
		/// Export image data to file
		public static extern void ExportImage(Image image, char8* fileName);
		[CLink]
		/// Export image as code file defining an array of bytes
		public static extern void ExportImageAsCode(Image image, char8* fileName);


		/// Image generation functions
		[CLink]
		/// Generate image: plain color
		public static extern Image GenImageColor(c_int width, c_int height, Color color);
		[CLink]
		/// Generate image: vertical gradient
		public static extern Image GenImageGradientV(c_int width, c_int height, Color top, Color bottom);
		[CLink]
		/// Generate image: horizontal gradient
		public static extern Image GenImageGradientH(c_int width, c_int height, Color left, Color right);
		[CLink]
		/// Generate image: radial gradient
		public static extern Image GenImageGradientRadial(c_int width, c_int height, float density, Color inner, Color outer);
		[CLink]
		/// Generate image: checked
		public static extern Image GenImageChecked(c_int width, c_int height, c_int checksX, c_int checksY, Color col1, Color col2);
		[CLink]
		/// Generate image: white noise
		public static extern Image GenImageWhiteNoise(c_int width, c_int height, float factor);
		[CLink]
		/// Generate image: perlin noise
		public static extern Image GenImagePerlinNoise(c_int width, c_int height, c_int offsetX, c_int offsetY, float scale);
		[CLink]
		/// Generate image: cellular algorithm. Bigger tileSize means bigger cells
		public static extern Image GenImageCellular(c_int width, c_int height, c_int tileSize);



		/// Image manipulation functions
		[CLink]
		/// Create an image duplicate (useful for transformations)
		public static extern Image ImageCopy(Image image);
		[CLink]
		/// Create an image from another image piece
		public static extern Image ImageFromImage(Image image, Rectangle rec);
		[CLink]
		/// Create an image from text (default font)
		public static extern Image ImageText(char8* text, c_int fontSize, Color color);
		[CLink]
		/// Create an image from text (custom sprite font)
		public static extern Image ImageTextEx(Font font, char8* text, float fontSize, float spacing, Color tint);
		[CLink]
		/// Convert image to POT (power-of-two)
		public static extern void ImageToPOT(Image* image, Color fillColor);
		[CLink]
		/// Convert image data to desired format
		public static extern void ImageFormat(Image* image, c_int newFormat);
		[CLink]
		/// Apply alpha mask to image
		public static extern void ImageAlphaMask(Image* image, Image alphaMask);
		[CLink]
		/// Clear alpha channel to desired color
		public static extern void ImageAlphaClear(Image* image, Color color, float threshold);
		[CLink]
		/// Crop image depending on alpha value
		public static extern void ImageAlphaCrop(Image* image, float threshold);
		[CLink]
		/// Premultiply alpha channel
		public static extern void ImageAlphaPremultiply(Image* image);
		[CLink]
		/// Crop an image to a defined rectangle
		public static extern void ImageCrop(Image* image, Rectangle crop);
		[CLink]
		/// Resize image (Bicubic scaling algorithm)
		public static extern void ImageResize(Image* image, c_int newWidth, c_int newHeight);
		[CLink]
		/// Resize image (Nearest-Neighbor scaling algorithm)
		public static extern void ImageResizeNN(Image* image, c_int newWidth, c_int newHeight);
		[CLink]
		/// Resize canvas and fill with color
		public static extern void ImageResizeCanvas(Image* image, c_int newWidth, c_int newHeight, c_int offsetX, c_int offsetY, Color color);
		[CLink]
		/// Generate all mipmap levels for a provided image
		public static extern void ImageMipmaps(Image* image);
		[CLink]
		/// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
		public static extern void ImageDither(Image* image, c_int rBpp, c_int gBpp, c_int bBpp, c_int aBpp);
		[CLink]
		/// Flip image vertically
		public static extern void ImageFlipVertical(Image* image);
		[CLink]
		/// Flip image horizontally
		public static extern void ImageFlipHorizontal(Image* image);
		[CLink]
		/// Rotate image clockwise 90deg
		public static extern void ImageRotateCW(Image* image);
		[CLink]
		/// Rotate image counter-clockwise 90deg
		public static extern void ImageRotateCCW(Image* image);
		[CLink]
		/// Modify image color: tint
		public static extern void ImageColorTint(Image* image, Color color);
		[CLink]
		/// Modify image color: invert
		public static extern void ImageColorInvert(Image* image);
		[CLink]
		/// Modify image color: grayscale
		public static extern void ImageColorGrayscale(Image* image);
		[CLink]
		/// Modify image color: contrast (-100 to 100)
		public static extern void ImageColorContrast(Image* image, float contrast);
		[CLink]
		/// Modify image color: brightness (-255 to 255)
		public static extern void ImageColorBrightness(Image* image, c_int brightness);
		[CLink]
		/// Modify image color: replace color
		public static extern void ImageColorReplace(Image* image, Color color, Color replace);
		[CLink]
		/// Extract color palette from image to maximum size (memory should be freed) IntPtr refers to a Color *
		public static extern Color* GetImagePalette(Image image, c_int maxPaletteSize, c_int* extractCount);
		[CLink]
		/// Get image alpha border rectangle
		public static extern Rectangle GetImageAlphaBorder(Image image, float threshold);

		[CLink]
		/// Get pixel data from image as a Color struct array IntPtr refers to a Color *
		public static extern Color* GetImageData(Image image);

		/// Image drawing functions NOTE: Image software-rendering functions (CPU)
		[CLink]
		/// Clear image background with given color
		public static extern void ImageClearBackground(Image* dst, Color color);
		[CLink]
		/// Draw pixel within an image
		public static extern void ImageDrawPixel(Image* dst, c_int posX, c_int posY, Color color);
		[CLink]
		/// Draw pixel within an image (Vector version)
		public static extern void ImageDrawPixelV(Image* dst, Vector2 position, Color color);
		[CLink]
		/// Draw line within an image
		public static extern void ImageDrawLine(Image* dst, c_int startPosX, c_int startPosY, c_int endPosX, c_int endPosY, Color color);
		[CLink]
		/// Draw line within an image (Vector version)
		public static extern void ImageDrawLineV(Image* dst, Vector2 start, Vector2 end, Color color);
		[CLink]
		/// Draw circle within an image
		public static extern void ImageDrawCircle(Image* dst, c_int centerX, c_int centerY, c_int radius, Color color);
		[CLink]
		/// Draw circle within an image (Vector version)
		public static extern void ImageDrawCircleV(Image* dst, Vector2 center, c_int radius, Color color);
		[CLink]
		/// Draw rectangle within an image
		public static extern void ImageDrawRectangle(Image* dst, c_int posX, c_int posY, c_int width, c_int height, Color color);
		[CLink]
		/// Draw rectangle within an image (Vector version)
		public static extern void ImageDrawRectangleV(Image* dst, Vector2 position, Vector2 size, Color color);
		[CLink]
		/// Draw rectangle within an image
		public static extern void ImageDrawRectangleRec(Image* dst, Rectangle rec, Color color);
		[CLink]
		/// Draw rectangle lines within an image
		public static extern void ImageDrawRectangleLines(Image* dst, Rectangle rec, c_int thick, Color color);
		[CLink]
		/// Draw a source image within a destination image (tint applied to source)
		public static extern void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
		[CLink]
		/// Draw text (default font) within an image (destination)
		public static extern void ImageDrawText(Image* dst, Vector2 position, char8* text, c_int fontSize, Color color);
		[CLink]
		/// Draw text (custom sprite font) within an image (destination)
		public static extern void ImageDrawTextEx(Image* dst, Vector2 position, Font font, char8* text, float fontSize, float spacing, Color color);
		[CLink]
		/// Draw a source image within a destination image (tint applied to source)
		public static extern void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec);


		// Texture loading functions NOTE: These functions require GPU access
		[CLink]
		/// Load texture from file into GPU memory (VRAM)
		public static extern Texture2D LoadTexture(char8* fileName);
		[CLink]
		/// Load texture from image data
		public static extern Texture2D LoadTextureFromImage(Image image);
		[CLink]
		/// Load cubemap from image, multiple image cubemap layouts supported
		public static extern Texture2D LoadTextureCubemap(Image image, CubemapLayoutType layoutType);
		[CLink]
		/// Load texture for rendering (framebuffer)
		public static extern RenderTexture2D LoadRenderTexture(c_int width, c_int height);
		[CLink]
		/// Unload texture from GPU memory (VRAM)
		public static extern void UnloadTexture(Texture2D texture);
		[CLink]
		/// Unload render texture from GPU memory (VRAM)
		public static extern void UnloadRenderTexture(RenderTexture2D target);
		[CLink]
		/// Update GPU texture with new data pixels refers to a const void *
		public static extern void UpdateTexture(Texture2D texture, void* pixels);
		[CLink]
		/// Update GPU texture rectangle with new data
		public static extern void UpdateTextureRec(Texture2D texture, Rectangle rec, void* pixels);
		[CLink]
		/// Get pixel data from GPU texture and return an Image
		public static extern Image GetTextureData(Texture2D texture);
		[CLink]
		/// Get pixel data from screen buffer and return an Image (screenshot)
		public static extern Image GetScreenData();


		/// Texture configuration functions
		[CLink]
		/// Generate GPU mipmaps for a texture
		public static extern void GenTextureMipmaps(Texture2D* texture);
		[CLink]
		/// Set texture scaling filter mode
		public static extern void SetTextureFilter(Texture2D texture, TextureFilterMode filterMode);
		[CLink]
		/// Set texture wrapping mode
		public static extern void SetTextureWrap(Texture2D texture, TextureWrapMode wrapMode);


		/// Texture drawing functions
		[CLink]
		/// Draw a Texture2D
		public static extern void DrawTexture(Texture2D texture, c_int posX, c_int posY, Color tint);
		[CLink]
		/// Draw a Texture2D with position defined as Vector2
		public static extern void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
		[CLink]
		/// Draw a Texture2D with extended parameters
		public static extern void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
		[CLink]
		/// Draw a part of a texture defined by a rectangle
		public static extern void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);
		[CLink]
		/// Draw texture quad with tiling and offset parameters
		public static extern void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);

		[CLink]
		/// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into destRec.
		public static extern void DrawTextureTiled(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, float scale, Color tint);

		[CLink]
		/// Draw a part of a texture defined by a rectangle with 'pro' parameters
		public static extern void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);
		[CLink]
		/// Draws a texture (or part of it) that stretches or shrinks nicely
		public static extern void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);


		/// Image/Texture misc functions
		[CLink]
		/// Get pixel data size in bytes (image or texture)
		public static extern c_int GetPixelDataSize(c_int width, c_int height, c_int format);


		///------------------------------------------------------------------------------------ Font Loading and Text
		// Drawing Functions (Module: text) 
		// ------------------------------------------------------------------------------------
		// Font loading/unloading functions
		[CLink]
		/// Get the default Font
		public static extern Font GetFontDefault();
		[CLink]
		/// Load font from file into GPU memory (VRAM)
		public static extern Font LoadFont(char8* fileName);
		[CLink]
		/// Load font from file with extended parameters
		public static extern Font LoadFontEx(char8* fileName, c_int fontSize, c_int* fontChars, c_int charsCount);
		[CLink]
		/// Load font from Image (XNA style)
		public static extern Font LoadFontFromImage(Image image, Color key, c_int firstChar);
		[CLink]
		/// Load font data for further use
		public static extern CharInfo* LoadFontData(char8* fileName, c_int fontSize, c_int* fontChars, c_int charsCount, FontType type);
		[CLink]
		/// Generate image font atlas using chars info
		public static extern Image GenImageFontAtlas(CharInfo* chars, Rectangle** recs, c_int charsCount, c_int fontSize, c_int padding, c_int packMethod);
		[CLink]
		/// Unload Font from GPU memory (VRAM)
		public static extern void UnloadFont(Font font);


		/// Text drawing functions
		[CLink]
		/// Shows current FPS
		public static extern void DrawFPS(c_int posX, c_int posY);
		[CLink]
		/// Draw text (using default font)
		public static extern void DrawText(char8* text, c_int posX, c_int posY, c_int fontSize, Color color);
		[CLink]
		/// Draw text using font and additional parameters
		public static extern void DrawTextEx(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);
		[CLink]
		/// Draw text using font inside rectangle limits
		public static extern void DrawTextRec(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);
		[CLink]
		/// Draw text using font inside rectangle limits with support for text selection
		public static extern void DrawTextRecEx(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint, c_int selectStart, c_int selectLength, Color selectText, Color selectBack);
		[CLink]
		/// Draw one character (codepoint)
		public static extern void DrawTextCodepoint(Font font, c_int codepoint, Vector2 position, float scale, Color tint);


		// Text misc. functions --------------------
		[CLink]
		/// Measure string width for default font
		public static extern c_int MeasureText(char8* text, c_int fontSize);

		[CLink]
		/// Measure string size for Font
		public static extern Vector2 MeasureTextEx(Font font, char8* text, float fontSize, float spacing);/// Get index


		[CLink]
		// Text formatting with variables (sprintf style)
		public static extern char8* TextFormat(char8* text, void* args);

		// position for a unicode character on font
		/*[CLink]
		public static extern c_int GetGlyphIndex(Font font, c_int character);
		/// Text strings management functions NOTE: Some strings allocate memory internally for returned strings, just
		// be careful!
		/// Check if two text string are equal
		[CLink]
		public static extern bool TextIsEqual(char8* text1, char8* text2);
		/// Get text length, checks for '\0' ending
		[CLink]
		public static extern c_uint TextLength(char8* text);
		/// Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern c_uint TextCountCodepoints(char8* text);
		/// Text formatting with variables (sprintf style)
		[CLink]
		public static extern char8* TextFormat(char8* text);
		/// Get a piece of a text string
		[CLink]
		public static extern char8* TextSubtext(char8* text, c_int position, c_int length);
		/// Replace text char8*(memory should be freed!)
		[CLink]
		public static extern char8* TextReplace(char8* text, char8* replace, char8* by);
		/// Insert text in a position (memory should be freed!)
		[CLink]
		public static extern char8* TextInsert(char8* text, char8* insert, c_int position);
		/// Join text strings with delimiter
		[CLink]
		public static extern char8* TextJoin(char8** textList, c_int count, char8* delimiter);
		/// Split text into multiple strings
		[CLink]
		public static extern char8** TextSplit(char8* text, char8 delimiter, c_int* count);
		/// Append text at specific position and move cursor!
		[CLink]
		public static extern void TextAppend(char8* text, char8* @append, c_int* position);
		/// Find first text occurrence within a string
		[CLink]
		public static extern c_int TextFindIndex(char8* text, char8* find);
		/// Get upper case version of provided string
		[CLink]
		public static extern char8* TextToUpper(char8* text);
		/// Get lower case version of provided string
		[CLink]
		public static extern char8* TextToLower(char8* text);
		/// Get Pascal case notation version of provided string
		[CLink]
		public static extern char8* TextToPascal(char8* text);
		/// Get integer value from text (negative values not supported)
		[CLink]
		public static extern c_int TextToInteger(char8* text);
		/// Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern char8* TextToUtf8(char8* text, c_int length);*/


		/// UTF8 text strings management functions
		/*/// Returns next codepoint in a UTF8 encoded string
		[CLink]
		public static extern c_int* GetCodepoints(char8* text, c_int* count);
		/// Get all codepoints in a string, codepoints count returned by parameters
		[CLink]
		public static extern c_int GetCodepointsCount(char8* text);
		/// Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
		[CLink]
		public static extern c_int GetNextCodepoint(char8* text, c_int* bytesProcessed);
		/// Encode codepoint into utf8 text (char array length returned as parameter)
		[CLink]
		public static extern char8* CodepointToUtf8(char8* text, c_int* byteLength);*/


		///------------------------------------------------------------------------------------ Basic 3d Shapes
		// Drawing Functions (Module: models) 
		// ------------------------------------------------------------------------------------
		// Basic geometric 3D shapes drawing functions
		[CLink]
		/// Draw a line in 3D world space
		public static extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
		[CLink]
		/// Draw a point in 3D space, actually a small line
		public static extern void DrawPoint3D(Vector3 position, Color color);
		[CLink]
		/// Draw a circle in 3D world space
		public static extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
		[CLink]
		/// Draw a color-filled triangle (vertex in counter-clockwise order!)
		public static extern void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);
		[CLink]
		/// Draw a triangle strip defined by points
		public static extern void DrawTriangleStrip3D(Vector3* points, int pointsCount, Color color);
		[CLink]
		/// Draw cube
		public static extern void DrawCube(Vector3 position, float width, float height, float length, Color color);
		[CLink]
		/// Draw cube (Vector version)
		public static extern void DrawCubeV(Vector3 position, Vector3 size, Color color);
		[CLink]
		/// Draw cube wires
		public static extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
		[CLink]
		/// Draw cube wires (Vector version)
		public static extern void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
		[CLink]
		/// Draw cube textured
		public static extern void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
		[CLink]
		/// Draw sphere
		public static extern void DrawSphere(Vector3 centerPos, float radius, Color color);
		[CLink]
		/// Draw sphere with extended parameters
		public static extern void DrawSphereEx(Vector3 centerPos, float radius, c_int rings, c_int slices, Color color);
		[CLink]
		/// Draw sphere wires
		public static extern void DrawSphereWires(Vector3 centerPos, float radius, c_int rings, c_int slices, Color color);
		[CLink]
		/// Draw a cylinder/cone
		public static extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, c_int slices, Color color);
		[CLink]
		/// Draw a cylinder/cone wires
		public static extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, c_int slices, Color color);
		[CLink]
		/// Draw a plane XZ
		public static extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
		[CLink]
		/// Draw a ray line
		public static extern void DrawRay(Ray ray, Color color);
		[CLink]
		/// Draw a grid (centered at (0, 0, 0))
		public static extern void DrawGrid(c_int slices, float spacing);
		[CLink]
		/// Draw simple gizmo
		public static extern void DrawGizmo(Vector3 position);



		///------------------------------------------------------------------------------------ Model 3d Loading and
		// Drawing Functions (Module: models) 
		// ------------------------------------------------------------------------------------
		// Model loading/unloading functions
		[CLink]
		/// Load model from files (meshes and materials)
		public static extern Model LoadModel(char8* fileName);
		[CLink]
		/// Load model from generated mesh (default material)
		public static extern Model LoadModelFromMesh(Mesh mesh);
		[CLink]
		/// Unload model from memory (RAM and/or VRAM)
		public static extern void UnloadModel(Model model);


		/// Mesh loading/unloading functions
		[CLink]
		/// Load meshes from model file
		public static extern Mesh* LoadMeshes(char8* fileName, c_int* meshCount);
		[CLink]
		/// Export mesh data to file
		public static extern void ExportMesh(Mesh mesh, char8* fileName);
		[CLink]
		/// Unload mesh from memory (RAM and/or VRAM)
		public static extern void UnloadMesh(Mesh mesh);

		/// Material loading/unloading functions
		[CLink]
		/// Load materials from model file
		public static extern Material* LoadMaterials(char8* fileName, c_int* materialCount);
		[CLink]
		/// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
		public static extern Material LoadMaterialDefault();
		[CLink]
		/// Unload material from GPU memory (VRAM)
		public static extern void UnloadMaterial(Material material);
		[CLink]
		/// Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
		public static extern void SetMaterialTexture(Material* material, c_int mapType, Texture2D texture);
		[CLink]
		/// Set material for a mesh
		public static extern void SetModelMeshMaterial(Model* model, c_int meshId, c_int materialId);

		/// Model animations loading/unloading functions
		// Load model animations from file
		[CLink]
		/// Ptr refers to ModelAnimation *
		public static extern ModelAnimation* LoadModelAnimations(char8* fileName, c_int* animsCount);
		[CLink]
		/// Update model animation pose
		public static extern void UpdateModelAnimation(Model model, ModelAnimation anim, c_int frame);
		[CLink]
		/// Unload animation data
		public static extern void UnloadModelAnimation(ModelAnimation anim);
		[CLink]
		/// Check model animation skeleton match
		public static extern bool IsModelAnimationValid(Model model, ModelAnimation anim);

		/// Mesh generation functions
		[CLink]
		/// Generate polygonal mesh
		public static extern Mesh GenMeshPoly(c_int sides, float radius);
		[CLink]
		/// Generate plane mesh (with subdivisions)
		public static extern Mesh GenMeshPlane(float width, float length, c_int resX, c_int resZ);
		[CLink]
		/// Generate cuboid mesh
		public static extern Mesh GenMeshCube(float width, float height, float length);
		[CLink]
		/// Generate sphere mesh (standard sphere)
		public static extern Mesh GenMeshSphere(float radius, c_int rings, c_int slices);
		[CLink]
		/// Generate half-sphere mesh (no bottom cap)
		public static extern Mesh GenMeshHemiSphere(float radius, c_int rings, c_int slices);
		[CLink]
		/// Generate cylinder mesh
		public static extern Mesh GenMeshCylinder(float radius, float height, c_int slices);
		[CLink]
		/// Generate torus mesh
		public static extern Mesh GenMeshTorus(float radius, float size, c_int radSeg, c_int sides);
		[CLink]
		/// Generate trefoil knot mesh
		public static extern Mesh GenMeshKnot(float radius, float size, c_int radSeg, c_int sides);
		[CLink]
		/// Generate heightmap mesh from image data
		public static extern Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
		[CLink]
		/// Generate cubes-based map mesh from image data
		public static extern Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


		/// Mesh manipulation functions
		[CLink]
		/// Compute mesh bounding box limits
		public static extern BoundingBox MeshBoundingBox(Mesh mesh);
		[CLink]
		/// Compute mesh tangents
		public static extern void MeshTangents(Mesh* mesh);
		[CLink]
		/// Compute mesh binormals
		public static extern void MeshBinormals(Mesh* mesh);

		/// Model drawing functions
		[CLink]
		/// Draw a model (with texture if set)
		public static extern void DrawModel(Model model, Vector3 position, float scale, Color tint);
		[CLink]
		/// Draw a model with extended parameters
		public static extern void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
		[CLink]
		/// Draw a model wires (with texture if set)
		public static extern void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
		[CLink]
		/// Draw a model wires (with texture if set) with extended parameters
		public static extern void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
		[CLink]
		/// Draw bounding box (wires)
		public static extern void DrawBoundingBox(BoundingBox @box, Color color);
		[CLink]
		/// Draw a billboard texture
		public static extern void DrawBillboard(Camera3D camera, Texture2D texture, Vector3 center, float size, Color tint);
		[CLink]
		/// Draw a billboard texture defined by sourceRec
		public static extern void DrawBillboardRec(Camera3D camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);

		/// Collision detection functions
		[CLink]
		/// Detect collision between two spheres
		public static extern bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);
		[CLink]
		/// Detect collision between two bounding boxes
		public static extern bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
		[CLink]
		/// Detect collision between box and sphere
		public static extern bool CheckCollisionBoxSphere(BoundingBox @box, Vector3 centerSphere, float radiusSphere);
		[CLink]
		/// Detect collision between ray and sphere
		public static extern bool CheckCollisionRaySphere(Ray ray, Vector3 spherePosition, float sphereRadius);
		[CLink]
		/// Detect collision between ray and sphere, returns collision point
		public static extern bool CheckCollisionRaySphereEx(Ray ray, Vector3 spherePosition, float sphereRadius, Vector3* collisionPoint);
		[CLink]
		/// Detect collision between ray and box
		public static extern bool CheckCollisionRayBox(Ray ray, BoundingBox @box);
		[CLink]
		/// Get collision info between ray and model
		public static extern RayHitInfo GetCollisionRayModel(Ray ray, Model model);
		[CLink]
		/// Get collision info between ray and triangle
		public static extern RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
		[CLink]
		/// Get collision info between ray and ground plane (Y-normal plane)
		public static extern RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);

		///------------------------------------------------------------------------------------ Shaders System
		// Functions (Module: rlgl) NOTE: This functions are useless when using OpenGL 1.1 
		// ------------------------------------------------------------------------------------
		// Shader loading/unloading functions
		[CLink]
		/// Load shader from files and bind default locations
		public static extern Shader LoadShader(char8* vsFileName, char8* fsFileName);
		[CLink]
		/// Load shader from code strings and bind default locations
		public static extern Shader LoadShaderCode(char8* vsCode, char8* fsCode);
		[CLink]
		/// Unload shader from GPU memory (VRAM)
		public static extern void UnloadShader(Shader shader);
		[CLink]
		/// Get default shader
		public static extern Shader GetShaderDefault();
		[CLink]
		/// Get default texture
		public static extern Texture2D GetTextureDefault();
		[CLink]
		/// Get texture to draw shapes
		public static extern Texture2D GetShapesTexture();
		[CLink]
		/// Get texture rectangle to draw shapes
		public static extern Rectangle GetShapesTextureRec();
		[CLink]
		/// Define default texture used to draw shapes
		public static extern void SetShapesTexture(Texture2D texture, Rectangle source);


		/// Shader configuration functions
		[CLink]
		/// Get shader uniform location
		public static extern c_int GetShaderLocation(Shader shader, char8* uniformName);
		[CLink]
		/// Set shader uniform value value refers to a const void *
		public static extern void SetShaderValue(Shader shader, c_int uniformLoc, void* value, ShaderUniformDataType uniformType);
		[CLink]
		/// Set shader uniform value value refers to a const void *
		public static extern void SetShaderValue(Shader shader, c_int uniformLoc, c_int* value, ShaderUniformDataType uniformType);
		[CLink]
		/// Set shader uniform value value refers to a const void *
		public static extern void SetShaderValue(Shader shader, c_int uniformLoc, float* value, ShaderUniformDataType uniformType);
		[CLink]
		/// Set shader uniform value vector value refers to a const void *
		public static extern void SetShaderValueV(Shader shader, c_int uniformLoc, void* value, ShaderUniformDataType uniformType, c_int count);
		[CLink]
		/// Set shader uniform value (matrix 4x4)
		public static extern void SetShaderValueMatrix(Shader shader, c_int uniformLoc, Matrix mat);
		[CLink]
		/// Set shader uniform value for texture
		public static extern void SetShaderValueTexture(Shader shader, c_int uniformLoc, Texture2D texture);
		[CLink]
		/// Set a custom projection matrix (replaces internal projection matrix)
		public static extern void SetMatrixProjection(Matrix proj);
		[CLink]
		/// Set a custom modelview matrix (replaces internal modelview matrix)
		public static extern void SetMatrixModelview(Matrix view);
		[CLink]
		/// Get internal modelview matrix
		public static extern Matrix GetMatrixModelview();
		[CLink]
		/// Get internal projection matrix
		public static extern Matrix GetMatrixProjection();

		/// Texture maps generation (PBR) NOTE: Required shaders should be provided
		[CLink]
		/// Generate cubemap texture from HDR texture
		public static extern Texture2D GenTextureCubemap(Shader shader, Texture2D skyHDR, c_int size);
		[CLink]
		/// Generate irradiance texture using cubemap data
		public static extern Texture2D GenTextureIrradiance(Shader shader, Texture2D cubemap, c_int size);
		[CLink]
		/// Generate prefilter texture using cubemap data
		public static extern Texture2D GenTexturePrefilter(Shader shader, Texture2D cubemap, c_int size);
		[CLink]
		/// Generate BRDF texture
		public static extern Texture2D GenTextureBRDF(Shader shader, c_int size);

		/// Shading begin/end functions
		[CLink]
		/// Begin custom shader drawing
		public static extern void BeginShaderMode(Shader shader);
		[CLink]
		/// End custom shader drawing (use default shader)
		public static extern void EndShaderMode();
		[CLink]
		/// Begin blending mode (alpha, additive, multiplied)
		public static extern void BeginBlendMode(BlendMode mode);
		[CLink]
		/// End blending mode (reset to default: alpha blending)
		public static extern void EndBlendMode();

		/// VR control functions
		[CLink]
		/// Init VR simulator for selected device parameters
		public static extern void InitVrSimulator();
		[CLink]
		/// Close VR simulator for current device
		public static extern void CloseVrSimulator();
		[CLink]
		/// Update VR tracking (position and orientation) and camera
		public static extern void UpdateVrTracking(Camera3D* camera);
		[CLink]
		/// Set stereo rendering configuration parameters
		public static extern void SetVrConfiguration(VrDeviceInfo info, Shader distortion);
		[CLink]
		/// Detect if VR simulator is ready
		public static extern bool IsVrSimulatorReady();
		[CLink]
		/// Enable/Disable VR experience
		public static extern void ToggleVrMode();
		[CLink]
		/// Begin VR simulator stereo rendering
		public static extern void BeginVrDrawing();
		[CLink]
		/// End VR simulator stereo rendering
		public static extern void EndVrDrawing();

		///------------------------------------------------------------------------------------ Audio Loading and
		// Playing Functions (Module: audio) 
		// ------------------------------------------------------------------------------------

		// Audio device management functions
		[CLink]
		/// Initialize audio device and context
		public static extern void InitAudioDevice();

		[CLink]
		/// Close the audio device and context
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
		/// Get samples data from wave as a floats array
		public static extern float* GetWaveData(Wave wave);


		// Music management functions
		[CLink]
		/// Load music stream from file
		public static extern Music LoadMusicStream(char8* fileName);

		[CLink]
		/// Unload music stream
		public static extern void UnloadMusicStream(Music music);

		[CLink]
		/// Start music playing
		public static extern void PlayMusicStream(Music music);

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
		/// Check if music is playing
		public static extern bool IsMusicPlaying(Music music);

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


	}
}
