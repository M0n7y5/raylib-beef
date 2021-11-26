/*******************************************************************************************
*
*   raylib [core] example - Initialize 3d camera free
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
	class Camera3dFree : Raylib
	{
		public static void Main()
		{
			// Initialization
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera free");

			// Define the camera to look into our 3d world
			var camera = Camera3D();
			camera.position = Vector3(10.0f, 10.0f, 10.0f);// Camera position
			camera.target = Vector3(0.0f, 0.0f, 0.0f);// Camera looking at point
			camera.up = Vector3(0.0f, 1.0f, 0.0f);// Camera up vector (rotation towards target)
			camera.fovy = 45.0f;// Camera field-of-view Y
			camera.projection = .CAMERA_PERSPECTIVE;// Camera mode type

			Vector3 cubePosition = .(0.0f, 0.0f, 0.0f);

			SetCameraMode(camera, .CAMERA_FREE);// Set a free camera mode

			SetTargetFPS(60);// Set our game to run at 60 frames-per-second

			// Main game loop
			while (!WindowShouldClose())// Detect window close button or ESC key
			{
				// Update
				UpdateCamera(&camera);// Update camera

				if (IsKeyDown(.KEY_Z)) camera.target = Vector3(0.0f, 0.0f, 0.0f);

				// Draw
				BeginDrawing();

				ClearBackground(.RAYWHITE);

				BeginMode3D(camera);

				DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, .RED);
				DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, .MAROON);

				DrawGrid(10, 1.0f);

				EndMode3D();

				DrawRectangle(10, 10, 320, 133, .SKYBLUE);
				DrawRectangleLines(10, 10, 320, 133, .BLUE);

				DrawText("Free camera default controls:", 20, 20, 10, .BLACK);
				DrawText("- Mouse Wheel to Zoom in-out", 40, 40, 10, .DARKGRAY);
				DrawText("- Mouse Wheel Pressed to Pan", 40, 60, 10, .DARKGRAY);
				DrawText("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10, .DARKGRAY);
				DrawText("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100, 10, .DARKGRAY);
				DrawText("- Z to zoom to (0, 0, 0)", 40, 120, 10, .DARKGRAY);

				EndDrawing();
			}

			// De-Initialization
			CloseWindow();// Close window and OpenGL context
		}
	}
}
