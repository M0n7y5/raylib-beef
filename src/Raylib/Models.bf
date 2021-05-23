using System;
using raylib_beef.Types;
using System.Interop;
namespace raylib_beef
{
	extension Raylib
	{
		// Basic geometric 3D shapes drawing functions
		[CLink]
		/// Draw a line in 3D world space
		public static extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);

		[CLink]
		/// Draw a point in 3D space, actually a small line
		public static extern void DrawPoint3D(Vector3 position, Color color);

		[CLink]
		/// Draw a circle in 3D world space
		public static extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);

		[CLink]
		/// Draw a color-filled triangle (vertex in counter-clockwise order!)
		public static extern void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);

		[CLink]
		/// Draw a triangle strip defined by points
		public static extern void DrawTriangleStrip3D(Vector3* points, int pointsCount, Color color);

		[CLink]
		/// Draw cube
		public static extern void DrawCube(Vector3 position, float width, float height, float length, Color color);

		[CLink]
		/// Draw cube (Vector version)
		public static extern void DrawCubeV(Vector3 position, Vector3 size, Color color);

		[CLink]
		/// Draw cube wires
		public static extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);

		[CLink]
		/// Draw cube wires (Vector version)
		public static extern void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);

		[CLink]
		/// Draw cube textured
		public static extern void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);

		[CLink]
		/// Draw sphere
		public static extern void DrawSphere(Vector3 centerPos, float radius, Color color);

		[CLink]
		/// Draw sphere with extended parameters
		public static extern void DrawSphereEx(Vector3 centerPos, float radius, c_int rings, c_int slices, Color color);

		[CLink]
		/// Draw sphere wires
		public static extern void DrawSphereWires(Vector3 centerPos, float radius, c_int rings, c_int slices, Color color);

		[CLink]
		/// Draw a cylinder/cone
		public static extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, c_int slices, Color color);

		[CLink]
		/// Draw a cylinder/cone wires
		public static extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, c_int slices, Color color);

		[CLink]
		/// Draw a plane XZ
		public static extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);

		[CLink]
		/// Draw a ray line
		public static extern void DrawRay(Ray ray, Color color);

		[CLink]
		/// Draw a grid (centered at (0, 0, 0))
		public static extern void DrawGrid(c_int slices, float spacing);


		// Model loading/unloading functions
		[CLink]
		/// Load model from files (meshes and materials)
		public static extern Model LoadModel(char8* fileName);

		[CLink]
		/// Load model from generated mesh (default material)
		public static extern Model LoadModelFromMesh(Mesh mesh);

		[CLink]
		/// Unload model from memory (RAM and/or VRAM)
		public static extern void UnloadModel(Model model);

		[CLink]
		/// Unload model (but not meshes) from memory (RAM and/or VRAM)
		public static extern void UnloadModelKeepMeshes(Model model);


		/// Mesh loading/unloading functions
		/*[CLink]
		/// Load meshes from model file
		public static extern Mesh* LoadMeshes(char8* fileName, c_int* meshCount);*/


		[CLink]
		/// Upload vertex data into GPU and provided VAO/VBO ids
		public static extern void UploadMesh(Mesh* mesh, bool dynamic);

		[CLink]
		/// Update mesh vertex data in GPU for a specific buffer index
		public static extern void UpdateMeshBuffer(Mesh mesh, c_int index, void* data, c_int dataSize, c_int offset);

		[CLink]
		/// Draw a 3d mesh with material and transform
		public static extern void DrawMesh(Mesh mesh, Material material, Matrix transform);

		[CLink]
		/// Draw multiple mesh instances with material and different transforms
		public static extern void DrawMeshInstanced(Mesh mesh, Material material, Matrix* transforms, int instances);

		[CLink]
		/// Unload mesh from memory (RAM and/or VRAM)
		public static extern void UnloadMesh(Mesh mesh);

		[CLink]
		/// Export mesh data to file
		public static extern void ExportMesh(Mesh mesh, char8* fileName);


		/// Material loading/unloading functions
		[CLink]
		/// Load materials from model file
		public static extern Material* LoadMaterials(char8* fileName, c_int* materialCount);

		[CLink]
		/// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
		public static extern Material LoadMaterialDefault();

		[CLink]
		/// Unload material from GPU memory (VRAM)
		public static extern void UnloadMaterial(Material material);

		[CLink]
		/// Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
		public static extern void SetMaterialTexture(Material* material, c_int mapType, Texture2D texture);

		[CLink]
		/// Set material for a mesh
		public static extern void SetModelMeshMaterial(Model* model, c_int meshId, c_int materialId);


		/// Model animations loading/unloading functions
		[CLink]
		/// Load model animations from file
		public static extern ModelAnimation* LoadModelAnimations(char8* fileName, c_int* animsCount);

		[CLink]
		/// Update model animation pose
		public static extern void UpdateModelAnimation(Model model, ModelAnimation anim, c_int frame);

		[CLink]
		/// Unload animation data
		public static extern void UnloadModelAnimation(ModelAnimation anim);

		[CLink]
		/// Unload animation array data
		public static extern void UnloadModelAnimations(ModelAnimation* animations, c_uint count);

		[CLink]
		/// Check model animation skeleton match
		public static extern bool IsModelAnimationValid(Model model, ModelAnimation anim);


		/// Mesh generation functions
		[CLink]
		/// Generate polygonal mesh
		public static extern Mesh GenMeshPoly(c_int sides, float radius);

		[CLink]
		/// Generate plane mesh (with subdivisions)
		public static extern Mesh GenMeshPlane(float width, float length, c_int resX, c_int resZ);

		[CLink]
		/// Generate cuboid mesh
		public static extern Mesh GenMeshCube(float width, float height, float length);

		[CLink]
		/// Generate sphere mesh (standard sphere)
		public static extern Mesh GenMeshSphere(float radius, c_int rings, c_int slices);

		[CLink]
		/// Generate half-sphere mesh (no bottom cap)
		public static extern Mesh GenMeshHemiSphere(float radius, c_int rings, c_int slices);

		[CLink]
		/// Generate cylinder mesh
		public static extern Mesh GenMeshCylinder(float radius, float height, c_int slices);

		[CLink]
		/// Generate torus mesh
		public static extern Mesh GenMeshTorus(float radius, float size, c_int radSeg, c_int sides);

		[CLink]
		/// Generate trefoil knot mesh
		public static extern Mesh GenMeshKnot(float radius, float size, c_int radSeg, c_int sides);

		[CLink]
		/// Generate heightmap mesh from image data
		public static extern Mesh GenMeshHeightmap(Image heightmap, Vector3 size);

		[CLink]
		/// Generate cubes-based map mesh from image data
		public static extern Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


		/// Mesh manipulation functions
		[CLink]
		/// Compute mesh bounding box limits
		public static extern BoundingBox MeshBoundingBox(Mesh mesh);

		[CLink]
		/// Compute mesh tangents
		public static extern void MeshTangents(Mesh* mesh);

		[CLink]
		/// Compute mesh binormals
		public static extern void MeshBinormals(Mesh* mesh);


		/// Model drawing functions
		[CLink]
		/// Draw a model (with texture if set)
		public static extern void DrawModel(Model model, Vector3 position, float scale, Color tint);

		[CLink]
		/// Draw a model with extended parameters
		public static extern void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

		[CLink]
		/// Draw a model wires (with texture if set)
		public static extern void DrawModelWires(Model model, Vector3 position, float scale, Color tint);

		[CLink]
		/// Draw a model wires (with texture if set) with extended parameters
		public static extern void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

		[CLink]
		/// Draw bounding box (wires)
		public static extern void DrawBoundingBox(BoundingBox @box, Color color);

		[CLink]
		/// Draw a billboard texture
		public static extern void DrawBillboard(Camera3D camera, Texture2D texture, Vector3 center, float size, Color tint);

		[CLink]
		/// Draw a billboard texture defined by sourceRec
		public static extern void DrawBillboardRec(Camera3D camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);


		/// Collision detection functions
		[CLink]
		/// Detect collision between two spheres
		public static extern bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);

		[CLink]
		/// Detect collision between two bounding boxes
		public static extern bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);

		[CLink]
		/// Detect collision between box and sphere
		public static extern bool CheckCollisionBoxSphere(BoundingBox @box, Vector3 centerSphere, float radiusSphere);

		[CLink]
		/// Detect collision between ray and sphere
		public static extern bool CheckCollisionRaySphere(Ray ray, Vector3 spherePosition, float sphereRadius);

		[CLink]
		/// Detect collision between ray and sphere, returns collision point
		public static extern bool CheckCollisionRaySphereEx(Ray ray, Vector3 spherePosition, float sphereRadius, Vector3* collisionPoint);

		[CLink]
		/// Detect collision between ray and box
		public static extern bool CheckCollisionRayBox(Ray ray, BoundingBox @box);

		[CLink]
		/// Get collision info between ray and model
		public static extern RayHitInfo GetCollisionRayModel(Ray ray, Model model);

		[CLink]
		/// Get collision info between ray and triangle
		public static extern RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);

		[CLink]
		/// Get collision info between ray and ground plane (Y-normal plane)
		public static extern RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);

	}
}
