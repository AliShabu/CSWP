//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#include "mta-helper.fx"

texture ScreenSource;

float2 sunPos = float2(0, 0);
float godRayStartOffset = 1;
float godRayLength = 0;
float godRayStrength = 0;
float4 sunColor = float4(0, 0, 0, 1);
static int godRaySamples = 24;

sampler MainSampler = sampler_state
{
    Texture = <ScreenSource>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Mirror;
    AddressV = Mirror;
};

float4 darken(float4 color)
{
	float value = (color.r + color.g + color.b)/3;
	color.r = value;
	color.g = value;
	color.b = value;
	
	if(color.r <= 0.7){color.r = 0;}else{color.r = 1;}  
	if(color.g <= 0.7){color.g = 0;}else{color.g = 1;}
	if(color.b <= 0.7){color.b = 0;}else{color.b = 1;}
	if(color.r <= 0){color.a = 0;}
	if(color.g <= 0){color.a = 0;}
	if(color.b <= 0){color.a = 0;}
     
	return color;
}

float4 blur(float2 texCoords, float4 color)
{	
	texCoords -= sunPos;
	
    for(int i=0; i < godRaySamples; i++) {
    	float scale = godRayStartOffset + godRayLength * (i / (float)(godRaySamples - 1));
    	color += tex2D(MainSampler, texCoords * scale + sunPos );
   	}
	
	color /= godRaySamples + 1;
	
	float value = (color.r + color.g + color.b) / 3;
	color.r = value;
	color.g = value;
	color.b = value;
	
	if(color.r <= 0.7){color.a = 0;}
	if(color.g <= 0.7){color.a = 0;}
	if(color.b <= 0.7){color.a = 0;}
	
	color.a = 1;
	
	return color;
}

float4 GodRayPixelShader(float2 texCoords : TEXCOORD) : COLOR
{
	float4 color1 = tex2D(MainSampler, texCoords);
	float4 color2 = blur(texCoords, color1);
	float4 color3 = tex2D(MainSampler, texCoords);
	
	float4 finalColor = saturate(((color1 + color2) * sunColor) / 2);
	finalColor.a = godRayStrength;
	
	return finalColor;
}

technique GodRays
{
    pass Pass0
    {
		PixelShader = compile ps_2_0 GodRayPixelShader();
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