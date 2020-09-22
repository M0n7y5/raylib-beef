using raylib_beef.Types;

namespace raylib_beef.examples.Core
{
	class InputMouse : Raylib
	{
		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - mouse input");
			defer CloseWindow();

			var ballPosition = scope Vector2(-100.0f, -100.0f);
			Color ballColor = .DARKBLUE;

			SetTargetFPS(60);

			while(!WindowShouldClose())
			{

				Update:
				{
					var mousePosition = GetMousePosition();
					ballPosition = &mousePosition;
					if (IsMouseButtonPressed(.MOUSE_LEFT_BUTTON)) ballColor = .MAROON;
					else if (IsMouseButtonPressed(.MOUSE_MIDDLE_BUTTON)) ballColor = .LIME;
					else if (IsMouseButtonPressed(.MOUSE_RIGHT_BUTTON)) ballColor = .DARKBLUE;
				}
				
				Draw:
				{
					BeginDrawing();
					defer EndDrawing();

					ClearBackground(.RAYWHITE);

					DrawCircleV(*ballPosition, 50, ballColor);

					DrawText("move the ball using the mouse and press mouse buttons to change color", 10, 10, 20, .DARKGRAY);
				}
			}
		}
	}
}
