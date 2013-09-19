#include "mta-helper.fx"

float4 sunColor = float4(0, 0, 0, 1);

sampler GrassSampler = sampler_state
{
    Texture = <gTexture0>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = WRAP;
    AddressV = WRAP;
};

struct VertexShaderInput
{
    float3 Position				: POSITION; 
    float2 TextureCoordinate	: TEXCOORD0;
};

struct VertexShaderOutput
{
	float4 Position				: POSITION;
	float2 TextureCoordinate	: TEXCOORD0;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;

	output.Position = MTACalcScreenPosition(input.Position);
    output.TextureCoordinate = input.TextureCoordinate;

    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{	
	float4 color = tex2D(GrassSampler, input.TextureCoordinate);
	float4 finalColor = color * sunColor;
	
    return finalColor;
}
 
technique GrassShader
{
    pass Pass0
    {
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
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