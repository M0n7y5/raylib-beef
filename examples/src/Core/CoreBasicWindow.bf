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
