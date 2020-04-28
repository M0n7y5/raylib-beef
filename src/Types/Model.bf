using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Model
	{
		public Matrix transform;// Local transform matrix
		public int meshCount;// Number of meshes

		// meshes refers to a Mesh *
		public Mesh* meshes;// Meshes array
		public int materialCount;// Number of materials

		// materials refers to a Material *
		public Material* materials;// Materials array refers to a Material *

		// meshMaterial refers to a int *
		public int* meshMaterial;// Mesh material number
		public int boneCount;// Number of bones

		// bones refers to a BoneInfo *
		public BoneInfo* bones;// Bones information (skeleton)

		// bindPose refers to a Transform *
		public Transform* bindPose;// Bones base transformation (pose)
	}
}
