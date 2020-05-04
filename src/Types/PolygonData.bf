using raylib_beef;
using System;

namespace raylib_beef.Types
{
	[CRepr]
	public struct PolygonData
	{
		public uint16 vertexCount;// Current used vertex and normals count
		public Vector2[Physac.PHYSAC_MAX_VERTICES] positions;// Polygon vertex positions vectors
		public Vector2[Physac.PHYSAC_MAX_VERTICES] normals;// Polygon vertex normals vectors
	}
}
