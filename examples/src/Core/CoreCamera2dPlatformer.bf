/*******************************************************************************************
*
*   raylib [core] example - 2d camera platformer
*
*   This example has been created using raylib 2.5 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Example contributed by arvyy (@arvyy) and reviewed by Ramon Santamaria (@raysan5)
*
*   Copyright (c) 2019 arvyy (@arvyy)
*
********************************************************************************************/

using System;
using System.Collections;
using raylib_beef.Types;

namespace raylib_beef.examples.Core
{
	class Camera2dPlatformer : Raylib
	{
		static Camera2D camera;
		static float evenOutTarget = 0;
		static bool eveningOut = false;

		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - 2d camera platformer");
			defer CloseWindow();

			var player = Player() { position = Vector2(400, 280), speed = 0, canJump = false };

			var envItems = new List<EnvItem>()
				{
					EnvItem() { rect = .(0, 0, 1000, 400), blocking = false, color = .LIGHTGRAY },
					EnvItem() { rect = .(0, 400, 1000, 200), blocking = true, color = .GRAY },
					EnvItem() { rect = .(300, 200, 400, 10), blocking = true, color = .GRAY },
					EnvItem() { rect = .(250, 300, 100, 10), blocking = true, color = .GRAY },
					EnvItem() { rect = .(650, 300, 100, 10), blocking = true, color = .GRAY }
				};
			defer delete envItems;


			camera.target = player.position;
			camera.offset = Vector2(screenWidth / 2, screenHeight / 2);
			camera.rotation = 0.0f;
			camera.zoom = 1.0f;

			// Store pointers to the multiple update camera functions
			var cameraOption = 0;
			function void(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)[?] cameraUpdaters = .(
				=> UpdateCameraCenter,
				=> UpdateCameraCenterInsideMap,
				=> UpdateCameraCenterSmoothFollow,
				=> UpdateCameraEvenOutOnLanding,
				=> UpdateCameraPlayerBoundsPush
				);
			var cameraFunctionPtr = cameraUpdaters[cameraOption];

			String[] cameraDescriptions = new .(
				"Follow player center",
				"Follow player center, but clamp to map edges",
				"Follow player center; smoothed",
				"Follow player center horizontally; updateplayer center vertically after landing",
				"Player push camera on getting too close to screen edge"
				);
			defer delete cameraDescriptions;

			SetTargetFPS(60);

			while (!WindowShouldClose())
			{
				Update:
				{
					var deltaTime = GetFrameTime();
					player.Update(envItems, deltaTime);

					camera.zoom += GetMouseWheelMove() * 0.05f;

					if (camera.zoom > 3.0) camera.zoom = 3.0f;
					else if (camera.zoom < 0.25) camera.zoom = 0.25f;

					if (IsKeyPressed(.KEY_R))
					{
						camera.zoom = 1.0f;
						player.position = Vector2(400, 280);
					}

					if (IsKeyPressed(.KEY_C))
					{
						cameraOption = (cameraOption + 1) % cameraUpdaters.Count;
						cameraFunctionPtr = cameraUpdaters[cameraOption];
					}
					cameraFunctionPtr(player, envItems, deltaTime, screenWidth, screenHeight);
				}


				Draw:
				{
					BeginDrawing();
					defer EndDrawing();

					ClearBackground(.LIGHTGRAY);

					BeginMode2D(camera);

					for (let ei in envItems)
					{
						DrawRectangleRec(ei.rect, ei.color);
					}
					let playerRect = Rectangle(player.position.x - 20, player.position.y - 40, 40, 40);
					DrawRectangleRec(playerRect, .RED);

					EndMode2D();

					DrawText("Controls:", 20, 20, 10, .BLACK);
					DrawText("- Right/Left to move", 40, 40, 10, .DARKGRAY);
					DrawText("- Space to jump", 40, 60, 10, .DARKGRAY);
					DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom", 40, 80, 10, .DARKGRAY);
					DrawText("- C to change camera mode", 40, 100, 10, .DARKGRAY);
					DrawText("Current camera mode:", 20, 120, 10, .BLACK);
					DrawText(cameraDescriptions[cameraOption].CStr(), 40, 140, 10, .DARKGRAY);
				}
			}
		}

		public static void UpdateCameraCenter(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)
		{
			camera.offset = Vector2(width / 2, height / 2);
			camera.target = player.position;
		}

		public static void UpdateCameraCenterInsideMap(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)
		{
			camera.offset = Vector2(width / 2, height / 2);
			camera.target = player.position;

			float minX = 1000, minY = 1000, maxX = -1000, maxY = -1000;
			for (let ei in envItems)
			{
				minX = Math.Min(ei.rect.x, minX);
				maxX = Math.Max(ei.rect.x + ei.rect.width, maxX);
				minY = Math.Min(ei.rect.y, minY);
				maxY = Math.Max(ei.rect.y + ei.rect.height, maxY);
			}

			Vector2 max = GetWorldToScreen2D(.(maxX, maxY), camera);
			Vector2 min = GetWorldToScreen2D(.(minX, minY), camera);

			if (max.x < width) camera.offset.x = width - (max.x - width / 2);
			if (max.y < height) camera.offset.y = height - (max.y - height / 2);
			if (min.x > 0) camera.offset.x = width / 2 - min.x;
			if (max.y > 0) camera.offset.y = height / 2 - min.y;
		}

		public static void UpdateCameraCenterSmoothFollow(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)
		{
			let minSpeed = 30f;
			let minEffectLength = 10f;
			let fractionSpeed = 0.8f;

			camera.offset = Vector2(width / 2, height / 2);
			let diff = player.position - camera.target;
			let length = diff.Length();

			if (length > minEffectLength)
			{
				let speed = Math.Max(fractionSpeed * length, minSpeed);
				camera.target = camera.target + (diff * speed * deltaTime / length);
			}
		}

		public static void UpdateCameraEvenOutOnLanding(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)
		{
			let evenOutSpeed = 700f;

			camera.offset = Vector2(width / 2, height / 2);
			camera.target.x = player.position.x;

			if (eveningOut)
			{
				if (evenOutTarget > camera.target.y)
				{
					camera.target.y += evenOutSpeed * deltaTime;

					if (camera.target.y > evenOutTarget)
					{
						camera.target.y = evenOutTarget;
						eveningOut = false;
					}
				}
				else
				{
					camera.target.y -= evenOutSpeed * deltaTime;

					if (camera.target.y < evenOutTarget)
					{
						camera.target.y = evenOutTarget;
						eveningOut = false;
					}
				}
			}
			else
			{
				if (player.canJump && (player.speed == 0) && (player.position.y != camera.target.y))
				{
					eveningOut = true;
					evenOutTarget = player.position.y;
				}
			}
		}

		public static void UpdateCameraPlayerBoundsPush(Player player, List<EnvItem> envItems, float deltaTime, int width, int height)
		{
			let bbox = Vector2(0.2f);

			Vector2 bboxWorldMin = GetScreenToWorld2D(.((1 - bbox.x) * 0.5f * width, (1 - bbox.y) * 0.5f * height), camera);
			Vector2 bboxWorldMax = GetScreenToWorld2D(.((1 + bbox.x) * 0.5f * width, (1 + bbox.y) * 0.5f * height), camera);
			camera.offset = Vector2((1 - bbox.x) * 0.5f * width, (1 - bbox.y) * 0.5f * height);

			if (player.position.x < bboxWorldMin.x) camera.target.x = player.position.x;
			if (player.position.y < bboxWorldMin.y) camera.target.y = player.position.y;
			if (player.position.x > bboxWorldMax.x) camera.target.x = bboxWorldMin.x + (player.position.x - bboxWorldMax.x);
			if (player.position.y > bboxWorldMax.y) camera.target.y = bboxWorldMin.y + (player.position.y - bboxWorldMax.y);
		}
	}

	struct Player
	{
		public Vector2 position;
		public float speed;
		public bool canJump;

		let G = 400;
		let PlayerJumpSpd = 350.0f;
		let PlayerHorSpd = 200.0f;

		public void Update(List<EnvItem> envItems, float delta) mut
		{
			if (Raylib.IsKeyDown(.KEY_LEFT)) this.position.x -= PlayerHorSpd * delta;
			if (Raylib.IsKeyDown(.KEY_RIGHT)) this.position.x += PlayerHorSpd * delta;
			if (Raylib.IsKeyDown(.KEY_SPACE) && this.canJump)
			{
				this.speed = -PlayerJumpSpd;
				this.canJump = false;
			}

			bool hitObstacle = false;
			for (let ei in envItems)
			{
				Vector2 p = this.position;
				if (ei.blocking &&
					ei.rect.x <= p.x &&
					ei.rect.x + ei.rect.width >= p.x &&
					ei.rect.y >= p.y &&
					ei.rect.y < p.y + this.speed * delta)
				{
					hitObstacle = true;
					this.speed = 0.0f;
					p.y = ei.rect.y;
				}
			}

			if (!hitObstacle)
			{
				this.position.y += this.speed * delta;
				this.speed += G * delta;
				this.canJump = false;
			}
			else this.canJump = true;
		}
	}

	struct EnvItem
	{
		public Rectangle rect;
		public bool blocking;
		public Color color;
	}
}
