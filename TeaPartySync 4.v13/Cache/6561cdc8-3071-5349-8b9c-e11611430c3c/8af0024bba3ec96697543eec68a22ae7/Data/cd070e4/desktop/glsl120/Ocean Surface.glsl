//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
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
//sampler sampler bodyDepthTexSmpSC 0:21
//sampler sampler distortionTexSmpSC 0:22
//sampler sampler fluidPressureSmpSC 0:23
//sampler sampler intensityTextureSmpSC 0:24
//sampler sampler oceanHeightmapSmpSC 0:25
//sampler sampler oceanNormalSmpSC 0:26
//sampler sampler sc_EnvmapDiffuseSmpSC 0:27
//sampler sampler sc_EnvmapSpecularSmpSC 0:28
//sampler sampler sc_OITCommonSampler 0:29
//sampler sampler sc_SSAOTextureSmpSC 0:30
//sampler sampler sc_ScreenTextureSmpSC 0:31
//sampler sampler sc_ShadowTextureSmpSC 0:32
//sampler sampler screenTexSmpSC 0:34
//texture texture2D bodyDepthTex 0:0:0:21
//texture texture2D distortionTex 0:1:0:22
//texture texture2D fluidPressure 0:2:0:23
//texture texture2D intensityTexture 0:3:0:24
//texture texture2D oceanHeightmap 0:4:0:25
//texture texture2D oceanNormal 0:5:0:26
//texture texture2D sc_EnvmapDiffuse 0:6:0:27
//texture texture2D sc_EnvmapSpecular 0:7:0:28
//texture texture2D sc_OITAlpha0 0:8:0:29
//texture texture2D sc_OITAlpha1 0:9:0:29
//texture texture2D sc_OITDepthHigh0 0:10:0:29
//texture texture2D sc_OITDepthHigh1 0:11:0:29
//texture texture2D sc_OITDepthLow0 0:12:0:29
//texture texture2D sc_OITDepthLow1 0:13:0:29
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:14:0:29
//texture texture2D sc_OITFrontDepthTexture 0:15:0:29
//texture texture2D sc_SSAOTexture 0:16:0:30
//texture texture2D sc_ScreenTexture 0:17:0:31
//texture texture2D sc_ShadowTexture 0:18:0:32
//texture texture2D screenTex 0:20:0:34
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_distortionTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanNormal 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 37 0
//spec_const bool SC_USE_UV_MIN_MAX_bodyDepthTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_distortionTex 39 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 40 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 41 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanHeightmap 42 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanNormal 43 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 44 0
//spec_const bool SC_USE_UV_TRANSFORM_bodyDepthTex 45 0
//spec_const bool SC_USE_UV_TRANSFORM_distortionTex 46 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 47 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 48 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanHeightmap 49 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanNormal 50 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 51 0
//spec_const bool UseViewSpaceDepthVariant 52 1
//spec_const bool bodyDepthTexHasSwappedViews 53 0
//spec_const bool distortionTexHasSwappedViews 54 0
//spec_const bool fluidPressureHasSwappedViews 55 0
//spec_const bool intensityTextureHasSwappedViews 56 0
//spec_const bool oceanHeightmapHasSwappedViews 57 0
//spec_const bool oceanNormalHasSwappedViews 58 0
//spec_const bool sc_BlendMode_Add 59 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 60 0
//spec_const bool sc_BlendMode_AlphaTest 61 0
//spec_const bool sc_BlendMode_AlphaToCoverage 62 0
//spec_const bool sc_BlendMode_ColoredGlass 63 0
//spec_const bool sc_BlendMode_Custom 64 0
//spec_const bool sc_BlendMode_Max 65 0
//spec_const bool sc_BlendMode_Min 66 0
//spec_const bool sc_BlendMode_Multiply 67 0
//spec_const bool sc_BlendMode_MultiplyOriginal 68 0
//spec_const bool sc_BlendMode_Normal 69 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 70 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 71 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 72 0
//spec_const bool sc_BlendMode_Screen 73 0
//spec_const bool sc_BlendMode_Software 74 0
//spec_const bool sc_DepthOnly 75 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 76 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 77 0
//spec_const bool sc_FramebufferFetch 78 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 79 0
//spec_const bool sc_HasDiffuseEnvmap 80 0
//spec_const bool sc_IsEditor 81 0
//spec_const bool sc_LightEstimation 82 0
//spec_const bool sc_MotionVectorsPass 83 0
//spec_const bool sc_OITCompositingPass 84 0
//spec_const bool sc_OITDepthBoundsPass 85 0
//spec_const bool sc_OITDepthGatherPass 86 0
//spec_const bool sc_OITDepthPrepass 87 0
//spec_const bool sc_OITFrontLayerPass 88 0
//spec_const bool sc_OITMaxLayers4Plus1 89 0
//spec_const bool sc_OITMaxLayers8 90 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 91 0
//spec_const bool sc_ProjectiveShadowsCaster 92 0
//spec_const bool sc_ProjectiveShadowsReceiver 93 0
//spec_const bool sc_RenderAlphaToColor 94 0
//spec_const bool sc_SSAOEnabled 95 0
//spec_const bool sc_ScreenTextureHasSwappedViews 96 0
//spec_const bool sc_ShaderComplexityAnalyzer 97 0
//spec_const bool sc_TAAEnabled 98 0
//spec_const bool sc_UseFramebufferFetchMarker 99 0
//spec_const bool sc_VertexBlending 100 0
//spec_const bool sc_VertexBlendingUseNormals 101 0
//spec_const bool screenTexHasSwappedViews 102 0
//spec_const int SC_DEVICE_CLASS 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_distortionTex 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanNormal 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_distortionTex 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 113 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 114 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap 115 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanNormal 116 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 117 -1
//spec_const int bodyDepthTexLayout 118 0
//spec_const int distortionTexLayout 119 0
//spec_const int fluidPressureLayout 120 0
//spec_const int intensityTextureLayout 121 0
//spec_const int oceanHeightmapLayout 122 0
//spec_const int oceanNormalLayout 123 0
//spec_const int sc_AmbientLightMode0 124 0
//spec_const int sc_AmbientLightMode1 125 0
//spec_const int sc_AmbientLightMode2 126 0
//spec_const int sc_AmbientLightMode_Constant 127 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 128 0
//spec_const int sc_AmbientLightMode_FromCamera 129 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 130 0
//spec_const int sc_AmbientLightsCount 131 0
//spec_const int sc_DepthBufferMode 132 0
//spec_const int sc_DirectionalLightsCount 133 0
//spec_const int sc_EnvLightMode 134 0
//spec_const int sc_EnvmapDiffuseLayout 135 0
//spec_const int sc_EnvmapSpecularLayout 136 0
//spec_const int sc_LightEstimationSGCount 137 0
//spec_const int sc_MaxTextureImageUnits 138 0
//spec_const int sc_PointLightsCount 139 0
//spec_const int sc_RenderingSpace 140 -1
//spec_const int sc_ScreenTextureLayout 141 0
//spec_const int sc_ShaderCacheConstant 142 0
//spec_const int sc_SkinBonesCount 143 0
//spec_const int sc_StereoRenderingMode 144 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 145 0
//spec_const int sc_StereoViewID 146 0
//spec_const int screenTexLayout 147 0
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float N123_fbm;
float N123_TatalHeightRemap;
vec3 SurfacePosition_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 gScreenCoord;
vec3 ViewDirWS;
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
#ifndef screenTexHasSwappedViews
#define screenTexHasSwappedViews 0
#elif screenTexHasSwappedViews==1
#undef screenTexHasSwappedViews
#define screenTexHasSwappedViews 1
#endif
#ifndef screenTexLayout
#define screenTexLayout 0
#endif
#ifndef distortionTexHasSwappedViews
#define distortionTexHasSwappedViews 0
#elif distortionTexHasSwappedViews==1
#undef distortionTexHasSwappedViews
#define distortionTexHasSwappedViews 1
#endif
#ifndef distortionTexLayout
#define distortionTexLayout 0
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
#ifndef oceanNormalHasSwappedViews
#define oceanNormalHasSwappedViews 0
#elif oceanNormalHasSwappedViews==1
#undef oceanNormalHasSwappedViews
#define oceanNormalHasSwappedViews 1
#endif
#ifndef oceanNormalLayout
#define oceanNormalLayout 0
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
struct ssPreviewInfo
{
vec4 Color;
bool Saved;
};
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
#ifndef SC_USE_UV_TRANSFORM_distortionTex
#define SC_USE_UV_TRANSFORM_distortionTex 0
#elif SC_USE_UV_TRANSFORM_distortionTex==1
#undef SC_USE_UV_TRANSFORM_distortionTex
#define SC_USE_UV_TRANSFORM_distortionTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_distortionTex
#define SC_SOFTWARE_WRAP_MODE_U_distortionTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_distortionTex
#define SC_SOFTWARE_WRAP_MODE_V_distortionTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_distortionTex
#define SC_USE_UV_MIN_MAX_distortionTex 0
#elif SC_USE_UV_MIN_MAX_distortionTex==1
#undef SC_USE_UV_MIN_MAX_distortionTex
#define SC_USE_UV_MIN_MAX_distortionTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_distortionTex
#define SC_USE_CLAMP_TO_BORDER_distortionTex 0
#elif SC_USE_CLAMP_TO_BORDER_distortionTex==1
#undef SC_USE_CLAMP_TO_BORDER_distortionTex
#define SC_USE_CLAMP_TO_BORDER_distortionTex 1
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
#ifndef SC_USE_UV_TRANSFORM_oceanNormal
#define SC_USE_UV_TRANSFORM_oceanNormal 0
#elif SC_USE_UV_TRANSFORM_oceanNormal==1
#undef SC_USE_UV_TRANSFORM_oceanNormal
#define SC_USE_UV_TRANSFORM_oceanNormal 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_oceanNormal
#define SC_SOFTWARE_WRAP_MODE_U_oceanNormal -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_oceanNormal
#define SC_SOFTWARE_WRAP_MODE_V_oceanNormal -1
#endif
#ifndef SC_USE_UV_MIN_MAX_oceanNormal
#define SC_USE_UV_MIN_MAX_oceanNormal 0
#elif SC_USE_UV_MIN_MAX_oceanNormal==1
#undef SC_USE_UV_MIN_MAX_oceanNormal
#define SC_USE_UV_MIN_MAX_oceanNormal 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_oceanNormal
#define SC_USE_CLAMP_TO_BORDER_oceanNormal 0
#elif SC_USE_CLAMP_TO_BORDER_oceanNormal==1
#undef SC_USE_CLAMP_TO_BORDER_oceanNormal
#define SC_USE_CLAMP_TO_BORDER_oceanNormal 1
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
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
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
uniform vec3 oceanMin;
uniform vec3 oceanMax;
uniform float speed;
uniform float enableFoam;
uniform float fbmScale;
uniform float enableInfinite;
uniform float distortionScale;
uniform float distortionIntensity;
uniform float enableFluid;
uniform vec2 pressureRange;
uniform float fluidMul;
uniform vec2 unpackVal;
uniform vec4 colorTrough;
uniform vec4 colorMiddle;
uniform vec4 colorCrest;
uniform int PreviewNodeID;
uniform mat3 screenTexTransform;
uniform vec4 screenTexUvMinMax;
uniform vec4 screenTexBorderColor;
uniform mat3 distortionTexTransform;
uniform vec4 distortionTexUvMinMax;
uniform vec4 distortionTexBorderColor;
uniform mat3 oceanHeightmapTransform;
uniform vec4 oceanHeightmapUvMinMax;
uniform vec4 oceanHeightmapBorderColor;
uniform mat3 oceanNormalTransform;
uniform vec4 oceanNormalUvMinMax;
uniform vec4 oceanNormalBorderColor;
uniform mat3 fluidPressureTransform;
uniform vec4 fluidPressureUvMinMax;
uniform vec4 fluidPressureBorderColor;
uniform float Port_Position1_N030;
uniform float Port_Position2_N030;
uniform float Port_Position3_N030;
uniform float Port_Position4_N030;
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform vec4 sc_Time;
uniform sampler2D distortionTex;
uniform sampler2D screenTex;
uniform sampler2D oceanHeightmap;
uniform sampler2D fluidPressure;
uniform sampler2D oceanNormal;
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
ssPreviewInfo PreviewInfo;
ssGlobals tempGlobals;
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
void Node30_Gradient(float Ratio,vec4 Value0,float Position1,vec4 Value1,float Position2,vec4 Value2,float Position3,vec4 Value3,float Position4,vec4 Value4,vec4 Value5,out vec4 Value,ssGlobals Globals)
{
Ratio=clamp(Ratio,0.0,1.0);
if (Ratio<Position1)
{
Value=mix(Value0,Value1,vec4(clamp(Ratio/Position1,0.0,1.0)));
}
else
{
if (Ratio<Position2)
{
Value=mix(Value1,Value2,vec4(clamp((Ratio-Position1)/(Position2-Position1),0.0,1.0)));
}
else
{
if (Ratio<Position3)
{
Value=mix(Value2,Value3,vec4(clamp((Ratio-Position2)/(Position3-Position2),0.0,1.0)));
}
else
{
if (Ratio<Position4)
{
Value=mix(Value3,Value4,vec4(clamp((Ratio-Position3)/(Position4-Position3),0.0,1.0)));
}
else
{
Value=mix(Value4,Value5,vec4(clamp((Ratio-Position4)/(1.0-Position4),0.0,1.0)));
}
}
}
}
bool l9_0=PreviewEnabled==1;
bool l9_1;
if (l9_0)
{
l9_1=!PreviewInfo.Saved;
}
else
{
l9_1=l9_0;
}
if (l9_1&&(30==PreviewNodeID))
{
PreviewInfo.Saved=true;
PreviewInfo.Color=Value;
}
}
vec4 N123_GradientInput_evaluate()
{
float l9_0=tempGlobals.N123_TatalHeightRemap;
float l9_1=tempGlobals.N123_fbm;
vec4 l9_2=mix(colorMiddle,colorCrest,vec4(l9_1));
ssGlobals l9_3=tempGlobals;
vec4 param_11;
Node30_Gradient(l9_0,colorTrough,Port_Position1_N030,colorTrough,Port_Position2_N030,colorTrough,Port_Position3_N030,colorMiddle,Port_Position4_N030,l9_2,l9_2,param_11,l9_3);
return param_11;
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
vec4 N123_ScreenTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTex)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_22=texture2DLod(screenTex,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_23=mix(screenTexBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))/vec2(255.0);
}
return dot(rg,vec2(1.0,0.0039215689));
}
float N123_noise(vec2 p)
{
vec2 l9_0=floor(p);
vec2 l9_1=fract(p);
vec2 l9_2=(l9_1*l9_1)*(vec2(3.0)-(l9_1*2.0));
float l9_3=l9_2.x;
float l9_4=mix(mix(fract(sin(dot(l9_0,vec2(12.9898,4.1413999)))*43758.547),fract(sin(dot(l9_0+vec2(1.0,0.0),vec2(12.9898,4.1413999)))*43758.547),l9_3),mix(fract(sin(dot(l9_0+vec2(0.0,1.0),vec2(12.9898,4.1413999)))*43758.547),fract(sin(dot(l9_0+vec2(1.0),vec2(12.9898,4.1413999)))*43758.547),l9_3),l9_2.y);
return l9_4*l9_4;
}
float ssPow(float A,float B)
{
float l9_0;
if (A<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A,B);
}
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
PreviewInfo.Color=vec4(0.5);
PreviewInfo.Saved=false;
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
vec4 l9_28=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
vec3 l9_29=varNormal;
tempGlobals=ssGlobals(sc_Time.x,sc_Time.y,0.0,0.0,0.0,varPos,varNormal,varTangent.xyz,cross(varNormal,varTangent.xyz)*varTangent.w,l9_26,((l9_28.xyz/vec3(l9_28.w)).xy*0.5)+vec2(0.5),normalize(sc_Camera.position-varPos));
vec4 l9_30=N123_GradientInput_evaluate();
vec2 l9_31=tempGlobals.gScreenCoord;
vec2 l9_32=tempGlobals.Surface_UVCoord0;
vec3 l9_33=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_34=l9_32*distortionScale;
int l9_35;
#if (distortionTexHasSwappedViews)
{
l9_35=1-sc_GetStereoViewIndex();
}
#else
{
l9_35=sc_GetStereoViewIndex();
}
#endif
bool l9_36=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_distortionTex)!=0));
float l9_37=l9_34.x;
sc_SoftwareWrapEarly(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x);
float l9_38=l9_37;
float l9_39=l9_34.y;
sc_SoftwareWrapEarly(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y);
float l9_40=l9_39;
vec2 l9_41;
float l9_42;
#if (SC_USE_UV_MIN_MAX_distortionTex)
{
bool l9_43;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_43=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x==3;
}
#else
{
l9_43=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_44=l9_38;
float l9_45=1.0;
sc_ClampUV(l9_44,distortionTexUvMinMax.x,distortionTexUvMinMax.z,l9_43,l9_45);
float l9_46=l9_44;
float l9_47=l9_45;
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_49=l9_40;
float l9_50=l9_47;
sc_ClampUV(l9_49,distortionTexUvMinMax.y,distortionTexUvMinMax.w,l9_48,l9_50);
l9_42=l9_50;
l9_41=vec2(l9_46,l9_49);
}
#else
{
l9_42=1.0;
l9_41=vec2(l9_38,l9_40);
}
#endif
vec2 l9_51=sc_TransformUV(l9_41,(int(SC_USE_UV_TRANSFORM_distortionTex)!=0),distortionTexTransform);
float l9_52=l9_51.x;
float l9_53=l9_42;
sc_SoftwareWrapLate(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x,l9_36,l9_53);
float l9_54=l9_51.y;
float l9_55=l9_53;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y,l9_36,l9_55);
float l9_56=l9_55;
vec3 l9_57=sc_SamplingCoordsViewToGlobal(vec2(l9_52,l9_54),distortionTexLayout,l9_35);
vec4 l9_58=texture2DLod(distortionTex,l9_57.xy,0.0);
vec4 l9_59;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_59=mix(distortionTexBorderColor,l9_58,vec4(l9_56));
}
#else
{
l9_59=l9_58;
}
#endif
vec2 l9_60=(((l9_59.xy-vec2(1.0))*distortionIntensity)+l9_31)+vec2(0.30000001);
vec2 l9_61;
if (enableInfinite==1.0)
{
vec2 l9_62=vec2(oceanMin.xz);
vec2 l9_63=vec2(0.0)+(((sc_Camera.position.xz-l9_62)*1.0)/((vec2(oceanMax.xz)-l9_62)+vec2(1e-06)));
vec2 l9_64=l9_63;
l9_64.y=1.0-l9_63.y;
l9_61=(l9_32+l9_64)-vec2(0.5);
}
else
{
l9_61=l9_32;
}
int l9_65;
#if (oceanHeightmapHasSwappedViews)
{
l9_65=1-sc_GetStereoViewIndex();
}
#else
{
l9_65=sc_GetStereoViewIndex();
}
#endif
bool l9_66=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanHeightmap)!=0));
float l9_67=l9_61.x;
sc_SoftwareWrapEarly(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x);
float l9_68=l9_67;
float l9_69=l9_61.y;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y);
float l9_70=l9_69;
vec2 l9_71;
float l9_72;
#if (SC_USE_UV_MIN_MAX_oceanHeightmap)
{
bool l9_73;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_73=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x==3;
}
#else
{
l9_73=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_74=l9_68;
float l9_75=1.0;
sc_ClampUV(l9_74,oceanHeightmapUvMinMax.x,oceanHeightmapUvMinMax.z,l9_73,l9_75);
float l9_76=l9_74;
float l9_77=l9_75;
bool l9_78;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_78=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y==3;
}
#else
{
l9_78=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_79=l9_70;
float l9_80=l9_77;
sc_ClampUV(l9_79,oceanHeightmapUvMinMax.y,oceanHeightmapUvMinMax.w,l9_78,l9_80);
l9_72=l9_80;
l9_71=vec2(l9_76,l9_79);
}
#else
{
l9_72=1.0;
l9_71=vec2(l9_68,l9_70);
}
#endif
vec2 l9_81=sc_TransformUV(l9_71,(int(SC_USE_UV_TRANSFORM_oceanHeightmap)!=0),oceanHeightmapTransform);
float l9_82=l9_81.x;
float l9_83=l9_72;
sc_SoftwareWrapLate(l9_82,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x,l9_66,l9_83);
float l9_84=l9_81.y;
float l9_85=l9_83;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y,l9_66,l9_85);
float l9_86=l9_85;
vec3 l9_87=sc_SamplingCoordsViewToGlobal(vec2(l9_82,l9_84),oceanHeightmapLayout,l9_65);
vec4 l9_88=texture2DLod(oceanHeightmap,l9_87.xy,0.0);
vec4 l9_89;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_89=mix(oceanHeightmapBorderColor,l9_88,vec4(l9_86));
}
#else
{
l9_89=l9_88;
}
#endif
float l9_90=DecodeFloat16(l9_89.xy,true);
float l9_91=unpackVal.y-unpackVal.x;
float l9_92=0.99998999-0.0;
float l9_93=unpackVal.x+(((l9_90-0.0)*l9_91)/l9_92);
float l9_94=l9_91+1e-06;
tempGlobals.N123_TatalHeightRemap=0.0+(((l9_93-unpackVal.x)*1.0)/l9_94);
float l9_95;
if (enableFluid==1.0)
{
int l9_96;
#if (fluidPressureHasSwappedViews)
{
l9_96=1-sc_GetStereoViewIndex();
}
#else
{
l9_96=sc_GetStereoViewIndex();
}
#endif
bool l9_97=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0)&&(!(int(SC_USE_UV_MIN_MAX_fluidPressure)!=0));
float l9_98=l9_32.x;
sc_SoftwareWrapEarly(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x);
float l9_99=l9_98;
float l9_100=l9_32.y;
sc_SoftwareWrapEarly(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y);
float l9_101=l9_100;
vec2 l9_102;
float l9_103;
#if (SC_USE_UV_MIN_MAX_fluidPressure)
{
bool l9_104;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_104=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x==3;
}
#else
{
l9_104=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_105=l9_99;
float l9_106=1.0;
sc_ClampUV(l9_105,fluidPressureUvMinMax.x,fluidPressureUvMinMax.z,l9_104,l9_106);
float l9_107=l9_105;
float l9_108=l9_106;
bool l9_109;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_109=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y==3;
}
#else
{
l9_109=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_110=l9_101;
float l9_111=l9_108;
sc_ClampUV(l9_110,fluidPressureUvMinMax.y,fluidPressureUvMinMax.w,l9_109,l9_111);
l9_103=l9_111;
l9_102=vec2(l9_107,l9_110);
}
#else
{
l9_103=1.0;
l9_102=vec2(l9_99,l9_101);
}
#endif
vec2 l9_112=sc_TransformUV(l9_102,(int(SC_USE_UV_TRANSFORM_fluidPressure)!=0),fluidPressureTransform);
float l9_113=l9_112.x;
float l9_114=l9_103;
sc_SoftwareWrapLate(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x,l9_97,l9_114);
float l9_115=l9_112.y;
float l9_116=l9_114;
sc_SoftwareWrapLate(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y,l9_97,l9_116);
float l9_117=l9_116;
vec3 l9_118=sc_SamplingCoordsViewToGlobal(vec2(l9_113,l9_115),fluidPressureLayout,l9_96);
vec4 l9_119=texture2DLod(fluidPressure,l9_118.xy,0.0);
vec4 l9_120;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_120=mix(fluidPressureBorderColor,l9_119,vec4(l9_117));
}
#else
{
l9_120=l9_119;
}
#endif
float l9_121=(pressureRange.x+(((DecodeFloat16(l9_120.xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_92))*fluidMul;
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp(l9_121,unpackVal.x,unpackVal.y)-unpackVal.x)*1.0)/l9_94))*0.60000002);
l9_95=l9_93+l9_121;
}
else
{
l9_95=l9_93;
}
int l9_122;
#if (oceanNormalHasSwappedViews)
{
l9_122=1-sc_GetStereoViewIndex();
}
#else
{
l9_122=sc_GetStereoViewIndex();
}
#endif
bool l9_123=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanNormal)!=0));
float l9_124=l9_61.x;
sc_SoftwareWrapEarly(l9_124,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x);
float l9_125=l9_124;
float l9_126=l9_61.y;
sc_SoftwareWrapEarly(l9_126,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y);
float l9_127=l9_126;
vec2 l9_128;
float l9_129;
#if (SC_USE_UV_MIN_MAX_oceanNormal)
{
bool l9_130;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_130=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x==3;
}
#else
{
l9_130=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_131=l9_125;
float l9_132=1.0;
sc_ClampUV(l9_131,oceanNormalUvMinMax.x,oceanNormalUvMinMax.z,l9_130,l9_132);
float l9_133=l9_131;
float l9_134=l9_132;
bool l9_135;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_135=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y==3;
}
#else
{
l9_135=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_136=l9_127;
float l9_137=l9_134;
sc_ClampUV(l9_136,oceanNormalUvMinMax.y,oceanNormalUvMinMax.w,l9_135,l9_137);
l9_129=l9_137;
l9_128=vec2(l9_133,l9_136);
}
#else
{
l9_129=1.0;
l9_128=vec2(l9_125,l9_127);
}
#endif
vec2 l9_138=sc_TransformUV(l9_128,(int(SC_USE_UV_TRANSFORM_oceanNormal)!=0),oceanNormalTransform);
float l9_139=l9_138.x;
float l9_140=l9_129;
sc_SoftwareWrapLate(l9_139,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x,l9_123,l9_140);
float l9_141=l9_138.y;
float l9_142=l9_140;
sc_SoftwareWrapLate(l9_141,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y,l9_123,l9_142);
float l9_143=l9_142;
vec3 l9_144=sc_SamplingCoordsViewToGlobal(vec2(l9_139,l9_141),oceanNormalLayout,l9_122);
vec4 l9_145=texture2DLod(oceanNormal,l9_144.xy,0.0);
vec4 l9_146;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_146=mix(oceanNormalBorderColor,l9_145,vec4(l9_143));
}
#else
{
l9_146=l9_145;
}
#endif
vec3 l9_147=(l9_146.xyz*1.9921875)-vec3(1.0);
vec3 l9_148=vec3(0.0,l9_95,0.0);
vec3 l9_149=l9_148+l9_33;
tempGlobals.N123_fbm=1.0;
if (enableFoam==1.0)
{
vec2 l9_150=l9_149.zx*fbmScale;
float l9_151=tempGlobals.gTimeElapsed*speed;
vec2 l9_152=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_150)*2.02;
vec2 l9_153=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_152)*2.01;
vec2 l9_154=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_153)*2.03;
vec2 l9_155=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_154)*2.01;
tempGlobals.N123_fbm=1.0-(((((((0.0+(0.5*N123_noise(l9_150+vec2(l9_151))))+(0.03125*N123_noise(l9_152)))+(0.25*N123_noise(l9_153)))+(0.125*N123_noise(l9_154)))+(0.0625*N123_noise(l9_155)))+(0.015625*N123_noise(((mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_155)*2.04)+vec2(sin(l9_151)))))/0.96875);
}
vec4 l9_156=N123_GradientInput_evaluate();
if (sc_DirectionalLightsCount>0)
{
int l9_157=0;
bool l9_158;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_158=l9_157<sc_DirectionalLightsCount;
if (l9_158)
{
vec3 l9_159;
if (l9_158)
{
l9_159=-sc_DirectionalLights[l9_157].direction;
}
else
{
l9_159=vec3(0.0);
}
l9_157++;
continue;
}
else
{
break;
}
}
}
vec3 l9_160;
vec3 l9_161;
vec3 l9_162;
if (l9_25)
{
l9_162=varTangent.xyz;
l9_161=varNormal;
l9_160=varPos;
}
else
{
l9_162=varTangent.xyz;
l9_161=l9_29;
l9_160=l9_149;
}
varPos=l9_160;
varNormal=normalize(l9_161);
vec3 l9_163=normalize(l9_162);
varTangent=vec4(l9_163.x,l9_163.y,l9_163.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_164;
#if (sc_RenderingSpace==3)
{
l9_164=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_165;
#if (sc_RenderingSpace==2)
{
l9_165=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_166;
#if (sc_RenderingSpace==1)
{
l9_166=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
l9_166=l9_15;
}
#endif
l9_165=l9_166;
}
#endif
l9_164=l9_165;
}
#endif
varViewSpaceDepth=-l9_164.z;
}
#endif
vec4 l9_167;
#if (sc_RenderingSpace==3)
{
l9_167=l9_15;
}
#else
{
vec4 l9_168;
#if (sc_RenderingSpace==4)
{
l9_168=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_169;
#if (sc_RenderingSpace==2)
{
l9_169=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_170;
#if (sc_RenderingSpace==1)
{
l9_170=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_170=vec4(0.0);
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
varPackedTex=vec4(l9_26,l9_0);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_171;
#if (sc_RenderingSpace==1)
{
l9_171=sc_ModelMatrix*l9_15;
}
#else
{
l9_171=l9_15;
}
#endif
vec4 l9_172=sc_ProjectorMatrix*l9_171;
varShadowTex=((l9_172.xy/vec2(l9_172.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_173;
#if (sc_DepthBufferMode==1)
{
vec4 l9_174;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_175=l9_167;
l9_175.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_167.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_167.w;
l9_174=l9_175;
}
else
{
l9_174=l9_167;
}
l9_173=l9_174;
}
#else
{
l9_173=l9_167;
}
#endif
vec4 l9_176;
#if (sc_TAAEnabled)
{
vec2 l9_177=l9_173.xy+(sc_TAAJitterOffset*l9_173.w);
l9_176=vec4(l9_177.x,l9_177.y,l9_173.z,l9_173.w);
}
#else
{
l9_176=l9_173;
}
#endif
vec4 l9_178;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_179=l9_176;
l9_179.x=l9_176.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_178=l9_179;
}
#else
{
l9_178=l9_176;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_180=dot(l9_178,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_180);
}
#else
{
varClipDistance=l9_180;
}
#endif
}
#endif
gl_Position=l9_178;
if (PreviewInfo.Saved)
{
PreviewVertexColor=vec4(PreviewInfo.Color.xyz,1.0);
PreviewVertexSaved=1.0;
}
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
struct SurfaceProperties
{
vec3 albedo;
float opacity;
vec3 normal;
vec3 positionWS;
vec3 viewDirWS;
float metallic;
float roughness;
vec3 emissive;
vec3 ao;
vec3 specularAo;
vec3 bakedShadows;
vec3 specColor;
};
struct LightingComponents
{
vec3 directDiffuse;
vec3 directSpecular;
vec3 indirectDiffuse;
vec3 indirectSpecular;
vec3 emitted;
vec3 transmitted;
};
struct LightProperties
{
vec3 direction;
vec3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float N123_fbm;
float N123_TatalHeightRemap;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexTangent_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexBinormal_WorldSpace;
float gFrontFacing;
vec3 SurfacePosition_WorldSpace;
vec2 Surface_UVCoord0;
vec2 gScreenCoord;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 0
#elif sc_EnvmapDiffuseHasSwappedViews==1
#undef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 1
#endif
#ifndef sc_EnvmapDiffuseLayout
#define sc_EnvmapDiffuseLayout 0
#endif
#ifndef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 0
#elif sc_EnvmapSpecularHasSwappedViews==1
#undef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 1
#endif
#ifndef sc_EnvmapSpecularLayout
#define sc_EnvmapSpecularLayout 0
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
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
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
#ifndef sc_SSAOEnabled
#define sc_SSAOEnabled 0
#elif sc_SSAOEnabled==1
#undef sc_SSAOEnabled
#define sc_SSAOEnabled 1
#endif
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
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
#ifndef screenTexHasSwappedViews
#define screenTexHasSwappedViews 0
#elif screenTexHasSwappedViews==1
#undef screenTexHasSwappedViews
#define screenTexHasSwappedViews 1
#endif
#ifndef screenTexLayout
#define screenTexLayout 0
#endif
#ifndef distortionTexHasSwappedViews
#define distortionTexHasSwappedViews 0
#elif distortionTexHasSwappedViews==1
#undef distortionTexHasSwappedViews
#define distortionTexHasSwappedViews 1
#endif
#ifndef distortionTexLayout
#define distortionTexLayout 0
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
#ifndef oceanNormalHasSwappedViews
#define oceanNormalHasSwappedViews 0
#elif oceanNormalHasSwappedViews==1
#undef oceanNormalHasSwappedViews
#define oceanNormalHasSwappedViews 1
#endif
#ifndef oceanNormalLayout
#define oceanNormalLayout 0
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
#ifndef bodyDepthTexHasSwappedViews
#define bodyDepthTexHasSwappedViews 0
#elif bodyDepthTexHasSwappedViews==1
#undef bodyDepthTexHasSwappedViews
#define bodyDepthTexHasSwappedViews 1
#endif
#ifndef bodyDepthTexLayout
#define bodyDepthTexLayout 0
#endif
#ifndef sc_EnvLightMode
#define sc_EnvLightMode 0
#endif
#ifndef sc_AmbientLightMode_EnvironmentMap
#define sc_AmbientLightMode_EnvironmentMap 0
#endif
#ifndef sc_AmbientLightMode_FromCamera
#define sc_AmbientLightMode_FromCamera 0
#endif
#ifndef sc_LightEstimation
#define sc_LightEstimation 0
#elif sc_LightEstimation==1
#undef sc_LightEstimation
#define sc_LightEstimation 1
#endif
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
#ifndef sc_LightEstimationSGCount
#define sc_LightEstimationSGCount 0
#endif
#ifndef sc_MaxTextureImageUnits
#define sc_MaxTextureImageUnits 0
#endif
#ifndef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 0
#elif sc_HasDiffuseEnvmap==1
#undef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 1
#endif
#ifndef sc_AmbientLightMode_SphericalHarmonics
#define sc_AmbientLightMode_SphericalHarmonics 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
#ifndef sc_AmbientLightMode0
#define sc_AmbientLightMode0 0
#endif
#ifndef sc_AmbientLightMode_Constant
#define sc_AmbientLightMode_Constant 0
#endif
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
#ifndef sc_AmbientLightMode1
#define sc_AmbientLightMode1 0
#endif
#ifndef sc_AmbientLightMode2
#define sc_AmbientLightMode2 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
struct sc_PointLight_t
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
vec3 direction;
vec3 position;
vec4 color;
};
struct ssPreviewInfo
{
vec4 Color;
bool Saved;
};
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
#ifndef SC_USE_UV_TRANSFORM_distortionTex
#define SC_USE_UV_TRANSFORM_distortionTex 0
#elif SC_USE_UV_TRANSFORM_distortionTex==1
#undef SC_USE_UV_TRANSFORM_distortionTex
#define SC_USE_UV_TRANSFORM_distortionTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_distortionTex
#define SC_SOFTWARE_WRAP_MODE_U_distortionTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_distortionTex
#define SC_SOFTWARE_WRAP_MODE_V_distortionTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_distortionTex
#define SC_USE_UV_MIN_MAX_distortionTex 0
#elif SC_USE_UV_MIN_MAX_distortionTex==1
#undef SC_USE_UV_MIN_MAX_distortionTex
#define SC_USE_UV_MIN_MAX_distortionTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_distortionTex
#define SC_USE_CLAMP_TO_BORDER_distortionTex 0
#elif SC_USE_CLAMP_TO_BORDER_distortionTex==1
#undef SC_USE_CLAMP_TO_BORDER_distortionTex
#define SC_USE_CLAMP_TO_BORDER_distortionTex 1
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
#ifndef SC_USE_UV_TRANSFORM_oceanNormal
#define SC_USE_UV_TRANSFORM_oceanNormal 0
#elif SC_USE_UV_TRANSFORM_oceanNormal==1
#undef SC_USE_UV_TRANSFORM_oceanNormal
#define SC_USE_UV_TRANSFORM_oceanNormal 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_oceanNormal
#define SC_SOFTWARE_WRAP_MODE_U_oceanNormal -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_oceanNormal
#define SC_SOFTWARE_WRAP_MODE_V_oceanNormal -1
#endif
#ifndef SC_USE_UV_MIN_MAX_oceanNormal
#define SC_USE_UV_MIN_MAX_oceanNormal 0
#elif SC_USE_UV_MIN_MAX_oceanNormal==1
#undef SC_USE_UV_MIN_MAX_oceanNormal
#define SC_USE_UV_MIN_MAX_oceanNormal 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_oceanNormal
#define SC_USE_CLAMP_TO_BORDER_oceanNormal 0
#elif SC_USE_CLAMP_TO_BORDER_oceanNormal==1
#undef SC_USE_CLAMP_TO_BORDER_oceanNormal
#define SC_USE_CLAMP_TO_BORDER_oceanNormal 1
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
#ifndef SC_USE_UV_TRANSFORM_bodyDepthTex
#define SC_USE_UV_TRANSFORM_bodyDepthTex 0
#elif SC_USE_UV_TRANSFORM_bodyDepthTex==1
#undef SC_USE_UV_TRANSFORM_bodyDepthTex
#define SC_USE_UV_TRANSFORM_bodyDepthTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex
#define SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex
#define SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_bodyDepthTex
#define SC_USE_UV_MIN_MAX_bodyDepthTex 0
#elif SC_USE_UV_MIN_MAX_bodyDepthTex==1
#undef SC_USE_UV_MIN_MAX_bodyDepthTex
#define SC_USE_UV_MIN_MAX_bodyDepthTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_bodyDepthTex
#define SC_USE_CLAMP_TO_BORDER_bodyDepthTex 0
#elif SC_USE_CLAMP_TO_BORDER_bodyDepthTex==1
#undef SC_USE_CLAMP_TO_BORDER_bodyDepthTex
#define SC_USE_CLAMP_TO_BORDER_bodyDepthTex 1
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
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec3 sc_EnvmapRotation;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapDiffuseSize;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
uniform float bodyIntersection;
uniform vec3 oceanMin;
uniform vec3 oceanMax;
uniform float speed;
uniform float enableFoam;
uniform float fbmScale;
uniform float enableInfinite;
uniform float distortionScale;
uniform float distortionIntensity;
uniform float enableFluid;
uniform vec2 pressureRange;
uniform float fluidMul;
uniform vec2 unpackVal;
uniform vec4 colorTrough;
uniform vec4 colorMiddle;
uniform vec4 colorCrest;
uniform int PreviewEnabled;
uniform int PreviewNodeID;
uniform mat3 screenTexTransform;
uniform vec4 screenTexUvMinMax;
uniform vec4 screenTexBorderColor;
uniform mat3 distortionTexTransform;
uniform vec4 distortionTexUvMinMax;
uniform vec4 distortionTexBorderColor;
uniform mat3 oceanHeightmapTransform;
uniform vec4 oceanHeightmapUvMinMax;
uniform vec4 oceanHeightmapBorderColor;
uniform mat3 oceanNormalTransform;
uniform vec4 oceanNormalUvMinMax;
uniform vec4 oceanNormalBorderColor;
uniform mat3 fluidPressureTransform;
uniform vec4 fluidPressureUvMinMax;
uniform vec4 fluidPressureBorderColor;
uniform float Port_Position1_N030;
uniform float Port_Position2_N030;
uniform float Port_Position3_N030;
uniform float Port_Position4_N030;
uniform sc_Camera_t sc_Camera;
uniform vec4 sc_Time;
uniform float Port_Opacity_N013;
uniform vec3 Port_Emissive_N013;
uniform float Port_Metallic_N013;
uniform float Port_Roughness_N013;
uniform vec3 Port_AO_N013;
uniform vec3 Port_SpecularAO_N013;
uniform mat3 bodyDepthTexTransform;
uniform vec4 bodyDepthTexUvMinMax;
uniform vec4 bodyDepthTexBorderColor;
uniform vec4 bodyDepthTexProjectionMatrixTerms;
uniform sampler2D distortionTex;
uniform sampler2D screenTex;
uniform sampler2D oceanHeightmap;
uniform sampler2D fluidPressure;
uniform sampler2D oceanNormal;
uniform sampler2D sc_SSAOTexture;
uniform sampler2D sc_ShadowTexture;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2D sc_EnvmapDiffuse;
uniform sampler2D sc_ScreenTexture;
uniform sampler2D bodyDepthTex;
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
varying vec3 varPos;
varying vec4 varTangent;
varying vec3 varNormal;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
ssPreviewInfo PreviewInfo;
ssGlobals tempGlobals;
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
void Node30_Gradient(float Ratio,vec4 Value0,float Position1,vec4 Value1,float Position2,vec4 Value2,float Position3,vec4 Value3,float Position4,vec4 Value4,vec4 Value5,out vec4 Value,ssGlobals Globals)
{
Ratio=clamp(Ratio,0.0,1.0);
if (Ratio<Position1)
{
Value=mix(Value0,Value1,vec4(clamp(Ratio/Position1,0.0,1.0)));
}
else
{
if (Ratio<Position2)
{
Value=mix(Value1,Value2,vec4(clamp((Ratio-Position1)/(Position2-Position1),0.0,1.0)));
}
else
{
if (Ratio<Position3)
{
Value=mix(Value2,Value3,vec4(clamp((Ratio-Position2)/(Position3-Position2),0.0,1.0)));
}
else
{
if (Ratio<Position4)
{
Value=mix(Value3,Value4,vec4(clamp((Ratio-Position3)/(Position4-Position3),0.0,1.0)));
}
else
{
Value=mix(Value4,Value5,vec4(clamp((Ratio-Position4)/(1.0-Position4),0.0,1.0)));
}
}
}
}
bool l9_0=PreviewEnabled==1;
bool l9_1;
if (l9_0)
{
l9_1=!PreviewInfo.Saved;
}
else
{
l9_1=l9_0;
}
if (l9_1&&(30==PreviewNodeID))
{
PreviewInfo.Saved=true;
PreviewInfo.Color=Value;
}
}
vec4 N123_GradientInput_evaluate()
{
float l9_0=tempGlobals.N123_TatalHeightRemap;
float l9_1=tempGlobals.N123_fbm;
vec4 l9_2=mix(colorMiddle,colorCrest,vec4(l9_1));
ssGlobals l9_3=tempGlobals;
vec4 param_11;
Node30_Gradient(l9_0,colorTrough,Port_Position1_N030,colorTrough,Port_Position2_N030,colorTrough,Port_Position3_N030,colorMiddle,Port_Position4_N030,l9_2,l9_2,param_11,l9_3);
return param_11;
}
int distortionTexGetStereoViewIndex()
{
int l9_0;
#if (distortionTexHasSwappedViews)
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
vec4 N123_DistortionTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_distortionTex)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_distortionTex)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,distortionTexUvMinMax.x,distortionTexUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,distortionTexUvMinMax.y,distortionTexUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_distortionTex)!=0),distortionTexTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),distortionTexLayout,distortionTexGetStereoViewIndex());
vec4 l9_22=texture2D(distortionTex,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_23=mix(distortionTexBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
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
vec4 N123_ScreenTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenTex)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_screenTex)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,screenTexUvMinMax.x,screenTexUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_screenTex)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,screenTexUvMinMax.y,screenTexUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_screenTex)!=0),screenTexTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenTex,SC_SOFTWARE_WRAP_MODE_V_screenTex).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),screenTexLayout,screenTexGetStereoViewIndex());
vec4 l9_22=texture2D(screenTex,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_screenTex)
{
l9_23=mix(screenTexBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
int oceanHeightmapGetStereoViewIndex()
{
int l9_0;
#if (oceanHeightmapHasSwappedViews)
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
vec4 N123_WaveHeightTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanHeightmap)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_oceanHeightmap)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,oceanHeightmapUvMinMax.x,oceanHeightmapUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,oceanHeightmapUvMinMax.y,oceanHeightmapUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_oceanHeightmap)!=0),oceanHeightmapTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),oceanHeightmapLayout,oceanHeightmapGetStereoViewIndex());
vec4 l9_22=texture2D(oceanHeightmap,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_23=mix(oceanHeightmapBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))/vec2(255.0);
}
return dot(rg,vec2(1.0,0.0039215689));
}
int fluidPressureGetStereoViewIndex()
{
int l9_0;
#if (fluidPressureHasSwappedViews)
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
vec4 N123_Fluid2dPressureTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0)&&(!(int(SC_USE_UV_MIN_MAX_fluidPressure)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_fluidPressure)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,fluidPressureUvMinMax.x,fluidPressureUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,fluidPressureUvMinMax.y,fluidPressureUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_fluidPressure)!=0),fluidPressureTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),fluidPressureLayout,fluidPressureGetStereoViewIndex());
vec4 l9_22=texture2D(fluidPressure,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_23=mix(fluidPressureBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
int oceanNormalGetStereoViewIndex()
{
int l9_0;
#if (oceanNormalHasSwappedViews)
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
vec4 N123_WaveNormalTex_sample(vec2 coords)
{
bool l9_0=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanNormal)!=0));
float l9_1=coords.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x);
float l9_2=l9_1;
float l9_3=coords.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_oceanNormal)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,oceanNormalUvMinMax.x,oceanNormalUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,oceanNormalUvMinMax.y,oceanNormalUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_oceanNormal)!=0),oceanNormalTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x,l9_0,l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y,l9_0,l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),oceanNormalLayout,oceanNormalGetStereoViewIndex());
vec4 l9_22=texture2D(oceanNormal,l9_21.xy,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_23=mix(oceanNormalBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
return l9_23;
}
float N123_noise(vec2 p)
{
vec2 l9_0=floor(p);
vec2 l9_1=fract(p);
vec2 l9_2=(l9_1*l9_1)*(vec2(3.0)-(l9_1*2.0));
float l9_3=l9_2.x;
float l9_4=mix(mix(fract(sin(dot(l9_0,vec2(12.9898,4.1413999)))*43758.547),fract(sin(dot(l9_0+vec2(1.0,0.0),vec2(12.9898,4.1413999)))*43758.547),l9_3),mix(fract(sin(dot(l9_0+vec2(0.0,1.0),vec2(12.9898,4.1413999)))*43758.547),fract(sin(dot(l9_0+vec2(1.0),vec2(12.9898,4.1413999)))*43758.547),l9_3),l9_2.y);
return l9_4*l9_4;
}
float N123_fbmNoise(vec2 p,float time)
{
p=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*p)*2.02;
p=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*p)*2.01;
p=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*p)*2.03;
p=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*p)*2.01;
p=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*p)*2.04;
return ((((((0.0+(0.5*N123_noise(p+vec2(time))))+(0.03125*N123_noise(p)))+(0.25*N123_noise(p)))+(0.125*N123_noise(p)))+(0.0625*N123_noise(p)))+(0.015625*N123_noise(p+vec2(sin(time)))))/0.96875;
}
float ssPow(float A,float B)
{
float l9_0;
if (A<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A,B);
}
return l9_0;
}
float N123_rim(vec3 nor,float Exponent,float Intensity)
{
return max(ssPow(1.0-abs(dot(-tempGlobals.ViewDirWS,mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,tempGlobals.VertexNormal_WorldSpace)*nor)),Exponent),0.0)*Intensity;
}
vec3 N123_system_getDirectionalLightDirection(int index)
{
vec3 l9_0;
if (index<sc_DirectionalLightsCount)
{
l9_0=-sc_DirectionalLights[index].direction;
}
else
{
l9_0=vec3(0.0);
}
return l9_0;
}
vec3 ssSRGB_to_Linear(vec3 value)
{
vec3 l9_0;
#if (SC_DEVICE_CLASS>=2)
{
l9_0=vec3(pow(value.x,2.2),pow(value.y,2.2),pow(value.z,2.2));
}
#else
{
l9_0=value*value;
}
#endif
return l9_0;
}
vec3 evaluateSSAO(vec3 positionWS)
{
#if (sc_SSAOEnabled)
{
vec4 l9_0=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(positionWS,1.0);
return vec3(texture2D(sc_SSAOTexture,((l9_0.xyz/vec3(l9_0.w)).xy*0.5)+vec2(0.5)).x);
}
#else
{
return vec3(1.0);
}
#endif
}
vec3 fresnelSchlickSub(float cosTheta,vec3 F0,vec3 fresnelMax)
{
float l9_0=1.0-cosTheta;
float l9_1=l9_0*l9_0;
return F0+((fresnelMax-F0)*((l9_1*l9_1)*l9_0));
}
float Dggx(float NdotH,float roughness)
{
float l9_0=roughness*roughness;
float l9_1=l9_0*l9_0;
float l9_2=((NdotH*NdotH)*(l9_1-1.0))+1.0;
return l9_1/((l9_2*l9_2)+9.9999999e-09);
}
vec3 calculateDirectSpecular(SurfaceProperties surfaceProperties,vec3 L,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=max(l9_0,0.029999999);
vec3 l9_2=surfaceProperties.specColor;
vec3 l9_3=surfaceProperties.normal;
vec3 l9_4=L;
vec3 l9_5=V;
vec3 l9_6=normalize(l9_4+l9_5);
vec3 l9_7=L;
float l9_8=clamp(dot(l9_3,l9_7),0.0,1.0);
vec3 l9_9=V;
float l9_10=clamp(dot(l9_3,l9_6),0.0,1.0);
vec3 l9_11=V;
float l9_12=clamp(dot(l9_11,l9_6),0.0,1.0);
#if (SC_DEVICE_CLASS>=2)
{
float l9_13=l9_1+1.0;
float l9_14=(l9_13*l9_13)*0.125;
float l9_15=1.0-l9_14;
return fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*(((Dggx(l9_10,l9_1)*(1.0/(((l9_8*l9_15)+l9_14)*((clamp(dot(l9_3,l9_9),0.0,1.0)*l9_15)+l9_14))))*0.25)*l9_8);
}
#else
{
float l9_16=exp2(11.0-(10.0*l9_1));
return ((fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*((l9_16*0.125)+0.25))*pow(l9_10,l9_16))*l9_8;
}
#endif
}
LightingComponents accumulateLight(LightingComponents lighting,LightProperties light,SurfaceProperties surfaceProperties,vec3 V)
{
lighting.directDiffuse+=((vec3(clamp(dot(surfaceProperties.normal,light.direction),0.0,1.0))*light.color)*light.attenuation);
lighting.directSpecular+=((calculateDirectSpecular(surfaceProperties,light.direction,V)*light.color)*light.attenuation);
return lighting;
}
float computeDistanceAttenuation(float distanceToLight,float falloffEndDistance)
{
float l9_0=distanceToLight;
float l9_1=distanceToLight;
float l9_2=l9_0*l9_1;
if (falloffEndDistance==0.0)
{
return 1.0/l9_2;
}
return max(min(1.0-((l9_2*l9_2)/pow(falloffEndDistance,4.0)),1.0),0.0)/l9_2;
}
vec2 calcPanoramicTexCoordsFromDir(vec3 reflDir,float rotationDegrees)
{
float l9_0=-reflDir.z;
vec2 l9_1=vec2((((reflDir.x<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_0/length(vec2(reflDir.x,l9_0)),-1.0,1.0)))-1.5707964,acos(reflDir.y))/vec2(6.2831855,3.1415927);
float l9_2=l9_1.x+(rotationDegrees/360.0);
vec2 l9_3=vec2(l9_2,1.0-l9_1.y);
l9_3.x=fract((l9_2+floor(l9_2))+1.0);
return l9_3;
}
int sc_EnvmapSpecularGetStereoViewIndex()
{
int l9_0;
#if (sc_EnvmapSpecularHasSwappedViews)
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
vec4 sc_EnvmapSpecularSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
return texture2D(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,bias);
}
vec2 calcSeamlessPanoramicUvsForSampling(vec2 uv,vec2 topMipRes,float lod)
{
#if (SC_DEVICE_CLASS>=2)
{
vec2 l9_0=max(vec2(1.0),topMipRes/vec2(exp2(lod)));
return ((uv*(l9_0-vec2(1.0)))/l9_0)+(vec2(0.5)/l9_0);
}
#else
{
return uv;
}
#endif
}
vec3 getSpecularDominantDir(vec3 N,vec3 R,float roughness)
{
#if (SC_DEVICE_CLASS>=2)
{
return normalize(mix(R,N,vec3((roughness*roughness)*roughness)));
}
#else
{
return R;
}
#endif
}
vec4 sc_EnvmapSpecularSampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
return texture2DLod(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,level_);
}
vec3 envBRDFApprox(SurfaceProperties surfaceProperties,float NdotV)
{
#if (SC_DEVICE_CLASS>=2)
{
vec4 l9_0=(vec4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+vec4(1.0,0.0425,1.04,-0.039999999);
float l9_1=l9_0.x;
vec2 l9_2=(vec2(-1.04,1.04)*((min(l9_1*l9_1,exp2((-9.2799997)*NdotV))*l9_1)+l9_0.y))+l9_0.zw;
return max((surfaceProperties.specColor*l9_2.x)+vec3(l9_2.y),vec3(0.0));
}
#else
{
return fresnelSchlickSub(NdotV,surfaceProperties.specColor,max(vec3(1.0-surfaceProperties.roughness),surfaceProperties.specColor));
}
#endif
}
int sc_ScreenTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_ScreenTextureHasSwappedViews)
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
vec4 sc_ScreenTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
return texture2D(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,viewIndex).xy,bias);
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
vec4 sc_readFragData0()
{
vec4 l9_0=sc_readFragData0_Platform();
vec4 l9_1;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_framebufferFetchMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
vec4 sc_GetFramebufferColor()
{
vec4 l9_0;
#if (sc_FramebufferFetch)
{
l9_0=sc_readFragData0();
}
#else
{
l9_0=sc_ScreenTextureSampleViewIndexBias(sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw),sc_ScreenTextureGetStereoViewIndex(),0.0);
}
#endif
vec4 l9_1;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
float srgbToLinear(float x)
{
#if (SC_DEVICE_CLASS>=2)
{
return pow(x,2.2);
}
#else
{
return x*x;
}
#endif
}
float linearToSrgb(float x)
{
#if (SC_DEVICE_CLASS>=2)
{
return pow(x,0.45454547);
}
#else
{
return sqrt(x);
}
#endif
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
PreviewInfo.Color=PreviewVertexColor;
PreviewInfo.Saved=((PreviewVertexSaved*1.0)!=0.0) ? true : false;
vec3 l9_0=normalize(varTangent.xyz);
vec3 l9_1=normalize(varNormal);
vec3 l9_2=cross(l9_1,l9_0)*varTangent.w;
float l9_3=float(gl_FrontFacing);
vec2 l9_4=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_5=sc_ScreenCoordsGlobalToView(l9_4);
vec3 l9_6=normalize(sc_Camera.position-varPos);
ssGlobals l9_7=ssGlobals(sc_Time.x,sc_Time.y,0.0,0.0,0.0,vec3(0.0),l9_6,varPos,l9_0,l9_1,l9_2,l9_3,varPos,varPackedTex.xy,l9_5);
vec4 l9_8;
if ((l9_3*1.0)!=0.0)
{
tempGlobals=l9_7;
vec4 l9_9=N123_GradientInput_evaluate();
vec2 l9_10=tempGlobals.Surface_UVCoord0;
vec3 l9_11=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_12=(((N123_DistortionTex_sample(l9_10*distortionScale).xy-vec2(1.0))*distortionIntensity)+tempGlobals.gScreenCoord)+vec2(0.30000001);
vec4 l9_13=N123_ScreenTex_sample(vec2(l9_12.x-0.15000001,1.0-l9_12.y)*0.89999998);
vec4 l9_14=N123_ScreenTex_sample(((l9_12-vec2(0.1))*0.5)+vec2(0.1));
vec2 l9_15;
if (enableInfinite==1.0)
{
vec2 l9_16=vec2(oceanMin.xz);
vec2 l9_17=vec2(0.0)+(((sc_Camera.position.xz-l9_16)*1.0)/((vec2(oceanMax.xz)-l9_16)+vec2(1e-06)));
vec2 l9_18=l9_17;
l9_18.y=1.0-l9_17.y;
l9_15=(l9_10+l9_18)-vec2(0.5);
}
else
{
l9_15=l9_10;
}
float l9_19=unpackVal.y-unpackVal.x;
float l9_20=0.99998999-0.0;
float l9_21=l9_19+1e-06;
tempGlobals.N123_TatalHeightRemap=0.0+((((unpackVal.x+(((DecodeFloat16(N123_WaveHeightTex_sample(l9_15).xy,true)-0.0)*l9_19)/l9_20))-unpackVal.x)*1.0)/l9_21);
if (enableFluid==1.0)
{
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp((pressureRange.x+(((DecodeFloat16(N123_Fluid2dPressureTex_sample(l9_10).xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_20))*fluidMul,unpackVal.x,unpackVal.y)-unpackVal.x)*1.0)/l9_21))*0.60000002);
}
float l9_22=tempGlobals.N123_TatalHeightRemap;
vec4 l9_23=N123_WaveNormalTex_sample(l9_15);
vec3 l9_24=(l9_23.xyz*1.9921875)-vec3(1.0);
tempGlobals.N123_fbm=1.0;
if (enableFoam==1.0)
{
tempGlobals.N123_fbm=1.0-N123_fbmNoise((vec3(0.0,0.0,0.0)+l9_11).zx*fbmScale,tempGlobals.gTimeElapsed*speed);
}
float l9_25=N123_rim(l9_24,6.0,4.0);
vec4 l9_26=N123_GradientInput_evaluate();
vec4 l9_27;
if (sc_DirectionalLightsCount>0)
{
vec4 l9_28;
l9_28=vec4(0.0);
int l9_29;
float l9_30;
float l9_31;
int l9_32=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_32<sc_DirectionalLightsCount)
{
l9_28=mix(mix(l9_26,l9_14,vec4(clamp(ssPow((dot(l9_24,N123_system_getDirectionalLightDirection(l9_32))*0.60000002)+0.40000001,10.0),0.0,1.0))),l9_26*l9_13,vec4(max(clamp(l9_25,0.0,1.0),clamp(smoothstep(0.44999999,0.60000002,l9_22),0.0,1.0))*0.89999998));
l9_32++;
continue;
}
else
{
break;
}
}
l9_27=l9_28;
}
else
{
l9_27=vec4(0.0);
}
l9_8=l9_27;
}
else
{
tempGlobals=l9_7;
vec4 l9_33=N123_GradientInput_evaluate();
vec2 l9_34=tempGlobals.Surface_UVCoord0;
vec3 l9_35=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_36=(((N123_DistortionTex_sample(l9_34*distortionScale).xy-vec2(1.0))*distortionIntensity)+tempGlobals.gScreenCoord)+vec2(0.30000001);
vec4 l9_37=N123_ScreenTex_sample(vec2(l9_36.x-0.15000001,1.0-l9_36.y)*0.89999998);
vec2 l9_38;
if (enableInfinite==1.0)
{
vec2 l9_39=vec2(oceanMin.xz);
vec2 l9_40=vec2(0.0)+(((sc_Camera.position.xz-l9_39)*1.0)/((vec2(oceanMax.xz)-l9_39)+vec2(1e-06)));
vec2 l9_41=l9_40;
l9_41.y=1.0-l9_40.y;
l9_38=(l9_34+l9_41)-vec2(0.5);
}
else
{
l9_38=l9_34;
}
float l9_42=unpackVal.y-unpackVal.x;
float l9_43=0.99998999-0.0;
float l9_44=l9_42+1e-06;
tempGlobals.N123_TatalHeightRemap=0.0+((((unpackVal.x+(((DecodeFloat16(N123_WaveHeightTex_sample(l9_38).xy,true)-0.0)*l9_42)/l9_43))-unpackVal.x)*1.0)/l9_44);
if (enableFluid==1.0)
{
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp((pressureRange.x+(((DecodeFloat16(N123_Fluid2dPressureTex_sample(l9_34).xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_43))*fluidMul,unpackVal.x,unpackVal.y)-unpackVal.x)*1.0)/l9_44))*0.60000002);
}
vec4 l9_45=N123_WaveNormalTex_sample(l9_38);
vec3 l9_46=(l9_45.xyz*1.9921875)-vec3(1.0);
tempGlobals.N123_fbm=1.0;
if (enableFoam==1.0)
{
tempGlobals.N123_fbm=1.0-N123_fbmNoise((vec3(0.0,0.0,0.0)+l9_35).zx*fbmScale,tempGlobals.gTimeElapsed*speed);
}
vec4 l9_47=N123_GradientInput_evaluate();
vec4 l9_48;
if (sc_DirectionalLightsCount>0)
{
vec4 l9_49;
l9_49=vec4(0.0);
int l9_50;
float l9_51;
float l9_52;
int l9_53=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_53<sc_DirectionalLightsCount)
{
l9_49=l9_37;
l9_53++;
continue;
}
else
{
break;
}
}
l9_48=l9_49;
}
else
{
l9_48=vec4(0.0);
}
l9_8=l9_48;
}
tempGlobals=l9_7;
vec4 l9_54=N123_GradientInput_evaluate();
vec2 l9_55=tempGlobals.Surface_UVCoord0;
vec3 l9_56=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_57=(((N123_DistortionTex_sample(l9_55*distortionScale).xy-vec2(1.0))*distortionIntensity)+tempGlobals.gScreenCoord)+vec2(0.30000001);
vec2 l9_58;
if (enableInfinite==1.0)
{
vec2 l9_59=vec2(oceanMin.xz);
vec2 l9_60=vec2(0.0)+(((sc_Camera.position.xz-l9_59)*1.0)/((vec2(oceanMax.xz)-l9_59)+vec2(1e-06)));
vec2 l9_61=l9_60;
l9_61.y=1.0-l9_60.y;
l9_58=(l9_55+l9_61)-vec2(0.5);
}
else
{
l9_58=l9_55;
}
float l9_62=unpackVal.y-unpackVal.x;
float l9_63=0.99998999-0.0;
float l9_64=l9_62+1e-06;
tempGlobals.N123_TatalHeightRemap=0.0+((((unpackVal.x+(((DecodeFloat16(N123_WaveHeightTex_sample(l9_58).xy,true)-0.0)*l9_62)/l9_63))-unpackVal.x)*1.0)/l9_64);
if (enableFluid==1.0)
{
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp((pressureRange.x+(((DecodeFloat16(N123_Fluid2dPressureTex_sample(l9_55).xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_63))*fluidMul,unpackVal.x,unpackVal.y)-unpackVal.x)*1.0)/l9_64))*0.60000002);
}
vec4 l9_65=N123_WaveNormalTex_sample(l9_58);
vec3 l9_66=(l9_65.xyz*1.9921875)-vec3(1.0);
tempGlobals.N123_fbm=1.0;
if (enableFoam==1.0)
{
tempGlobals.N123_fbm=1.0-N123_fbmNoise((vec3(0.0,0.0,0.0)+l9_56).zx*fbmScale,tempGlobals.gTimeElapsed*speed);
}
vec4 l9_67=N123_GradientInput_evaluate();
if (sc_DirectionalLightsCount>0)
{
int l9_68;
float l9_69;
float l9_70;
int l9_71=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_71<sc_DirectionalLightsCount)
{
l9_71++;
continue;
}
else
{
break;
}
}
}
vec3 l9_72;
#if (!sc_ProjectiveShadowsCaster)
{
l9_72=mat3(l9_0,l9_2,l9_1)*l9_66;
}
#else
{
l9_72=vec3(0.0);
}
#endif
#if (sc_BlendMode_AlphaTest)
{
if (Port_Opacity_N013<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (Port_Opacity_N013<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec3 l9_73=max(l9_8.xyz,vec3(0.0));
vec4 l9_74;
#if (sc_ProjectiveShadowsCaster)
{
l9_74=vec4(l9_73,Port_Opacity_N013);
}
#else
{
vec3 l9_75=ssSRGB_to_Linear(l9_73);
vec3 l9_76=normalize(l9_72);
vec3 l9_77=ssSRGB_to_Linear(Port_Emissive_N013);
vec3 l9_78;
#if (sc_SSAOEnabled)
{
l9_78=evaluateSSAO(varPos);
}
#else
{
l9_78=Port_AO_N013;
}
#endif
vec3 l9_79=vec3(Port_Metallic_N013);
vec3 l9_80=mix(vec3(0.039999999),l9_75*Port_Metallic_N013,l9_79);
vec3 l9_81=mix(l9_75*(1.0-Port_Metallic_N013),vec3(0.0),l9_79);
SurfaceProperties l9_82=SurfaceProperties(l9_81,Port_Opacity_N013,l9_76,varPos,l9_6,Port_Metallic_N013,Port_Roughness_N013,l9_77,l9_78,Port_SpecularAO_N013,vec3(1.0),l9_80);
vec4 l9_83=vec4(1.0);
vec3 l9_84;
vec3 l9_85;
vec3 l9_86;
vec3 l9_87;
int l9_88;
vec3 l9_89;
vec3 l9_90;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_91;
vec3 l9_92;
vec3 l9_93;
vec3 l9_94;
int l9_95;
vec3 l9_96;
vec3 l9_97;
l9_97=vec3(1.0);
l9_96=vec3(0.0);
l9_95=0;
l9_94=vec3(0.0);
l9_93=vec3(0.0);
l9_92=vec3(0.0);
l9_91=vec3(0.0);
LightingComponents l9_98;
LightProperties l9_99;
SurfaceProperties l9_100;
vec3 l9_101;
int l9_102=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_102<sc_DirectionalLightsCount)
{
LightingComponents l9_103=accumulateLight(LightingComponents(l9_91,l9_92,l9_97,l9_96,l9_94,l9_93),LightProperties(sc_DirectionalLights[l9_102].direction,sc_DirectionalLights[l9_102].color.xyz,sc_DirectionalLights[l9_102].color.w*l9_83[(l9_95<3) ? l9_95 : 3]),l9_82,l9_6);
l9_97=l9_103.indirectDiffuse;
l9_96=l9_103.indirectSpecular;
l9_95++;
l9_94=l9_103.emitted;
l9_93=l9_103.transmitted;
l9_92=l9_103.directSpecular;
l9_91=l9_103.directDiffuse;
l9_102++;
continue;
}
else
{
break;
}
}
l9_90=l9_97;
l9_89=l9_96;
l9_88=l9_95;
l9_87=l9_94;
l9_86=l9_93;
l9_85=l9_92;
l9_84=l9_91;
}
#else
{
l9_90=vec3(1.0);
l9_89=vec3(0.0);
l9_88=0;
l9_87=vec3(0.0);
l9_86=vec3(0.0);
l9_85=vec3(0.0);
l9_84=vec3(0.0);
}
#endif
vec3 l9_104;
vec3 l9_105;
vec3 l9_106;
#if (sc_PointLightsCount>0)
{
vec3 l9_107;
vec3 l9_108;
vec3 l9_109;
vec3 l9_110;
vec3 l9_111;
vec3 l9_112;
l9_112=l9_90;
l9_111=l9_89;
l9_110=l9_87;
l9_109=l9_86;
l9_108=l9_85;
l9_107=l9_84;
int l9_113;
vec3 l9_114;
vec3 l9_115;
vec3 l9_116;
vec3 l9_117;
vec3 l9_118;
vec3 l9_119;
int l9_120=0;
int l9_121=l9_88;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_120<sc_PointLightsCount)
{
vec3 l9_122=sc_PointLights[l9_120].position-varPos;
vec3 l9_123=normalize(l9_122);
float l9_124=l9_83[(l9_121<3) ? l9_121 : 3];
float l9_125=clamp((dot(l9_123,sc_PointLights[l9_120].direction)*sc_PointLights[l9_120].angleScale)+sc_PointLights[l9_120].angleOffset,0.0,1.0);
float l9_126=(sc_PointLights[l9_120].color.w*l9_124)*(l9_125*l9_125);
float l9_127;
if (sc_PointLights[l9_120].falloffEnabled)
{
l9_127=l9_126*computeDistanceAttenuation(length(l9_122),sc_PointLights[l9_120].falloffEndDistance);
}
else
{
l9_127=l9_126;
}
l9_113=l9_121+1;
LightingComponents l9_128=accumulateLight(LightingComponents(l9_107,l9_108,l9_112,l9_111,l9_110,l9_109),LightProperties(l9_123,sc_PointLights[l9_120].color.xyz,l9_127),l9_82,l9_6);
l9_114=l9_128.directDiffuse;
l9_115=l9_128.directSpecular;
l9_116=l9_128.indirectDiffuse;
l9_117=l9_128.indirectSpecular;
l9_118=l9_128.emitted;
l9_119=l9_128.transmitted;
l9_112=l9_116;
l9_111=l9_117;
l9_121=l9_113;
l9_110=l9_118;
l9_109=l9_119;
l9_108=l9_115;
l9_107=l9_114;
l9_120++;
continue;
}
else
{
break;
}
}
l9_106=l9_109;
l9_105=l9_108;
l9_104=l9_107;
}
#else
{
l9_106=l9_86;
l9_105=l9_85;
l9_104=l9_84;
}
#endif
vec3 l9_129;
vec3 l9_130;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_131;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_132=abs(varShadowTex-vec2(0.5));
vec4 l9_133=texture2D(sc_ShadowTexture,varShadowTex)*step(max(l9_132.x,l9_132.y),0.5);
l9_131=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_133.xyz,vec3(sc_ShadowColor.w)),vec3(l9_133.w*sc_ShadowDensity));
}
#else
{
l9_131=vec3(1.0);
}
#endif
l9_130=l9_104*l9_131;
l9_129=l9_105*l9_131;
}
#else
{
l9_130=l9_104;
l9_129=l9_105;
}
#endif
vec3 l9_134;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec2 l9_135=calcPanoramicTexCoordsFromDir(l9_76,sc_EnvmapRotation.y);
vec4 l9_136;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_137;
#if (SC_DEVICE_CLASS>=2)
{
l9_137=calcSeamlessPanoramicUvsForSampling(l9_135,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_137=l9_135;
}
#endif
l9_136=sc_EnvmapSpecularSampleViewIndexBias(l9_137,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#else
{
vec4 l9_138;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
vec2 l9_139=calcSeamlessPanoramicUvsForSampling(l9_135,sc_EnvmapDiffuseSize.xy,0.0);
int l9_140;
#if (sc_EnvmapDiffuseHasSwappedViews)
{
l9_140=1-sc_GetStereoViewIndex();
}
#else
{
l9_140=sc_GetStereoViewIndex();
}
#endif
l9_138=texture2D(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_139,sc_EnvmapDiffuseLayout,l9_140).xy,-13.0);
}
#else
{
l9_138=sc_EnvmapSpecularSampleViewIndexBias(l9_135,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#endif
l9_136=l9_138;
}
#endif
l9_134=(l9_136.xyz*(1.0/l9_136.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_141;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_142=-l9_76;
float l9_143=l9_142.x;
float l9_144=l9_142.y;
float l9_145=l9_142.z;
l9_141=(((((((sc_Sh[8]*0.42904299)*((l9_143*l9_143)-(l9_144*l9_144)))+((sc_Sh[6]*0.74312502)*(l9_145*l9_145)))+(sc_Sh[0]*0.88622701))-(sc_Sh[6]*0.24770799))+((((sc_Sh[4]*(l9_143*l9_144))+(sc_Sh[7]*(l9_143*l9_145)))+(sc_Sh[5]*(l9_144*l9_145)))*0.85808599))+((((sc_Sh[3]*l9_143)+(sc_Sh[1]*l9_144))+(sc_Sh[2]*l9_145))*1.0233279))*sc_ShIntensity;
}
#else
{
l9_141=vec3(0.0);
}
#endif
l9_134=l9_141;
}
#endif
vec3 l9_146;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_147;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_147=l9_134+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_148=l9_134;
l9_148.x=l9_134.x+(1e-06*sc_AmbientLights[0].color.x);
l9_147=l9_148;
}
#endif
l9_146=l9_147;
}
#else
{
l9_146=l9_134;
}
#endif
vec3 l9_149;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_150;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_150=l9_146+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_151=l9_146;
l9_151.x=l9_146.x+(1e-06*sc_AmbientLights[1].color.x);
l9_150=l9_151;
}
#endif
l9_149=l9_150;
}
#else
{
l9_149=l9_146;
}
#endif
vec3 l9_152;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_153;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_153=l9_149+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_154=l9_149;
l9_154.x=l9_149.x+(1e-06*sc_AmbientLights[2].color.x);
l9_153=l9_154;
}
#endif
l9_152=l9_153;
}
#else
{
l9_152=l9_149;
}
#endif
vec3 l9_155;
#if (sc_LightEstimation)
{
vec3 l9_156;
l9_156=sc_LightEstimationData.ambientLight;
vec3 l9_157;
int l9_158=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_158<sc_LightEstimationSGCount)
{
float l9_159=dot(sc_LightEstimationData.sg[l9_158].axis,l9_76);
float l9_160=exp(-sc_LightEstimationData.sg[l9_158].sharpness);
float l9_161=l9_160*l9_160;
float l9_162=1.0/sc_LightEstimationData.sg[l9_158].sharpness;
float l9_163=(1.0+(2.0*l9_161))-l9_162;
float l9_164=sqrt(1.0-l9_163);
float l9_165=0.36000001*l9_159;
float l9_166=(1.0/(4.0*0.36000001))*l9_164;
float l9_167=l9_165+l9_166;
float l9_168;
if (step(abs(l9_165),l9_166)>0.5)
{
l9_168=(l9_167*l9_167)/l9_164;
}
else
{
l9_168=clamp(l9_159,0.0,1.0);
}
l9_157=l9_156+((((sc_LightEstimationData.sg[l9_158].color/vec3(sc_LightEstimationData.sg[l9_158].sharpness))*6.2831855)*((l9_163*l9_168)+(((l9_160-l9_161)*l9_162)-l9_161)))/vec3(3.1415927));
l9_156=l9_157;
l9_158++;
continue;
}
else
{
break;
}
}
l9_155=l9_152+l9_156;
}
#else
{
l9_155=l9_152;
}
#endif
vec3 l9_169;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_170=clamp(pow(Port_Roughness_N013,0.66666669),0.0,1.0)*5.0;
vec2 l9_171=calcPanoramicTexCoordsFromDir(getSpecularDominantDir(l9_76,reflect(-l9_6,l9_76),Port_Roughness_N013),sc_EnvmapRotation.y);
vec4 l9_172;
#if (SC_DEVICE_CLASS>=2)
{
float l9_173=floor(l9_170);
float l9_174=ceil(l9_170);
l9_172=mix(sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_171,sc_EnvmapSpecularSize.xy,l9_173),sc_EnvmapSpecularGetStereoViewIndex(),l9_173),sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_171,sc_EnvmapSpecularSize.xy,l9_174),sc_EnvmapSpecularGetStereoViewIndex(),l9_174),vec4(l9_170-l9_173));
}
#else
{
l9_172=sc_EnvmapSpecularSampleViewIndexLevel(l9_171,sc_EnvmapSpecularGetStereoViewIndex(),l9_170);
}
#endif
l9_169=vec3(0.0)+((((l9_172.xyz*(1.0/l9_172.w))*sc_EnvmapExposure)+vec3(1e-06))*envBRDFApprox(l9_82,abs(dot(l9_76,l9_6))));
}
#else
{
l9_169=vec3(0.0);
}
#endif
vec3 l9_175;
#if (sc_LightEstimation)
{
float l9_176=clamp(Port_Roughness_N013*Port_Roughness_N013,0.0099999998,1.0);
vec3 l9_177;
l9_177=sc_LightEstimationData.ambientLight*l9_80;
int l9_178=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_178<sc_LightEstimationSGCount)
{
float l9_179=l9_176*l9_176;
vec3 l9_180=reflect(-l9_6,l9_76);
float l9_181=dot(l9_76,l9_6);
float l9_182=(2.0/l9_179)/(4.0*max(l9_181,9.9999997e-05));
float l9_183=length((l9_180*l9_182)+(sc_LightEstimationData.sg[l9_178].axis*sc_LightEstimationData.sg[l9_178].sharpness));
float l9_184=clamp(dot(l9_76,l9_180),0.0,1.0);
float l9_185=clamp(l9_181,0.0,1.0);
float l9_186=1.0-l9_179;
l9_177+=((((((((vec3(1.0/(3.1415927*l9_179))*exp((l9_183-l9_182)-sc_LightEstimationData.sg[l9_178].sharpness))*sc_LightEstimationData.sg[l9_178].color)*6.2831855)*(1.0-exp((-2.0)*l9_183)))/vec3(l9_183))*((1.0/(l9_184+sqrt(l9_179+((l9_186*l9_184)*l9_184))))*(1.0/(l9_185+sqrt(l9_179+((l9_186*l9_185)*l9_185))))))*(l9_80+((vec3(1.0)-l9_80)*pow(1.0-clamp(dot(l9_180,normalize(l9_180+l9_6)),0.0,1.0),5.0))))*l9_184);
l9_178++;
continue;
}
else
{
break;
}
}
l9_175=l9_169+l9_177;
}
#else
{
l9_175=l9_169;
}
#endif
float l9_187;
vec3 l9_188;
vec3 l9_189;
vec3 l9_190;
#if (sc_BlendMode_ColoredGlass)
{
l9_190=vec3(0.0);
l9_189=vec3(0.0);
l9_188=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_81,vec3(Port_Opacity_N013));
l9_187=1.0;
}
#else
{
l9_190=l9_130;
l9_189=l9_155;
l9_188=l9_106;
l9_187=Port_Opacity_N013;
}
#endif
bool l9_191;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_191=true;
}
#else
{
l9_191=false;
}
#endif
vec3 l9_192=l9_189*l9_78;
vec3 l9_193=l9_190+l9_192;
vec3 l9_194=l9_81*l9_193;
vec3 l9_195=l9_175*Port_SpecularAO_N013;
vec3 l9_196=l9_129+l9_195;
vec3 l9_197;
if (l9_191)
{
l9_197=l9_194*srgbToLinear(l9_187);
}
else
{
l9_197=l9_194;
}
vec3 l9_198=l9_197+l9_196;
vec3 l9_199=(l9_198+l9_77)+l9_188;
float l9_200=l9_199.x;
vec4 l9_201=vec4(l9_200,l9_199.yz,l9_187);
vec4 l9_202;
#if (sc_IsEditor)
{
vec4 l9_203=l9_201;
l9_203.x=l9_200+((l9_78.x*Port_SpecularAO_N013.x)*9.9999997e-06);
l9_202=l9_203;
}
#else
{
l9_202=l9_201;
}
#endif
vec4 l9_204;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_205=l9_202.xyz*1.8;
vec3 l9_206=(l9_202.xyz*(l9_205+vec3(1.4)))/((l9_202.xyz*(l9_205+vec3(0.5)))+vec3(1.5));
l9_204=vec4(l9_206.x,l9_206.y,l9_206.z,l9_202.w);
}
#else
{
l9_204=l9_202;
}
#endif
vec3 l9_207=vec3(linearToSrgb(l9_204.x),linearToSrgb(l9_204.y),linearToSrgb(l9_204.z));
l9_74=vec4(l9_207.x,l9_207.y,l9_207.z,l9_204.w);
}
#endif
vec4 l9_208=max(l9_74,vec4(0.0));
int l9_209;
#if (bodyDepthTexHasSwappedViews)
{
l9_209=1-sc_GetStereoViewIndex();
}
#else
{
l9_209=sc_GetStereoViewIndex();
}
#endif
bool l9_210=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_bodyDepthTex)!=0));
float l9_211=l9_5.x;
sc_SoftwareWrapEarly(l9_211,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x);
float l9_212=l9_211;
float l9_213=l9_5.y;
sc_SoftwareWrapEarly(l9_213,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y);
float l9_214=l9_213;
vec2 l9_215;
float l9_216;
#if (SC_USE_UV_MIN_MAX_bodyDepthTex)
{
bool l9_217;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_217=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x==3;
}
#else
{
l9_217=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_218=l9_212;
float l9_219=1.0;
sc_ClampUV(l9_218,bodyDepthTexUvMinMax.x,bodyDepthTexUvMinMax.z,l9_217,l9_219);
float l9_220=l9_218;
float l9_221=l9_219;
bool l9_222;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_222=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y==3;
}
#else
{
l9_222=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_223=l9_214;
float l9_224=l9_221;
sc_ClampUV(l9_223,bodyDepthTexUvMinMax.y,bodyDepthTexUvMinMax.w,l9_222,l9_224);
l9_216=l9_224;
l9_215=vec2(l9_220,l9_223);
}
#else
{
l9_216=1.0;
l9_215=vec2(l9_212,l9_214);
}
#endif
vec2 l9_225=sc_TransformUV(l9_215,(int(SC_USE_UV_TRANSFORM_bodyDepthTex)!=0),bodyDepthTexTransform);
float l9_226=l9_225.x;
float l9_227=l9_216;
sc_SoftwareWrapLate(l9_226,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x,l9_210,l9_227);
float l9_228=l9_225.y;
float l9_229=l9_227;
sc_SoftwareWrapLate(l9_228,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y,l9_210,l9_229);
float l9_230=l9_229;
vec3 l9_231=sc_SamplingCoordsViewToGlobal(vec2(l9_226,l9_228),bodyDepthTexLayout,l9_209);
vec4 l9_232=texture2D(bodyDepthTex,l9_231.xy,0.0);
vec4 l9_233;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_233=mix(bodyDepthTexBorderColor,l9_232,vec4(l9_230));
}
#else
{
l9_233=l9_232;
}
#endif
float l9_234=(l9_233.x*2.0)-1.0;
float l9_235;
if (bodyDepthTexProjectionMatrixTerms.z==0.0)
{
l9_235=(l9_234-bodyDepthTexProjectionMatrixTerms.y)/bodyDepthTexProjectionMatrixTerms.x;
}
else
{
l9_235=bodyDepthTexProjectionMatrixTerms.y/((-l9_234)-bodyDepthTexProjectionMatrixTerms.x);
}
tempGlobals=l9_7;
float l9_236=ssPow((l9_235-(1.0-((sc_Camera.clipPlanes.y*sc_Camera.clipPlanes.x)/(sc_Camera.clipPlanes.y+(gl_FragCoord.z*(sc_Camera.clipPlanes.x-sc_Camera.clipPlanes.y))))))*0.039999999,30.0);
vec4 l9_237;
#if (!(SC_DEVICE_CLASS>=2))
{
l9_237=l9_208;
}
#else
{
l9_237=mix(l9_208,vec4(l9_208.xyz,1.0-clamp(l9_236,0.0,1.0)),vec4(bodyIntersection));
}
#endif
vec4 l9_238;
#if (sc_ProjectiveShadowsCaster)
{
float l9_239;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_239=l9_237.w;
}
#else
{
float l9_240;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_240=clamp(l9_237.w*2.0,0.0,1.0);
}
#else
{
float l9_241;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_241=clamp(dot(l9_237.xyz,vec3(l9_237.w)),0.0,1.0);
}
#else
{
float l9_242;
#if (sc_BlendMode_AlphaTest)
{
l9_242=1.0;
}
#else
{
float l9_243;
#if (sc_BlendMode_Multiply)
{
l9_243=(1.0-dot(l9_237.xyz,vec3(0.33333001)))*l9_237.w;
}
#else
{
float l9_244;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_244=(1.0-clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0))*l9_237.w;
}
#else
{
float l9_245;
#if (sc_BlendMode_ColoredGlass)
{
l9_245=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0)*l9_237.w;
}
#else
{
float l9_246;
#if (sc_BlendMode_Add)
{
l9_246=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_247;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_247=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0)*l9_237.w;
}
#else
{
float l9_248;
#if (sc_BlendMode_Screen)
{
l9_248=dot(l9_237.xyz,vec3(0.33333001))*l9_237.w;
}
#else
{
float l9_249;
#if (sc_BlendMode_Min)
{
l9_249=1.0-clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_250;
#if (sc_BlendMode_Max)
{
l9_250=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_250=1.0;
}
#endif
l9_249=l9_250;
}
#endif
l9_248=l9_249;
}
#endif
l9_247=l9_248;
}
#endif
l9_246=l9_247;
}
#endif
l9_245=l9_246;
}
#endif
l9_244=l9_245;
}
#endif
l9_243=l9_244;
}
#endif
l9_242=l9_243;
}
#endif
l9_241=l9_242;
}
#endif
l9_240=l9_241;
}
#endif
l9_239=l9_240;
}
#endif
l9_238=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_237.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_239);
}
#else
{
vec4 l9_251;
#if (sc_RenderAlphaToColor)
{
l9_251=vec4(l9_237.w);
}
#else
{
vec4 l9_252;
#if (sc_BlendMode_Custom)
{
vec3 l9_253=sc_GetFramebufferColor().xyz;
vec3 l9_254=mix(l9_253,definedBlend(l9_253,l9_237.xyz).xyz,vec3(l9_237.w));
vec4 l9_255=vec4(l9_254.x,l9_254.y,l9_254.z,vec4(0.0).w);
l9_255.w=1.0;
l9_252=l9_255;
}
#else
{
vec4 l9_256;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_256=vec4(mix(vec3(1.0),l9_237.xyz,vec3(l9_237.w)),l9_237.w);
}
#else
{
vec4 l9_257;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_258;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_258=clamp(l9_237.w,0.0,1.0);
}
#else
{
l9_258=l9_237.w;
}
#endif
l9_257=vec4(l9_237.xyz*l9_258,l9_258);
}
#else
{
l9_257=l9_237;
}
#endif
l9_256=l9_257;
}
#endif
l9_252=l9_256;
}
#endif
l9_251=l9_252;
}
#endif
l9_238=l9_251;
}
#endif
vec4 l9_259;
if (PreviewEnabled==1)
{
vec4 l9_260;
if (PreviewInfo.Saved)
{
l9_260=PreviewInfo.Color;
}
else
{
l9_260=vec4(0.0);
}
l9_259=l9_260;
}
else
{
l9_259=l9_238;
}
vec4 l9_261;
#if (sc_ShaderComplexityAnalyzer)
{
l9_261=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_261=vec4(0.0);
}
#endif
vec4 l9_262;
if (l9_261.w>0.0)
{
l9_262=l9_261;
}
else
{
l9_262=l9_259;
}
vec4 l9_263=outputMotionVectorsIfNeeded(varPos,max(l9_262,vec4(0.0)));
vec4 l9_264=clamp(l9_263,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_265=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_265-0.0039215689)),min(1.0,l9_265+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_266=sc_ScreenCoordsGlobalToView(l9_4);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_266).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_267=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_266).xy);
float l9_268=packValue(l9_267);
int l9_275=int(l9_264.w*255.0);
float l9_276=packValue(l9_275);
sc_writeFragData0Internal(vec4(packValue(l9_267),packValue(l9_267),packValue(l9_267),packValue(l9_267)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_268,packValue(l9_267),packValue(l9_267),packValue(l9_267)));
sc_writeFragData2(vec4(l9_276,packValue(l9_275),packValue(l9_275),packValue(l9_275)));
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
vec2 l9_279=sc_ScreenCoordsGlobalToView(l9_4);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_279).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_280[8];
int l9_281[8];
int l9_282=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_282<8)
{
l9_280[l9_282]=0;
l9_281[l9_282]=0;
l9_282++;
continue;
}
else
{
break;
}
}
int l9_283;
#if (sc_OITMaxLayers8)
{
l9_283=2;
}
#else
{
l9_283=1;
}
#endif
int l9_284=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_284<l9_283)
{
vec4 l9_285;
vec4 l9_286;
vec4 l9_287;
if (l9_284==0)
{
l9_287=texture2D(sc_OITAlpha0,l9_279);
l9_286=texture2D(sc_OITDepthLow0,l9_279);
l9_285=texture2D(sc_OITDepthHigh0,l9_279);
}
else
{
l9_287=vec4(0.0);
l9_286=vec4(0.0);
l9_285=vec4(0.0);
}
vec4 l9_288;
vec4 l9_289;
vec4 l9_290;
if (l9_284==1)
{
l9_290=texture2D(sc_OITAlpha1,l9_279);
l9_289=texture2D(sc_OITDepthLow1,l9_279);
l9_288=texture2D(sc_OITDepthHigh1,l9_279);
}
else
{
l9_290=l9_287;
l9_289=l9_286;
l9_288=l9_285;
}
if (any(notEqual(l9_288,vec4(0.0)))||any(notEqual(l9_289,vec4(0.0))))
{
int l9_291[8]=l9_280;
unpackValues(l9_288.w,l9_284,l9_291);
unpackValues(l9_288.z,l9_284,l9_291);
unpackValues(l9_288.y,l9_284,l9_291);
unpackValues(l9_288.x,l9_284,l9_291);
unpackValues(l9_289.w,l9_284,l9_291);
unpackValues(l9_289.z,l9_284,l9_291);
unpackValues(l9_289.y,l9_284,l9_291);
unpackValues(l9_289.x,l9_284,l9_291);
int l9_300[8]=l9_281;
unpackValues(l9_290.w,l9_284,l9_300);
unpackValues(l9_290.z,l9_284,l9_300);
unpackValues(l9_290.y,l9_284,l9_300);
unpackValues(l9_290.x,l9_284,l9_300);
}
l9_284++;
continue;
}
else
{
break;
}
}
vec4 l9_305=texture2D(sc_OITFilteredDepthBoundsTexture,l9_279);
vec2 l9_306=l9_305.xy;
int l9_307;
#if (sc_SkinBonesCount>0)
{
l9_307=encodeDepth(((1.0-l9_305.x)*1000.0)+getDepthOrderingEpsilon(),l9_306);
}
#else
{
l9_307=0;
}
#endif
int l9_308=encodeDepth(viewSpaceDepth(),l9_306);
vec4 l9_309;
l9_309=l9_264*l9_264.w;
vec4 l9_310;
int l9_311=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_311<8)
{
int l9_312=l9_280[l9_311];
int l9_313=l9_308-l9_307;
bool l9_314=l9_312<l9_313;
bool l9_315;
if (l9_314)
{
l9_315=l9_280[l9_311]>0;
}
else
{
l9_315=l9_314;
}
if (l9_315)
{
vec3 l9_316=l9_309.xyz*(1.0-(float(l9_281[l9_311])/255.0));
l9_310=vec4(l9_316.x,l9_316.y,l9_316.z,l9_309.w);
}
else
{
l9_310=l9_309;
}
l9_309=l9_310;
l9_311++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_309,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(l9_4)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_264,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_263,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
