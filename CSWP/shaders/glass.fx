//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#define GENERATE_NORMALS      // Uncomment for normals to be generated
#include "mta-helper.fx"

texture skyBoxTexture1;
texture skyBoxTexture2;
float3 skyRotate = float3(0, 0, 0);
float fadeValue = 0;
float3 sunPos = float3(0, 0, 0);
float4 glassColor = float4(1.0, 1.0, 1.0, 1.0);
float4 ambientColor = float4(1.0, 1.0, 1.0, 1.0);
float reflectionStrength = 1.0;
float glassShiningPower = 16;

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
	float4 Diffuse : COLOR0;
	float3 Normal : NORMAL0;
	float2 TexCoord : TEXCOORD0;
	float3 skyTextureCoordinate : TEXCOORD1;
};
 
struct VertexShaderOutput
{
    float4 Position : POSITION0;
	float2 TexCoord : TEXCOORD0;
    float3 skyTextureCoordinate : TEXCOORD1;
	float3 worldPosition : TEXCOORD2;
	float3 worldNormal : TEXCOORD3;
	float3 lightDirection : TEXCOORD4;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;

	MTAFixUpNormal(input.Normal);
	
	output.Position = MTACalcScreenPosition(input.Position);
	output.TexCoord = input.TexCoord;
	output.worldPosition = MTACalcWorldPosition(input.Position);
	output.worldNormal = MTACalcWorldNormal(input.Normal);
	output.lightDirection = normalize(input.Position - sunPos);
	
	float4 vertexPosition = mul(float4(input.Position, 1), gWorld);
	
	// compute the eye vector 
    float4 eyeVector = normalize(vertexPosition - gViewInverse[3]); 			
    output.skyTextureCoordinate = normalize(mul(eulRotate(skyRotate), eyeVector.xyz));

    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	float4 mainColor = tex2D(MainSampler, input.TexCoord);
	
	input.skyTextureCoordinate.xy = -input.skyTextureCoordinate.xy;
	float4 skyColor1 = texCUBE(SkyCubeSampler1, input.skyTextureCoordinate.yzx);
	float4 skyColor2 = texCUBE(SkyCubeSampler2, input.skyTextureCoordinate.yzx);	
	float4 finalSkyColor = (skyColor2 * fadeValue) + (skyColor1 * (1 - fadeValue));
	
	// Using Blinn half angle modification for performance over correctness
    float3 lightRange = normalize(normalize(gCameraPosition - input.worldPosition) - input.lightDirection);
    float specularLight = pow(saturate(dot(lightRange, input.worldNormal)), glassShiningPower);
	float4 specularColor = float4(specularLight, specularLight, specularLight, 1);
	specularColor *= mainColor.g * mainColor.g;
	
	float4 finalColor = saturate(mainColor * glassColor * finalSkyColor * ambientColor);
	finalColor += specularColor;
	finalColor.a = reflectionStrength;
	
    return finalColor;
}

technique GlassShader
{
    pass Pass0
    {
		DepthBias = -0.0002;
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