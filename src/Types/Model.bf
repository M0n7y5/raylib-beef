using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct Model
	{
		public Matrix transform;// Local transform matrix
		public int32 meshCount;// Number of meshes

		// meshes refers to a Mesh *
		public Mesh* meshes;// Meshes array
		public int32 materialCount;// Number of materials

		// materials refers to a Material *
		public Material* materials;// Materials array refers to a Material *

		// meshMaterial refers to a int *
		public int32* meshMaterial;// Mesh material number
		public int32 boneCount;// Number of bones

		// bones refers to a BoneInfo *
		public BoneInfo* bones;// Bones information (skeleton)

		// bindPose refers to a Transform *
		public Transform* bindPose;// Bones base transformation (pose)
	}
}
