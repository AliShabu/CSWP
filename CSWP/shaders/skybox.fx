#include "mta-helper.fx"

texture skyBoxTexture1;
texture skyBoxTexture2;
texture sunTexture;
float4 sunColor = float4(1, 1, 1, 1);
float sunSize = 1;
float3 camPos = float3(1, 1, 1);
float3 sunPos = float3(0, 0, 0);
float3 skyRotate = float3(0, 0, 0);
float fadeValue = 0;

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

sampler SunSampler = sampler_state
{
    Texture = <sunTexture>;
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
	float2 SunTexCoords: TEXCOORD0;
	float4 Diffuse : COLOR0;
};
 
struct VertexShaderOutput
{
    float4 Position : POSITION0;
	float2 SunTexCoords: TEXCOORD0;
    float3 SkyTextureCoords : TEXCOORD1;
	float3 NormalPosition : TEXCOORD2;
	float3 LightDirection : TEXCOORD3;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;

	output.Position = MTACalcScreenPosition(input.Position);
	output.SunTexCoords = input.SunTexCoords;
	float4 vertexPosition = mul(float4(input.Position, 1), gWorld);
	
	// compute eye vector 	
	float4 eyeVector = normalize(vertexPosition - gViewInverse[3]);		
    output.SkyTextureCoords = normalize(mul(eulRotate(skyRotate), eyeVector.xyz));
	
	// compute sun vector 
	output.NormalPosition = normalize(mul(eulRotate(skyRotate), eyeVector.xyz));
	float3 lightPos = normalize(gCameraPosition - sunPos);
	output.LightDirection = normalize(mul(eulRotate(skyRotate), -lightPos));
	
    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	input.SkyTextureCoords.z *= 1.5;
	float4 skyColor1 = texCUBE(SkyCubeSampler1, input.SkyTextureCoords.yzx);
	float4 skyColor2 = texCUBE(SkyCubeSampler2, input.SkyTextureCoords.yzx);
	float4 skyColor = (skyColor2 * fadeValue) + (skyColor1 * (1 - fadeValue));
	skyColor /= 1.2;
	
	// sun 
	input.NormalPosition.z *= 1.5;
	float3 NormalPosition = normalize(input.NormalPosition);
	float4 sunTexture = tex2D(SunSampler, input.SunTexCoords);

    float sunDot = dot(input.LightDirection, NormalPosition);	
	vector rays = (0.3 * sunSize) * pow(max(0.0, sunDot), 60);
	rays *= sunTexture;
    vector light = (0.1 * sunSize) * pow(max(0.0001, sunDot), 360);
	light *= sunTexture;
	
	float4 sunObject = sunColor * (light + rays);
	float4 finalColor = float4(skyColor.rgb + sunObject.rgb, 1);
	
	return finalColor;
}

technique SkyBox
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