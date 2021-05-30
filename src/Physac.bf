// Will raylib_beef removed soon _________


/*using System;
using System.Interop;
using raylib_beef.Types;
namespace raylib_beef
{
	public static class Physac
	{
		public const int PHYSAC_MAX_BODIES = 64;
		public const int PHYSAC_MAX_MANIFOLDS = 4096;
		public const int PHYSAC_MAX_VERTICES = 24;
		public const int PHYSAC_CIRCLE_VERTICES = 24;

		public const int PHYSAC_COLLISION_ITERATIONS = 100;
		public const float PHYSAC_PENETRATION_ALLOWANCE = 0.05f;
		public const float PHYSAC_PENETRATION_CORRECTION = 0.4f;

		// Initializes physics values, pointers and creates physics loop thread
		[CLink]
		public static extern void InitPhysics();

		// Run physics step, to be used if PHYSICS_NO_THREADS is set in your main loop
		[CLink]
		public static extern void RunPhysicsStep();

		// Sets physics fixed time step in milliseconds. 1.666666 by default
		[CLink]
		public static extern void SetPhysicsTimeStep(double delta);

		// Returns true if physics thread is currently enabled
		[CLink]
		public static extern bool IsPhysicsEnabled();

		// Sets physics global gravity force
		[CLink]
		public static extern void SetPhysicsGravity(float x, float y);

		// Creates a new circle physics body with generic parameters
		// IntPtr refers to a PhysicsBodyData *
		[CLink]
		public static extern PhysicsBodyData*  CreatePhysicsBodyCircle(Vector2 pos, float radius, float density);

		// Creates a new rectangle physics body with generic parameters
		// IntPtr refers to a PhysicsBodyData *
		[CLink]
		public static extern PhysicsBodyData* CreatePhysicsBodyRectangle(Vector2 pos, float width, float height, float density);

		// Creates a new polygon physics body with generic parameters
		// IntPtr refers to a PhysicsBodyData *
		[CLink]
		public static extern PhysicsBodyData* CreatePhysicsBodyPolygon(Vector2 pos, float radius, c_int sides, float density);

		// Adds a force to a physics body
		[CLink]
		public static extern void PhysicsAddForce(PhysicsBodyData* body, Vector2 force);

		// Adds an angular force to a physics body
		[CLink]
		public static extern void PhysicsAddTorque(PhysicsBodyData* body, float amount);

		// Shatters a polygon shape physics body to little physics bodies with explosion force
		[CLink]
		public static extern void PhysicsShatter(PhysicsBodyData* body, Vector2 position, float force);

		// Returns the current amount of created physics bodies
		[CLink]
		public static extern c_int GetPhysicsBodiesCount();

		// Returns a physics body of the bodies pool at a specific index
		// IntPtr refers to a PhysicsBodyData *
		[CLink]
		public static extern PhysicsBodyData* GetPhysicsBody(c_int index);

		// Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)
		[CLink]
		public static extern c_int GetPhysicsShapeType(c_int index);

		// Returns the amount of vertices of a physics body shape
		[CLink]
		public static extern c_int GetPhysicsShapeVerticesCount(c_int index);

		// Returns transformed position of a body shape (body position + vertex transformed position)
		[CLink]
		public static extern Vector2 GetPhysicsShapeVertex(PhysicsBodyData* body, c_int vertex);

		// Sets physics body shape transform based on radians parameter
		[CLink]
		public static extern void SetPhysicsBodyRotation(PhysicsBodyData* body, float radians);

		// Unitializes and destroy a physics body
		[CLink]
		public static extern void DestroyPhysicsBody(PhysicsBodyData* body);

		// Destroys created physics bodies and manifolds and resets global values
		[CLink]
		public static extern void ResetPhysics();

		// Unitializes physics pointers and closes physics loop thread
		[CLink]
		public static extern void ClosePhysics();
	}
}*/
