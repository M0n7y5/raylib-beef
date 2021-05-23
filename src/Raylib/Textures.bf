using System;
using raylib_beef.Types;
using System.Interop;
using raylib_beef.Enums;
namespace raylib_beef
{
	extension Raylib
	{
		// Image loading functions
		// NOTE: This functions do not require GPU access
		[CLink]
		/// Load image from file into CPU memory (RAM)
		public static extern Image LoadImage(char8* fileName);

		[CLink]
		/// Load image from RAW file data
		public static extern Image LoadImageRaw(char8* fileName, c_int width, c_int height, c_int format, c_int headerSize);

		[CLink]
		/// Load image sequence from file (frames appended to image.data)
		public static extern Image LoadImageAnim(char8* fileName, int* frames);

		[CLink]
		/// Load image from memory buffer, fileType refers to extension: i.e. "png"
		public static extern Image LoadImageFromMemory(char8* fileType, uint8* fileData, c_int dataSize);

		[CLink]
		/// Unload image from CPU memory (RAM)
		public static extern void UnloadImage(Image image);

		[CLink]
		/// Export image data to file
		public static extern void ExportImage(Image image, char8* fileName);

		[CLink]
		/// Export image as code file defining an array of bytes
		public static extern void ExportImageAsCode(Image image, char8* fileName);


		/// Image generation functions
		[CLink]
		/// Generate image: plain color
		public static extern Image GenImageColor(c_int width, c_int height, Color color);

		[CLink]
		/// Generate image: vertical gradient
		public static extern Image GenImageGradientV(c_int width, c_int height, Color top, Color bottom);

		[CLink]
		/// Generate image: horizontal gradient
		public static extern Image GenImageGradientH(c_int width, c_int height, Color left, Color right);

		[CLink]
		/// Generate image: radial gradient
		public static extern Image GenImageGradientRadial(c_int width, c_int height, float density, Color inner, Color outer);

		[CLink]
		/// Generate image: checked
		public static extern Image GenImageChecked(c_int width, c_int height, c_int checksX, c_int checksY, Color col1, Color col2);

		[CLink]
		/// Generate image: white noise
		public static extern Image GenImageWhiteNoise(c_int width, c_int height, float factor);

		[CLink]
		/// Generate image: perlin noise
		public static extern Image GenImagePerlinNoise(c_int width, c_int height, c_int offsetX, c_int offsetY, float scale);

		[CLink]
		/// Generate image: cellular algorithm. Bigger tileSize means bigger cells
		public static extern Image GenImageCellular(c_int width, c_int height, c_int tileSize);



		/// Image manipulation functions
		[CLink]
		/// Create an image duplicate (useful for transformations)
		public static extern Image ImageCopy(Image image);

		[CLink]
		/// Create an image from another image piece
		public static extern Image ImageFromImage(Image image, Rectangle rec);

		[CLink]
		/// Create an image from text (default font)
		public static extern Image ImageText(char8* text, c_int fontSize, Color color);

		[CLink]
		/// Create an image from text (custom sprite font)
		public static extern Image ImageTextEx(Font font, char8* text, float fontSize, float spacing, Color tint);

		[CLink]
		/// Convert image data to desired format
		public static extern void ImageFormat(Image* image, c_int newFormat);

		[CLink]
		/// Convert image to POT (power-of-two)
		public static extern void ImageToPOT(Image* image, Color fillColor);
		
		[CLink]
		/// Crop an image to a defined rectangle
		public static extern void ImageCrop(Image* image, Rectangle crop);

		[CLink]
		/// Crop image depending on alpha value
		public static extern void ImageAlphaCrop(Image* image, float threshold);

		[CLink]
		/// Clear alpha channel to desired color
		public static extern void ImageAlphaClear(Image* image, Color color, float threshold);

		[CLink]
		/// Apply alpha mask to image
		public static extern void ImageAlphaMask(Image* image, Image alphaMask);

		[CLink]
		/// Premultiply alpha channel
		public static extern void ImageAlphaPremultiply(Image* image);

		[CLink]
		/// Resize image (Bicubic scaling algorithm)
		public static extern void ImageResize(Image* image, c_int newWidth, c_int newHeight);

		[CLink]
		/// Resize image (Nearest-Neighbor scaling algorithm)
		public static extern void ImageResizeNN(Image* image, c_int newWidth, c_int newHeight);

		[CLink]
		/// Resize canvas and fill with color
		public static extern void ImageResizeCanvas(Image* image, c_int newWidth, c_int newHeight, c_int offsetX, c_int offsetY, Color color);

		[CLink]
		/// Generate all mipmap levels for a provided image
		public static extern void ImageMipmaps(Image* image);

		[CLink]
		/// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
		public static extern void ImageDither(Image* image, c_int rBpp, c_int gBpp, c_int bBpp, c_int aBpp);

		[CLink]
		/// Flip image vertically
		public static extern void ImageFlipVertical(Image* image);

		[CLink]
		/// Flip image horizontally
		public static extern void ImageFlipHorizontal(Image* image);

		[CLink]
		/// Rotate image clockwise 90deg
		public static extern void ImageRotateCW(Image* image);

		[CLink]
		/// Rotate image counter-clockwise 90deg
		public static extern void ImageRotateCCW(Image* image);

		[CLink]
		/// Modify image color: tint
		public static extern void ImageColorTint(Image* image, Color color);

		[CLink]
		/// Modify image color: invert
		public static extern void ImageColorInvert(Image* image);

		[CLink]
		/// Modify image color: grayscale
		public static extern void ImageColorGrayscale(Image* image);

		[CLink]
		/// Modify image color: contrast (-100 to 100)
		public static extern void ImageColorContrast(Image* image, float contrast);

		[CLink]
		/// Modify image color: brightness (-255 to 255)
		public static extern void ImageColorBrightness(Image* image, c_int brightness);

		[CLink]
		/// Modify image color: replace color
		public static extern void ImageColorReplace(Image* image, Color color, Color replace);

		[CLink]
		/// Load color data from image as a Color array (RGBA - 32bit)
		public static extern Color *LoadImageColors(Image image);

		[CLink]
		/// LLoad colors palette from image as a Color array (RGBA - 32bit)
		public static extern Color *LoadImagePalette(Image image, c_int maxPaletteSize, c_int *colorsCount);   

		[CLink]
		/// Unload color data loaded with LoadImageColors()
		public static extern void UnloadImageColors(Color *colors);   

		[CLink]
		/// Unload colors palette loaded with LoadImagePalette()
		public static extern void UnloadImagePalette(Color *colors);   

		[CLink]
		/// Get image alpha border rectangle
		public static extern Rectangle GetImageAlphaBorder(Image image, float threshold);


		/// Image drawing functions NOTE: Image software-rendering functions (CPU)
		[CLink]
		/// Clear image background with given color
		public static extern void ImageClearBackground(Image* dst, Color color);

		[CLink]
		/// Draw pixel within an image
		public static extern void ImageDrawPixel(Image* dst, c_int posX, c_int posY, Color color);

		[CLink]
		/// Draw pixel within an image (Vector version)
		public static extern void ImageDrawPixelV(Image* dst, Vector2 position, Color color);

		[CLink]
		/// Draw line within an image
		public static extern void ImageDrawLine(Image* dst, c_int startPosX, c_int startPosY, c_int endPosX, c_int endPosY, Color color);

		[CLink]
		/// Draw line within an image (Vector version)
		public static extern void ImageDrawLineV(Image* dst, Vector2 start, Vector2 end, Color color);

		[CLink]
		/// Draw circle within an image
		public static extern void ImageDrawCircle(Image* dst, c_int centerX, c_int centerY, c_int radius, Color color);

		[CLink]
		/// Draw circle within an image (Vector version)
		public static extern void ImageDrawCircleV(Image* dst, Vector2 center, c_int radius, Color color);

		[CLink]
		/// Draw rectangle within an image
		public static extern void ImageDrawRectangle(Image* dst, c_int posX, c_int posY, c_int width, c_int height, Color color);

		[CLink]
		/// Draw rectangle within an image (Vector version)
		public static extern void ImageDrawRectangleV(Image* dst, Vector2 position, Vector2 size, Color color);

		[CLink]
		/// Draw rectangle within an image
		public static extern void ImageDrawRectangleRec(Image* dst, Rectangle rec, Color color);

		[CLink]
		/// Draw rectangle lines within an image
		public static extern void ImageDrawRectangleLines(Image* dst, Rectangle rec, c_int thick, Color color);

		[CLink]
		/// Draw a source image within a destination image (tint applied to source)
		public static extern void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);

		[CLink]
		/// Draw text (default font) within an image (destination)
		public static extern void ImageDrawText(Image* dst, Vector2 position, char8* text, c_int fontSize, Color color);

		[CLink]
		/// Draw text (custom sprite font) within an image (destination)
		public static extern void ImageDrawTextEx(Image* dst, Vector2 position, Font font, char8* text, float fontSize, float spacing, Color color);

		[CLink]
		/// Draw text (custom sprite font) within an image (destination)
		public static extern void ImageDrawTextEx(Image *dst, Font font, char8 *text, Vector2 position, float fontSize, float spacing, Color tint);


		// Texture loading functions NOTE: These functions require GPU access
		[CLink]
		/// Load texture from file into GPU memory (VRAM)
		public static extern Texture2D LoadTexture(char8* fileName);

		[CLink]
		/// Load texture from image data
		public static extern Texture2D LoadTextureFromImage(Image image);

		[CLink]
		/// Load cubemap from image, multiple image cubemap layouts supported
		public static extern TextureCubemap LoadTextureCubemap(Image image, CubemapLayout layoutType);

		[CLink]
		/// Load texture for rendering (framebuffer)
		public static extern RenderTexture2D LoadRenderTexture(c_int width, c_int height);

		[CLink]
		/// Unload texture from GPU memory (VRAM)
		public static extern void UnloadTexture(Texture2D texture);

		[CLink]
		/// Unload render texture from GPU memory (VRAM)
		public static extern void UnloadRenderTexture(RenderTexture2D target);

		[CLink]
		/// Update GPU texture with new data pixels refers to a const void *
		public static extern void UpdateTexture(Texture2D texture, void* pixels);

		[CLink]
		/// Update GPU texture rectangle with new data
		public static extern void UpdateTextureRec(Texture2D texture, Rectangle rec, void* pixels);

		[CLink]
		/// Get pixel data from GPU texture and return an Image
		public static extern Image GetTextureData(Texture2D texture);

		[CLink]
		/// Get pixel data from screen buffer and return an Image (screenshot)
		public static extern Image GetScreenData();


		/// Texture configuration functions
		[CLink]
		/// Generate GPU mipmaps for a texture
		public static extern void GenTextureMipmaps(Texture2D* texture);

		[CLink]
		/// Set texture scaling filter mode
		public static extern void SetTextureFilter(Texture2D texture, TextureFilter filterMode);

		[CLink]
		/// Set texture wrapping mode
		public static extern void SetTextureWrap(Texture2D texture, TextureWrap wrapMode);


		/// Texture drawing functions
		[CLink]
		/// Draw a Texture2D
		public static extern void DrawTexture(Texture2D texture, c_int posX, c_int posY, Color tint);

		[CLink]
		/// Draw a Texture2D with position defined as Vector2
		public static extern void DrawTextureV(Texture2D texture, Vector2 position, Color tint);

		[CLink]
		/// Draw a Texture2D with extended parameters
		public static extern void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);

		[CLink]
		/// Draw a part of a texture defined by a rectangle
		public static extern void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);

		[CLink]
		/// Draw texture quad with tiling and offset parameters
		public static extern void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);

		[CLink]
		/// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into destRec.
		public static extern void DrawTextureTiled(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, float scale, Color tint);

		[CLink]
		/// Draw a part of a texture defined by a rectangle with 'pro' parameters
		public static extern void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);

		[CLink]
		/// Draws a texture (or part of it) that stretches or shrinks nicely
		public static extern void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);

		[CLink]
		/// Draw a textured polygon
		public static extern void DrawTexturePoly(Texture2D texture, Vector2 center, Vector2 *points, Vector2 *texcoords, int pointsCount, Color tint);

		/// Color-related functions
		[CLink]
		/// Returns hexadecimal value for a Color
		public static extern c_int ColorToInt(Color color);

		[CLink]
		/// Returns color normalized as float [0..1]
		public static extern Vector4 ColorNormalize(Color color);

		[CLink]
		/// Returns color from normalized values [0..1]
		public static extern Color ColorFromNormalized(Vector4 normalized);

		[CLink]
		/// Returns HSV values for a Color
		public static extern Vector3 ColorToHSV(Color color);

		[CLink]
		/// Returns a Color from HSV values
		public static extern Color ColorFromHSV(Vector3 hsv);

		[CLink]
		/// Returns color with alpha applied, alpha goes from 0.0f to 1.0f
		public static extern Color ColorAlpha(Color color, float alpha);

		[CLink]
		/// Returns src alpha-blended into dst color with tint
		public static extern Color ColorAlphaBlend(Color dst, Color src, Color tint);

		[CLink]
		/// Returns a Color struct from hexadecimal value
		public static extern Color GetColor(c_int hexValue);

		[CLink]
		/// Get Color from a source pixel pointer of certain format
		public static extern Color GetPixelColor(void* srcPtr, int format);

		[CLink]
		/// Set color formatted into destination pixel pointer
		public static extern void SetPixelColor(void* dstPtr, Color color, int format);

		[CLink]
		/// Get pixel data size in bytes for certain format
		public static extern c_int GetPixelDataSize(int width, int height, int format);
	}
}
