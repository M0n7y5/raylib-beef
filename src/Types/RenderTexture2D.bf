using System;
namespace raylib_beef.Types
{
	[CRepr]
	public struct RenderTexture2D
	{
	    public uint32 id;                  // OpenGL Framebuffer Object (FBO) id
	    public Texture2D texture;        // Color buffer attachment texture
	    public Texture2D depth;          // Depth buffer attachment texture
	    public bool depthTexture;        // Track if depth attachment is a texture or renderbuffer
	}
}
