using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct PhysicsManifoldData
	{
		public uint32 id;// Reference unique identifier
		public PhysicsBodyData* bodyA;// Manifold first physics body reference
		public PhysicsBodyData* bodyB;// Manifold second physics body reference
		public float penetration;// Depth of penetration from collision
		public Vector2 normal;// Normal direction vector from 'a' to 'b'
		public Vector2[2] contacts;// Points of contact during collision
		public uint16 contactsCount;// Current collision number of contacts
		public float restitution;// Mixed restitution during collision
		public float dynamicFriction;// Mixed dynamic friction during collision
		public float staticFriction;// Mixed static friction during collision
	}
}
