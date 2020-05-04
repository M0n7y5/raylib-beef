![](img/raylib-beef-logo.png)
# Raylib-Beef
**raylib-beef** is a Beef wrapper library for **Raylib 3.0**, a simple and easy-to-use library. In combination with benefits of Beef programming language, making games is pure satisfaction!

> **Attention!** This binding is still in development. Bugs may occur.

## What is done
- Bindings for:
    - raylib.h
    - raymath.h
    - rlgl.h

## TODO:
- Make bindings for other header files:
    - easings.h
    - physac.h
    - raygui.h
- Rewrite examples to Beef
- Make higher abstraction for raylib-beef (RayApp)(??)


# Quick Start *(using Beef IDE)*
1. **Download** raylib-beef and copy it here: **C:\Program Files\BeefLang\BeefLibs**
2. Right-click on your workspace and select **Add from Installed** and choose raylib-beef
3. **Make** raylib-beef **as a dependency** of your project 
4. Write some code:
```csharp
using raylib_beef;
using System;

namespace NAMESPACE_OF_YOUR_PROJECT_HERE
{
	public static class Program : Raylib
	{
		public static void Main()
		{
			SetConfigFlags(.FLAG_WINDOW_RESIZABLE);
			SetTargetFPS(60);

			InitWindow(800, 600, "Hello world");

			let text = scope String("Hello from Beef! Hope you have good day!");

			while (!WindowShouldClose())
			{
				BeginDrawing();

				ClearBackground(.(52, 52, 52, 255));

				var x = (GetScreenWidth() / 2) - (MeasureText(text, 35) / 2);
				var y = GetScreenHeight() / 2;

				DrawText(text, x, y, 35, .LIGHTGRAY);

				EndDrawing();
			}
		}
	}
}
```
5. Profit!

## Tip & Tricks
1. You should make your workspace looks like this
```
Workspace-Folder\
    |__ Project1\ 
    |__ Project2\
    |__ Project3\
    |__ raylib-beef\
    |__ some-other-lib\
```

# More Info
- More info about **raylib** (https://github.com/raysan5/raylib)
- More info about **BeefLang** (https://www.beeflang.org)

# Contribution

I'll be glad for any contribution & pull requests