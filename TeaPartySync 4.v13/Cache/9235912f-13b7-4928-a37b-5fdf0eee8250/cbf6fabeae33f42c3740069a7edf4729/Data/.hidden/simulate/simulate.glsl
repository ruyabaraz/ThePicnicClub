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

//--------------------------------------------------------

#define ssDELTA_TIME_MIN 0.00

//--------------------------------------------------------


struct ssParticle
{	
	vec3  Position;
	vec3  Velocity;
	vec4  Color;
	float Size;
	float Age; 			// how long the particle has been alive
	float Life;			// the lifespan of the particle
	float Mass;
	mat3  Matrix;
	float Dead;
	//vec4  Quaternion;
	
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

ssParticle gParticle;

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

int ssRandLfsr(int n)
{
	return (n * (n * 1471343 + 101146501) + 1559861749) & 0x7fffffff;
}

float ssNormalizeRand(int r)
{
	return float(r) * (1.0 / 2147483647.0);
}

int ssGetRandSeedDim1(int x) 
{
	return x ^ (x * 15299);
}

int ssGetRandSeedDim2(int x, int y) {
	return (x * 15299) ^ (y * 30133);
}

int ssGetRandSeedDim3(int x, int y, int z) 
{
	return (x * 15299) ^ (y * 30133) ^ (z * 17539);
}

int ssGetRandSeedDim4(int x, int y, int z, int w) 
{
	return (x * 15299) ^ (y * 30133) ^ (z * 17539) ^ (w * 12113);
}

//--------------------------------------------------------

float ssRandFloat(int seed)
{
	return ssNormalizeRand(ssRandLfsr(seed));	
}

// All seeds given by the user are interpreted as ints
float rand_float( float Seed ) { return ssRandFloat( ssGetRandSeedDim1(int(Seed)) ); }
float rand_float( vec2 Seed )  { return ssRandFloat( ssGetRandSeedDim2(int(Seed.x), int(Seed.y)) ); }
float rand_float( vec3 Seed )  { return ssRandFloat( ssGetRandSeedDim3(int(Seed.x), int(Seed.y), int(Seed.z)) ); }
float rand_float( vec4 Seed )  { return ssRandFloat( ssGetRandSeedDim4(int(Seed.x), int(Seed.y), int(Seed.z), int(Seed.w)) ); }

//--------------------------------------------------------

vec2 ssRandVec2(int seed) 
{
	int r1 = ssRandLfsr(seed);
	int r2 = ssRandLfsr(seed * 1399);
	return vec2(ssNormalizeRand(r1), ssNormalizeRand(r2));
}

vec2 rand_vec2( float Seed ) { return ssRandVec2( ssGetRandSeedDim1(int(Seed)) ); }
vec2 rand_vec2( vec2 Seed )  { return ssRandVec2( ssGetRandSeedDim2(int(Seed.x), int(Seed.y)) ); }
vec2 rand_vec2( vec3 Seed )  { return ssRandVec2( ssGetRandSeedDim3(int(Seed.x), int(Seed.y), int(Seed.z)) ); }
vec2 rand_vec2( vec4 Seed )  { return ssRandVec2( ssGetRandSeedDim4(int(Seed.x), int(Seed.y), int(Seed.z), int(Seed.w)) ); }

//--------------------------------------------------------

vec3 ssRandVec3(int seed) 
{
	int r1 = ssRandLfsr(seed);
	int r2 = ssRandLfsr(seed * 1399);
	int r3 = ssRandLfsr(seed * 7177);
	return vec3(ssNormalizeRand(r1), ssNormalizeRand(r2), ssNormalizeRand(r3));
}

vec3 rand_vec3( float Seed ) { return ssRandVec3( ssGetRandSeedDim1(int(Seed)) ); }
vec3 rand_vec3( vec2 Seed )  { return ssRandVec3( ssGetRandSeedDim2(int(Seed.x), int(Seed.y)) ); }
vec3 rand_vec3( vec3 Seed )  { return ssRandVec3( ssGetRandSeedDim3(int(Seed.x), int(Seed.y), int(Seed.z)) ); }
vec3 rand_vec3( vec4 Seed )  { return ssRandVec3( ssGetRandSeedDim4(int(Seed.x), int(Seed.y), int(Seed.z), int(Seed.w)) ); }

//--------------------------------------------------------

vec4 ssRandVec4(int seed) 
{
	int r1 = ssRandLfsr(seed);
	int r2 = ssRandLfsr(seed * 1399);
	int r3 = ssRandLfsr(seed * 7177);
	int r4 = ssRandLfsr(seed * 18919);
	return vec4(ssNormalizeRand(r1), ssNormalizeRand(r2), ssNormalizeRand(r3), ssNormalizeRand(r4));
}

vec4 rand_vec4( float Seed ) { return ssRandVec4( ssGetRandSeedDim1(int(Seed)) ); }
vec4 rand_vec4( vec2 Seed )  { return ssRandVec4( ssGetRandSeedDim2(int(Seed.x), int(Seed.y)) ); }
vec4 rand_vec4( vec3 Seed )  { return ssRandVec4( ssGetRandSeedDim3(int(Seed.x), int(Seed.y), int(Seed.z)) ); }
vec4 rand_vec4( vec4 Seed )  { return ssRandVec4( ssGetRandSeedDim4(int(Seed.x), int(Seed.y), int(Seed.z), int(Seed.w)) ); }

//--------------------------------------------------------	


vec4 ssGetParticleRandom( int Dimension, bool UseTime, bool UseNodeID, bool UseParticleID, float NodeID, ssParticle Particle, float ExtraSeed, float Time )
{
	vec4 Random = vec4( 0.0 );
	vec4 seed = vec4(0.0);
	
	if (UseTime) 		seed.x = floor(fract(Time) * 1000.0);
	if (UseParticleID) 	seed.y = float(Particle.Index1D ^ (Particle.Index1D * 15299 + Particle.Index1D));
	if (UseNodeID) 		seed.z = NodeID;
	seed.w = ExtraSeed * 1000.0;	
	
	int seed_i = ssGetRandSeedDim4(int(seed.x), int(seed.y), int(seed.z), int(seed.w));
	
	if 		( Dimension == 1 ) Random.x 	= ssRandFloat(seed_i);
	else if ( Dimension == 2 ) Random.xy 	= ssRandVec2(seed_i); 					
	else if ( Dimension == 3 ) Random.xyz 	= ssRandVec3(seed_i);
	else 					   Random 		= ssRandVec4(seed_i);
	
	return Random;
}

//--------------------------------------------------------			


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
#define ssPARTICLE_COUNT_1D_INT		300
#define ssPARTICLE_COUNT_1D_FLOAT	300.0
#define ssPARTICLE_COUNT_2D_INT		ivec2( 300, 1 )
#define ssPARTICLE_COUNT_2D_FLOAT	float2( 300.0, 1.0 )
#define ssPARTICLE_LIFE_MAX 		float( 3.0 )
#define ssPARTICLE_TOTAL_LIFE_MAX 	float( 3.0 )
#define ssPARTICLE_BURST_GROUPS 	float( 1.0 )
#define ssPARTICLE_SPAWN_RATE 		float( 100.0 )
#define ssPARTICLE_BURST_EVERY 		float( 1.0 )
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
	
	#if 0
	Particle.TimeShift   = rand( vec2( Particle.Ratio1D ) * vec2( 0.3452, 0.52254 ) ); // legacy random
	#else
	Particle.TimeShift   = ssRandFloat(Particle.Index1D);
	#endif			
	
	#if 1
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

varying highp mat3 Interp_Particle_Matrix;
varying highp float Interp_Particle_Size;
varying highp float4 Interp_Particle_Color;
varying highp float3 Interp_Particle_Velocity;
varying highp float Interp_Particle_Life;
varying highp float Interp_Particle_Age;
varying highp float3 Interp_Particle_Position;
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
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
	//gParticle.Quaternion = vec4( 0.0 );
	
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
	
	gParticle.Matrix[0].x = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -100.0, 100.0 );
	gParticle.Matrix[0].y = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -100.0, 100.0 );
	gParticle.Matrix[0].z = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -100.0, 100.0 );
	gParticle.Matrix[1].x = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -100.0, 100.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 1.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Matrix[1].y = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -100.0, 100.0 );
	gParticle.Matrix[1].z = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -100.0, 100.0 );
	gParticle.Matrix[2].x = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -100.0, 100.0 );
	gParticle.Matrix[2].y = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -100.0, 100.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 2.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Matrix[2].z = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -100.0, 100.0 );
	gParticle.Size = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 100.0 );
	gParticle.Color.x = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), 0.0, 1.0 );
	gParticle.Color.y = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), 0.0, 1.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 3.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Color.z = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 1.0 );
	gParticle.Color.w = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 1.0 );
	gParticle.Velocity.x = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -1000.0, 1000.0 );
	gParticle.Velocity.y = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -1000.0, 1000.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 4.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Velocity.z = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -1000.0, 1000.0 );
	gParticle.Life = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 3.0 );
	gParticle.Age = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), 0.0, 3.0 );
	gParticle.Position.x = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -1000.0, 1000.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 5.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Position.y = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -1000.0, 1000.0 );
	gParticle.Position.z = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -1000.0, 1000.0 );
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
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].x, -100.0, 100.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].y, -100.0, 100.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[0].z, -100.0, 100.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].x, -100.0, 100.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 1 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].y, -100.0, 100.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[1].z, -100.0, 100.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].x, -100.0, 100.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].y, -100.0, 100.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 2 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Matrix[2].z, -100.0, 100.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Size, 0.0, 100.0 );           Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.x, 0.0, 1.0 );          Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.y, 0.0, 1.0 );          Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 3 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.z, 0.0, 1.0 );           Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.w, 0.0, 1.0 );           Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.x, -1000.0, 1000.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.y, -1000.0, 1000.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 4 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.z, -1000.0, 1000.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Life, 0.0, 3.0 );              Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Age, 0.0, 3.0 );               Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.x, -1000.0, 1000.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 5 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.y, -1000.0, 1000.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.z, -1000.0, 1000.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
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

uniform NF_PRECISION float4 Tweak_N79; // Title: Random Color A
uniform NF_PRECISION float4 Tweak_N80; // Title: Random Color B	


// Uniforms ( Ports )

#if defined( STUDIO )
uniform NF_PRECISION float3 Port_Import_N216;
uniform NF_PRECISION float3 Port_Min_N086;
uniform NF_PRECISION float3 Port_Max_N086;
uniform NF_PRECISION float Port_Min_N254;
uniform NF_PRECISION float Port_Max_N254;
uniform NF_PRECISION float Port_Import_N087;
uniform NF_PRECISION float3 Port_Import_N089;
uniform NF_PRECISION float Port_Import_N003;
uniform NF_PRECISION float Port_Import_N005;
uniform NF_PRECISION float Port_Min_N008;
uniform NF_PRECISION float Port_Max_N008;
uniform NF_PRECISION float Port_Import_N267;
uniform NF_PRECISION float Port_Import_N268;
uniform NF_PRECISION float3 Port_Value_N001;
uniform NF_PRECISION float3 Port_Import_N013;
uniform NF_PRECISION float3 Port_Import_N016;
uniform NF_PRECISION float4 Port_Import_N037;
uniform NF_PRECISION float4 Port_Import_N042;
uniform NF_PRECISION float Port_Min_N043;
uniform NF_PRECISION float Port_Max_N043;
uniform NF_PRECISION float Port_Import_N041;
uniform NF_PRECISION float Port_Import_N059;
uniform NF_PRECISION float Port_Import_N191;
uniform NF_PRECISION float Port_Input0_N063;
uniform NF_PRECISION float Port_Import_N185;
uniform NF_PRECISION float Port_Import_N062;
uniform NF_PRECISION float Port_Input1_N227;
uniform NF_PRECISION float Port_Input2_N227;
uniform NF_PRECISION float Port_Input0_N066;
uniform NF_PRECISION float Port_Import_N188;
uniform NF_PRECISION float Port_Import_N065;
uniform NF_PRECISION float Port_Input1_N236;
uniform NF_PRECISION float Port_Input2_N236;
uniform NF_PRECISION float Port_Min_N038;
uniform NF_PRECISION float Port_Max_N038;
uniform NF_PRECISION float Port_Import_N251;
uniform NF_PRECISION float Port_Min_N023;
uniform NF_PRECISION float Port_Max_N023;
uniform NF_PRECISION float Port_Import_N252;
uniform NF_PRECISION float Port_Min_N125;
uniform NF_PRECISION float Port_Max_N125;
uniform NF_PRECISION float3 Port_Import_N161;
uniform NF_PRECISION float Port_Import_N163;
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
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
	//gParticle.Quaternion = vec4( 0.0, 0.0, 0.0, 1.0 );
}
#define Node216_Float_Import( Import, Value, Globals ) Value = Import
void Node86_Particle_Random( in float3 Min, in float3 Max, out float3 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 3, true, true, true, 86.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xyz );
}
#define Node253_Length( Input0, Output, Globals ) Output = length( Input0 )
#define Node255_Divide( Input0, Input1, Output, Globals ) Output = Input0 / (float3(Input1) + 1.234e-6)
void Node254_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 254.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node257_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
#define Node260_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
#define Node87_Float_Import( Import, Value, Globals ) Value = Import
#define Node89_Float_Import( Import, Value, Globals ) Value = Import
#define Node256_Multiply( Input0, Input1, Input2, Input3, Output, Globals ) Output = Input0 * float3(Input1) * float3(Input2) * Input3
#define Node90_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node219_Modify_Attribute_Set_Position( Value, Globals ) gParticle.Position = Value
#define Node3_Float_Import( Import, Value, Globals ) Value = Import
#define Node5_Float_Import( Import, Value, Globals ) Value = Import
void Node9_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 9.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
void Node10_Modify_Attribute_Set_Life( in float Value, ssGlobals Globals )
{ 
	gParticle.Life = Value;
	
	gParticle.Life = clamp( gParticle.Life, 0.1, ssPARTICLE_LIFE_MAX );
}
void Node8_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 8.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node267_Float_Import( Import, Value, Globals ) Value = Import
#define Node268_Float_Import( Import, Value, Globals ) Value = Import
void Node269_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 269.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node270_Modify_Attribute_Set_Size( Value, Globals ) gParticle.Size = Value
#define Node1_Modify_Attribute_Set_Velocity( Value, Globals ) gParticle.Velocity = Value
#define Node13_Float_Import( Import, Value, Globals ) Value = Import
#define Node16_Float_Import( Import, Value, Globals ) Value = Import
void Node17_Particle_Random( in float3 Min, in float3 Max, out float3 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 3, true, true, true, 17.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xyz );
}
void Node19_Construct_Matrix( in float3 RotationXYZ, out mat3 Matrix, ssGlobals Globals )
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
#define Node20_Modify_Attribute_Set_Matrix( ValueMatrix, Globals ) gParticle.Matrix = ValueMatrix
void Node79_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = Tweak_N79; }
#define Node37_Float_Import( Import, Value, Globals ) Value = Import
void Node80_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = Tweak_N80; }
#define Node42_Float_Import( Import, Value, Globals ) Value = Import
void Node43_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 43.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node44_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, float4(Input2) )
#define Node45_Modify_Attribute_Set_Color( Value, Globals ) gParticle.Color = Value
void SpawnParticle( ssGlobals Globals )
{
	Node61_Spawn_Particle_Local_Space( Globals );
	float3 Value_N216 = float3(0.0); Node216_Float_Import( NF_PORT_CONSTANT( float3( -3.0, -5.0, 0.0 ), Port_Import_N216 ), Value_N216, Globals );
	float3 Random_N86 = float3(0.0); Node86_Particle_Random( NF_PORT_CONSTANT( float3( -1.0, -1.0, -1.0 ), Port_Min_N086 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Max_N086 ), Random_N86, Globals );
	float Output_N253 = 0.0; Node253_Length( Random_N86, Output_N253, Globals );
	float3 Output_N255 = float3(0.0); Node255_Divide( Random_N86, Output_N253, Output_N255, Globals );
	float Random_N254 = 0.0; Node254_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N254 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Max_N254 ), Random_N254, Globals );
	float Output_N257 = 0.0; Node257_Sqrt( Random_N254, Output_N257, Globals );
	float Output_N260 = 0.0; Node260_Sqrt( Output_N257, Output_N260, Globals );
	float Value_N87 = 0.0; Node87_Float_Import( NF_PORT_CONSTANT( float( 2.0 ), Port_Import_N087 ), Value_N87, Globals );
	float3 Value_N89 = float3(0.0); Node89_Float_Import( NF_PORT_CONSTANT( float3( 1.0, 0.5, 1.0 ), Port_Import_N089 ), Value_N89, Globals );
	float3 Output_N256 = float3(0.0); Node256_Multiply( Output_N255, Output_N260, Value_N87, Value_N89, Output_N256, Globals );
	float3 Output_N90 = float3(0.0); Node90_Add( Value_N216, Output_N256, Output_N90, Globals );
	Node219_Modify_Attribute_Set_Position( Output_N90, Globals );
	float Value_N3 = 0.0; Node3_Float_Import( NF_PORT_CONSTANT( float( 0.5 ), Port_Import_N003 ), Value_N3, Globals );
	float Value_N5 = 0.0; Node5_Float_Import( NF_PORT_CONSTANT( float( 3.0 ), Port_Import_N005 ), Value_N5, Globals );
	float Random_N9 = 0.0; Node9_Particle_Random( Value_N3, Value_N5, Random_N9, Globals );
	Node10_Modify_Attribute_Set_Life( Random_N9, Globals );
	float Random_N8 = 0.0; Node8_Particle_Random( NF_PORT_CONSTANT( float( 2.5 ), Port_Min_N008 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Max_N008 ), Random_N8, Globals );
	float Value_N267 = 0.0; Node267_Float_Import( Random_N8, Value_N267, Globals );
	float Value_N268 = 0.0; Node268_Float_Import( NF_PORT_CONSTANT( float( 15.0 ), Port_Import_N268 ), Value_N268, Globals );
	float Random_N269 = 0.0; Node269_Particle_Random( Value_N267, Value_N268, Random_N269, Globals );
	Node270_Modify_Attribute_Set_Size( Random_N269, Globals );
	Node1_Modify_Attribute_Set_Velocity( NF_PORT_CONSTANT( float3( 5.0, 10.0, 0.0 ), Port_Value_N001 ), Globals );
	float3 Value_N13 = float3(0.0); Node13_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 0.0, 45.0 ), Port_Import_N013 ), Value_N13, Globals );
	float3 Value_N16 = float3(0.0); Node16_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 0.0, -45.0 ), Port_Import_N016 ), Value_N16, Globals );
	float3 Random_N17 = float3(0.0); Node17_Particle_Random( Value_N13, Value_N16, Random_N17, Globals );
	mat3 Matrix_N19 = mat3(0.0); Node19_Construct_Matrix( Random_N17, Matrix_N19, Globals );
	Node20_Modify_Attribute_Set_Matrix( Matrix_N19, Globals );
	float4 Output_N79 = float4(0.0); Node79_Color_Parameter( Output_N79, Globals );
	float4 Value_N37 = float4(0.0); Node37_Float_Import( Output_N79, Value_N37, Globals );
	float4 Output_N80 = float4(0.0); Node80_Color_Parameter( Output_N80, Globals );
	float4 Value_N42 = float4(0.0); Node42_Float_Import( Output_N80, Value_N42, Globals );
	float Random_N43 = 0.0; Node43_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N043 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Max_N043 ), Random_N43, Globals );
	float4 Output_N44 = float4(0.0); Node44_Mix( Value_N37, Value_N42, Random_N43, Output_N44, Globals );
	Node45_Modify_Attribute_Set_Color( Output_N44, Globals );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	gParticle.Velocity += gParticle.Force / gParticle.Mass * 0.03333; // make sure the velocity added on spawn is always the same...
	gParticle.Force = vec3( 0.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* no need to transform */
}
#define Node25_Particle_Spawn_End( Globals ) /*nothing*/
#define Node85_Update_Particle_Local_Space( Globals ) // does nothing
#define Node28_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Color
#define Node41_Float_Import( Import, Value, Globals ) Value = Import
#define Node59_Float_Import( Import, Value, Globals ) Value = Import
#define Node183_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
#define Node191_Float_Import( Import, Value, Globals ) Value = Import
#define Node185_Float_Import( Import, Value, Globals ) Value = Import
#define Node186_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Life
#define Node187_Divide( Input0, Input1, Output, Globals ) Output = Input0 / (Input1 + 1.234e-6)
#define Node62_Float_Import( Import, Value, Globals ) Value = Import
#define Node63_Divide( Input0, Input1, Output, Globals ) Output = Input0 / (Input1 + 1.234e-6)
#define Node64_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node227_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node232_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
#define Node188_Float_Import( Import, Value, Globals ) Value = Import
#define Node189_Divide( Input0, Input1, Output, Globals ) Output = Input0 / (Input1 + 1.234e-6)
#define Node65_Float_Import( Import, Value, Globals ) Value = Import
#define Node66_Divide( Input0, Input1, Output, Globals ) Output = Input0 / (Input1 + 1.234e-6)
#define Node73_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node236_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node74_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node78_Float_Export( Value, Export, Globals ) Export = Value
#define Node239_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, Input2 )
#define Node242_Construct_Vector( Value1, Value2, Value, Globals ) Value.xyz = Value1; Value.w = Value2
#define Node88_Modify_Attribute_Set_Color( Value, Globals ) gParticle.Color = Value
void Node38_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 38.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node251_Float_Import( Import, Value, Globals ) Value = Import
void Node23_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 23.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node252_Float_Import( Import, Value, Globals ) Value = Import
#define Node47_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
#define Node48_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, Input2 )
#define Node49_Modify_Attribute_Set_Size( Value, Globals ) gParticle.Size = Value
void Node156_Particle_Get_Attribute( out mat4 ValueMatrix, ssGlobals Globals )
{ 
	ValueMatrix[0] = vec4( gParticle.Matrix[0].xyz, gParticle.Position.x );
	ValueMatrix[1] = vec4( gParticle.Matrix[1].xyz, gParticle.Position.y );
	ValueMatrix[2] = vec4( gParticle.Matrix[2].xyz, gParticle.Position.z );
	ValueMatrix[3] = vec4( 0.0, 0.0, 0.0, 1.0 );
}
void Node125_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 125.0, gParticle, 0.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node4_Swizzle( Input, Output, Globals ) Output = float3( 0.0, 0.0, Input )
#define Node161_Float_Import( Import, Value, Globals ) Value = Import
void Node162_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
#define Node163_Float_Import( Import, Value, Globals ) Value = Import
void Node164_Construct_Matrix( in float3 RotationAxis, in float RotationAngle, out mat3 Matrix, ssGlobals Globals )
{ 
	vec3  a = normalize( RotationAxis );
	float s = sin( radians( RotationAngle ) );
	float c = cos( radians( RotationAngle ) );
	float oc = 1.0 - c;
	
	Matrix = mat3 
	(
		oc * a.x * a.x + c,        oc * a.x * a.y - a.z * s,  oc * a.z * a.x + a.y * s,
		oc * a.x * a.y + a.z * s,  oc * a.y * a.y + c,        oc * a.y * a.z - a.x * s,
		oc * a.z * a.x - a.y * s,  oc * a.y * a.z + a.x * s,  oc * a.z * a.z + c
	);
}
#define Node165_Transform_by_Matrix( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node168_Modify_Attribute_Set_Matrix( ValueMatrix, Globals ) gParticle.Matrix = ValueMatrix

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
		float4 Value_N28 = float4(0.0); Node28_Particle_Get_Attribute( Value_N28, Globals );
		float Value_N41 = 0.0; Node41_Float_Import( NF_PORT_CONSTANT( float( 0.0 ), Port_Import_N041 ), Value_N41, Globals );
		float Value_N59 = 0.0; Node59_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N059 ), Value_N59, Globals );
		float Value_N183 = 0.0; Node183_Particle_Get_Attribute( Value_N183, Globals );
		float Value_N191 = 0.0; Node191_Float_Import( Value_N183, Value_N191, Globals );
		float Value_N185 = 0.0; Node185_Float_Import( NF_PORT_CONSTANT( float( 0.5 ), Port_Import_N185 ), Value_N185, Globals );
		float Value_N186 = 0.0; Node186_Particle_Get_Attribute( Value_N186, Globals );
		float Output_N187 = 0.0; Node187_Divide( Value_N185, Value_N186, Output_N187, Globals );
		float Value_N62 = 0.0; Node62_Float_Import( Output_N187, Value_N62, Globals );
		float Output_N63 = 0.0; Node63_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N063 ), Value_N62, Output_N63, Globals );
		float Output_N64 = 0.0; Node64_Multiply( Value_N191, Output_N63, Output_N64, Globals );
		float Output_N227 = 0.0; Node227_Clamp( Output_N64, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N227 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N227 ), Output_N227, Globals );
		float Output_N232 = 0.0; Node232_One_Minus( Value_N191, Output_N232, Globals );
		float Value_N188 = 0.0; Node188_Float_Import( NF_PORT_CONSTANT( float( 0.5 ), Port_Import_N188 ), Value_N188, Globals );
		float Output_N189 = 0.0; Node189_Divide( Value_N188, Value_N186, Output_N189, Globals );
		float Value_N65 = 0.0; Node65_Float_Import( Output_N189, Value_N65, Globals );
		float Output_N66 = 0.0; Node66_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N066 ), Value_N65, Output_N66, Globals );
		float Output_N73 = 0.0; Node73_Multiply( Output_N232, Output_N66, Output_N73, Globals );
		float Output_N236 = 0.0; Node236_Clamp( Output_N73, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N236 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N236 ), Output_N236, Globals );
		float Output_N74 = 0.0; Node74_Multiply( Output_N227, Output_N236, Output_N74, Globals );
		float Export_N78 = 0.0; Node78_Float_Export( Output_N74, Export_N78, Globals );
		float Output_N239 = 0.0; Node239_Mix( Value_N41, Value_N59, Export_N78, Output_N239, Globals );
		float4 Value_N242 = float4(0.0); Node242_Construct_Vector( Value_N28.xyz, Output_N239, Value_N242, Globals );
		Node88_Modify_Attribute_Set_Color( Value_N242, Globals );
		float Random_N38 = 0.0; Node38_Particle_Random( NF_PORT_CONSTANT( float( 2.0 ), Port_Min_N038 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Max_N038 ), Random_N38, Globals );
		float Value_N251 = 0.0; Node251_Float_Import( Random_N38, Value_N251, Globals );
		float Random_N23 = 0.0; Node23_Particle_Random( NF_PORT_CONSTANT( float( 15.0 ), Port_Min_N023 ), NF_PORT_CONSTANT( float( 20.0 ), Port_Max_N023 ), Random_N23, Globals );
		float Value_N252 = 0.0; Node252_Float_Import( Random_N23, Value_N252, Globals );
		float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
		float Output_N48 = 0.0; Node48_Mix( Value_N251, Value_N252, Value_N47, Output_N48, Globals );
		Node49_Modify_Attribute_Set_Size( Output_N48, Globals );
		mat4 ValueMatrix_N156 = mat4(0.0); Node156_Particle_Get_Attribute( ValueMatrix_N156, Globals );
		float Random_N125 = 0.0; Node125_Particle_Random( NF_PORT_CONSTANT( float( -1.0 ), Port_Min_N125 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Max_N125 ), Random_N125, Globals );
		float3 Output_N4 = float3(0.0); Node4_Swizzle( Random_N125, Output_N4, Globals );
		float3 Value_N161 = float3(0.0); Node161_Float_Import( Output_N4, Value_N161, Globals );
		float3 Output_N162 = float3(0.0); Node162_Normalize( Value_N161, Output_N162, Globals );
		float Value_N163 = 0.0; Node163_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N163 ), Value_N163, Globals );
		mat3 Matrix_N164 = mat3(0.0); Node164_Construct_Matrix( Output_N162, Value_N163, Matrix_N164, Globals );
		mat3 Output_N165 = mat3(0.0); Node165_Transform_by_Matrix( mat3( ValueMatrix_N156 ), Matrix_N164, Output_N165, Globals );
		Node168_Modify_Attribute_Set_Matrix( Output_N165, Globals );
		
		
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
	
	Interp_Particle_Matrix = gParticle.Matrix;
	Interp_Particle_Size = gParticle.Size;
	Interp_Particle_Color = gParticle.Color;
	Interp_Particle_Velocity = gParticle.Velocity;
	Interp_Particle_Life = gParticle.Life;
	Interp_Particle_Age = gParticle.Age;
	Interp_Particle_Position = gParticle.Position;
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
			gParticle.Matrix = Interp_Particle_Matrix;
			gParticle.Size = Interp_Particle_Size;
			gParticle.Color = Interp_Particle_Color;
			gParticle.Velocity = Interp_Particle_Velocity;
			gParticle.Life = Interp_Particle_Life;
			gParticle.Age = Interp_Particle_Age;
			gParticle.Position = Interp_Particle_Position;
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
