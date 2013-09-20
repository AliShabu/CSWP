//-- Include some common stuff
#include "mta-helper.fx"

float Time;
texture skyBoxTexture1;
texture skyBoxTexture2;
float3 skyRotate = float3(0, 0, 0);
float fadeValue = 0;
texture causticTexture;
texture reflectionTexture;
texture refractionTexture;
texture normalTexture;

float flowSpeed = 0.0;
float reflectScale = 0.0;
float refractScale = 0.0;
float reflectionStrength = 0.0;
float refractionStrength = 0.0;
float causticStrength = 0.0;
float4 waterColor = float4(0.0, 0.0, 0.0, 0.0);
float waterAlpha = 0.0;
float waterBrightness = 1.0;
float3 camPos = float3(0, 0, 0);
float3 sunPos = float3(0, 0, 0);
float4 sunColor = float4(0.0, 0.0, 0.0, 0.0);
float waterShiningPower = 16;
float fogStart = 50;
float fogEnd = 550;

///////////////////
// SAMPLE STATES //
///////////////////

sampler CausticSampler = sampler_state
{
    Texture = <causticTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Wrap;
    AddressV = Wrap;
};

sampler ReflectionSampler = sampler_state
{
    Texture = <reflectionTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Mirror;
    AddressV = Mirror;
};

sampler RefractionSampler = sampler_state
{
    Texture = <refractionTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Mirror;
    AddressV = Mirror;
};

sampler NormalSampler = sampler_state
{
    Texture = <normalTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Wrap;
    AddressV = Wrap;
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

struct VertexInputType
{
    float3 position : POSITION;
	float3 normal : NORMAL0;
    float2 textureCoords : TEXCOORD0;
};

struct PixelInputType
{
    float4 position : POSITION;
    float2 textureCoords : TEXCOORD0;
	float4 reflectionPosition : TEXCOORD1;
    float4 refractionPosition : TEXCOORD2;
	float3 skyTextureCoordinate : TEXCOORD3;
	float Depth : TEXCOORD4;
	float3 worldPosition : TEXCOORD5;
	float3 lightDirection : TEXCOORD6;
  
};

////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////////////////////////////
PixelInputType WaterVertexShader(VertexInputType input)
{
    PixelInputType output;
    matrix reflectProjection;
    matrix refractProjection;

    // Calculate the position of the vertex against the world, view, and projection matrices.
    output.position = MTACalcScreenPosition(input.position);
	output.worldPosition = MTACalcWorldPosition(input.position);
	output.lightDirection = normalize(camPos - sunPos);
    
    // Store the texture coordinates for the pixel shader.
    output.textureCoords = input.textureCoords;
	
	// Create the view projection world matrix for reflection.
    reflectProjection = mul(gWorldViewProjection, gWorld);
    reflectProjection = mul(gWorld, reflectProjection);
   
    // Calculate the input position against the refractProjection matrix.
    output.reflectionPosition = mul(float4(input.position, 1), reflectProjection);

    // Create the view projection world matrix for refraction.
    refractProjection = mul(gWorldViewProjection, gWorld);
    refractProjection = mul(gWorld, refractProjection);
   
    // Calculate the input position against the refractProjection matrix.
    output.refractionPosition = mul(float4(input.position, 1), refractProjection);
	
	float4 vertexPosition = mul(float4(input.position, 1), gWorld);
	
	// compute the eye vector 
    float4 eyeVector = vertexPosition - gViewInverse[3]; 			
    output.skyTextureCoordinate = mul(eulRotate(skyRotate), eyeVector.xyz);
	
	output.Depth =  output.position.z;

    return output;
}



////////////////////////////////////////////////////////////////////////////////
// Pixel Shader
////////////////////////////////////////////////////////////////////////////////
float4 WaterPixelShader(PixelInputType input) : COLOR0
{
    float2 refractTexCoord;
	float2 reflectTexCoord;
	float3 skyBoxReflectTexCoord;
	float3 skyBoxTexCoord;
    float4 normalMap;
    float3 normal;
    float4 reflectionColor;
    float4 refractionColor;
	float4 causticColor;
	float4 skyColor;
    float4 color;
	float timer = (Time/25) * flowSpeed;

    // Move the position the water normal is sampled from to simulate moving water.	
    input.textureCoords.xy += timer;
	
    // Calculate the projected refraction texture coordinates.
	reflectTexCoord.x = input.reflectionPosition.x / input.reflectionPosition.w / 2.0f + 0.5f;
    reflectTexCoord.y = -input.reflectionPosition.y / input.reflectionPosition.w / 2.0f + 0.5f;
    refractTexCoord.x = input.refractionPosition.x / input.refractionPosition.w / 2.0f + 0.5f;
    refractTexCoord.y = -input.refractionPosition.y / input.refractionPosition.w / 2.0f + 0.5f;
	skyBoxReflectTexCoord.x = input.skyTextureCoordinate.x / 1 / 2.0f + 0.5f;
	skyBoxReflectTexCoord.y = -input.skyTextureCoordinate.y / 1 / 2.0f + 0.5f;
	skyBoxReflectTexCoord.z = -input.skyTextureCoordinate.z / 1 / 2.0f + 0.5f;
    // Sample the normal from the normal map texture.
	float2 NormalTex = input.textureCoords;
	NormalTex.y = NormalTex.y  + (sin(NormalTex.y * 10) * 0.01) + timer;
    normalMap = tex2D(NormalSampler, NormalTex);

    // Expand the range of the normal from (0,1) to (-1,+1).
    normal = (normalMap.xyz * 2.0f) - 1.0f;

    // Re-position the texture coordinate sampling position by the normal map value to simulate the rippling wave effect.
	reflectTexCoord = reflectTexCoord + (normal.xy * reflectScale);
    refractTexCoord = refractTexCoord + (normal.xy * refractScale);
	skyBoxReflectTexCoord = skyBoxReflectTexCoord + (normal * reflectScale);
    // Sample the texture pixels from the textures using the updated texture coordinates.
	float2 CausticTex = input.textureCoords;
	CausticTex.y = CausticTex.y  + (sin(CausticTex.y * 10) * 0.01) + timer;
    causticColor = tex2D(CausticSampler, CausticTex);
	
	float4 skyColor1 = texCUBE(SkyCubeSampler1, skyBoxReflectTexCoord.yzx);
	float4 skyColor2 = texCUBE(SkyCubeSampler2, skyBoxReflectTexCoord.yzx);	
	float4 finalSkyColor = (skyColor2 * fadeValue) + (skyColor1 * (1 - fadeValue));
	
	reflectionColor = tex2D(ReflectionSampler, reflectTexCoord) * reflectionStrength;
	refractionColor = tex2D(RefractionSampler, refractTexCoord) * refractionStrength;

	// Using Blinn half angle modification for performance over correctness
    float3 lightRange = normalize(normalize(camPos - input.worldPosition) - input.lightDirection);
    float specularLight = pow(saturate(dot(lightRange, normal)), waterShiningPower);
	float4 specularColor = float4(sunColor.rgb * specularLight, 1);
	specularColor *= normalMap.g * normalMap.g;
	
    // Combine the reflection and refraction results for the final color.
    color = lerp(reflectionColor * reflectionStrength, refractionColor * refractionStrength, 2.0f);
	color *= causticColor * causticStrength;
    color += finalSkyColor * waterColor * reflectionStrength;
	
	float distanceFog = saturate((input.Depth - fogStart)/(fogEnd - fogStart));
	float4 finalColor = lerp(float4(color.rgb, 1), float4(reflectionColor.rgb/2, 1), distanceFog);
	finalColor.rgb += specularColor.rgb;
	finalColor.rgb *= waterBrightness;
	finalColor.a *= waterAlpha;
	
	return finalColor;
}

////////////////////////////////////////////////////////////////////////////////
// Technique
////////////////////////////////////////////////////////////////////////////////
technique WaterTechnique
{
    pass pass0
    {
		VertexShader = compile vs_3_0 WaterVertexShader();
        PixelShader = compile ps_3_0 WaterPixelShader();
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