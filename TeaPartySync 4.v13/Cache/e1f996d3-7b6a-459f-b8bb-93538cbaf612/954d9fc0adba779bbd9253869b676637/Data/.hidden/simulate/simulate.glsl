#version 310 es

#define NODEFLEX 0 // Hack for now to know if a shader is running in Studio or on a released lens

#define SIMULATION_PASS

#define NF_PRECISION highp

#define SC_USE_USER_DEFINED_VS_MAIN

//-----------------------------------------------------------------------



//-----------------------------------------------------------------------


//-----------------------------------------------------------------------
// Standard defines
//-----------------------------------------------------------------------


#pragma paste_to_backend_at_the_top_begin
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#define SC_ENABLE_INSTANCED_RENDERING
#pragma paste_to_backend_at_the_top_end


//-----------------------------------------------------------------------
// Standard includes
//-----------------------------------------------------------------------

#include <std2.glsl>
#include <std2_vs.glsl>
#include <std2_texture.glsl>
#include <std2_receiver.glsl>
#include <std2_fs.glsl>
#include <std2_ssao.glsl>
#if (SC_BACKEND_LANGUAGE_VERSION >= 310) || defined (SC_BACKEND_LANGUAGE_METAL)
#if !SC_RT_RECEIVER_MODE
#include <std2_proxy.glsl>
#endif
#endif

//-----------------------------------------------------------------------
// Global defines
//-----------------------------------------------------------------------

#define SCENARIUM


#ifdef SC_BACKEND_LANGUAGE_MOBILE
#define MOBILE
#endif


#ifdef SC_BACKEND_LANGUAGE_GL
const bool DEVICE_IS_FAST = SC_DEVICE_CLASS >= SC_DEVICE_CLASS_C && bool(SC_GL_FRAGMENT_PRECISION_HIGH);
#else
const bool DEVICE_IS_FAST = SC_DEVICE_CLASS >= SC_DEVICE_CLASS_C;
#endif


const bool SC_ENABLE_SRGB_EMULATION_IN_SHADER = false;


//-----------------------------------------------------------------------
// Varyings
//-----------------------------------------------------------------------

varying vec4 varColor;

//-----------------------------------------------------------------------
// User includes
//-----------------------------------------------------------------------
#include "includes/utils.glsl"		
// in SC_RT_RECEIVER_MODE, the following headers cannot be included as they reference std2_fs_output functions: 
#if !SC_RT_RECEIVER_MODE
#include "includes/blend_modes.glsl"
#include "includes/oit.glsl" 
#endif
#include "includes/rgbhsl.glsl"
#include "includes/uniforms.glsl"

//-----------------------------------------------------------------------

// The next 60 or so lines of code are for debugging support, live tweaks, node previews, etc and will be included in a 
// shared glsl file.

//-----------------------------------------------------------------------

// Hack for now to know if a shader is running in Studio or on a released lens

#if !defined(MOBILE) && !NODEFLEX
#define STUDIO
#endif

//-----------------------------------------------------------------------

#if defined( SIMULATION_PASS )


#define ngsLocalAabbMin						vfxLocalAabbMin
#define ngsWorldAabbMin						vfxWorldAabbMin
#define ngsLocalAabbMax						vfxLocalAabbMax
#define ngsWorldAabbMax						vfxWorldAabbMax
#define ngsCameraAspect 					vfxCameraAspect
#define ngsCameraNear                       vfxCameraNear
#define ngsCameraFar                        vfxCameraFar
#define ngsCameraPosition                   vfxViewMatrixInverse[3].xyz
#define ngsModelMatrix                      vfxModelMatrix
#define ngsModelMatrixInverse               vfxModelMatrixInverse
#define ngsModelViewMatrix                  vfxModelViewMatrix
#define ngsModelViewMatrixInverse           vfxModelViewMatrixInverse
#define ngsProjectionMatrix                 vfxProjectionMatrix
#define ngsProjectionMatrixInverse          vfxProjectionMatrixInverse
#define ngsModelViewProjectionMatrix        vfxModelViewProjectionMatrix
#define ngsModelViewProjectionMatrixInverse vfxModelViewProjectionMatrixInverse
#define ngsViewMatrix                       vfxViewMatrix
#define ngsViewMatrixInverse                vfxViewMatrixInverse
#define ngsViewProjectionMatrix             vfxViewProjectionMatrix
#define ngsViewProjectionMatrixInverse      vfxViewProjectionMatrixInverse
#define ngsCameraUp 					    vfxCameraUp
#define ngsCameraForward                    -vfxCameraForward
#define ngsCameraRight                      vfxCameraRight
#define ngsFrame    	                    vfxFrame


#else


#define ngsLocalAabbMin						sc_LocalAabbMin
#define ngsWorldAabbMin						sc_WorldAabbMin
#define ngsLocalAabbMax						sc_LocalAabbMax
#define ngsWorldAabbMax						sc_WorldAabbMax
#define ngsCameraAspect 					sc_Camera.aspect;
#define ngsCameraNear                       sc_Camera.clipPlanes.x
#define ngsCameraFar                        sc_Camera.clipPlanes.y
#define ngsCameraPosition                   sc_Camera.position
#define ngsModelMatrix                      sc_ModelMatrix
#define ngsModelMatrixInverse               sc_ModelMatrixInverse
#define ngsModelViewMatrix                  sc_ModelViewMatrix
#define ngsModelViewMatrixInverse           sc_ModelViewMatrixInverse
#define ngsProjectionMatrix                 sc_ProjectionMatrix
#define ngsProjectionMatrixInverse          sc_ProjectionMatrixInverse
#define ngsModelViewProjectionMatrix        sc_ModelViewProjectionMatrix
#define ngsModelViewProjectionMatrixInverse sc_ModelViewProjectionMatrixInverse
#define ngsViewMatrix                       sc_ViewMatrix
#define ngsViewMatrixInverse                sc_ViewMatrixInverse
#define ngsViewProjectionMatrix             sc_ViewProjectionMatrix
#define ngsViewProjectionMatrixInverse      sc_ViewProjectionMatrixInverse
#define ngsCameraUp 					    sc_ViewMatrixInverse[1].xyz
#define ngsCameraForward                    -sc_ViewMatrixInverse[2].xyz
#define ngsCameraRight                      sc_ViewMatrixInverse[0].xyz
#define ngsFrame 		                    0


#endif

//-----------------------------------------------------------------------

// Time Overrides

uniform       int   overrideTimeEnabled;
uniform highp float overrideTimeElapsed;
uniform highp float overrideTimeDelta;

//-----------------------------------------------------------------------

#if defined( STUDIO )
#define ssConstOrUniformPrecision	uniform NF_PRECISION
#define ssConstOrUniform			uniform
#else
#define ssConstOrUniformPrecision   const
#define ssConstOrUniform    		const
#endif

//--------------------------------------------------------

// When compiling the shader for rendering in a node-based editor, we need any unconnected dynamic input port's value to
// be tweakable in real-time so we expose it to the engine as a uniform. If we're compiling the shader for a release build
// we use a literal or const value

#if defined( STUDIO )
#define NF_PORT_CONSTANT( xValue, xUniform )	xUniform
#else
#define NF_PORT_CONSTANT( xValue, xUniform )	xValue
#endif

//--------------------------------------------------------

#define float2   vec2
#define float3   vec3
#define float4   vec4
#define bool2    bvec2
#define bool3    bvec3
#define bool4    bvec4
#define float2x2 mat2
#define float3x3 mat3
#define float4x4 mat4

//--------------------------------------------------------

#define ssConditional( C, A, B ) ( ( C * 1.0 != 0.0 ) ? A : B )
#define ssEqual( A, B )          ( ( A == B ) ? 1.0 : 0.0 )
#define ssNotEqual( A, B )       ( ( A == B ) ? 0.0 : 1.0 )
#define ssLarger( A, B )         ( ( A > B ) ? 1.0 : 0.0 )
#define ssLargerOrEqual( A, B )  ( ( A >= B ) ? 1.0 : 0.0 )
#define ssSmaller( A,  B ) 		 ( ( A < B ) ? 1.0 : 0.0 )
#define ssSmallerOrEqual( A, B ) ( ( A <= B ) ? 1.0 : 0.0 )
#define ssNot( A ) 		         ( ( A * 1.0 != 0.0 ) ? 0.0 : 1.0 )

//--------------------------------------------------------

int ssIntMod( int x, int y )
{
	return x - y * ( x / y );
}

//--------------------------------------------------------

float ssSRGB_to_Linear( float value ) { return ( DEVICE_IS_FAST ) ? pow( value, 2.2 ) : value * value; }
vec2  ssSRGB_to_Linear( vec2  value ) { return ( DEVICE_IS_FAST ) ? vec2( pow( value.x, 2.2 ), pow( value.y, 2.2 ) ) : value * value; }
vec3  ssSRGB_to_Linear( vec3  value ) { return ( DEVICE_IS_FAST ) ? vec3( pow( value.x, 2.2 ), pow( value.y, 2.2 ), pow( value.z, 2.2 ) ) : value * value; }
vec4  ssSRGB_to_Linear( vec4  value ) { return ( DEVICE_IS_FAST ) ? vec4( pow( value.x, 2.2 ), pow( value.y, 2.2 ), pow( value.z, 2.2 ), pow( value.w, 2.2 ) ) : value * value; }

float ssLinear_to_SRGB( float value ) { return ( DEVICE_IS_FAST ) ? pow( value, 0.45454545 ) : sqrt( value ); }
vec2  ssLinear_to_SRGB( vec2  value ) { return ( DEVICE_IS_FAST ) ? vec2( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ) ) : sqrt( value ); }
vec3  ssLinear_to_SRGB( vec3  value ) { return ( DEVICE_IS_FAST ) ? vec3( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ), pow( value.z, 0.45454545 ) ) : sqrt( value ); }
vec4  ssLinear_to_SRGB( vec4  value ) { return ( DEVICE_IS_FAST ) ? vec4( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ), pow( value.z, 0.45454545 ), pow( value.w, 0.45454545 ) ) : sqrt( value ); }

//--------------------------------------------------------

float3 ssWorldToScreen( float3 Vector, mat4 ViewProjectionMatrix )
{
	float4 ScreenVector = ViewProjectionMatrix * float4( Vector, 1.0 );
	return ScreenVector.xyz / ScreenVector.w;
}

//--------------------------------------------------------

float  Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;

//--------------------------------------------------------

#define ssPRECISION_LIMITER( Value ) Value = floor( Value * 10000.0 ) * 0.0001;
#define ssPRECISION_LIMITER2( Value ) Value = floor( Value * 2000.0 + 0.5 ) * 0.0005;

float rand( vec2 Seed ) // old, used by shader graph...
{ 
	float RandomValue = dot( Seed.xy, vec2( 0.98253, 0.72662 ) );
	RandomValue = sin( RandomValue ) * 479.371;
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

//--------------------------------------------------------

float rand_float( float Seed )
{ 
	float RandomValue = Seed;
	RandomValue = sin( RandomValue ) * 479.371;
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

float rand_float( vec2 Seed ) { return rand_float( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
float rand_float( vec3 Seed ) { return rand_float( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
float rand_float( vec4 Seed ) { return rand_float( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec2 rand_vec2( float Seed )
{ 
	vec2 RandomValue = Seed * vec2( 0.457831, 0.623433 );
	RandomValue = sin( RandomValue ) * vec2( 479.371, 389.531 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec2 rand_vec2( vec2 Seed ) { return rand_vec2( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec2 rand_vec2( vec3 Seed ) { return rand_vec2( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec2 rand_vec2( vec4 Seed ) { return rand_vec2( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec3 rand_vec3( float Seed )
{ 
	vec3 RandomValue = Seed * vec3( 0.457831, 0.623433, 0.976253 );
	RandomValue = sin( RandomValue ) * vec3( 479.371, 389.531, 513.035 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec3 rand_vec3( vec2 Seed ) { return rand_vec3( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec3 rand_vec3( vec3 Seed ) { return rand_vec3( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec3 rand_vec3( vec4 Seed ) { return rand_vec3( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec4 rand_vec4( float Seed )
{ 
	vec4 RandomValue = Seed * vec4( 0.457831, 0.623433, 0.976253, 0.877913 );
	RandomValue = sin( RandomValue ) * vec4( 479.371, 389.531, 513.035, 397.895 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec4 rand_vec4( vec2 Seed ) { return rand_vec4( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec4 rand_vec4( vec3 Seed ) { return rand_vec4( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec4 rand_vec4( vec4 Seed ) { return rand_vec4( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

#define ssDELTA_TIME_MIN 0.00

//--------------------------------------------------------


vec4 EncodeFloat32( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc;
}

vec3 EncodeFloat24( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.rgb;
}

vec2 EncodeFloat16( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.rg;
}

float EncodeFloat8( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.r;
}

float DecodeFloat32( vec4 rgba /* 0 - 1 range only */, const bool Quantize ) 
{ 
	if ( Quantize ) 
	rgba = floor(rgba * 255.0 + 0.5) / 255.0;
	return dot( rgba, vec4(1.0, 1.0/255.0, 1.0/65025.0, 1.0/16581375.0) );
}

float DecodeFloat24( vec3 rgb /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	rgb = floor(rgb * 255.0 + 0.5) / 255.0;
	return dot( rgb, vec3(1.0, 1.0/255.0, 1.0/65025.0) );
}

float DecodeFloat16( vec2 rg /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	rg = floor(rg * 255.0 + 0.5) / 255.0;
	return dot( rg, vec2(1.0, 1.0/255.0) );
}

float DecodeFloat8( float r /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	r = floor(r * 255.0 + 0.5) / 255.0;
	return r;
}

#define ssDEFAULT_REMAP_RANGE 0.99999
#define ssDEFAULT_REMAP_RANGE2 1.0

vec4  remap (vec4 value, vec4 oldmin, vec4 oldmax, vec4 newmin, vec4 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
vec3  remap (vec3 value, vec3 oldmin, vec3 oldmax, vec3 newmin, vec3 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
vec2  remap (vec2 value, vec2 oldmin, vec2 oldmax, vec2 newmin, vec2 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
float remap (float value, float oldmin, float oldmax, float newmin, float newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
float remapTo01 (float value) { return (value + 1.0) * 0.5; }
float remapFrom01 (float value ) { return (value * 2.0) - 1.0; }

vec4  ssEncodeFloat32( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat32( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec4  ssEncodeFloat32( float Value, float Min, float Max )                     					  { return ssEncodeFloat32( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec4  ssEncodeFloat32( float Value, float RemapRange )                                            { return ssEncodeFloat32( Value, 0.0, 1.0, RemapRange ); }
vec3  ssEncodeFloat24( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat24( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec3  ssEncodeFloat24( float Value, float Min, float Max )                     					  { return ssEncodeFloat24( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec3  ssEncodeFloat24( float Value, float RemapRange )                                            { return ssEncodeFloat24( Value, 0.0, 1.0, RemapRange ); }
vec2  ssEncodeFloat16( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat16( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec2  ssEncodeFloat16( float Value, float Min, float Max )                     					  { return ssEncodeFloat16( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec2  ssEncodeFloat16( float Value, float RemapRange )                                            { return ssEncodeFloat16( Value, 0.0, 1.0, RemapRange ); }
float ssEncodeFloat8(  float Value, float Min, float Max, float RemapRange )                      { return remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ); }
float ssEncodeFloat8(  float Value, float Min, float Max )                     					  { return remap( clamp( Value, Min, Max ), Min, Max, 0.0, ssDEFAULT_REMAP_RANGE2 ); }
float ssEncodeFloat8(  float Value, float RemapRange )                                            { return ssEncodeFloat8( Value, 0.0, 1.0, RemapRange ); }

float ssDecodeFloat32(  vec4 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat32( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat32(  vec4 Value, float Min, float Max ) 										  { return ssDecodeFloat32( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat32(  vec4 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat32( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat24(  vec3 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat24( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat24(  vec3 Value, float Min, float Max ) 										  { return ssDecodeFloat24( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat24(  vec3 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat24( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat16(  vec2 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat16( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat16(  vec2 Value, float Min, float Max ) 										  { return ssDecodeFloat16( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat16(  vec2 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat16( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat8(  float Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat8( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat8(  float Value, float Min, float Max ) 										  { return ssDecodeFloat8( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE2); }
float ssDecodeFloat8(  float Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat8( Value, 0.0, 1.0, Quantize, RemapRange ); }

//--------------------------------------------------------


#if 0

struct ssPreviewInfo
{
	float4 Color;
	bool   Saved;
};

ssPreviewInfo PreviewInfo;

uniform NF_PRECISION int PreviewEnabled; // PreviewEnabled is set to 1 by the renderer when Lens Studio is rendering node previews
uniform NF_PRECISION int PreviewNodeID;  // PreviewNodeID is set to the node's ID that a preview is being rendered for

varying float4 PreviewVertexColor;
varying float  PreviewVertexSaved;

#define NF_DISABLE_VERTEX_CHANGES() 				( PreviewEnabled == 1 )		
#define NF_SETUP_PREVIEW_VERTEX()					PreviewInfo.Color = PreviewVertexColor = float4( 0.5 ); PreviewInfo.Saved = false; PreviewVertexSaved = 0.0;
#define NF_SETUP_PREVIEW_PIXEL()					PreviewInfo.Color = PreviewVertexColor; PreviewInfo.Saved = ( PreviewVertexSaved * 1.0 != 0.0 ) ? true : false;
#define NF_PREVIEW_SAVE( xCode, xNodeID, xAlpha ) 	if ( PreviewEnabled == 1 && !PreviewInfo.Saved && xNodeID == PreviewNodeID ) { PreviewInfo.Saved = true; { PreviewInfo.Color = xCode; if ( !xAlpha ) PreviewInfo.Color.a = 1.0; } }
#define NF_PREVIEW_FORCE_SAVE( xCode ) 				if ( PreviewEnabled == 0 ) { PreviewInfo.Saved = true; { PreviewInfo.Color = xCode; } }
#define NF_PREVIEW_OUTPUT_VERTEX()					if ( PreviewInfo.Saved ) { PreviewVertexColor = float4( PreviewInfo.Color.rgb, 1.0 ); PreviewVertexSaved = 1.0; }
#define NF_PREVIEW_OUTPUT_PIXEL()					if ( PreviewEnabled == 1 ) { if ( PreviewInfo.Saved ) { Output_Color0 = float4( PreviewInfo.Color ); } else { Output_Color0 = vec4( 0.0, 0.0, 0.0, 0.0 ); /*FinalColor.a = 1.0;*/ /* this will be an option later */ }  }

#else

#define NF_DISABLE_VERTEX_CHANGES()					false		
#define NF_SETUP_PREVIEW_VERTEX()
#define NF_SETUP_PREVIEW_PIXEL()
#define NF_PREVIEW_SAVE( xCode, xNodeID, xAlpha )
#define NF_PREVIEW_FORCE_SAVE( xCode )
#define NF_PREVIEW_OUTPUT_VERTEX()
#define NF_PREVIEW_OUTPUT_PIXEL()

#endif


//--------------------------------------------------------



//--------------------------------------------------------

float4 ssGetScreenPositionNDC( float4 vertexPosition, float3 transformedPosition, mat4 viewProjectionMatrix )
{
	float4 screenPosition = vec4( 0.0 );
	
	#ifdef VERTEX_SHADER
	
	if ( sc_RenderingSpace == SC_RENDERING_SPACE_SCREEN )
	{
		screenPosition = vertexPosition;
	}
	else
	{
		screenPosition = ( viewProjectionMatrix * float4( transformedPosition, 1.0 ) );
		screenPosition.xyz /= screenPosition.w;
	}
	
	#endif
	
	return screenPosition;
}

//--------------------------------------------------------

#ifdef FRAGMENT_SHADER

#define ngsAlphaTest( opacity )

#endif // #ifdef FRAGMENT_SHADER

#ifdef FRAGMENT_SHADER
#if !SC_RT_RECEIVER_MODE
vec4 ngsPixelShader( vec4 result ) 
{	
	if ( sc_ProjectiveShadowsCaster )
	{
		return evaluateShadowCasterColor( result );
	}
	else if ( sc_RenderAlphaToColor )
	{
		return vec4(result.a);
	}
	
	// Blending
	
	if ( sc_BlendMode_Custom )
	{				
		result = applyCustomBlend(result);
	}					
	else
	{
		result = sc_ApplyBlendModeModifications(result);
	}
	
	return result;
}
#endif
#endif


//-----------------------------------------------------------------------


//--------------------------------------------------------

SC_DECLARE_TEXTURE(renderTarget0);
SC_DECLARE_TEXTURE(renderTarget1);
SC_DECLARE_TEXTURE(renderTarget2);
SC_DECLARE_TEXTURE(renderTarget3);

//--------------------------------------------------------

uniform float       _sc_allow16TexturesMarker;
uniform highp vec3  vfxLocalAabbMin;
uniform highp vec3  vfxWorldAabbMin;
uniform highp vec3  vfxLocalAabbMax;
uniform highp vec3  vfxWorldAabbMax;
uniform highp float vfxCameraAspect;
uniform highp float vfxCameraNear;
uniform highp float vfxCameraFar;
uniform highp vec3  vfxCameraUp;
uniform highp vec3  vfxCameraForward;
uniform highp vec3  vfxCameraRight;
uniform highp mat4  vfxModelMatrix;
uniform highp mat4  vfxModelMatrixInverse;
uniform highp mat4  vfxModelViewMatrix;
uniform highp mat4  vfxModelViewMatrixInverse;
uniform highp mat4  vfxProjectionMatrix;
uniform highp mat4  vfxProjectionMatrixInverse;
uniform highp mat4  vfxModelViewProjectionMatrix;
uniform highp mat4  vfxModelViewProjectionMatrixInverse;
uniform highp mat4  vfxViewMatrix;
uniform highp mat4  vfxViewMatrixInverse;
uniform highp mat4  vfxViewProjectionMatrix;
uniform highp mat4  vfxViewProjectionMatrixInverse;
uniform       int   vfxFrame;

uniform int 		vfxOffsetInstances;		
uniform vec2 		ssTARGET_SIZE_INT;
uniform vec2 		ssTARGET_SIZE_FLOAT;
uniform float 		ssTARGET_WIDTH;
uniform int 		ssTARGET_WIDTH_INT;

//--------------------------------------------------------


#define ssTEXEL_COUNT_INT           6
#define ssTEXEL_COUNT_FLOAT         6.0
#define ssPARTICLE_COUNT_1D_INT		9000
#define ssPARTICLE_COUNT_1D_FLOAT	9000.0
#define ssPARTICLE_COUNT_2D_INT		ivec2( 341, 27 )
#define ssPARTICLE_COUNT_2D_FLOAT	float2( 341.0, 27.0 )
#define ssPARTICLE_LIFE_MAX 		float( 1.0 )
#define ssPARTICLE_TOTAL_LIFE_MAX 	float( 1.0 )
#define ssPARTICLE_BURST_GROUPS 	float( 1.0 )
#define ssPARTICLE_SPAWN_RATE 		float( 9000.0 )
#define ssPARTICLE_BURST_EVERY 		float( 0.142857 )
#define ssPARTICLE_DELAY_MAX        float( 0.5 )
#define ssPARTICLE_MASS_MAX         float( 100.0 )
#define ssPARTICLE_SIZE_MAX         float( 100.0 )


//--------------------------------------------------------


int    ssParticle_Index2D_to_Index1D( ivec2 Index2D )  { return Index2D.y * ssPARTICLE_COUNT_2D_INT.x + Index2D.x; }
ivec2  ssParticle_Index1D_to_Index2D( int Index1D )	   { return ivec2( Index1D % ssPARTICLE_COUNT_2D_INT.x, Index1D / ssPARTICLE_COUNT_2D_INT.x ); }
float  ssParticle_Index1D_to_Coord1D( int Index1D )    { return ( float( Index1D ) + 0.5 ) / ssPARTICLE_COUNT_1D_FLOAT; }
float  ssParticle_Index1D_to_Ratio1D( int Index1D )    { return float( Index1D ) / max( ssPARTICLE_COUNT_1D_FLOAT - 1.0, 1.0 ); }
float2 ssParticle_Index2D_to_Coord2D( ivec2 Index2D )  { return ( float2( Index2D ) + 0.5 ) / ssPARTICLE_COUNT_2D_FLOAT; }
float2 ssParticle_Index2D_to_Ratio2D( ivec2 Index2D )  { return float2( Index2D ) / max( ssPARTICLE_COUNT_2D_FLOAT - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) ); }
int    ssParticle_Coord1D_to_Index1D( float Coord1D )  { return int( Coord1D * ssPARTICLE_COUNT_1D_FLOAT ); }
ivec2  ssParticle_Coord2D_to_Index2D( float2 Coord2D ) { return ivec2( Coord2D * ssPARTICLE_COUNT_2D_FLOAT ); }	
float2 ssParticle_Index1D_to_Coord2D( int Index1D )    { return ssParticle_Index2D_to_Coord2D( ssParticle_Index1D_to_Index2D( Index1D ) ); }
float  ssParticle_Index2D_to_Coord1D( ivec2 Index2D )  { return ssParticle_Index1D_to_Coord1D( ssParticle_Index2D_to_Index1D( Index2D ) ); }
int    ssParticle_Coord2D_to_Index1D( float2 Coord2D ) { return ssParticle_Index2D_to_Index1D( ssParticle_Coord2D_to_Index2D( Coord2D ) ); }
ivec2  ssParticle_Coord1D_to_Index2D( float Coord1D )  { return ssParticle_Index1D_to_Index2D( ssParticle_Coord1D_to_Index1D( Coord1D ) ); }
float2 ssParticle_Coord1D_to_Coord2D( float Coord1D )  { return ssParticle_Index2D_to_Coord2D( ssParticle_Coord1D_to_Index2D( Coord1D ) ); }	
float  ssParticle_Coord2D_to_Coord1D( float2 Coord2D ) { return ssParticle_Index1D_to_Coord1D( ssParticle_Coord2D_to_Index1D( Coord2D ) ); }


//--------------------------------------------------------


struct ssParticle
{
	// Feedback Attributes
	
	vec3  Position;
	vec3  Velocity;
	vec4  Color;
	float Size;
	float Age;
	float Life;
	float Mass;
	mat3  Matrix;
	vec4  Quaternion;
	float Dead;
	
	// Custom
	
	
	
	// Calculated
	
	float SpawnOffset;
	float Seed;
	vec2  Seed2000;
	float TimeShift;
	int   Index1D;
	float Coord1D;
	float Ratio1D;
	ivec2 Index2D;
	vec2  Coord2D;
	vec2  Ratio2D;
	vec3  Force;
	bool  Spawned;
};


//--------------------------------------------------------


void ssCalculateParticleSeed( inout ssParticle Particle )
{
	#if 0
	// Spawn Once - Live Forever
	//Particle.Seed = rand( vec2( Particle.Ratio1D + 0.141435 ) * 0.6789 );	
	Particle.Seed = Particle.Ratio1D * 0.976379 + 0.151235;
	ivec2 Index2D = ivec2( Particle.Index1D % 400, Particle.Index1D / 400 );	
	Particle.Seed2000 = ( vec2( Index2D ) + vec2( 1.0, 1.0 ) ) / max( vec2( 400.0, 400.0 ) - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) );
	#else
	// Any time max life is used
	float ElapsedTime = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	
	Particle.Seed = Particle.Ratio1D * 0.976379 + 0.151235;
	Particle.Seed = Particle.Seed + floor( ( ElapsedTime - Particle.SpawnOffset - 0.0 /*delay*/ + 0.0 /*warmup*/  + ssPARTICLE_TOTAL_LIFE_MAX * 2.0 ) / ssPARTICLE_TOTAL_LIFE_MAX ) * 4.32723;
	Particle.Seed = fract( abs( Particle.Seed ) );
	ivec2 Index2D = ivec2( Particle.Index1D % 400, Particle.Index1D / 400 );	
	Particle.Seed2000 = ( vec2( Index2D ) + vec2( 1.0, 1.0 ) ) / max( vec2( 400.0, 400.0 ) - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) );
	#endif
	
	//ssPRECISION_LIMITER( Particle.Seed )
}


//--------------------------------------------------------


void ssCalculateDynamicAttributes( int InstanceID, inout ssParticle Particle )
{
	Particle.Spawned     = false;
	Particle.Force       = vec3( 0.0 );
	Particle.Index1D     = InstanceID;
	Particle.Index2D     = ssParticle_Index1D_to_Index2D( Particle.Index1D );
	Particle.Coord1D     = ssParticle_Index1D_to_Coord1D( Particle.Index1D );
	Particle.Coord2D     = ssParticle_Index2D_to_Coord2D( Particle.Index2D );
	Particle.Ratio1D     = ssParticle_Index1D_to_Ratio1D( Particle.Index1D );
	Particle.Ratio2D     = ssParticle_Index2D_to_Ratio2D( Particle.Index2D );
	Particle.Seed        = 0.0;
	
	#if 1
	Particle.TimeShift   = rand( vec2( Particle.Ratio1D ) * vec2( 0.3452, 0.52254 ) );
	Particle.SpawnOffset = Particle.Ratio1D * ssPARTICLE_LIFE_MAX;
	#elif  0
	Particle.TimeShift   = 0.0;
	Particle.SpawnOffset = float( Particle.Index1D / int( ssPARTICLE_SPAWN_RATE ) ) * ssPARTICLE_BURST_EVERY;
	#else
	Particle.TimeShift   = 0.0;
	Particle.SpawnOffset = 0.0;
	#endif
	
	ssCalculateParticleSeed( Particle );
}


//--------------------------------------------------------


vec4 ssGetParticleRandom( int Dimension, bool UseTime, bool UseNodeID, bool UseParticleID, float NodeID, vec2 ParticleSeed, float ExtraSeed, float Time )
{
	vec4  Random          = vec4( 0.0 );
	vec4  TimeRatio       = vec4( 1.0 );
	float NodeRatio       = 1.0;
	vec2  ParticleIDRatio = vec2(1.0);
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseTime )
	{
		TimeRatio = vec4( fract( Time * 10.0 ) ); 
		ssPRECISION_LIMITER( TimeRatio )
		TimeRatio = vec4( 0.3234, 0.6574, 0.2258, 0.8763 ) + TimeRatio;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseNodeID )
	{
		NodeRatio = 1.0 + ( NodeID + 1.0 ) * 0.01; /* don't use node count */
		//ssPRECISION_LIMITER( NodeRatio )
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseParticleID )
	{
		ParticleIDRatio = ParticleSeed;
	}
	
	ExtraSeed = ( ExtraSeed + 1.0 ) * 0.5;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( Dimension >= 1 )
	{
		Random.x = rand( vec2( 0.2353, 0.7875 ) * ParticleIDRatio * NodeRatio * TimeRatio.x * ExtraSeed );
	}
	
	if ( Dimension >= 2 )
	{
		Random.y = rand( vec2( 0.5751, 0.6273 ) * ParticleIDRatio * NodeRatio * TimeRatio.y * ExtraSeed ); 
	}
	
	if ( Dimension >= 3 )
	{
		Random.z = rand( vec2( 0.6947, 0.5217 ) * ParticleIDRatio * NodeRatio * TimeRatio.z * ExtraSeed );
	}
	
	if ( Dimension >= 4 )
	{
		Random.w = rand( vec2( 0.4789, 0.3967 ) * ParticleIDRatio * NodeRatio * TimeRatio.w * ExtraSeed );
	}
	
	return Random;
}


//--------------------------------------------------------


ssParticle gParticle;


//-----------------------------------------------------------------------


highp vec4  Output_Color0;
highp vec4  Output_Color1;
highp vec4  Output_Color2;
highp vec4  Output_Color3;
highp float Output_Depth;


//-----------------------------------------------------------------------


flat varying highp int Interp_Particle_Index;
varying highp vec3     Interp_Particle_Force;
varying highp vec2     Interp_Particle_Coord;

varying highp float Interp_Particle_Size;
varying highp float Interp_Particle_Life;
varying highp float Interp_Particle_Age;
varying highp mat3 Interp_Particle_Matrix;
varying highp float4 Interp_Particle_Color;
varying highp float3 Interp_Particle_Position;
varying highp float3 Interp_Particle_Velocity;
varying highp float Interp_Particle_Dead;



//--------------------------------------------------------


#ifdef asdf_____USE_16_BIT_TEXTURES
#define ssENCODE_TO_TARGET0( Value, Min, Max ) fragOut[0] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET1( Value, Min, Max ) fragOut[1] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET2( Value, Min, Max ) fragOut[2] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET3( Value, Min, Max ) fragOut[3] = remap( Value, 0, 65534 );
#else
#define ssENCODE_TO_TARGET0( Value, Min, Max ) rt0 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET1( Value, Min, Max ) rt1 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET2( Value, Min, Max ) rt2 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET3( Value, Min, Max ) rt3 = ssEncodeFloat32( Value, Min, Max );
#endif


//-----------------------------------------------------------------------


int ngsModInt( int x, int y )
{
	return x - ( ( x / y ) * y );
}


//-----------------------------------------------------------------------


void ssDecodeParticle( int InstanceID )
{
	gParticle.Position   = vec3( 0.0 );
	gParticle.Velocity   = vec3( 0.0 );
	gParticle.Color      = vec4( 0.0 );
	gParticle.Size       = 0.0; 
	gParticle.Age        = 0.0;
	gParticle.Life       = 0.0;
	gParticle.Mass       = 1.0;
	gParticle.Quaternion = vec4( 0.0 );
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssCalculateDynamicAttributes( InstanceID, gParticle );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	int offsetPixelId = (vfxOffsetInstances + InstanceID) * ssTEXEL_COUNT_INT;
	ivec2  Index2D = ivec2( ngsModInt( offsetPixelId, ssTARGET_WIDTH_INT ), offsetPixelId / ssTARGET_WIDTH_INT );
	float2 Coord   = ( float2( Index2D ) + 0.5 ) / float2(2048.0, ssTARGET_SIZE_FLOAT.y);	
	float2 Offset  = float2( 1.0 / 2048.0, 0.0 ); 			
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	vec2  uv    = vec2( 0.0 );
	float Scalar0 = 0.0;
	float Scalar1 = 0.0;
	float Scalar2 = 0.0;
	float Scalar3 = 0.0;
	float Scalar4 = 0.0;
	float Scalar5 = 0.0;
	float Scalar6 = 0.0;
	float Scalar7 = 0.0;
	float Scalar8 = 0.0;
	float Scalar9 = 0.0;
	float Scalar10 = 0.0;
	float Scalar11 = 0.0;
	float Scalar12 = 0.0;
	float Scalar13 = 0.0;
	float Scalar14 = 0.0;
	float Scalar15 = 0.0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 0.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Size = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 120.0 );
	gParticle.Life = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 1.0 );
	gParticle.Age = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), 0.0, 1.0 );
	gParticle.Matrix[0].x = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -100.0, 100.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 1.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Matrix[0].y = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -100.0, 100.0 );
	gParticle.Matrix[0].z = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -100.0, 100.0 );
	gParticle.Matrix[1].x = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -100.0, 100.0 );
	gParticle.Matrix[1].y = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -100.0, 100.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 2.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Matrix[1].z = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -100.0, 100.0 );
	gParticle.Matrix[2].x = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -100.0, 100.0 );
	gParticle.Matrix[2].y = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -100.0, 100.0 );
	gParticle.Matrix[2].z = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -100.0, 100.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 3.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Color.x = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 1.0 );
	gParticle.Color.y = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 1.0 );
	gParticle.Color.z = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), 0.0, 1.0 );
	gParticle.Color.w = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), 0.0, 1.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 4.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Position.x = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -1000.0, 1000.0 );
	gParticle.Position.y = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -1000.0, 1000.0 );
	gParticle.Position.z = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -1000.0, 1000.0 );
	gParticle.Velocity.x = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -1000.0, 1000.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 5.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Velocity.y = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -1000.0, 1000.0 );
	gParticle.Velocity.z = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -1000.0, 1000.0 );
	gParticle.Dead = ssDecodeFloat8( Scalar8, 0.0, 255.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssPRECISION_LIMITER2( gParticle.Velocity )
	ssPRECISION_LIMITER2( gParticle.Position )
	ssPRECISION_LIMITER2( gParticle.Color )
	ssPRECISION_LIMITER2( gParticle.Size )
	ssPRECISION_LIMITER2( gParticle.Mass )
	ssPRECISION_LIMITER2( gParticle.Life )
}


//--------------------------------------------------------


void ssEncodeParticle( float2 Coord, out vec4 rt0, out vec4 rt1, out vec4 rt2, out vec4 rt3 )
{
	#ifdef FRAGMENT_SHADER
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	int TexelIndex = int( floor( Coord.x * ssTEXEL_COUNT_FLOAT ) );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	vec4  Vector = vec4( 0.0 );
	float Scalar0 = 0.0;
	float Scalar1 = 0.0;
	float Scalar2 = 0.0;
	float Scalar3 = 0.0;
	float Scalar4 = 0.0;
	float Scalar5 = 0.0;
	float Scalar6 = 0.0;
	float Scalar7 = 0.0;
	float Scalar8 = 0.0;
	float Scalar9 = 0.0;
	float Scalar10 = 0.0;
	float Scalar11 = 0.0;
	float Scalar12 = 0.0;
	float Scalar13 = 0.0;
	float Scalar14 = 0.0;
	float Scalar15 = 0.0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( TexelIndex == 0 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Size, 0.0, 120.0 );           Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Life, 0.0, 1.0 );             Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Age, 0.0, 1.0 );              Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].x, -100.0, 100.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 1 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].y, -100.0, 100.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].z, -100.0, 100.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].x, -100.0, 100.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].y, -100.0, 100.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 2 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].z, -100.0, 100.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].x, -100.0, 100.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].y, -100.0, 100.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].z, -100.0, 100.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 3 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.x, 0.0, 1.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.y, 0.0, 1.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.z, 0.0, 1.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.w, 0.0, 1.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 4 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.x, -1000.0, 1000.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.y, -1000.0, 1000.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.z, -1000.0, 1000.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.x, -1000.0, 1000.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 5 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.y, -1000.0, 1000.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.z, -1000.0, 1000.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.x = ssEncodeFloat8( gParticle.Dead, 0.0, 255.0 );                Scalar8 = Vector.x;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	rt0 = vec4( Scalar0,  Scalar1,  Scalar2,  Scalar3 ); 
	rt1 = vec4( Scalar4,  Scalar5,  Scalar6,  Scalar7 ); 
	rt2 = vec4( Scalar8,  Scalar9,  Scalar10, Scalar11 ); 
	rt3 = vec4( Scalar12, Scalar13, Scalar14, Scalar15 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	//rt0 = rt1 = rt2 = rt3 = vec4( float( TexelIndex ) / max( ssTEXEL_COUNT_FLOAT - 1.0, 1.0 ), 0.0, 0.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#endif
}


//-----------------------------------------------------------------------

#ifndef saturate // HACK 05/15/2019: SAMPLETEX() uses saturate(), but core doesn't define it. This can be removed after Core 10.59.
#define saturate(A) clamp(A, 0.0, 1.0)
#endif

//-----------------------------------------------------------------------


// Material Parameters ( Tweaks )

uniform NF_PRECISION float3 direction; // Title: Direction
uniform NF_PRECISION float4 Tweak_N26; // Title: Color Min Start
uniform NF_PRECISION float4 Tweak_N27; // Title: Color Max Start
uniform NF_PRECISION float  LifeParam; // Title: Life	


// Uniforms ( Ports )

#if defined( STUDIO )
uniform NF_PRECISION float3 Port_Import_N011;
uniform NF_PRECISION float Port_Input1_N324;
uniform NF_PRECISION float Port_Input1_N323;
uniform NF_PRECISION float3 Port_Import_N013;
uniform NF_PRECISION float2 Port_Import_N375;
uniform NF_PRECISION float Port_Value1_N017;
uniform NF_PRECISION float Port_Import_N166;
uniform NF_PRECISION float Port_Input1_N016;
uniform NF_PRECISION float2 Port_Max_N083;
uniform NF_PRECISION float Port_Import_N086;
uniform NF_PRECISION float Port_Import_N087;
uniform NF_PRECISION float Port_Value3_N309;
uniform NF_PRECISION float3 Port_Import_N103;
uniform NF_PRECISION float Port_TimeBias_N002;
uniform NF_PRECISION float Port_ValueA_N002;
uniform NF_PRECISION float Port_TimeA_N002;
uniform NF_PRECISION float Port_TimeTransition_N002;
uniform NF_PRECISION float Port_ValueB_N002;
uniform NF_PRECISION float Port_TimeB_N002;
uniform NF_PRECISION float Port_Import_N105;
uniform NF_PRECISION float3 Port_Import_N139;
uniform NF_PRECISION float3 Port_Import_N140;
uniform NF_PRECISION float Port_Import_N092;
uniform NF_PRECISION float Port_Import_N020;
uniform NF_PRECISION float Port_Import_N029;
uniform NF_PRECISION float Port_Input0_N032;
uniform NF_PRECISION float Port_Min_N062;
uniform NF_PRECISION float Port_Max_N062;
uniform NF_PRECISION float Port_Import_N022;
uniform NF_PRECISION float Port_Import_N031;
uniform NF_PRECISION float Port_Input1_N034;
uniform NF_PRECISION float Port_Input2_N034;
uniform NF_PRECISION float Port_Input0_N037;
uniform NF_PRECISION float Port_Min_N063;
uniform NF_PRECISION float Port_Max_N063;
uniform NF_PRECISION float Port_Import_N026;
uniform NF_PRECISION float Port_Import_N036;
uniform NF_PRECISION float Port_Input1_N041;
uniform NF_PRECISION float Port_Input2_N041;
#endif	



//-----------------------------------------------------------------------

#ifdef VERTEX_SHADER

//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	
};

ssGlobals tempGlobals;
#define scCustomCodeUniform	

//----------

// Functions

void Node61_Spawn_Particle_Local_Space( ssGlobals Globals )
{ 
	ssCalculateParticleSeed( gParticle );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	float DividerF = floor( sqrt( ssPARTICLE_COUNT_1D_FLOAT ) );
	int   DividerI = int( DividerF );
	
	gParticle.Position   = vec3( float( ngsModInt( gParticle.Index1D, DividerI ) ) / DividerF * 2.0 - 1.0, float( gParticle.Index1D / DividerI ) / DividerF * 2.0 - 1.0, 0.0 ) * 20.0 + vec3( 1.0, 1.0, 0.0 );
	gParticle.Velocity   = vec3( 0.0 );
	gParticle.Color	     = vec4( 1.0 ); 
	gParticle.Dead       = 0.0;
	gParticle.Age        = 0.0;
	gParticle.Life       = ssPARTICLE_LIFE_MAX;  
	gParticle.Size       = 1.0;//mix( 0.4, 0.8, rand( vec2( gParticle.Seed, 0.3453 ) ) );
	gParticle.Mass	     = 1.0; 
	gParticle.Quaternion = vec4( 0.0, 0.0, 0.0, 1.0 );
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
}
#define Node11_Float_Import( Import, Value, Globals ) Value = Import
#define Node12_Droplist_Import( Value, Globals ) Value = 0.0
#define Node324_Is_Equal( Input0, Input1, Output, Globals ) Output = ssEqual( Input0, Input1 )
#define Node323_Is_Equal( Input0, Input1, Output, Globals ) Output = ssEqual( Input0, Input1 )
#define Node331_Or( A, B, Result, Globals ) Result = ( ( A * 1.0 != 0.0 ) || ( B * 1.0 != 0.0 ) ) ? 1.0 : 0.0
#define Node13_Float_Import( Import, Value, Globals ) Value = Import
#define Node375_Float_Import( Import, Value, Globals ) Value = Import
#define Node376_Radians( Input0, Output, Globals ) Output = radians( Input0 )
void Node377_Split_Vector( in float2 Value, out float Value1, out float Value2, ssGlobals Globals )
{ 
	Value1 = Value.x;
	Value2 = Value.y;
}
void Node378_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 378.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node301_Sin( Input0, Output, Globals ) Output = sin( Input0 )
#define Node302_Cos( Input0, Output, Globals ) Output = cos( Input0 )
#define Node166_Float_Import( Import, Value, Globals ) Value = clamp( Import, 0.0, 1.0 )
#define Node14_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
#define Node16_Pow( Input0, Input1, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : pow( Input0, Input1 )
#define Node17_Construct_Vector( Value1, Value2, Value, Globals ) Value.x = Value1; Value.y = Value2
void Node83_Particle_Random( in float2 Min, in float2 Max, out float2 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 2, true, true, true, 83.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xy );
}
void Node84_Split_Vector( in float2 Value, out float Value1, out float Value2, ssGlobals Globals )
{ 
	Value1 = Value.x;
	Value2 = Value.y;
}
#define Node310_Construct_Vector( Value1, Value2, Value3, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3
#define Node86_Float_Import( Import, Value, Globals ) Value = Import
#define Node87_Float_Import( Import, Value, Globals ) Value = Import
#define Node322_Construct_Vector( Value1, Value2, Value3, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3
#define Node308_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
#define Node309_Construct_Vector( Value1, Value2, Value3, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3
#define Node321_Multiply( Input0, Input1, Input2, Input3, Output, Globals ) Output = Input0 * Input1 * Input2 * Input3
#define Node329_Swizzle( Input, Output, Globals ) Output = float3( Input.z, Input.x, Input.y )
#define Node330_Swizzle( Input, Output, Globals ) Output = float3( Input.x, Input.z, Input.y )
void Node326_If_else( in float Bool1, in float4 Value1, in float4 Default, out float4 Result, ssGlobals Globals )
{ 
	/* Input port: "Bool1"  */
	
	{
		float Value_N12 = 0.0; Node12_Droplist_Import( Value_N12, Globals );
		float Output_N324 = 0.0; Node324_Is_Equal( Value_N12, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N324 ), Output_N324, Globals );
		
		Bool1 = Output_N324;
	}
	if ( bool( Bool1 * 1.0 != 0.0 ) )
	{
		/* Input port: "Value1"  */
		
		{
			float3 Value_N13 = float3(0.0); Node13_Float_Import( NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Import_N013 ), Value_N13, Globals );
			float2 Value_N375 = float2(0.0); Node375_Float_Import( NF_PORT_CONSTANT( float2( 0.0, 360.0 ), Port_Import_N375 ), Value_N375, Globals );
			float2 Output_N376 = float2(0.0); Node376_Radians( Value_N375, Output_N376, Globals );
			float Value1_N377 = 0.0; float Value2_N377 = 0.0; Node377_Split_Vector( Output_N376, Value1_N377, Value2_N377, Globals );
			float Random_N378 = 0.0; Node378_Particle_Random( Value1_N377, Value2_N377, Random_N378, Globals );
			float Output_N301 = 0.0; Node301_Sin( Random_N378, Output_N301, Globals );
			float Output_N302 = 0.0; Node302_Cos( Random_N378, Output_N302, Globals );
			float Value_N166 = 0.0; Node166_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N166 ), Value_N166, Globals );
			float Output_N14 = 0.0; Node14_One_Minus( Value_N166, Output_N14, Globals );
			float Output_N16 = 0.0; Node16_Pow( Output_N14, NF_PORT_CONSTANT( float( 2.0 ), Port_Input1_N016 ), Output_N16, Globals );
			float2 Value_N17 = float2(0.0); Node17_Construct_Vector( NF_PORT_CONSTANT( float( -1.0 ), Port_Value1_N017 ), Output_N16, Value_N17, Globals );
			float2 Random_N83 = float2(0.0); Node83_Particle_Random( Value_N17, NF_PORT_CONSTANT( float2( 1.0, 1.0 ), Port_Max_N083 ), Random_N83, Globals );
			float Value1_N84 = 0.0; float Value2_N84 = 0.0; Node84_Split_Vector( Random_N83, Value1_N84, Value2_N84, Globals );
			float3 Value_N310 = float3(0.0); Node310_Construct_Vector( Output_N301, Output_N302, Value1_N84, Value_N310, Globals );
			float Value_N86 = 0.0; Node86_Float_Import( NF_PORT_CONSTANT( float( 45.0 ), Port_Import_N086 ), Value_N86, Globals );
			float Value_N87 = 0.0; Node87_Float_Import( NF_PORT_CONSTANT( float( 22.0 ), Port_Import_N087 ), Value_N87, Globals );
			float3 Value_N322 = float3(0.0); Node322_Construct_Vector( Value_N86, Value_N86, Value_N87, Value_N322, Globals );
			float Output_N308 = 0.0; Node308_Sqrt( Value2_N84, Output_N308, Globals );
			float3 Value_N309 = float3(0.0); Node309_Construct_Vector( Output_N308, Output_N308, NF_PORT_CONSTANT( float( 1.0 ), Port_Value3_N309 ), Value_N309, Globals );
			float3 Output_N321 = float3(0.0); Node321_Multiply( Value_N13, Value_N310, Value_N322, Value_N309, Output_N321, Globals );
			float3 Output_N329 = float3(0.0); Node329_Swizzle( Output_N321, Output_N329, Globals );
			
			Value1 = float4( Output_N329.xyz, 0.0 );
		}
		Result = Value1;
	}
	else
	{
		/* Input port: "Default"  */
		
		{
			float3 Value_N13 = float3(0.0); Node13_Float_Import( NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Import_N013 ), Value_N13, Globals );
			float2 Value_N375 = float2(0.0); Node375_Float_Import( NF_PORT_CONSTANT( float2( 0.0, 360.0 ), Port_Import_N375 ), Value_N375, Globals );
			float2 Output_N376 = float2(0.0); Node376_Radians( Value_N375, Output_N376, Globals );
			float Value1_N377 = 0.0; float Value2_N377 = 0.0; Node377_Split_Vector( Output_N376, Value1_N377, Value2_N377, Globals );
			float Random_N378 = 0.0; Node378_Particle_Random( Value1_N377, Value2_N377, Random_N378, Globals );
			float Output_N301 = 0.0; Node301_Sin( Random_N378, Output_N301, Globals );
			float Output_N302 = 0.0; Node302_Cos( Random_N378, Output_N302, Globals );
			float Value_N166 = 0.0; Node166_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N166 ), Value_N166, Globals );
			float Output_N14 = 0.0; Node14_One_Minus( Value_N166, Output_N14, Globals );
			float Output_N16 = 0.0; Node16_Pow( Output_N14, NF_PORT_CONSTANT( float( 2.0 ), Port_Input1_N016 ), Output_N16, Globals );
			float2 Value_N17 = float2(0.0); Node17_Construct_Vector( NF_PORT_CONSTANT( float( -1.0 ), Port_Value1_N017 ), Output_N16, Value_N17, Globals );
			float2 Random_N83 = float2(0.0); Node83_Particle_Random( Value_N17, NF_PORT_CONSTANT( float2( 1.0, 1.0 ), Port_Max_N083 ), Random_N83, Globals );
			float Value1_N84 = 0.0; float Value2_N84 = 0.0; Node84_Split_Vector( Random_N83, Value1_N84, Value2_N84, Globals );
			float3 Value_N310 = float3(0.0); Node310_Construct_Vector( Output_N301, Output_N302, Value1_N84, Value_N310, Globals );
			float Value_N86 = 0.0; Node86_Float_Import( NF_PORT_CONSTANT( float( 45.0 ), Port_Import_N086 ), Value_N86, Globals );
			float Value_N87 = 0.0; Node87_Float_Import( NF_PORT_CONSTANT( float( 22.0 ), Port_Import_N087 ), Value_N87, Globals );
			float3 Value_N322 = float3(0.0); Node322_Construct_Vector( Value_N86, Value_N86, Value_N87, Value_N322, Globals );
			float Output_N308 = 0.0; Node308_Sqrt( Value2_N84, Output_N308, Globals );
			float3 Value_N309 = float3(0.0); Node309_Construct_Vector( Output_N308, Output_N308, NF_PORT_CONSTANT( float( 1.0 ), Port_Value3_N309 ), Value_N309, Globals );
			float3 Output_N321 = float3(0.0); Node321_Multiply( Value_N13, Value_N310, Value_N322, Value_N309, Output_N321, Globals );
			float3 Output_N330 = float3(0.0); Node330_Swizzle( Output_N321, Output_N330, Globals );
			
			Default = float4( Output_N330.xyz, 0.0 );
		}
		Result = Default;
	}
}
void Node332_If_else( in float Bool1, in float4 Value1, in float4 Default, out float4 Result, ssGlobals Globals )
{ 
	/* Input port: "Bool1"  */
	
	{
		float Value_N12 = 0.0; Node12_Droplist_Import( Value_N12, Globals );
		float Output_N324 = 0.0; Node324_Is_Equal( Value_N12, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N324 ), Output_N324, Globals );
		float Output_N323 = 0.0; Node323_Is_Equal( Value_N12, NF_PORT_CONSTANT( float( 1.0 ), Port_Input1_N323 ), Output_N323, Globals );
		float Result_N331 = 0.0; Node331_Or( Output_N324, Output_N323, Result_N331, Globals );
		
		Bool1 = Result_N331;
	}
	if ( bool( Bool1 * 1.0 != 0.0 ) )
	{
		/* Input port: "Value1"  */
		
		{
			float4 Result_N326 = float4(0.0); Node326_If_else( float( 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), Result_N326, Globals );
			
			Value1 = Result_N326;
		}
		Result = Value1;
	}
	else
	{
		/* Input port: "Default"  */
		
		{
			float3 Value_N13 = float3(0.0); Node13_Float_Import( NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Import_N013 ), Value_N13, Globals );
			float2 Value_N375 = float2(0.0); Node375_Float_Import( NF_PORT_CONSTANT( float2( 0.0, 360.0 ), Port_Import_N375 ), Value_N375, Globals );
			float2 Output_N376 = float2(0.0); Node376_Radians( Value_N375, Output_N376, Globals );
			float Value1_N377 = 0.0; float Value2_N377 = 0.0; Node377_Split_Vector( Output_N376, Value1_N377, Value2_N377, Globals );
			float Random_N378 = 0.0; Node378_Particle_Random( Value1_N377, Value2_N377, Random_N378, Globals );
			float Output_N301 = 0.0; Node301_Sin( Random_N378, Output_N301, Globals );
			float Output_N302 = 0.0; Node302_Cos( Random_N378, Output_N302, Globals );
			float Value_N166 = 0.0; Node166_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N166 ), Value_N166, Globals );
			float Output_N14 = 0.0; Node14_One_Minus( Value_N166, Output_N14, Globals );
			float Output_N16 = 0.0; Node16_Pow( Output_N14, NF_PORT_CONSTANT( float( 2.0 ), Port_Input1_N016 ), Output_N16, Globals );
			float2 Value_N17 = float2(0.0); Node17_Construct_Vector( NF_PORT_CONSTANT( float( -1.0 ), Port_Value1_N017 ), Output_N16, Value_N17, Globals );
			float2 Random_N83 = float2(0.0); Node83_Particle_Random( Value_N17, NF_PORT_CONSTANT( float2( 1.0, 1.0 ), Port_Max_N083 ), Random_N83, Globals );
			float Value1_N84 = 0.0; float Value2_N84 = 0.0; Node84_Split_Vector( Random_N83, Value1_N84, Value2_N84, Globals );
			float3 Value_N310 = float3(0.0); Node310_Construct_Vector( Output_N301, Output_N302, Value1_N84, Value_N310, Globals );
			float Value_N86 = 0.0; Node86_Float_Import( NF_PORT_CONSTANT( float( 45.0 ), Port_Import_N086 ), Value_N86, Globals );
			float Value_N87 = 0.0; Node87_Float_Import( NF_PORT_CONSTANT( float( 22.0 ), Port_Import_N087 ), Value_N87, Globals );
			float3 Value_N322 = float3(0.0); Node322_Construct_Vector( Value_N86, Value_N86, Value_N87, Value_N322, Globals );
			float Output_N308 = 0.0; Node308_Sqrt( Value2_N84, Output_N308, Globals );
			float3 Value_N309 = float3(0.0); Node309_Construct_Vector( Output_N308, Output_N308, NF_PORT_CONSTANT( float( 1.0 ), Port_Value3_N309 ), Value_N309, Globals );
			float3 Output_N321 = float3(0.0); Node321_Multiply( Value_N13, Value_N310, Value_N322, Value_N309, Output_N321, Globals );
			
			Default = float4( Output_N321.xyz, 0.0 );
		}
		Result = Default;
	}
}
#define Node228_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node229_Modify_Attribute_Set_Position( Value, Globals ) gParticle.Position = Value
void Node1_Float_Parameter( out float3 Output, ssGlobals Globals ) { Output = direction; }
#define Node103_Float_Import( Import, Value, Globals ) Value = Import
void Node104_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
void Node2_Fluctuate( in float TimeBias, in float ValueA, in float TimeA, in float TimeTransition, in float ValueB, in float TimeB, out float Value, ssGlobals Globals )
{ 
	float TimeTotal  = TimeA + TimeTransition + TimeB + 0.0001; // increase by small amount since smoothstep( 0.5, 0.5, x ) acts weird...
	float TimeRatio1 = TimeA / TimeTotal;
	float TimeRatio2 = 1.0 - TimeB / TimeTotal;
	float Transition = mod( Globals.gTimeElapsedShifted / TimeTotal + TimeBias, 1.0 ) * 2.0 - 1.0;
	float Ratio 	 = abs( Transition );
	Value = mix( ValueA, ValueB, smoothstep( TimeRatio1, TimeRatio2, Ratio ) );
}
#define Node105_Float_Import( Import, Value, Globals ) Value = Import
#define Node106_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float3(Input1)
#define Node107_Modify_Attribute_Add_Force( Value, Globals ) gParticle.Force += Value
void Node58_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = Tweak_N26; }
void Node59_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = Tweak_N27; }
void Node60_Particle_Random( in float4 Min, in float4 Max, out float4 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 4, false, true, true, 60.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4 );
}
#define Node57_Modify_Attribute_Set_Color( Value, Globals ) gParticle.Color = Value
#define Node139_Float_Import( Import, Value, Globals ) Value = Import
#define Node140_Float_Import( Import, Value, Globals ) Value = Import
void Node141_Particle_Random( in float3 Min, in float3 Max, out float3 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 3, true, true, true, 141.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xyz );
}
void Node142_Construct_Matrix( in float3 RotationXYZ, out mat3 Matrix, ssGlobals Globals )
{ 
	float cx = cos( radians( RotationXYZ.x ) );
	float sx = sin( radians( RotationXYZ.x ) );
	float cy = cos( radians( RotationXYZ.y ) );
	float sy = sin( radians( RotationXYZ.y ) );
	float cz = cos( radians( RotationXYZ.z ) );
	float sz = sin( radians( RotationXYZ.z ) );
	
	Matrix = mat3 
	(
		cy * cz,  cx * sz + sx * sy * cz, sx * sz - cx * sy * cz,
		-cy * sz,  cx * cz - sx * sy * sz, sx * cz + cx * sy * sz,
		sy,      -sx * cy,	               cx * cy
	);
}
#define Node143_Modify_Attribute_Set_Matrix( ValueMatrix, Globals ) gParticle.Matrix = ValueMatrix
void Node64_Float_Parameter( out float Output, ssGlobals Globals ) { Output = LifeParam; }
void Node6_Modify_Attribute_Set_Life( in float Value, ssGlobals Globals )
{ 
	gParticle.Life = Value;
	
	gParticle.Life = clamp( gParticle.Life, 0.1, ssPARTICLE_LIFE_MAX );
}
void SpawnParticle( ssGlobals Globals )
{
	Node61_Spawn_Particle_Local_Space( Globals );
	float3 Value_N11 = float3(0.0); Node11_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Import_N011 ), Value_N11, Globals );
	float4 Result_N332 = float4(0.0); Node332_If_else( float( 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), Result_N332, Globals );
	float3 Output_N228 = float3(0.0); Node228_Add( Value_N11, Result_N332.xyz, Output_N228, Globals );
	Node229_Modify_Attribute_Set_Position( Output_N228, Globals );
	float3 Output_N1 = float3(0.0); Node1_Float_Parameter( Output_N1, Globals );
	float3 Value_N103 = float3(0.0); Node103_Float_Import( Output_N1, Value_N103, Globals );
	float3 Output_N104 = float3(0.0); Node104_Normalize( Value_N103, Output_N104, Globals );
	float Value_N2 = 0.0; Node2_Fluctuate( NF_PORT_CONSTANT( float( 1.0 ), Port_TimeBias_N002 ), NF_PORT_CONSTANT( float( 0.0 ), Port_ValueA_N002 ), NF_PORT_CONSTANT( float( 0.0 ), Port_TimeA_N002 ), NF_PORT_CONSTANT( float( 0.5 ), Port_TimeTransition_N002 ), NF_PORT_CONSTANT( float( 3000.0 ), Port_ValueB_N002 ), NF_PORT_CONSTANT( float( 0.0 ), Port_TimeB_N002 ), Value_N2, Globals );
	float Value_N105 = 0.0; Node105_Float_Import( Value_N2, Value_N105, Globals );
	float3 Output_N106 = float3(0.0); Node106_Multiply( Output_N104, Value_N105, Output_N106, Globals );
	Node107_Modify_Attribute_Add_Force( Output_N106, Globals );
	float4 Output_N58 = float4(0.0); Node58_Color_Parameter( Output_N58, Globals );
	float4 Output_N59 = float4(0.0); Node59_Color_Parameter( Output_N59, Globals );
	float4 Random_N60 = float4(0.0); Node60_Particle_Random( Output_N58, Output_N59, Random_N60, Globals );
	Node57_Modify_Attribute_Set_Color( Random_N60, Globals );
	float3 Value_N139 = float3(0.0); Node139_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 90.0, 0.0 ), Port_Import_N139 ), Value_N139, Globals );
	float3 Value_N140 = float3(0.0); Node140_Float_Import( NF_PORT_CONSTANT( float3( 0.0, -90.0, 0.0 ), Port_Import_N140 ), Value_N140, Globals );
	float3 Random_N141 = float3(0.0); Node141_Particle_Random( Value_N139, Value_N140, Random_N141, Globals );
	mat3 Matrix_N142 = mat3(0.0); Node142_Construct_Matrix( Random_N141, Matrix_N142, Globals );
	Node143_Modify_Attribute_Set_Matrix( Matrix_N142, Globals );
	float Output_N64 = 0.0; Node64_Float_Parameter( Output_N64, Globals );
	Node6_Modify_Attribute_Set_Life( Output_N64, Globals );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	gParticle.Velocity += gParticle.Force / gParticle.Mass * 0.03333; // make sure the velocity added on spawn is always the same...
	gParticle.Force = vec3( 0.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* no need to transform */
}
#define Node25_Particle_Spawn_End( Globals ) /*nothing*/
#define Node85_Update_Particle_Local_Space( Globals ) // does nothing
#define Node92_Float_Import( Import, Value, Globals ) Value = Import
#define Node20_Float_Import( Import, Value, Globals ) Value = Import
#define Node21_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
#define Node29_Float_Import( Import, Value, Globals ) Value = Import
void Node62_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 62.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node22_Float_Import( Import, Value, Globals ) Value = Import
#define Node23_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Life
#define Node24_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node31_Float_Import( Import, Value, Globals ) Value = Import
#define Node32_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node33_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node34_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node35_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
void Node63_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 63.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node26_Float_Import( Import, Value, Globals ) Value = Import
#define Node27_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node36_Float_Import( Import, Value, Globals ) Value = Import
#define Node37_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node38_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node41_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node42_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node43_Float_Export( Value, Export, Globals ) Export = Value
#define Node44_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, Input2 )
#define Node45_Modify_Attribute_Set_Size( Value, Globals ) gParticle.Size = Value

//-----------------------------------------------------------------------

void main() 
{
	sc_Vertex_t v = sc_LoadVertexAttributes();
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( sc_IsEditor )
	{
		v.texture0.x += _sc_allow16TexturesMarker;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	int InstanceID = sc_LocalInstanceID;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssDecodeParticle( InstanceID );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssGlobals Globals;
	Globals.gTimeElapsed        = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	Globals.gTimeDelta          = ( overrideTimeEnabled == 1 ) ? overrideTimeDelta : max( sc_TimeDelta, ssDELTA_TIME_MIN );
	Globals.gTimeElapsedShifted = Globals.gTimeElapsed - gParticle.TimeShift * Globals.gTimeDelta - 0.0;
	
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* Warmup */
	
	float Warmup = 0.0;
	float Delay  = 0.0;
	
	#if 0
	
	Warmup = 1.0;
	
	int Frames = 1;
	if ( ngsFrame < 2 )
	{
		Globals.gTimeDelta = 0.0333333;
		Globals.gTimeElapsed -= 1.0;
		Globals.gTimeElapsedShifted -= 1.0;
		Frames = 30;
	}
	
	for ( int i = 0; i < Frames; i++ )
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	{
		#if 1 // continuous
		
		gParticle.Age = mod( Globals.gTimeElapsedShifted - gParticle.SpawnOffset + Warmup, ssPARTICLE_TOTAL_LIFE_MAX );
		bool Dead = ( Globals.gTimeElapsed - gParticle.SpawnOffset < Delay - Warmup || gParticle.Age > ssPARTICLE_LIFE_MAX ) ? true : false;
		
		if ( !Dead && gParticle.Life <= 0.0001 || mod( Globals.gTimeElapsed - gParticle.SpawnOffset - Delay + Warmup, ssPARTICLE_TOTAL_LIFE_MAX ) <= Globals.gTimeDelta )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;
		}
		
		#elif 0 // burst
		
		gParticle.Age = mod( Globals.gTimeElapsedShifted - gParticle.SpawnOffset + Warmup, ssPARTICLE_TOTAL_LIFE_MAX );
		bool Dead = ( Globals.gTimeElapsed - gParticle.SpawnOffset < Delay - Warmup || gParticle.Age > ssPARTICLE_LIFE_MAX ) ? true : false;
		
		// epsilong to avoid decompression precision
		
		if ( !Dead && ( gParticle.Life < 0.0001 || mod( Globals.gTimeElapsed - gParticle.SpawnOffset - Delay + Warmup, ssPARTICLE_TOTAL_LIFE_MAX ) <= Globals.gTimeDelta ) )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;
		}
		
		#elif 0 // once - live forever
		
		if ( gParticle.Life < 0.1 )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;	
			gParticle.Age  = Globals.gTimeElapsedShifted;
		}
		
		gParticle.Life = 1.0;
		
		#else // once - max life
		
		gParticle.Age = Globals.gTimeElapsedShifted + Warmup;
		
		if ( gParticle.Age >= ssPARTICLE_LIFE_MAX )
		{
			gParticle.Spawned = false;
			gParticle.Life = 0.0;
			gParticle.Age  = 0.0;
		}
		else if ( gParticle.Life < 0.1 )
		{
			gParticle.Life = ssPARTICLE_LIFE_MAX;
			SpawnParticle( Globals );
			gParticle.Spawned = true;
			gParticle.Age  = 0.0;					
		}
		else 
		{
			gParticle.Age = Globals.gTimeElapsedShifted + Warmup;
		}
		
		#endif
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		// Execution Code
		
		Node25_Particle_Spawn_End( Globals );
		Node85_Update_Particle_Local_Space( Globals );
		float Value_N92 = 0.0; Node92_Float_Import( NF_PORT_CONSTANT( float( 0.0 ), Port_Import_N092 ), Value_N92, Globals );
		float Value_N20 = 0.0; Node20_Float_Import( NF_PORT_CONSTANT( float( 16.0 ), Port_Import_N020 ), Value_N20, Globals );
		float Value_N21 = 0.0; Node21_Particle_Get_Attribute( Value_N21, Globals );
		float Value_N29 = 0.0; Node29_Float_Import( Value_N21, Value_N29, Globals );
		float Random_N62 = 0.0; Node62_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N062 ), NF_PORT_CONSTANT( float( 2.0 ), Port_Max_N062 ), Random_N62, Globals );
		float Value_N22 = 0.0; Node22_Float_Import( Random_N62, Value_N22, Globals );
		float Value_N23 = 0.0; Node23_Particle_Get_Attribute( Value_N23, Globals );
		float Output_N24 = 0.0; Node24_Divide( Value_N22, Value_N23, Output_N24, Globals );
		float Value_N31 = 0.0; Node31_Float_Import( Output_N24, Value_N31, Globals );
		float Output_N32 = 0.0; Node32_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N032 ), Value_N31, Output_N32, Globals );
		float Output_N33 = 0.0; Node33_Multiply( Value_N29, Output_N32, Output_N33, Globals );
		float Output_N34 = 0.0; Node34_Clamp( Output_N33, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N034 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N034 ), Output_N34, Globals );
		float Output_N35 = 0.0; Node35_One_Minus( Value_N29, Output_N35, Globals );
		float Random_N63 = 0.0; Node63_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N063 ), NF_PORT_CONSTANT( float( 18.0 ), Port_Max_N063 ), Random_N63, Globals );
		float Value_N26 = 0.0; Node26_Float_Import( Random_N63, Value_N26, Globals );
		float Output_N27 = 0.0; Node27_Divide( Value_N26, Value_N23, Output_N27, Globals );
		float Value_N36 = 0.0; Node36_Float_Import( Output_N27, Value_N36, Globals );
		float Output_N37 = 0.0; Node37_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N037 ), Value_N36, Output_N37, Globals );
		float Output_N38 = 0.0; Node38_Multiply( Output_N35, Output_N37, Output_N38, Globals );
		float Output_N41 = 0.0; Node41_Clamp( Output_N38, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N041 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N041 ), Output_N41, Globals );
		float Output_N42 = 0.0; Node42_Multiply( Output_N34, Output_N41, Output_N42, Globals );
		float Export_N43 = 0.0; Node43_Float_Export( Output_N42, Export_N43, Globals );
		float Output_N44 = 0.0; Node44_Mix( Value_N92, Value_N20, Export_N43, Output_N44, Globals );
		Node45_Modify_Attribute_Set_Size( Output_N44, Globals );
		
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		float DeltaTime = clamp( Globals.gTimeDelta, 0.0001, 0.5 );
		float Drift = 0.005;
		//vec3  Force = gParticle.Force;
		//float Mass  = gParticle.Mass;
		
		#if 1
		
		gParticle.Force.x = ( abs(gParticle.Force.x) < Drift ) ? 0.0 : gParticle.Force.x;
		gParticle.Force.y = ( abs(gParticle.Force.y) < Drift ) ? 0.0 : gParticle.Force.y;
		gParticle.Force.z = ( abs(gParticle.Force.z) < Drift ) ? 0.0 : gParticle.Force.z;
		
		gParticle.Mass = max( Drift, gParticle.Mass );
		
		#endif
		
		gParticle.Velocity += gParticle.Force / gParticle.Mass * DeltaTime;	
		
		gParticle.Velocity.x = ( abs(gParticle.Velocity.x) < Drift ) ? 0.0 : gParticle.Velocity.x;
		gParticle.Velocity.y = ( abs(gParticle.Velocity.y) < Drift ) ? 0.0 : gParticle.Velocity.y;
		gParticle.Velocity.z = ( abs(gParticle.Velocity.z) < Drift ) ? 0.0 : gParticle.Velocity.z;
		
		gParticle.Position += gParticle.Velocity * DeltaTime;	
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		#if 0
		{
			ssCalculateDynamicAttributes( InstanceID, gParticle );
			
			Globals.gTimeElapsed += Globals.gTimeDelta;
			Globals.gTimeElapsedShifted += Globals.gTimeDelta;
			
			//float ElapsedTime = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : Globals.gTimeElapsed;
			//gParticle.Seed = rand( gParticle.Coord2D + floor( ( ElapsedTime - gParticle.SpawnOffset + ssPARTICLE_LIFE_MAX * 2.0 ) / ssPARTICLE_LIFE_MAX ) * 4.32422 );
		}
		#endif
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	float2 QuadSize = vec2( ssTEXEL_COUNT_FLOAT, 1.0 ) / vec2(2048.0, ssTARGET_SIZE_FLOAT.y);				
	float2 Offset;   
	
	int offsetID = vfxOffsetInstances + sc_LocalInstanceID;
	int particleRow = 2048 / ssTEXEL_COUNT_INT;
	Offset.x = float( offsetID % particleRow);
	Offset.y = float( offsetID / particleRow);		
	Offset *= QuadSize; // bring into 0-1 range
	
	
	float2 Vertex;   
	Vertex.x = v.texture0.x < 0.5 ? 0.0 : QuadSize.x;  //creates a thin quad to fit into 0-1 space
	Vertex.y = v.texture0.y < 0.5 ? 0.0 : QuadSize.y;
	Vertex += Offset;;					
	
	sc_SetClipPosition( vec4( Vertex * 2.0 - 1.0, 1.0, 1.0 ) );
	
	// Write Position
	
	//float2 Index2D    = float2( mod( InstanceID, ssPARTICLE_COUNT_2D_FLOAT.x ), floor( InstanceID / ssPARTICLE_COUNT_2D_FLOAT.x ) );
	//float2 Size       = 1.0 / ssPARTICLE_COUNT_2D_FLOAT /* because quad is -1 to 1 */;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// this is to splat the data to the render target
	
	//gl_Position = float4( ( v.position.xy * 0.5 + 0.5 + /*Index2D*/ gParticle.Ratio2D ) * QuadSize * 2.0 - 1.0, 1.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Convert Particle.Matrix to Quaternion and Position
	/*
	float Divider = 0.0;
	
	if ( Particle.m_Matrix[2][2] < 0.0 )
	{
		if ( Particle.m_Matrix[0][0] > Particle.m_Matrix[1][1] )
		{
			Divider = 1.0 + Particle.m_Matrix[0][0] - Particle.m_Matrix[1][1] - Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Divider, Particle.m_Matrix[0][1] + Particle.m_Matrix[1][0], Particle.m_Matrix[2][0] + Particle.m_Matrix[0][2], Particle.m_Matrix[1][2] - Particle.m_Matrix[2][1] );
		}
		else
		{
			Divider = 1.0 - Particle.m_Matrix[0][0] + Particle.m_Matrix[1][1] - Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[0][1] + Particle.m_Matrix[1][0], Divider, Particle.m_Matrix[1][2] + Particle.m_Matrix[2][1], Particle.m_Matrix[2][0] - Particle.m_Matrix[0][2] );
		}
	}
	else
	{
		if ( Particle.m_Matrix[0][0] < -Particle.m_Matrix[1][1] )
		{
			Divider = 1.0 - Particle.m_Matrix[0][0] - Particle.m_Matrix[1][1] + Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[2][0] + Particle.m_Matrix[0][2], Particle.m_Matrix[1][2] + Particle.m_Matrix[2][1], Divider, Particle.m_Matrix[0][1] - Particle.m_Matrix[1][0] );
		}
		else
		{ 
			Divider = 1.0 + Particle.m_Matrix[0][0] + Particle.m_Matrix[1][1] + Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[1][2] - Particle.m_Matrix[2][1], Particle.m_Matrix[2][0] - Particle.m_Matrix[0][2], Particle.m_Matrix[0][1] - Particle.m_Matrix[1][0], Divider );
		}
	}
	
	Particle.Quaternion = Particle.Quaternion * 0.5 / sqrt( Divider );
	//Particle.Position   = vec3( Particle.Matrix[3][0], Particle.Matrix[3][1], Particle.Matrix[3][2] );
	*/
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Interp_Particle_Index = sc_LocalInstanceID;
	Interp_Particle_Coord = v.texture0;
	Interp_Particle_Force = gParticle.Force;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Interp_Particle_Size = gParticle.Size;
	Interp_Particle_Life = gParticle.Life;
	Interp_Particle_Age = gParticle.Age;
	Interp_Particle_Matrix = gParticle.Matrix;
	Interp_Particle_Color = gParticle.Color;
	Interp_Particle_Position = gParticle.Position;
	Interp_Particle_Velocity = gParticle.Velocity;
	Interp_Particle_Dead = gParticle.Dead;
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( ( overrideTimeEnabled == 1 ) && overrideTimeDelta == 0.0 )
	{
		sc_SetClipPosition( ( sc_LocalInstanceID == 0 ) ? vec4( v.texture0.xy * 2.0 - 1.0, 1.0, 1.0 ) : vec4( 0.0 ) );
		varTex0 = v.texture0.xy;
	}
}

//-----------------------------------------------------------------------

#endif // #ifdef VERTEX_SHADER

//-----------------------------------------------------------------------

#ifdef FRAGMENT_SHADER

//-----------------------------------------------------------------------------

//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	
};

ssGlobals tempGlobals;
#define scCustomCodeUniform

//-----------------------------------------------------------------------------
/*
#ifdef USE_16_BIT_TEXTURES
layout(location = 0) out highp uvec4 fragOut[4];
#endif
*/
//-----------------------------------------------------------------------------

void main() 
{
	sc_DiscardStereoFragment();
	
	float4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, vec2( 0.5 ), 0.0);
	float4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, vec2( 0.5 ), 0.0);
	float4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, vec2( 0.5 ), 0.0);
	float4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, vec2( 0.5 ), 0.0);
	
	if ( dot( renderTarget0Sample + renderTarget1Sample + renderTarget2Sample + renderTarget3Sample, vec4( 0.2542325 ) ) == 0.3423183476 )
	{
		discard; // hack so the texture filter modes don't get wiped out
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if __VERSION__ == 100
	{
		gl_FragColor = vec4( 0.0, 0.0, 0.0, 1.0 );
	}				 
	#else
	{
		vec4 Data0 = vec4( 0.0 );
		vec4 Data1 = vec4( 0.0 );
		vec4 Data2 = vec4( 0.0 );
		vec4 Data3 = vec4( 0.0 );
		
		if ( ( overrideTimeEnabled == 1 ) && overrideTimeDelta == 0.0 )
		{
			renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, varTex0, 0.0);
			renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, varTex0, 0.0);
			renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, varTex0, 0.0);
			renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, varTex0, 0.0);
			
			Data0 = renderTarget0Sample;
			Data1 = renderTarget1Sample;
			Data2 = renderTarget2Sample;
			Data3 = renderTarget3Sample;
		}
		else
		{
			gParticle.Size = Interp_Particle_Size;
			gParticle.Life = Interp_Particle_Life;
			gParticle.Age = Interp_Particle_Age;
			gParticle.Matrix = Interp_Particle_Matrix;
			gParticle.Color = Interp_Particle_Color;
			gParticle.Position = Interp_Particle_Position;
			gParticle.Velocity = Interp_Particle_Velocity;
			gParticle.Dead = Interp_Particle_Dead;
			
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			ssEncodeParticle( Interp_Particle_Coord, Data0, Data1, Data2, Data3 );
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			#if 0
			{
				float TexelRatio = floor( Interp_Particle_Coord.x * 5.0 ) / 4.0;
				Data0 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data1 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data2 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data3 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
			}	
			#endif
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			#ifndef MOBILE
			if ( dot( Data0.xyzw + Data1.xyzw + Data2.xyzw + Data3.xyzw, vec4( 0.23454 ) ) == 0.3423183476 )
			Data0.xyzw += SC_EPSILON; // fix for missing parameters in UI
			#endif
		}
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		sc_writeFragData0( Data0 );
		sc_writeFragData1( Data1 );
		sc_writeFragData2( Data2 );
		sc_writeFragData3( Data3 );
	}
	#endif
}

#endif //FRAGMENT SHADER
