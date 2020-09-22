/*******************************************************************************************
*
*   raylib [core] example - Keyboard input
*
*   This example has been created using raylib 1.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2014 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

using raylib_beef.Types;

namespace raylib_beef.examples.Core
{
	class InputKeys : Raylib
	{
		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - keyboard input");
			defer CloseWindow();

			var ballPosition = scope Vector2(screenWidth/2, screenHeight/2);

			SetTargetFPS(60);

			while(!WindowShouldClose())
			{

				Update:
				{
					if (IsKeyDown(.KEY_RIGHT)) ballPosition.x += (float)2.0;
					if (IsKeyDown(.KEY_LEFT)) ballPosition.x -= (float)2.0;
					if (IsKeyDown(.KEY_UP)) ballPosition.y -= (float)2.0;
					if (IsKeyDown(.KEY_DOWN)) ballPosition.y += (float)2.0;
				}
				
				Draw:
				{
					BeginDrawing();
					defer EndDrawing();

					ClearBackground(.RAYWHITE);

					DrawText("move the ball with the cursor keys", 10, 10, 20, .DARKGRAY);

					DrawCircleV(*ballPosition, 50, .MAROON);
				}
			}
		}
		
	}
}
