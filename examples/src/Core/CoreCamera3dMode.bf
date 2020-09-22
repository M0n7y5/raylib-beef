/*******************************************************************************************
*
*   raylib [core] example - Initialize 3d camera mode
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
	class Camera3dMode : Raylib
	{
		public static void Main()
		{
			// Initialization
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera mode");

			// Define the camera to look into our 3d world
			var camera = Camera3D();
			camera.position = Vector3(0.0f, 10.0f, 10.0f);// Camera position
			camera.target = Vector3(0.0f, 0.0f, 0.0f);// Camera looking at point
			camera.up = Vector3(0.0f, 1.0f, 0.0f);// Camera up vector (rotation towards target)
			camera.fovy = 45.0f;// Camera field-of-view Y
			camera.projection = .CAMERA_PERSPECTIVE;// Camera mode type

			Vector3 cubePosition = .(0.0f, 0.0f, 0.0f);

			SetTargetFPS(60);// Set our game to run at 60 frames-per-second
			

			// Main game loop
			while (!WindowShouldClose())// Detect window close button or ESC key
			{
				// Draw
				BeginDrawing();

				ClearBackground(.RAYWHITE);

				BeginMode3D(camera);

				DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, .RED);
				DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, .MAROON);

				DrawGrid(10, 1.0f);

				EndMode3D();

				DrawText("Welcome to the third dimension!", 10, 40, 20, .DARKGRAY);

				DrawFPS(10, 10);

				EndDrawing();
			}

			// De-Initialization
			CloseWindow();// Close window and OpenGL context
		}
	}
}
