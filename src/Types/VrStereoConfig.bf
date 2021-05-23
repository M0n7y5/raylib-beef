using System;
namespace raylib_beef.Types
{
	[CRepr]
	struct VrStereoConfig
	{
		public Matrix[2] projection;           // VR projection matrices (per eye)
		public Matrix[2] viewOffset;           // VR view offset matrices (per eye)
		public float[2] leftLensCenter;        // VR left lens center
		public float[2] rightLensCenter;       // VR right lens center
		public float[2] leftScreenCenter;      // VR left screen center
		public float[2] rightScreenCenter;     // VR right screen center
		public float[2] scale;                 // VR distortion scale
		public float[2] scaleIn;               // VR distortion scale in
	}
}
