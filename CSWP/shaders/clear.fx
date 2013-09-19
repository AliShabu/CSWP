float4 ClearMe() : COLOR0
{	
    return 0;	
}

technique Clear
{
    pass p0
    {
		AlphaBlendEnable = TRUE;
        PixelShader = compile ps_2_0 ClearMe();
    }
}

// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}