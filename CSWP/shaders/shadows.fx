//-- Include some common stuff
 
#include "mta-helper.fx"
#define GENERATE_NORMALS

float4x4 texViewProj;
texture shadowMap;

sampler ShadowSampler = sampler_state
{
    Texture = <shadowMap>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;

};

struct VertexShaderInput1
{
    float3 Position : POSITION0;
	float4 outPosition : TEXCOORD0;
	float TexCoord : TEXCOORD1;
};
 
struct VertexShaderOutput1
{
    float4 Position : POSITION0;
	float4 outPosition : TEXCOORD0;
	float TexCoord : TEXCOORD1;
};

VertexShaderOutput1 VertexShaderFunction1(VertexShaderInput1 input)
{
    VertexShaderOutput1 output;
	
	output.Position = MTACalcScreenPosition(input.Position);
	output.outPosition = mul(gWorldViewProjection, output.Position);
	output.TexCoord = output.outPosition.z;

    return output;
}

float4 PixelShaderFunction1(VertexShaderOutput1 input) : COLOR0
{
	return input.TexCoord.xxxx;
}

struct VertexShaderInput2
{
    float3 Position : POSITION0;
	float4 outPosition : TEXCOORD0;
	float4 shadowUV : TEXCOORD1;
};
 
struct VertexShaderOutput2
{
    float4 Position : POSITION0;
	float4 outPosition : TEXCOORD0;
	float4 shadowUV : TEXCOORD1;
};

VertexShaderOutput2 VertexShaderFunction2(VertexShaderInput2 input)
{
    VertexShaderOutput2 output;
	
	output.Position = MTACalcScreenPosition(input.Position);
	output.outPosition = mul(gWorldViewProjection, output.Position);
	float4 worldPos = mul(gWorld, output.Position);
    output.shadowUV = mul(texViewProj, worldPos);

    return output;
}

float4 PixelShaderFunction2(VertexShaderOutput2 input) : COLOR0
{
	input.shadowUV.xy = input.shadowUV.xy / input.shadowUV.w;
	
	float shadowDepth = tex2D(ShadowSampler, input.shadowUV.xy);
    if (shadowDepth < input.shadowUV.z)
    {
        return float4(0,0,0,1);
    }
    else
    {
        return float4(1, 1, 1, 1);
    }
}


technique MultiPass
{
    pass P0
    {
        VertexShader = compile vs_2_0 VertexShaderFunction1();
        PixelShader = compile ps_2_0 PixelShaderFunction1();
    }
	pass P1
    {
        VertexShader = compile vs_2_0 VertexShaderFunction2();
        PixelShader = compile ps_2_0 PixelShaderFunction2();
    }
}