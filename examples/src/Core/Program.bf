using raylib_beef.Types;
using System;

namespace raylib_beef.examples.Core
{
	struct Example : this(String name, function void() run, Rectangle rect = .(0, 0, 0, 0));

	class Program : Raylib
	{
		// utility to start any example
		public static void Main()
		{
			// Todo find out if there's a way to generate this via namespace inspection at comptime
			function void() fnptrBasicWindow = => BasicWindow.Main;
			function void() fnptrWindowLetterbox = => WindowLetterbox.Main;
			function void() fnptrCamera2d = => Camera2d.Main;
			function void() fnptrCamera2dPlatformer = => Camera2dPlatformer.Main;

			function void() fnptrCamera3dMode = => Camera3dMode.Main;
			function void() fnptrCamera3dFree = => Camera3dFree.Main;
			function void() fnptrCamera3dFistPerson = => Camera3dFirstPerson.Main;
			function void() fnptrPicking3D = => Picking3D.Main;

			function void() fnptrWorldScreen = => WorldScreen.Main;

			function void() fnptrInputKeys = => InputKeys.Main;
			function void() fnptrInputMouse = => InputMouse.Main;
			function void() fnptrInputMouseWheel = => InputMouseWheel.Main;
			function void() fnptrInputGamepad = => InputGamepad.Main;

			var examples = new Example[](
				.("BasicWindow", fnptrBasicWindow),
				.("WindowLetterbox", fnptrWindowLetterbox),
				.("Camera2d", fnptrCamera2d),
				.("Camera2dPlatformer", fnptrCamera2dPlatformer),

				.("Camera3dMode", fnptrCamera3dMode),
				.("Camera3dFree", fnptrCamera3dFree),
				.("Camera3dFistPerson", fnptrCamera3dFistPerson),
				.("Picking3D", fnptrPicking3D),

				.("WorldScreen", fnptrWorldScreen),

				.("InputKeys", fnptrInputKeys),
				.("InputMouse", fnptrInputMouse),
				.("InputMouseWheel", fnptrInputMouseWheel),
				.("InputGamepad", fnptrInputGamepad)
				);
			defer delete examples;

			while (true)
			{
				let iExample = OpenExampleSelectionWindow(ref examples);
				if (iExample == -1) break;
				System.Diagnostics.Debug.Assert(iExample < examples.Count);

				examples[iExample].run();
			}
		}

		// displays window for example selection
		// returns array index of example to be run or -1 to exit
		public static int32 OpenExampleSelectionWindow(ref Example[] examples)
		{
			let screenWidth = 800;
			let screenHeight = 600;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
			defer CloseWindow();

			SetTargetFPS(60);
			

			let widthBox = 150;
			let heightBox = 70;
			let minXList = 20;
			let maxXList = screenWidth - minXList;
			let minYList = 20;
			// let maxYList = screenHeight - heightBox;
			let spacingY = 5;
			let spacingX = 3;
			let availableWidth = maxXList - minXList;

			let numBoxesPerRow = (availableWidth - spacingX) / (widthBox + spacingX);
			let usedWidth = numBoxesPerRow * widthBox + ((numBoxesPerRow - 1) * spacingX);
			let xOffsetForCenteredLayout = (screenWidth - usedWidth) * 0.5;

			for (let i < examples.Count)
			{
				let row = (i / numBoxesPerRow);
				let column = i % numBoxesPerRow;
				let y = (int32)(minYList + row * (heightBox + spacingY));
				let x = (int32)(xOffsetForCenteredLayout + column * (widthBox + spacingX));
				examples[i].rect = .(x, y, widthBox, heightBox);
			}


			var ballPosition = Vector2(screenWidth / 2, screenHeight / 2);
			Color ballColor = .DARKBLUE;
			let ballRadius = 4;

			while (!WindowShouldClose())
			{
				// update
				var mousePosition = GetMousePosition();
				ballPosition = mousePosition;
				let isMouseButtonPressed = IsMouseButtonPressed(.MOUSE_LEFT_BUTTON);
				if (isMouseButtonPressed) ballColor = .MAROON;
				else ballColor = .DARKBLUE;

				// check if any example is clicked
				if (isMouseButtonPressed)
				{
					for (let i < examples.Count)
					{
						if (CheckCollisionPointRec(mousePosition, examples[i].rect))
						{
							return (int32)i;
						}
					}
				}

				// draw
				BeginDrawing();
				defer EndDrawing();

				ClearBackground(.RAYWHITE);

				DrawText("Choose an example to run", 190, 200, 20, .LIGHTGRAY);
				for (let example in examples)
				{
					let x = (int32)example.rect.x;
					let y = (int32)example.rect.y;
					DrawRectangleRec(example.rect, Color.SKYBLUE);
					DrawText(example.name.CStr(), x + 3, y + 3, 12, Color.BLACK);
				}

				DrawCircleV(ballPosition, ballRadius, ballColor);
			}
			return -1;
		}
	}
}
