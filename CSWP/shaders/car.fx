//-- Include some common stuff
#include "mta-helper.fx"
#define GENERATE_NORMALS      // Uncomment for normals to be generated

texture mainReflectionTexture;
texture skyBoxTexture1;
texture skyBoxTexture2;
float3 skyRotate = float3(0, 0, 0);
float fadeValue = 0;
float3 sunPos = float3(0, 0, 0);
float3 camPos = float3(0, 0, 0);
float4 ambientColor = float4(1, 1, 1, 1);
float ambientIntensity = 1.0;
float4 shadowColor = float4(0, 0, 0, 1);
float carReflectionStrength = 1.0;
float carShiningPower = 1;
float specularSize = 4;
float bumpMapFactor = 1;
float specularFadeStart = 25;
float specularFadeEnd = 500; 
float textureSize = 512.0;

sampler ReflectionSampler = sampler_state
{
    Texture = <mainReflectionTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Clamp;
    AddressV = Clamp;
};

sampler MainSampler = sampler_state
{
    Texture = <gTexture0>;
};

samplerCUBE SkyCubeSampler1 = sampler_state
{
    Texture = <skyBoxTexture1>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
	AddressU = Clamp;
    AddressV = Clamp;
};

samplerCUBE SkyCubeSampler2 = sampler_state
{
    Texture = <skyBoxTexture2>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
	AddressU = Clamp;
    AddressV = Clamp;
};

float3x3 eulRotate(float3 Rotate)
{
    float cosX,sinX;
    float cosY,sinY;
    float cosZ,sinZ;

    sincos(Rotate.x,sinX,cosX);
    sincos(-Rotate.y,sinY,cosY);
    sincos(Rotate.z,sinZ,cosZ);

//Euler extrinsic rotations 
//http://www.vectoralgebra.info/eulermatrix.html


		float3x3 rot = float3x3(
		cosY * cosZ + sinX * sinY * sinZ, -cosX * sinZ,  sinX * cosY * sinZ - sinY * cosZ,
		cosY * sinZ - sinX * sinY * cosZ,  cosX * cosZ, -sinY * sinZ - sinX * cosY * cosZ,
		cosX * sinY,                       sinX,         cosX * cosY
	);

return rot;	
}

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
	float3 skyTextureCoordinate : TEXCOORD1;
	float3 worldPosition : TEXCOORD2;
	float3 worldNormal : TEXCOORD3;
	float3 lightDirection : TEXCOORD4;
	float3 Binormal : TEXCOORD5;
	float3 Tangent : TEXCOORD6;
	float DistFade : TEXCOORD7;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;
	
	MTAFixUpNormal(input.Normal);

	output.Position = MTACalcScreenPosition(input.Position);
    output.worldNormal = MTACalcWorldNormal(input.Normal);
	output.worldPosition = MTACalcWorldPosition(input.Position);
	output.lightDirection = normalize(input.Position - sunPos);
	
	// Fake tangent and binormal
    float3 Tangent = input.Normal.yxz;
    Tangent.xz = input.TexCoord.xy;
    float3 Binormal = normalize(cross(Tangent, input.Normal));
    Tangent = normalize(cross(Binormal, input.Normal));
    // Transfer some stuff
	output.Tangent = normalize(mul(Tangent, gWorldInverseTranspose).xyz);
    output.Binormal = normalize(mul(Binormal, gWorldInverseTranspose).xyz);
	
	float4 vertexPosition = mul(float4(input.Position, 1), gWorld);
	
	// compute the eye vector 
    float4 eyeVector = normalize(vertexPosition - gViewInverse[3]); 			
    output.skyTextureCoordinate = mul(eulRotate(skyRotate), output.worldNormal * eyeVector.xyz);
	
	output.TexCoord = input.TexCoord;
	
    float lightIntensity = dot(output.worldNormal, -output.lightDirection);
	
    output.Color = lightIntensity;
	
	// Distance fade calculation
    float DistanceFromCamera = MTACalcCameraDistance(gCameraPosition, output.worldPosition);
    output.DistFade = MTAUnlerp(specularFadeEnd, specularFadeStart, 1.0f);
	
    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	input.skyTextureCoordinate.xy = -input.skyTextureCoordinate.xy;
	float4 skyColor1 = texCUBE(SkyCubeSampler1, input.skyTextureCoordinate.yzx);
	float4 skyColor2 = texCUBE(SkyCubeSampler2, input.skyTextureCoordinate.yzx);	
	float4 finalSkyColor = (skyColor2 * fadeValue) + (skyColor1 * (1 - fadeValue));
	
	float4 mainColor = tex2D(MainSampler, input.TexCoord);
	
	float3 normalMap = 2 * MTACalcNormalMap(MainSampler, input.TexCoord.xy, mainColor, textureSize) - 1.0f;  
    normalMap = float3(normalMap.x * bumpMapFactor, normalMap.y * bumpMapFactor, normalMap.z);
    normalMap = normalize(normalMap.x * input.Tangent + normalMap.y * input.Binormal + input.worldNormal);
	
	// Using Blinn half angle modification for performance over correctness
    float3 lightRange = normalize(normalize(gCameraPosition - input.worldPosition) - input.lightDirection);
    float specularLight = pow(saturate(dot(lightRange, normalMap)), specularSize * 2);
	float4 specularColor = float4(specularLight, specularLight, specularLight, 1);
	specularColor += pow(saturate(dot(lightRange, input.worldNormal)), specularSize / 2) / 2;
    specularColor /= 2;
	specularColor *= mainColor.g;
	
	float4 lightColor = input.Color;
	lightColor.rgb += specularColor.rgb * carShiningPower;
	
	if (lightColor.r < shadowColor.r) {lightColor.r = shadowColor.r;}
	if (lightColor.g < shadowColor.g) {lightColor.g = shadowColor.g;}
	if (lightColor.b < shadowColor.b) {lightColor.b = shadowColor.b;}
	
	float4 finalColor = mainColor * lightColor * finalSkyColor;
	finalColor *= ambientColor * ambientIntensity; 
	
	return finalColor;
}

technique CarShader
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