using System;
using System.Interop;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Mesh
	{
		// Number of vertices stored in arrays
		public c_int vertexCount;
		// Number of triangles stored (indexed or not)
		public c_int triangleCount;

		// Default vertex data

		/// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
		public float* vertices;

		/// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
		public float* texcoords;

		/// Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
		public float* texcoords2;

		/// normals refers to a float *
		/// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
		public float* normals;

		/// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
		public float* tangents;

		/// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
		public uint8* colors;

		/// Vertex indices (in case vertex data comes indexed)
		public uint16* indices;

		/// Animation vertex data
		public float* animVertices;// Animated vertex positions (after bones transformations)

		/// Animated normals (after bones transformations)
		public float* animNormals;

		/// Vertex bone ids, up to 4 bones influence by vertex (skinning)
		public int32* boneIds;

		// Vertex bone weight, up to 4 bones influence by vertex (skinning)
		public float* boneWeights;

		/// OpenGL Vertex Array Object id
		public uint32 vaoId;

		/// OpenGL Vertex Buffer Objects id (default vertex data)
		public int32* vboId;
	}
}
