using raylib_beef.Enums;
using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct PhysicsShape
	{
		public PhysicsShapeType type;// Physics shape type (circle or polygon)
		public PhysicsBodyData* body;// Shape physics body reference
		public float radius;// Circle shape radius (used for circle shapes)
		public Matrix2x2 transform;// Vertices transform matrix 2x2
		public PolygonData vertexData;// Polygon shape vertices position and normals data (just used for polygon shapes)
	}
}
