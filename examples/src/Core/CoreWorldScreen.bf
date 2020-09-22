/*******************************************************************************************
*
*   raylib [core] example - World to screen
*
*   This example has been created using raylib 1.3 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2015 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

using raylib_beef.Types;

namespace raylib_beef.examples.Core
{
	class WorldScreen : Raylib
	{
		public static void Main()
		{

			// Initialization
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera free");

			// Define the camera to look into our 3d world
			var camera = Camera3D();
			camera.position = Vector3(10.0f, 10.0f, 10.0f);
			camera.target = Vector3(0.0f, 0.0f, 0.0f);
			camera.up = Vector3(0.0f, 1.0f, 0.0f);
			camera.fovy = 45.0f;
			camera.projection = .CAMERA_PERSPECTIVE;

			Vector3 cubePosition = .(0.0f, 0.0f, 0.0f);
			Vector2 cubeScreenPosition = .(0.0f, 0.0f);

			SetCameraMode(camera, .CAMERA_FREE);// Set a free camera mode

			SetTargetFPS(60);// Set our game to run at 60 frames-per-second
	
			// Main game loop
			while (!WindowShouldClose())// Detect window close button or ESC key
			{
				// Update
				UpdateCamera(&camera);// Update camera
	
				// Calculate cube screen space position (with a little offset to be in top)
				cubeScreenPosition = GetWorldToScreen(Vector3(cubePosition.x, cubePosition.y + 2.5f, cubePosition.z), camera);

				// Draw
				BeginDrawing();

				ClearBackground(.RAYWHITE);

				BeginMode3D(camera);

				DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, .RED);
				DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, .MAROON);

				DrawGrid(10, 1.0f);

				EndMode3D();

				DrawText("Enemy: 100 / 100", (int32)(cubeScreenPosition.x - MeasureText("Enemy: 100/100", 20) / 2), (int32)cubeScreenPosition.y, 20, .BLACK);
				DrawText("Text is always on top of the cube", (int32)(screenWidth - MeasureText("Text is always on top of the cube", 20)) / 2, 25, 20, .GRAY);

				EndDrawing();
			}

			// De-Initialization
			CloseWindow();// Close window and OpenGL context
		}
	}
}
