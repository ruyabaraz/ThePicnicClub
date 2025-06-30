//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
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
//sampler sampler intensityTextureSmpSC 0:21
//sampler sampler sBoundarySmpSC 0:22
//sampler sampler sColorSmpSC 0:23
//sampler sampler sImpulseTextureSmpSC 0:24
//sampler sampler sTargetSmpSC 0:25
//sampler sampler sVelocitySmpSC 0:26
//sampler sampler sc_OITCommonSampler 0:29
//sampler sampler sc_ScreenTextureSmpSC 0:31
//sampler sampler userVelocityInputTexSmpSC 0:34
//texture texture2D intensityTexture 0:0:0:21
//texture texture2D sBoundary 0:1:0:22
//texture texture2D sColor 0:2:0:23
//texture texture2D sImpulseTexture 0:3:0:24
//texture texture2D sTarget 0:4:0:25
//texture texture2D sVelocity 0:5:0:26
//texture texture2D sc_OITAlpha0 0:8:0:29
//texture texture2D sc_OITAlpha1 0:9:0:29
//texture texture2D sc_OITDepthHigh0 0:10:0:29
//texture texture2D sc_OITDepthHigh1 0:11:0:29
//texture texture2D sc_OITDepthLow0 0:12:0:29
//texture texture2D sc_OITDepthLow1 0:13:0:29
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:14:0:29
//texture texture2D sc_OITFrontDepthTexture 0:15:0:29
//texture texture2D sc_ScreenTexture 0:17:0:31
//texture texture2D userVelocityInputTex 0:20:0:34
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
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sBoundary 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sColor 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sImpulseTexture 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sTarget 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sVelocity 37 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_userVelocityInputTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 39 0
//spec_const bool SC_USE_UV_MIN_MAX_sBoundary 40 0
//spec_const bool SC_USE_UV_MIN_MAX_sColor 41 0
//spec_const bool SC_USE_UV_MIN_MAX_sImpulseTexture 42 0
//spec_const bool SC_USE_UV_MIN_MAX_sTarget 43 0
//spec_const bool SC_USE_UV_MIN_MAX_sVelocity 44 0
//spec_const bool SC_USE_UV_MIN_MAX_userVelocityInputTex 45 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 46 0
//spec_const bool SC_USE_UV_TRANSFORM_sBoundary 47 0
//spec_const bool SC_USE_UV_TRANSFORM_sColor 48 0
//spec_const bool SC_USE_UV_TRANSFORM_sImpulseTexture 49 0
//spec_const bool SC_USE_UV_TRANSFORM_sTarget 50 0
//spec_const bool SC_USE_UV_TRANSFORM_sVelocity 51 0
//spec_const bool SC_USE_UV_TRANSFORM_userVelocityInputTex 52 0
//spec_const bool UseViewSpaceDepthVariant 53 1
//spec_const bool intensityTextureHasSwappedViews 54 0
//spec_const bool sBoundaryHasSwappedViews 55 0
//spec_const bool sColorHasSwappedViews 56 0
//spec_const bool sImpulseTextureHasSwappedViews 57 0
//spec_const bool sTargetHasSwappedViews 58 0
//spec_const bool sVelocityHasSwappedViews 59 0
//spec_const bool sc_BlendMode_Add 60 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 61 0
//spec_const bool sc_BlendMode_AlphaTest 62 0
//spec_const bool sc_BlendMode_AlphaToCoverage 63 0
//spec_const bool sc_BlendMode_ColoredGlass 64 0
//spec_const bool sc_BlendMode_Custom 65 0
//spec_const bool sc_BlendMode_Max 66 0
//spec_const bool sc_BlendMode_Min 67 0
//spec_const bool sc_BlendMode_Multiply 68 0
//spec_const bool sc_BlendMode_MultiplyOriginal 69 0
//spec_const bool sc_BlendMode_Normal 70 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 71 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 72 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 73 0
//spec_const bool sc_BlendMode_Screen 74 0
//spec_const bool sc_BlendMode_Software 75 0
//spec_const bool sc_DepthOnly 76 0
//spec_const bool sc_FramebufferFetch 77 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 78 0
//spec_const bool sc_IsEditor 79 0
//spec_const bool sc_MotionVectorsPass 80 0
//spec_const bool sc_OITCompositingPass 81 0
//spec_const bool sc_OITDepthBoundsPass 82 0
//spec_const bool sc_OITDepthGatherPass 83 0
//spec_const bool sc_OITDepthPrepass 84 0
//spec_const bool sc_OITFrontLayerPass 85 0
//spec_const bool sc_OITMaxLayers4Plus1 86 0
//spec_const bool sc_OITMaxLayers8 87 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 88 0
//spec_const bool sc_ProjectiveShadowsCaster 89 0
//spec_const bool sc_ProjectiveShadowsReceiver 90 0
//spec_const bool sc_RenderAlphaToColor 91 0
//spec_const bool sc_ScreenTextureHasSwappedViews 92 0
//spec_const bool sc_ShaderComplexityAnalyzer 93 0
//spec_const bool sc_TAAEnabled 94 0
//spec_const bool sc_UseFramebufferFetchMarker 95 0
//spec_const bool sc_VertexBlending 96 0
//spec_const bool sc_VertexBlendingUseNormals 97 0
//spec_const bool userVelocityInputTexHasSwappedViews 98 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sBoundary 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sColor 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sTarget 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sVelocity 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sBoundary 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sColor 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sTarget 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sVelocity 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex 112 -1
//spec_const int intensityTextureLayout 113 0
//spec_const int sBoundaryLayout 114 0
//spec_const int sColorLayout 115 0
//spec_const int sImpulseTextureLayout 116 0
//spec_const int sTargetLayout 117 0
//spec_const int sVelocityLayout 118 0
//spec_const int sc_DepthBufferMode 119 0
//spec_const int sc_RenderingSpace 120 -1
//spec_const int sc_ScreenTextureLayout 121 0
//spec_const int sc_ShaderCacheConstant 122 0
//spec_const int sc_SkinBonesCount 123 0
//spec_const int sc_StereoRenderingMode 124 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 125 0
//spec_const int sc_StereoViewID 126 0
//spec_const int userVelocityInputTexLayout 127 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#ifdef useVelocityInputTexture
#undef useVelocityInputTexture
#endif
#ifdef useVelocityComponentInput
#undef useVelocityComponentInput
#endif
#ifdef buoyancyEnable
#undef buoyancyEnable
#endif
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
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
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
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
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
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
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
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
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
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 0
#elif SC_DISABLE_FRUSTUM_CULLING==1
#undef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 1
#endif
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
uniform float sc_DisableFrustumCullingMarker;
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
vec4 l9_0;
#if (sc_IsEditor&&SC_DISABLE_FRUSTUM_CULLING)
{
vec4 l9_1=position;
l9_1.x=position.x+sc_DisableFrustumCullingMarker;
l9_0=l9_1;
}
#else
{
l9_0=position;
}
#endif
vec2 l9_2;
vec2 l9_3;
vec3 l9_4;
vec3 l9_5;
vec4 l9_6;
#if (sc_VertexBlending)
{
vec2 l9_7;
vec2 l9_8;
vec3 l9_9;
vec3 l9_10;
vec4 l9_11;
#if (sc_VertexBlendingUseNormals)
{
sc_Vertex_t l9_12=sc_Vertex_t(l9_0,normal,tangent.xyz,texture0,texture1);
blendTargetShapeWithNormal(l9_12,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(l9_12,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(l9_12,blendShape2Pos,blendShape2Normal,weights0.z);
l9_11=l9_12.position;
l9_10=l9_12.normal;
l9_9=l9_12.tangent;
l9_8=l9_12.texture0;
l9_7=l9_12.texture1;
}
#else
{
vec3 l9_14=(((((l9_0.xyz+(blendShape0Pos*weights0.x)).xyz+(blendShape1Pos*weights0.y)).xyz+(blendShape2Pos*weights0.z)).xyz+(blendShape3Pos*weights0.w)).xyz+(blendShape4Pos*weights1.x)).xyz+(blendShape5Pos*weights1.y);
l9_11=vec4(l9_14.x,l9_14.y,l9_14.z,l9_0.w);
l9_10=normal;
l9_9=tangent.xyz;
l9_8=texture0;
l9_7=texture1;
}
#endif
l9_6=l9_11;
l9_5=l9_10;
l9_4=l9_9;
l9_3=l9_8;
l9_2=l9_7;
}
#else
{
l9_6=l9_0;
l9_5=normal;
l9_4=tangent.xyz;
l9_3=texture0;
l9_2=texture1;
}
#endif
vec3 l9_15;
vec3 l9_16;
vec4 l9_17;
#if (sc_SkinBonesCount>0)
{
vec4 l9_18;
#if (sc_SkinBonesCount>0)
{
vec4 l9_19=vec4(1.0,fract(boneData.yzw));
vec4 l9_20=l9_19;
l9_20.x=1.0-dot(l9_19.yzw,vec3(1.0));
l9_18=l9_20;
}
#else
{
l9_18=vec4(0.0);
}
#endif
int l9_21=int(boneData.x);
int l9_22=int(boneData.y);
int l9_23=int(boneData.z);
int l9_24=int(boneData.w);
vec3 l9_25=(((skinVertexPosition(l9_21,l9_6)*l9_18.x)+(skinVertexPosition(l9_22,l9_6)*l9_18.y))+(skinVertexPosition(l9_23,l9_6)*l9_18.z))+(skinVertexPosition(l9_24,l9_6)*l9_18.w);
l9_17=vec4(l9_25.x,l9_25.y,l9_25.z,l9_6.w);
l9_16=((((sc_SkinBonesNormalMatrices[l9_21]*l9_5)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_5)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_5)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_5)*l9_18.w);
l9_15=((((sc_SkinBonesNormalMatrices[l9_21]*l9_4)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_4)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_4)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_4)*l9_18.w);
}
#else
{
l9_17=l9_6;
l9_16=l9_5;
l9_15=l9_4;
}
#endif
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_17.xyz;
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_17).xyz;
varNormal=sc_NormalMatrix*l9_16;
vec3 l9_26=sc_NormalMatrix*l9_15;
varTangent=vec4(l9_26.x,l9_26.y,l9_26.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_27=PreviewEnabled==1;
vec2 l9_28;
if (l9_27)
{
vec2 l9_29=l9_3;
l9_29.x=1.0-l9_3.x;
l9_28=l9_29;
}
else
{
l9_28=l9_3;
}
varColor=color;
vec3 l9_30=varPos;
vec3 l9_31=varNormal;
vec3 l9_32;
vec3 l9_33;
vec3 l9_34;
if (l9_27)
{
l9_34=varTangent.xyz;
l9_33=varNormal;
l9_32=varPos;
}
else
{
l9_34=varTangent.xyz;
l9_33=l9_31;
l9_32=l9_30;
}
varPos=l9_32;
varNormal=normalize(l9_33);
vec3 l9_35=normalize(l9_34);
varTangent=vec4(l9_35.x,l9_35.y,l9_35.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_36;
#if (sc_RenderingSpace==3)
{
l9_36=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_37;
#if (sc_RenderingSpace==2)
{
l9_37=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_38;
#if (sc_RenderingSpace==1)
{
l9_38=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
l9_38=l9_17;
}
#endif
l9_37=l9_38;
}
#endif
l9_36=l9_37;
}
#endif
varViewSpaceDepth=-l9_36.z;
}
#endif
vec4 l9_39;
#if (sc_RenderingSpace==3)
{
l9_39=l9_17;
}
#else
{
vec4 l9_40;
#if (sc_RenderingSpace==4)
{
l9_40=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_41;
#if (sc_RenderingSpace==2)
{
l9_41=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_42;
#if (sc_RenderingSpace==1)
{
l9_42=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_42=vec4(0.0);
}
#endif
l9_41=l9_42;
}
#endif
l9_40=l9_41;
}
#endif
l9_39=l9_40;
}
#endif
varPackedTex=vec4(l9_28,l9_2);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_43;
#if (sc_RenderingSpace==1)
{
l9_43=sc_ModelMatrix*l9_17;
}
#else
{
l9_43=l9_17;
}
#endif
vec4 l9_44=sc_ProjectorMatrix*l9_43;
varShadowTex=((l9_44.xy/vec2(l9_44.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_45;
#if (sc_DepthBufferMode==1)
{
vec4 l9_46;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_47=l9_39;
l9_47.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_39.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_39.w;
l9_46=l9_47;
}
else
{
l9_46=l9_39;
}
l9_45=l9_46;
}
#else
{
l9_45=l9_39;
}
#endif
vec4 l9_48;
#if (sc_TAAEnabled)
{
vec2 l9_49=l9_45.xy+(sc_TAAJitterOffset*l9_45.w);
l9_48=vec4(l9_49.x,l9_49.y,l9_45.z,l9_45.w);
}
#else
{
l9_48=l9_45;
}
#endif
vec4 l9_50;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_51=l9_48;
l9_51.x=l9_48.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_50=l9_51;
}
#else
{
l9_50=l9_48;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_52=dot(l9_50,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_52);
}
#else
{
varClipDistance=l9_52;
}
#endif
}
#endif
gl_Position=l9_50;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#ifdef useVelocityInputTexture
#undef useVelocityInputTexture
#endif
#ifdef useVelocityComponentInput
#undef useVelocityComponentInput
#endif
#ifdef buoyancyEnable
#undef buoyancyEnable
#endif
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
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
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
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
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
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
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
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
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
#ifndef sVelocityHasSwappedViews
#define sVelocityHasSwappedViews 0
#elif sVelocityHasSwappedViews==1
#undef sVelocityHasSwappedViews
#define sVelocityHasSwappedViews 1
#endif
#ifndef sVelocityLayout
#define sVelocityLayout 0
#endif
#ifndef sTargetHasSwappedViews
#define sTargetHasSwappedViews 0
#elif sTargetHasSwappedViews==1
#undef sTargetHasSwappedViews
#define sTargetHasSwappedViews 1
#endif
#ifndef sTargetLayout
#define sTargetLayout 0
#endif
#ifndef sBoundaryHasSwappedViews
#define sBoundaryHasSwappedViews 0
#elif sBoundaryHasSwappedViews==1
#undef sBoundaryHasSwappedViews
#define sBoundaryHasSwappedViews 1
#endif
#ifndef sBoundaryLayout
#define sBoundaryLayout 0
#endif
#ifndef sColorHasSwappedViews
#define sColorHasSwappedViews 0
#elif sColorHasSwappedViews==1
#undef sColorHasSwappedViews
#define sColorHasSwappedViews 1
#endif
#ifndef sColorLayout
#define sColorLayout 0
#endif
#ifndef userVelocityInputTexHasSwappedViews
#define userVelocityInputTexHasSwappedViews 0
#elif userVelocityInputTexHasSwappedViews==1
#undef userVelocityInputTexHasSwappedViews
#define userVelocityInputTexHasSwappedViews 1
#endif
#ifndef userVelocityInputTexLayout
#define userVelocityInputTexLayout 0
#endif
#ifndef sImpulseTextureHasSwappedViews
#define sImpulseTextureHasSwappedViews 0
#elif sImpulseTextureHasSwappedViews==1
#undef sImpulseTextureHasSwappedViews
#define sImpulseTextureHasSwappedViews 1
#endif
#ifndef sImpulseTextureLayout
#define sImpulseTextureLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_sVelocity
#define SC_USE_UV_TRANSFORM_sVelocity 0
#elif SC_USE_UV_TRANSFORM_sVelocity==1
#undef SC_USE_UV_TRANSFORM_sVelocity
#define SC_USE_UV_TRANSFORM_sVelocity 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sVelocity
#define SC_SOFTWARE_WRAP_MODE_U_sVelocity -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sVelocity
#define SC_SOFTWARE_WRAP_MODE_V_sVelocity -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sVelocity
#define SC_USE_UV_MIN_MAX_sVelocity 0
#elif SC_USE_UV_MIN_MAX_sVelocity==1
#undef SC_USE_UV_MIN_MAX_sVelocity
#define SC_USE_UV_MIN_MAX_sVelocity 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sVelocity
#define SC_USE_CLAMP_TO_BORDER_sVelocity 0
#elif SC_USE_CLAMP_TO_BORDER_sVelocity==1
#undef SC_USE_CLAMP_TO_BORDER_sVelocity
#define SC_USE_CLAMP_TO_BORDER_sVelocity 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sTarget
#define SC_USE_UV_TRANSFORM_sTarget 0
#elif SC_USE_UV_TRANSFORM_sTarget==1
#undef SC_USE_UV_TRANSFORM_sTarget
#define SC_USE_UV_TRANSFORM_sTarget 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sTarget
#define SC_SOFTWARE_WRAP_MODE_U_sTarget -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sTarget
#define SC_SOFTWARE_WRAP_MODE_V_sTarget -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sTarget
#define SC_USE_UV_MIN_MAX_sTarget 0
#elif SC_USE_UV_MIN_MAX_sTarget==1
#undef SC_USE_UV_MIN_MAX_sTarget
#define SC_USE_UV_MIN_MAX_sTarget 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sTarget
#define SC_USE_CLAMP_TO_BORDER_sTarget 0
#elif SC_USE_CLAMP_TO_BORDER_sTarget==1
#undef SC_USE_CLAMP_TO_BORDER_sTarget
#define SC_USE_CLAMP_TO_BORDER_sTarget 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sBoundary
#define SC_USE_UV_TRANSFORM_sBoundary 0
#elif SC_USE_UV_TRANSFORM_sBoundary==1
#undef SC_USE_UV_TRANSFORM_sBoundary
#define SC_USE_UV_TRANSFORM_sBoundary 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sBoundary
#define SC_SOFTWARE_WRAP_MODE_U_sBoundary -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sBoundary
#define SC_SOFTWARE_WRAP_MODE_V_sBoundary -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sBoundary
#define SC_USE_UV_MIN_MAX_sBoundary 0
#elif SC_USE_UV_MIN_MAX_sBoundary==1
#undef SC_USE_UV_MIN_MAX_sBoundary
#define SC_USE_UV_MIN_MAX_sBoundary 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sBoundary
#define SC_USE_CLAMP_TO_BORDER_sBoundary 0
#elif SC_USE_CLAMP_TO_BORDER_sBoundary==1
#undef SC_USE_CLAMP_TO_BORDER_sBoundary
#define SC_USE_CLAMP_TO_BORDER_sBoundary 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sColor
#define SC_USE_UV_TRANSFORM_sColor 0
#elif SC_USE_UV_TRANSFORM_sColor==1
#undef SC_USE_UV_TRANSFORM_sColor
#define SC_USE_UV_TRANSFORM_sColor 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sColor
#define SC_SOFTWARE_WRAP_MODE_U_sColor -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sColor
#define SC_SOFTWARE_WRAP_MODE_V_sColor -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sColor
#define SC_USE_UV_MIN_MAX_sColor 0
#elif SC_USE_UV_MIN_MAX_sColor==1
#undef SC_USE_UV_MIN_MAX_sColor
#define SC_USE_UV_MIN_MAX_sColor 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sColor
#define SC_USE_CLAMP_TO_BORDER_sColor 0
#elif SC_USE_CLAMP_TO_BORDER_sColor==1
#undef SC_USE_CLAMP_TO_BORDER_sColor
#define SC_USE_CLAMP_TO_BORDER_sColor 1
#endif
#ifndef SC_USE_UV_TRANSFORM_userVelocityInputTex
#define SC_USE_UV_TRANSFORM_userVelocityInputTex 0
#elif SC_USE_UV_TRANSFORM_userVelocityInputTex==1
#undef SC_USE_UV_TRANSFORM_userVelocityInputTex
#define SC_USE_UV_TRANSFORM_userVelocityInputTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex
#define SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex
#define SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_userVelocityInputTex
#define SC_USE_UV_MIN_MAX_userVelocityInputTex 0
#elif SC_USE_UV_MIN_MAX_userVelocityInputTex==1
#undef SC_USE_UV_MIN_MAX_userVelocityInputTex
#define SC_USE_UV_MIN_MAX_userVelocityInputTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_userVelocityInputTex
#define SC_USE_CLAMP_TO_BORDER_userVelocityInputTex 0
#elif SC_USE_CLAMP_TO_BORDER_userVelocityInputTex==1
#undef SC_USE_CLAMP_TO_BORDER_userVelocityInputTex
#define SC_USE_CLAMP_TO_BORDER_userVelocityInputTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sImpulseTexture
#define SC_USE_UV_TRANSFORM_sImpulseTexture 0
#elif SC_USE_UV_TRANSFORM_sImpulseTexture==1
#undef SC_USE_UV_TRANSFORM_sImpulseTexture
#define SC_USE_UV_TRANSFORM_sImpulseTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture
#define SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture
#define SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sImpulseTexture
#define SC_USE_UV_MIN_MAX_sImpulseTexture 0
#elif SC_USE_UV_MIN_MAX_sImpulseTexture==1
#undef SC_USE_UV_MIN_MAX_sImpulseTexture
#define SC_USE_UV_MIN_MAX_sImpulseTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sImpulseTexture
#define SC_USE_CLAMP_TO_BORDER_sImpulseTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sImpulseTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sImpulseTexture
#define SC_USE_CLAMP_TO_BORDER_sImpulseTexture 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
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
uniform mat3 sVelocityTransform;
uniform vec4 sVelocityUvMinMax;
uniform vec4 sVelocityBorderColor;
uniform mat3 sTargetTransform;
uniform vec4 sTargetUvMinMax;
uniform vec4 sTargetBorderColor;
uniform vec4 sTargetSize;
uniform mat3 sBoundaryTransform;
uniform vec4 sBoundaryUvMinMax;
uniform vec4 sBoundaryBorderColor;
uniform mat3 sColorTransform;
uniform vec4 sColorUvMinMax;
uniform vec4 sColorBorderColor;
uniform mat3 userVelocityInputTexTransform;
uniform vec4 userVelocityInputTexUvMinMax;
uniform vec4 userVelocityInputTexBorderColor;
uniform mat3 sImpulseTextureTransform;
uniform vec4 sImpulseTextureUvMinMax;
uniform vec4 sImpulseTextureBorderColor;
uniform vec2 velocityRange;
uniform vec2 impulseRange;
uniform float diffusionRate;
uniform float timeMult;
uniform int reset;
uniform float impulseMult;
uniform bool useVelocityInputTexture;
uniform bool useVelocityComponentInput;
uniform bool buoyancyEnable;
uniform float ambientTemperature;
uniform float buoyancy;
uniform float weight;
uniform vec4 sc_Time;
uniform int PreviewEnabled;
uniform sampler2D sVelocity;
uniform sampler2D sTarget;
uniform sampler2D userVelocityInputTex;
uniform sampler2D sImpulseTexture;
uniform sampler2D sColor;
uniform sampler2D sBoundary;
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
vec2 N50_velocityRange;
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
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))/vec2(255.0);
}
return dot(rg,vec2(1.0,0.0039215689));
}
int sTargetGetStereoViewIndex()
{
int l9_0;
#if (sTargetHasSwappedViews)
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
vec4 N50_sTarget_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_sTarget)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sTarget)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_sTarget)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_sTarget)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_sTarget)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,sTargetUvMinMax.x,sTargetUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_sTarget)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_sTarget)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,sTargetUvMinMax.y,sTargetUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_sTarget)!=0),sTargetTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_sTarget,SC_SOFTWARE_WRAP_MODE_V_sTarget).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),sTargetLayout,sTargetGetStereoViewIndex());
vec4 l9_22=texture2D(sTarget,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_sTarget)
{
l9_23=mix(sTargetBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
vec2 N50_sampleVelocity(vec2 coord)
{
vec4 l9_0=N50_sTarget_sample(coord);
float l9_1=0.99998999-0.0;
return vec2(N50_velocityRange.x+(((DecodeFloat16(l9_0.xy,true)-0.0)*(N50_velocityRange.y-N50_velocityRange.x))/l9_1),N50_velocityRange.x+(((DecodeFloat16(l9_0.zw,true)-0.0)*(N50_velocityRange.y-N50_velocityRange.x))/l9_1));
}
vec2 ssEncodeFloat16(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,16581375.0)*(0.0+(((clamp(Value,Min,Max)-Min)*(RemapRange-0.0))/(Max-Min))));
return (l9_0-(l9_0.yzww*vec4(0.0039215689,0.0039215689,0.0039215689,0.0))).xy;
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
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight_1,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight_1));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight_1));
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
N50_velocityRange=vec2(0.0);
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
N50_velocityRange=velocityRange;
float l9_0=sc_Time.y*timeMult;
int l9_1;
#if (sVelocityHasSwappedViews)
{
l9_1=1-sc_GetStereoViewIndex();
}
#else
{
l9_1=sc_GetStereoViewIndex();
}
#endif
bool l9_2=(int(SC_USE_CLAMP_TO_BORDER_sVelocity)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sVelocity)!=0));
float l9_3=varPackedTex.x;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).x);
float l9_4=l9_3;
float l9_5=varPackedTex.y;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).y);
float l9_6=l9_5;
vec2 l9_7;
float l9_8;
#if (SC_USE_UV_MIN_MAX_sVelocity)
{
bool l9_9;
#if (SC_USE_CLAMP_TO_BORDER_sVelocity)
{
l9_9=ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).x==3;
}
#else
{
l9_9=(int(SC_USE_CLAMP_TO_BORDER_sVelocity)!=0);
}
#endif
float l9_10=l9_4;
float l9_11=1.0;
sc_ClampUV(l9_10,sVelocityUvMinMax.x,sVelocityUvMinMax.z,l9_9,l9_11);
float l9_12=l9_10;
float l9_13=l9_11;
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_sVelocity)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).y==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_sVelocity)!=0);
}
#endif
float l9_15=l9_6;
float l9_16=l9_13;
sc_ClampUV(l9_15,sVelocityUvMinMax.y,sVelocityUvMinMax.w,l9_14,l9_16);
l9_8=l9_16;
l9_7=vec2(l9_12,l9_15);
}
#else
{
l9_8=1.0;
l9_7=vec2(l9_4,l9_6);
}
#endif
vec2 l9_17=sc_TransformUV(l9_7,(int(SC_USE_UV_TRANSFORM_sVelocity)!=0),sVelocityTransform);
float l9_18=l9_17.x;
float l9_19=l9_8;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).x,l9_2,l9_19);
float l9_20=l9_17.y;
float l9_21=l9_19;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_sVelocity,SC_SOFTWARE_WRAP_MODE_V_sVelocity).y,l9_2,l9_21);
float l9_22=l9_21;
vec3 l9_23=sc_SamplingCoordsViewToGlobal(vec2(l9_18,l9_20),sVelocityLayout,l9_1);
vec4 l9_24=texture2D(sVelocity,l9_23.xy,0.0);
vec4 l9_25;
#if (SC_USE_CLAMP_TO_BORDER_sVelocity)
{
l9_25=mix(sVelocityBorderColor,l9_24,vec4(l9_22));
}
#else
{
l9_25=l9_24;
}
#endif
float l9_26=N50_velocityRange.x;
float l9_27=N50_velocityRange.y;
float l9_28=DecodeFloat16(l9_25.xy,true);
float l9_29=0.99998999-0.0;
float l9_30=N50_velocityRange.x;
float l9_31=N50_velocityRange.y;
float l9_32=DecodeFloat16(l9_25.zw,true);
vec2 l9_33=(((varPackedTex.xy-(vec2(l9_26+(((l9_28-0.0)*(l9_27-l9_26))/l9_29),l9_30+(((l9_32-0.0)*(l9_31-l9_30))/l9_29))*l9_0))/sTargetSize.zw)-vec2(0.5))-(sTargetSize.zw*0.5);
vec2 l9_34=fract(l9_33);
vec2 l9_35=floor(l9_33);
vec2 l9_36=N50_sampleVelocity((l9_35+vec2(0.5))*sTargetSize.zw);
vec2 l9_37=N50_sampleVelocity((l9_35+vec2(1.5,0.5))*sTargetSize.zw);
vec2 l9_38=N50_sampleVelocity((l9_35+vec2(0.5,1.5))*sTargetSize.zw);
vec2 l9_39=N50_sampleVelocity((l9_35+vec2(1.5))*sTargetSize.zw);
vec2 l9_40=vec2(l9_34.x);
float l9_41=1.0-diffusionRate;
float l9_42;
if (l9_41<=0.0)
{
l9_42=0.0;
}
else
{
l9_42=sqrt(l9_41);
}
vec2 l9_43=mix(mix(l9_36,l9_37,l9_40),mix(l9_38,l9_39,l9_40),vec2(l9_34.y))*l9_42;
vec2 l9_44;
if (float(useVelocityInputTexture)!=0.0)
{
int l9_45;
#if (userVelocityInputTexHasSwappedViews)
{
l9_45=1-sc_GetStereoViewIndex();
}
#else
{
l9_45=sc_GetStereoViewIndex();
}
#endif
bool l9_46=(int(SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_userVelocityInputTex)!=0));
float l9_47=varPackedTex.x;
sc_SoftwareWrapEarly(l9_47,ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).x);
float l9_48=l9_47;
float l9_49=varPackedTex.y;
sc_SoftwareWrapEarly(l9_49,ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).y);
float l9_50=l9_49;
vec2 l9_51;
float l9_52;
#if (SC_USE_UV_MIN_MAX_userVelocityInputTex)
{
bool l9_53;
#if (SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)
{
l9_53=ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).x==3;
}
#else
{
l9_53=(int(SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)!=0);
}
#endif
float l9_54=l9_48;
float l9_55=1.0;
sc_ClampUV(l9_54,userVelocityInputTexUvMinMax.x,userVelocityInputTexUvMinMax.z,l9_53,l9_55);
float l9_56=l9_54;
float l9_57=l9_55;
bool l9_58;
#if (SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)
{
l9_58=ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).y==3;
}
#else
{
l9_58=(int(SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)!=0);
}
#endif
float l9_59=l9_50;
float l9_60=l9_57;
sc_ClampUV(l9_59,userVelocityInputTexUvMinMax.y,userVelocityInputTexUvMinMax.w,l9_58,l9_60);
l9_52=l9_60;
l9_51=vec2(l9_56,l9_59);
}
#else
{
l9_52=1.0;
l9_51=vec2(l9_48,l9_50);
}
#endif
vec2 l9_61=sc_TransformUV(l9_51,(int(SC_USE_UV_TRANSFORM_userVelocityInputTex)!=0),userVelocityInputTexTransform);
float l9_62=l9_61.x;
float l9_63=l9_52;
sc_SoftwareWrapLate(l9_62,ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).x,l9_46,l9_63);
float l9_64=l9_61.y;
float l9_65=l9_63;
sc_SoftwareWrapLate(l9_64,ivec2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex).y,l9_46,l9_65);
float l9_66=l9_65;
vec3 l9_67=sc_SamplingCoordsViewToGlobal(vec2(l9_62,l9_64),userVelocityInputTexLayout,l9_45);
vec4 l9_68=texture2D(userVelocityInputTex,l9_67.xy,0.0);
vec4 l9_69;
#if (SC_USE_CLAMP_TO_BORDER_userVelocityInputTex)
{
l9_69=mix(userVelocityInputTexBorderColor,l9_68,vec4(l9_66));
}
#else
{
l9_69=l9_68;
}
#endif
float l9_70=impulseRange.y-impulseRange.x;
l9_44=vec2(impulseRange.x+(((DecodeFloat16(l9_69.xy,true)-0.0)*l9_70)/l9_29),impulseRange.x+(((DecodeFloat16(l9_69.zw,true)-0.0)*l9_70)/l9_29))*l9_0;
}
else
{
l9_44=vec2(0.0);
}
vec2 l9_71;
if (float(useVelocityComponentInput)!=0.0)
{
int l9_72;
#if (sImpulseTextureHasSwappedViews)
{
l9_72=1-sc_GetStereoViewIndex();
}
#else
{
l9_72=sc_GetStereoViewIndex();
}
#endif
bool l9_73=(int(SC_USE_CLAMP_TO_BORDER_sImpulseTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sImpulseTexture)!=0));
float l9_74=varPackedTex.x;
sc_SoftwareWrapEarly(l9_74,ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).x);
float l9_75=l9_74;
float l9_76=varPackedTex.y;
sc_SoftwareWrapEarly(l9_76,ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).y);
float l9_77=l9_76;
vec2 l9_78;
float l9_79;
#if (SC_USE_UV_MIN_MAX_sImpulseTexture)
{
bool l9_80;
#if (SC_USE_CLAMP_TO_BORDER_sImpulseTexture)
{
l9_80=ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).x==3;
}
#else
{
l9_80=(int(SC_USE_CLAMP_TO_BORDER_sImpulseTexture)!=0);
}
#endif
float l9_81=l9_75;
float l9_82=1.0;
sc_ClampUV(l9_81,sImpulseTextureUvMinMax.x,sImpulseTextureUvMinMax.z,l9_80,l9_82);
float l9_83=l9_81;
float l9_84=l9_82;
bool l9_85;
#if (SC_USE_CLAMP_TO_BORDER_sImpulseTexture)
{
l9_85=ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).y==3;
}
#else
{
l9_85=(int(SC_USE_CLAMP_TO_BORDER_sImpulseTexture)!=0);
}
#endif
float l9_86=l9_77;
float l9_87=l9_84;
sc_ClampUV(l9_86,sImpulseTextureUvMinMax.y,sImpulseTextureUvMinMax.w,l9_85,l9_87);
l9_79=l9_87;
l9_78=vec2(l9_83,l9_86);
}
#else
{
l9_79=1.0;
l9_78=vec2(l9_75,l9_77);
}
#endif
vec2 l9_88=sc_TransformUV(l9_78,(int(SC_USE_UV_TRANSFORM_sImpulseTexture)!=0),sImpulseTextureTransform);
float l9_89=l9_88.x;
float l9_90=l9_79;
sc_SoftwareWrapLate(l9_89,ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).x,l9_73,l9_90);
float l9_91=l9_88.y;
float l9_92=l9_90;
sc_SoftwareWrapLate(l9_91,ivec2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture).y,l9_73,l9_92);
float l9_93=l9_92;
vec3 l9_94=sc_SamplingCoordsViewToGlobal(vec2(l9_89,l9_91),sImpulseTextureLayout,l9_72);
vec4 l9_95=texture2D(sImpulseTexture,l9_94.xy,0.0);
vec4 l9_96;
#if (SC_USE_CLAMP_TO_BORDER_sImpulseTexture)
{
l9_96=mix(sImpulseTextureBorderColor,l9_95,vec4(l9_93));
}
#else
{
l9_96=l9_95;
}
#endif
float l9_97=impulseRange.y-impulseRange.x;
l9_71=vec2(impulseRange.x+(((DecodeFloat16(l9_96.xy,true)-0.0)*l9_97)/l9_29),impulseRange.x+(((DecodeFloat16(l9_96.zw,true)-0.0)*l9_97)/l9_29))*l9_0;
}
else
{
l9_71=vec2(0.0);
}
int l9_98;
#if (sColorHasSwappedViews)
{
l9_98=1-sc_GetStereoViewIndex();
}
#else
{
l9_98=sc_GetStereoViewIndex();
}
#endif
bool l9_99=(int(SC_USE_CLAMP_TO_BORDER_sColor)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sColor)!=0));
float l9_100=varPackedTex.x;
sc_SoftwareWrapEarly(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).x);
float l9_101=l9_100;
float l9_102=varPackedTex.y;
sc_SoftwareWrapEarly(l9_102,ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).y);
float l9_103=l9_102;
vec2 l9_104;
float l9_105;
#if (SC_USE_UV_MIN_MAX_sColor)
{
bool l9_106;
#if (SC_USE_CLAMP_TO_BORDER_sColor)
{
l9_106=ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).x==3;
}
#else
{
l9_106=(int(SC_USE_CLAMP_TO_BORDER_sColor)!=0);
}
#endif
float l9_107=l9_101;
float l9_108=1.0;
sc_ClampUV(l9_107,sColorUvMinMax.x,sColorUvMinMax.z,l9_106,l9_108);
float l9_109=l9_107;
float l9_110=l9_108;
bool l9_111;
#if (SC_USE_CLAMP_TO_BORDER_sColor)
{
l9_111=ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).y==3;
}
#else
{
l9_111=(int(SC_USE_CLAMP_TO_BORDER_sColor)!=0);
}
#endif
float l9_112=l9_103;
float l9_113=l9_110;
sc_ClampUV(l9_112,sColorUvMinMax.y,sColorUvMinMax.w,l9_111,l9_113);
l9_105=l9_113;
l9_104=vec2(l9_109,l9_112);
}
#else
{
l9_105=1.0;
l9_104=vec2(l9_101,l9_103);
}
#endif
vec2 l9_114=sc_TransformUV(l9_104,(int(SC_USE_UV_TRANSFORM_sColor)!=0),sColorTransform);
float l9_115=l9_114.x;
float l9_116=l9_105;
sc_SoftwareWrapLate(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).x,l9_99,l9_116);
float l9_117=l9_114.y;
float l9_118=l9_116;
sc_SoftwareWrapLate(l9_117,ivec2(SC_SOFTWARE_WRAP_MODE_U_sColor,SC_SOFTWARE_WRAP_MODE_V_sColor).y,l9_99,l9_118);
float l9_119=l9_118;
vec3 l9_120=sc_SamplingCoordsViewToGlobal(vec2(l9_115,l9_117),sColorLayout,l9_98);
vec4 l9_121=texture2D(sColor,l9_120.xy,0.0);
vec4 l9_122;
#if (SC_USE_CLAMP_TO_BORDER_sColor)
{
l9_122=mix(sColorBorderColor,l9_121,vec4(l9_119));
}
#else
{
l9_122=l9_121;
}
#endif
vec2 l9_123;
if (float(buoyancyEnable)!=0.0)
{
vec2 l9_124;
if (l9_122.w>ambientTemperature)
{
l9_124=vec2(0.0,1.0)*(((l9_0*(l9_122.w-ambientTemperature))*buoyancy)-(dot(l9_122.xyz,vec3(0.29899999,0.58700001,0.114))*weight));
}
else
{
l9_124=vec2(0.0);
}
l9_123=l9_124;
}
else
{
l9_123=vec2(0.0);
}
int l9_125;
#if (sBoundaryHasSwappedViews)
{
l9_125=1-sc_GetStereoViewIndex();
}
#else
{
l9_125=sc_GetStereoViewIndex();
}
#endif
bool l9_126=(int(SC_USE_CLAMP_TO_BORDER_sBoundary)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sBoundary)!=0));
float l9_127=varPackedTex.x;
sc_SoftwareWrapEarly(l9_127,ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).x);
float l9_128=l9_127;
float l9_129=varPackedTex.y;
sc_SoftwareWrapEarly(l9_129,ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).y);
float l9_130=l9_129;
vec2 l9_131;
float l9_132;
#if (SC_USE_UV_MIN_MAX_sBoundary)
{
bool l9_133;
#if (SC_USE_CLAMP_TO_BORDER_sBoundary)
{
l9_133=ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).x==3;
}
#else
{
l9_133=(int(SC_USE_CLAMP_TO_BORDER_sBoundary)!=0);
}
#endif
float l9_134=l9_128;
float l9_135=1.0;
sc_ClampUV(l9_134,sBoundaryUvMinMax.x,sBoundaryUvMinMax.z,l9_133,l9_135);
float l9_136=l9_134;
float l9_137=l9_135;
bool l9_138;
#if (SC_USE_CLAMP_TO_BORDER_sBoundary)
{
l9_138=ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).y==3;
}
#else
{
l9_138=(int(SC_USE_CLAMP_TO_BORDER_sBoundary)!=0);
}
#endif
float l9_139=l9_130;
float l9_140=l9_137;
sc_ClampUV(l9_139,sBoundaryUvMinMax.y,sBoundaryUvMinMax.w,l9_138,l9_140);
l9_132=l9_140;
l9_131=vec2(l9_136,l9_139);
}
#else
{
l9_132=1.0;
l9_131=vec2(l9_128,l9_130);
}
#endif
vec2 l9_141=sc_TransformUV(l9_131,(int(SC_USE_UV_TRANSFORM_sBoundary)!=0),sBoundaryTransform);
float l9_142=l9_141.x;
float l9_143=l9_132;
sc_SoftwareWrapLate(l9_142,ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).x,l9_126,l9_143);
float l9_144=l9_141.y;
float l9_145=l9_143;
sc_SoftwareWrapLate(l9_144,ivec2(SC_SOFTWARE_WRAP_MODE_U_sBoundary,SC_SOFTWARE_WRAP_MODE_V_sBoundary).y,l9_126,l9_145);
float l9_146=l9_145;
vec3 l9_147=sc_SamplingCoordsViewToGlobal(vec2(l9_142,l9_144),sBoundaryLayout,l9_125);
vec4 l9_148=texture2D(sBoundary,l9_147.xy,0.0);
vec4 l9_149;
#if (SC_USE_CLAMP_TO_BORDER_sBoundary)
{
l9_149=mix(sBoundaryBorderColor,l9_148,vec4(l9_146));
}
#else
{
l9_149=l9_148;
}
#endif
float l9_150=dot(l9_149,vec4(1.0));
vec2 l9_151=l9_71+l9_44;
vec2 l9_152=(l9_43+(l9_151*impulseMult))+l9_123;
vec2 l9_153;
if (int(float(reset))>0)
{
l9_153=vec2(0.0);
}
else
{
l9_153=l9_152*step(l9_150,2.5);
}
vec2 l9_154=ssEncodeFloat16(l9_153.x,N50_velocityRange.x,N50_velocityRange.y,0.99998999);
vec2 l9_155=ssEncodeFloat16(l9_153.y,N50_velocityRange.x,N50_velocityRange.y,0.99998999);
float l9_156=l9_155.y;
vec4 l9_157=vec4(l9_154,l9_155.x,l9_156);
#if (sc_BlendMode_AlphaTest)
{
if (l9_156<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_156<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_158;
#if (sc_ProjectiveShadowsCaster)
{
float l9_159;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_159=l9_156;
}
#else
{
float l9_160;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_160=clamp(l9_156*2.0,0.0,1.0);
}
#else
{
float l9_161;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_161=clamp(dot(l9_157.xyz,vec3(l9_156)),0.0,1.0);
}
#else
{
float l9_162;
#if (sc_BlendMode_AlphaTest)
{
l9_162=1.0;
}
#else
{
float l9_163;
#if (sc_BlendMode_Multiply)
{
l9_163=(1.0-dot(l9_157.xyz,vec3(0.33333001)))*l9_156;
}
#else
{
float l9_164;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_164=(1.0-clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0))*l9_156;
}
#else
{
float l9_165;
#if (sc_BlendMode_ColoredGlass)
{
l9_165=clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0)*l9_156;
}
#else
{
float l9_166;
#if (sc_BlendMode_Add)
{
l9_166=clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_167;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_167=clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0)*l9_156;
}
#else
{
float l9_168;
#if (sc_BlendMode_Screen)
{
l9_168=dot(l9_157.xyz,vec3(0.33333001))*l9_156;
}
#else
{
float l9_169;
#if (sc_BlendMode_Min)
{
l9_169=1.0-clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_170;
#if (sc_BlendMode_Max)
{
l9_170=clamp(dot(l9_157.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_170=1.0;
}
#endif
l9_169=l9_170;
}
#endif
l9_168=l9_169;
}
#endif
l9_167=l9_168;
}
#endif
l9_166=l9_167;
}
#endif
l9_165=l9_166;
}
#endif
l9_164=l9_165;
}
#endif
l9_163=l9_164;
}
#endif
l9_162=l9_163;
}
#endif
l9_161=l9_162;
}
#endif
l9_160=l9_161;
}
#endif
l9_159=l9_160;
}
#endif
l9_158=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_157.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_159);
}
#else
{
vec4 l9_171;
#if (sc_RenderAlphaToColor)
{
l9_171=vec4(l9_156);
}
#else
{
vec4 l9_172;
#if (sc_BlendMode_Custom)
{
vec4 l9_173;
#if (sc_FramebufferFetch)
{
vec4 l9_174=sc_readFragData0_Platform();
vec4 l9_175;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_176=l9_174;
l9_176.x=l9_174.x+_sc_framebufferFetchMarker;
l9_175=l9_176;
}
#else
{
l9_175=l9_174;
}
#endif
l9_173=l9_175;
}
#else
{
vec2 l9_177=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
int l9_178;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_178=1-sc_GetStereoViewIndex();
}
#else
{
l9_178=sc_GetStereoViewIndex();
}
#endif
l9_173=texture2D(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_177,sc_ScreenTextureLayout,l9_178).xy,0.0);
}
#endif
vec4 l9_179;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_180=l9_173;
l9_180.x=l9_173.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_179=l9_180;
}
#else
{
l9_179=l9_173;
}
#endif
vec3 l9_181=mix(l9_179.xyz,definedBlend(l9_179.xyz,l9_157.xyz).xyz,vec3(l9_156));
vec4 l9_182=vec4(l9_181.x,l9_181.y,l9_181.z,vec4(0.0).w);
l9_182.w=1.0;
l9_172=l9_182;
}
#else
{
vec4 l9_183;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_183=vec4(mix(vec3(1.0),l9_157.xyz,vec3(l9_156)),l9_156);
}
#else
{
vec4 l9_184;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_185;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_185=clamp(l9_156,0.0,1.0);
}
#else
{
l9_185=l9_156;
}
#endif
l9_184=vec4(l9_157.xyz*l9_185,l9_185);
}
#else
{
l9_184=l9_157;
}
#endif
l9_183=l9_184;
}
#endif
l9_172=l9_183;
}
#endif
l9_171=l9_172;
}
#endif
l9_158=l9_171;
}
#endif
vec4 l9_186;
if (PreviewEnabled==1)
{
vec4 l9_187;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_187=PreviewVertexColor;
}
else
{
l9_187=vec4(0.0);
}
l9_186=l9_187;
}
else
{
l9_186=l9_158;
}
vec4 l9_188;
#if (sc_ShaderComplexityAnalyzer)
{
l9_188=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_188=vec4(0.0);
}
#endif
vec4 l9_189;
if (l9_188.w>0.0)
{
l9_189=l9_188;
}
else
{
l9_189=l9_186;
}
vec4 l9_190=outputMotionVectorsIfNeeded(varPos,max(l9_189,vec4(0.0)));
vec4 l9_191=clamp(l9_190,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_192=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_192-0.0039215689)),min(1.0,l9_192+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_193=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_193).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_194=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_193).xy);
float l9_195=packValue(l9_194);
int l9_202=int(l9_191.w*255.0);
float l9_203=packValue(l9_202);
sc_writeFragData0Internal(vec4(packValue(l9_194),packValue(l9_194),packValue(l9_194),packValue(l9_194)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_195,packValue(l9_194),packValue(l9_194),packValue(l9_194)));
sc_writeFragData2(vec4(l9_203,packValue(l9_202),packValue(l9_202),packValue(l9_202)));
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
vec2 l9_206=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_206).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_207[8];
int l9_208[8];
int l9_209=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_209<8)
{
l9_207[l9_209]=0;
l9_208[l9_209]=0;
l9_209++;
continue;
}
else
{
break;
}
}
int l9_210;
#if (sc_OITMaxLayers8)
{
l9_210=2;
}
#else
{
l9_210=1;
}
#endif
int l9_211=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_211<l9_210)
{
vec4 l9_212;
vec4 l9_213;
vec4 l9_214;
if (l9_211==0)
{
l9_214=texture2D(sc_OITAlpha0,l9_206);
l9_213=texture2D(sc_OITDepthLow0,l9_206);
l9_212=texture2D(sc_OITDepthHigh0,l9_206);
}
else
{
l9_214=vec4(0.0);
l9_213=vec4(0.0);
l9_212=vec4(0.0);
}
vec4 l9_215;
vec4 l9_216;
vec4 l9_217;
if (l9_211==1)
{
l9_217=texture2D(sc_OITAlpha1,l9_206);
l9_216=texture2D(sc_OITDepthLow1,l9_206);
l9_215=texture2D(sc_OITDepthHigh1,l9_206);
}
else
{
l9_217=l9_214;
l9_216=l9_213;
l9_215=l9_212;
}
if (any(notEqual(l9_215,vec4(0.0)))||any(notEqual(l9_216,vec4(0.0))))
{
int l9_218[8]=l9_207;
unpackValues(l9_215.w,l9_211,l9_218);
unpackValues(l9_215.z,l9_211,l9_218);
unpackValues(l9_215.y,l9_211,l9_218);
unpackValues(l9_215.x,l9_211,l9_218);
unpackValues(l9_216.w,l9_211,l9_218);
unpackValues(l9_216.z,l9_211,l9_218);
unpackValues(l9_216.y,l9_211,l9_218);
unpackValues(l9_216.x,l9_211,l9_218);
int l9_227[8]=l9_208;
unpackValues(l9_217.w,l9_211,l9_227);
unpackValues(l9_217.z,l9_211,l9_227);
unpackValues(l9_217.y,l9_211,l9_227);
unpackValues(l9_217.x,l9_211,l9_227);
}
l9_211++;
continue;
}
else
{
break;
}
}
vec4 l9_232=texture2D(sc_OITFilteredDepthBoundsTexture,l9_206);
vec2 l9_233=l9_232.xy;
int l9_234;
#if (sc_SkinBonesCount>0)
{
l9_234=encodeDepth(((1.0-l9_232.x)*1000.0)+getDepthOrderingEpsilon(),l9_233);
}
#else
{
l9_234=0;
}
#endif
int l9_235=encodeDepth(viewSpaceDepth(),l9_233);
vec4 l9_236;
l9_236=l9_191*l9_191.w;
vec4 l9_237;
int l9_238=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_238<8)
{
int l9_239=l9_207[l9_238];
int l9_240=l9_235-l9_234;
bool l9_241=l9_239<l9_240;
bool l9_242;
if (l9_241)
{
l9_242=l9_207[l9_238]>0;
}
else
{
l9_242=l9_241;
}
if (l9_242)
{
vec3 l9_243=l9_236.xyz*(1.0-(float(l9_208[l9_238])/255.0));
l9_237=vec4(l9_243.x,l9_243.y,l9_243.z,l9_236.w);
}
else
{
l9_237=l9_236;
}
l9_236=l9_237;
l9_238++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_236,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_191,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_190,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
