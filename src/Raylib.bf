using System;
using raylib_beef.Enums;
using raylib_beef.Types;
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


		// // Callback delegate used in SetTraceLogCallback to allow for custom logging
		public delegate void TraceLogCallback(TraceLogType logType, char8* text, void* args);



		// //------------------------------------------------------------------------------------ Window and Graphics
		// Device Functions (Module: core) 
		// ------------------------------------------------------------------------------------

		// Window-related functions

		// Initialize window and OpenGL context
		[CLink]
		public static extern void InitWindow(int width, int height, char8* title);
		// // Check if KEY_ESCAPE pressed or Close icon pressed
		[CLink]
		public static extern bool WindowShouldClose();
		// // Close window and unload OpenGL context
		[CLink]
		public static extern void CloseWindow();
		// // Check if window has been initialized successfully
		[CLink]
		public static extern bool IsWindowReady();
		// // Check if window has been minimized (or lost focus)
		[CLink]
		public static extern bool IsWindowMinimized();
		// // Check if window has been resized
		[CLink]
		public static extern bool IsWindowResized();
		// // Check if window is currently hidden
		[CLink]
		public static extern bool IsWindowHidden();
		// // Check if window is currently fullscreen
		[CLink]
		public static extern void IsWindowFullscreen();
		// // Toggle fullscreen mode (only PLATFORM_DESKTOP)
		[CLink]
		public static extern void ToggleFullscreen();
		// // Show the window
		[CLink]
		public static extern void UnhideWindow();
		// // Hide the window
		[CLink]
		public static extern void HideWindow();
		// // Set icon for window (only PLATFORM_DESKTOP)
		[CLink]
		public static extern void SetWindowIcon(Image image);
		// // Set title for window (only PLATFORM_DESKTOP)
		[CLink]
		public static extern void SetWindowTitle(char8* title);
		// // Set window position on screen (only PLATFORM_DESKTOP)
		[CLink]
		public static extern void SetWindowPosition(int x, int y);
		// // Set monitor for the current window (fullscreen mode)
		[CLink]
		public static extern void SetWindowMonitor(int monitor);
		// // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
		[CLink]
		public static extern void SetWindowMinSize(int width, int height);
		// // Set window dimensions
		[CLink]
		public static extern void SetWindowSize(int width, int height);
		// // Get native window handle IntPtr refers to a void *
		[CLink]
		public static extern void* GetWindowHandle();
		// // Get current screen width
		[CLink]
		public static extern int GetScreenWidth();
		// // Get current screen height
		[CLink]
		public static extern int GetScreenHeight();
		// // Get number of connected monitors
		[CLink]
		public static extern int GetMonitorCount();
		// // Get primary monitor width
		[CLink]
		public static extern int GetMonitorWidth(int monitor);
		// // Get primary monitor height
		[CLink]
		public static extern int GetMonitorHeight(int monitor);
		// // Get primary monitor physical width in millimetres
		[CLink]
		public static extern int GetMonitorPhysicalWidth(int monitor);
		// // Get primary monitor physical height in millimetres
		[CLink]
		public static extern int GetMonitorPhysicalHeight(int monitor);
		// // Get window position XY on monitor
		[CLink]
		public static extern Vector2 GetWindowPosition();
		// // Get window scale DPI factor
		[CLink]
		public static extern Vector2 GetWindowScaleDPI();
		// // Get the human-readable, UTF-8 encoded name of the primary monitor
		[CLink]
		public static extern char8* GetMonitorName(int monitor);
		// // Get clipboard text content
		[CLink]
		public static extern char8* GetClipboardText();
		// // Set clipboard text content
		[CLink]
		public static extern void SetClipboardText(char8* text);


		// // Cursor-related functions
		// Shows cursor
		[CLink]
		public static extern void ShowCursor();
		// // Hides cursor
		[CLink]
		public static extern void HideCursor();
		// // Check if cursor is not visible
		[CLink]
		public static extern bool IsCursorHidden();
		// // Enables cursor (unlock cursor)
		[CLink]
		public static extern void EnableCursor();
		// // Disables cursor (lock cursor)
		[CLink]
		public static extern void DisableCursor();


		// // Drawing-related functions
		// Set background color (framebuffer clear color)
		[CLink]
		public static extern void ClearBackground(Color color);
		// // Setup canvas (framebuffer) to start drawing
		[CLink]
		public static extern void BeginDrawing();
		// // End canvas drawing and swap buffers (double buffering)
		[CLink]
		public static extern void EndDrawing();
		// // Initialize 2D mode with custom camera (2D)
		[CLink]
		public static extern void BeginMode2D(Camera2D camera);
		// // Ends 2D mode with custom camera
		[CLink]
		public static extern void EndMode2D();
		// // Initializes 3D mode with custom camera (3D)
		[CLink]
		public static extern void BeginMode3D(Camera3D camera);
		// // Ends 3D mode and returns to default 2D orthographic mode
		[CLink]
		public static extern void EndMode3D();
		// // Initializes render texture for drawing
		[CLink]
		public static extern void BeginTextureMode(RenderTexture2D target);
		// // Ends drawing to render texture
		[CLink]
		public static extern void EndTextureMode();
		// // Begin scissor mode (define screen area for following drawing)
		[CLink]
		public static extern void BeginScissorMode(int x, int y, int width, int height);
		// // End scissor mode
		[CLink]
		public static extern void EndScissorMode();


		// // Screen-space-related functions
		// Returns a ray trace from mouse position
		[CLink]
		public static extern Ray GetMouseRay(Vector2 mousePosition, Camera3D camera);
		// // Returns camera transform matrix (view matrix)
		[CLink]
		public static extern Matrix GetCameraMatrix(Camera3D camera);
		// // Returns camera 2d transform matrix
		[CLink]
		public static extern Matrix GetCameraMatrix2D(Camera2D camera);
		// // Returns the screen space position for a 3d world space position
		[CLink]
		public static extern Vector2 GetWorldToScreen(Vector3 position, Camera3D camera);
		// // Returns size position for a 3d world space position
		[CLink]
		public static extern Vector2 GetWorldToScreenEx(Vector3 position, Camera3D camera, int width, int height);
		// // Returns the screen space position for a 2d camera world space position
		[CLink]
		public static extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);
		// // Returns the world space position for a 2d camera screen space position
		[CLink]
		public static extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);


		// // Timing-related functions
		// Set target FPS (maximum)
		[CLink]
		public static extern void SetTargetFPS(int fps);
		// // Returns current FPS
		[CLink]
		public static extern int GetFPS();
		// // Returns time in seconds for last frame drawn
		[CLink]
		public static extern float GetFrameTime();
		// // Returns elapsed time in seconds since InitWindow()
		[CLink]
		public static extern double GetTime();


		// // Color-related functions
		// Returns hexadecimal value for a Color
		[CLink]
		public static extern int ColorToInt(Color color);
		// // Returns color normalized as float [0..1]
		[CLink]
		public static extern Vector4 ColorNormalize(Color color);
		// // Returns color from normalized values [0..1]
		[CLink]
		public static extern Color ColorFromNormalized(Vector4 normalized);
		// // Returns HSV values for a Color
		[CLink]
		public static extern Vector3 ColorToHSV(Color color);
		// // Returns a Color from HSV values
		[CLink]
		public static extern Color ColorFromHSV(Vector3 hsv);
		// // Returns a Color struct from hexadecimal value
		[CLink]
		public static extern Color GetColor(int hexValue);
		// // Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
		[CLink]
		public static extern Color Fade(Color color, float alpha);


		// // Misc. functions
		// Setup window configuration flags (view FLAGS)
		[CLink]
		public static extern void SetConfigFlags(ConfigFlag flags);
		// // Set the current threshold (minimum) log level
		[CLink]
		public static extern void SetTraceLogLevel(TraceLogType logType);
		// // Set the exit threshold (minimum) log level
		[CLink]
		public static extern void SetTraceLogExit(TraceLogType logType);
		// // Set a trace log callback to enable custom logging
		[CLink]
		public static extern void SetTraceLogCallback(TraceLogCallback callback);
		// // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
		[CLink]
		public static extern void TraceLog(TraceLogType logType, char8* text);
		// // Takes a screenshot of current screen (saved a .png)
		[CLink]
		public static extern void TakeScreenshot(char8* fileName);
		// // Returns a random value between min and max (both included)
		[CLink]
		public static extern int GetRandomValue(int min, int max);


		// // Files management functions
		// Load file data as byte array (read)
		[CLink]
		public static extern uint8* LoadFileData(char8* fileName, int* bytesRead);
		// // Save data to file from byte array (write)
		[CLink]
		public static extern void SaveFileData(char8* fileName, void* data, int bytesToWrite);
		// // Check if file exists
		[CLink]
		public static extern bool FileExists(char8* fileName);
		// // Check file extension
		[CLink]
		public static extern bool IsFileExtension(char8* fileName, char8* ext);
		// // Check if a directory path exists
		[CLink]
		public static extern bool DirectoryExists(char8* dirPath);
		// // Get pointer to extension for a filename char8*
		[CLink]
		public static extern char8* GetExtension(char8* fileName);
		// // Get pointer to filename for a path char8*
		[CLink]
		public static extern char8* GetFileName(char8* filePath);
		// // Get filename string without extension (uses static string)
		[CLink]
		public static extern char8* GetFileNameWithoutExt(char8* filePath);
		// // Get full path for a given fileName (uses static string)
		[CLink]
		public static extern char8* GetDirectoryPath(char8* fileName);
		// // Get previous directory path for a given path (uses static string)
		[CLink]
		public static extern char8* GetPrevDirectoryPath(char8* dirPath);
		// // Get current working directory (uses static string)
		[CLink]
		public static extern char8* GetWorkingDirectory();
		// // Get filenames in a directory path (memory should be freed)
		[CLink]
		public static extern char8** GetDirectoryFiles(char8* dirPath, int* count);
		// // Clear directory files paths buffers (free memory)
		[CLink]
		public static extern void ClearDirectoryFiles();
		// // Change working directory, returns true if success
		[CLink]
		public static extern bool ChangeDirectory(char8* dir);
		// // Check if a file has been dropped into window
		[CLink]
		public static extern bool IsFileDropped();
		// // Get dropped files names (memory should be freed)
		[CLink]
		public static extern char8** GetDroppedFiles(int* count);
		// // Clear dropped files paths buffer (free memory)
		[CLink]
		public static extern void ClearDroppedFiles();
		// // Get file modification time (last write time)
		[CLink]
		public static extern int GetFileModTime(char8* fileName);
		// // Compress data (DEFLATE algorithm)
		[CLink]
		public static extern uint8* CompressData(uint8* data, int dataLength, int* compDataLength);
		// // Decompress data (DEFLATE algorithm)
		[CLink]
		public static extern uint8* DecompressData(uint8* compData, int compDataLength, int* dataLength);


		// // Persistent storage management
		// Save integer value to storage file (to defined position)
		[CLink]
		public static extern void StorageSaveValue(int position, int value);
		// // Load integer value from storage file (from defined position)
		[CLink]
		public static extern int StorageLoadValue(int position);
		// // Open URL with default system browser (if available)
		[CLink]
		public static extern void OpenURL(char8* url);


		// //------------------------------------------------------------------------------------
		// Input Handling Functions (Module: core)
		// // -----------------------------------------------------------------------------------
		// Input-related functions: keyboard
		// Detect if a key has been pressed once
		[CLink]
		public static extern bool IsKeyPressed(KeyboardKey key);
		// // Detect if a key is being pressed
		[CLink]
		public static extern bool IsKeyDown(KeyboardKey key);
		// // Detect if a key has been released once
		[CLink]
		public static extern bool IsKeyReleased(KeyboardKey key);
		// // Detect if a key is NOT being pressed
		[CLink]
		public static extern bool IsKeyUp(KeyboardKey key);
		// // Set a custom key to exit program (default is ESC)
		[CLink]
		public static extern void SetExitKey(KeyboardKey key);
		// // Get key pressed, call it multiple times for chars queued
		[CLink]
		public static extern int GetKeyPressed();


		// // Input-related functions: gamepads
		// Detect if a gamepad is available
		[CLink]
		public static extern bool IsGamepadAvailable(GamepadNumber gamepad);
		// // Check gamepad name (if available)
		[CLink]
		public static extern bool IsGamepadName(GamepadNumber gamepad, char8* name);
		// // Return gamepad internal name id
		[CLink]
		public static extern char8* GetGamepadName(GamepadNumber gamepad);
		// // Detect if a gamepad button has been pressed once
		[CLink]
		public static extern bool IsGamepadButtonPressed(GamepadNumber gamepad, GamepadButton button);
		// // Detect if a gamepad button is being pressed
		[CLink]
		public static extern bool IsGamepadButtonDown(GamepadNumber gamepad, GamepadButton button);
		// // Detect if a gamepad button has been released once
		[CLink]
		public static extern bool IsGamepadButtonReleased(GamepadNumber gamepad, GamepadButton button);
		// // Detect if a gamepad button is NOT being pressed
		[CLink]
		public static extern bool IsGamepadButtonUp(GamepadNumber gamepad, GamepadButton button);
		// // Get the last gamepad button pressed
		[CLink]
		public static extern int GetGamepadButtonPressed();
		// // Return gamepad axis count for a gamepad
		[CLink]
		public static extern int GetGamepadAxisCount(GamepadNumber gamepad);
		// // Return axis movement value for a gamepad axis
		[CLink]
		public static extern float GetGamepadAxisMovement(GamepadNumber gamepad, GamepadAxis axis);


		// // Input-related functions: mouse
		// Detect if a mouse button has been pressed once
		[CLink]
		public static extern bool IsMouseButtonPressed(MouseButton button);
		// // Detect if a mouse button is being pressed
		[CLink]
		public static extern bool IsMouseButtonDown(MouseButton button);
		// // Detect if a mouse button has been released once
		[CLink]
		public static extern bool IsMouseButtonReleased(MouseButton button);
		// // Detect if a mouse button is NOT being pressed
		[CLink]
		public static extern bool IsMouseButtonUp(MouseButton button);
		// // Returns mouse position X
		[CLink]
		public static extern int GetMouseX();
		// // Returns mouse position Y
		[CLink]
		public static extern int GetMouseY();
		// // Returns mouse position XY
		[CLink]
		public static extern Vector2 GetMousePosition();
		// // Set mouse position XY
		[CLink]
		public static extern void SetMousePosition(int x, int y);
		// // Set mouse offset
		[CLink]
		public static extern void SetMouseOffset(int offsetX, int offsetY);
		// // Set mouse scaling
		[CLink]
		public static extern void SetMouseScale(float scaleX, float scaleY);
		// // Returns mouse wheel movement Y
		[CLink]
		public static extern int GetMouseWheelMove();


		// // Input-related functions: touch
		// Returns touch position X for touch point 0 (relative to screen size)
		[CLink]
		public static extern int GetTouchX();
		// // Returns touch position Y for touch point 0 (relative to screen size)
		[CLink]
		public static extern int GetTouchY();
		// // Returns touch position XY for a touch point index (relative to screen size)
		[CLink]
		public static extern Vector2 GetTouchPosition(int index);


		// //------------------------------------------------------------------------------------ Gestures and Touch
		// Handling Functions (Module: gestures) 
		// ------------------------------------------------------------------------------------
		// Enable a set of gestures using flags
		[CLink]
		public static extern void SetGesturesEnabled(GestureType gestureFlags);
		// // Check if a gesture have been detected
		[CLink]
		public static extern bool IsGestureDetected(GestureType gesture);
		// // Get latest detected gesture
		[CLink]
		public static extern int GetGestureDetected();
		// // Get touch points count
		[CLink]
		public static extern int GetTouchPointsCount();
		// // Get gesture hold time in milliseconds
		[CLink]
		public static extern float GetGestureHoldDuration();
		// // Get gesture drag vector
		[CLink]
		public static extern Vector2 GetGestureDragVector();
		// // Get gesture drag angle
		[CLink]
		public static extern float GetGestureDragAngle();
		// // Get gesture pinch delta
		[CLink]
		public static extern Vector2 GetGesturePinchVector();
		// // Get gesture pinch angle
		[CLink]
		public static extern float GetGesturePinchAngle();


		// //------------------------------------------------------------------------------------ Camera System
		// Functions (Module: camera) 
		// ------------------------------------------------------------------------------------
		// Set camera mode (multiple camera modes available)
		[CLink]
		public static extern void SetCameraMode(Camera3D camera, CameraMode mode);
		// // Update camera position for selected mode
		[CLink]
		public static extern void UpdateCamera(Camera3D* camera);
		// // Set camera pan key to combine with mouse movement (free camera)
		[CLink]
		public static extern void SetCameraPanControl(KeyboardKey panKey);
		// // Set camera alt key to combine with mouse movement (free camera)
		[CLink]
		public static extern void SetCameraAltControl(KeyboardKey altKey);
		// // Set camera smooth zoom key to combine with mouse (free camera)
		[CLink]
		public static extern void SetCameraSmoothZoomControl(KeyboardKey szKey);
		// // Set camera move controls (1st person and 3rd person cameras)
		[CLink]
		public static extern void SetCameraMoveControls(KeyboardKey frontKey, KeyboardKey backKey, KeyboardKey rightKey, KeyboardKey leftKey, KeyboardKey upKey, KeyboardKey downKey);


		// //------------------------------------------------------------------------------------ Basic Shapes Drawing
		// Functions (Module: shapes) 
		// ------------------------------------------------------------------------------------
		// Basic shapes drawing functions
		// Draw a pixel
		[CLink]
		public static extern void DrawPixel(int posX, int posY, Color color);
		// // Draw a pixel (Vector version)
		[CLink]
		public static extern void DrawPixelV(Vector2 position, Color color);
		// // Draw a line
		[CLink]
		public static extern void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
		// // Draw a line (Vector version)
		[CLink]
		public static extern void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
		// // Draw a line defining thickness
		[CLink]
		public static extern void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
		// // Draw a line using cubic-bezier curves in-out
		[CLink]
		public static extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
		// // Draw lines sequence
		[CLink]
		public static extern void DrawLineStrip(Vector2* points, int numPoints, Color color);
		// // Draw a color-filled circle
		[CLink]
		public static extern void DrawCircle(int centerX, int centerY, float radius, Color color);
		// // Draw a piece of a circle
		[CLink]
		public static extern void DrawCircleSector(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
		// // Draw circle sector outline
		[CLink]
		public static extern void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
		// // Draw a gradient-filled circle
		[CLink]
		public static extern void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
		// // Draw a color-filled circle (Vector version)
		[CLink]
		public static extern void DrawCircleV(Vector2 center, float radius, Color color);
		// // Draw circle outline
		[CLink]
		public static extern void DrawCircleLines(int centerX, int centerY, float radius, Color color);
		// // Draw ellipse
		[CLink]
		public static extern void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
		// // Draw ellipse outline
		[CLink]
		public static extern void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
		// // Draw ring
		[CLink]
		public static extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
		// // Draw ring outline
		[CLink]
		public static extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
		// // Draw a color-filled rectangle
		[CLink]
		public static extern void DrawRectangle(int posX, int posY, int width, int height, Color color);
		// // Draw a color-filled rectangle (Vector version)
		[CLink]
		public static extern void DrawRectangleV(Vector2 position, Vector2 size, Color color);
		// // Draw a color-filled rectangle
		[CLink]
		public static extern void DrawRectangleRec(Rectangle rec, Color color);
		// // Draw a color-filled rectangle with pro parameters
		[CLink]
		public static extern void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
		// // Draw a vertical-gradient-filled rectangle
		[CLink]
		public static extern void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
		// // Draw a horizontal-gradient-filled rectangle
		[CLink]
		public static extern void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
		// // Draw a gradient-filled rectangle with custom vertex colors
		[CLink]
		public static extern void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
		// // Draw rectangle outline
		[CLink]
		public static extern void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
		// // Draw rectangle outline with extended parameters
		[CLink]
		public static extern void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);
		// // Draw rectangle with rounded edges
		[CLink]
		public static extern void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
		// // Draw rectangle with rounded edges outline
		[CLink]
		public static extern void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color);
		// // Draw a color-filled triangle (vertex in counter-clockwise order!)
		[CLink]
		public static extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
		// // Draw triangle outline (vertex in counter-clockwise order!)
		[CLink]
		public static extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
		// // Draw a triangle fan defined by points (first vertex is the center)
		[CLink]
		public static extern void DrawTriangleFan(Vector2* points, int numPoints, Color color);
		// // Draw a triangle strip defined by points
		[CLink]
		public static extern void DrawTriangleStrip(Vector2* points, int pointsCount, Color color);
		// // Draw a regular polygon (Vector version)
		[CLink]
		public static extern void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
		// // Draw a polygon outline of n sides
		[CLink]
		public static extern void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);


		// // Basic shapes collision detection functions
		// Check collision between two rectangles
		[CLink]
		public static extern bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
		// // Check collision between two circles
		[CLink]
		public static extern bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
		// // Check collision between circle and rectangle
		[CLink]
		public static extern bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
		// // Get collision rectangle for two rectangles collision
		[CLink]
		public static extern Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);
		// // Check if point is inside rectangle
		[CLink]
		public static extern bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
		// // Check if point is inside circle
		[CLink]
		public static extern bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
		// // Check if point is inside a triangle
		[CLink]
		public static extern bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);


		// //------------------------------------------------------------------------------------ Texture Loading and
		// Drawing Functions (Module: textures) 
		// ------------------------------------------------------------------------------------
		// Image loading functions
		// NOTE: This functions do not require GPU access
		// Load image from file into CPU memory (RAM)
		[CLink]
		public static extern Image LoadImage(char8* fileName);
		// // Load image from Color array data (RGBA - 32bit)
		[CLink]
		public static extern Image LoadImageEx(Color* pixels, int width, int height);
		// // Load image from raw data with parameters data refers to a void *
		/*[ CLink]
		public static extern Image LoadImagePro(IntPtr data, int width, int height, int format);*/
		// // Load image from RAW file data
		[CLink]
		public static extern Image LoadImageRaw(char8* fileName, int width, int height, int format, int headerSize);
		// // Unload image from CPU memory (RAM)
		[CLink]
		public static extern void UnloadImage(Image image);
		// // Export image data to file
		[CLink]
		public static extern void ExportImage(Image image, char8* fileName);
		// // Export image as code file defining an array of bytes
		[CLink]
		public static extern void ExportImageAsCode(Image image, char8* fileName);
		// // Get pixel data from image as a Color struct array IntPtr refers to a Color *
		[CLink]
		public static extern Color* GetImageData(Image image);
		// // Get pixel data from image as Vector4 array (float normalized) IntPtr refers to a Vector4 *
		[CLink]
		public static extern Vector4* GetImageDataNormalized(Image image);


		// // Image generation functions
		// Generate image: plain color
		[CLink]
		public static extern Image GenImageColor(int width, int height, Color color);
		// // Generate image: vertical gradient
		[CLink]
		public static extern Image GenImageGradientV(int width, int height, Color top, Color bottom);
		// // Generate image: horizontal gradient
		[CLink]
		public static extern Image GenImageGradientH(int width, int height, Color left, Color right);
		// // Generate image: radial gradient
		[CLink]
		public static extern Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
		// // Generate image: checked
		[CLink]
		public static extern Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
		// // Generate image: white noise
		[CLink]
		public static extern Image GenImageWhiteNoise(int width, int height, float factor);
		// // Generate image: perlin noise
		[CLink]
		public static extern Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
		// // Generate image: cellular algorithm. Bigger tileSize means bigger cells
		[CLink]
		public static extern Image GenImageCellular(int width, int height, int tileSize);


		// // Image manipulation functions
		// Create an image duplicate (useful for transformations)
		[CLink]
		public static extern Image ImageCopy(Image image);
		// // Create an image from another image piece
		[CLink]
		public static extern Image ImageFromImage(Image image, Rectangle rec);
		// // Create an image from text (default font)
		[CLink]
		public static extern Image ImageText(char8* text, int fontSize, Color color);
		// // Create an image from text (custom sprite font)
		[CLink]
		public static extern Image ImageTextEx(Font font, char8* text, float fontSize, float spacing, Color tint);
		// // Convert image to POT (power-of-two)
		[CLink]
		public static extern void ImageToPOT(Image* image, Color fillColor);
		// // Convert image data to desired format
		[CLink]
		public static extern void ImageFormat(Image* image, int newFormat);
		// // Apply alpha mask to image
		[CLink]
		public static extern void ImageAlphaMask(Image* image, Image alphaMask);
		// // Clear alpha channel to desired color
		[CLink]
		public static extern void ImageAlphaClear(Image* image, Color color, float threshold);
		// // Crop image depending on alpha value
		[CLink]
		public static extern void ImageAlphaCrop(Image* image, float threshold);
		// // Premultiply alpha channel
		[CLink]
		public static extern void ImageAlphaPremultiply(Image* image);
		// // Crop an image to a defined rectangle
		[CLink]
		public static extern void ImageCrop(Image* image, Rectangle crop);
		// // Resize image (Bicubic scaling algorithm)
		[CLink]
		public static extern void ImageResize(Image* image, int newWidth, int newHeight);
		// // Resize image (Nearest-Neighbor scaling algorithm)
		[CLink]
		public static extern void ImageResizeNN(Image* image, int newWidth, int newHeight);
		// // Resize canvas and fill with color
		[CLink]
		public static extern void ImageResizeCanvas(Image* image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);
		// // Generate all mipmap levels for a provided image
		[CLink]
		public static extern void ImageMipmaps(Image* image);
		// // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
		[CLink]
		public static extern void ImageDither(Image* image, int rBpp, int gBpp, int bBpp, int aBpp);
		// // Flip image vertically
		[CLink]
		public static extern void ImageFlipVertical(Image* image);
		// // Flip image horizontally
		[CLink]
		public static extern void ImageFlipHorizontal(Image* image);
		// // Rotate image clockwise 90deg
		[CLink]
		public static extern void ImageRotateCW(Image* image);
		// // Rotate image counter-clockwise 90deg
		[CLink]
		public static extern void ImageRotateCCW(Image* image);
		// // Modify image color: tint
		[CLink]
		public static extern void ImageColorTint(Image* image, Color color);
		// // Modify image color: invert
		[CLink]
		public static extern void ImageColorInvert(Image* image);
		// // Modify image color: grayscale
		[CLink]
		public static extern void ImageColorGrayscale(Image* image);
		// // Modify image color: contrast (-100 to 100)
		[CLink]
		public static extern void ImageColorContrast(Image* image, float contrast);
		// // Modify image color: brightness (-255 to 255)
		[CLink]
		public static extern void ImageColorBrightness(Image* image, int brightness);
		// // Modify image color: replace color
		[CLink]
		public static extern void ImageColorReplace(Image* image, Color color, Color replace);
		// // Extract color palette from image to maximum size (memory should be freed) IntPtr refers to a Color *
		[CLink]
		public static extern Color* ImageExtractPalette(Image image, int maxPaletteSize, int* extractCount);
		// // Get image alpha border rectangle
		[CLink]
		public static extern Rectangle GetImageAlphaBorder(Image image, float threshold);


		// // Image drawing functions NOTE: Image software-rendering functions (CPU)
		// Clear image background with given color
		[CLink]
		public static extern void ImageClearBackground(Image* dst, Color color);
		// // Draw pixel within an image
		[CLink]
		public static extern void ImageDrawPixel(Image* dst, int posX, int posY, Color color);
		// // Draw pixel within an image (Vector version)
		[CLink]
		public static extern void ImageDrawPixelV(Image* dst, Vector2 position, Color color);
		// // Draw line within an image
		[CLink]
		public static extern void ImageDrawLine(Image* dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color);
		// // Draw line within an image (Vector version)
		[CLink]
		public static extern void ImageDrawLineV(Image* dst, Vector2 start, Vector2 end, Color color);
		// // Draw circle within an image
		[CLink]
		public static extern void ImageDrawCircle(Image* dst, int centerX, int centerY, int radius, Color color);
		// // Draw circle within an image (Vector version)
		[CLink]
		public static extern void ImageDrawCircleV(Image* dst, Vector2 center, int radius, Color color);
		// // Draw rectangle within an image
		[CLink]
		public static extern void ImageDrawRectangle(Image* dst, int posX, int posY, int width, int height, Color color);
		// // Draw rectangle within an image (Vector version)
		[CLink]
		public static extern void ImageDrawRectangleV(Image* dst, Vector2 position, Vector2 size, Color color);
		// // Draw rectangle within an image
		[CLink]
		public static extern void ImageDrawRectangleRec(Image* dst, Rectangle rec, Color color);
		// // Draw rectangle lines within an image
		[CLink]
		public static extern void ImageDrawRectangleLines(Image* dst, Rectangle rec, int thick, Color color);
		// // Draw a source image within a destination image (tint applied to source)
		[CLink]
		public static extern void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
		// // Draw text (default font) within an image (destination)
		[CLink]
		public static extern void ImageDrawText(Image* dst, Vector2 position, char8* text, int fontSize, Color color);
		// // Draw text (custom sprite font) within an image (destination)
		[CLink]
		public static extern void ImageDrawTextEx(Image* dst, Vector2 position, Font font, char8* text, float fontSize, float spacing, Color color);
		// // Draw a source image within a destination image (tint applied to source)
		[CLink]
		public static extern void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec);


		// // Texture loading functions NOTE: These functions require GPU access
		// Load texture from file into GPU memory (VRAM)
		[CLink]
		public static extern Texture2D LoadTexture(char8* fileName);
		// // Load texture from image data
		[CLink]
		public static extern Texture2D LoadTextureFromImage(Image image);
		// // Load cubemap from image, multiple image cubemap layouts supported
		[CLink]
		public static extern Texture2D LoadTextureCubemap(Image image, CubemapLayoutType layoutType);
		// // Load texture for rendering (framebuffer)
		[CLink]
		public static extern RenderTexture2D LoadRenderTexture(int width, int height);
		// // Unload texture from GPU memory (VRAM)
		[CLink]
		public static extern void UnloadTexture(Texture2D texture);
		// // Unload render texture from GPU memory (VRAM)
		[CLink]
		public static extern void UnloadRenderTexture(RenderTexture2D target);
		// // Update GPU texture with new data pixels refers to a const void *
		[CLink]
		public static extern void UpdateTexture(Texture2D texture, void* pixels);
		// // Get pixel data from GPU texture and return an Image
		[CLink]
		public static extern Image GetTextureData(Texture2D texture);
		// // Get pixel data from screen buffer and return an Image (screenshot)
		[CLink]
		public static extern Image GetScreenData();


		// // Texture configuration functions
		// Generate GPU mipmaps for a texture
		[CLink]
		public static extern void GenTextureMipmaps(Texture2D* texture);
		// // Set texture scaling filter mode
		[CLink]
		public static extern void SetTextureFilter(Texture2D texture, TextureFilterMode filterMode);
		// // Set texture wrapping mode
		[CLink]
		public static extern void SetTextureWrap(Texture2D texture, TextureWrapMode wrapMode);


		// // Texture drawing functions
		// Draw a Texture2D
		[CLink]
		public static extern void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
		// // Draw a Texture2D with position defined as Vector2
		[CLink]
		public static extern void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
		// // Draw a Texture2D with extended parameters
		[CLink]
		public static extern void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
		// // Draw a part of a texture defined by a rectangle
		[CLink]
		public static extern void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);
		// // Draw texture quad with tiling and offset parameters
		[CLink]
		public static extern void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
		// // Draw a part of a texture defined by a rectangle with 'pro' parameters
		[CLink]
		public static extern void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);
		// // Draws a texture (or part of it) that stretches or shrinks nicely
		[CLink]
		public static extern void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);


		// // Image/Texture misc functions
		// Get pixel data size in bytes (image or texture)
		[CLink]
		public static extern int GetPixelDataSize(int width, int height, int format);


		// //------------------------------------------------------------------------------------ Font Loading and Text
		// Drawing Functions (Module: text) 
		// ------------------------------------------------------------------------------------
		// Font loading/unloading functions
		// Get the default Font
		[CLink]
		public static extern Font GetFontDefault();
		// // Load font from file into GPU memory (VRAM)
		[CLink]
		public static extern Font LoadFont(char8* fileName);
		// // Load font from file with extended parameters
		[CLink]
		public static extern Font LoadFontEx(char8* fileName, int fontSize, int* fontChars, int charsCount);
		// // Load font from Image (XNA style)
		[CLink]
		public static extern Font LoadFontFromImage(Image image, Color key, int firstChar);
		// // Load font data for further use
		[CLink]
		public static extern CharInfo* LoadFontData(char8* fileName, int fontSize, int* fontChars, int charsCount, FontType type);
		// // Generate image font atlas using chars info
		[CLink]
		public static extern Image GenImageFontAtlas(CharInfo* chars, Rectangle** recs, int charsCount, int fontSize, int padding, int packMethod);
		// // Unload Font from GPU memory (VRAM)
		[CLink]
		public static extern void UnloadFont(Font font);


		// // Text drawing functions
		// Shows current FPS
		[CLink]
		public static extern void DrawFPS(int posX, int posY);
		// // Draw text (using default font)
		[CLink]
		public static extern void DrawText(char8 *text, int posX, int posY, int fontSize, Color color);
		// // Draw text using font and additional parameters
		[CLink]
		public static extern void DrawTextEx(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);
		// // Draw text using font inside rectangle limits
		[CLink]
		public static extern void DrawTextRec(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);
		// // Draw text using font inside rectangle limits with support for text selection
		[CLink]
		public static extern void DrawTextRecEx(Font font, char8* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint, int selectStart, int selectLength, Color selectText, Color selectBack);
		// // Draw one character (codepoint)
		[CLink]
		public static extern void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float scale, Color tint);


		// // Text misc. functions
		// Measure string width for default font
		[CLink]
		public static extern int MeasureText(char8* text, int fontSize);
		// // Measure string size for Font
		[CLink]
		public static extern Vector2 MeasureTextEx(Font font, char8* text, float fontSize, float spacing);
		// // Get index position for a unicode character on font
		[CLink]										  
		public static extern int GetGlyphIndex(Font font, int character);
		// // Text strings management functions NOTE: Some strings allocate memory internally for returned strings, just
		// be careful!
		// Check if two text string are equal
		[CLink]
		public static extern bool TextIsEqual(char8* text1, char8* text2);
		// // Get text length, checks for '\0' ending
		[CLink]
		public static extern uint TextLength(char8* text);
		// // Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern uint TextCountCodepoints(char8* text);
		// // Text formatting with variables (sprintf style)
		[CLink]
		public static extern char8* TextFormat(char8* text);
		// // Get a piece of a text string
		[CLink]
		public static extern char8* TextSubtext(char8* text, int position, int length);
		// // Replace text char8*(memory should be freed!)
		[CLink]
		public static extern char8* TextReplace(char8* text, char8* replace, char8* by);
		// // Insert text in a position (memory should be freed!)
		[CLink]
		public static extern char8* TextInsert(char8* text, char8* insert, int position);
		// // Join text strings with delimiter
		[CLink]
		public static extern char8* TextJoin(char8** textList, int count, char8* delimiter);
		// // Split text into multiple strings
		[CLink]
		public static extern char8** TextSplit(char8* text, char8 delimiter, int* count);
		// // Append text at specific position and move cursor!
		[CLink]
		public static extern void TextAppend(char8* text, char8* @append, int* position);
		// // Find first text occurrence within a string
		[CLink]
		public static extern int TextFindIndex(char8* text, char8* find);
		// // Get upper case version of provided string
		[CLink]
		public static extern char8* TextToUpper(char8* text);
		// // Get lower case version of provided string
		[CLink]
		public static extern char8* TextToLower(char8* text);
		// // Get Pascal case notation version of provided string
		[CLink]
		public static extern char8* TextToPascal(char8* text);
		// // Get integer value from text (negative values not supported)
		[CLink]
		public static extern int TextToInteger(char8* text);
		// // Get total number of characters (codepoints) in a UTF8 encoded string
		[CLink]
		public static extern char8* TextToUtf8(char8* text, int length);


		// // UTF8 text strings management functions
		// Returns next codepoint in a UTF8 encoded string
		[CLink]
		public static extern int* GetCodepoints(char8* text, int* count);
		// // Get all codepoints in a string, codepoints count returned by parameters
		[CLink]
		public static extern int GetCodepointsCount(char8* text);
		// // Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
		[CLink]
		public static extern int GetNextCodepoint(char8* text, int* bytesProcessed);
		// // Encode codepoint into utf8 text (char array length returned as parameter)
		[CLink]
		public static extern char8* CodepointToUtf8(char8* text, int* byteLength);


		// //------------------------------------------------------------------------------------ Basic 3d Shapes
		// Drawing Functions (Module: models) 
		// ------------------------------------------------------------------------------------
		// Basic geometric 3D shapes drawing functions
		// Draw a line in 3D world space
		[CLink]
		public static extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
		// // Draw a point in 3D space, actually a small line
		[CLink]
		public static extern void DrawPoint3D(Vector3 position, Color color);
		// // Draw a circle in 3D world space
		[CLink]
		public static extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
		// // Draw cube
		[CLink]
		public static extern void DrawCube(Vector3 position, float width, float height, float length, Color color);
		// // Draw cube (Vector version)
		[CLink]
		public static extern void DrawCubeV(Vector3 position, Vector3 size, Color color);
		// // Draw cube wires
		[CLink]
		public static extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
		// // Draw cube wires (Vector version)
		[CLink]
		public static extern void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
		// // Draw cube textured
		[CLink]
		public static extern void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
		// // Draw sphere
		[CLink]
		public static extern void DrawSphere(Vector3 centerPos, float radius, Color color);
		// // Draw sphere with extended parameters
		[CLink]
		public static extern void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
		// // Draw sphere wires
		[CLink]
		public static extern void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
		// // Draw a cylinder/cone
		[CLink]
		public static extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
		// // Draw a cylinder/cone wires
		[CLink]
		public static extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
		// // Draw a plane XZ
		[CLink]
		public static extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
		// // Draw a ray line
		[CLink]
		public static extern void DrawRay(Ray ray, Color color);
		// // Draw a grid (centered at (0, 0, 0))
		[CLink]
		public static extern void DrawGrid(int slices, float spacing);
		// // Draw simple gizmo
		[CLink]
		public static extern void DrawGizmo(Vector3 position);


		// //------------------------------------------------------------------------------------ Model 3d Loading and
		// Drawing Functions (Module: models) 
		// ------------------------------------------------------------------------------------
		// Model loading/unloading functions
		// Load model from files (meshes and materials)
		[CLink]
		public static extern Model LoadModel(char8* fileName);
		// // Load model from generated mesh (default material)
		[CLink]
		public static extern Model LoadModelFromMesh(Mesh mesh);
		// // Unload model from memory (RAM and/or VRAM)
		[CLink]
		public static extern void UnloadModel(Model model);


		// // Mesh loading/unloading functions
		// Load meshes from model file
		[CLink]
		public static extern Mesh* LoadMeshes(char8* fileName, int* meshCount);
		// // Export mesh data to file
		[CLink]
		public static extern void ExportMesh(Mesh mesh, char8* fileName);
		// // Unload mesh from memory (RAM and/or VRAM)
		[CLink]
		public static extern void UnloadMesh(Mesh mesh);



		// // Material loading/unloading functions
		// Load materials from model file
		[CLink]
		public static extern Material* LoadMaterials(char8* fileName, int* materialCount);
		// // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
		[CLink]
		public static extern Material LoadMaterialDefault();
		// // Unload material from GPU memory (VRAM)
		[CLink]
		public static extern void UnloadMaterial(Material material);
		// // Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
		[CLink]
		public static extern void SetMaterialTexture(Material* material, int mapType, Texture2D texture);
		// // Set material for a mesh
		[CLink]
		public static extern void SetModelMeshMaterial(Model* model, int meshId, int materialId);



		// // Model animations loading/unloading functions
		// Load model animations from file
		// IntPtr refers to ModelAnimation *
		[CLink]
		public static extern ModelAnimation* LoadModelAnimations(char8* fileName, int* animsCount);
		// // Update model animation pose
		[CLink]
		public static extern void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);
		// // Unload animation data
		[CLink]
		public static extern void UnloadModelAnimation(ModelAnimation anim);
		// // Check model animation skeleton match
		[CLink]
		public static extern bool IsModelAnimationValid(Model model, ModelAnimation anim);



		// // Mesh generation functions
		// Generate polygonal mesh
		[CLink]
		public static extern Mesh GenMeshPoly(int sides, float radius);
		// // Generate plane mesh (with subdivisions)
		[CLink]
		public static extern Mesh GenMeshPlane(float width, float length, int resX, int resZ);
		// // Generate cuboid mesh
		[CLink]
		public static extern Mesh GenMeshCube(float width, float height, float length);
		// // Generate sphere mesh (standard sphere)
		[CLink]
		public static extern Mesh GenMeshSphere(float radius, int rings, int slices);
		// // Generate half-sphere mesh (no bottom cap)
		[CLink]
		public static extern Mesh GenMeshHemiSphere(float radius, int rings, int slices);
		// // Generate cylinder mesh
		[CLink]
		public static extern Mesh GenMeshCylinder(float radius, float height, int slices);
		// // Generate torus mesh
		[CLink]
		public static extern Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);
		// // Generate trefoil knot mesh
		[CLink]
		public static extern Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);
		// // Generate heightmap mesh from image data
		[CLink]
		public static extern Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
		// // Generate cubes-based map mesh from image data
		[CLink]
		public static extern Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


		// // Mesh manipulation functions
		// Compute mesh bounding box limits
		[CLink]
		public static extern BoundingBox MeshBoundingBox(Mesh mesh);
		// // Compute mesh tangents
		[CLink]
		public static extern void MeshTangents(Mesh* mesh);
		// // Compute mesh binormals
		[CLink]
		public static extern void MeshBinormals(Mesh* mesh);


		// // Model drawing functions
		// Draw a model (with texture if set)
		[CLink]
		public static extern void DrawModel(Model model, Vector3 position, float scale, Color tint);
		// // Draw a model with extended parameters
		[CLink]
		public static extern void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
		// // Draw a model wires (with texture if set)
		[CLink]
		public static extern void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
		// // Draw a model wires (with texture if set) with extended parameters
		[CLink]
		public static extern void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
		// // Draw bounding box (wires)
		[CLink]
		public static extern void DrawBoundingBox(BoundingBox @box, Color color);
		// // Draw a billboard texture
		[CLink]
		public static extern void DrawBillboard(Camera3D camera, Texture2D texture, Vector3 center, float size, Color tint);
		// // Draw a billboard texture defined by sourceRec
		[CLink]
		public static extern void DrawBillboardRec(Camera3D camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);


		// // Collision detection functions
		// Detect collision between two spheres
		[CLink]
		public static extern bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);
		// // Detect collision between two bounding boxes
		[CLink]
		public static extern bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
		// // Detect collision between box and sphere
		[CLink]
		public static extern bool CheckCollisionBoxSphere(BoundingBox @box, Vector3 centerSphere, float radiusSphere);
		// // Detect collision between ray and sphere
		[CLink]
		public static extern bool CheckCollisionRaySphere(Ray ray, Vector3 spherePosition, float sphereRadius);
		// // Detect collision between ray and sphere, returns collision point
		[CLink]
		public static extern bool CheckCollisionRaySphereEx(Ray ray, Vector3 spherePosition, float sphereRadius, Vector3* collisionPoint);
		// // Detect collision between ray and box
		[CLink]
		public static extern bool CheckCollisionRayBox(Ray ray, BoundingBox @box);
		// // Get collision info between ray and model
		[CLink]
		public static extern RayHitInfo GetCollisionRayModel(Ray ray, Model model);
		// // Get collision info between ray and triangle
		[CLink]
		public static extern RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
		// // Get collision info between ray and ground plane (Y-normal plane)
		[CLink]
		public static extern RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);


		// //------------------------------------------------------------------------------------ Shaders System
		// Functions (Module: rlgl) NOTE: This functions are useless when using OpenGL 1.1 
		// ------------------------------------------------------------------------------------
		// Shader loading/unloading functions
		// Load shader from files and bind default locations
		[CLink]
		public static extern Shader LoadShader(char8* vsFileName, char8* fsFileName);
		// // Load shader from code strings and bind default locations
		[CLink]
		public static extern Shader LoadShaderCode(char8* vsCode, char8* fsCode);
		// // Unload shader from GPU memory (VRAM)
		[CLink]
		public static extern void UnloadShader(Shader shader);
		// // Get default shader
		[CLink]
		public static extern Shader GetShaderDefault();
		// // Get default texture
		[CLink]
		public static extern Texture2D GetTextureDefault();
		// // Get texture to draw shapes
		[CLink]
		public static extern Texture2D GetShapesTexture();
		// // Get texture rectangle to draw shapes
		[CLink]
		public static extern Rectangle GetShapesTextureRec();
		// // Define default texture used to draw shapes
		[CLink]
		public static extern void SetShapesTexture(Texture2D texture, Rectangle source);


		// // Shader configuration functions
		// Get shader uniform location
		[CLink]
		public static extern int GetShaderLocation(Shader shader, char8* uniformName);
		// // Set shader uniform value value refers to a const void *
		[CLink]
		public static extern void SetShaderValue(Shader shader, int uniformLoc, void* value, ShaderUniformDataType uniformType);
		// // Set shader uniform value value refers to a const void *
		[CLink]
		public static extern void SetShaderValue(Shader shader, int uniformLoc, int* value, ShaderUniformDataType uniformType);
		// // Set shader uniform value value refers to a const void *
		[CLink]
		public static extern void SetShaderValue(Shader shader, int uniformLoc, float* value, ShaderUniformDataType uniformType);
		// // Set shader uniform value vector value refers to a const void *
		[CLink]
		public static extern void SetShaderValueV(Shader shader, int uniformLoc, void* value, ShaderUniformDataType uniformType, int count);
		// // Set shader uniform value (matrix 4x4)
		[CLink]
		public static extern void SetShaderValueMatrix(Shader shader, int uniformLoc, Matrix mat);
		// // Set shader uniform value for texture
		[CLink]
		public static extern void SetShaderValueTexture(Shader shader, int uniformLoc, Texture2D texture);
		// // Set a custom projection matrix (replaces internal projection matrix)
		[CLink]
		public static extern void SetMatrixProjection(Matrix proj);
		// // Set a custom modelview matrix (replaces internal modelview matrix)
		[CLink]
		public static extern void SetMatrixModelview(Matrix view);
		// // Get internal modelview matrix
		[CLink]
		public static extern Matrix GetMatrixModelview();
		// // Get internal projection matrix
		[CLink]
		public static extern Matrix GetMatrixProjection();


		// // Texture maps generation (PBR) NOTE: Required shaders should be provided
		// Generate cubemap texture from HDR texture
		[CLink]
		public static extern Texture2D GenTextureCubemap(Shader shader, Texture2D skyHDR, int size);
		// // Generate irradiance texture using cubemap data
		[CLink]
		public static extern Texture2D GenTextureIrradiance(Shader shader, Texture2D cubemap, int size);
		// // Generate prefilter texture using cubemap data
		[CLink]
		public static extern Texture2D GenTexturePrefilter(Shader shader, Texture2D cubemap, int size);
		// // Generate BRDF texture
		[CLink]
		public static extern Texture2D GenTextureBRDF(Shader shader, int size);


		// // Shading begin/end functions
		// Begin custom shader drawing
		[CLink]
		public static extern void BeginShaderMode(Shader shader);
		// // End custom shader drawing (use default shader)
		[CLink]
		public static extern void EndShaderMode();
		// // Begin blending mode (alpha, additive, multiplied)
		[CLink]
		public static extern void BeginBlendMode(BlendMode mode);
		// // End blending mode (reset to default: alpha blending)
		[CLink]
		public static extern void EndBlendMode();


		// // VR control functions
		// Init VR simulator for selected device parameters
		[CLink]
		public static extern void InitVrSimulator();
		// // Close VR simulator for current device
		[CLink]
		public static extern void CloseVrSimulator();
		// // Update VR tracking (position and orientation) and camera
		[CLink]
		public static extern void UpdateVrTracking(Camera3D* camera);
		// // Set stereo rendering configuration parameters
		[CLink]
		public static extern void SetVrConfiguration(VrDeviceInfo info, Shader distortion);
		// // Detect if VR simulator is ready
		[CLink]
		public static extern bool IsVrSimulatorReady();
		// // Enable/Disable VR experience
		[CLink]
		public static extern void ToggleVrMode();
		// // Begin VR simulator stereo rendering
		[CLink]
		public static extern void BeginVrDrawing();
		// // End VR simulator stereo rendering
		[CLink]
		public static extern void EndVrDrawing();


		// //------------------------------------------------------------------------------------ Audio Loading and
		// Playing Functions (Module: audio) 
		// ------------------------------------------------------------------------------------

		// Audio device management functions
		// Initialize audio device and context
		[CLink]
		public static extern void InitAudioDevice();
		// // Close the audio device and context
		[CLink]
		public static extern void CloseAudioDevice();
		// // Check if audio device has been initialized successfully
		[CLink]
		public static extern bool IsAudioDeviceReady();
		// // Set master volume (listener)
		[CLink]
		public static extern void SetMasterVolume(float volume);


		// // Wave/Sound loading/unloading functions
		// Load wave data from file
		[CLink]
		public static extern Wave LoadWave(char8* fileName);
		// // Load wave data from raw array data data refers to a void *
		/*[ CLink]
		public static extern Wave LoadWaveEx(IntPtr data, int sampleCount, int sampleRate, int sampleSize, int
		channels);*/
		// // Load sound from file
		[CLink]
		public static extern Sound LoadSound(char8* fileName);
		// // Load sound from wave data
		[CLink]
		public static extern Sound LoadSoundFromWave(Wave wave);
		// // Update sound buffer with new data data refers to a const void *
		[CLink]
		public static extern void UpdateSound(Sound sound, void* data, int samplesCount);
		// // Unload wave data
		[CLink]
		public static extern void UnloadWave(Wave wave);
		// // Unload sound
		[CLink]
		public static extern void UnloadSound(Sound sound);
		// // Export wave data to file
		[CLink]
		public static extern void ExportWave(Wave wave, char8* fileName);
		// // Export wave sample data to code (.h)
		[CLink]
		public static extern void ExportWaveAsCode(Wave wave, char8* fileName);


		// // Wave/Sound management functions
		// Play a sound
		[CLink]
		public static extern void PlaySound(Sound sound);
		// // Stop playing a sound
		[CLink]
		public static extern void StopSound(Sound sound);
		// // Pause a sound
		[CLink]
		public static extern void PauseSound(Sound sound);
		// // Resume a paused sound
		[CLink]
		public static extern void ResumeSound(Sound sound);
		// // Play a sound (using multichannel buffer pool)
		[CLink]
		public static extern void PlaySoundMulti(Sound sound);
		// // Stop any sound playing (using multichannel buffer pool)
		[CLink]
		public static extern void StopSoundMulti();
		// // Get number of sounds playing in the multichannel
		[CLink]
		public static extern int GetSoundsPlaying();
		// // Check if a sound is currently playing
		[CLink]
		public static extern bool IsSoundPlaying(Sound sound);
		// // Set volume for a sound (1.0 is max level)
		[CLink]
		public static extern void SetSoundVolume(Sound sound, float volume);
		// // Set pitch for a sound (1.0 is base level)
		[CLink]
		public static extern void SetSoundPitch(Sound sound, float pitch);
		// // Convert wave data to desired format
		[CLink]
		public static extern void WaveFormat(Wave* wave, int sampleRate, int sampleSize, int channels);
		// // Copy a wave to a new wave
		[CLink]
		public static extern Wave WaveCopy(Wave wave);
		// // Crop a wave to defined samples range
		[CLink]
		public static extern void WaveCrop(Wave* wave, int initSample, int finalSample);
		// // Get samples data from wave as a floats array
		[CLink]
		public static extern float* GetWaveData(Wave wave);


		// // Music management functions
		// Load music stream from file
		[CLink]
		public static extern Music LoadMusicStream(char8* fileName);
		// // Unload music stream
		[CLink]
		public static extern void UnloadMusicStream(Music music);
		// // Start music playing
		[CLink]
		public static extern void PlayMusicStream(Music music);
		// // Updates buffers for music streaming
		[CLink]
		public static extern void UpdateMusicStream(Music music);
		// // Stop music playing
		[CLink]
		public static extern void StopMusicStream(Music music);
		// // Pause music playing
		[CLink]
		public static extern void PauseMusicStream(Music music);
		// // Resume playing paused music
		[CLink]
		public static extern void ResumeMusicStream(Music music);
		// // Check if music is playing
		[CLink]
		public static extern bool IsMusicPlaying(Music music);
		// // Set volume for music (1.0 is max level)
		[CLink]
		public static extern void SetMusicVolume(Music music, float volume);
		// // Set pitch for a music (1.0 is base level)
		[CLink]
		public static extern void SetMusicPitch(Music music, float pitch);
		// // Set music loop count (loop repeats)
		[CLink]
		public static extern void SetMusicLoopCount(Music music, int count);
		// // Get music time length (in seconds)
		[CLink]
		public static extern float GetMusicTimeLength(Music music);
		// // Get current music time played (in seconds)
		[CLink]
		public static extern float GetMusicTimePlayed(Music music);


		// // AudioStream management functions
		// Init audio stream (to stream raw audio pcm data)
		[CLink]
		public static extern AudioStream InitAudioStream(uint sampleRate, uint sampleSize, uint channels);
		// // Update audio stream buffers with data data refers to a const void *
		[CLink]
		public static extern void UpdateAudioStream(AudioStream stream, void* data, int samplesCount);
		// // Close audio stream and free memory
		[CLink]
		public static extern void CloseAudioStream(AudioStream stream);
		// // Check if any audio stream buffers requires refill
		[CLink]
		public static extern bool IsAudioStreamProcessed(AudioStream stream);
		// // Play audio stream
		[CLink]
		public static extern void PlayAudioStream(AudioStream stream);
		// // Pause audio stream
		[CLink]
		public static extern void PauseAudioStream(AudioStream stream);
		// // Resume audio stream
		[CLink]
		public static extern void ResumeAudioStream(AudioStream stream);
		// // Check if audio stream is playing
		[CLink]
		public static extern bool IsAudioStreamPlaying(AudioStream stream);
		// // Stop audio stream
		[CLink]
		public static extern void StopAudioStream(AudioStream stream);
		// // Set volume for audio stream (1.0 is max level)
		[CLink]
		public static extern void SetAudioStreamVolume(AudioStream stream, float volume);
		// // Set pitch for audio stream (1.0 is base level)
		[CLink]
		public static extern void SetAudioStreamPitch(AudioStream stream, float pitch);

	}
}
