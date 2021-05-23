using System;
using raylib_beef.Types;
using System.Interop;
using raylib_beef.Enums;
namespace raylib_beef
{
	extension Raylib
	{
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

		[CLink]
		/// Begin scissor mode (define screen area for following drawing)
		public static extern void BeginScissorMode(c_int x, c_int y, c_int width, c_int height);

		[CLink]
		/// End scissor mode
		public static extern void EndScissorMode();

		[CLink]
		/// Begin stereo rendering
		public static extern void BeginVrStereoMode(VrStereoConfig config);                          // Begin stereo rendering

		[CLink]
		/// End stereo rendering
		public static extern void EndVrStereoMode();                                             // End stereo rendering
	}
}
