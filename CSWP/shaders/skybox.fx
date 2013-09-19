#include "mta-helper.fx"

texture skyBoxTexture1;
texture skyBoxTexture2;
texture sunTexture;
float4 sunColor = float4(1, 1, 1, 1);
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

samplerCUBE SunSampler = sampler_state
{
    Texture = <sunTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
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
};
 
struct VertexShaderOutput
{
    float4 Position : POSITION0;
    float3 skyTextureCoordinate : TEXCOORD0;
};

VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;

	output.Position = MTACalcScreenPosition(input.Position);
	float4 vertexPosition = mul(float4(input.Position, 1), gWorld);
	
	// compute the eye vector 
    float4 eyeVector = normalize(vertexPosition - gViewInverse[3]); 			
    output.skyTextureCoordinate = normalize(mul(eulRotate(skyRotate), eyeVector.xyz));
	
    return output;
}

float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	input.skyTextureCoordinate.z *= 1.5;
	float4 skyColor1 = texCUBE(SkyCubeSampler1, input.skyTextureCoordinate.yzx);
	float4 skyColor2 = texCUBE(SkyCubeSampler2, input.skyTextureCoordinate.yzx);
	//if (skyColor.b > skyColor.r && skyColor.b > skyColor.g) {skyColor.b = 1;}
	
	float4 finalColor = (skyColor2 * fadeValue) + (skyColor1 * (1 - fadeValue));
	finalColor.rgb /= 1.5;
	
	if (finalColor.r > 0.5) {finalColor.r + 0.25f;} else {finalColor.r - 0.25f;}
	if (finalColor.g > 0.5) {finalColor.g + 0.25f;} else {finalColor.g - 0.25f;}
	if (finalColor.b > 0.5) {finalColor.b + 0.25f;} else {finalColor.b - 0.25f;}
	
    return saturate(finalColor);
}

technique SkyBox
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