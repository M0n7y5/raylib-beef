using raylib_beef.Types;
using System;
using System.Collections;

namespace raylib_beef.examples.Core
{
	class InputMouseWheel : Raylib
	{
		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - input mouse wheel");
			defer CloseWindow();

			int boxPositionY = screenHeight/2 - 40;
			let scrollSpeed = 4;

			SetTargetFPS(60);

			while(!WindowShouldClose())
			{

				Update:
				{
					boxPositionY -= (GetMouseWheelMove()*scrollSpeed);
				}
				
				Draw:
				{
					BeginDrawing();
					defer EndDrawing();

					ClearBackground(.RAYWHITE);

					DrawRectangle(screenWidth/2 - 40, boxPositionY, 80, 80, .MAROON);

					DrawText("Use the mouse wheel to move the cube up and down!", 10, 10, 20, .GRAY);

					var positionInfo = (scope String("")..AppendF("Box position Y: {}", boxPositionY));
					// TextFormat() seems not to do anything in Beef -> deleted
					DrawText(positionInfo.CStr(), 10, 40, 20, .LIGHTGRAY);
				}
			}
		}
	}
}
