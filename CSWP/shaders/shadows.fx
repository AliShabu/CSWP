//-- Include some common stuff
 
#include "mta-helper.fx"
#define GENERATE_NORMALS

float4 lightColor = float4(0, 0, 0, 0);
float4 shadowColor = float4(0, 0, 0, 0);
float3 sunPos = float3(0, 0, 0);
float3 camPos = float3(0, 0, 0);

float inDepthOffset = 0.98;

Texture shadowTexture;

sampler MainSampler = sampler_state
{
    Texture = (gTexture0);
};

sampler ShadowSampler = sampler_state
{
    Texture = (shadowTexture);
};

struct VertexInput
{
	float3 position		: POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct VB_GenerateShadowMap
{
	float4 position			: POSITION;
	float lightDepth		: TEXCOORD0;
	float cameraDepth		: TEXCOORD1;
	float2 TexCoord : TEXCOORD2;
};

VB_GenerateShadowMap VS_GenerateShadowMap(VertexInput Input)
{
	VB_GenerateShadowMap output;
	output.position = MTACalcScreenPosition(Input.position);
	float3 position3D = MTACalcWorldPosition(Input.position);
	
	float4 lightDepthPosition = float4(sunPos, 1) - output.position;
	float4 cameraDepthPosition = float4(camPos, 1) - output.position;

	output.lightDepth = lightDepthPosition.z;
	output.cameraDepth = 1.0f - (cameraDepthPosition.z/cameraDepthPosition.w);
	
	output.TexCoord = Input.TexCoord;

	return output;
} 


float4 PS_GenerateShadowMap(VB_GenerateShadowMap Input) : COLOR
{

	float4 finalColor;
	float lightDistance = distance(Input.lightDepth, sunPos);
	float cameraDistance = distance(Input.cameraDepth, sunPos);
	if (lightDistance > cameraDistance) {finalColor = shadowColor;} else {finalColor = lightColor;}

	float4 mainColor = tex2D(MainSampler, Input.TexCoord);
	
	return mainColor * finalColor;
}

technique GenerateShadowMap
{
	pass P0
	{
		VertexShader = compile vs_2_0 VS_GenerateShadowMap();
		PixelShader  = compile ps_2_0 PS_GenerateShadowMap();
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