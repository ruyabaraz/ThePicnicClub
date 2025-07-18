//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(100)
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
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler colorrampTexSmpSC 2:21
//sampler sampler intensityTextureSmpSC 2:22
//sampler sampler mainTexSmpSC 2:23
//sampler sampler renderTarget0SmpSC 2:24
//sampler sampler renderTarget1SmpSC 2:25
//sampler sampler renderTarget2SmpSC 2:26
//sampler sampler renderTarget3SmpSC 2:27
//sampler sampler sc_OITCommonSampler 2:30
//sampler sampler sc_ScreenTextureSmpSC 2:32
//texture texture2D colorrampTex 2:0:2:21
//texture texture2D intensityTexture 2:1:2:22
//texture texture2D mainTex 2:2:2:23
//texture texture2D renderTarget0 2:3:2:24
//texture texture2D renderTarget1 2:4:2:25
//texture texture2D renderTarget2 2:5:2:26
//texture texture2D renderTarget3 2:6:2:27
//texture texture2D sc_OITAlpha0 2:9:2:30
//texture texture2D sc_OITAlpha1 2:10:2:30
//texture texture2D sc_OITDepthHigh0 2:11:2:30
//texture texture2D sc_OITDepthHigh1 2:12:2:30
//texture texture2D sc_OITDepthLow0 2:13:2:30
//texture texture2D sc_OITDepthLow1 2:14:2:30
//texture texture2D sc_OITFilteredDepthBoundsTexture 2:15:2:30
//texture texture2D sc_OITFrontDepthTexture 2:16:2:30
//texture texture2D sc_ScreenTexture 2:18:2:32
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#define SC_ENABLE_INSTANCED_RENDERING
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
struct ssParticle
{
vec3 Position;
vec3 Velocity;
vec4 Color;
float Size;
float Age;
float Life;
float Mass;
mat3 Matrix;
vec4 Quaternion;
float Dead;
float SpawnOffset;
float Seed;
vec2 Seed2000;
float TimeShift;
int Index1D;
float Coord1D;
float Ratio1D;
ivec2 Index2D;
vec2 Coord2D;
vec2 Ratio2D;
vec3 Force;
bool Spawned;
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
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
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
#ifndef STD_DISABLE_VERTEX_TEXTURE0
#define STD_DISABLE_VERTEX_TEXTURE0 0
#elif STD_DISABLE_VERTEX_TEXTURE0==1
#undef STD_DISABLE_VERTEX_TEXTURE0
#define STD_DISABLE_VERTEX_TEXTURE0 1
#endif
#ifndef STD_DISABLE_VERTEX_TEXTURE1
#define STD_DISABLE_VERTEX_TEXTURE1 0
#elif STD_DISABLE_VERTEX_TEXTURE1==1
#undef STD_DISABLE_VERTEX_TEXTURE1
#define STD_DISABLE_VERTEX_TEXTURE1 1
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
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 0
#elif SC_USE_UV_TRANSFORM_renderTarget0==1
#undef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget0 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget0 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 0
#elif SC_USE_UV_MIN_MAX_renderTarget0==1
#undef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget0==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 0
#elif SC_USE_UV_TRANSFORM_renderTarget1==1
#undef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 0
#elif SC_USE_UV_MIN_MAX_renderTarget1==1
#undef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget1==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 0
#elif SC_USE_UV_TRANSFORM_renderTarget2==1
#undef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget2 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget2 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 0
#elif SC_USE_UV_MIN_MAX_renderTarget2==1
#undef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget2==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 0
#elif SC_USE_UV_TRANSFORM_renderTarget3==1
#undef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget3 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget3 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 0
#elif SC_USE_UV_MIN_MAX_renderTarget3==1
#undef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget3==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
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
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform vec4 sc_SSAOTextureDims;
uniform bool receivesRayTracedReflections;
uniform bool isProxyMode;
uniform bool receivesRayTracedShadows;
uniform bool receivesRayTracedDiffuseIndirect;
uniform bool receivesRayTracedAo;
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform float sc_DisableFrustumCullingMarker;
uniform mat3 sc_NormalMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 intensityTextureDims;
uniform vec4 renderTarget0Dims;
uniform vec4 renderTarget1Dims;
uniform vec4 renderTarget2Dims;
uniform vec4 renderTarget3Dims;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform vec4 sc_Time;
uniform int vfxOffsetInstances;
uniform int ssTARGET_WIDTH_INT;
uniform vec2 ssTARGET_SIZE_FLOAT;
uniform mat3 renderTarget0Transform;
uniform vec4 renderTarget0UvMinMax;
uniform vec4 renderTarget0BorderColor;
uniform mat3 renderTarget1Transform;
uniform vec4 renderTarget1UvMinMax;
uniform vec4 renderTarget1BorderColor;
uniform mat3 renderTarget2Transform;
uniform vec4 renderTarget2UvMinMax;
uniform vec4 renderTarget2BorderColor;
uniform mat3 renderTarget3Transform;
uniform vec4 renderTarget3UvMinMax;
uniform vec4 renderTarget3BorderColor;
uniform vec4 mainTexDims;
uniform vec4 colorrampTexDims;
uniform float _sc_allow16TexturesMarker;
uniform float overrideTimeDelta;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_UniformConstants;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelMatrixInverse;
uniform mat3 sc_NormalMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform vec4 sc_WindowToViewportTransform;
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float shaderComplexityValue;
uniform vec4 weights2;
uniform int sc_FallbackInstanceID;
uniform float _sc_framebufferFetchMarker;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform vec4 sc_SSAOTextureSize;
uniform vec4 sc_SSAOTextureView;
uniform mat3 sc_SSAOTextureTransform;
uniform vec4 sc_SSAOTextureUvMinMax;
uniform vec4 sc_SSAOTextureBorderColor;
uniform float correctedIntensity;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform vec4 renderTarget0Size;
uniform vec4 renderTarget0View;
uniform vec4 renderTarget1Size;
uniform vec4 renderTarget1View;
uniform vec4 renderTarget2Size;
uniform vec4 renderTarget2View;
uniform vec4 renderTarget3Size;
uniform vec4 renderTarget3View;
uniform vec3 vfxLocalAabbMin;
uniform vec3 vfxWorldAabbMin;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxWorldAabbMax;
uniform float vfxCameraAspect;
uniform float vfxCameraNear;
uniform float vfxCameraFar;
uniform vec3 vfxCameraUp;
uniform vec3 vfxCameraForward;
uniform vec3 vfxCameraRight;
uniform mat4 vfxModelMatrix;
uniform mat4 vfxModelMatrixInverse;
uniform mat4 vfxModelViewMatrix;
uniform mat4 vfxModelViewMatrixInverse;
uniform mat4 vfxProjectionMatrix;
uniform mat4 vfxProjectionMatrixInverse;
uniform mat4 vfxModelViewProjectionMatrix;
uniform mat4 vfxModelViewProjectionMatrixInverse;
uniform mat4 vfxViewMatrix;
uniform mat4 vfxViewMatrixInverse;
uniform mat4 vfxViewProjectionMatrix;
uniform mat4 vfxViewProjectionMatrixInverse;
uniform int vfxFrame;
uniform vec2 ssTARGET_SIZE_INT;
uniform float ssTARGET_WIDTH;
uniform vec4 mainTexSize;
uniform vec4 mainTexView;
uniform mat3 mainTexTransform;
uniform vec4 mainTexUvMinMax;
uniform vec4 mainTexBorderColor;
uniform vec4 colorrampTexSize;
uniform vec4 colorrampTexView;
uniform mat3 colorrampTexTransform;
uniform vec4 colorrampTexUvMinMax;
uniform vec4 colorrampTexBorderColor;
uniform float Port_AlphaTestThreshold_N039;
uniform vec2 Port_SpriteCount_N048;
uniform float Port_MaxFrames_N048;
uniform float Port_Input1_N047;
uniform float Port_Speed_N048;
uniform float Port_SecondOffset_N048;
uniform float Port_Multiplier_N051;
uniform float Port_Import_N262;
uniform float Port_Value2_N263;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
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
flat varying int Interp_Particle_Index;
varying vec3 Interp_Particle_Force;
varying float Interp_Particle_Size;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying mat3 Interp_Particle_Matrix;
varying vec4 Interp_Particle_Color;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Dead;
attribute vec3 positionNext;
attribute vec3 positionPrevious;
attribute vec4 strandProperties;
varying vec4 varColor;
varying vec2 Interp_Particle_Coord;
varying float gParticlesDebug;
varying vec2 ParticleUV;
ssParticle gParticle;
int sc_GetLocalInstanceID()
{
#ifdef sc_LocalInstanceID
    return sc_LocalInstanceID;
#else
    return 0;
#endif
}
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void sc_SetClipDistance(float dstClipDistance)
{
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(dstClipDistance);
}
#else
{
varClipDistance=dstClipDistance;
}
#endif
}
void sc_SetClipDistance(vec4 clipPosition)
{
#if (sc_StereoRenderingMode==1)
{
sc_SetClipDistance(dot(clipPosition,sc_StereoClipPlanes[sc_StereoViewID]));
}
#endif
}
void sc_SetClipPosition(vec4 clipPosition)
{
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
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
int renderTarget0GetStereoViewIndex()
{
int l9_0;
#if (renderTarget0HasSwappedViews)
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
float l9_1=step(abs(value-l9_0),1e-05);
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
vec4 sc_InternalTextureLevel(vec2 texSize,vec2 uv,float level_,sampler2D texsmp)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=texture2DLod(texsmp,uv,level_);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 sc_SampleViewLevel(vec2 texSize,vec2 uv,int renderingLayout,int viewIndex,float level,sampler2D texsmp)
{
return sc_InternalTextureLevel(texSize,sc_SamplingCoordsViewToGlobal(uv,renderingLayout,viewIndex).xy,level,texsmp);
}
vec4 sc_SampleTextureLevel(vec2 samplerDims,int renderingLayout,int viewIndex,vec2 uv,bool useUvTransform,mat3 uvTransform,ivec2 softwareWrapModes,bool useUvMinMax,vec4 uvMinMax,bool useClampToBorder,vec4 borderColor,float level,sampler2D texture_sampler_)
{
bool l9_0=useClampToBorder;
bool l9_1=useUvMinMax;
bool l9_2=l9_0&&(!l9_1);
sc_SoftwareWrapEarly(uv.x,softwareWrapModes.x);
sc_SoftwareWrapEarly(uv.y,softwareWrapModes.y);
float l9_3;
if (useUvMinMax)
{
bool l9_4=useClampToBorder;
bool l9_5;
if (l9_4)
{
l9_5=softwareWrapModes.x==3;
}
else
{
l9_5=l9_4;
}
float param_8=1.0;
sc_ClampUV(uv.x,uvMinMax.x,uvMinMax.z,l9_5,param_8);
float l9_6=param_8;
bool l9_7=useClampToBorder;
bool l9_8;
if (l9_7)
{
l9_8=softwareWrapModes.y==3;
}
else
{
l9_8=l9_7;
}
float param_13=l9_6;
sc_ClampUV(uv.y,uvMinMax.y,uvMinMax.w,l9_8,param_13);
l9_3=param_13;
}
else
{
l9_3=1.0;
}
uv=sc_TransformUV(uv,useUvTransform,uvTransform);
float param_20=l9_3;
sc_SoftwareWrapLate(uv.x,softwareWrapModes.x,l9_2,param_20);
sc_SoftwareWrapLate(uv.y,softwareWrapModes.y,l9_2,param_20);
float l9_9=param_20;
vec4 l9_10=sc_SampleViewLevel(samplerDims,uv,renderingLayout,viewIndex,level,texture_sampler_);
vec4 l9_11;
if (useClampToBorder)
{
l9_11=mix(borderColor,l9_10,vec4(l9_9));
}
else
{
l9_11=l9_10;
}
return l9_11;
}
int renderTarget1GetStereoViewIndex()
{
int l9_0;
#if (renderTarget1HasSwappedViews)
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
int renderTarget2GetStereoViewIndex()
{
int l9_0;
#if (renderTarget2HasSwappedViews)
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
int renderTarget3GetStereoViewIndex()
{
int l9_0;
#if (renderTarget3HasSwappedViews)
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
float DecodeFloat32(vec4 rgba,bool Quantize)
{
if (Quantize)
{
rgba=floor((rgba*255.0)+vec4(0.5))*vec4(0.00392157);
}
return dot(rgba,vec4(1.0,0.00392157,1.53787e-05,6.03086e-08));
}
void ssDecodeParticle(int InstanceID)
{
gParticle.Position=vec3(0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(0.0);
gParticle.Size=0.0;
gParticle.Age=0.0;
gParticle.Life=0.0;
gParticle.Mass=1.0;
gParticle.Quaternion=vec4(0.0);
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
int l9_0=InstanceID;
ivec2 l9_1=ivec2(l9_0%341,l9_0/341);
float l9_2=float(l9_0);
vec2 l9_3=vec2(l9_1);
float l9_4=l9_2*0.000111123;
float l9_5;
if (overrideTimeEnabled==1)
{
l9_5=overrideTimeElapsed;
}
else
{
l9_5=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,gParticle.Quaternion,gParticle.Dead,l9_4,fract(abs(((l9_2*0.000108499)+0.151235)+(floor((l9_5-l9_4)+2.0)*4.32723))),(vec2(ivec2(l9_0%400,l9_0/400))+vec2(1.0))*vec2(0.00250627),floor(fract(sin(dot(vec2(l9_4)*vec2(0.3452,0.52254),vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001,l9_0,(l9_2+0.5)*0.000111111,l9_4,l9_1,(l9_3+vec2(0.5))*vec2(0.00293255,0.037037),l9_3*vec2(0.00294118,0.0384615),vec3(0.0),false);
int l9_6=(vfxOffsetInstances+InstanceID)*6;
int l9_7=l9_6/ssTARGET_WIDTH_INT;
vec2 l9_8=(vec2(ivec2(l9_6-(l9_7*ssTARGET_WIDTH_INT),l9_7))+vec2(0.5))/vec2(2048.0,ssTARGET_SIZE_FLOAT.y);
gParticle.Size=DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*120.001;
gParticle.Life=DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*1.00001;
gParticle.Age=DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*1.00001;
gParticle.Matrix[0].x=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*200.002);
vec2 l9_9=l9_8+vec2(0.000488281,0.0);
gParticle.Matrix[0].y=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_9,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*200.002);
gParticle.Matrix[0].z=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_9,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*200.002);
gParticle.Matrix[1].x=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_9,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*200.002);
gParticle.Matrix[1].y=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_9,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*200.002);
vec2 l9_10=l9_8+vec2(0.000976562,0.0);
gParticle.Matrix[1].z=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*200.002);
gParticle.Matrix[2].x=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*200.002);
gParticle.Matrix[2].y=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*200.002);
gParticle.Matrix[2].z=(-100.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*200.002);
vec2 l9_11=l9_8+vec2(0.00146484,0.0);
gParticle.Color.x=DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_11,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*1.00001;
gParticle.Color.y=DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_11,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*1.00001;
gParticle.Color.z=DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_11,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*1.00001;
gParticle.Color.w=DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_11,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*1.00001;
vec2 l9_12=l9_8+vec2(0.00195312,0.0);
gParticle.Position.x=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_12,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*2000.02);
gParticle.Position.y=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_12,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*2000.02);
gParticle.Position.z=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_12,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*2000.02);
gParticle.Velocity.x=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_12,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*2000.02);
vec2 l9_13=l9_8+vec2(0.00244141,0.0);
gParticle.Velocity.y=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_13,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*2000.02);
gParticle.Velocity.z=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_13,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*2000.02);
gParticle.Dead=floor((sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_13,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2).x*255.0)+0.5);
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.0005;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.0005;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.0005;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.0005;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.0005;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.0005;
}
void main()
{
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
#if (!STD_DISABLE_VERTEX_TEXTURE0)
{
l9_2=texture0;
}
#else
{
l9_2=vec2(0.0);
}
#endif
vec2 l9_3;
#if (!STD_DISABLE_VERTEX_TEXTURE1)
{
l9_3=texture1;
}
#else
{
l9_3=vec2(0.0);
}
#endif
vec4 l9_4;
#if (sc_IsEditor)
{
vec4 l9_5=l9_0;
l9_5.x=l9_0.x+_sc_allow16TexturesMarker;
l9_4=l9_5;
}
#else
{
l9_4=l9_0;
}
#endif
int l9_6=sc_GetLocalInstanceID();
if (l9_6>=9000)
{
sc_SetClipPosition(vec4(0.0));
return;
}
ssDecodeParticle(l9_6);
float l9_7=gParticle.Dead;
bool l9_8=l9_7>16.0;
bool l9_9;
if (!l9_8)
{
l9_9=gParticle.Size<1e-05;
}
else
{
l9_9=l9_8;
}
bool l9_10;
if (!l9_9)
{
l9_10=gParticle.Age>=gParticle.Life;
}
else
{
l9_10=l9_9;
}
if (l9_10)
{
sc_SetClipPosition(vec4(0.0));
return;
}
gParticle.Position=(sc_ModelMatrix*vec4(gParticle.Position,1.0)).xyz;
mat3 l9_11=mat3(sc_ModelMatrix[0].xyz,sc_ModelMatrix[1].xyz,sc_ModelMatrix[2].xyz);
gParticle.Velocity=l9_11*gParticle.Velocity;
gParticle.Force=l9_11*gParticle.Force;
gParticle.Matrix=l9_11*gParticle.Matrix;
varPos=gParticle.Position+(gParticle.Matrix*vec3(l9_4.x*gParticle.Size,l9_4.y*gParticle.Size,0.0));
varNormal=gParticle.Matrix*vec3(0.0,0.0,1.0);
vec3 l9_12=gParticle.Matrix*vec3(1.0,0.0,0.0);
varTangent=vec4(l9_12.x,l9_12.y,l9_12.z,varTangent.w);
varTangent.w=1.0;
varPackedTex=vec4(l9_2,l9_3);
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_13=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
varViewSpaceDepth=-l9_13.z;
sc_SetClipPosition(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_13);
}
#else
{
sc_SetClipPosition(sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0));
}
#endif
Interp_Particle_Index=sc_GetLocalInstanceID();
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Matrix=gParticle.Matrix;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Dead=gParticle.Dead;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#define SC_ENABLE_INSTANCED_RENDERING
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
        #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&!sc_StereoRendering_IsClipDistanceEnabled
            #define sc_StereoFragmentMain main
            #define sc_MainInjector MAIN(); void sc_MainInjected
        #else
            #define MAIN sc_MainInjector
        #endif
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
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
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
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 0
#elif SC_USE_UV_TRANSFORM_renderTarget0==1
#undef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget0 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget0 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 0
#elif SC_USE_UV_MIN_MAX_renderTarget0==1
#undef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget0==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 0
#elif SC_USE_UV_TRANSFORM_renderTarget1==1
#undef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 0
#elif SC_USE_UV_MIN_MAX_renderTarget1==1
#undef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget1==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 0
#elif SC_USE_UV_TRANSFORM_renderTarget2==1
#undef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget2 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget2 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 0
#elif SC_USE_UV_MIN_MAX_renderTarget2==1
#undef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget2==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 0
#elif SC_USE_UV_TRANSFORM_renderTarget3==1
#undef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget3 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget3 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 0
#elif SC_USE_UV_MIN_MAX_renderTarget3==1
#undef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget3==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 1
#endif
#ifndef mainTexHasSwappedViews
#define mainTexHasSwappedViews 0
#elif mainTexHasSwappedViews==1
#undef mainTexHasSwappedViews
#define mainTexHasSwappedViews 1
#endif
#ifndef mainTexLayout
#define mainTexLayout 0
#endif
#ifndef colorrampTexHasSwappedViews
#define colorrampTexHasSwappedViews 0
#elif colorrampTexHasSwappedViews==1
#undef colorrampTexHasSwappedViews
#define colorrampTexHasSwappedViews 1
#endif
#ifndef colorrampTexLayout
#define colorrampTexLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_mainTex
#define SC_USE_UV_TRANSFORM_mainTex 0
#elif SC_USE_UV_TRANSFORM_mainTex==1
#undef SC_USE_UV_TRANSFORM_mainTex
#define SC_USE_UV_TRANSFORM_mainTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_mainTex
#define SC_SOFTWARE_WRAP_MODE_U_mainTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_mainTex
#define SC_SOFTWARE_WRAP_MODE_V_mainTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_mainTex
#define SC_USE_UV_MIN_MAX_mainTex 0
#elif SC_USE_UV_MIN_MAX_mainTex==1
#undef SC_USE_UV_MIN_MAX_mainTex
#define SC_USE_UV_MIN_MAX_mainTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_mainTex
#define SC_USE_CLAMP_TO_BORDER_mainTex 0
#elif SC_USE_CLAMP_TO_BORDER_mainTex==1
#undef SC_USE_CLAMP_TO_BORDER_mainTex
#define SC_USE_CLAMP_TO_BORDER_mainTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_colorrampTex
#define SC_USE_UV_TRANSFORM_colorrampTex 0
#elif SC_USE_UV_TRANSFORM_colorrampTex==1
#undef SC_USE_UV_TRANSFORM_colorrampTex
#define SC_USE_UV_TRANSFORM_colorrampTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_colorrampTex
#define SC_SOFTWARE_WRAP_MODE_U_colorrampTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_colorrampTex
#define SC_SOFTWARE_WRAP_MODE_V_colorrampTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_colorrampTex
#define SC_USE_UV_MIN_MAX_colorrampTex 0
#elif SC_USE_UV_MIN_MAX_colorrampTex==1
#undef SC_USE_UV_MIN_MAX_colorrampTex
#define SC_USE_UV_MIN_MAX_colorrampTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_colorrampTex
#define SC_USE_CLAMP_TO_BORDER_colorrampTex 0
#elif SC_USE_CLAMP_TO_BORDER_colorrampTex==1
#undef SC_USE_CLAMP_TO_BORDER_colorrampTex
#define SC_USE_CLAMP_TO_BORDER_colorrampTex 1
#endif
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
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
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform vec4 sc_SSAOTextureDims;
uniform bool receivesRayTracedReflections;
uniform bool isProxyMode;
uniform bool receivesRayTracedShadows;
uniform bool receivesRayTracedDiffuseIndirect;
uniform bool receivesRayTracedAo;
uniform vec4 sc_WindowToViewportTransform;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform float shaderComplexityValue;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_SSAOTextureTransform;
uniform vec4 sc_SSAOTextureUvMinMax;
uniform vec4 sc_SSAOTextureBorderColor;
uniform vec4 intensityTextureDims;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform vec4 renderTarget0Dims;
uniform vec4 renderTarget1Dims;
uniform vec4 renderTarget2Dims;
uniform vec4 renderTarget3Dims;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform vec4 sc_Time;
uniform int vfxOffsetInstances;
uniform int ssTARGET_WIDTH_INT;
uniform vec2 ssTARGET_SIZE_FLOAT;
uniform mat3 renderTarget0Transform;
uniform vec4 renderTarget0UvMinMax;
uniform vec4 renderTarget0BorderColor;
uniform mat3 renderTarget1Transform;
uniform vec4 renderTarget1UvMinMax;
uniform vec4 renderTarget1BorderColor;
uniform mat3 renderTarget2Transform;
uniform vec4 renderTarget2UvMinMax;
uniform vec4 renderTarget2BorderColor;
uniform mat3 renderTarget3Transform;
uniform vec4 renderTarget3UvMinMax;
uniform vec4 renderTarget3BorderColor;
uniform vec4 mainTexDims;
uniform vec4 colorrampTexDims;
uniform mat3 mainTexTransform;
uniform vec4 mainTexUvMinMax;
uniform vec4 mainTexBorderColor;
uniform float overrideTimeDelta;
uniform float Port_Input1_N047;
uniform vec2 Port_SpriteCount_N048;
uniform float Port_MaxFrames_N048;
uniform float Port_Speed_N048;
uniform float Port_SecondOffset_N048;
uniform float Port_Multiplier_N051;
uniform float Port_Value2_N263;
uniform mat3 colorrampTexTransform;
uniform vec4 colorrampTexUvMinMax;
uniform vec4 colorrampTexBorderColor;
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_UniformConstants;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform mat3 sc_NormalMatrix;
uniform mat3 sc_NormalMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectorMatrix;
uniform float sc_DisableFrustumCullingMarker;
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform vec4 weights2;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform int sc_FallbackInstanceID;
uniform vec2 sc_TAAJitterOffset;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform vec4 sc_SSAOTextureSize;
uniform vec4 sc_SSAOTextureView;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform vec4 renderTarget0Size;
uniform vec4 renderTarget0View;
uniform vec4 renderTarget1Size;
uniform vec4 renderTarget1View;
uniform vec4 renderTarget2Size;
uniform vec4 renderTarget2View;
uniform vec4 renderTarget3Size;
uniform vec4 renderTarget3View;
uniform float _sc_allow16TexturesMarker;
uniform vec3 vfxLocalAabbMin;
uniform vec3 vfxWorldAabbMin;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxWorldAabbMax;
uniform float vfxCameraAspect;
uniform float vfxCameraNear;
uniform float vfxCameraFar;
uniform vec3 vfxCameraUp;
uniform vec3 vfxCameraForward;
uniform vec3 vfxCameraRight;
uniform mat4 vfxModelMatrix;
uniform mat4 vfxModelMatrixInverse;
uniform mat4 vfxModelViewMatrix;
uniform mat4 vfxModelViewMatrixInverse;
uniform mat4 vfxProjectionMatrix;
uniform mat4 vfxProjectionMatrixInverse;
uniform mat4 vfxModelViewProjectionMatrix;
uniform mat4 vfxModelViewProjectionMatrixInverse;
uniform mat4 vfxViewMatrix;
uniform mat4 vfxViewMatrixInverse;
uniform mat4 vfxViewProjectionMatrix;
uniform mat4 vfxViewProjectionMatrixInverse;
uniform int vfxFrame;
uniform vec2 ssTARGET_SIZE_INT;
uniform float ssTARGET_WIDTH;
uniform vec4 mainTexSize;
uniform vec4 mainTexView;
uniform vec4 colorrampTexSize;
uniform vec4 colorrampTexView;
uniform float Port_AlphaTestThreshold_N039;
uniform float Port_Import_N262;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
uniform sampler2D mainTex;
uniform sampler2D colorrampTex;
uniform sampler2D sc_ScreenTexture;
uniform sampler2D intensityTexture;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float varViewSpaceDepth;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying float Interp_Particle_Size;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying mat3 Interp_Particle_Matrix;
varying vec4 Interp_Particle_Color;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Dead;
flat varying int Interp_Particle_Index;
varying vec3 varPos;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
varying vec3 Interp_Particle_Force;
varying vec2 Interp_Particle_Coord;
varying float gParticlesDebug;
varying vec2 ParticleUV;
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
float l9_1=step(abs(value-l9_0),1e-05);
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
vec4 sc_InternalTextureLevel(vec2 texSize,vec2 uv,float level_,sampler2D texsmp)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=texture2DLod(texsmp,uv,level_);
}
#else
{
vec4 l9_1;
#if (sc_CanUseStandardDerivatives)
{
l9_1=texture2D(texsmp,uv,sc_InternalCalculateSampleBias(texSize,uv,level_));
}
#else
{
l9_1=vec4(0.0);
}
#endif
l9_0=l9_1;
}
#endif
return l9_0;
}
vec4 sc_SampleViewLevel(vec2 texSize,vec2 uv,int renderingLayout,int viewIndex,float level,sampler2D texsmp)
{
return sc_InternalTextureLevel(texSize,sc_SamplingCoordsViewToGlobal(uv,renderingLayout,viewIndex).xy,level,texsmp);
}
vec4 sc_SampleTextureLevel(vec2 samplerDims,int renderingLayout,int viewIndex,vec2 uv,bool useUvTransform,mat3 uvTransform,ivec2 softwareWrapModes,bool useUvMinMax,vec4 uvMinMax,bool useClampToBorder,vec4 borderColor,float level,sampler2D texture_sampler_)
{
bool l9_0=useClampToBorder;
bool l9_1=useUvMinMax;
bool l9_2=l9_0&&(!l9_1);
sc_SoftwareWrapEarly(uv.x,softwareWrapModes.x);
sc_SoftwareWrapEarly(uv.y,softwareWrapModes.y);
float l9_3;
if (useUvMinMax)
{
bool l9_4=useClampToBorder;
bool l9_5;
if (l9_4)
{
l9_5=softwareWrapModes.x==3;
}
else
{
l9_5=l9_4;
}
float param_8=1.0;
sc_ClampUV(uv.x,uvMinMax.x,uvMinMax.z,l9_5,param_8);
float l9_6=param_8;
bool l9_7=useClampToBorder;
bool l9_8;
if (l9_7)
{
l9_8=softwareWrapModes.y==3;
}
else
{
l9_8=l9_7;
}
float param_13=l9_6;
sc_ClampUV(uv.y,uvMinMax.y,uvMinMax.w,l9_8,param_13);
l9_3=param_13;
}
else
{
l9_3=1.0;
}
uv=sc_TransformUV(uv,useUvTransform,uvTransform);
float param_20=l9_3;
sc_SoftwareWrapLate(uv.x,softwareWrapModes.x,l9_2,param_20);
sc_SoftwareWrapLate(uv.y,softwareWrapModes.y,l9_2,param_20);
float l9_9=param_20;
vec4 l9_10=sc_SampleViewLevel(samplerDims,uv,renderingLayout,viewIndex,level,texture_sampler_);
vec4 l9_11;
if (useClampToBorder)
{
l9_11=mix(borderColor,l9_10,vec4(l9_9));
}
else
{
l9_11=l9_10;
}
return l9_11;
}
vec4 sc_SampleView(vec2 texSize,vec2 uv,int renderingLayout,int viewIndex,float bias,sampler2D texsmp)
{
return texture2D(texsmp,sc_SamplingCoordsViewToGlobal(uv,renderingLayout,viewIndex).xy,bias);
}
vec4 sc_SampleTextureBiasOrLevel(vec2 samplerDims,int renderingLayout,int viewIndex,vec2 uv,bool useUvTransform,mat3 uvTransform,ivec2 softwareWrapModes,bool useUvMinMax,vec4 uvMinMax,bool useClampToBorder,vec4 borderColor,float biasOrLevel,sampler2D texture_sampler_)
{
bool l9_0=useClampToBorder;
bool l9_1=useUvMinMax;
bool l9_2=l9_0&&(!l9_1);
sc_SoftwareWrapEarly(uv.x,softwareWrapModes.x);
sc_SoftwareWrapEarly(uv.y,softwareWrapModes.y);
float l9_3;
if (useUvMinMax)
{
bool l9_4=useClampToBorder;
bool l9_5;
if (l9_4)
{
l9_5=softwareWrapModes.x==3;
}
else
{
l9_5=l9_4;
}
float param_8=1.0;
sc_ClampUV(uv.x,uvMinMax.x,uvMinMax.z,l9_5,param_8);
float l9_6=param_8;
bool l9_7=useClampToBorder;
bool l9_8;
if (l9_7)
{
l9_8=softwareWrapModes.y==3;
}
else
{
l9_8=l9_7;
}
float param_13=l9_6;
sc_ClampUV(uv.y,uvMinMax.y,uvMinMax.w,l9_8,param_13);
l9_3=param_13;
}
else
{
l9_3=1.0;
}
uv=sc_TransformUV(uv,useUvTransform,uvTransform);
float param_20=l9_3;
sc_SoftwareWrapLate(uv.x,softwareWrapModes.x,l9_2,param_20);
sc_SoftwareWrapLate(uv.y,softwareWrapModes.y,l9_2,param_20);
float l9_9=param_20;
vec4 l9_10=sc_SampleView(samplerDims,uv,renderingLayout,viewIndex,biasOrLevel,texture_sampler_);
vec4 l9_11;
if (useClampToBorder)
{
l9_11=mix(borderColor,l9_10,vec4(l9_9));
}
else
{
l9_11=l9_10;
}
return l9_11;
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
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
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.666667);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.333333);
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
return vec3(l9_0.x,l9_1/(1.0-abs((2.0*l9_2)-1.0)),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
float transformSingleColor(float original,float intMap,float target)
{
float l9_0;
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
l9_0=original/pow(1.0-target,intMap);
}
#else
{
float l9_1;
#if (BLEND_MODE_DIVISION)
{
l9_1=original/(1.0-target);
}
#else
{
float l9_2;
#if (BLEND_MODE_BRIGHT)
{
l9_2=original/pow(1.0-target,2.0-(2.0*original));
}
#else
{
l9_2=0.0;
}
#endif
l9_1=l9_2;
}
#endif
l9_0=l9_1;
}
#endif
return l9_0;
}
vec3 definedBlend(vec3 a,vec3 b)
{
vec3 l9_0;
#if (BLEND_MODE_LIGHTEN)
{
l9_0=max(a,b);
}
#else
{
vec3 l9_1;
#if (BLEND_MODE_DARKEN)
{
l9_1=min(a,b);
}
#else
{
vec3 l9_2;
#if (BLEND_MODE_DIVIDE)
{
l9_2=b/a;
}
#else
{
vec3 l9_3;
#if (BLEND_MODE_AVERAGE)
{
l9_3=(a+b)*0.5;
}
#else
{
vec3 l9_4;
#if (BLEND_MODE_SUBTRACT)
{
l9_4=max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
vec3 l9_5;
#if (BLEND_MODE_DIFFERENCE)
{
l9_5=abs(a-b);
}
#else
{
vec3 l9_6;
#if (BLEND_MODE_NEGATION)
{
l9_6=vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
vec3 l9_7;
#if (BLEND_MODE_EXCLUSION)
{
l9_7=(a+b)-((a*2.0)*b);
}
#else
{
vec3 l9_8;
#if (BLEND_MODE_OVERLAY)
{
float l9_9;
if (a.x<0.5)
{
l9_9=(2.0*a.x)*b.x;
}
else
{
l9_9=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_10;
if (a.y<0.5)
{
l9_10=(2.0*a.y)*b.y;
}
else
{
l9_10=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_11;
if (a.z<0.5)
{
l9_11=(2.0*a.z)*b.z;
}
else
{
l9_11=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
l9_8=vec3(l9_9,l9_10,l9_11);
}
#else
{
vec3 l9_12;
#if (BLEND_MODE_SOFT_LIGHT)
{
l9_12=(((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
vec3 l9_13;
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_14;
if (b.x<0.5)
{
l9_14=(2.0*b.x)*a.x;
}
else
{
l9_14=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_15;
if (b.y<0.5)
{
l9_15=(2.0*b.y)*a.y;
}
else
{
l9_15=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_16;
if (b.z<0.5)
{
l9_16=(2.0*b.z)*a.z;
}
else
{
l9_16=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
l9_13=vec3(l9_14,l9_15,l9_16);
}
#else
{
vec3 l9_17;
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_18;
if (b.x==1.0)
{
l9_18=b.x;
}
else
{
l9_18=min(a.x/(1.0-b.x),1.0);
}
float l9_19;
if (b.y==1.0)
{
l9_19=b.y;
}
else
{
l9_19=min(a.y/(1.0-b.y),1.0);
}
float l9_20;
if (b.z==1.0)
{
l9_20=b.z;
}
else
{
l9_20=min(a.z/(1.0-b.z),1.0);
}
l9_17=vec3(l9_18,l9_19,l9_20);
}
#else
{
vec3 l9_21;
#if (BLEND_MODE_COLOR_BURN)
{
float l9_22;
if (b.x==0.0)
{
l9_22=b.x;
}
else
{
l9_22=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_23;
if (b.y==0.0)
{
l9_23=b.y;
}
else
{
l9_23=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_24;
if (b.z==0.0)
{
l9_24=b.z;
}
else
{
l9_24=max(1.0-((1.0-a.z)/b.z),0.0);
}
l9_21=vec3(l9_22,l9_23,l9_24);
}
#else
{
vec3 l9_25;
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_26;
if (b.x<0.5)
{
l9_26=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_26=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_27;
if (b.y<0.5)
{
l9_27=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_27=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_28;
if (b.z<0.5)
{
l9_28=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_28=min(a.z+(2.0*(b.z-0.5)),1.0);
}
l9_25=vec3(l9_26,l9_27,l9_28);
}
#else
{
vec3 l9_29;
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_30;
if (b.x<0.5)
{
float l9_31;
if ((2.0*b.x)==0.0)
{
l9_31=2.0*b.x;
}
else
{
l9_31=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_30=l9_31;
}
else
{
float l9_32;
if ((2.0*(b.x-0.5))==1.0)
{
l9_32=2.0*(b.x-0.5);
}
else
{
l9_32=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_30=l9_32;
}
float l9_33;
if (b.y<0.5)
{
float l9_34;
if ((2.0*b.y)==0.0)
{
l9_34=2.0*b.y;
}
else
{
l9_34=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.y-0.5))==1.0)
{
l9_35=2.0*(b.y-0.5);
}
else
{
l9_35=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_33=l9_35;
}
float l9_36;
if (b.z<0.5)
{
float l9_37;
if ((2.0*b.z)==0.0)
{
l9_37=2.0*b.z;
}
else
{
l9_37=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_36=l9_37;
}
else
{
float l9_38;
if ((2.0*(b.z-0.5))==1.0)
{
l9_38=2.0*(b.z-0.5);
}
else
{
l9_38=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_36=l9_38;
}
l9_29=vec3(l9_30,l9_33,l9_36);
}
#else
{
vec3 l9_39;
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_40;
if (b.x<0.5)
{
l9_40=min(a.x,2.0*b.x);
}
else
{
l9_40=max(a.x,2.0*(b.x-0.5));
}
float l9_41;
if (b.y<0.5)
{
l9_41=min(a.y,2.0*b.y);
}
else
{
l9_41=max(a.y,2.0*(b.y-0.5));
}
float l9_42;
if (b.z<0.5)
{
l9_42=min(a.z,2.0*b.z);
}
else
{
l9_42=max(a.z,2.0*(b.z-0.5));
}
l9_39=vec3(l9_40,l9_41,l9_42);
}
#else
{
vec3 l9_43;
#if (BLEND_MODE_HARD_MIX)
{
float l9_44;
if (b.x<0.5)
{
float l9_45;
if ((2.0*b.x)==0.0)
{
l9_45=2.0*b.x;
}
else
{
l9_45=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_44=l9_45;
}
else
{
float l9_46;
if ((2.0*(b.x-0.5))==1.0)
{
l9_46=2.0*(b.x-0.5);
}
else
{
l9_46=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_44=l9_46;
}
bool l9_47=l9_44<0.5;
float l9_48;
if (b.y<0.5)
{
float l9_49;
if ((2.0*b.y)==0.0)
{
l9_49=2.0*b.y;
}
else
{
l9_49=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_48=l9_49;
}
else
{
float l9_50;
if ((2.0*(b.y-0.5))==1.0)
{
l9_50=2.0*(b.y-0.5);
}
else
{
l9_50=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_48=l9_50;
}
bool l9_51=l9_48<0.5;
float l9_52;
if (b.z<0.5)
{
float l9_53;
if ((2.0*b.z)==0.0)
{
l9_53=2.0*b.z;
}
else
{
l9_53=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_52=l9_53;
}
else
{
float l9_54;
if ((2.0*(b.z-0.5))==1.0)
{
l9_54=2.0*(b.z-0.5);
}
else
{
l9_54=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_52=l9_54;
}
l9_43=vec3(l9_47 ? 0.0 : 1.0,l9_51 ? 0.0 : 1.0,(l9_52<0.5) ? 0.0 : 1.0);
}
#else
{
vec3 l9_55;
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_56;
if (b.x==1.0)
{
l9_56=b.x;
}
else
{
l9_56=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_57;
if (b.y==1.0)
{
l9_57=b.y;
}
else
{
l9_57=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_58;
if (b.z==1.0)
{
l9_58=b.z;
}
else
{
l9_58=min((a.z*a.z)/(1.0-b.z),1.0);
}
l9_55=vec3(l9_56,l9_57,l9_58);
}
#else
{
vec3 l9_59;
#if (BLEND_MODE_HARD_GLOW)
{
float l9_60;
if (a.x==1.0)
{
l9_60=a.x;
}
else
{
l9_60=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_61;
if (a.y==1.0)
{
l9_61=a.y;
}
else
{
l9_61=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_62;
if (a.z==1.0)
{
l9_62=a.z;
}
else
{
l9_62=min((b.z*b.z)/(1.0-a.z),1.0);
}
l9_59=vec3(l9_60,l9_61,l9_62);
}
#else
{
vec3 l9_63;
#if (BLEND_MODE_HARD_PHOENIX)
{
l9_63=(min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
vec3 l9_64;
#if (BLEND_MODE_HUE)
{
l9_64=HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
vec3 l9_65;
#if (BLEND_MODE_SATURATION)
{
vec3 l9_66=RGBToHSL(a);
l9_65=HSLToRGB(vec3(l9_66.x,RGBToHSL(b).y,l9_66.z));
}
#else
{
vec3 l9_67;
#if (BLEND_MODE_COLOR)
{
l9_67=HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
vec3 l9_68;
#if (BLEND_MODE_LUMINOSITY)
{
l9_68=HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_69=a;
vec3 l9_70=b;
float l9_71=((0.299*l9_69.x)+(0.587*l9_69.y))+(0.114*l9_69.z);
int l9_72;
#if (intensityTextureHasSwappedViews)
{
l9_72=1-sc_GetStereoViewIndex();
}
#else
{
l9_72=sc_GetStereoViewIndex();
}
#endif
vec4 l9_73=sc_SampleTextureBiasOrLevel(intensityTextureDims.xy,intensityTextureLayout,l9_72,vec2(pow(l9_71,1.0/correctedIntensity),0.5),(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture),(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0),intensityTextureUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0),intensityTextureBorderColor,0.0,intensityTexture);
float l9_74=(((l9_73.x*256.0)+l9_73.y)+(l9_73.z*0.00390625))*0.0622559;
float l9_75;
#if (BLEND_MODE_FORGRAY)
{
l9_75=max(l9_74,1.0);
}
#else
{
l9_75=l9_74;
}
#endif
float l9_76;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_76=min(l9_75,1.0);
}
#else
{
l9_76=l9_75;
}
#endif
vec3 l9_77;
#if (BLEND_MODE_INTENSE)
{
vec3 l9_78=vec3(0.0);
l9_78.x=l9_70.x;
vec3 l9_79=l9_78;
l9_79.y=l9_70.y;
vec3 l9_80=l9_79;
l9_80.z=RGBToHSL(l9_69).z;
l9_77=HSLToRGB(l9_80);
}
#else
{
vec3 l9_81=vec3(0.0);
l9_81.x=transformSingleColor(l9_71,l9_76,l9_70.x);
vec3 l9_82=l9_81;
l9_82.y=transformSingleColor(l9_71,l9_76,l9_70.y);
vec3 l9_83=l9_82;
l9_83.z=transformSingleColor(l9_71,l9_76,l9_70.z);
l9_77=clamp(l9_83,vec3(0.0),vec3(1.0));
}
#endif
l9_68=l9_77;
}
#endif
l9_67=l9_68;
}
#endif
l9_65=l9_67;
}
#endif
l9_64=l9_65;
}
#endif
l9_63=l9_64;
}
#endif
l9_59=l9_63;
}
#endif
l9_55=l9_59;
}
#endif
l9_43=l9_55;
}
#endif
l9_39=l9_43;
}
#endif
l9_29=l9_39;
}
#endif
l9_25=l9_29;
}
#endif
l9_21=l9_25;
}
#endif
l9_17=l9_21;
}
#endif
l9_13=l9_17;
}
#endif
l9_12=l9_13;
}
#endif
l9_8=l9_12;
}
#endif
l9_7=l9_8;
}
#endif
l9_6=l9_7;
}
#endif
l9_5=l9_6;
}
#endif
l9_4=l9_5;
}
#endif
l9_3=l9_4;
}
#endif
l9_2=l9_3;
}
#endif
l9_1=l9_2;
}
#endif
l9_0=l9_1;
}
#endif
return l9_0;
}
vec4 ngsPixelShader(vec4 result)
{
#if (sc_ProjectiveShadowsCaster)
{
vec4 l9_0=result;
float l9_1;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_1=l9_0.w;
}
#else
{
float l9_2;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_2=clamp(l9_0.w*2.0,0.0,1.0);
}
#else
{
float l9_3;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_3=clamp(dot(l9_0.xyz,vec3(l9_0.w)),0.0,1.0);
}
#else
{
float l9_4;
#if (sc_BlendMode_AlphaTest)
{
l9_4=1.0;
}
#else
{
float l9_5;
#if (sc_BlendMode_Multiply)
{
l9_5=(1.0-dot(l9_0.xyz,vec3(0.33333)))*l9_0.w;
}
#else
{
float l9_6;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_6=(1.0-clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0))*l9_0.w;
}
#else
{
float l9_7;
#if (sc_BlendMode_ColoredGlass)
{
l9_7=clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0)*l9_0.w;
}
#else
{
float l9_8;
#if (sc_BlendMode_Add)
{
l9_8=clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_9;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_9=clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0)*l9_0.w;
}
#else
{
float l9_10;
#if (sc_BlendMode_Screen)
{
l9_10=dot(l9_0.xyz,vec3(0.33333))*l9_0.w;
}
#else
{
float l9_11;
#if (sc_BlendMode_Min)
{
l9_11=1.0-clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_12;
#if (sc_BlendMode_Max)
{
l9_12=clamp(dot(l9_0.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_12=1.0;
}
#endif
l9_11=l9_12;
}
#endif
l9_10=l9_11;
}
#endif
l9_9=l9_10;
}
#endif
l9_8=l9_9;
}
#endif
l9_7=l9_8;
}
#endif
l9_6=l9_7;
}
#endif
l9_5=l9_6;
}
#endif
l9_4=l9_5;
}
#endif
l9_3=l9_4;
}
#endif
l9_2=l9_3;
}
#endif
l9_1=l9_2;
}
#endif
return vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_0.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_1);
}
#else
{
#if (sc_RenderAlphaToColor)
{
return vec4(result.w);
}
#endif
}
#endif
#if (sc_BlendMode_Custom)
{
vec4 l9_13=result;
vec4 l9_14;
#if (sc_FramebufferFetch)
{
vec4 l9_15=sc_readFragData0_Platform();
vec4 l9_16;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_17=l9_15;
l9_17.x=l9_15.x+_sc_framebufferFetchMarker;
l9_16=l9_17;
}
#else
{
l9_16=l9_15;
}
#endif
l9_14=l9_16;
}
#else
{
vec2 l9_18=sc_ScreenCoordsGlobalToView((gl_FragCoord.xy*sc_WindowToViewportTransform.xy)+sc_WindowToViewportTransform.zw);
int l9_19;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_19=1-sc_GetStereoViewIndex();
}
#else
{
l9_19=sc_GetStereoViewIndex();
}
#endif
l9_14=sc_SampleView(sc_ScreenTextureDims.xy,l9_18,sc_ScreenTextureLayout,l9_19,0.0,sc_ScreenTexture);
}
#endif
vec4 l9_20;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_21=l9_14;
l9_21.x=l9_14.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_20=l9_21;
}
#else
{
l9_20=l9_14;
}
#endif
vec3 l9_22=mix(l9_20.xyz,definedBlend(l9_20.xyz,l9_13.xyz).xyz,vec3(l9_13.w));
vec4 l9_23=vec4(l9_22.x,l9_22.y,l9_22.z,vec4(0.0).w);
l9_23.w=1.0;
result=l9_23;
}
#else
{
vec4 l9_24=result;
vec4 l9_25;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_25=vec4(mix(vec3(1.0),l9_24.xyz,vec3(l9_24.w)),l9_24.w);
}
#else
{
vec4 l9_26;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_27;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_27=clamp(l9_24.w,0.0,1.0);
}
#else
{
l9_27=l9_24.w;
}
#endif
l9_26=vec4(l9_24.xyz*l9_27,l9_27);
}
#else
{
l9_26=l9_24;
}
#endif
l9_25=l9_26;
}
#endif
result=l9_25;
}
#endif
return result;
}
void sc_writeFragData0(vec4 col)
{
    sc_FragData0=col;
}
float viewSpaceDepth()
{
float l9_0;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
l9_0=varViewSpaceDepth;
}
#else
{
l9_0=sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
return l9_0;
}
float getFrontLayerZTestEpsilon()
{
float l9_0;
#if (sc_SkinBonesCount>0)
{
l9_0=5e-07;
}
#else
{
l9_0=5e-08;
}
#endif
return l9_0;
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float packValue(inout int value)
{
float l9_0;
#if (sc_OITDepthGatherPass)
{
int l9_1=value;
value/=4;
l9_0=floor(floor(mod(float(l9_1),4.0))*64.0)*0.00392157;
}
#else
{
l9_0=0.0;
}
#endif
return l9_0;
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
channel=floor(channel*0.25);
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
void main()
{
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
int l9_0;
#if (renderTarget0HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
vec4 l9_1=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_0,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_2;
#if (renderTarget1HasSwappedViews)
{
l9_2=1-sc_GetStereoViewIndex();
}
#else
{
l9_2=sc_GetStereoViewIndex();
}
#endif
vec4 l9_3=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_2,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_4;
#if (renderTarget2HasSwappedViews)
{
l9_4=1-sc_GetStereoViewIndex();
}
#else
{
l9_4=sc_GetStereoViewIndex();
}
#endif
vec4 l9_5=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_4,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_6;
#if (renderTarget3HasSwappedViews)
{
l9_6=1-sc_GetStereoViewIndex();
}
#else
{
l9_6=sc_GetStereoViewIndex();
}
#endif
if (dot(((l9_1+l9_3)+l9_5)+sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_6,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),vec4(0.254232))==0.342318)
{
discard;
}
vec2 l9_7;
if (gl_FrontFacing)
{
l9_7=varPackedTex.xy;
}
else
{
l9_7=vec2(1.0-varPackedTex.x,varPackedTex.y);
}
bool l9_8=overrideTimeEnabled==1;
float l9_9;
if (l9_8)
{
l9_9=overrideTimeElapsed;
}
else
{
l9_9=sc_Time.x;
}
float l9_10;
if (l9_8)
{
l9_10=overrideTimeDelta;
}
else
{
l9_10=max(sc_Time.y,0.0);
}
float l9_11=float(Interp_Particle_Index);
float l9_12=l9_11*0.000111123;
float l9_13;
if (l9_8)
{
l9_13=overrideTimeElapsed;
}
else
{
l9_13=sc_Time.x;
}
float l9_14=l9_13-l9_12;
float l9_15=(floor(fract(sin(dot(vec2(l9_12)*vec2(0.3452,0.52254),vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001)*l9_10;
float l9_16=l9_9-l9_15;
int l9_17=int(Port_SpriteCount_N048.x);
int l9_18=int(Port_SpriteCount_N048.y);
int l9_19=l9_17*l9_18;
int l9_20=int(Port_MaxFrames_N048);
int l9_21=(l9_19<l9_20) ? l9_19 : l9_20;
int l9_22=int(fract(abs(((l9_11*0.000108499)+0.151235)+(floor(l9_14+2.0)*4.32723)))*Port_Input1_N047);
float l9_23=1.0/float(l9_18);
int l9_24=l9_22-(l9_21*(l9_22/l9_21));
int l9_25=l9_24/l9_17;
int l9_26;
#if (mainTexHasSwappedViews)
{
l9_26=1-sc_GetStereoViewIndex();
}
#else
{
l9_26=sc_GetStereoViewIndex();
}
#endif
vec4 l9_27=sc_SampleTextureBiasOrLevel(mainTexDims.xy,mainTexLayout,l9_26,mod(vec2((1.0/float(l9_17))*(l9_7.x+float(l9_24-(l9_17*l9_25))),((1.0-l9_23)-(float(l9_25)*l9_23))+(l9_23*l9_7.y)),vec2(1.0)),(int(SC_USE_UV_TRANSFORM_mainTex)!=0),mainTexTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTex,SC_SOFTWARE_WRAP_MODE_V_mainTex),(int(SC_USE_UV_MIN_MAX_mainTex)!=0),mainTexUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_mainTex)!=0),mainTexBorderColor,0.0,mainTex);
vec2 l9_28=vec2(0.0);
l9_28.x=l9_12*(l9_16*Port_Multiplier_N051);
vec2 l9_29=l9_28;
l9_29.y=Port_Value2_N263;
int l9_30;
#if (colorrampTexHasSwappedViews)
{
l9_30=1-sc_GetStereoViewIndex();
}
#else
{
l9_30=sc_GetStereoViewIndex();
}
#endif
vec4 l9_31=ngsPixelShader((l9_27*sc_SampleTextureBiasOrLevel(colorrampTexDims.xy,colorrampTexLayout,l9_30,l9_29,(int(SC_USE_UV_TRANSFORM_colorrampTex)!=0),colorrampTexTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex),(int(SC_USE_UV_MIN_MAX_colorrampTex)!=0),colorrampTexUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0),colorrampTexBorderColor,0.0,colorrampTex))*Interp_Particle_Color);
vec4 l9_32;
#if (sc_ShaderComplexityAnalyzer)
{
l9_32=vec4(shaderComplexityValue*0.00392157,0.0,0.0,1.0);
}
#else
{
l9_32=vec4(0.0);
}
#endif
vec4 l9_33;
if (l9_32.w>0.0)
{
l9_33=l9_32;
}
else
{
l9_33=l9_31;
}
sc_writeFragData0(l9_33);
vec4 l9_34=clamp(l9_33,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_35=clamp(viewSpaceDepth()*0.001,0.0,1.0);
sc_writeFragData0(vec4(max(0.0,1.00392-l9_35),min(1.0,l9_35+0.00392157),0.0,0.0));
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0(vec4(1.0));
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_36=sc_ScreenCoordsGlobalToView((gl_FragCoord.xy*sc_WindowToViewportTransform.xy)+sc_WindowToViewportTransform.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_36).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_37=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_36).xy);
float l9_38=packValue(l9_37);
vec4 l9_39=vec4(0.0);
l9_39.x=l9_38;
vec4 l9_41=l9_39;
l9_41.y=packValue(l9_37);
vec4 l9_43=l9_41;
l9_43.z=packValue(l9_37);
vec4 l9_45=l9_43;
l9_45.w=packValue(l9_37);
vec4 l9_47=vec4(0.0);
l9_47.x=packValue(l9_37);
vec4 l9_49=l9_47;
l9_49.y=packValue(l9_37);
vec4 l9_51=l9_49;
l9_51.z=packValue(l9_37);
vec4 l9_52=l9_51;
l9_52.w=packValue(l9_37);
int l9_53=int(l9_34.w*255.0);
float l9_54=packValue(l9_53);
vec4 l9_55=vec4(0.0);
l9_55.x=l9_54;
vec4 l9_57=l9_55;
l9_57.y=packValue(l9_53);
vec4 l9_59=l9_57;
l9_59.z=packValue(l9_53);
vec4 l9_60=l9_59;
l9_60.w=packValue(l9_53);
sc_writeFragData0(l9_52);
sc_writeFragData1(l9_45);
sc_writeFragData2(l9_60);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.00392157,0.0,0.0,0.0));
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
vec2 l9_61=sc_ScreenCoordsGlobalToView((gl_FragCoord.xy*sc_WindowToViewportTransform.xy)+sc_WindowToViewportTransform.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_61).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_62[8];
int l9_63[8];
int l9_64=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_64<8)
{
l9_62[l9_64]=0;
l9_63[l9_64]=0;
l9_64++;
continue;
}
else
{
break;
}
}
int l9_65;
#if (sc_OITMaxLayers8)
{
l9_65=2;
}
#else
{
l9_65=1;
}
#endif
vec4 l9_66;
vec4 l9_67;
vec4 l9_68;
l9_68=vec4(0.0);
l9_67=vec4(0.0);
l9_66=vec4(0.0);
vec4 l9_69;
vec4 l9_70;
vec4 l9_71;
int l9_72=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_72<l9_65)
{
vec4 l9_73;
vec4 l9_74;
vec4 l9_75;
if (l9_72==0)
{
l9_75=texture2D(sc_OITAlpha0,l9_61);
l9_74=texture2D(sc_OITDepthLow0,l9_61);
l9_73=texture2D(sc_OITDepthHigh0,l9_61);
}
else
{
l9_75=l9_68;
l9_74=l9_67;
l9_73=l9_66;
}
if (l9_72==1)
{
l9_71=texture2D(sc_OITAlpha1,l9_61);
l9_70=texture2D(sc_OITDepthLow1,l9_61);
l9_69=texture2D(sc_OITDepthHigh1,l9_61);
}
else
{
l9_71=l9_75;
l9_70=l9_74;
l9_69=l9_73;
}
if (any(notEqual(l9_69,vec4(0.0)))||any(notEqual(l9_70,vec4(0.0))))
{
int l9_76[8]=l9_62;
unpackValues(l9_69.w,l9_72,l9_76);
unpackValues(l9_69.z,l9_72,l9_76);
unpackValues(l9_69.y,l9_72,l9_76);
unpackValues(l9_69.x,l9_72,l9_76);
unpackValues(l9_70.w,l9_72,l9_76);
unpackValues(l9_70.z,l9_72,l9_76);
unpackValues(l9_70.y,l9_72,l9_76);
unpackValues(l9_70.x,l9_72,l9_76);
int l9_85[8]=l9_63;
unpackValues(l9_71.w,l9_72,l9_85);
unpackValues(l9_71.z,l9_72,l9_85);
unpackValues(l9_71.y,l9_72,l9_85);
unpackValues(l9_71.x,l9_72,l9_85);
}
l9_68=l9_71;
l9_67=l9_70;
l9_66=l9_69;
l9_72++;
continue;
}
else
{
break;
}
}
vec4 l9_90=texture2D(sc_OITFilteredDepthBoundsTexture,l9_61);
vec2 l9_91=l9_90.xy;
int l9_92;
#if (sc_SkinBonesCount>0)
{
float l9_93;
#if (sc_SkinBonesCount>0)
{
l9_93=0.001;
}
#else
{
l9_93=0.0;
}
#endif
l9_92=encodeDepth(((1.0-l9_90.x)*1000.0)+l9_93,l9_91);
}
#else
{
l9_92=0;
}
#endif
int l9_94=encodeDepth(viewSpaceDepth(),l9_91);
vec4 l9_95;
l9_95=l9_34*l9_34.w;
vec4 l9_96;
int l9_97=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_97<8)
{
int l9_98=l9_62[l9_97];
int l9_99=l9_94-l9_92;
bool l9_100=l9_98<l9_99;
bool l9_101;
if (l9_100)
{
l9_101=l9_62[l9_97]>0;
}
else
{
l9_101=l9_100;
}
if (l9_101)
{
vec3 l9_102=l9_95.xyz*(1.0-(float(l9_63[l9_97])*0.00392157));
l9_96=vec4(l9_102.x,l9_102.y,l9_102.z,l9_95.w);
}
else
{
l9_96=l9_95;
}
l9_95=l9_96;
l9_97++;
continue;
}
else
{
break;
}
}
sc_writeFragData0(l9_95);
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
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView((gl_FragCoord.xy*sc_WindowToViewportTransform.xy)+sc_WindowToViewportTransform.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0(l9_34);
}
#endif
}
#else
{
sc_writeFragData0(l9_33);
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
