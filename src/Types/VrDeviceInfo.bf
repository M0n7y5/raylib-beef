using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct VrDeviceInfo
	{
		public int32 hResolution;// HMD horizontal resolution in pixels
		public int32 vResolution;// HMD vertical resolution in pixels
		public float hScreenSize;// HMD horizontal size in meters
		public float vScreenSize;// HMD vertical size in meters
		public float vScreenCenter;// HMD screen center in meters
		public float eyeToScreenDistance;// HMD distance between eye and display in meters
		public float lensSeparationDistance;// HMD lens separation distance in meters
		public float interpupillaryDistance;// HMD IPD (distance between pupils) in meters

		public float[4] lensDistortionValues;// HMD lens distortion constant parameters

		public float[4] chromaAbCorrection;// HMD chromatic aberration correction parameters
	}
}
