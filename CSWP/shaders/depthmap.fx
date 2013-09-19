//-- Include some common stuff
#include "mta-helper.fx"

struct VertexInput
{
	float3 position	: POSITION;
};

struct VertexOutput
{
	float4 position	: POSITION;
	float lightDepth	: TEXCOORD0;
};

VertexOutput DepthVertexShader(VertexInput Input)
{
	VertexOutput output;
	output.position = MTACalcScreenPosition(Input.position);
	output.lightDepth = output.position.z;

	return output;
} 


float4 DepthPixelShader(VertexOutput Input) : COLOR
{
	return Input.lightDepth;
}

technique GenerateShadowMap
{
	pass P0
	{
		VertexShader = compile vs_2_0 DepthVertexShader();
		PixelShader  = compile ps_2_0 DepthPixelShader();
	}
}