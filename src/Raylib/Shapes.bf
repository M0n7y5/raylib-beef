using System;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		[CLink]
		/// Set texture and rectangle to be used on shapes drawing
		/// NOTE: It can be useful when using basic shapes and one single font,
		/// defining a font char white rectangle would allow drawing everything in a single draw call
		public static extern void SetShapesTexture(Texture2D texture, Rectangle source);


		[CLink]
		/// Draw a pixel
		public static extern void DrawPixel(c_int posX, c_int posY, Color color);

		[CLink]
		/// Draw a pixel (Vector version)
		public static extern void DrawPixelV(Vector2 position, Color color);

		[CLink]
		/// Draw a line
		public static extern void DrawLine(c_int startPosX, c_int startPosY, c_int endPosX, c_int endPosY, Color color);

		[CLink]
		/// Draw a line (Vector version)
		public static extern void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);

		[CLink]
		/// Draw a line defining thickness
		public static extern void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);

		[CLink]
		/// Draw a line using cubic-bezier curves in-out
		public static extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);

		[CLink]
		/// Draw line using quadratic bezier curves with a control point
		public static extern void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color);

		[CLink]
		/// Draw lines sequence
		public static extern void DrawLineStrip(Vector2* points, c_uint numPoints, Color color);

		[CLink]
		/// Draw a color-filled circle
		public static extern void DrawCircle(c_int centerX, c_int centerY, float radius, Color color);

		[CLink]
		/// Draw a piece of a circle
		public static extern void DrawCircleSector(Vector2 center, float radius, c_int startAngle, c_int endAngle, c_int segments, Color color);

		[CLink]
		/// Draw circle sector outline
		public static extern void DrawCircleSectorLines(Vector2 center, float radius, c_int startAngle, c_int endAngle, c_int segments, Color color);

		[CLink]
		/// Draw a gradient-filled circle
		public static extern void DrawCircleGradient(c_int centerX, c_int centerY, float radius, Color color1, Color color2);

		[CLink]
		/// Draw a color-filled circle (Vector version)
		public static extern void DrawCircleV(Vector2 center, float radius, Color color);

		[CLink]
		/// Draw circle outline
		public static extern void DrawCircleLines(c_int centerX, c_int centerY, float radius, Color color);

		[CLink]
		/// Draw ellipse
		public static extern void DrawEllipse(c_int centerX, c_int centerY, float radiusH, float radiusV, Color color);

		[CLink]
		/// Draw ellipse outline
		public static extern void DrawEllipseLines(c_int centerX, c_int centerY, float radiusH, float radiusV, Color color);

		[CLink]
		/// Draw ring
		public static extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, c_int startAngle, c_int endAngle, c_int segments, Color color);

		[CLink]
		/// Draw ring outline
		public static extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, c_int startAngle, c_int endAngle, c_int segments, Color color);

		[CLink]
		/// Draw a color-filled rectangle
		public static extern void DrawRectangle(c_int posX, c_int posY, c_int width, c_int height, Color color);

		[CLink]
		/// Draw a color-filled rectangle (Vector version)
		public static extern void DrawRectangleV(Vector2 position, Vector2 size, Color color);

		[CLink]
		/// Draw a color-filled rectangle
		public static extern void DrawRectangleRec(Rectangle rec, Color color);

		[CLink]
		/// Draw a color-filled rectangle with pro parameters
		public static extern void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);

		[CLink]
		/// Draw a vertical-gradient-filled rectangle
		public static extern void DrawRectangleGradientV(c_int posX, c_int posY, c_int width, c_int height, Color color1, Color color2);

		[CLink]
		/// Draw a horizontal-gradient-filled rectangle
		public static extern void DrawRectangleGradientH(c_int posX, c_int posY, c_int width, c_int height, Color color1, Color color2);

		[CLink]
		/// Draw a gradient-filled rectangle with custom vertex colors
		public static extern void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);

		[CLink]
		/// Draw rectangle outline
		public static extern void DrawRectangleLines(c_int posX, c_int posY, c_int width, c_int height, Color color);

		[CLink]
		/// Draw rectangle outline with extended parameters
		public static extern void DrawRectangleLinesEx(Rectangle rec, c_int lineThick, Color color);

		[CLink]
		/// Draw rectangle with rounded edges
		public static extern void DrawRectangleRounded(Rectangle rec, float roundness, c_int segments, Color color);

		[CLink]
		/// Draw rectangle with rounded edges outline
		public static extern void DrawRectangleRoundedLines(Rectangle rec, float roundness, c_int segments, c_int lineThick, Color color);

		[CLink]
		/// Draw a color-filled triangle (vertex in counter-clockwise order!)
		public static extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

		[CLink]
		/// Draw triangle outline (vertex in counter-clockwise order!)
		public static extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

		[CLink]
		/// Draw a triangle fan defined by points (first vertex is the center)
		public static extern void DrawTriangleFan(Vector2* points, c_int numPoints, Color color);

		[CLink]
		/// Draw a triangle strip defined by points
		public static extern void DrawTriangleStrip(Vector2* points, c_int pointsCount, Color color);

		[CLink]
		/// Draw a regular polygon (Vector version)
		public static extern void DrawPoly(Vector2 center, c_int sides, float radius, float rotation, Color color);

		[CLink]
		/// Draw a polygon outline of n sides
		public static extern void DrawPolyLines(Vector2 center, c_int sides, float radius, float rotation, Color color);


		// Basic shapes collision detection functions --------------------------
		[CLink]
		/// Check collision between two rectangles
		public static extern bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);

		[CLink]
		/// Check collision between two circles
		public static extern bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);

		[CLink]
		/// Check collision between circle and rectangle
		public static extern bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);

		[CLink]
		/// Check if point is inside rectangle
		public static extern bool CheckCollisionPointRec(Vector2 point, Rectangle rec);

		[CLink]
		/// Check if point is inside circle
		public static extern bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);

		[CLink]
		/// Check if point is inside a triangle
		public static extern bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);

		[CLink]
		/// Check the collision between two lines defined by two points each, returns collision point by reference
		public static extern bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint);


		[CLink]
		/// Get collision rectangle for two rectangles collision
		public static extern Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);


	}
}
