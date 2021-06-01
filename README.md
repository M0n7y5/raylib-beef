# Raylib-Beef

<img align="left" src="https://github.com/M0n7y5/raylib-beef/raw/master/img/raylib-beef-logo.png" width="256px">

**raylib-beef** is a Beef wrapper library for **Raylib 3.7**, a simple and easy-to-use library. In combination with benefits of Beef programming language, making games is pure satisfaction!

> **Attention!** This binding is still in development. Bugs may occur.
	You can download this library with binaries from [Release page](https://github.com/M0n7y5/raylib-beef/releases)!

> **OS Support** is limited only for Windows right now. I am able test this library only on Windows at this moment.  

<br>
<br>

---

## What is done
- Bindings for:
    - raylib.h
    - raymath.h 
    - rlgl.h (partly)
	- Easings.h

## Important notes
- there are no bindings for text manipulating methods
	- Beef already has custom methods for text manupulation
-  rlgl bindings are **partly done**
- dynamic linking is not implemented, will be added later

## TODO:
- Rewrite examples to Beef
- finish rlgl.h bindings

# Quick Start *(using Beef IDE)*
1. **Download** raylib-beef and copy it here: **C:\Program Files\BeefLang\BeefLibs**
2. Right-click on your workspace and select **Add from Installed** and choose raylib-beef

![](img/from-installed.png)

3. **Make** raylib-beef **as a dependency** of your project 

![](img/add-deps.png)

4. **Set** your project **build properties** like this:

![](img/build-settings.png)

5. Write some code:
```csharp
using System;
using static raylib_beef.Raylib;

namespace YOUR_NAMESPACE_HERE
{
	class Program
	{
		public static int Main(String[] args)
		{
			let text = "Hello from Beef! Hope you have a good day!";

			SetConfigFlags(.FLAG_WINDOW_RESIZABLE);
			InitWindow(800, 600, "Hello world");
			SetTargetFPS(60);

			while (!WindowShouldClose())
			{
				BeginDrawing();

				ClearBackground(.(52, 52, 52, 255));

				var x = (GetScreenWidth() / 2) - (MeasureText(text, 35) / 2);
				var y = GetScreenHeight() / 2;

				DrawText(text, x, y, 35, .LIGHTGRAY);

				EndDrawing();
			}

			CloseWindow();
			return 0;
		}
	}
}
```
6. Profit!

<center>

![](img/screen.png)

</center>

## Provided libraries are compiled with these flags
```cmake
Commandline options:
-DSUPPORT_FILEFORMAT_JPG:BOOL="1" 
-DGLFW_USE_HYBRID_HPG:BOOL="1" 
-DSUPPORT_FILEFORMAT_FLAC:BOOL="1" 
-DCUSTOMIZE_BUILD:BOOL="1" 
-DBUILD_EXAMPLES:BOOL="0" 
-DSUPPORT_FILEFORMAT_GIF:BOOL="1" 
-DSUPPORT_FILEFORMAT_TGA:BOOL="1" 

Cache file:
SUPPORT_FILEFORMAT_JPG:BOOL=1
GLFW_USE_HYBRID_HPG:BOOL=1
SUPPORT_FILEFORMAT_FLAC:BOOL=1
CUSTOMIZE_BUILD:BOOL=1
BUILD_EXAMPLES:BOOL=0
SUPPORT_FILEFORMAT_GIF:BOOL=1
SUPPORT_FILEFORMAT_TGA:BOOL=1
```

# More Info
- More info about **raylib** (https://github.com/raysan5/raylib)
- More info about **BeefLang** (https://www.beeflang.org)

# Contribution

I'll be glad for any contribution & pull requests

## Notes
- any other contributions than bugfixes needs to be placed to `src/Extensions`
	- this will separate additional helper functions from bindings 
	- for example if you want to add some cool method for **Vector3**, you will create **Vector3.&#xfeff;bf** in `src/Extensions/Types` and add that cool method to existing Vector3 type by using [extensions](https://www.beeflang.org/docs/language-guide/datatypes/extensions/) statement
