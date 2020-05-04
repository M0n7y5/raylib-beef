using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Mesh
	{
		public int32 vertexCount;// Number of vertices stored in arrays
		public int32 triangleCount;// Number of triangles stored (indexed or not)

		// Default vertex data
		// vertices refers to a float *
		public float* vertices;// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
		// texcoords refers to a float *
		public float* texcoords;// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
		// texcoords2 refers to a float *
		public float* texcoords2;// Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)

		// normals refers to a float *
		public float* normals;// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)

		// tangents refers to a float *
		public float* tangents;// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)

		// colors refers to a unsigned char *
		public uint8* colors;// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)

		// indices refers to a unsigned short *
		public uint16* indices;// Vertex indices (in case vertex data comes indexed)

		// Animation vertex data
		// animVertices refers to a float *
		public float* animVertices;// Animated vertex positions (after bones transformations)

		// animNormals refers to a float *
		public float* animNormals;// Animated normals (after bones transformations)

		// vertices refers to a int *
		public int32* boneIds;// Vertex bone ids, up to 4 bones influence by vertex (skinning)

		// boneWeights refers to a float *
		public float* boneWeights;// Vertex bone weight, up to 4 bones influence by vertex (skinning)

		// OpenGL identifiers
		public uint32 vaoId;// OpenGL Vertex Array Object id

		// vboId refers to a uint[]
		public int32* vboId;// OpenGL Vertex Buffer Objects id (default vertex data)
	}
}
