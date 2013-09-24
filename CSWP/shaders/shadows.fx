//-- Include some common stuff
 
#include "mta-helper.fx"
#define GENERATE_NORMALS
float4 PixelShader1(float2 texCoords : TEXCOORD) : COLOR
{
    return float4(1, 0, 0, 1); //red
}

float4 PixelShader2(float2 texCoords : TEXCOORD) : COLOR
{
    return float4(0, 1, 0, 1); //green
}

float4 PixelShader3(float2 texCoords : TEXCOORD) : COLOR
{
    return float4(0, 0, 1, 1); //blue
}

technique MultiPass
{
    pass P0
    {
        PixelShader = compile ps_2_0 PixelShader1();
    }
    pass P1
    {
		DepthBias = -0.0002;
        PixelShader = compile ps_2_0 PixelShader2();
    }
    pass P2
    {
		DepthBias = -0.0003;
        PixelShader = compile ps_2_0 PixelShader3();
    }
}