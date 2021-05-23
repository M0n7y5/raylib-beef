using System;
namespace raylib_beef.Types
{
	typealias RenderTexture2D = RenderTexture;

	[CRepr]
	public struct RenderTexture
	{
		public uint32 id;// OpenGL Framebuffer Object (FBO) id
		public Texture texture;// Color buffer attachment texture
		public Texture depth;// Depth buffer attachment texture
		//public bool depthTexture;// Track if depth attachment is a texture or renderbuffer
	}
}
