using System;
namespace raylib_beef.Types
{

	// Previously defined to be used in PhysicsShape struct as circular dependencies
	//typedef struct PhysicsBodyData *PhysicsBody;
	[CRepr]
	public struct PhysicsBodyData {
	    public uint16 id;                            	   // Reference unique identifier
	    public Windows.IntBool enabled;                    // Enabled dynamics state (collisions are calculated anyway)
	    public Vector2 position;                           // Physics body shape pivot
	    public Vector2 velocity;                           // Current linear velocity applied to position
	    public Vector2 force;                              // Current linear force (reset to 0 every step)
	    public float angularVelocity;                      // Current angular velocity applied to orient
	    public float torque;                               // Current angular force (reset to 0 every step)
	    public float orient;                               // Rotation in radians
	    public float inertia;                              // Moment of inertia
	    public float inverseInertia;                       // Inverse value of inertia
	    public float mass;                                 // Physics body mass
	    public float inverseMass;                          // Inverse value of mass
	    public float staticFriction;                       // Friction when the body has not movement (0 to 1)
	    public float dynamicFriction;                      // Friction when the body has movement (0 to 1)
	    public float restitution;                          // Restitution coefficient of the body (0 to 1)
	    public Windows.IntBool useGravity;                 // Apply gravity force to dynamics
	    public Windows.IntBool isGrounded;                 // Physics grounded on other body state
	    public Windows.IntBool freezeOrient;               // Physics rotation constraint
	    public PhysicsShape shape;                         // Physics body shape information (type, radius, vertices, normals)
	}


	/*typedef struct PhysicsBodyData {
	    unsigned int id;                            // Reference unique identifier
	    bool enabled;                               // Enabled dynamics state (collisions are calculated anyway)
	    Vector2 position;                           // Physics body shape pivot
	    Vector2 velocity;                           // Current linear velocity applied to position
	    Vector2 force;                              // Current linear force (reset to 0 every step)
	    float angularVelocity;                      // Current angular velocity applied to orient
	    float torque;                               // Current angular force (reset to 0 every step)
	    float orient;                               // Rotation in radians
	    float inertia;                              // Moment of inertia
	    float inverseInertia;                       // Inverse value of inertia
	    float mass;                                 // Physics body mass
	    float inverseMass;                          // Inverse value of mass
	    float staticFriction;                       // Friction when the body has not movement (0 to 1)
	    float dynamicFriction;                      // Friction when the body has movement (0 to 1)
	    float restitution;                          // Restitution coefficient of the body (0 to 1)
	    bool useGravity;                            // Apply gravity force to dynamics
	    bool isGrounded;                            // Physics grounded on other body state
	    bool freezeOrient;                          // Physics rotation constraint
	    PhysicsShape shape;                         // Physics body shape information (type, radius, vertices, normals)
	} PhysicsBodyData;*/
}
