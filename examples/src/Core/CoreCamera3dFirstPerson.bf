/*******************************************************************************************
*
*   raylib [core] example - 3d camera first person
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
	class Camera3dFirstPerson : Raylib
	{
		public static void Main()
		{
			// Initialization
			let MaxColumns = 20;
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera first person");

			// Define the camera to look into our 3d world (position, target, up vector)
			var camera = Camera3D();
			camera.position = Vector3(4.0f, 2.0f, 4.0f);
			camera.target = Vector3(0.0f, 1.8f, 0.0f);
			camera.up = Vector3(0.0f, 1.0f, 0.0f);
			camera.fovy = 60.0f;
			camera.projection = .CAMERA_PERSPECTIVE;// Camera mode type

			// Generates some random columns
			float[MaxColumns] heights = .();
			Vector3[MaxColumns] positions = .();
			Color[MaxColumns] colors = .();

			for (int i < MaxColumns)
			{
				heights[i] = (float)GetRandomValue(1, 12);
				positions[i] = Vector3(GetRandomValue(-15, 15), heights[i] / 2, GetRandomValue(-15, 15));
				colors[i] = Color((uint8)GetRandomValue(20, 255), (uint8)GetRandomValue(10, 55), 30, 255);
			}

			SetCameraMode(camera, .CAMERA_FIRST_PERSON);// Set a first person camera mode

			SetTargetFPS(60);// Set our game to run at 60 frames-per-second

			// Main game loop
			while (!WindowShouldClose())// Detect window close button or ESC key
			{
				// Update
				UpdateCamera(&camera);// Update camera

				// Draw
				BeginDrawing();

				ClearBackground(.RAYWHITE);

				BeginMode3D(camera);

				DrawPlane(Vector3(0.0f, 0.0f, 0.0f), Vector2(32.0f, 32.0f), .LIGHTGRAY);// Draw ground
				DrawCube(Vector3(-16.0f, 2.5f, 0.0f), 1.0f, 5.0f, 32.0f, .BLUE);// Draw a blue wall
				DrawCube(Vector3(16.0f, 2.5f, 0.0f), 1.0f, 5.0f, 32.0f, .LIME);// Draw a green wall
				DrawCube(Vector3(0.0f, 2.5f, 16.0f), 32.0f, 5.0f, 1.0f, .GOLD);// Draw a yellow wall

				// Draw some cubes around
				for (int i < MaxColumns)
				{
					DrawCube(positions[i], 2.0f, heights[i], 2.0f, colors[i]);
					DrawCubeWires(positions[i], 2.0f, heights[i], 2.0f, .MAROON);
				}

				EndMode3D();

				DrawRectangle(10, 10, 220, 70, .SKYBLUE);
				DrawRectangleLines(10, 10, 220, 70, .BLUE);

				DrawText("First person camera default controls:", 20, 20, 10, .BLACK);
				DrawText("- Move with keys: W, A, S, D", 40, 40, 10, .DARKGRAY);
				DrawText("- Mouse move to look around", 40, 60, 10, .DARKGRAY);

				EndDrawing();
			}

			// De-Initialization
			CloseWindow();// Close window and OpenGL context
		}
	}
}
