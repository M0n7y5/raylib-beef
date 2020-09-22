/*******************************************************************************************
*
*   raylib [core] example - Basic window
*
*   Welcome to raylib!
*
*   To test examples, just press F6 and execute raylib_compile_execute script
*   Note that compiled executable is placed in the same folder as .c file
*
*   You can find all basic examples on C:\raylib\raylib\examples folder or
*   raylib official webpage: www.raylib.com
*
*   Enjoy using raylib. :)
*
*   This example has been created using raylib 1.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2013-2016 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

namespace raylib_beef.examples.Core
{
	class BasicWindow : Raylib
	{
		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 600;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
			defer CloseWindow();

			SetTargetFPS(60);

			while(!WindowShouldClose())
			{
				BeginDrawing();
				defer EndDrawing();

				ClearBackground(.RAYWHITE);

				DrawText("Congrats! You created your first window!", 190, 200, 20, .LIGHTGRAY);
			}
		}
	}
}
