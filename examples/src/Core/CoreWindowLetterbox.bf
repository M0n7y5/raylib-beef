/*******************************************************************************************
*
*   raylib [core] example - window scale letterbox (and virtual mouse)
*
*   This example has been created using raylib 2.5 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Example contributed by Anata (@anatagawa) and reviewed by Ramon Santamaria (@raysan5)
*
*   Copyright (c) 2019 Anata (@anatagawa) and Ramon Santamaria (@raysan5)
*
********************************************************************************************/
using raylib_beef.Types;
using System;

namespace raylib_beef.examples.Core
{
	class WindowLetterbox : Raylib
	{
		//#define max(a, b) ((a)>(b)? (a) : (b))
		//#define min(a, b) ((a)<(b)? (a) : (b))

		// Clamp Vector2 value with min and max and return a new vector2
		// NOTE: Required for virtual mouse, to clamp inside virtual game size
		static Vector2 ClampValue(Vector2 value, Vector2 min, Vector2 max)
		{
			Vector2 result = value;
			result.x = (result.x > max.x) ? max.x : result.x;
			result.x = (result.x < min.x) ? min.x : result.x;
			result.y = (result.y > max.y) ? max.y : result.y;
			result.y = (result.y < min.y) ? min.y : result.y;
			return result;
		}

		public static void Main()
		{
			let windowWidth = 800;
			let windowHeight = 450;

			// Enable config flags for resizable window and vertical synchro
			SetConfigFlags(.FLAG_WINDOW_RESIZABLE | .FLAG_VSYNC_HINT);
			InitWindow(windowWidth, windowHeight, "raylib [core] example - window scale letterbox");
			SetWindowMinSize(320, 240);

			let gameScreenWidth = 640;
			let gameScreenHeight = 480;

			// Render texture initialization, used to hold the rendering result so we can easily resize it
			RenderTexture2D target = LoadRenderTexture(gameScreenWidth, gameScreenHeight);
			SetTextureFilter(target.texture, .TEXTURE_FILTER_BILINEAR);// Texture scale filter to use

			Color[10] colors = ?;
			for (int i < 10)
			{
				colors[i] = Color((uint8)GetRandomValue(100, 250), (uint8)GetRandomValue(50, 150), (uint8)GetRandomValue(10, 100), 255);
			}

			SetTargetFPS(60);// Set our game to run at 60 frames-per-second

			// Main game loop
			while (!WindowShouldClose())// Detect window close button or ESC key
			{
				// Update
				// Compute required framebuffer scaling
				float scale = Math.Min((float)GetScreenWidth() / gameScreenWidth, (float)GetScreenHeight() / gameScreenHeight);

				if (IsKeyPressed(.KEY_SPACE))
				{
					// Recalculate random colors for the bars
					for (int i = 0; i < 10; i++) colors[i] = Color((uint8)GetRandomValue(100, 250), (uint8)GetRandomValue(50, 150), (uint8)GetRandomValue(10, 100), 255);
				}

				// Update virtual mouse (clamped mouse value behind game screen)
				Vector2 mouse = GetMousePosition();
				Vector2 virtualMouse = ?;
				virtualMouse.x = (mouse.x - (GetScreenWidth() - (gameScreenWidth * scale)) * 0.5f) / scale;
				virtualMouse.y = (mouse.y - (GetScreenHeight() - (gameScreenHeight * scale)) * 0.5f) / scale;
				virtualMouse = ClampValue(virtualMouse, Vector2(0, 0), Vector2(gameScreenWidth, gameScreenHeight));

				// Draw
				BeginDrawing();
				ClearBackground(.BLACK);

					// Draw everything in the render texture, note this will not be rendered on screen, yet
				BeginTextureMode(target);

				ClearBackground(.RAYWHITE);// Clear render texture background color

				for (int i = 0; i < 10; i++) DrawRectangle(0, (int32)((gameScreenHeight / 10) * i), gameScreenWidth, gameScreenHeight / 10, colors[i]);

				DrawText("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, .WHITE);
				DrawText(scope $"Default Mouse: [{(int)mouse.x} , {(int)mouse.y}]", 350, 25, 20, .GREEN);
				DrawText(scope $"Virtual Mouse: [{(int)virtualMouse.x} , {(int)virtualMouse.y}]", 350, 55, 20, .YELLOW);

				EndTextureMode();

					// Draw RenderTexture2D to window, properly scaled
				DrawTexturePro(target.texture, Rectangle(0.0f, 0.0f, (float)target.texture.width, (float) - target.texture.height),
					Rectangle((float)((GetScreenWidth() - (gameScreenWidth * scale)) * 0.5), (float)((GetScreenHeight() - gameScreenHeight * scale) * 0.5),
					(float)gameScreenWidth * scale, (float)gameScreenHeight * scale), Vector2(0, 0), 0.0f, .WHITE);

				EndDrawing();
			}

			// De-Initialization
			UnloadRenderTexture(target);// Unload render texture

			CloseWindow();// Close window and OpenGL context
		}
	}
}
