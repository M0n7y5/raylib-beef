using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct ModelAnimation
	{
	    public int boneCount;                 // Number of bones

	    // bones refers to a BoneInfo *
	    public BoneInfo* bones;                  // Bones information (skeleton)
	    public int frameCount;                // Number of animation frames

	    // framePoses refers to a Transform **
	    public Transform** framePoses;      // Poses array by frame
	}
}
