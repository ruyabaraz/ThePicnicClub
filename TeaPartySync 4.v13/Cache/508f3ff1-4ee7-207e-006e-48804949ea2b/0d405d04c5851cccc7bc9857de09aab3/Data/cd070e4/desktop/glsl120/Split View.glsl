//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler depthTargetSmpSC 0:19
//sampler sampler fluidPressureSmpSC 0:20
//sampler sampler intensityTextureSmpSC 0:21
//sampler sampler oceanHeightmapSmpSC 0:22
//sampler sampler sc_OITCommonSampler 0:25
//sampler sampler sc_ScreenTextureSmpSC 0:27
//sampler sampler screenTexSmpSC 0:30
//texture texture2D depthTarget 0:0:0:19
//texture texture2D fluidPressure 0:1:0:20
//texture texture2D intensityTexture 0:2:0:21
//texture texture2D oceanHeightmap 0:3:0:22
//texture texture2D sc_OITAlpha0 0:6:0:25
//texture texture2D sc_OITAlpha1 0:7:0:25
//texture texture2D sc_OITDepthHigh0 0:8:0:25
//texture texture2D sc_OITDepthHigh1 0:9:0:25
//texture texture2D sc_OITDepthLow0 0:10:0:25
//texture texture2D sc_OITDepthLow1 0:11:0:25
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:12:0:25
//texture texture2D sc_OITFrontDepthTexture 0:13:0:25
//texture texture2D sc_ScreenTexture 0:15:0:27
//texture texture2D screenTex 0:18:0:30
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR 2 0
//spec_const bool BLEND_MODE_COLOR_BURN 3 0
//spec_const bool BLEND_MODE_COLOR_DODGE 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_depthTarget 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 35 0
//spec_const bool SC_USE_UV_MIN_MAX_depthTarget 36 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 37 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 38 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanHeightmap 39 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 40 0
//spec_const bool SC_USE_UV_TRANSFORM_depthTarget 41 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 42 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 43 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanHeightmap 44 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
//spec_const bool depthTargetHasSwappedViews 47 0
//spec_const bool fluidPressureHasSwappedViews 48 0
//spec_const bool intensityTextureHasSwappedViews 49 0
//spec_const bool oceanHeightmapHasSwappedViews 50 0
//spec_const bool sc_BlendMode_Add 51 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 52 0
//spec_const bool sc_BlendMode_AlphaTest 53 0
//spec_const bool sc_BlendMode_AlphaToCoverage 54 0
//spec_const bool sc_BlendMode_ColoredGlass 55 0
//spec_const bool sc_BlendMode_Custom 56 0
//spec_const bool sc_BlendMode_Max 57 0
//spec_const bool sc_BlendMode_Min 58 0
//spec_const bool sc_BlendMode_Multiply 59 0
//spec_const bool sc_BlendMode_MultiplyOriginal 60 0
//spec_const bool sc_BlendMode_Normal 61 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 62 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 63 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 64 0
//spec_const bool sc_BlendMode_Screen 65 0
//spec_const bool sc_BlendMode_Software 66 0
//spec_const bool sc_DepthOnly 67 0
//spec_const bool sc_FramebufferFetch 68 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 69 0
//spec_const bool sc_IsEditor 70 0
//spec_const bool sc_MotionVectorsPass 71 0
//spec_const bool sc_OITCompositingPass 72 0
//spec_const bool sc_OITDepthBoundsPass 73 0
//spec_const bool sc_OITDepthGatherPass 74 0
//spec_const bool sc_OITDepthPrepass 75 0
//spec_const bool sc_OITFrontLayerPass 76 0
//spec_const bool sc_OITMaxLayers4Plus1 77 0
//spec_const bool sc_OITMaxLayers8 78 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 79 0
//spec_const bool sc_ProjectiveShadowsCaster 80 0
//spec_const bool sc_ProjectiveShadowsReceiver 81 0
//spec_const bool sc_RenderAlphaToColor 82 0
//spec_const bool sc_ScreenTextureHasSwappedViews 83 0
//spec_const bool sc_ShaderComplexityAnalyzer 84 0
//spec_const bool sc_TAAEnabled 85 0
//spec_const bool sc_UseFramebufferFetchMarker 86 0
//spec_const bool sc_VertexBlending 87 0
//spec_const bool sc_VertexBlendingUseNormals 88 0
//spec_const bool screenTexHasSwappedViews 89 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_depthTarget 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 92 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 94 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_depthTarget 95 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 97 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap 98 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 99 -1
//spec_const int depthTargetLayout 100 0
//spec_const int fluidPressureLayout 101 0
//spec_const int intensityTextureLayout 102 0
//spec_const int oceanHeightmapLayout 103 0
//spec_const int sc_DepthBufferMode 104 0
//spec_const int sc_RenderingSpace 105 -1
//spec_const int sc_ScreenTextureLayout 106 0
//spec_const int sc_ShaderCacheConstant 107 0
//spec_const int sc_SkinBonesCount 108 0
//spec_const int sc_StereoRenderingMode 109 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 110 0
//spec_const int sc_StereoViewID 111 0
//spec_const int screenTexLayout 112 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
#if __VERSION__>=300
#define texture3D texture
#define textureCube texture
#define texture2DArray texture
#define texture2DLod textureLod
#define texture3DLod textureLod
#define texture2DLodEXT textureLod
#define texture3DLodEXT textureLod
#define textureCubeLod textureLod
#define textureCubeLodEXT textureLod
#define texture2DArrayLod textureLod
#define texture2DArrayLodEXT textureLod
#endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
struct sc_Vertex_t
{
vec4 position;
vec3 normal;
vec3 tangent;
vec2 texture0;
vec2 texture1;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_TAAEnabled
#define sc_TAAEnabled 0
#elif sc_TAAEnabled==1
#undef sc_TAAEnabled
#define sc_TAAEnabled 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef sc_VertexBlending
#define sc_VertexBlending 0
#elif sc_VertexBlending==1
#undef sc_VertexBlending
#define sc_VertexBlending 1
#endif
#ifndef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 0
#elif sc_VertexBlendingUseNormals==1
#undef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_DepthBufferMode
#define sc_DepthBufferMode 0
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform int PreviewEnabled;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 boneData;
attribute vec3 blendShape0Pos;
attribute vec3 blendShape0Normal;
attribute vec3 blendShape1Pos;
attribute vec3 blendShape1Normal;
attribute vec3 blendShape2Pos;
attribute vec3 blendShape2Normal;
attribute vec3 blendShape3Pos;
attribute vec3 blendShape4Pos;
attribute vec3 blendShape5Pos;
attribute vec4 position;
attribute vec3 normal;
attribute vec4 tangent;
attribute vec2 texture0;
attribute vec2 texture1;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec2 varShadowTex;
varying float varViewSpaceDepth;
varying vec4 varColor;
attribute vec4 color;
varying vec4 PreviewVertexColor;
varying float PreviewVertexSaved;
attribute vec3 positionNext;
attribute vec3 positionPrevious;
attribute vec4 strandProperties;
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
}
void sc_GetBoneMatrix(int index,out vec4 m0,out vec4 m1,out vec4 m2)
{
int l9_0=3*index;
m0=sc_BoneMatrices[l9_0];
m1=sc_BoneMatrices[l9_0+1];
m2=sc_BoneMatrices[l9_0+2];
}
vec3 skinVertexPosition(int i,vec4 v)
{
vec3 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 param_1;
vec4 param_2;
vec4 param_3;
sc_GetBoneMatrix(i,param_1,param_2,param_3);
l9_0=vec3(dot(v,param_1),dot(v,param_2),dot(v,param_3));
}
#else
{
l9_0=v.xyz;
}
#endif
return l9_0;
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=sc_StereoViewID;
}
#endif
return l9_0;
}
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void main()
{
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
vec2 l9_0;
vec2 l9_1;
vec3 l9_2;
vec3 l9_3;
vec4 l9_4;
#if (sc_VertexBlending)
{
vec2 l9_5;
vec2 l9_6;
vec3 l9_7;
vec3 l9_8;
vec4 l9_9;
#if (sc_VertexBlendingUseNormals)
{
sc_Vertex_t l9_10=sc_Vertex_t(position,normal,tangent.xyz,texture0,texture1);
blendTargetShapeWithNormal(l9_10,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(l9_10,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(l9_10,blendShape2Pos,blendShape2Normal,weights0.z);
l9_9=l9_10.position;
l9_8=l9_10.normal;
l9_7=l9_10.tangent;
l9_6=l9_10.texture0;
l9_5=l9_10.texture1;
}
#else
{
vec3 l9_12=(((((position.xyz+(blendShape0Pos*weights0.x)).xyz+(blendShape1Pos*weights0.y)).xyz+(blendShape2Pos*weights0.z)).xyz+(blendShape3Pos*weights0.w)).xyz+(blendShape4Pos*weights1.x)).xyz+(blendShape5Pos*weights1.y);
l9_9=vec4(l9_12.x,l9_12.y,l9_12.z,position.w);
l9_8=normal;
l9_7=tangent.xyz;
l9_6=texture0;
l9_5=texture1;
}
#endif
l9_4=l9_9;
l9_3=l9_8;
l9_2=l9_7;
l9_1=l9_6;
l9_0=l9_5;
}
#else
{
l9_4=position;
l9_3=normal;
l9_2=tangent.xyz;
l9_1=texture0;
l9_0=texture1;
}
#endif
vec3 l9_13;
vec3 l9_14;
vec4 l9_15;
#if (sc_SkinBonesCount>0)
{
vec4 l9_16;
#if (sc_SkinBonesCount>0)
{
vec4 l9_17=vec4(1.0,fract(boneData.yzw));
vec4 l9_18=l9_17;
l9_18.x=1.0-dot(l9_17.yzw,vec3(1.0));
l9_16=l9_18;
}
#else
{
l9_16=vec4(0.0);
}
#endif
int l9_19=int(boneData.x);
int l9_20=int(boneData.y);
int l9_21=int(boneData.z);
int l9_22=int(boneData.w);
vec3 l9_23=(((skinVertexPosition(l9_19,l9_4)*l9_16.x)+(skinVertexPosition(l9_20,l9_4)*l9_16.y))+(skinVertexPosition(l9_21,l9_4)*l9_16.z))+(skinVertexPosition(l9_22,l9_4)*l9_16.w);
l9_15=vec4(l9_23.x,l9_23.y,l9_23.z,l9_4.w);
l9_14=((((sc_SkinBonesNormalMatrices[l9_19]*l9_3)*l9_16.x)+((sc_SkinBonesNormalMatrices[l9_20]*l9_3)*l9_16.y))+((sc_SkinBonesNormalMatrices[l9_21]*l9_3)*l9_16.z))+((sc_SkinBonesNormalMatrices[l9_22]*l9_3)*l9_16.w);
l9_13=((((sc_SkinBonesNormalMatrices[l9_19]*l9_2)*l9_16.x)+((sc_SkinBonesNormalMatrices[l9_20]*l9_2)*l9_16.y))+((sc_SkinBonesNormalMatrices[l9_21]*l9_2)*l9_16.z))+((sc_SkinBonesNormalMatrices[l9_22]*l9_2)*l9_16.w);
}
#else
{
l9_15=l9_4;
l9_14=l9_3;
l9_13=l9_2;
}
#endif
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_15.xyz;
varNormal=l9_14;
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_15).xyz;
varNormal=sc_NormalMatrix*l9_14;
vec3 l9_24=sc_NormalMatrix*l9_13;
varTangent=vec4(l9_24.x,l9_24.y,l9_24.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_25=PreviewEnabled==1;
vec2 l9_26;
if (l9_25)
{
vec2 l9_27=l9_1;
l9_27.x=1.0-l9_1.x;
l9_26=l9_27;
}
else
{
l9_26=l9_1;
}
varColor=color;
vec3 l9_28=varPos;
vec3 l9_29=varNormal;
vec3 l9_30;
vec3 l9_31;
vec3 l9_32;
if (l9_25)
{
l9_32=varTangent.xyz;
l9_31=varNormal;
l9_30=varPos;
}
else
{
l9_32=varTangent.xyz;
l9_31=l9_29;
l9_30=l9_28;
}
varPos=l9_30;
varNormal=normalize(l9_31);
vec3 l9_33=normalize(l9_32);
varTangent=vec4(l9_33.x,l9_33.y,l9_33.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_34;
#if (sc_RenderingSpace==3)
{
l9_34=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_35;
#if (sc_RenderingSpace==2)
{
l9_35=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_36;
#if (sc_RenderingSpace==1)
{
l9_36=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
l9_36=l9_15;
}
#endif
l9_35=l9_36;
}
#endif
l9_34=l9_35;
}
#endif
varViewSpaceDepth=-l9_34.z;
}
#endif
vec4 l9_37;
#if (sc_RenderingSpace==3)
{
l9_37=l9_15;
}
#else
{
vec4 l9_38;
#if (sc_RenderingSpace==4)
{
l9_38=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_39;
#if (sc_RenderingSpace==2)
{
l9_39=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_40;
#if (sc_RenderingSpace==1)
{
l9_40=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_40=vec4(0.0);
}
#endif
l9_39=l9_40;
}
#endif
l9_38=l9_39;
}
#endif
l9_37=l9_38;
}
#endif
varPackedTex=vec4(l9_26,l9_0);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_41;
#if (sc_RenderingSpace==1)
{
l9_41=sc_ModelMatrix*l9_15;
}
#else
{
l9_41=l9_15;
}
#endif
vec4 l9_42=sc_ProjectorMatrix*l9_41;
varShadowTex=((l9_42.xy/vec2(l9_42.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_43;
#if (sc_DepthBufferMode==1)
{
vec4 l9_44;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_45=l9_37;
l9_45.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_37.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_37.w;
l9_44=l9_45;
}
else
{
l9_44=l9_37;
}
l9_43=l9_44;
}
#else
{
l9_43=l9_37;
}
#endif
vec4 l9_46;
#if (sc_TAAEnabled)
{
vec2 l9_47=l9_43.xy+(sc_TAAJitterOffset*l9_43.w);
l9_46=vec4(l9_47.x,l9_47.y,l9_43.z,l9_43.w);
}
#else
{
l9_46=l9_43;
}
#endif
vec4 l9_48;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_49=l9_46;
l9_49.x=l9_46.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_48=l9_49;
}
#else
{
l9_48=l9_46;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_50=dot(l9_48,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_50);
}
#else
{
varClipDistance=l9_50;
}
#endif
}
#endif
gl_Position=l9_48;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
#if __VERSION__>=300
#define texture3D texture
#define textureCube texture
#define texture2DArray texture
#define texture2DLod textureLod
#define texture3DLod textureLod
#define texture2DLodEXT textureLod
#define texture3DLodEXT textureLod
#define textureCubeLod textureLod
#define textureCubeLodEXT textureLod
#define texture2DArrayLod textureLod
#define texture2DArrayLodEXT textureLod
#endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#if sc_ExporterVersion<224
#define MAIN main
#endif
    #ifndef sc_FramebufferFetch
    #define sc_FramebufferFetch 0
    #elif sc_FramebufferFetch==1
    #undef sc_FramebufferFetch
    #define sc_FramebufferFetch 1
    #endif
    #if !defined(GL_ES)&&__VERSION__<420
        #ifdef FRAGMENT_SHADER
            #define sc_FragData0 gl_FragData[0]
            #define sc_FragData1 gl_FragData[1]
            #define sc_FragData2 gl_FragData[2]
            #define sc_FragData3 gl_FragData[3]
        #endif
        mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
        #define gl_LastFragData (getFragData())
        #if sc_FramebufferFetch
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #elif defined(sc_EnableFeatureLevelES3)
        #if sc_FragDataCount>=1
            #define sc_DeclareFragData0(StorageQualifier) layout(location=0) StorageQualifier sc_FragmentPrecision vec4 sc_FragData0
        #endif
        #if sc_FragDataCount>=2
            #define sc_DeclareFragData1(StorageQualifier) layout(location=1) StorageQualifier sc_FragmentPrecision vec4 sc_FragData1
        #endif
        #if sc_FragDataCount>=3
            #define sc_DeclareFragData2(StorageQualifier) layout(location=2) StorageQualifier sc_FragmentPrecision vec4 sc_FragData2
        #endif
        #if sc_FragDataCount>=4
            #define sc_DeclareFragData3(StorageQualifier) layout(location=3) StorageQualifier sc_FragmentPrecision vec4 sc_FragData3
        #endif
        #ifndef sc_DeclareFragData0
            #define sc_DeclareFragData0(_) const vec4 sc_FragData0=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData1
            #define sc_DeclareFragData1(_) const vec4 sc_FragData1=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData2
            #define sc_DeclareFragData2(_) const vec4 sc_FragData2=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData3
            #define sc_DeclareFragData3(_) const vec4 sc_FragData3=vec4(0.0)
        #endif
        #if sc_FramebufferFetch
            #ifdef GL_EXT_shader_framebuffer_fetch
                sc_DeclareFragData0(inout);
                sc_DeclareFragData1(inout);
                sc_DeclareFragData2(inout);
                sc_DeclareFragData3(inout);
                mediump mat4 getFragData() { return mat4(sc_FragData0,sc_FragData1,sc_FragData2,sc_FragData3); }
                #define gl_LastFragData (getFragData())
            #elif defined(GL_ARM_shader_framebuffer_fetch)
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(gl_LastFragColorARM,vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #else
            #ifdef sc_EnableFeatureLevelES3
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #endif
    #elif defined(sc_EnableFeatureLevelES2)
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #else
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #endif
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec2 Surface_UVCoord0;
vec2 gScreenCoord;
float CameraFOV;
float Loop_Index_ID0;
float Loop_Ratio_ID0;
float Loop_Count_ID0;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 0
#elif sc_UseFramebufferFetchMarker==1
#undef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 1
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 0
#elif sc_GetFramebufferColorInvalidUsageMarker==1
#undef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
#ifndef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 0
#elif intensityTextureHasSwappedViews==1
#undef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 1
#endif
#ifndef intensityTextureLayout
#define intensityTextureLayout 0
#endif
#ifndef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 0
#elif BLEND_MODE_REALISTIC==1
#undef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 1
#endif
#ifndef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 0
#elif BLEND_MODE_FORGRAY==1
#undef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 1
#endif
#ifndef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 0
#elif BLEND_MODE_NOTBRIGHT==1
#undef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 1
#endif
#ifndef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 0
#elif BLEND_MODE_DIVISION==1
#undef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 1
#endif
#ifndef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 0
#elif BLEND_MODE_BRIGHT==1
#undef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 1
#endif
#ifndef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 0
#elif BLEND_MODE_INTENSE==1
#undef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 0
#elif SC_USE_UV_TRANSFORM_intensityTexture==1
#undef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_U_intensityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_V_intensityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 0
#elif SC_USE_UV_MIN_MAX_intensityTexture==1
#undef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_intensityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 1
#endif
#ifndef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 0
#elif BLEND_MODE_LIGHTEN==1
#undef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 1
#endif
#ifndef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 0
#elif BLEND_MODE_DARKEN==1
#undef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 1
#endif
#ifndef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 0
#elif BLEND_MODE_DIVIDE==1
#undef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 1
#endif
#ifndef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 0
#elif BLEND_MODE_AVERAGE==1
#undef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 1
#endif
#ifndef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 0
#elif BLEND_MODE_SUBTRACT==1
#undef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 1
#endif
#ifndef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 0
#elif BLEND_MODE_DIFFERENCE==1
#undef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 1
#endif
#ifndef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 0
#elif BLEND_MODE_NEGATION==1
#undef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 1
#endif
#ifndef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 0
#elif BLEND_MODE_EXCLUSION==1
#undef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 1
#endif
#ifndef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 0
#elif BLEND_MODE_OVERLAY==1
#undef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 1
#endif
#ifndef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 0
#elif BLEND_MODE_SOFT_LIGHT==1
#undef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 0
#elif BLEND_MODE_HARD_LIGHT==1
#undef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 1
#endif
#ifndef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 0
#elif BLEND_MODE_COLOR_DODGE==1
#undef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 1
#endif
#ifndef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 0
#elif BLEND_MODE_COLOR_BURN==1
#undef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 1
#endif
#ifndef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 0
#elif BLEND_MODE_LINEAR_LIGHT==1
#undef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 1
#endif
#ifndef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 0
#elif BLEND_MODE_VIVID_LIGHT==1
#undef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 1
#endif
#ifndef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 0
#elif BLEND_MODE_PIN_LIGHT==1
#undef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 0
#elif BLEND_MODE_HARD_MIX==1
#undef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 1
#endif
#ifndef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 0
#elif BLEND_MODE_HARD_REFLECT==1
#undef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 1
#endif
#ifndef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 0
#elif BLEND_MODE_HARD_GLOW==1
#undef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 1
#endif
#ifndef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 0
#elif BLEND_MODE_HARD_PHOENIX==1
#undef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 1
#endif
#ifndef BLEND_MODE_HUE
#define BLEND_MODE_HUE 0
#elif BLEND_MODE_HUE==1
#undef BLEND_MODE_HUE
#define BLEND_MODE_HUE 1
#endif
#ifndef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 0
#elif BLEND_MODE_SATURATION==1
#undef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 1
#endif
#ifndef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 0
#elif BLEND_MODE_COLOR==1
#undef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 1
#endif
#ifndef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 0
#elif BLEND_MODE_LUMINOSITY==1
#undef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 1
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef depthTargetHasSwappedViews
#define depthTargetHasSwappedViews 0
#elif depthTargetHasSwappedViews==1
#undef depthTargetHasSwappedViews
#define depthTargetHasSwappedViews 1
#endif
#ifndef depthTargetLayout
#define depthTargetLayout 0
#endif
#ifndef oceanHeightmapHasSwappedViews
#define oceanHeightmapHasSwappedViews 0
#elif oceanHeightmapHasSwappedViews==1
#undef oceanHeightmapHasSwappedViews
#define oceanHeightmapHasSwappedViews 1
#endif
#ifndef oceanHeightmapLayout
#define oceanHeightmapLayout 0
#endif
#ifndef fluidPressureHasSwappedViews
#define fluidPressureHasSwappedViews 0
#elif fluidPressureHasSwappedViews==1
#undef fluidPressureHasSwappedViews
#define fluidPressureHasSwappedViews 1
#endif
#ifndef fluidPressureLayout
#define fluidPressureLayout 0
#endif
#ifndef screenTexHasSwappedViews
#define screenTexHasSwappedViews 0
#elif screenTexHasSwappedViews==1
#undef screenTexHasSwappedViews
#define screenTexHasSwappedViews 1
#endif
#ifndef screenTexLayout
#define screenTexLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_oceanHeightmap
#define SC_USE_UV_TRANSFORM_oceanHeightmap 0
#elif SC_USE_UV_TRANSFORM_oceanHeightmap==1
#undef SC_USE_UV_TRANSFORM_oceanHeightmap
#define SC_USE_UV_TRANSFORM_oceanHeightmap 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap
#define SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap
#define SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap -1
#endif
#ifndef SC_USE_UV_MIN_MAX_oceanHeightmap
#define SC_USE_UV_MIN_MAX_oceanHeightmap 0
#elif SC_USE_UV_MIN_MAX_oceanHeightmap==1
#undef SC_USE_UV_MIN_MAX_oceanHeightmap
#define SC_USE_UV_MIN_MAX_oceanHeightmap 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_oceanHeightmap
#define SC_USE_CLAMP_TO_BORDER_oceanHeightmap 0
#elif SC_USE_CLAMP_TO_BORDER_oceanHeightmap==1
#undef SC_USE_CLAMP_TO_BORDER_oceanHeightmap
#define SC_USE_CLAMP_TO_BORDER_oceanHeightmap 1
#endif
#ifndef SC_USE_UV_TRANSFORM_fluidPressure
#define SC_USE_UV_TRANSFORM_fluidPressure 0
#elif SC_USE_UV_TRANSFORM_fluidPressure==1
#undef SC_USE_UV_TRANSFORM_fluidPressure
#define SC_USE_UV_TRANSFORM_fluidPressure 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_fluidPressure
#define SC_SOFTWARE_WRAP_MODE_U_fluidPressure -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_fluidPressure
#define SC_SOFTWARE_WRAP_MODE_V_fluidPressure -1
#endif
#ifndef SC_USE_UV_MIN_MAX_fluidPressure
#define SC_USE_UV_MIN_MAX_fluidPressure 0
#elif SC_USE_UV_MIN_MAX_fluidPressure==1
#undef SC_USE_UV_MIN_MAX_fluidPressure
#define SC_USE_UV_MIN_MAX_fluidPressure 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_fluidPressure
#define SC_USE_CLAMP_TO_BORDER_fluidPressure 0
#elif SC_USE_CLAMP_TO_BORDER_fluidPressure==1
#undef SC_USE_CLAMP_TO_BORDER_fluidPressure
#define SC_USE_CLAMP_TO_BORDER_fluidPressure 1
#endif
#ifndef SC_USE_UV_TRANSFORM_screenTex
#define SC_USE_UV_TRANSFORM_screenTex 0
#elif SC_USE_UV_TRANSFORM_screenTex==1
#undef SC_USE_UV_TRANSFORM_screenTex
#define SC_USE_UV_TRANSFORM_screenTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenTex
#define SC_SOFTWARE_WRAP_MODE_U_screenTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenTex
#define SC_SOFTWARE_WRAP_MODE_V_screenTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenTex
#define SC_USE_UV_MIN_MAX_screenTex 0
#elif SC_USE_UV_MIN_MAX_screenTex==1
#undef SC_USE_UV_MIN_MAX_screenTex
#define SC_USE_UV_MIN_MAX_screenTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenTex
#define SC_USE_CLAMP_TO_BORDER_screenTex 0
#elif SC_USE_CLAMP_TO_BORDER_screenTex==1
#undef SC_USE_CLAMP_TO_BORDER_screenTex
#define SC_USE_CLAMP_TO_BORDER_screenTex 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
#ifndef SC_USE_UV_TRANSFORM_depthTarget
#define SC_USE_UV_TRANSFORM_depthTarget 0
#elif SC_USE_UV_TRANSFORM_depthTarget==1
#undef SC_USE_UV_TRANSFORM_depthTarget
#define SC_USE_UV_TRANSFORM_depthTarget 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_depthTarget
#define SC_SOFTWARE_WRAP_MODE_U_depthTarget -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_depthTarget
#define SC_SOFTWARE_WRAP_MODE_V_depthTarget -1
#endif
#ifndef SC_USE_UV_MIN_MAX_depthTarget
#define SC_USE_UV_MIN_MAX_depthTarget 0
#elif SC_USE_UV_MIN_MAX_depthTarget==1
#undef SC_USE_UV_MIN_MAX_depthTarget
#define SC_USE_UV_MIN_MAX_depthTarget 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_depthTarget
#define SC_USE_CLAMP_TO_BORDER_depthTarget 0
#elif SC_USE_CLAMP_TO_BORDER_depthTarget==1
#undef SC_USE_CLAMP_TO_BORDER_depthTarget
#define SC_USE_CLAMP_TO_BORDER_depthTarget 1
#endif
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform float shaderComplexityValue;
uniform vec4 sc_UniformConstants;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform mat3 oceanHeightmapTransform;
uniform vec4 oceanHeightmapUvMinMax;
uniform vec4 oceanHeightmapBorderColor;
uniform mat3 fluidPressureTransform;
uniform vec4 fluidPressureUvMinMax;
uniform vec4 fluidPressureBorderColor;
uniform mat3 screenTexTransform;
uniform vec4 screenTexUvMinMax;
uniform vec4 screenTexBorderColor;
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform vec3 oceanPos;
uniform vec3 oceanMin;
uniform vec3 oceanMax;
uniform vec2 unpackVal;
uniform float enableFluid;
uniform vec2 pressureRange;
uniform float fluidMul;
uniform vec4 screenTexSize;
uniform float blurFactor;
uniform vec2 Port_Item0_N064;
uniform vec2 Port_Item1_N064;
uniform vec2 Port_Item2_N064;
uniform vec2 Port_Item3_N064;
uniform vec2 Port_Item4_N064;
uniform vec2 Port_Item5_N064;
uniform vec2 Port_Item6_N064;
uniform vec2 Port_Item7_N064;
uniform float Port_Input1_N050;
uniform vec3 underwaterTint;
uniform float enableLine;
uniform vec3 lineTint;
uniform float meniscusThickness;
uniform float Port_Depth_N004;
uniform vec4 sc_Time;
uniform vec2 Port_Input0_N228;
uniform float Port_Input1_N233;
uniform float Port_Input1_N235;
uniform mat3 depthTargetTransform;
uniform vec4 depthTargetUvMinMax;
uniform vec4 depthTargetBorderColor;
uniform vec4 depthTargetProjectionMatrixTerms;
uniform float Port_Value3_N237;
uniform float Port_Input2_N069;
uniform int PreviewEnabled;
uniform sampler2D depthTarget;
uniform sampler2D screenTex;
uniform sampler2D oceanHeightmap;
uniform sampler2D fluidPressure;
uniform sampler2D sc_ScreenTexture;
uniform sampler2D intensityTexture;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float varViewSpaceDepth;
varying vec4 PreviewVertexColor;
varying float PreviewVertexSaved;
varying vec4 varPackedTex;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=int(varStereoViewID);
}
#endif
return l9_0;
}
vec2 sc_SamplingCoordsGlobalToView(vec3 uvi,int renderingLayout,int viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
vec2 sc_ScreenCoordsGlobalToView(vec2 uv)
{
vec2 l9_0;
#if (sc_StereoRenderingMode==1)
{
l9_0=sc_SamplingCoordsGlobalToView(vec3(uv,0.0),1,sc_GetStereoViewIndex());
}
#else
{
l9_0=uv;
}
#endif
return l9_0;
}
void sc_SoftwareWrapEarly(inout float uv,int softwareWrapMode)
{
if (softwareWrapMode==1)
{
uv=fract(uv);
}
else
{
if (softwareWrapMode==2)
{
float l9_0=fract(uv);
uv=mix(l9_0,1.0-l9_0,clamp(step(0.25,fract((uv-l9_0)*0.5)),0.0,1.0));
}
}
}
void sc_ClampUV(inout float value,float minValue,float maxValue,bool useClampToBorder,inout float clampToBorderFactor)
{
float l9_0=clamp(value,minValue,maxValue);
float l9_1=step(abs(value-l9_0),9.9999997e-06);
clampToBorderFactor*=(l9_1+((1.0-float(useClampToBorder))*(1.0-l9_1)));
value=l9_0;
}
vec2 sc_TransformUV(vec2 uv,bool useUvTransform,mat3 uvTransform)
{
if (useUvTransform)
{
uv=vec2((uvTransform*vec3(uv,1.0)).xy);
}
return uv;
}
void sc_SoftwareWrapLate(inout float uv,int softwareWrapMode,bool useClampToBorder,inout float clampToBorderFactor)
{
if ((softwareWrapMode==0)||(softwareWrapMode==3))
{
sc_ClampUV(uv,0.0,1.0,useClampToBorder,clampToBorderFactor);
}
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
int screenTexGetStereoViewIndex()
{
int l9_0;
#if (screenTexHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void Node64_Float_Array_Value(float Index,out vec2 Value,out float SizeOut,vec2 Item0,vec2 Item1,vec2 Item2,vec2 Item3,vec2 Item4,vec2 Item5,vec2 Item6,vec2 Item7,ssGlobals Globals)
{
vec2 Array[8];
Array[0]=Item0;
Array[1]=Item1;
Array[2]=Item2;
Array[3]=Item3;
Array[4]=Item4;
Array[5]=Item5;
Array[6]=Item6;
Array[7]=Item7;
SizeOut=8.0;
Value=Array[int(clamp(Index+9.9999997e-05,0.0,7.0))];
}
void LoopFunction_N68(float Index,float Ratio,inout vec4 Output,ssGlobals Globals)
{
Globals.Loop_Index_ID0=Index;
Globals.Loop_Ratio_ID0=Ratio;
vec2 param_1;
float param_2;
Node64_Float_Array_Value(Globals.Loop_Index_ID0,param_1,param_2,Port_Item0_N064,Port_Item1_N064,Port_Item2_N064,Port_Item3_N064,Port_Item4_N064,Port_Item5_N064,Port_Item6_N064,Port_Item7_N064,Globals);
vec2 l9_0=Globals.gScreenCoord+((screenTexSize.zw*vec2(exp2(blurFactor)))*param_1);
bool l9_1=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTex)!=0));
float l9_2=l9_0.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_3=l9_2;
float l9_4=l9_0.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_1,l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_1,l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_23=texture2DLod(screenTex,l9_22.xy,blurFactor+Port_Input1_N050);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_24=mix(screenTexBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
Output+=l9_24;
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
float transformSingleColor(float original,float intMap,float target)
{
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
return original/pow(1.0-target,intMap);
}
#else
{
#if (BLEND_MODE_DIVISION)
{
return original/(1.0-target);
}
#else
{
#if (BLEND_MODE_BRIGHT)
{
return original/pow(1.0-target,2.0-(2.0*original));
}
#endif
}
#endif
}
#endif
return 0.0;
}
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.66666669);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.33333334);
}
vec4 l9_1;
if (rgb.x<l9_0.x)
{
l9_1=vec4(l9_0.xyw,rgb.x);
}
else
{
l9_1=vec4(rgb.x,l9_0.yzx);
}
float l9_2=l9_1.x-min(l9_1.w,l9_1.y);
return vec3(abs(((l9_1.w-l9_1.y)/((6.0*l9_2)+1e-07))+l9_1.z),l9_2,l9_1.x);
}
vec3 RGBToHSL(vec3 rgb)
{
vec3 l9_0=RGBtoHCV(rgb);
float l9_1=l9_0.y;
float l9_2=l9_0.z-(l9_1*0.5);
return vec3(l9_0.x,l9_1/((1.0-abs((2.0*l9_2)-1.0))+1e-07),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
}
vec3 definedBlend(vec3 a,vec3 b)
{
#if (BLEND_MODE_LIGHTEN)
{
return max(a,b);
}
#else
{
#if (BLEND_MODE_DARKEN)
{
return min(a,b);
}
#else
{
#if (BLEND_MODE_DIVIDE)
{
return b/a;
}
#else
{
#if (BLEND_MODE_AVERAGE)
{
return (a+b)*0.5;
}
#else
{
#if (BLEND_MODE_SUBTRACT)
{
return max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
#if (BLEND_MODE_DIFFERENCE)
{
return abs(a-b);
}
#else
{
#if (BLEND_MODE_NEGATION)
{
return vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
#if (BLEND_MODE_EXCLUSION)
{
return (a+b)-((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_OVERLAY)
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1;
if (a.y<0.5)
{
l9_1=(2.0*a.y)*b.y;
}
else
{
l9_1=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_2;
if (a.z<0.5)
{
l9_2=(2.0*a.z)*b.z;
}
else
{
l9_2=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return vec3(l9_0,l9_1,l9_2);
}
#else
{
#if (BLEND_MODE_SOFT_LIGHT)
{
return (((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_3;
if (b.x<0.5)
{
l9_3=(2.0*b.x)*a.x;
}
else
{
l9_3=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_4;
if (b.y<0.5)
{
l9_4=(2.0*b.y)*a.y;
}
else
{
l9_4=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_5;
if (b.z<0.5)
{
l9_5=(2.0*b.z)*a.z;
}
else
{
l9_5=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return vec3(l9_3,l9_4,l9_5);
}
#else
{
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_6;
if (b.x==1.0)
{
l9_6=b.x;
}
else
{
l9_6=min(a.x/(1.0-b.x),1.0);
}
float l9_7;
if (b.y==1.0)
{
l9_7=b.y;
}
else
{
l9_7=min(a.y/(1.0-b.y),1.0);
}
float l9_8;
if (b.z==1.0)
{
l9_8=b.z;
}
else
{
l9_8=min(a.z/(1.0-b.z),1.0);
}
return vec3(l9_6,l9_7,l9_8);
}
#else
{
#if (BLEND_MODE_COLOR_BURN)
{
float l9_9;
if (b.x==0.0)
{
l9_9=b.x;
}
else
{
l9_9=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_10;
if (b.y==0.0)
{
l9_10=b.y;
}
else
{
l9_10=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_11;
if (b.z==0.0)
{
l9_11=b.z;
}
else
{
l9_11=max(1.0-((1.0-a.z)/b.z),0.0);
}
return vec3(l9_9,l9_10,l9_11);
}
#else
{
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_12;
if (b.x<0.5)
{
l9_12=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_12=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_13;
if (b.y<0.5)
{
l9_13=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_13=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_14;
if (b.z<0.5)
{
l9_14=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_14=min(a.z+(2.0*(b.z-0.5)),1.0);
}
return vec3(l9_12,l9_13,l9_14);
}
#else
{
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_15;
if (b.x<0.5)
{
float l9_16;
if ((2.0*b.x)==0.0)
{
l9_16=2.0*b.x;
}
else
{
l9_16=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_15=l9_16;
}
else
{
float l9_17;
if ((2.0*(b.x-0.5))==1.0)
{
l9_17=2.0*(b.x-0.5);
}
else
{
l9_17=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_15=l9_17;
}
float l9_18;
if (b.y<0.5)
{
float l9_19;
if ((2.0*b.y)==0.0)
{
l9_19=2.0*b.y;
}
else
{
l9_19=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_18=l9_19;
}
else
{
float l9_20;
if ((2.0*(b.y-0.5))==1.0)
{
l9_20=2.0*(b.y-0.5);
}
else
{
l9_20=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_18=l9_20;
}
float l9_21;
if (b.z<0.5)
{
float l9_22;
if ((2.0*b.z)==0.0)
{
l9_22=2.0*b.z;
}
else
{
l9_22=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_21=l9_22;
}
else
{
float l9_23;
if ((2.0*(b.z-0.5))==1.0)
{
l9_23=2.0*(b.z-0.5);
}
else
{
l9_23=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_21=l9_23;
}
return vec3(l9_15,l9_18,l9_21);
}
#else
{
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_24;
if (b.x<0.5)
{
l9_24=min(a.x,2.0*b.x);
}
else
{
l9_24=max(a.x,2.0*(b.x-0.5));
}
float l9_25;
if (b.y<0.5)
{
l9_25=min(a.y,2.0*b.y);
}
else
{
l9_25=max(a.y,2.0*(b.y-0.5));
}
float l9_26;
if (b.z<0.5)
{
l9_26=min(a.z,2.0*b.z);
}
else
{
l9_26=max(a.z,2.0*(b.z-0.5));
}
return vec3(l9_24,l9_25,l9_26);
}
#else
{
#if (BLEND_MODE_HARD_MIX)
{
float l9_27;
if (b.x<0.5)
{
float l9_28;
if ((2.0*b.x)==0.0)
{
l9_28=2.0*b.x;
}
else
{
l9_28=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_27=l9_28;
}
else
{
float l9_29;
if ((2.0*(b.x-0.5))==1.0)
{
l9_29=2.0*(b.x-0.5);
}
else
{
l9_29=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_27=l9_29;
}
bool l9_30=l9_27<0.5;
float l9_31;
if (b.y<0.5)
{
float l9_32;
if ((2.0*b.y)==0.0)
{
l9_32=2.0*b.y;
}
else
{
l9_32=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_31=l9_32;
}
else
{
float l9_33;
if ((2.0*(b.y-0.5))==1.0)
{
l9_33=2.0*(b.y-0.5);
}
else
{
l9_33=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_31=l9_33;
}
bool l9_34=l9_31<0.5;
float l9_35;
if (b.z<0.5)
{
float l9_36;
if ((2.0*b.z)==0.0)
{
l9_36=2.0*b.z;
}
else
{
l9_36=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_35=l9_36;
}
else
{
float l9_37;
if ((2.0*(b.z-0.5))==1.0)
{
l9_37=2.0*(b.z-0.5);
}
else
{
l9_37=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_35=l9_37;
}
return vec3(l9_30 ? 0.0 : 1.0,l9_34 ? 0.0 : 1.0,(l9_35<0.5) ? 0.0 : 1.0);
}
#else
{
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_38;
if (b.x==1.0)
{
l9_38=b.x;
}
else
{
l9_38=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_39;
if (b.y==1.0)
{
l9_39=b.y;
}
else
{
l9_39=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_40;
if (b.z==1.0)
{
l9_40=b.z;
}
else
{
l9_40=min((a.z*a.z)/(1.0-b.z),1.0);
}
return vec3(l9_38,l9_39,l9_40);
}
#else
{
#if (BLEND_MODE_HARD_GLOW)
{
float l9_41;
if (a.x==1.0)
{
l9_41=a.x;
}
else
{
l9_41=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_42;
if (a.y==1.0)
{
l9_42=a.y;
}
else
{
l9_42=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_43;
if (a.z==1.0)
{
l9_43=a.z;
}
else
{
l9_43=min((b.z*b.z)/(1.0-a.z),1.0);
}
return vec3(l9_41,l9_42,l9_43);
}
#else
{
#if (BLEND_MODE_HARD_PHOENIX)
{
return (min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
#if (BLEND_MODE_HUE)
{
return HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
#if (BLEND_MODE_SATURATION)
{
vec3 l9_44=RGBToHSL(a);
return HSLToRGB(vec3(l9_44.x,RGBToHSL(b).y,l9_44.z));
}
#else
{
#if (BLEND_MODE_COLOR)
{
return HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
#if (BLEND_MODE_LUMINOSITY)
{
return HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_45=a;
vec3 l9_46=b;
float l9_47=((0.29899999*l9_45.x)+(0.58700001*l9_45.y))+(0.114*l9_45.z);
int l9_48;
#if (intensityTextureHasSwappedViews)
{
l9_48=1-sc_GetStereoViewIndex();
}
#else
{
l9_48=sc_GetStereoViewIndex();
}
#endif
bool l9_49=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_50=pow(l9_47,1.0/correctedIntensity);
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_51=l9_50;
float l9_52=0.5;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_53=l9_52;
vec2 l9_54;
float l9_55;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_56;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_56=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_56=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_57=l9_51;
float l9_58=1.0;
sc_ClampUV(l9_57,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_56,l9_58);
float l9_59=l9_57;
float l9_60=l9_58;
bool l9_61;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_61=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_61=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_62=l9_53;
float l9_63=l9_60;
sc_ClampUV(l9_62,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_61,l9_63);
l9_55=l9_63;
l9_54=vec2(l9_59,l9_62);
}
#else
{
l9_55=1.0;
l9_54=vec2(l9_51,l9_53);
}
#endif
vec2 l9_64=sc_TransformUV(l9_54,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_65=l9_64.x;
float l9_66=l9_55;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_49,l9_66);
float l9_67=l9_64.y;
float l9_68=l9_66;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_49,l9_68);
float l9_69=l9_68;
vec3 l9_70=sc_SamplingCoordsViewToGlobal(vec2(l9_65,l9_67),intensityTextureLayout,l9_48);
vec4 l9_71=texture2D(intensityTexture,l9_70.xy,0.0);
vec4 l9_72;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_72=mix(intensityTextureBorderColor,l9_71,vec4(l9_69));
}
#else
{
l9_72=l9_71;
}
#endif
float l9_73=((((l9_72.x*256.0)+l9_72.y)+(l9_72.z/256.0))/257.00391)*16.0;
float l9_74;
#if (BLEND_MODE_FORGRAY)
{
l9_74=max(l9_73,1.0);
}
#else
{
l9_74=l9_73;
}
#endif
float l9_75;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_75=min(l9_74,1.0);
}
#else
{
l9_75=l9_74;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_75);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
vec4 outputMotionVectorsIfNeeded(vec3 surfacePosWorldSpace,vec4 finalColor)
{
#if (sc_MotionVectorsPass)
{
vec4 l9_0=vec4(surfacePosWorldSpace,1.0);
vec4 l9_1=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_0;
vec4 l9_2=((sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*sc_PrevFrameModelMatrix)*sc_ModelMatrixInverse)*l9_0;
vec2 l9_3=((l9_1.xy/vec2(l9_1.w)).xy-(l9_2.xy/vec2(l9_2.w)).xy)*0.5;
float l9_4=floor(((l9_3.x*5.0)+0.5)*65535.0);
float l9_5=floor(l9_4*0.00390625);
float l9_6=floor(((l9_3.y*5.0)+0.5)*65535.0);
float l9_7=floor(l9_6*0.00390625);
return vec4(l9_5/255.0,(l9_4-(l9_5*256.0))/255.0,l9_7/255.0,(l9_6-(l9_7*256.0))/255.0);
}
#else
{
return finalColor;
}
#endif
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
    col.x+=zero*float(cacheConst);
    sc_FragData0=col;
}
float getFrontLayerZTestEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 5e-07;
}
#else
{
return 5.0000001e-08;
}
#endif
}
void unpackValues(float channel,int passIndex,inout int values[8])
{
#if (sc_OITCompositingPass)
{
channel=floor((channel*255.0)+0.5);
int l9_0=((passIndex+1)*4)-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_0>=(passIndex*4))
{
values[l9_0]=(values[l9_0]*4)+int(floor(mod(channel,4.0)));
channel=floor(channel/4.0);
l9_0--;
continue;
}
else
{
break;
}
}
}
#endif
}
float getDepthOrderingEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 0.001;
}
#else
{
return 0.0;
}
#endif
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float viewSpaceDepth()
{
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
return varViewSpaceDepth;
}
#else
{
return sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
}
float packValue(inout int value)
{
#if (sc_OITDepthGatherPass)
{
int l9_0=value;
value/=4;
return floor(floor(mod(float(l9_0),4.0))*64.0)/255.0;
}
#else
{
return 0.0;
}
#endif
}
void sc_writeFragData1(vec4 col)
{
#if sc_FragDataCount>=2
    sc_FragData1=col;
#endif
}
void sc_writeFragData2(vec4 col)
{
#if sc_FragDataCount>=3
    sc_FragData2=col;
#endif
}
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
vec2 l9_0=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_1=sc_ScreenCoordsGlobalToView(l9_0);
float l9_2=(atan(1.0/sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][1].y)*2.0)*57.29578;
int l9_3;
#if (depthTargetHasSwappedViews)
{
l9_3=1-sc_GetStereoViewIndex();
}
#else
{
l9_3=sc_GetStereoViewIndex();
}
#endif
bool l9_4=(int(SC_USE_CLAMP_TO_BORDER_depthTarget)!=0)&&(!(int(SC_USE_UV_MIN_MAX_depthTarget)!=0));
float l9_5=varPackedTex.x;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).x);
float l9_6=l9_5;
float l9_7=varPackedTex.y;
sc_SoftwareWrapEarly(l9_7,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).y);
float l9_8=l9_7;
vec2 l9_9;
float l9_10;
#if (SC_USE_UV_MIN_MAX_depthTarget)
{
bool l9_11;
#if (SC_USE_CLAMP_TO_BORDER_depthTarget)
{
l9_11=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).x==3;
}
#else
{
l9_11=(int(SC_USE_CLAMP_TO_BORDER_depthTarget)!=0);
}
#endif
float l9_12=l9_6;
float l9_13=1.0;
sc_ClampUV(l9_12,depthTargetUvMinMax.x,depthTargetUvMinMax.z,l9_11,l9_13);
float l9_14=l9_12;
float l9_15=l9_13;
bool l9_16;
#if (SC_USE_CLAMP_TO_BORDER_depthTarget)
{
l9_16=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).y==3;
}
#else
{
l9_16=(int(SC_USE_CLAMP_TO_BORDER_depthTarget)!=0);
}
#endif
float l9_17=l9_8;
float l9_18=l9_15;
sc_ClampUV(l9_17,depthTargetUvMinMax.y,depthTargetUvMinMax.w,l9_16,l9_18);
l9_10=l9_18;
l9_9=vec2(l9_14,l9_17);
}
#else
{
l9_10=1.0;
l9_9=vec2(l9_6,l9_8);
}
#endif
vec2 l9_19=sc_TransformUV(l9_9,(int(SC_USE_UV_TRANSFORM_depthTarget)!=0),depthTargetTransform);
float l9_20=l9_19.x;
float l9_21=l9_10;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).x,l9_4,l9_21);
float l9_22=l9_19.y;
float l9_23=l9_21;
sc_SoftwareWrapLate(l9_22,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTarget,SC_SOFTWARE_WRAP_MODE_V_depthTarget).y,l9_4,l9_23);
float l9_24=l9_23;
vec3 l9_25=sc_SamplingCoordsViewToGlobal(vec2(l9_20,l9_22),depthTargetLayout,l9_3);
vec4 l9_26=texture2D(depthTarget,l9_25.xy,0.0);
vec4 l9_27;
#if (SC_USE_CLAMP_TO_BORDER_depthTarget)
{
l9_27=mix(depthTargetBorderColor,l9_26,vec4(l9_24));
}
#else
{
l9_27=l9_26;
}
#endif
float l9_28=(l9_27.x*2.0)-1.0;
float l9_29;
if (depthTargetProjectionMatrixTerms.z==0.0)
{
l9_29=(l9_28-depthTargetProjectionMatrixTerms.y)/depthTargetProjectionMatrixTerms.x;
}
else
{
l9_29=depthTargetProjectionMatrixTerms.y/((-l9_28)-depthTargetProjectionMatrixTerms.x);
}
vec2 l9_30=(((Port_Input0_N228-l9_1)*vec2(sc_Camera.aspect,1.0))*vec2(tan(radians(l9_2)*Port_Input1_N233)*Port_Input1_N235))*vec2(l9_29);
vec4 l9_31=vec4(l9_30.x,l9_30.y,vec4(0.0).z,vec4(0.0).w);
l9_31.z=l9_29;
vec4 l9_32=l9_31;
l9_32.w=Port_Value3_N237;
bool l9_33=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTex)!=0));
float l9_34=l9_1.x;
float l9_35=l9_34;
sc_SoftwareWrapEarly(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_36=l9_35;
float l9_37=l9_1.y;
float l9_38=l9_37;
sc_SoftwareWrapEarly(l9_38,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_39=l9_38;
vec2 l9_40;
float l9_41;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_42;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_42=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_42=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_43=l9_36;
float l9_44=1.0;
sc_ClampUV(l9_43,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_42,l9_44);
float l9_45=l9_43;
float l9_46=l9_44;
bool l9_47;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_47=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_47=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_48=l9_39;
float l9_49=l9_46;
sc_ClampUV(l9_48,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_47,l9_49);
l9_41=l9_49;
l9_40=vec2(l9_45,l9_48);
}
#else
{
l9_41=1.0;
l9_40=vec2(l9_36,l9_39);
}
#endif
vec2 l9_50=sc_TransformUV(l9_40,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_51=l9_50.x;
float l9_52=l9_41;
sc_SoftwareWrapLate(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_33,l9_52);
float l9_53=l9_50.y;
float l9_54=l9_52;
sc_SoftwareWrapLate(l9_53,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_33,l9_54);
float l9_55=l9_54;
vec3 l9_56=sc_SamplingCoordsViewToGlobal(vec2(l9_51,l9_53),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_57=texture2DLod(screenTex,l9_56.xy,blurFactor+Port_Input1_N050);
vec4 l9_58;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_58=mix(screenTexBorderColor,l9_57,vec4(l9_55));
}
#else
{
l9_58=l9_57;
}
#endif
vec4 l9_59=vec4(0.0);
ssGlobals l9_60=ssGlobals(sc_Time.x,sc_Time.y,0.0,varPackedTex.xy,l9_1,l9_2,0.0,0.0,8.0);
LoopFunction_N68(0.0,0.0,l9_59,l9_60);
LoopFunction_N68(1.0,0.142857,l9_59,l9_60);
LoopFunction_N68(2.0,0.285714,l9_59,l9_60);
LoopFunction_N68(3.0,0.42857099,l9_59,l9_60);
LoopFunction_N68(4.0,0.57142901,l9_59,l9_60);
LoopFunction_N68(5.0,0.71428603,l9_59,l9_60);
LoopFunction_N68(6.0,0.85714298,l9_59,l9_60);
LoopFunction_N68(7.0,1.0,l9_59,l9_60);
vec4 l9_67=l9_59;
vec4 l9_68=mix(l9_58,l9_67/vec4(8.0),vec4(Port_Input2_N069));
vec3 l9_69=(sc_ViewMatrixInverseArray[sc_GetStereoViewIndex()]*l9_32).xyz-sc_ViewMatrixInverseArray[sc_GetStereoViewIndex()][3].xyz;
vec3 l9_70=sc_ViewMatrixInverseArray[sc_GetStereoViewIndex()][3].xyz+(l9_69*(sc_Camera.clipPlanes.x/dot(l9_69,-sc_ViewMatrixInverseArray[sc_GetStereoViewIndex()][2].xyz)));
vec2 l9_71=vec2(oceanMin.xz);
vec2 l9_72=vec2(0.0)+(((l9_70.xz-l9_71)*1.0)/((vec2(oceanMax.xz)-l9_71)+vec2(1e-06)));
float l9_73=1.0-l9_72.y;
int l9_74;
#if (oceanHeightmapHasSwappedViews)
{
l9_74=1-sc_GetStereoViewIndex();
}
#else
{
l9_74=sc_GetStereoViewIndex();
}
#endif
bool l9_75=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanHeightmap)!=0));
float l9_76=l9_72.x;
float l9_77=l9_76;
sc_SoftwareWrapEarly(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x);
float l9_78=l9_77;
float l9_79=l9_73;
sc_SoftwareWrapEarly(l9_79,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y);
float l9_80=l9_79;
vec2 l9_81=vec2(l9_78,l9_73);
l9_81.y=l9_80;
vec2 l9_82;
float l9_83;
#if (SC_USE_UV_MIN_MAX_oceanHeightmap)
{
bool l9_84;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_84=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x==3;
}
#else
{
l9_84=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_85=l9_78;
float l9_86=1.0;
sc_ClampUV(l9_85,oceanHeightmapUvMinMax.x,oceanHeightmapUvMinMax.z,l9_84,l9_86);
float l9_87=l9_85;
float l9_88=l9_86;
bool l9_89;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_89=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y==3;
}
#else
{
l9_89=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_90=l9_80;
float l9_91=l9_88;
sc_ClampUV(l9_90,oceanHeightmapUvMinMax.y,oceanHeightmapUvMinMax.w,l9_89,l9_91);
vec2 l9_92=vec2(l9_87,l9_80);
l9_92.y=l9_90;
l9_83=l9_91;
l9_82=l9_92;
}
#else
{
l9_83=1.0;
l9_82=l9_81;
}
#endif
vec2 l9_93=sc_TransformUV(l9_82,(int(SC_USE_UV_TRANSFORM_oceanHeightmap)!=0),oceanHeightmapTransform);
float l9_94=l9_93.x;
float l9_95=l9_83;
sc_SoftwareWrapLate(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x,l9_75,l9_95);
float l9_96=l9_93.y;
float l9_97=l9_95;
sc_SoftwareWrapLate(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y,l9_75,l9_97);
float l9_98=l9_97;
vec3 l9_99=sc_SamplingCoordsViewToGlobal(vec2(l9_94,l9_96),oceanHeightmapLayout,l9_74);
vec4 l9_100=texture2D(oceanHeightmap,l9_99.xy,0.0);
vec4 l9_101;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_101=mix(oceanHeightmapBorderColor,l9_100,vec4(l9_98));
}
#else
{
l9_101=l9_100;
}
#endif
float l9_102=(0.0+(((l9_101.x-0.0)*(unpackVal.y-0.0))/1.000001))+oceanPos.y;
float l9_103;
if (enableFluid==1.0)
{
int l9_104;
#if (fluidPressureHasSwappedViews)
{
l9_104=1-sc_GetStereoViewIndex();
}
#else
{
l9_104=sc_GetStereoViewIndex();
}
#endif
bool l9_105=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0)&&(!(int(SC_USE_UV_MIN_MAX_fluidPressure)!=0));
float l9_106=l9_76;
sc_SoftwareWrapEarly(l9_106,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x);
float l9_107=l9_106;
float l9_108=l9_73;
sc_SoftwareWrapEarly(l9_108,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y);
float l9_109=l9_108;
vec2 l9_110=vec2(l9_107,l9_73);
l9_110.y=l9_109;
vec2 l9_111;
float l9_112;
#if (SC_USE_UV_MIN_MAX_fluidPressure)
{
bool l9_113;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_113=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x==3;
}
#else
{
l9_113=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_114=l9_107;
float l9_115=1.0;
sc_ClampUV(l9_114,fluidPressureUvMinMax.x,fluidPressureUvMinMax.z,l9_113,l9_115);
float l9_116=l9_114;
float l9_117=l9_115;
bool l9_118;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_118=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y==3;
}
#else
{
l9_118=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_119=l9_109;
float l9_120=l9_117;
sc_ClampUV(l9_119,fluidPressureUvMinMax.y,fluidPressureUvMinMax.w,l9_118,l9_120);
vec2 l9_121=vec2(l9_116,l9_109);
l9_121.y=l9_119;
l9_112=l9_120;
l9_111=l9_121;
}
#else
{
l9_112=1.0;
l9_111=l9_110;
}
#endif
vec2 l9_122=sc_TransformUV(l9_111,(int(SC_USE_UV_TRANSFORM_fluidPressure)!=0),fluidPressureTransform);
float l9_123=l9_122.x;
float l9_124=l9_112;
sc_SoftwareWrapLate(l9_123,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x,l9_105,l9_124);
float l9_125=l9_122.y;
float l9_126=l9_124;
sc_SoftwareWrapLate(l9_125,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y,l9_105,l9_126);
float l9_127=l9_126;
vec3 l9_128=sc_SamplingCoordsViewToGlobal(vec2(l9_123,l9_125),fluidPressureLayout,l9_104);
vec4 l9_129=texture2D(fluidPressure,l9_128.xy,0.0);
vec4 l9_130;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_130=mix(fluidPressureBorderColor,l9_129,vec4(l9_127));
}
#else
{
l9_130=l9_129;
}
#endif
l9_103=l9_102+((pressureRange.x+(((l9_130.x-0.0)*(pressureRange.y-pressureRange.x))/1.000001))*fluidMul);
}
else
{
l9_103=l9_102;
}
float l9_131=l9_34;
sc_SoftwareWrapEarly(l9_131,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_132=l9_131;
float l9_133=l9_37;
sc_SoftwareWrapEarly(l9_133,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_134=l9_133;
vec2 l9_135;
float l9_136;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_137;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_137=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_137=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_138=l9_132;
float l9_139=1.0;
sc_ClampUV(l9_138,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_137,l9_139);
float l9_140=l9_138;
float l9_141=l9_139;
bool l9_142;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_142=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_142=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_143=l9_134;
float l9_144=l9_141;
sc_ClampUV(l9_143,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_142,l9_144);
l9_136=l9_144;
l9_135=vec2(l9_140,l9_143);
}
#else
{
l9_136=1.0;
l9_135=vec2(l9_132,l9_134);
}
#endif
vec2 l9_145=sc_TransformUV(l9_135,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_146=l9_145.x;
float l9_147=l9_136;
sc_SoftwareWrapLate(l9_146,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_33,l9_147);
float l9_148=l9_145.y;
float l9_149=l9_147;
sc_SoftwareWrapLate(l9_148,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_33,l9_149);
float l9_150=l9_149;
vec3 l9_151=sc_SamplingCoordsViewToGlobal(vec2(l9_146,l9_148),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_152=texture2D(screenTex,l9_151.xy,0.0);
vec4 l9_153;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_153=mix(screenTexBorderColor,l9_152,vec4(l9_150));
}
#else
{
l9_153=l9_152;
}
#endif
float l9_154=l9_70.y-l9_103;
vec4 l9_155=mix(l9_153,vec4(l9_68.xyz*underwaterTint,1.0),vec4((l9_154>0.050000001) ? 0.0 : 1.0));
vec4 l9_156;
if (enableLine!=0.0)
{
float l9_157=1.0-((varPackedTex.x-0.5)*2.0);
float l9_158;
if (l9_157<=0.0)
{
l9_158=0.0;
}
else
{
l9_158=pow(l9_157,0.30000001);
}
vec2 l9_159=l9_1*clamp(l9_158*1.0,0.0,1.0);
float l9_160=l9_159.x;
sc_SoftwareWrapEarly(l9_160,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_161=l9_160;
float l9_162=l9_159.y;
sc_SoftwareWrapEarly(l9_162,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_163=l9_162;
vec2 l9_164;
float l9_165;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_166;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_166=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_166=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_167=l9_161;
float l9_168=1.0;
sc_ClampUV(l9_167,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_166,l9_168);
float l9_169=l9_167;
float l9_170=l9_168;
bool l9_171;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_171=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_171=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_172=l9_163;
float l9_173=l9_170;
sc_ClampUV(l9_172,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_171,l9_173);
l9_165=l9_173;
l9_164=vec2(l9_169,l9_172);
}
#else
{
l9_165=1.0;
l9_164=vec2(l9_161,l9_163);
}
#endif
vec2 l9_174=sc_TransformUV(l9_164,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_175=l9_174.x;
float l9_176=l9_165;
sc_SoftwareWrapLate(l9_175,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_33,l9_176);
float l9_177=l9_174.y;
float l9_178=l9_176;
sc_SoftwareWrapLate(l9_177,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_33,l9_178);
float l9_179=l9_178;
vec3 l9_180=sc_SamplingCoordsViewToGlobal(vec2(l9_175,l9_177),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_181=texture2DLod(screenTex,l9_180.xy,5.0);
vec4 l9_182;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_182=mix(screenTexBorderColor,l9_181,vec4(l9_179));
}
#else
{
l9_182=l9_181;
}
#endif
l9_156=mix(l9_155,vec4(l9_182.xyz*lineTint,1.0),vec4(1.0-smoothstep(meniscusThickness*0.0099999998,meniscusThickness,abs(l9_154-0.050000001))));
}
else
{
l9_156=l9_155;
}
#if (sc_BlendMode_AlphaTest)
{
if (l9_156.w<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_156.w<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_183;
#if (sc_ProjectiveShadowsCaster)
{
float l9_184;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_184=l9_156.w;
}
#else
{
float l9_185;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_185=clamp(l9_156.w*2.0,0.0,1.0);
}
#else
{
float l9_186;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_186=clamp(dot(l9_156.xyz,vec3(l9_156.w)),0.0,1.0);
}
#else
{
float l9_187;
#if (sc_BlendMode_AlphaTest)
{
l9_187=1.0;
}
#else
{
float l9_188;
#if (sc_BlendMode_Multiply)
{
l9_188=(1.0-dot(l9_156.xyz,vec3(0.33333001)))*l9_156.w;
}
#else
{
float l9_189;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_189=(1.0-clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0))*l9_156.w;
}
#else
{
float l9_190;
#if (sc_BlendMode_ColoredGlass)
{
l9_190=clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0)*l9_156.w;
}
#else
{
float l9_191;
#if (sc_BlendMode_Add)
{
l9_191=clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_192;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_192=clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0)*l9_156.w;
}
#else
{
float l9_193;
#if (sc_BlendMode_Screen)
{
l9_193=dot(l9_156.xyz,vec3(0.33333001))*l9_156.w;
}
#else
{
float l9_194;
#if (sc_BlendMode_Min)
{
l9_194=1.0-clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_195;
#if (sc_BlendMode_Max)
{
l9_195=clamp(dot(l9_156.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_195=1.0;
}
#endif
l9_194=l9_195;
}
#endif
l9_193=l9_194;
}
#endif
l9_192=l9_193;
}
#endif
l9_191=l9_192;
}
#endif
l9_190=l9_191;
}
#endif
l9_189=l9_190;
}
#endif
l9_188=l9_189;
}
#endif
l9_187=l9_188;
}
#endif
l9_186=l9_187;
}
#endif
l9_185=l9_186;
}
#endif
l9_184=l9_185;
}
#endif
l9_183=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_156.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_184);
}
#else
{
vec4 l9_196;
#if (sc_RenderAlphaToColor)
{
l9_196=vec4(l9_156.w);
}
#else
{
vec4 l9_197;
#if (sc_BlendMode_Custom)
{
vec4 l9_198;
#if (sc_FramebufferFetch)
{
vec4 l9_199=sc_readFragData0_Platform();
vec4 l9_200;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_201=l9_199;
l9_201.x=l9_199.x+_sc_framebufferFetchMarker;
l9_200=l9_201;
}
#else
{
l9_200=l9_199;
}
#endif
l9_198=l9_200;
}
#else
{
vec2 l9_202=sc_ScreenCoordsGlobalToView(l9_0);
int l9_203;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_203=1-sc_GetStereoViewIndex();
}
#else
{
l9_203=sc_GetStereoViewIndex();
}
#endif
l9_198=texture2D(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_202,sc_ScreenTextureLayout,l9_203).xy,0.0);
}
#endif
vec4 l9_204;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_205=l9_198;
l9_205.x=l9_198.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_204=l9_205;
}
#else
{
l9_204=l9_198;
}
#endif
vec3 l9_206=mix(l9_204.xyz,definedBlend(l9_204.xyz,l9_156.xyz).xyz,vec3(l9_156.w));
vec4 l9_207=vec4(l9_206.x,l9_206.y,l9_206.z,vec4(0.0).w);
l9_207.w=1.0;
l9_197=l9_207;
}
#else
{
vec4 l9_208;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_208=vec4(mix(vec3(1.0),l9_156.xyz,vec3(l9_156.w)),l9_156.w);
}
#else
{
vec4 l9_209;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_210;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_210=clamp(l9_156.w,0.0,1.0);
}
#else
{
l9_210=l9_156.w;
}
#endif
l9_209=vec4(l9_156.xyz*l9_210,l9_210);
}
#else
{
l9_209=l9_156;
}
#endif
l9_208=l9_209;
}
#endif
l9_197=l9_208;
}
#endif
l9_196=l9_197;
}
#endif
l9_183=l9_196;
}
#endif
vec4 l9_211;
if (PreviewEnabled==1)
{
vec4 l9_212;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_212=PreviewVertexColor;
}
else
{
l9_212=vec4(0.0);
}
l9_211=l9_212;
}
else
{
l9_211=l9_183;
}
vec4 l9_213;
#if (sc_ShaderComplexityAnalyzer)
{
l9_213=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_213=vec4(0.0);
}
#endif
vec4 l9_214;
if (l9_213.w>0.0)
{
l9_214=l9_213;
}
else
{
l9_214=l9_211;
}
gl_FragDepth=Port_Depth_N004;
vec4 l9_215=outputMotionVectorsIfNeeded(varPos,max(l9_214,vec4(0.0)));
vec4 l9_216=clamp(l9_215,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_217=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_217-0.0039215689)),min(1.0,l9_217+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0Internal(vec4(1.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_218=sc_ScreenCoordsGlobalToView(l9_0);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_218).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_219=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_218).xy);
float l9_220=packValue(l9_219);
int l9_227=int(l9_216.w*255.0);
float l9_228=packValue(l9_227);
sc_writeFragData0Internal(vec4(packValue(l9_219),packValue(l9_219),packValue(l9_219),packValue(l9_219)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_220,packValue(l9_219),packValue(l9_219),packValue(l9_219)));
sc_writeFragData2(vec4(l9_228,packValue(l9_227),packValue(l9_227),packValue(l9_227)));
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.0039215689,0.0,0.0,0.0));
}
#endif
}
#endif
}
#else
{
#if (sc_OITCompositingPass)
{
#if (sc_OITCompositingPass)
{
vec2 l9_231=sc_ScreenCoordsGlobalToView(l9_0);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_231).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_232[8];
int l9_233[8];
int l9_234=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_234<8)
{
l9_232[l9_234]=0;
l9_233[l9_234]=0;
l9_234++;
continue;
}
else
{
break;
}
}
int l9_235;
#if (sc_OITMaxLayers8)
{
l9_235=2;
}
#else
{
l9_235=1;
}
#endif
int l9_236=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_236<l9_235)
{
vec4 l9_237;
vec4 l9_238;
vec4 l9_239;
if (l9_236==0)
{
l9_239=texture2D(sc_OITAlpha0,l9_231);
l9_238=texture2D(sc_OITDepthLow0,l9_231);
l9_237=texture2D(sc_OITDepthHigh0,l9_231);
}
else
{
l9_239=vec4(0.0);
l9_238=vec4(0.0);
l9_237=vec4(0.0);
}
vec4 l9_240;
vec4 l9_241;
vec4 l9_242;
if (l9_236==1)
{
l9_242=texture2D(sc_OITAlpha1,l9_231);
l9_241=texture2D(sc_OITDepthLow1,l9_231);
l9_240=texture2D(sc_OITDepthHigh1,l9_231);
}
else
{
l9_242=l9_239;
l9_241=l9_238;
l9_240=l9_237;
}
if (any(notEqual(l9_240,vec4(0.0)))||any(notEqual(l9_241,vec4(0.0))))
{
int l9_243[8]=l9_232;
unpackValues(l9_240.w,l9_236,l9_243);
unpackValues(l9_240.z,l9_236,l9_243);
unpackValues(l9_240.y,l9_236,l9_243);
unpackValues(l9_240.x,l9_236,l9_243);
unpackValues(l9_241.w,l9_236,l9_243);
unpackValues(l9_241.z,l9_236,l9_243);
unpackValues(l9_241.y,l9_236,l9_243);
unpackValues(l9_241.x,l9_236,l9_243);
int l9_252[8]=l9_233;
unpackValues(l9_242.w,l9_236,l9_252);
unpackValues(l9_242.z,l9_236,l9_252);
unpackValues(l9_242.y,l9_236,l9_252);
unpackValues(l9_242.x,l9_236,l9_252);
}
l9_236++;
continue;
}
else
{
break;
}
}
vec4 l9_257=texture2D(sc_OITFilteredDepthBoundsTexture,l9_231);
vec2 l9_258=l9_257.xy;
int l9_259;
#if (sc_SkinBonesCount>0)
{
l9_259=encodeDepth(((1.0-l9_257.x)*1000.0)+getDepthOrderingEpsilon(),l9_258);
}
#else
{
l9_259=0;
}
#endif
int l9_260=encodeDepth(viewSpaceDepth(),l9_258);
vec4 l9_261;
l9_261=l9_216*l9_216.w;
vec4 l9_262;
int l9_263=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_263<8)
{
int l9_264=l9_232[l9_263];
int l9_265=l9_260-l9_259;
bool l9_266=l9_264<l9_265;
bool l9_267;
if (l9_266)
{
l9_267=l9_232[l9_263]>0;
}
else
{
l9_267=l9_266;
}
if (l9_267)
{
vec3 l9_268=l9_261.xyz*(1.0-(float(l9_233[l9_263])/255.0));
l9_262=vec4(l9_268.x,l9_268.y,l9_268.z,l9_261.w);
}
else
{
l9_262=l9_261;
}
l9_261=l9_262;
l9_263++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_261,sc_UniformConstants.x,sc_ShaderCacheConstant);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(l9_0)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_216,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_215,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
