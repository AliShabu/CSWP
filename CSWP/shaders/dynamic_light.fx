//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#define GENERATE_NORMALS      // Uncomment for normals to be generated
#include "mta-helper.fx"

float3 sunPos = float3(0, 0, 0);
float4 shadowColor = float4(0, 0, 0, 1);
float4 lightColor = float4(1, 1, 1, 1);
float4 ambientColor = float4(1, 1, 1, 1);
float ambientIntensity = 1.0;
float specularSize = 4;
float lightShiningPower = 1;
float bumpMapFactor = 1;
float specularFadeStart = 5;
float specularFadeEnd = 70; 
float textureSize = 512.0;
float rainLevel = 0;

//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler MainSampler = sampler_state
{
    Texture = (gTexture0);
};

struct VertexShaderInput
{
	float3 Position : POSITION0;
	float3 Normal : NORMAL0;
	float2 TexCoord : TEXCOORD0;
};

struct VertexShaderOutput
{
	float4 Position : POSITION0;
	float4 Color : COLOR0;
	float2 TexCoord : TEXCOORD0;
	float3 worldPosition : TEXCOORD1;
	float3 worldNormal : TEXCOORD2;
	float3 lightDirection : TEXCOORD3;
	float3 Binormal : TEXCOORD4;
	float3 Tangent : TEXCOORD5;
	float DistFade : TEXCOORD6;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;
	
    MTAFixUpNormal(input.Normal);

    output.Position = MTACalcScreenPosition(input.Position);
	output.worldNormal = MTACalcWorldNormal(input.Normal);
	output.worldPosition = MTACalcWorldPosition(input.Position);
	output.lightDirection = normalize(output.Position - sunPos);
	
	// Fake tangent and binormal
    float3 Tangent = input.Normal.yxz;
    Tangent.xz = input.TexCoord.xy;
    float3 Binormal = normalize(cross(Tangent, input.Normal));
    Tangent = normalize(cross(Binormal, input.Normal));
    // Transfer some stuff
	output.Tangent = normalize(mul(Tangent, gWorldInverseTranspose).xyz);
    output.Binormal = normalize(mul(Binormal, gWorldInverseTranspose).xyz);

    float lightIntensity = dot(output.worldNormal, -output.lightDirection);
	
	output.TexCoord = input.TexCoord;
    output.Color = saturate(ambientColor * lightIntensity);
	
	// Distance fade calculation
    float DistanceFromCamera = MTACalcCameraDistance(gCameraPosition, MTACalcWorldPosition(input.Position));
    output.DistFade = MTAUnlerp (specularFadeEnd, specularFadeStart, DistanceFromCamera );

    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	
	float4 mainColor = tex2D(MainSampler, input.TexCoord);
	float wetness = bumpMapFactor + (rainLevel * 3);
	
	float3 normalMap = 2 * MTACalcNormalMap(MainSampler, input.TexCoord.xy, mainColor, textureSize) - 1.0f;  
    normalMap = float3(normalMap.x * wetness, normalMap.y * wetness, normalMap.z);
    normalMap = normalize(normalMap.x * input.Tangent + normalMap.y * input.Binormal + input.worldNormal);
	
	// Using Blinn half angle modification for performance over correctness	
    float3 lightRange = normalize(normalize(gCameraPosition - input.worldPosition) - input.lightDirection);
    float specularLight = pow(saturate(dot(lightRange, normalMap)), specularSize * 2);
	float4 specularColor = float4(lightColor.rgb * specularLight, 1);
	specularColor += pow(saturate(dot(lightRange, input.worldNormal)), specularSize / 2) / 2;
	specularColor /= 2;
	
	float lightAwayDot = -dot(input.lightDirection, input.worldNormal);
	
    if (lightAwayDot < 0) specularColor = 0;
	
	specularColor *= mainColor.g;
	
	float4 shadowBrightness = saturate(input.Color + shadowColor);
	float4 finalColor = mainColor * shadowBrightness;
	finalColor.rgb *= ambientColor.rgb * ambientIntensity;
	
	float greyNess = MTAGetPixelGreyness(mainColor);
	finalColor.rgb += specularColor * greyNess * lightShiningPower * saturate(input.DistFade);
	
    return finalColor;
}

technique DynamicLight
{
    pass Pass0
    {
        VertexShader = compile vs_3_0 VertexShaderFunction();
        PixelShader = compile ps_3_0 PixelShaderFunction();
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