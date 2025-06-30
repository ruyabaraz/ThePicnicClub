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
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 31 0
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_distortionTex 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap 37 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanNormal 38 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 39 0
//spec_const bool SC_USE_UV_MIN_MAX_bodyDepthTex 40 0
//spec_const bool SC_USE_UV_MIN_MAX_distortionTex 41 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 42 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 43 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanHeightmap 44 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanNormal 45 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 46 0
//spec_const bool SC_USE_UV_TRANSFORM_bodyDepthTex 47 0
//spec_const bool SC_USE_UV_TRANSFORM_distortionTex 48 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 49 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 50 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanHeightmap 51 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanNormal 52 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 53 0
//spec_const bool UseViewSpaceDepthVariant 54 1
//spec_const bool bodyDepthTexHasSwappedViews 55 0
//spec_const bool distortionTexHasSwappedViews 56 0
//spec_const bool fluidPressureHasSwappedViews 57 0
//spec_const bool intensityTextureHasSwappedViews 58 0
//spec_const bool oceanHeightmapHasSwappedViews 59 0
//spec_const bool oceanNormalHasSwappedViews 60 0
//spec_const bool sc_BlendMode_Add 61 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 62 0
//spec_const bool sc_BlendMode_AlphaTest 63 0
//spec_const bool sc_BlendMode_AlphaToCoverage 64 0
//spec_const bool sc_BlendMode_ColoredGlass 65 0
//spec_const bool sc_BlendMode_Custom 66 0
//spec_const bool sc_BlendMode_Max 67 0
//spec_const bool sc_BlendMode_Min 68 0
//spec_const bool sc_BlendMode_Multiply 69 0
//spec_const bool sc_BlendMode_MultiplyOriginal 70 0
//spec_const bool sc_BlendMode_Normal 71 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 72 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 73 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 74 0
//spec_const bool sc_BlendMode_Screen 75 0
//spec_const bool sc_BlendMode_Software 76 0
//spec_const bool sc_CanUseStandardDerivatives 77 0
//spec_const bool sc_CanUseTextureLod 78 0
//spec_const bool sc_DepthOnly 79 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 80 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 81 0
//spec_const bool sc_FramebufferFetch 82 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 83 0
//spec_const bool sc_HasDiffuseEnvmap 84 0
//spec_const bool sc_IsEditor 85 0
//spec_const bool sc_LightEstimation 86 0
//spec_const bool sc_MotionVectorsPass 87 0
//spec_const bool sc_OITCompositingPass 88 0
//spec_const bool sc_OITDepthBoundsPass 89 0
//spec_const bool sc_OITDepthGatherPass 90 0
//spec_const bool sc_OITDepthPrepass 91 0
//spec_const bool sc_OITFrontLayerPass 92 0
//spec_const bool sc_OITMaxLayers4Plus1 93 0
//spec_const bool sc_OITMaxLayers8 94 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 95 0
//spec_const bool sc_ProjectiveShadowsCaster 96 0
//spec_const bool sc_ProjectiveShadowsReceiver 97 0
//spec_const bool sc_RenderAlphaToColor 98 0
//spec_const bool sc_SSAOEnabled 99 0
//spec_const bool sc_ScreenTextureHasSwappedViews 100 0
//spec_const bool sc_ShaderComplexityAnalyzer 101 0
//spec_const bool sc_TAAEnabled 102 0
//spec_const bool sc_UseFramebufferFetchMarker 103 0
//spec_const bool sc_VertexBlending 104 0
//spec_const bool sc_VertexBlendingUseNormals 105 0
//spec_const bool screenTexHasSwappedViews 106 0
//spec_const int SC_DEVICE_CLASS 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_distortionTex 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanNormal 113 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 114 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex 115 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_distortionTex 116 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 117 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 118 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap 119 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanNormal 120 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 121 -1
//spec_const int bodyDepthTexLayout 122 0
//spec_const int distortionTexLayout 123 0
//spec_const int fluidPressureLayout 124 0
//spec_const int intensityTextureLayout 125 0
//spec_const int oceanHeightmapLayout 126 0
//spec_const int oceanNormalLayout 127 0
//spec_const int sc_AmbientLightMode0 128 0
//spec_const int sc_AmbientLightMode1 129 0
//spec_const int sc_AmbientLightMode2 130 0
//spec_const int sc_AmbientLightMode_Constant 131 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 132 0
//spec_const int sc_AmbientLightMode_FromCamera 133 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 134 0
//spec_const int sc_AmbientLightsCount 135 0
//spec_const int sc_DepthBufferMode 136 0
//spec_const int sc_DirectionalLightsCount 137 0
//spec_const int sc_EnvLightMode 138 0
//spec_const int sc_EnvmapDiffuseLayout 139 0
//spec_const int sc_EnvmapSpecularLayout 140 0
//spec_const int sc_LightEstimationSGCount 141 0
//spec_const int sc_MaxTextureImageUnits 142 0
//spec_const int sc_PointLightsCount 143 0
//spec_const int sc_RenderingSpace 144 -1
//spec_const int sc_ScreenTextureLayout 145 0
//spec_const int sc_ShaderCacheConstant 146 0
//spec_const int sc_SkinBonesCount 147 0
//spec_const int sc_StereoRenderingMode 148 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 149 0
//spec_const int sc_StereoViewID 150 0
//spec_const int screenTexLayout 151 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
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
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
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
uniform float sc_DisableFrustumCullingMarker;
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
vec4 l9_22;
#if (sc_CanUseTextureLod)
{
l9_22=texture2DLod(screenTex,l9_21.xy,0.0);
}
#else
{
l9_22=vec4(0.0);
}
#endif
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
vec4 l9_30=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
vec3 l9_31=varNormal;
tempGlobals=ssGlobals(sc_Time.x,sc_Time.y,0.0,0.0,0.0,varPos,varNormal,varTangent.xyz,cross(varNormal,varTangent.xyz)*varTangent.w,l9_28,((l9_30.xyz/vec3(l9_30.w)).xy*0.5)+vec2(0.5),normalize(sc_Camera.position-varPos));
vec4 l9_32=N123_GradientInput_evaluate();
vec2 l9_33=tempGlobals.gScreenCoord;
vec2 l9_34=tempGlobals.Surface_UVCoord0;
vec3 l9_35=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_36=l9_34*distortionScale;
int l9_37;
#if (distortionTexHasSwappedViews)
{
l9_37=1-sc_GetStereoViewIndex();
}
#else
{
l9_37=sc_GetStereoViewIndex();
}
#endif
bool l9_38=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_distortionTex)!=0));
float l9_39=l9_36.x;
sc_SoftwareWrapEarly(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x);
float l9_40=l9_39;
float l9_41=l9_36.y;
sc_SoftwareWrapEarly(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y);
float l9_42=l9_41;
vec2 l9_43;
float l9_44;
#if (SC_USE_UV_MIN_MAX_distortionTex)
{
bool l9_45;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_45=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x==3;
}
#else
{
l9_45=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_46=l9_40;
float l9_47=1.0;
sc_ClampUV(l9_46,distortionTexUvMinMax.x,distortionTexUvMinMax.z,l9_45,l9_47);
float l9_48=l9_46;
float l9_49=l9_47;
bool l9_50;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_50=ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y==3;
}
#else
{
l9_50=(int(SC_USE_CLAMP_TO_BORDER_distortionTex)!=0);
}
#endif
float l9_51=l9_42;
float l9_52=l9_49;
sc_ClampUV(l9_51,distortionTexUvMinMax.y,distortionTexUvMinMax.w,l9_50,l9_52);
l9_44=l9_52;
l9_43=vec2(l9_48,l9_51);
}
#else
{
l9_44=1.0;
l9_43=vec2(l9_40,l9_42);
}
#endif
vec2 l9_53=sc_TransformUV(l9_43,(int(SC_USE_UV_TRANSFORM_distortionTex)!=0),distortionTexTransform);
float l9_54=l9_53.x;
float l9_55=l9_44;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).x,l9_38,l9_55);
float l9_56=l9_53.y;
float l9_57=l9_55;
sc_SoftwareWrapLate(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_distortionTex,SC_SOFTWARE_WRAP_MODE_V_distortionTex).y,l9_38,l9_57);
float l9_58=l9_57;
vec3 l9_59=sc_SamplingCoordsViewToGlobal(vec2(l9_54,l9_56),distortionTexLayout,l9_37);
vec4 l9_60;
#if (sc_CanUseTextureLod)
{
l9_60=texture2DLod(distortionTex,l9_59.xy,0.0);
}
#else
{
l9_60=vec4(0.0);
}
#endif
vec4 l9_61;
#if (SC_USE_CLAMP_TO_BORDER_distortionTex)
{
l9_61=mix(distortionTexBorderColor,l9_60,vec4(l9_58));
}
#else
{
l9_61=l9_60;
}
#endif
vec2 l9_62=(((l9_61.xy-vec2(1.0))*distortionIntensity)+l9_33)+vec2(0.30000001);
vec2 l9_63;
if (enableInfinite==1.0)
{
vec2 l9_64=vec2(oceanMin.xz);
vec2 l9_65=vec2(0.0)+(((sc_Camera.position.xz-l9_64)*1.0)/((vec2(oceanMax.xz)-l9_64)+vec2(1e-06)));
vec2 l9_66=l9_65;
l9_66.y=1.0-l9_65.y;
l9_63=(l9_34+l9_66)-vec2(0.5);
}
else
{
l9_63=l9_34;
}
int l9_67;
#if (oceanHeightmapHasSwappedViews)
{
l9_67=1-sc_GetStereoViewIndex();
}
#else
{
l9_67=sc_GetStereoViewIndex();
}
#endif
bool l9_68=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanHeightmap)!=0));
float l9_69=l9_63.x;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x);
float l9_70=l9_69;
float l9_71=l9_63.y;
sc_SoftwareWrapEarly(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y);
float l9_72=l9_71;
vec2 l9_73;
float l9_74;
#if (SC_USE_UV_MIN_MAX_oceanHeightmap)
{
bool l9_75;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_75=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x==3;
}
#else
{
l9_75=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_76=l9_70;
float l9_77=1.0;
sc_ClampUV(l9_76,oceanHeightmapUvMinMax.x,oceanHeightmapUvMinMax.z,l9_75,l9_77);
float l9_78=l9_76;
float l9_79=l9_77;
bool l9_80;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_80=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y==3;
}
#else
{
l9_80=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap)!=0);
}
#endif
float l9_81=l9_72;
float l9_82=l9_79;
sc_ClampUV(l9_81,oceanHeightmapUvMinMax.y,oceanHeightmapUvMinMax.w,l9_80,l9_82);
l9_74=l9_82;
l9_73=vec2(l9_78,l9_81);
}
#else
{
l9_74=1.0;
l9_73=vec2(l9_70,l9_72);
}
#endif
vec2 l9_83=sc_TransformUV(l9_73,(int(SC_USE_UV_TRANSFORM_oceanHeightmap)!=0),oceanHeightmapTransform);
float l9_84=l9_83.x;
float l9_85=l9_74;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).x,l9_68,l9_85);
float l9_86=l9_83.y;
float l9_87=l9_85;
sc_SoftwareWrapLate(l9_86,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap).y,l9_68,l9_87);
float l9_88=l9_87;
vec3 l9_89=sc_SamplingCoordsViewToGlobal(vec2(l9_84,l9_86),oceanHeightmapLayout,l9_67);
vec4 l9_90;
#if (sc_CanUseTextureLod)
{
l9_90=texture2DLod(oceanHeightmap,l9_89.xy,0.0);
}
#else
{
l9_90=vec4(0.0);
}
#endif
vec4 l9_91;
#if (SC_USE_CLAMP_TO_BORDER_oceanHeightmap)
{
l9_91=mix(oceanHeightmapBorderColor,l9_90,vec4(l9_88));
}
#else
{
l9_91=l9_90;
}
#endif
float l9_92=DecodeFloat16(l9_91.xy,true);
float l9_93=unpackVal.y-unpackVal.x;
float l9_94=0.99998999-0.0;
float l9_95=unpackVal.x+(((l9_92-0.0)*l9_93)/l9_94);
float l9_96=l9_93+1e-06;
tempGlobals.N123_TatalHeightRemap=0.0+(((l9_95-unpackVal.x)*1.0)/l9_96);
float l9_97;
if (enableFluid==1.0)
{
int l9_98;
#if (fluidPressureHasSwappedViews)
{
l9_98=1-sc_GetStereoViewIndex();
}
#else
{
l9_98=sc_GetStereoViewIndex();
}
#endif
bool l9_99=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0)&&(!(int(SC_USE_UV_MIN_MAX_fluidPressure)!=0));
float l9_100=l9_34.x;
sc_SoftwareWrapEarly(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x);
float l9_101=l9_100;
float l9_102=l9_34.y;
sc_SoftwareWrapEarly(l9_102,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y);
float l9_103=l9_102;
vec2 l9_104;
float l9_105;
#if (SC_USE_UV_MIN_MAX_fluidPressure)
{
bool l9_106;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_106=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x==3;
}
#else
{
l9_106=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_107=l9_101;
float l9_108=1.0;
sc_ClampUV(l9_107,fluidPressureUvMinMax.x,fluidPressureUvMinMax.z,l9_106,l9_108);
float l9_109=l9_107;
float l9_110=l9_108;
bool l9_111;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_111=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y==3;
}
#else
{
l9_111=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_112=l9_103;
float l9_113=l9_110;
sc_ClampUV(l9_112,fluidPressureUvMinMax.y,fluidPressureUvMinMax.w,l9_111,l9_113);
l9_105=l9_113;
l9_104=vec2(l9_109,l9_112);
}
#else
{
l9_105=1.0;
l9_104=vec2(l9_101,l9_103);
}
#endif
vec2 l9_114=sc_TransformUV(l9_104,(int(SC_USE_UV_TRANSFORM_fluidPressure)!=0),fluidPressureTransform);
float l9_115=l9_114.x;
float l9_116=l9_105;
sc_SoftwareWrapLate(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x,l9_99,l9_116);
float l9_117=l9_114.y;
float l9_118=l9_116;
sc_SoftwareWrapLate(l9_117,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y,l9_99,l9_118);
float l9_119=l9_118;
vec3 l9_120=sc_SamplingCoordsViewToGlobal(vec2(l9_115,l9_117),fluidPressureLayout,l9_98);
vec4 l9_121;
#if (sc_CanUseTextureLod)
{
l9_121=texture2DLod(fluidPressure,l9_120.xy,0.0);
}
#else
{
l9_121=vec4(0.0);
}
#endif
vec4 l9_122;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_122=mix(fluidPressureBorderColor,l9_121,vec4(l9_119));
}
#else
{
l9_122=l9_121;
}
#endif
float l9_123=(pressureRange.x+(((DecodeFloat16(l9_122.xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_94))*fluidMul;
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp(l9_123,unpackVal.x,unpackVal.y)-unpackVal.x)*1.0)/l9_96))*0.60000002);
l9_97=l9_95+l9_123;
}
else
{
l9_97=l9_95;
}
int l9_124;
#if (oceanNormalHasSwappedViews)
{
l9_124=1-sc_GetStereoViewIndex();
}
#else
{
l9_124=sc_GetStereoViewIndex();
}
#endif
bool l9_125=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0)&&(!(int(SC_USE_UV_MIN_MAX_oceanNormal)!=0));
float l9_126=l9_63.x;
sc_SoftwareWrapEarly(l9_126,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x);
float l9_127=l9_126;
float l9_128=l9_63.y;
sc_SoftwareWrapEarly(l9_128,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y);
float l9_129=l9_128;
vec2 l9_130;
float l9_131;
#if (SC_USE_UV_MIN_MAX_oceanNormal)
{
bool l9_132;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_132=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x==3;
}
#else
{
l9_132=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_133=l9_127;
float l9_134=1.0;
sc_ClampUV(l9_133,oceanNormalUvMinMax.x,oceanNormalUvMinMax.z,l9_132,l9_134);
float l9_135=l9_133;
float l9_136=l9_134;
bool l9_137;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_137=ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y==3;
}
#else
{
l9_137=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal)!=0);
}
#endif
float l9_138=l9_129;
float l9_139=l9_136;
sc_ClampUV(l9_138,oceanNormalUvMinMax.y,oceanNormalUvMinMax.w,l9_137,l9_139);
l9_131=l9_139;
l9_130=vec2(l9_135,l9_138);
}
#else
{
l9_131=1.0;
l9_130=vec2(l9_127,l9_129);
}
#endif
vec2 l9_140=sc_TransformUV(l9_130,(int(SC_USE_UV_TRANSFORM_oceanNormal)!=0),oceanNormalTransform);
float l9_141=l9_140.x;
float l9_142=l9_131;
sc_SoftwareWrapLate(l9_141,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).x,l9_125,l9_142);
float l9_143=l9_140.y;
float l9_144=l9_142;
sc_SoftwareWrapLate(l9_143,ivec2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal,SC_SOFTWARE_WRAP_MODE_V_oceanNormal).y,l9_125,l9_144);
float l9_145=l9_144;
vec3 l9_146=sc_SamplingCoordsViewToGlobal(vec2(l9_141,l9_143),oceanNormalLayout,l9_124);
vec4 l9_147;
#if (sc_CanUseTextureLod)
{
l9_147=texture2DLod(oceanNormal,l9_146.xy,0.0);
}
#else
{
l9_147=vec4(0.0);
}
#endif
vec4 l9_148;
#if (SC_USE_CLAMP_TO_BORDER_oceanNormal)
{
l9_148=mix(oceanNormalBorderColor,l9_147,vec4(l9_145));
}
#else
{
l9_148=l9_147;
}
#endif
vec3 l9_149=(l9_148.xyz*1.9921875)-vec3(1.0);
vec3 l9_150=vec3(0.0,l9_97,0.0);
vec3 l9_151=l9_150+l9_35;
tempGlobals.N123_fbm=1.0;
if (enableFoam==1.0)
{
vec2 l9_152=l9_151.zx*fbmScale;
float l9_153=tempGlobals.gTimeElapsed*speed;
vec2 l9_154=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_152)*2.02;
vec2 l9_155=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_154)*2.01;
vec2 l9_156=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_155)*2.03;
vec2 l9_157=(mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_156)*2.01;
tempGlobals.N123_fbm=1.0-(((((((0.0+(0.5*N123_noise(l9_152+vec2(l9_153))))+(0.03125*N123_noise(l9_154)))+(0.25*N123_noise(l9_155)))+(0.125*N123_noise(l9_156)))+(0.0625*N123_noise(l9_157)))+(0.015625*N123_noise(((mat2(vec2(0.80000001,0.60000002),vec2(-0.60000002,0.80000001))*l9_157)*2.04)+vec2(sin(l9_153)))))/0.96875);
}
vec4 l9_158=N123_GradientInput_evaluate();
if (sc_DirectionalLightsCount>0)
{
int l9_159=0;
bool l9_160;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
l9_160=l9_159<sc_DirectionalLightsCount;
if (l9_160)
{
vec3 l9_161;
if (l9_160)
{
l9_161=-sc_DirectionalLights[l9_159].direction;
}
else
{
l9_161=vec3(0.0);
}
l9_159++;
continue;
}
else
{
break;
}
}
}
vec3 l9_162;
vec3 l9_163;
vec3 l9_164;
if (l9_27)
{
l9_164=varTangent.xyz;
l9_163=varNormal;
l9_162=varPos;
}
else
{
l9_164=varTangent.xyz;
l9_163=l9_31;
l9_162=l9_151;
}
varPos=l9_162;
varNormal=normalize(l9_163);
vec3 l9_165=normalize(l9_164);
varTangent=vec4(l9_165.x,l9_165.y,l9_165.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_166;
#if (sc_RenderingSpace==3)
{
l9_166=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_167;
#if (sc_RenderingSpace==2)
{
l9_167=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_168;
#if (sc_RenderingSpace==1)
{
l9_168=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
l9_168=l9_17;
}
#endif
l9_167=l9_168;
}
#endif
l9_166=l9_167;
}
#endif
varViewSpaceDepth=-l9_166.z;
}
#endif
vec4 l9_169;
#if (sc_RenderingSpace==3)
{
l9_169=l9_17;
}
#else
{
vec4 l9_170;
#if (sc_RenderingSpace==4)
{
l9_170=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_171;
#if (sc_RenderingSpace==2)
{
l9_171=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_172;
#if (sc_RenderingSpace==1)
{
l9_172=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_172=vec4(0.0);
}
#endif
l9_171=l9_172;
}
#endif
l9_170=l9_171;
}
#endif
l9_169=l9_170;
}
#endif
varPackedTex=vec4(l9_28,l9_2);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_173;
#if (sc_RenderingSpace==1)
{
l9_173=sc_ModelMatrix*l9_17;
}
#else
{
l9_173=l9_17;
}
#endif
vec4 l9_174=sc_ProjectorMatrix*l9_173;
varShadowTex=((l9_174.xy/vec2(l9_174.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_175;
#if (sc_DepthBufferMode==1)
{
vec4 l9_176;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_177=l9_169;
l9_177.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_169.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_169.w;
l9_176=l9_177;
}
else
{
l9_176=l9_169;
}
l9_175=l9_176;
}
#else
{
l9_175=l9_169;
}
#endif
vec4 l9_178;
#if (sc_TAAEnabled)
{
vec2 l9_179=l9_175.xy+(sc_TAAJitterOffset*l9_175.w);
l9_178=vec4(l9_179.x,l9_179.y,l9_175.z,l9_175.w);
}
#else
{
l9_178=l9_175;
}
#endif
vec4 l9_180;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_181=l9_178;
l9_181.x=l9_178.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_180=l9_181;
}
#else
{
l9_180=l9_178;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_182=dot(l9_180,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_182);
}
#else
{
varClipDistance=l9_182;
}
#endif
}
#endif
gl_Position=l9_180;
if (PreviewInfo.Saved)
{
PreviewVertexColor=vec4(PreviewInfo.Color.xyz,1.0);
PreviewVertexSaved=1.0;
}
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
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
#ifndef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 0
#elif sc_CanUseStandardDerivatives==1
#undef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 1
#endif
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
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
#ifndef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 0
#elif SC_GL_FRAGMENT_PRECISION_HIGH==1
#undef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 1
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
uniform vec4 sc_EnvmapSpecularDims;
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
vec3 N123_OceanAabbMin;
vec3 N123_OceanAabbMax;
float N123_OceanSpeed;
float N123_EnableFoam;
float N123_FBMScale;
float N123_EnableInfinite;
float N123_DistortionScale;
float N123_DistortionIntensity;
float N123_EnableFluid;
vec2 N123_pressureRange;
float N123_FluidMul;
vec2 N123_unpackVal;
vec4 N123_GradientInput;
vec4 N123_FrontFacing;
vec4 N123_BackFacing;
vec3 N123_Normal;
vec3 N123_SurfacePosition;
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
void Node123_Ocean_Surface(vec3 OceanAabbMin,vec3 OceanAabbMax,float OceanSpeed,float EnableFoam,float FBMScale,float EnableInfinite,float DistortionScale,float DistortionIntensity,float EnableFluid,vec2 pressureRange_1,float FluidMul,vec2 unpackVal_1,vec4 GradientInput,out vec4 FrontFacing,out vec4 BackFacing,out vec3 Normal,out vec3 SurfacePosition,ssGlobals Globals)
{
tempGlobals=Globals;
FrontFacing=vec4(0.0);
BackFacing=vec4(0.0);
Normal=vec3(0.0);
SurfacePosition=vec3(0.0);
N123_OceanAabbMin=oceanMin;
N123_OceanAabbMax=oceanMax;
N123_OceanSpeed=speed;
N123_EnableFoam=enableFoam;
N123_FBMScale=fbmScale;
N123_EnableInfinite=enableInfinite;
N123_DistortionScale=distortionScale;
N123_DistortionIntensity=distortionIntensity;
N123_EnableFluid=enableFluid;
N123_pressureRange=pressureRange;
N123_FluidMul=fluidMul;
N123_unpackVal=unpackVal;
vec4 l9_0=N123_GradientInput_evaluate();
N123_GradientInput=l9_0;
vec2 l9_1=tempGlobals.Surface_UVCoord0;
vec3 l9_2=tempGlobals.SurfacePosition_WorldSpace;
vec2 l9_3=(((N123_DistortionTex_sample(l9_1*N123_DistortionScale).xy-vec2(1.0))*N123_DistortionIntensity)+tempGlobals.gScreenCoord)+vec2(0.30000001);
vec4 l9_4=N123_ScreenTex_sample(vec2(l9_3.x-0.15000001,1.0-l9_3.y)*0.89999998);
vec4 l9_5=N123_ScreenTex_sample(((l9_3-vec2(0.1))*0.5)+vec2(0.1));
vec2 l9_6;
if (N123_EnableInfinite==1.0)
{
vec2 l9_7=vec2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
vec2 l9_8=vec2(0.0)+(((sc_Camera.position.xz-l9_7)*1.0)/((vec2(N123_OceanAabbMax.x,N123_OceanAabbMax.z)-l9_7)+vec2(1e-06)));
vec2 l9_9=l9_8;
l9_9.y=1.0-l9_8.y;
l9_6=(l9_1+l9_9)-vec2(0.5);
}
else
{
l9_6=l9_1;
}
float l9_10=N123_unpackVal.x;
float l9_11=N123_unpackVal.y;
float l9_12=DecodeFloat16(N123_WaveHeightTex_sample(l9_6).xy,true);
float l9_13=0.99998999-0.0;
float l9_14=l9_10+(((l9_12-0.0)*(l9_11-l9_10))/l9_13);
tempGlobals.N123_TatalHeightRemap=0.0+(((l9_14-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
float l9_15;
if (N123_EnableFluid==1.0)
{
float l9_16=(N123_pressureRange.x+(((DecodeFloat16(N123_Fluid2dPressureTex_sample(l9_1).xy,true)-0.0)*(N123_pressureRange.y-N123_pressureRange.x))/l9_13))*N123_FluidMul;
tempGlobals.N123_TatalHeightRemap+=((0.0+(((clamp(l9_16,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002);
l9_15=l9_14+l9_16;
}
else
{
l9_15=l9_14;
}
float l9_17=tempGlobals.N123_TatalHeightRemap;
N123_Normal=(N123_WaveNormalTex_sample(l9_6).xyz*1.9921875)-vec3(1.0);
N123_SurfacePosition=vec3(0.0,l9_15,0.0)+l9_2;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
tempGlobals.N123_fbm=1.0-N123_fbmNoise(N123_SurfacePosition.zx*N123_FBMScale,tempGlobals.gTimeElapsed*N123_OceanSpeed);
}
float l9_18=N123_rim(N123_Normal,6.0,4.0);
vec4 l9_19=N123_GradientInput_evaluate();
if (sc_DirectionalLightsCount>0)
{
int l9_20;
float l9_21;
float l9_22;
int l9_23=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_23<sc_DirectionalLightsCount)
{
N123_FrontFacing=mix(mix(l9_19,l9_5,vec4(clamp(ssPow((dot(N123_Normal,N123_system_getDirectionalLightDirection(l9_23))*0.60000002)+0.40000001,10.0),0.0,1.0))),l9_19*l9_4,vec4(max(clamp(l9_18,0.0,1.0),clamp(smoothstep(0.44999999,0.60000002,l9_17),0.0,1.0))*0.89999998));
N123_BackFacing=l9_4;
l9_23++;
continue;
}
else
{
break;
}
}
}
FrontFacing=N123_FrontFacing;
BackFacing=N123_BackFacing;
Normal=N123_Normal;
SurfacePosition=N123_SurfacePosition;
}
vec3 ssSRGB_to_Linear(vec3 value)
{
vec3 l9_0;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
return normalize(mix(R,N,vec3((roughness*roughness)*roughness)));
}
#else
{
return R;
}
#endif
}
float sc_InternalCalculateSampleBias(vec2 texSize,vec2 uv,float level_)
{
float l9_0;
#if (sc_CanUseStandardDerivatives)
{
vec2 l9_1=uv*texSize;
float l9_2=l9_1.x;
float l9_3=l9_1.y;
l9_0=level_-log2(max(max(abs(dFdx(l9_2)),abs(dFdy(l9_2))),max(abs(dFdx(l9_3)),abs(dFdy(l9_3)))));
}
#else
{
l9_0=0.0;
}
#endif
return l9_0;
}
vec4 sc_EnvmapSpecularSampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
float l9_1=level_;
vec3 l9_2=sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex);
vec2 l9_3=l9_2.xy;
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=texture2DLod(sc_EnvmapSpecular,l9_3,l9_1);
}
#else
{
vec4 l9_5;
#if (sc_CanUseStandardDerivatives)
{
l9_5=texture2D(sc_EnvmapSpecular,l9_3,sc_InternalCalculateSampleBias(sc_EnvmapSpecularDims.xy,l9_3,l9_1));
}
#else
{
l9_5=vec4(0.0);
}
#endif
l9_4=l9_5;
}
#endif
l9_0=l9_4;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec3 envBRDFApprox(SurfaceProperties surfaceProperties,float NdotV)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
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
N123_OceanAabbMin=vec3(0.0);
N123_OceanAabbMax=vec3(0.0);
N123_OceanSpeed=0.0;
N123_EnableFoam=0.0;
N123_FBMScale=0.0;
N123_EnableInfinite=0.0;
N123_DistortionScale=0.0;
N123_DistortionIntensity=0.0;
N123_EnableFluid=0.0;
N123_pressureRange=vec2(0.0);
N123_FluidMul=0.0;
N123_unpackVal=vec2(0.0);
N123_GradientInput=vec4(0.0);
N123_FrontFacing=vec4(0.0);
N123_BackFacing=vec4(0.0);
N123_Normal=vec3(0.0);
N123_SurfacePosition=vec3(0.0);
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
vec4 l9_9;
vec4 l9_10;
vec3 l9_11;
vec3 l9_12;
Node123_Ocean_Surface(vec3(-100.0),vec3(100.0),0.0,0.0,0.0,0.0,1.0,1.0,1.0,vec2(-40.0,40.0),0.0,vec2(0.0),vec4(1.0),l9_9,l9_10,l9_11,l9_12,l9_7);
l9_8=l9_9;
}
else
{
vec4 l9_13;
vec4 l9_14;
vec3 l9_15;
vec3 l9_16;
Node123_Ocean_Surface(vec3(-100.0),vec3(100.0),0.0,0.0,0.0,0.0,1.0,1.0,1.0,vec2(-40.0,40.0),0.0,vec2(0.0),vec4(1.0),l9_13,l9_14,l9_15,l9_16,l9_7);
l9_8=l9_14;
}
vec4 param_13;
vec4 param_14;
vec3 param_15;
vec3 param_16;
Node123_Ocean_Surface(vec3(-100.0),vec3(100.0),0.0,0.0,0.0,0.0,1.0,1.0,1.0,vec2(-40.0,40.0),0.0,vec2(0.0),vec4(1.0),param_13,param_14,param_15,param_16,l9_7);
vec3 l9_17=param_15;
vec3 l9_18;
#if (!sc_ProjectiveShadowsCaster)
{
l9_18=mat3(l9_0,l9_2,l9_1)*l9_17;
}
#else
{
l9_18=vec3(0.0);
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
vec3 l9_19=max(l9_8.xyz,vec3(0.0));
vec4 l9_20;
#if (sc_ProjectiveShadowsCaster)
{
l9_20=vec4(l9_19,Port_Opacity_N013);
}
#else
{
vec3 l9_21=ssSRGB_to_Linear(l9_19);
vec3 l9_22=normalize(l9_18);
vec3 l9_23=ssSRGB_to_Linear(Port_Emissive_N013);
vec3 l9_24;
#if (sc_SSAOEnabled)
{
l9_24=evaluateSSAO(varPos);
}
#else
{
l9_24=Port_AO_N013;
}
#endif
vec3 l9_25=vec3(Port_Metallic_N013);
vec3 l9_26=mix(vec3(0.039999999),l9_21*Port_Metallic_N013,l9_25);
vec3 l9_27=mix(l9_21*(1.0-Port_Metallic_N013),vec3(0.0),l9_25);
SurfaceProperties l9_28=SurfaceProperties(l9_27,Port_Opacity_N013,l9_22,varPos,l9_6,Port_Metallic_N013,Port_Roughness_N013,l9_23,l9_24,Port_SpecularAO_N013,vec3(1.0),l9_26);
vec4 l9_29=vec4(1.0);
vec3 l9_30;
vec3 l9_31;
vec3 l9_32;
vec3 l9_33;
int l9_34;
vec3 l9_35;
vec3 l9_36;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_37;
vec3 l9_38;
vec3 l9_39;
vec3 l9_40;
int l9_41;
vec3 l9_42;
vec3 l9_43;
l9_43=vec3(1.0);
l9_42=vec3(0.0);
l9_41=0;
l9_40=vec3(0.0);
l9_39=vec3(0.0);
l9_38=vec3(0.0);
l9_37=vec3(0.0);
LightingComponents l9_44;
LightProperties l9_45;
SurfaceProperties l9_46;
vec3 l9_47;
int l9_48=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_48<sc_DirectionalLightsCount)
{
LightingComponents l9_49=accumulateLight(LightingComponents(l9_37,l9_38,l9_43,l9_42,l9_40,l9_39),LightProperties(sc_DirectionalLights[l9_48].direction,sc_DirectionalLights[l9_48].color.xyz,sc_DirectionalLights[l9_48].color.w*l9_29[(l9_41<3) ? l9_41 : 3]),l9_28,l9_6);
l9_43=l9_49.indirectDiffuse;
l9_42=l9_49.indirectSpecular;
l9_41++;
l9_40=l9_49.emitted;
l9_39=l9_49.transmitted;
l9_38=l9_49.directSpecular;
l9_37=l9_49.directDiffuse;
l9_48++;
continue;
}
else
{
break;
}
}
l9_36=l9_43;
l9_35=l9_42;
l9_34=l9_41;
l9_33=l9_40;
l9_32=l9_39;
l9_31=l9_38;
l9_30=l9_37;
}
#else
{
l9_36=vec3(1.0);
l9_35=vec3(0.0);
l9_34=0;
l9_33=vec3(0.0);
l9_32=vec3(0.0);
l9_31=vec3(0.0);
l9_30=vec3(0.0);
}
#endif
vec3 l9_50;
vec3 l9_51;
vec3 l9_52;
#if (sc_PointLightsCount>0)
{
vec3 l9_53;
vec3 l9_54;
vec3 l9_55;
vec3 l9_56;
vec3 l9_57;
vec3 l9_58;
l9_58=l9_36;
l9_57=l9_35;
l9_56=l9_33;
l9_55=l9_32;
l9_54=l9_31;
l9_53=l9_30;
int l9_59;
vec3 l9_60;
vec3 l9_61;
vec3 l9_62;
vec3 l9_63;
vec3 l9_64;
vec3 l9_65;
int l9_66=0;
int l9_67=l9_34;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_66<sc_PointLightsCount)
{
vec3 l9_68=sc_PointLights[l9_66].position-varPos;
vec3 l9_69=normalize(l9_68);
float l9_70=l9_29[(l9_67<3) ? l9_67 : 3];
float l9_71=clamp((dot(l9_69,sc_PointLights[l9_66].direction)*sc_PointLights[l9_66].angleScale)+sc_PointLights[l9_66].angleOffset,0.0,1.0);
float l9_72=(sc_PointLights[l9_66].color.w*l9_70)*(l9_71*l9_71);
float l9_73;
if (sc_PointLights[l9_66].falloffEnabled)
{
l9_73=l9_72*computeDistanceAttenuation(length(l9_68),sc_PointLights[l9_66].falloffEndDistance);
}
else
{
l9_73=l9_72;
}
l9_59=l9_67+1;
LightingComponents l9_74=accumulateLight(LightingComponents(l9_53,l9_54,l9_58,l9_57,l9_56,l9_55),LightProperties(l9_69,sc_PointLights[l9_66].color.xyz,l9_73),l9_28,l9_6);
l9_60=l9_74.directDiffuse;
l9_61=l9_74.directSpecular;
l9_62=l9_74.indirectDiffuse;
l9_63=l9_74.indirectSpecular;
l9_64=l9_74.emitted;
l9_65=l9_74.transmitted;
l9_58=l9_62;
l9_57=l9_63;
l9_67=l9_59;
l9_56=l9_64;
l9_55=l9_65;
l9_54=l9_61;
l9_53=l9_60;
l9_66++;
continue;
}
else
{
break;
}
}
l9_52=l9_55;
l9_51=l9_54;
l9_50=l9_53;
}
#else
{
l9_52=l9_32;
l9_51=l9_31;
l9_50=l9_30;
}
#endif
vec3 l9_75;
vec3 l9_76;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_77;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_78=abs(varShadowTex-vec2(0.5));
vec4 l9_79=texture2D(sc_ShadowTexture,varShadowTex)*step(max(l9_78.x,l9_78.y),0.5);
l9_77=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_79.xyz,vec3(sc_ShadowColor.w)),vec3(l9_79.w*sc_ShadowDensity));
}
#else
{
l9_77=vec3(1.0);
}
#endif
l9_76=l9_50*l9_77;
l9_75=l9_51*l9_77;
}
#else
{
l9_76=l9_50;
l9_75=l9_51;
}
#endif
vec3 l9_80;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec2 l9_81=calcPanoramicTexCoordsFromDir(l9_22,sc_EnvmapRotation.y);
vec4 l9_82;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_83;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_83=calcSeamlessPanoramicUvsForSampling(l9_81,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_83=l9_81;
}
#endif
l9_82=sc_EnvmapSpecularSampleViewIndexBias(l9_83,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#else
{
vec4 l9_84;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
vec2 l9_85=calcSeamlessPanoramicUvsForSampling(l9_81,sc_EnvmapDiffuseSize.xy,0.0);
int l9_86;
#if (sc_EnvmapDiffuseHasSwappedViews)
{
l9_86=1-sc_GetStereoViewIndex();
}
#else
{
l9_86=sc_GetStereoViewIndex();
}
#endif
l9_84=texture2D(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_85,sc_EnvmapDiffuseLayout,l9_86).xy,-13.0);
}
#else
{
l9_84=sc_EnvmapSpecularSampleViewIndexBias(l9_81,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#endif
l9_82=l9_84;
}
#endif
l9_80=(l9_82.xyz*(1.0/l9_82.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_87;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_88=-l9_22;
float l9_89=l9_88.x;
float l9_90=l9_88.y;
float l9_91=l9_88.z;
l9_87=(((((((sc_Sh[8]*0.42904299)*((l9_89*l9_89)-(l9_90*l9_90)))+((sc_Sh[6]*0.74312502)*(l9_91*l9_91)))+(sc_Sh[0]*0.88622701))-(sc_Sh[6]*0.24770799))+((((sc_Sh[4]*(l9_89*l9_90))+(sc_Sh[7]*(l9_89*l9_91)))+(sc_Sh[5]*(l9_90*l9_91)))*0.85808599))+((((sc_Sh[3]*l9_89)+(sc_Sh[1]*l9_90))+(sc_Sh[2]*l9_91))*1.0233279))*sc_ShIntensity;
}
#else
{
l9_87=vec3(0.0);
}
#endif
l9_80=l9_87;
}
#endif
vec3 l9_92;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_93;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_93=l9_80+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_94=l9_80;
l9_94.x=l9_80.x+(1e-06*sc_AmbientLights[0].color.x);
l9_93=l9_94;
}
#endif
l9_92=l9_93;
}
#else
{
l9_92=l9_80;
}
#endif
vec3 l9_95;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_96;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_96=l9_92+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_97=l9_92;
l9_97.x=l9_92.x+(1e-06*sc_AmbientLights[1].color.x);
l9_96=l9_97;
}
#endif
l9_95=l9_96;
}
#else
{
l9_95=l9_92;
}
#endif
vec3 l9_98;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_99;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_99=l9_95+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_100=l9_95;
l9_100.x=l9_95.x+(1e-06*sc_AmbientLights[2].color.x);
l9_99=l9_100;
}
#endif
l9_98=l9_99;
}
#else
{
l9_98=l9_95;
}
#endif
vec3 l9_101;
#if (sc_LightEstimation)
{
vec3 l9_102;
l9_102=sc_LightEstimationData.ambientLight;
vec3 l9_103;
int l9_104=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_104<sc_LightEstimationSGCount)
{
float l9_105=dot(sc_LightEstimationData.sg[l9_104].axis,l9_22);
float l9_106=exp(-sc_LightEstimationData.sg[l9_104].sharpness);
float l9_107=l9_106*l9_106;
float l9_108=1.0/sc_LightEstimationData.sg[l9_104].sharpness;
float l9_109=(1.0+(2.0*l9_107))-l9_108;
float l9_110=sqrt(1.0-l9_109);
float l9_111=0.36000001*l9_105;
float l9_112=(1.0/(4.0*0.36000001))*l9_110;
float l9_113=l9_111+l9_112;
float l9_114;
if (step(abs(l9_111),l9_112)>0.5)
{
l9_114=(l9_113*l9_113)/l9_110;
}
else
{
l9_114=clamp(l9_105,0.0,1.0);
}
l9_103=l9_102+((((sc_LightEstimationData.sg[l9_104].color/vec3(sc_LightEstimationData.sg[l9_104].sharpness))*6.2831855)*((l9_109*l9_114)+(((l9_106-l9_107)*l9_108)-l9_107)))/vec3(3.1415927));
l9_102=l9_103;
l9_104++;
continue;
}
else
{
break;
}
}
l9_101=l9_98+l9_102;
}
#else
{
l9_101=l9_98;
}
#endif
vec3 l9_115;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_116=clamp(pow(Port_Roughness_N013,0.66666669),0.0,1.0)*5.0;
vec2 l9_117=calcPanoramicTexCoordsFromDir(getSpecularDominantDir(l9_22,reflect(-l9_6,l9_22),Port_Roughness_N013),sc_EnvmapRotation.y);
vec4 l9_118;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
float l9_119=floor(l9_116);
float l9_120=ceil(l9_116);
l9_118=mix(sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_117,sc_EnvmapSpecularSize.xy,l9_119),sc_EnvmapSpecularGetStereoViewIndex(),l9_119),sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_117,sc_EnvmapSpecularSize.xy,l9_120),sc_EnvmapSpecularGetStereoViewIndex(),l9_120),vec4(l9_116-l9_119));
}
#else
{
l9_118=sc_EnvmapSpecularSampleViewIndexLevel(l9_117,sc_EnvmapSpecularGetStereoViewIndex(),l9_116);
}
#endif
l9_115=vec3(0.0)+((((l9_118.xyz*(1.0/l9_118.w))*sc_EnvmapExposure)+vec3(1e-06))*envBRDFApprox(l9_28,abs(dot(l9_22,l9_6))));
}
#else
{
l9_115=vec3(0.0);
}
#endif
vec3 l9_121;
#if (sc_LightEstimation)
{
float l9_122=clamp(Port_Roughness_N013*Port_Roughness_N013,0.0099999998,1.0);
vec3 l9_123;
l9_123=sc_LightEstimationData.ambientLight*l9_26;
int l9_124=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_124<sc_LightEstimationSGCount)
{
float l9_125=l9_122*l9_122;
vec3 l9_126=reflect(-l9_6,l9_22);
float l9_127=dot(l9_22,l9_6);
float l9_128=(2.0/l9_125)/(4.0*max(l9_127,9.9999997e-05));
float l9_129=length((l9_126*l9_128)+(sc_LightEstimationData.sg[l9_124].axis*sc_LightEstimationData.sg[l9_124].sharpness));
float l9_130=clamp(dot(l9_22,l9_126),0.0,1.0);
float l9_131=clamp(l9_127,0.0,1.0);
float l9_132=1.0-l9_125;
l9_123+=((((((((vec3(1.0/(3.1415927*l9_125))*exp((l9_129-l9_128)-sc_LightEstimationData.sg[l9_124].sharpness))*sc_LightEstimationData.sg[l9_124].color)*6.2831855)*(1.0-exp((-2.0)*l9_129)))/vec3(l9_129))*((1.0/(l9_130+sqrt(l9_125+((l9_132*l9_130)*l9_130))))*(1.0/(l9_131+sqrt(l9_125+((l9_132*l9_131)*l9_131))))))*(l9_26+((vec3(1.0)-l9_26)*pow(1.0-clamp(dot(l9_126,normalize(l9_126+l9_6)),0.0,1.0),5.0))))*l9_130);
l9_124++;
continue;
}
else
{
break;
}
}
l9_121=l9_115+l9_123;
}
#else
{
l9_121=l9_115;
}
#endif
float l9_133;
vec3 l9_134;
vec3 l9_135;
vec3 l9_136;
#if (sc_BlendMode_ColoredGlass)
{
l9_136=vec3(0.0);
l9_135=vec3(0.0);
l9_134=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_27,vec3(Port_Opacity_N013));
l9_133=1.0;
}
#else
{
l9_136=l9_76;
l9_135=l9_101;
l9_134=l9_52;
l9_133=Port_Opacity_N013;
}
#endif
bool l9_137;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_137=true;
}
#else
{
l9_137=false;
}
#endif
vec3 l9_138=l9_135*l9_24;
vec3 l9_139=l9_136+l9_138;
vec3 l9_140=l9_27*l9_139;
vec3 l9_141=l9_121*Port_SpecularAO_N013;
vec3 l9_142=l9_75+l9_141;
vec3 l9_143;
if (l9_137)
{
l9_143=l9_140*srgbToLinear(l9_133);
}
else
{
l9_143=l9_140;
}
vec3 l9_144=l9_143+l9_142;
vec3 l9_145=(l9_144+l9_23)+l9_134;
float l9_146=l9_145.x;
vec4 l9_147=vec4(l9_146,l9_145.yz,l9_133);
vec4 l9_148;
#if (sc_IsEditor)
{
vec4 l9_149=l9_147;
l9_149.x=l9_146+((l9_24.x*Port_SpecularAO_N013.x)*9.9999997e-06);
l9_148=l9_149;
}
#else
{
l9_148=l9_147;
}
#endif
vec4 l9_150;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_151=l9_148.xyz*1.8;
vec3 l9_152=(l9_148.xyz*(l9_151+vec3(1.4)))/((l9_148.xyz*(l9_151+vec3(0.5)))+vec3(1.5));
l9_150=vec4(l9_152.x,l9_152.y,l9_152.z,l9_148.w);
}
#else
{
l9_150=l9_148;
}
#endif
vec3 l9_153=vec3(linearToSrgb(l9_150.x),linearToSrgb(l9_150.y),linearToSrgb(l9_150.z));
l9_20=vec4(l9_153.x,l9_153.y,l9_153.z,l9_150.w);
}
#endif
vec4 l9_154=max(l9_20,vec4(0.0));
int l9_155;
#if (bodyDepthTexHasSwappedViews)
{
l9_155=1-sc_GetStereoViewIndex();
}
#else
{
l9_155=sc_GetStereoViewIndex();
}
#endif
bool l9_156=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_bodyDepthTex)!=0));
float l9_157=l9_5.x;
sc_SoftwareWrapEarly(l9_157,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x);
float l9_158=l9_157;
float l9_159=l9_5.y;
sc_SoftwareWrapEarly(l9_159,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y);
float l9_160=l9_159;
vec2 l9_161;
float l9_162;
#if (SC_USE_UV_MIN_MAX_bodyDepthTex)
{
bool l9_163;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_163=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x==3;
}
#else
{
l9_163=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_164=l9_158;
float l9_165=1.0;
sc_ClampUV(l9_164,bodyDepthTexUvMinMax.x,bodyDepthTexUvMinMax.z,l9_163,l9_165);
float l9_166=l9_164;
float l9_167=l9_165;
bool l9_168;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_168=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y==3;
}
#else
{
l9_168=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_169=l9_160;
float l9_170=l9_167;
sc_ClampUV(l9_169,bodyDepthTexUvMinMax.y,bodyDepthTexUvMinMax.w,l9_168,l9_170);
l9_162=l9_170;
l9_161=vec2(l9_166,l9_169);
}
#else
{
l9_162=1.0;
l9_161=vec2(l9_158,l9_160);
}
#endif
vec2 l9_171=sc_TransformUV(l9_161,(int(SC_USE_UV_TRANSFORM_bodyDepthTex)!=0),bodyDepthTexTransform);
float l9_172=l9_171.x;
float l9_173=l9_162;
sc_SoftwareWrapLate(l9_172,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x,l9_156,l9_173);
float l9_174=l9_171.y;
float l9_175=l9_173;
sc_SoftwareWrapLate(l9_174,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y,l9_156,l9_175);
float l9_176=l9_175;
vec3 l9_177=sc_SamplingCoordsViewToGlobal(vec2(l9_172,l9_174),bodyDepthTexLayout,l9_155);
vec4 l9_178=texture2D(bodyDepthTex,l9_177.xy,0.0);
vec4 l9_179;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_179=mix(bodyDepthTexBorderColor,l9_178,vec4(l9_176));
}
#else
{
l9_179=l9_178;
}
#endif
float l9_180=(l9_179.x*2.0)-1.0;
float l9_181;
if (bodyDepthTexProjectionMatrixTerms.z==0.0)
{
l9_181=(l9_180-bodyDepthTexProjectionMatrixTerms.y)/bodyDepthTexProjectionMatrixTerms.x;
}
else
{
l9_181=bodyDepthTexProjectionMatrixTerms.y/((-l9_180)-bodyDepthTexProjectionMatrixTerms.x);
}
tempGlobals=l9_7;
float l9_182=ssPow((l9_181-(1.0-((sc_Camera.clipPlanes.y*sc_Camera.clipPlanes.x)/(sc_Camera.clipPlanes.y+(gl_FragCoord.z*(sc_Camera.clipPlanes.x-sc_Camera.clipPlanes.y))))))*0.039999999,30.0);
vec4 l9_183;
#if (!((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH))
{
l9_183=l9_154;
}
#else
{
l9_183=mix(l9_154,vec4(l9_154.xyz,1.0-clamp(l9_182,0.0,1.0)),vec4(bodyIntersection));
}
#endif
vec4 l9_184;
#if (sc_ProjectiveShadowsCaster)
{
float l9_185;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_185=l9_183.w;
}
#else
{
float l9_186;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_186=clamp(l9_183.w*2.0,0.0,1.0);
}
#else
{
float l9_187;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_187=clamp(dot(l9_183.xyz,vec3(l9_183.w)),0.0,1.0);
}
#else
{
float l9_188;
#if (sc_BlendMode_AlphaTest)
{
l9_188=1.0;
}
#else
{
float l9_189;
#if (sc_BlendMode_Multiply)
{
l9_189=(1.0-dot(l9_183.xyz,vec3(0.33333001)))*l9_183.w;
}
#else
{
float l9_190;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_190=(1.0-clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0))*l9_183.w;
}
#else
{
float l9_191;
#if (sc_BlendMode_ColoredGlass)
{
l9_191=clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0)*l9_183.w;
}
#else
{
float l9_192;
#if (sc_BlendMode_Add)
{
l9_192=clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_193;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_193=clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0)*l9_183.w;
}
#else
{
float l9_194;
#if (sc_BlendMode_Screen)
{
l9_194=dot(l9_183.xyz,vec3(0.33333001))*l9_183.w;
}
#else
{
float l9_195;
#if (sc_BlendMode_Min)
{
l9_195=1.0-clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_196;
#if (sc_BlendMode_Max)
{
l9_196=clamp(dot(l9_183.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_196=1.0;
}
#endif
l9_195=l9_196;
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
l9_184=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_183.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_185);
}
#else
{
vec4 l9_197;
#if (sc_RenderAlphaToColor)
{
l9_197=vec4(l9_183.w);
}
#else
{
vec4 l9_198;
#if (sc_BlendMode_Custom)
{
vec3 l9_199=sc_GetFramebufferColor().xyz;
vec3 l9_200=mix(l9_199,definedBlend(l9_199,l9_183.xyz).xyz,vec3(l9_183.w));
vec4 l9_201=vec4(l9_200.x,l9_200.y,l9_200.z,vec4(0.0).w);
l9_201.w=1.0;
l9_198=l9_201;
}
#else
{
vec4 l9_202;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_202=vec4(mix(vec3(1.0),l9_183.xyz,vec3(l9_183.w)),l9_183.w);
}
#else
{
vec4 l9_203;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_204;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_204=clamp(l9_183.w,0.0,1.0);
}
#else
{
l9_204=l9_183.w;
}
#endif
l9_203=vec4(l9_183.xyz*l9_204,l9_204);
}
#else
{
l9_203=l9_183;
}
#endif
l9_202=l9_203;
}
#endif
l9_198=l9_202;
}
#endif
l9_197=l9_198;
}
#endif
l9_184=l9_197;
}
#endif
vec4 l9_205;
if (PreviewEnabled==1)
{
vec4 l9_206;
if (PreviewInfo.Saved)
{
l9_206=PreviewInfo.Color;
}
else
{
l9_206=vec4(0.0);
}
l9_205=l9_206;
}
else
{
l9_205=l9_184;
}
vec4 l9_207;
#if (sc_ShaderComplexityAnalyzer)
{
l9_207=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_207=vec4(0.0);
}
#endif
vec4 l9_208;
if (l9_207.w>0.0)
{
l9_208=l9_207;
}
else
{
l9_208=l9_205;
}
vec4 l9_209=outputMotionVectorsIfNeeded(varPos,max(l9_208,vec4(0.0)));
vec4 l9_210=clamp(l9_209,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_211=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_211-0.0039215689)),min(1.0,l9_211+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_212=sc_ScreenCoordsGlobalToView(l9_4);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_212).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_213=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_212).xy);
float l9_214=packValue(l9_213);
int l9_221=int(l9_210.w*255.0);
float l9_222=packValue(l9_221);
sc_writeFragData0Internal(vec4(packValue(l9_213),packValue(l9_213),packValue(l9_213),packValue(l9_213)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_214,packValue(l9_213),packValue(l9_213),packValue(l9_213)));
sc_writeFragData2(vec4(l9_222,packValue(l9_221),packValue(l9_221),packValue(l9_221)));
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
vec2 l9_225=sc_ScreenCoordsGlobalToView(l9_4);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_225).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_226[8];
int l9_227[8];
int l9_228=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_228<8)
{
l9_226[l9_228]=0;
l9_227[l9_228]=0;
l9_228++;
continue;
}
else
{
break;
}
}
int l9_229;
#if (sc_OITMaxLayers8)
{
l9_229=2;
}
#else
{
l9_229=1;
}
#endif
int l9_230=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_230<l9_229)
{
vec4 l9_231;
vec4 l9_232;
vec4 l9_233;
if (l9_230==0)
{
l9_233=texture2D(sc_OITAlpha0,l9_225);
l9_232=texture2D(sc_OITDepthLow0,l9_225);
l9_231=texture2D(sc_OITDepthHigh0,l9_225);
}
else
{
l9_233=vec4(0.0);
l9_232=vec4(0.0);
l9_231=vec4(0.0);
}
vec4 l9_234;
vec4 l9_235;
vec4 l9_236;
if (l9_230==1)
{
l9_236=texture2D(sc_OITAlpha1,l9_225);
l9_235=texture2D(sc_OITDepthLow1,l9_225);
l9_234=texture2D(sc_OITDepthHigh1,l9_225);
}
else
{
l9_236=l9_233;
l9_235=l9_232;
l9_234=l9_231;
}
if (any(notEqual(l9_234,vec4(0.0)))||any(notEqual(l9_235,vec4(0.0))))
{
int l9_237[8]=l9_226;
unpackValues(l9_234.w,l9_230,l9_237);
unpackValues(l9_234.z,l9_230,l9_237);
unpackValues(l9_234.y,l9_230,l9_237);
unpackValues(l9_234.x,l9_230,l9_237);
unpackValues(l9_235.w,l9_230,l9_237);
unpackValues(l9_235.z,l9_230,l9_237);
unpackValues(l9_235.y,l9_230,l9_237);
unpackValues(l9_235.x,l9_230,l9_237);
int l9_246[8]=l9_227;
unpackValues(l9_236.w,l9_230,l9_246);
unpackValues(l9_236.z,l9_230,l9_246);
unpackValues(l9_236.y,l9_230,l9_246);
unpackValues(l9_236.x,l9_230,l9_246);
}
l9_230++;
continue;
}
else
{
break;
}
}
vec4 l9_251=texture2D(sc_OITFilteredDepthBoundsTexture,l9_225);
vec2 l9_252=l9_251.xy;
int l9_253;
#if (sc_SkinBonesCount>0)
{
l9_253=encodeDepth(((1.0-l9_251.x)*1000.0)+getDepthOrderingEpsilon(),l9_252);
}
#else
{
l9_253=0;
}
#endif
int l9_254=encodeDepth(viewSpaceDepth(),l9_252);
vec4 l9_255;
l9_255=l9_210*l9_210.w;
vec4 l9_256;
int l9_257=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_257<8)
{
int l9_258=l9_226[l9_257];
int l9_259=l9_254-l9_253;
bool l9_260=l9_258<l9_259;
bool l9_261;
if (l9_260)
{
l9_261=l9_226[l9_257]>0;
}
else
{
l9_261=l9_260;
}
if (l9_261)
{
vec3 l9_262=l9_255.xyz*(1.0-(float(l9_227[l9_257])/255.0));
l9_256=vec4(l9_262.x,l9_262.y,l9_262.z,l9_255.w);
}
else
{
l9_256=l9_255;
}
l9_255=l9_256;
l9_257++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_255,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_210,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_209,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
