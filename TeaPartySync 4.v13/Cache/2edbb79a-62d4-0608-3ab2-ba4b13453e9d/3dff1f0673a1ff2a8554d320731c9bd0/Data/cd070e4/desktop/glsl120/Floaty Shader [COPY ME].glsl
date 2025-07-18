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
//sampler sampler baseTexSmpSC 0:27
//sampler sampler bodyDepthTexSmpSC 0:28
//sampler sampler detailNormalTexSmpSC 0:29
//sampler sampler emissiveTexSmpSC 0:30
//sampler sampler fluidPressureSmpSC 0:31
//sampler sampler heightmapSmpSC 0:32
//sampler sampler intensityTextureSmpSC 0:33
//sampler sampler materialParamsTexSmpSC 0:34
//sampler sampler normalTexSmpSC 0:35
//sampler sampler opacityTexSmpSC 0:36
//sampler sampler reflectionModulationTexSmpSC 0:37
//sampler sampler reflectionTexSmpSC 0:38
//sampler sampler rimColorTexSmpSC 0:39
//sampler sampler sc_EnvmapDiffuseSmpSC 0:40
//sampler sampler sc_EnvmapSpecularSmpSC 0:41
//sampler sampler sc_OITCommonSampler 0:42
//sampler sampler sc_SSAOTextureSmpSC 0:43
//sampler sampler sc_ScreenTextureSmpSC 0:44
//sampler sampler sc_ShadowTextureSmpSC 0:45
//texture texture2D baseTex 0:0:0:27
//texture texture2D bodyDepthTex 0:1:0:28
//texture texture2D detailNormalTex 0:2:0:29
//texture texture2D emissiveTex 0:3:0:30
//texture texture2D fluidPressure 0:4:0:31
//texture texture2D heightmap 0:5:0:32
//texture texture2D intensityTexture 0:6:0:33
//texture texture2D materialParamsTex 0:7:0:34
//texture texture2D normalTex 0:8:0:35
//texture texture2D opacityTex 0:9:0:36
//texture texture2D reflectionModulationTex 0:10:0:37
//texture texture2D reflectionTex 0:11:0:38
//texture texture2D rimColorTex 0:12:0:39
//texture texture2D sc_EnvmapDiffuse 0:13:0:40
//texture texture2D sc_EnvmapSpecular 0:14:0:41
//texture texture2D sc_OITAlpha0 0:15:0:42
//texture texture2D sc_OITAlpha1 0:16:0:42
//texture texture2D sc_OITDepthHigh0 0:17:0:42
//texture texture2D sc_OITDepthHigh1 0:18:0:42
//texture texture2D sc_OITDepthLow0 0:19:0:42
//texture texture2D sc_OITDepthLow1 0:20:0:42
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:21:0:42
//texture texture2D sc_OITFrontDepthTexture 0:22:0:42
//texture texture2D sc_SSAOTexture 0:23:0:43
//texture texture2D sc_ScreenTexture 0:24:0:44
//texture texture2D sc_ShadowTexture 0:25:0:45
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
//spec_const bool ENABLE_BASE_TEX 30 0
//spec_const bool ENABLE_DETAIL_NORMAL 31 0
//spec_const bool ENABLE_EMISSIVE 32 0
//spec_const bool ENABLE_MATERIAL_PARAM_TEX 33 0
//spec_const bool ENABLE_NORMALMAP 34 0
//spec_const bool ENABLE_OPACITY_TEX 35 0
//spec_const bool ENABLE_RECOLOR 36 0
//spec_const bool ENABLE_RIM_HIGHLIGHT 37 0
//spec_const bool ENABLE_RIM_INVERT 38 0
//spec_const bool ENABLE_SIMPLE_REFLECTION 39 0
//spec_const bool ENABLE_SPECULAR_AO 40 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 41 0
//spec_const bool ENABLE_UV2 42 0
//spec_const bool ENABLE_UV3 43 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 44 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex 45 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 46 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 47 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 48 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_heightmap 49 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 50 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 52 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 53 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 54 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 55 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 56 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 57 0
//spec_const bool SC_USE_UV_MIN_MAX_bodyDepthTex 58 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 59 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 60 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 61 0
//spec_const bool SC_USE_UV_MIN_MAX_heightmap 62 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 63 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 64 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 65 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 66 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 67 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 68 0
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 69 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 70 0
//spec_const bool SC_USE_UV_TRANSFORM_bodyDepthTex 71 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 72 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 73 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 74 0
//spec_const bool SC_USE_UV_TRANSFORM_heightmap 75 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 76 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 77 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 78 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 79 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 80 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 81 0
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 82 0
//spec_const bool Tweak_N177 83 0
//spec_const bool Tweak_N216 84 0
//spec_const bool UseViewSpaceDepthVariant 85 1
//spec_const bool baseTexHasSwappedViews 86 0
//spec_const bool bodyDepthTexHasSwappedViews 87 0
//spec_const bool detailNormalTexHasSwappedViews 88 0
//spec_const bool emissiveTexHasSwappedViews 89 0
//spec_const bool fluidPressureHasSwappedViews 90 0
//spec_const bool heightmapHasSwappedViews 91 0
//spec_const bool intensityTextureHasSwappedViews 92 0
//spec_const bool materialParamsTexHasSwappedViews 93 0
//spec_const bool normalTexHasSwappedViews 94 0
//spec_const bool opacityTexHasSwappedViews 95 0
//spec_const bool reflectionModulationTexHasSwappedViews 96 0
//spec_const bool reflectionTexHasSwappedViews 97 0
//spec_const bool rimColorTexHasSwappedViews 98 0
//spec_const bool sc_BlendMode_Add 99 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 100 0
//spec_const bool sc_BlendMode_AlphaTest 101 0
//spec_const bool sc_BlendMode_AlphaToCoverage 102 0
//spec_const bool sc_BlendMode_ColoredGlass 103 0
//spec_const bool sc_BlendMode_Custom 104 0
//spec_const bool sc_BlendMode_Max 105 0
//spec_const bool sc_BlendMode_Min 106 0
//spec_const bool sc_BlendMode_Multiply 107 0
//spec_const bool sc_BlendMode_MultiplyOriginal 108 0
//spec_const bool sc_BlendMode_Normal 109 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 110 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 111 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 112 0
//spec_const bool sc_BlendMode_Screen 113 0
//spec_const bool sc_BlendMode_Software 114 0
//spec_const bool sc_DepthOnly 115 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 116 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 117 0
//spec_const bool sc_FramebufferFetch 118 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 119 0
//spec_const bool sc_HasDiffuseEnvmap 120 0
//spec_const bool sc_IsEditor 121 0
//spec_const bool sc_LightEstimation 122 0
//spec_const bool sc_MotionVectorsPass 123 0
//spec_const bool sc_OITCompositingPass 124 0
//spec_const bool sc_OITDepthBoundsPass 125 0
//spec_const bool sc_OITDepthGatherPass 126 0
//spec_const bool sc_OITDepthPrepass 127 0
//spec_const bool sc_OITFrontLayerPass 128 0
//spec_const bool sc_OITMaxLayers4Plus1 129 0
//spec_const bool sc_OITMaxLayers8 130 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 131 0
//spec_const bool sc_ProjectiveShadowsCaster 132 0
//spec_const bool sc_ProjectiveShadowsReceiver 133 0
//spec_const bool sc_RenderAlphaToColor 134 0
//spec_const bool sc_SSAOEnabled 135 0
//spec_const bool sc_ScreenTextureHasSwappedViews 136 0
//spec_const bool sc_ShaderComplexityAnalyzer 137 0
//spec_const bool sc_TAAEnabled 138 0
//spec_const bool sc_UseFramebufferFetchMarker 139 0
//spec_const bool sc_VertexBlending 140 0
//spec_const bool sc_VertexBlendingUseNormals 141 0
//spec_const bool uv2EnableAnimation 142 0
//spec_const bool uv3EnableAnimation 143 0
//spec_const int NODE_13_DROPLIST_ITEM 144 0
//spec_const int NODE_181_DROPLIST_ITEM 145 0
//spec_const int NODE_184_DROPLIST_ITEM 146 0
//spec_const int NODE_221_DROPLIST_ITEM 147 0
//spec_const int NODE_228_DROPLIST_ITEM 148 0
//spec_const int NODE_27_DROPLIST_ITEM 149 0
//spec_const int NODE_315_DROPLIST_ITEM 150 0
//spec_const int NODE_38_DROPLIST_ITEM 151 0
//spec_const int NODE_49_DROPLIST_ITEM 152 0
//spec_const int NODE_69_DROPLIST_ITEM 153 0
//spec_const int NODE_76_DROPLIST_ITEM 154 0
//spec_const int SC_DEVICE_CLASS 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_heightmap 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 163 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 164 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 165 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 166 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 167 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 168 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 169 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex 170 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 171 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 172 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 173 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_heightmap 174 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 175 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 176 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 177 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 178 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 179 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 180 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 181 -1
//spec_const int baseTexLayout 182 0
//spec_const int bodyDepthTexLayout 183 0
//spec_const int detailNormalTexLayout 184 0
//spec_const int emissiveTexLayout 185 0
//spec_const int fluidPressureLayout 186 0
//spec_const int heightmapLayout 187 0
//spec_const int intensityTextureLayout 188 0
//spec_const int materialParamsTexLayout 189 0
//spec_const int normalTexLayout 190 0
//spec_const int opacityTexLayout 191 0
//spec_const int reflectionModulationTexLayout 192 0
//spec_const int reflectionTexLayout 193 0
//spec_const int rimColorTexLayout 194 0
//spec_const int sc_AmbientLightMode0 195 0
//spec_const int sc_AmbientLightMode1 196 0
//spec_const int sc_AmbientLightMode2 197 0
//spec_const int sc_AmbientLightMode_Constant 198 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 199 0
//spec_const int sc_AmbientLightMode_FromCamera 200 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 201 0
//spec_const int sc_AmbientLightsCount 202 0
//spec_const int sc_DepthBufferMode 203 0
//spec_const int sc_DirectionalLightsCount 204 0
//spec_const int sc_EnvLightMode 205 0
//spec_const int sc_EnvmapDiffuseLayout 206 0
//spec_const int sc_EnvmapSpecularLayout 207 0
//spec_const int sc_LightEstimationSGCount 208 0
//spec_const int sc_MaxTextureImageUnits 209 0
//spec_const int sc_PointLightsCount 210 0
//spec_const int sc_RenderingSpace 211 -1
//spec_const int sc_ScreenTextureLayout 212 0
//spec_const int sc_ShaderCacheConstant 213 0
//spec_const int sc_SkinBonesCount 214 0
//spec_const int sc_StereoRenderingMode 215 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 216 0
//spec_const int sc_StereoViewID 217 0
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
#ifndef heightmapHasSwappedViews
#define heightmapHasSwappedViews 0
#elif heightmapHasSwappedViews==1
#undef heightmapHasSwappedViews
#define heightmapHasSwappedViews 1
#endif
#ifndef heightmapLayout
#define heightmapLayout 0
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
#ifndef SC_USE_UV_TRANSFORM_heightmap
#define SC_USE_UV_TRANSFORM_heightmap 0
#elif SC_USE_UV_TRANSFORM_heightmap==1
#undef SC_USE_UV_TRANSFORM_heightmap
#define SC_USE_UV_TRANSFORM_heightmap 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_heightmap
#define SC_SOFTWARE_WRAP_MODE_U_heightmap -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_heightmap
#define SC_SOFTWARE_WRAP_MODE_V_heightmap -1
#endif
#ifndef SC_USE_UV_MIN_MAX_heightmap
#define SC_USE_UV_MIN_MAX_heightmap 0
#elif SC_USE_UV_MIN_MAX_heightmap==1
#undef SC_USE_UV_MIN_MAX_heightmap
#define SC_USE_UV_MIN_MAX_heightmap 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_heightmap
#define SC_USE_CLAMP_TO_BORDER_heightmap 0
#elif SC_USE_CLAMP_TO_BORDER_heightmap==1
#undef SC_USE_CLAMP_TO_BORDER_heightmap
#define SC_USE_CLAMP_TO_BORDER_heightmap 1
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
uniform mat3 heightmapTransform;
uniform vec4 heightmapUvMinMax;
uniform vec4 heightmapBorderColor;
uniform mat3 fluidPressureTransform;
uniform vec4 fluidPressureUvMinMax;
uniform vec4 fluidPressureBorderColor;
uniform vec3 oceanPos;
uniform vec2 unpackVal;
uniform vec3 oceanMin;
uniform vec3 oceanMax;
uniform float enableFluid;
uniform vec2 pressureRange;
uniform float speed;
uniform vec4 sc_Time;
uniform mat4 sc_ModelMatrixInverse;
uniform float Port_BobPosSpeed_N153;
uniform float Port_BobPosAmount_N153;
uniform float Port_BobRotSpeed_N153;
uniform float Port_BobRotAmount_N153;
uniform sampler2D heightmap;
uniform sampler2D fluidPressure;
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
vec3 l9_28=varNormal;
vec2 l9_29=vec2(oceanMin.xz);
vec2 l9_30=vec2(0.0)+(((sc_ModelMatrix[3].xz-l9_29)*1.0)/((vec2(oceanMax.xz)-l9_29)+vec2(1e-06)));
float l9_31=1.0-l9_30.y;
int l9_32;
#if (heightmapHasSwappedViews)
{
l9_32=1-sc_GetStereoViewIndex();
}
#else
{
l9_32=sc_GetStereoViewIndex();
}
#endif
bool l9_33=(int(SC_USE_CLAMP_TO_BORDER_heightmap)!=0)&&(!(int(SC_USE_UV_MIN_MAX_heightmap)!=0));
float l9_34=l9_30.x;
float l9_35=l9_34;
sc_SoftwareWrapEarly(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).x);
float l9_36=l9_35;
float l9_37=l9_31;
sc_SoftwareWrapEarly(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).y);
float l9_38=l9_37;
vec2 l9_39=vec2(l9_36,l9_31);
l9_39.y=l9_38;
vec2 l9_40;
float l9_41;
#if (SC_USE_UV_MIN_MAX_heightmap)
{
bool l9_42;
#if (SC_USE_CLAMP_TO_BORDER_heightmap)
{
l9_42=ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).x==3;
}
#else
{
l9_42=(int(SC_USE_CLAMP_TO_BORDER_heightmap)!=0);
}
#endif
float l9_43=l9_36;
float l9_44=1.0;
sc_ClampUV(l9_43,heightmapUvMinMax.x,heightmapUvMinMax.z,l9_42,l9_44);
float l9_45=l9_43;
float l9_46=l9_44;
bool l9_47;
#if (SC_USE_CLAMP_TO_BORDER_heightmap)
{
l9_47=ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).y==3;
}
#else
{
l9_47=(int(SC_USE_CLAMP_TO_BORDER_heightmap)!=0);
}
#endif
float l9_48=l9_38;
float l9_49=l9_46;
sc_ClampUV(l9_48,heightmapUvMinMax.y,heightmapUvMinMax.w,l9_47,l9_49);
vec2 l9_50=vec2(l9_45,l9_38);
l9_50.y=l9_48;
l9_41=l9_49;
l9_40=l9_50;
}
#else
{
l9_41=1.0;
l9_40=l9_39;
}
#endif
vec2 l9_51=sc_TransformUV(l9_40,(int(SC_USE_UV_TRANSFORM_heightmap)!=0),heightmapTransform);
float l9_52=l9_51.x;
float l9_53=l9_41;
sc_SoftwareWrapLate(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).x,l9_33,l9_53);
float l9_54=l9_51.y;
float l9_55=l9_53;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_heightmap,SC_SOFTWARE_WRAP_MODE_V_heightmap).y,l9_33,l9_55);
float l9_56=l9_55;
vec3 l9_57=sc_SamplingCoordsViewToGlobal(vec2(l9_52,l9_54),heightmapLayout,l9_32);
vec4 l9_58=texture2DLod(heightmap,l9_57.xy,0.0);
vec4 l9_59;
#if (SC_USE_CLAMP_TO_BORDER_heightmap)
{
l9_59=mix(heightmapBorderColor,l9_58,vec4(l9_56));
}
#else
{
l9_59=l9_58;
}
#endif
float l9_60=DecodeFloat16(l9_59.xy,true);
float l9_61=unpackVal.y-unpackVal.x;
float l9_62=0.99998999-0.0;
float l9_63=(unpackVal.x+(((l9_60-0.0)*l9_61)/l9_62))+oceanPos.y;
float l9_64=0.0+(((l9_63-unpackVal.x)*1.0)/(l9_61+1e-06));
float l9_65;
float l9_66;
if (enableFluid==1.0)
{
int l9_67;
#if (fluidPressureHasSwappedViews)
{
l9_67=1-sc_GetStereoViewIndex();
}
#else
{
l9_67=sc_GetStereoViewIndex();
}
#endif
bool l9_68=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0)&&(!(int(SC_USE_UV_MIN_MAX_fluidPressure)!=0));
float l9_69=l9_34;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x);
float l9_70=l9_69;
float l9_71=l9_31;
sc_SoftwareWrapEarly(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y);
float l9_72=l9_71;
vec2 l9_73=vec2(l9_70,l9_31);
l9_73.y=l9_72;
vec2 l9_74;
float l9_75;
#if (SC_USE_UV_MIN_MAX_fluidPressure)
{
bool l9_76;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_76=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x==3;
}
#else
{
l9_76=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_77=l9_70;
float l9_78=1.0;
sc_ClampUV(l9_77,fluidPressureUvMinMax.x,fluidPressureUvMinMax.z,l9_76,l9_78);
float l9_79=l9_77;
float l9_80=l9_78;
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure)!=0);
}
#endif
float l9_82=l9_72;
float l9_83=l9_80;
sc_ClampUV(l9_82,fluidPressureUvMinMax.y,fluidPressureUvMinMax.w,l9_81,l9_83);
vec2 l9_84=vec2(l9_79,l9_72);
l9_84.y=l9_82;
l9_75=l9_83;
l9_74=l9_84;
}
#else
{
l9_75=1.0;
l9_74=l9_73;
}
#endif
vec2 l9_85=sc_TransformUV(l9_74,(int(SC_USE_UV_TRANSFORM_fluidPressure)!=0),fluidPressureTransform);
float l9_86=l9_85.x;
float l9_87=l9_75;
sc_SoftwareWrapLate(l9_86,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).x,l9_68,l9_87);
float l9_88=l9_85.y;
float l9_89=l9_87;
sc_SoftwareWrapLate(l9_88,ivec2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure,SC_SOFTWARE_WRAP_MODE_V_fluidPressure).y,l9_68,l9_89);
float l9_90=l9_89;
vec3 l9_91=sc_SamplingCoordsViewToGlobal(vec2(l9_86,l9_88),fluidPressureLayout,l9_67);
vec4 l9_92=texture2DLod(fluidPressure,l9_91.xy,0.0);
vec4 l9_93;
#if (SC_USE_CLAMP_TO_BORDER_fluidPressure)
{
l9_93=mix(fluidPressureBorderColor,l9_92,vec4(l9_90));
}
#else
{
l9_93=l9_92;
}
#endif
float l9_94=pressureRange.x+(((DecodeFloat16(l9_93.xy,true)-0.0)*(pressureRange.y-pressureRange.x))/l9_62);
l9_66=l9_94;
l9_65=(l9_64+((-1.0)+(((l9_94-0.0)*2.0)/1.000001)))/2.0;
}
else
{
l9_66=0.0;
l9_65=l9_64;
}
float l9_95=sc_Time.x*speed;
float l9_96=sin(l9_95*Port_BobPosSpeed_N153)*l9_65;
float l9_97=sin(l9_95*Port_BobRotSpeed_N153)*l9_65;
float l9_98=sin((l9_95-1.0)*Port_BobRotSpeed_N153)*l9_65;
float l9_99=radians(l9_97*Port_BobRotAmount_N153);
float l9_100=cos(l9_99);
float l9_101=sin(l9_99);
float l9_102=radians(0.0);
float l9_103=cos(l9_102);
float l9_104=sin(l9_102);
float l9_105=radians(l9_98*Port_BobRotAmount_N153);
float l9_106=cos(l9_105);
float l9_107=sin(l9_105);
float l9_108=l9_101*l9_104;
float l9_109=l9_100*l9_104;
float l9_110=l9_63+l9_66;
vec3 l9_111;
vec3 l9_112;
vec3 l9_113;
if (l9_25)
{
l9_113=varTangent.xyz;
l9_112=varNormal;
l9_111=varPos;
}
else
{
l9_113=varTangent.xyz;
l9_112=l9_28;
l9_111=vec3((sc_ModelMatrix*vec4(mat3(vec4(l9_103*l9_106,(l9_100*l9_107)+(l9_108*l9_106),(l9_101*l9_107)-(l9_109*l9_106),0.0).xyz,vec4((-l9_103)*l9_107,(l9_100*l9_106)-(l9_108*l9_107),(l9_101*l9_106)+(l9_109*l9_107),0.0).xyz,vec4(l9_104,(-l9_101)*l9_103,l9_100*l9_103,0.0).xyz)*(sc_ModelMatrixInverse*vec4(varPos,1.0)).xyz,1.0)).xyz)+vec3(0.0,l9_110+(l9_96*Port_BobPosAmount_N153),0.0);
}
varPos=l9_111;
varNormal=normalize(l9_112);
vec3 l9_114=normalize(l9_113);
varTangent=vec4(l9_114.x,l9_114.y,l9_114.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_115;
#if (sc_RenderingSpace==3)
{
l9_115=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_116;
#if (sc_RenderingSpace==2)
{
l9_116=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
vec4 l9_117;
#if (sc_RenderingSpace==1)
{
l9_117=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15;
}
#else
{
l9_117=l9_15;
}
#endif
l9_116=l9_117;
}
#endif
l9_115=l9_116;
}
#endif
varViewSpaceDepth=-l9_115.z;
}
#endif
vec4 l9_118;
#if (sc_RenderingSpace==3)
{
l9_118=l9_15;
}
#else
{
vec4 l9_119;
#if (sc_RenderingSpace==4)
{
l9_119=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_15)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_120;
#if (sc_RenderingSpace==2)
{
l9_120=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_121;
#if (sc_RenderingSpace==1)
{
l9_121=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_121=vec4(0.0);
}
#endif
l9_120=l9_121;
}
#endif
l9_119=l9_120;
}
#endif
l9_118=l9_119;
}
#endif
varPackedTex=vec4(l9_26,l9_0);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_122;
#if (sc_RenderingSpace==1)
{
l9_122=sc_ModelMatrix*l9_15;
}
#else
{
l9_122=l9_15;
}
#endif
vec4 l9_123=sc_ProjectorMatrix*l9_122;
varShadowTex=((l9_123.xy/vec2(l9_123.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_124;
#if (sc_DepthBufferMode==1)
{
vec4 l9_125;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_126=l9_118;
l9_126.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_118.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_118.w;
l9_125=l9_126;
}
else
{
l9_125=l9_118;
}
l9_124=l9_125;
}
#else
{
l9_124=l9_118;
}
#endif
vec4 l9_127;
#if (sc_TAAEnabled)
{
vec2 l9_128=l9_124.xy+(sc_TAAJitterOffset*l9_124.w);
l9_127=vec4(l9_128.x,l9_128.y,l9_124.z,l9_124.w);
}
#else
{
l9_127=l9_124;
}
#endif
vec4 l9_129;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_130=l9_127;
l9_130.x=l9_127.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_129=l9_130;
}
#else
{
l9_129=l9_127;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_131=dot(l9_129,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_131);
}
#else
{
varClipDistance=l9_131;
}
#endif
}
#endif
gl_Position=l9_129;
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
vec2 N7_TransformedUV2;
vec2 N7_TransformedUV3;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
vec2 Surface_UVCoord1;
vec4 VertexColor;
vec2 gScreenCoord;
vec3 SurfacePosition_WorldSpace;
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
#ifndef baseTexHasSwappedViews
#define baseTexHasSwappedViews 0
#elif baseTexHasSwappedViews==1
#undef baseTexHasSwappedViews
#define baseTexHasSwappedViews 1
#endif
#ifndef baseTexLayout
#define baseTexLayout 0
#endif
#ifndef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 0
#elif opacityTexHasSwappedViews==1
#undef opacityTexHasSwappedViews
#define opacityTexHasSwappedViews 1
#endif
#ifndef opacityTexLayout
#define opacityTexLayout 0
#endif
#ifndef normalTexHasSwappedViews
#define normalTexHasSwappedViews 0
#elif normalTexHasSwappedViews==1
#undef normalTexHasSwappedViews
#define normalTexHasSwappedViews 1
#endif
#ifndef normalTexLayout
#define normalTexLayout 0
#endif
#ifndef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 0
#elif detailNormalTexHasSwappedViews==1
#undef detailNormalTexHasSwappedViews
#define detailNormalTexHasSwappedViews 1
#endif
#ifndef detailNormalTexLayout
#define detailNormalTexLayout 0
#endif
#ifndef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 0
#elif emissiveTexHasSwappedViews==1
#undef emissiveTexHasSwappedViews
#define emissiveTexHasSwappedViews 1
#endif
#ifndef emissiveTexLayout
#define emissiveTexLayout 0
#endif
#ifndef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 0
#elif reflectionTexHasSwappedViews==1
#undef reflectionTexHasSwappedViews
#define reflectionTexHasSwappedViews 1
#endif
#ifndef reflectionTexLayout
#define reflectionTexLayout 0
#endif
#ifndef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 0
#elif reflectionModulationTexHasSwappedViews==1
#undef reflectionModulationTexHasSwappedViews
#define reflectionModulationTexHasSwappedViews 1
#endif
#ifndef reflectionModulationTexLayout
#define reflectionModulationTexLayout 0
#endif
#ifndef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 0
#elif rimColorTexHasSwappedViews==1
#undef rimColorTexHasSwappedViews
#define rimColorTexHasSwappedViews 1
#endif
#ifndef rimColorTexLayout
#define rimColorTexLayout 0
#endif
#ifndef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 0
#elif materialParamsTexHasSwappedViews==1
#undef materialParamsTexHasSwappedViews
#define materialParamsTexHasSwappedViews 1
#endif
#ifndef materialParamsTexLayout
#define materialParamsTexLayout 0
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
#ifndef NODE_38_DROPLIST_ITEM
#define NODE_38_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 0
#elif ENABLE_BASE_TEX==1
#undef ENABLE_BASE_TEX
#define ENABLE_BASE_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 0
#elif SC_USE_UV_TRANSFORM_baseTex==1
#undef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_baseTex
#define SC_SOFTWARE_WRAP_MODE_U_baseTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_baseTex
#define SC_SOFTWARE_WRAP_MODE_V_baseTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 0
#elif SC_USE_UV_MIN_MAX_baseTex==1
#undef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 0
#elif SC_USE_CLAMP_TO_BORDER_baseTex==1
#undef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 1
#endif
#ifndef NODE_27_DROPLIST_ITEM
#define NODE_27_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_RECOLOR
#define ENABLE_RECOLOR 0
#elif ENABLE_RECOLOR==1
#undef ENABLE_RECOLOR
#define ENABLE_RECOLOR 1
#endif
#ifndef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 0
#elif ENABLE_OPACITY_TEX==1
#undef ENABLE_OPACITY_TEX
#define ENABLE_OPACITY_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 0
#elif SC_USE_UV_TRANSFORM_opacityTex==1
#undef SC_USE_UV_TRANSFORM_opacityTex
#define SC_USE_UV_TRANSFORM_opacityTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_opacityTex
#define SC_SOFTWARE_WRAP_MODE_U_opacityTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_opacityTex
#define SC_SOFTWARE_WRAP_MODE_V_opacityTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 0
#elif SC_USE_UV_MIN_MAX_opacityTex==1
#undef SC_USE_UV_MIN_MAX_opacityTex
#define SC_USE_UV_MIN_MAX_opacityTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 0
#elif SC_USE_CLAMP_TO_BORDER_opacityTex==1
#undef SC_USE_CLAMP_TO_BORDER_opacityTex
#define SC_USE_CLAMP_TO_BORDER_opacityTex 1
#endif
#ifndef NODE_69_DROPLIST_ITEM
#define NODE_69_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 0
#elif ENABLE_NORMALMAP==1
#undef ENABLE_NORMALMAP
#define ENABLE_NORMALMAP 1
#endif
#ifndef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 0
#elif SC_USE_UV_TRANSFORM_normalTex==1
#undef SC_USE_UV_TRANSFORM_normalTex
#define SC_USE_UV_TRANSFORM_normalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_normalTex
#define SC_SOFTWARE_WRAP_MODE_U_normalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_normalTex
#define SC_SOFTWARE_WRAP_MODE_V_normalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 0
#elif SC_USE_UV_MIN_MAX_normalTex==1
#undef SC_USE_UV_MIN_MAX_normalTex
#define SC_USE_UV_MIN_MAX_normalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 0
#elif SC_USE_CLAMP_TO_BORDER_normalTex==1
#undef SC_USE_CLAMP_TO_BORDER_normalTex
#define SC_USE_CLAMP_TO_BORDER_normalTex 1
#endif
#ifndef NODE_181_DROPLIST_ITEM
#define NODE_181_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 0
#elif ENABLE_DETAIL_NORMAL==1
#undef ENABLE_DETAIL_NORMAL
#define ENABLE_DETAIL_NORMAL 1
#endif
#ifndef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 0
#elif SC_USE_UV_TRANSFORM_detailNormalTex==1
#undef SC_USE_UV_TRANSFORM_detailNormalTex
#define SC_USE_UV_TRANSFORM_detailNormalTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_U_detailNormalTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_detailNormalTex
#define SC_SOFTWARE_WRAP_MODE_V_detailNormalTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 0
#elif SC_USE_UV_MIN_MAX_detailNormalTex==1
#undef SC_USE_UV_MIN_MAX_detailNormalTex
#define SC_USE_UV_MIN_MAX_detailNormalTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 0
#elif SC_USE_CLAMP_TO_BORDER_detailNormalTex==1
#undef SC_USE_CLAMP_TO_BORDER_detailNormalTex
#define SC_USE_CLAMP_TO_BORDER_detailNormalTex 1
#endif
#ifndef NODE_184_DROPLIST_ITEM
#define NODE_184_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 0
#elif ENABLE_EMISSIVE==1
#undef ENABLE_EMISSIVE
#define ENABLE_EMISSIVE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 0
#elif SC_USE_UV_TRANSFORM_emissiveTex==1
#undef SC_USE_UV_TRANSFORM_emissiveTex
#define SC_USE_UV_TRANSFORM_emissiveTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_U_emissiveTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_emissiveTex
#define SC_SOFTWARE_WRAP_MODE_V_emissiveTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 0
#elif SC_USE_UV_MIN_MAX_emissiveTex==1
#undef SC_USE_UV_MIN_MAX_emissiveTex
#define SC_USE_UV_MIN_MAX_emissiveTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 0
#elif SC_USE_CLAMP_TO_BORDER_emissiveTex==1
#undef SC_USE_CLAMP_TO_BORDER_emissiveTex
#define SC_USE_CLAMP_TO_BORDER_emissiveTex 1
#endif
#ifndef NODE_76_DROPLIST_ITEM
#define NODE_76_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 0
#elif ENABLE_SIMPLE_REFLECTION==1
#undef ENABLE_SIMPLE_REFLECTION
#define ENABLE_SIMPLE_REFLECTION 1
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 0
#elif SC_USE_UV_TRANSFORM_reflectionTex==1
#undef SC_USE_UV_TRANSFORM_reflectionTex
#define SC_USE_UV_TRANSFORM_reflectionTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 0
#elif SC_USE_UV_MIN_MAX_reflectionTex==1
#undef SC_USE_UV_MIN_MAX_reflectionTex
#define SC_USE_UV_MIN_MAX_reflectionTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionTex
#define SC_USE_CLAMP_TO_BORDER_reflectionTex 1
#endif
#ifndef Tweak_N177
#define Tweak_N177 0
#elif Tweak_N177==1
#undef Tweak_N177
#define Tweak_N177 1
#endif
#ifndef NODE_228_DROPLIST_ITEM
#define NODE_228_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 0
#elif SC_USE_UV_TRANSFORM_reflectionModulationTex==1
#undef SC_USE_UV_TRANSFORM_reflectionModulationTex
#define SC_USE_UV_TRANSFORM_reflectionModulationTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex
#define SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 0
#elif SC_USE_UV_MIN_MAX_reflectionModulationTex==1
#undef SC_USE_UV_MIN_MAX_reflectionModulationTex
#define SC_USE_UV_MIN_MAX_reflectionModulationTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 0
#elif SC_USE_CLAMP_TO_BORDER_reflectionModulationTex==1
#undef SC_USE_CLAMP_TO_BORDER_reflectionModulationTex
#define SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 1
#endif
#ifndef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 0
#elif ENABLE_RIM_HIGHLIGHT==1
#undef ENABLE_RIM_HIGHLIGHT
#define ENABLE_RIM_HIGHLIGHT 1
#endif
#ifndef Tweak_N216
#define Tweak_N216 0
#elif Tweak_N216==1
#undef Tweak_N216
#define Tweak_N216 1
#endif
#ifndef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 0
#elif ENABLE_RIM_INVERT==1
#undef ENABLE_RIM_INVERT
#define ENABLE_RIM_INVERT 1
#endif
#ifndef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 0
#elif SC_USE_UV_TRANSFORM_rimColorTex==1
#undef SC_USE_UV_TRANSFORM_rimColorTex
#define SC_USE_UV_TRANSFORM_rimColorTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_U_rimColorTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_rimColorTex
#define SC_SOFTWARE_WRAP_MODE_V_rimColorTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 0
#elif SC_USE_UV_MIN_MAX_rimColorTex==1
#undef SC_USE_UV_MIN_MAX_rimColorTex
#define SC_USE_UV_MIN_MAX_rimColorTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 0
#elif SC_USE_CLAMP_TO_BORDER_rimColorTex==1
#undef SC_USE_CLAMP_TO_BORDER_rimColorTex
#define SC_USE_CLAMP_TO_BORDER_rimColorTex 1
#endif
#ifndef NODE_315_DROPLIST_ITEM
#define NODE_315_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_MATERIAL_PARAM_TEX
#define ENABLE_MATERIAL_PARAM_TEX 0
#elif ENABLE_MATERIAL_PARAM_TEX==1
#undef ENABLE_MATERIAL_PARAM_TEX
#define ENABLE_MATERIAL_PARAM_TEX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 0
#elif SC_USE_UV_TRANSFORM_materialParamsTex==1
#undef SC_USE_UV_TRANSFORM_materialParamsTex
#define SC_USE_UV_TRANSFORM_materialParamsTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_U_materialParamsTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_materialParamsTex
#define SC_SOFTWARE_WRAP_MODE_V_materialParamsTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 0
#elif SC_USE_UV_MIN_MAX_materialParamsTex==1
#undef SC_USE_UV_MIN_MAX_materialParamsTex
#define SC_USE_UV_MIN_MAX_materialParamsTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 0
#elif SC_USE_CLAMP_TO_BORDER_materialParamsTex==1
#undef SC_USE_CLAMP_TO_BORDER_materialParamsTex
#define SC_USE_CLAMP_TO_BORDER_materialParamsTex 1
#endif
#ifndef NODE_221_DROPLIST_ITEM
#define NODE_221_DROPLIST_ITEM 0
#endif
#ifndef ENABLE_SPECULAR_AO
#define ENABLE_SPECULAR_AO 0
#elif ENABLE_SPECULAR_AO==1
#undef ENABLE_SPECULAR_AO
#define ENABLE_SPECULAR_AO 1
#endif
#ifndef ENABLE_UV2
#define ENABLE_UV2 0
#elif ENABLE_UV2==1
#undef ENABLE_UV2
#define ENABLE_UV2 1
#endif
#ifndef NODE_13_DROPLIST_ITEM
#define NODE_13_DROPLIST_ITEM 0
#endif
#ifndef uv2EnableAnimation
#define uv2EnableAnimation 0
#elif uv2EnableAnimation==1
#undef uv2EnableAnimation
#define uv2EnableAnimation 1
#endif
#ifndef ENABLE_UV3
#define ENABLE_UV3 0
#elif ENABLE_UV3==1
#undef ENABLE_UV3
#define ENABLE_UV3 1
#endif
#ifndef NODE_49_DROPLIST_ITEM
#define NODE_49_DROPLIST_ITEM 0
#endif
#ifndef uv3EnableAnimation
#define uv3EnableAnimation 0
#elif uv3EnableAnimation==1
#undef uv3EnableAnimation
#define uv3EnableAnimation 1
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
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform mat3 opacityTexTransform;
uniform vec4 opacityTexUvMinMax;
uniform vec4 opacityTexBorderColor;
uniform mat3 normalTexTransform;
uniform vec4 normalTexUvMinMax;
uniform vec4 normalTexBorderColor;
uniform mat3 detailNormalTexTransform;
uniform vec4 detailNormalTexUvMinMax;
uniform vec4 detailNormalTexBorderColor;
uniform mat3 emissiveTexTransform;
uniform vec4 emissiveTexUvMinMax;
uniform vec4 emissiveTexBorderColor;
uniform mat3 reflectionTexTransform;
uniform vec4 reflectionTexUvMinMax;
uniform vec4 reflectionTexBorderColor;
uniform mat3 reflectionModulationTexTransform;
uniform vec4 reflectionModulationTexUvMinMax;
uniform vec4 reflectionModulationTexBorderColor;
uniform mat3 rimColorTexTransform;
uniform vec4 rimColorTexUvMinMax;
uniform vec4 rimColorTexBorderColor;
uniform mat3 materialParamsTexTransform;
uniform vec4 materialParamsTexUvMinMax;
uniform vec4 materialParamsTexBorderColor;
uniform vec4 baseColor;
uniform vec3 recolorRed;
uniform vec3 recolorGreen;
uniform vec3 recolorBlue;
uniform vec3 emissiveColor;
uniform float emissiveIntensity;
uniform float reflectionIntensity;
uniform vec3 rimColor;
uniform float rimIntensity;
uniform float rimExponent;
uniform float metallic;
uniform float roughness;
uniform float specularAoIntensity;
uniform float specularAoDarkening;
uniform vec2 uv2Scale;
uniform vec2 uv2Offset;
uniform vec2 uv3Scale;
uniform vec2 uv3Offset;
uniform sc_Camera_t sc_Camera;
uniform vec4 sc_Time;
uniform mat3 bodyDepthTexTransform;
uniform vec4 bodyDepthTexUvMinMax;
uniform vec4 bodyDepthTexBorderColor;
uniform vec4 bodyDepthTexProjectionMatrixTerms;
uniform int PreviewEnabled;
uniform sampler2D baseTex;
uniform sampler2D opacityTex;
uniform sampler2D normalTex;
uniform sampler2D detailNormalTex;
uniform sampler2D emissiveTex;
uniform sampler2D reflectionTex;
uniform sampler2D reflectionModulationTex;
uniform sampler2D rimColorTex;
uniform sampler2D materialParamsTex;
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
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varColor;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
bool N7_EnableUV2;
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
vec2 N7_gettransformUV(int pickUV,vec2 scale,vec2 offset,bool animated,bool enabled)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (enabled==N7_EnableUV2)
{
vec2 l9_2;
if (pickUV==0)
{
l9_2=tempGlobals.Surface_UVCoord0;
}
else
{
l9_2=l9_0;
}
vec2 l9_3;
if (pickUV==1)
{
l9_3=tempGlobals.Surface_UVCoord1;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==2)
{
l9_4=tempGlobals.gScreenCoord;
}
else
{
l9_4=l9_3;
}
l9_1=l9_4;
}
else
{
vec2 l9_5;
if (pickUV==0)
{
l9_5=tempGlobals.Surface_UVCoord0;
}
else
{
l9_5=l9_0;
}
vec2 l9_6;
if (pickUV==1)
{
l9_6=tempGlobals.Surface_UVCoord1;
}
else
{
l9_6=l9_5;
}
vec2 l9_7;
if (pickUV==2)
{
l9_7=tempGlobals.gScreenCoord;
}
else
{
l9_7=l9_6;
}
vec2 l9_8;
if (pickUV==3)
{
l9_8=tempGlobals.N7_TransformedUV2;
}
else
{
l9_8=l9_7;
}
l9_1=l9_8;
}
vec2 l9_9=scale;
vec2 l9_10=l9_1*l9_9;
vec2 l9_11=offset;
vec2 l9_12=l9_10+l9_11;
vec2 l9_13;
if (animated)
{
l9_13=l9_12+(offset*tempGlobals.gTimeElapsed);
}
else
{
l9_13=l9_12;
}
return l9_13;
}
vec2 N7_getUV(int pickUV)
{
vec2 l9_0=tempGlobals.Surface_UVCoord0;
vec2 l9_1;
if (pickUV==0)
{
l9_1=tempGlobals.Surface_UVCoord0;
}
else
{
l9_1=l9_0;
}
vec2 l9_2;
if (pickUV==1)
{
l9_2=tempGlobals.Surface_UVCoord1;
}
else
{
l9_2=l9_1;
}
vec2 l9_3;
if (pickUV==2)
{
l9_3=tempGlobals.N7_TransformedUV2;
}
else
{
l9_3=l9_2;
}
vec2 l9_4;
if (pickUV==3)
{
l9_4=tempGlobals.N7_TransformedUV3;
}
else
{
l9_4=l9_3;
}
return l9_4;
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
vec3 ssPow(vec3 A,vec3 B)
{
float l9_0;
if (A.x<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A.x,B.x);
}
float l9_1;
if (A.y<=0.0)
{
l9_1=0.0;
}
else
{
l9_1=pow(A.y,B.y);
}
float l9_2;
if (A.z<=0.0)
{
l9_2=0.0;
}
else
{
l9_2=pow(A.z,B.z);
}
return vec3(l9_0,l9_1,l9_2);
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
float Dggx(float NdotH,float roughness_1)
{
float l9_0=roughness_1*roughness_1;
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
vec3 getSpecularDominantDir(vec3 N,vec3 R,float roughness_1)
{
#if (SC_DEVICE_CLASS>=2)
{
return normalize(mix(R,N,vec3((roughness_1*roughness_1)*roughness_1)));
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
N7_EnableUV2=false;
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
vec3 l9_0=normalize(varNormal);
vec3 l9_1=normalize(varTangent.xyz);
vec2 l9_2=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_3=sc_ScreenCoordsGlobalToView(l9_2);
vec3 l9_4=normalize(sc_Camera.position-varPos);
ssGlobals l9_5=ssGlobals(sc_Time.x,sc_Time.y,0.0,vec2(0.0),vec2(0.0),vec3(0.0),l9_4,varPos,l9_0,l9_1,cross(l9_0,l9_1)*varTangent.w,varPackedTex.xy,varPackedTex.zw,varColor,l9_3,varPos);
tempGlobals=l9_5;
N7_EnableUV2=(int(ENABLE_UV2)!=0);
tempGlobals.N7_TransformedUV2=N7_gettransformUV(NODE_13_DROPLIST_ITEM,uv2Scale,uv2Offset,(int(uv2EnableAnimation)!=0),N7_EnableUV2);
tempGlobals.N7_TransformedUV3=N7_gettransformUV(NODE_49_DROPLIST_ITEM,uv3Scale,uv3Offset,(int(uv3EnableAnimation)!=0),(int(ENABLE_UV3)!=0));
vec4 l9_6;
#if (ENABLE_BASE_TEX)
{
vec2 l9_7=N7_getUV(NODE_27_DROPLIST_ITEM);
int l9_8;
#if (baseTexHasSwappedViews)
{
l9_8=1-sc_GetStereoViewIndex();
}
#else
{
l9_8=sc_GetStereoViewIndex();
}
#endif
bool l9_9=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_10=l9_7.x;
sc_SoftwareWrapEarly(l9_10,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_11=l9_10;
float l9_12=l9_7.y;
sc_SoftwareWrapEarly(l9_12,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_13=l9_12;
vec2 l9_14;
float l9_15;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_16;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_16=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_16=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_17=l9_11;
float l9_18=1.0;
sc_ClampUV(l9_17,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_16,l9_18);
float l9_19=l9_17;
float l9_20=l9_18;
bool l9_21;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_21=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_21=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_22=l9_13;
float l9_23=l9_20;
sc_ClampUV(l9_22,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_21,l9_23);
l9_15=l9_23;
l9_14=vec2(l9_19,l9_22);
}
#else
{
l9_15=1.0;
l9_14=vec2(l9_11,l9_13);
}
#endif
vec2 l9_24=sc_TransformUV(l9_14,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_25=l9_24.x;
float l9_26=l9_15;
sc_SoftwareWrapLate(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_9,l9_26);
float l9_27=l9_24.y;
float l9_28=l9_26;
sc_SoftwareWrapLate(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_9,l9_28);
float l9_29=l9_28;
vec3 l9_30=sc_SamplingCoordsViewToGlobal(vec2(l9_25,l9_27),baseTexLayout,l9_8);
vec4 l9_31=texture2D(baseTex,l9_30.xy,0.0);
vec4 l9_32;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_32=mix(baseTexBorderColor,l9_31,vec4(l9_29));
}
#else
{
l9_32=l9_31;
}
#endif
l9_6=baseColor*l9_32;
}
#else
{
l9_6=baseColor;
}
#endif
vec4 l9_33;
#if (ENABLE_RECOLOR)
{
vec3 l9_34=((recolorRed*l9_6.x)+(recolorGreen*l9_6.y))+(recolorBlue*l9_6.z);
l9_33=vec4(l9_34.x,l9_34.y,l9_34.z,l9_6.w);
}
#else
{
l9_33=l9_6;
}
#endif
float l9_35;
#if (ENABLE_OPACITY_TEX)
{
vec2 l9_36=N7_getUV(NODE_69_DROPLIST_ITEM);
int l9_37;
#if (opacityTexHasSwappedViews)
{
l9_37=1-sc_GetStereoViewIndex();
}
#else
{
l9_37=sc_GetStereoViewIndex();
}
#endif
bool l9_38=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTex)!=0));
float l9_39=l9_36.x;
sc_SoftwareWrapEarly(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x);
float l9_40=l9_39;
float l9_41=l9_36.y;
sc_SoftwareWrapEarly(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y);
float l9_42=l9_41;
vec2 l9_43;
float l9_44;
#if (SC_USE_UV_MIN_MAX_opacityTex)
{
bool l9_45;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_45=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x==3;
}
#else
{
l9_45=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_46=l9_40;
float l9_47=1.0;
sc_ClampUV(l9_46,opacityTexUvMinMax.x,opacityTexUvMinMax.z,l9_45,l9_47);
float l9_48=l9_46;
float l9_49=l9_47;
bool l9_50;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_50=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y==3;
}
#else
{
l9_50=(int(SC_USE_CLAMP_TO_BORDER_opacityTex)!=0);
}
#endif
float l9_51=l9_42;
float l9_52=l9_49;
sc_ClampUV(l9_51,opacityTexUvMinMax.y,opacityTexUvMinMax.w,l9_50,l9_52);
l9_44=l9_52;
l9_43=vec2(l9_48,l9_51);
}
#else
{
l9_44=1.0;
l9_43=vec2(l9_40,l9_42);
}
#endif
vec2 l9_53=sc_TransformUV(l9_43,(int(SC_USE_UV_TRANSFORM_opacityTex)!=0),opacityTexTransform);
float l9_54=l9_53.x;
float l9_55=l9_44;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).x,l9_38,l9_55);
float l9_56=l9_53.y;
float l9_57=l9_55;
sc_SoftwareWrapLate(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTex,SC_SOFTWARE_WRAP_MODE_V_opacityTex).y,l9_38,l9_57);
float l9_58=l9_57;
vec3 l9_59=sc_SamplingCoordsViewToGlobal(vec2(l9_54,l9_56),opacityTexLayout,l9_37);
vec4 l9_60=texture2D(opacityTex,l9_59.xy,0.0);
vec4 l9_61;
#if (SC_USE_CLAMP_TO_BORDER_opacityTex)
{
l9_61=mix(opacityTexBorderColor,l9_60,vec4(l9_58));
}
#else
{
l9_61=l9_60;
}
#endif
l9_35=l9_61.x;
}
#else
{
l9_35=1.0;
}
#endif
float l9_62=l9_35*l9_33.w;
vec4 l9_63;
float l9_64;
if (NODE_38_DROPLIST_ITEM==1)
{
l9_64=l9_62*tempGlobals.VertexColor.w;
l9_63=l9_33*tempGlobals.VertexColor;
}
else
{
l9_64=l9_62;
l9_63=l9_33;
}
vec3 l9_65;
#if (ENABLE_NORMALMAP)
{
vec2 l9_66=N7_getUV(NODE_181_DROPLIST_ITEM);
int l9_67;
#if (normalTexHasSwappedViews)
{
l9_67=1-sc_GetStereoViewIndex();
}
#else
{
l9_67=sc_GetStereoViewIndex();
}
#endif
bool l9_68=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_normalTex)!=0));
float l9_69=l9_66.x;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x);
float l9_70=l9_69;
float l9_71=l9_66.y;
sc_SoftwareWrapEarly(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y);
float l9_72=l9_71;
vec2 l9_73;
float l9_74;
#if (SC_USE_UV_MIN_MAX_normalTex)
{
bool l9_75;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_75=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x==3;
}
#else
{
l9_75=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_76=l9_70;
float l9_77=1.0;
sc_ClampUV(l9_76,normalTexUvMinMax.x,normalTexUvMinMax.z,l9_75,l9_77);
float l9_78=l9_76;
float l9_79=l9_77;
bool l9_80;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_80=ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y==3;
}
#else
{
l9_80=(int(SC_USE_CLAMP_TO_BORDER_normalTex)!=0);
}
#endif
float l9_81=l9_72;
float l9_82=l9_79;
sc_ClampUV(l9_81,normalTexUvMinMax.y,normalTexUvMinMax.w,l9_80,l9_82);
l9_74=l9_82;
l9_73=vec2(l9_78,l9_81);
}
#else
{
l9_74=1.0;
l9_73=vec2(l9_70,l9_72);
}
#endif
vec2 l9_83=sc_TransformUV(l9_73,(int(SC_USE_UV_TRANSFORM_normalTex)!=0),normalTexTransform);
float l9_84=l9_83.x;
float l9_85=l9_74;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).x,l9_68,l9_85);
float l9_86=l9_83.y;
float l9_87=l9_85;
sc_SoftwareWrapLate(l9_86,ivec2(SC_SOFTWARE_WRAP_MODE_U_normalTex,SC_SOFTWARE_WRAP_MODE_V_normalTex).y,l9_68,l9_87);
float l9_88=l9_87;
vec3 l9_89=sc_SamplingCoordsViewToGlobal(vec2(l9_84,l9_86),normalTexLayout,l9_67);
vec4 l9_90=texture2D(normalTex,l9_89.xy,0.0);
vec4 l9_91;
#if (SC_USE_CLAMP_TO_BORDER_normalTex)
{
l9_91=mix(normalTexBorderColor,l9_90,vec4(l9_88));
}
#else
{
l9_91=l9_90;
}
#endif
vec3 l9_92;
#if (ENABLE_DETAIL_NORMAL)
{
vec2 l9_93=N7_getUV(NODE_184_DROPLIST_ITEM);
int l9_94;
#if (detailNormalTexHasSwappedViews)
{
l9_94=1-sc_GetStereoViewIndex();
}
#else
{
l9_94=sc_GetStereoViewIndex();
}
#endif
bool l9_95=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_detailNormalTex)!=0));
float l9_96=l9_93.x;
sc_SoftwareWrapEarly(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x);
float l9_97=l9_96;
float l9_98=l9_93.y;
sc_SoftwareWrapEarly(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y);
float l9_99=l9_98;
vec2 l9_100;
float l9_101;
#if (SC_USE_UV_MIN_MAX_detailNormalTex)
{
bool l9_102;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_102=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x==3;
}
#else
{
l9_102=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_103=l9_97;
float l9_104=1.0;
sc_ClampUV(l9_103,detailNormalTexUvMinMax.x,detailNormalTexUvMinMax.z,l9_102,l9_104);
float l9_105=l9_103;
float l9_106=l9_104;
bool l9_107;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_107=ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y==3;
}
#else
{
l9_107=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex)!=0);
}
#endif
float l9_108=l9_99;
float l9_109=l9_106;
sc_ClampUV(l9_108,detailNormalTexUvMinMax.y,detailNormalTexUvMinMax.w,l9_107,l9_109);
l9_101=l9_109;
l9_100=vec2(l9_105,l9_108);
}
#else
{
l9_101=1.0;
l9_100=vec2(l9_97,l9_99);
}
#endif
vec2 l9_110=sc_TransformUV(l9_100,(int(SC_USE_UV_TRANSFORM_detailNormalTex)!=0),detailNormalTexTransform);
float l9_111=l9_110.x;
float l9_112=l9_101;
sc_SoftwareWrapLate(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).x,l9_95,l9_112);
float l9_113=l9_110.y;
float l9_114=l9_112;
sc_SoftwareWrapLate(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex).y,l9_95,l9_114);
float l9_115=l9_114;
vec3 l9_116=sc_SamplingCoordsViewToGlobal(vec2(l9_111,l9_113),detailNormalTexLayout,l9_94);
vec4 l9_117=texture2D(detailNormalTex,l9_116.xy,0.0);
vec4 l9_118;
#if (SC_USE_CLAMP_TO_BORDER_detailNormalTex)
{
l9_118=mix(detailNormalTexBorderColor,l9_117,vec4(l9_115));
}
#else
{
l9_118=l9_117;
}
#endif
l9_92=(l9_118.xyz*1.9921875)-vec3(1.0);
}
#else
{
l9_92=vec3(0.0,0.0,1.0);
}
#endif
vec3 l9_119=((l9_91.xyz*1.9921875)-vec3(1.0))+vec3(0.0,0.0,1.0);
vec3 l9_120=l9_92*vec3(-1.0,-1.0,1.0);
l9_65=normalize(mat3(tempGlobals.VertexTangent_WorldSpace,tempGlobals.VertexBinormal_WorldSpace,tempGlobals.VertexNormal_WorldSpace)*normalize((l9_119*dot(l9_119,l9_120))-(l9_120*l9_119.z)));
}
#else
{
l9_65=normalize(tempGlobals.VertexNormal_WorldSpace);
}
#endif
vec3 l9_121;
#if (ENABLE_EMISSIVE)
{
vec2 l9_122=N7_getUV(NODE_76_DROPLIST_ITEM);
int l9_123;
#if (emissiveTexHasSwappedViews)
{
l9_123=1-sc_GetStereoViewIndex();
}
#else
{
l9_123=sc_GetStereoViewIndex();
}
#endif
bool l9_124=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_emissiveTex)!=0));
float l9_125=l9_122.x;
sc_SoftwareWrapEarly(l9_125,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x);
float l9_126=l9_125;
float l9_127=l9_122.y;
sc_SoftwareWrapEarly(l9_127,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y);
float l9_128=l9_127;
vec2 l9_129;
float l9_130;
#if (SC_USE_UV_MIN_MAX_emissiveTex)
{
bool l9_131;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_131=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x==3;
}
#else
{
l9_131=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_132=l9_126;
float l9_133=1.0;
sc_ClampUV(l9_132,emissiveTexUvMinMax.x,emissiveTexUvMinMax.z,l9_131,l9_133);
float l9_134=l9_132;
float l9_135=l9_133;
bool l9_136;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_136=ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y==3;
}
#else
{
l9_136=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex)!=0);
}
#endif
float l9_137=l9_128;
float l9_138=l9_135;
sc_ClampUV(l9_137,emissiveTexUvMinMax.y,emissiveTexUvMinMax.w,l9_136,l9_138);
l9_130=l9_138;
l9_129=vec2(l9_134,l9_137);
}
#else
{
l9_130=1.0;
l9_129=vec2(l9_126,l9_128);
}
#endif
vec2 l9_139=sc_TransformUV(l9_129,(int(SC_USE_UV_TRANSFORM_emissiveTex)!=0),emissiveTexTransform);
float l9_140=l9_139.x;
float l9_141=l9_130;
sc_SoftwareWrapLate(l9_140,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).x,l9_124,l9_141);
float l9_142=l9_139.y;
float l9_143=l9_141;
sc_SoftwareWrapLate(l9_142,ivec2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex,SC_SOFTWARE_WRAP_MODE_V_emissiveTex).y,l9_124,l9_143);
float l9_144=l9_143;
vec3 l9_145=sc_SamplingCoordsViewToGlobal(vec2(l9_140,l9_142),emissiveTexLayout,l9_123);
vec4 l9_146=texture2D(emissiveTex,l9_145.xy,0.0);
vec4 l9_147;
#if (SC_USE_CLAMP_TO_BORDER_emissiveTex)
{
l9_147=mix(emissiveTexBorderColor,l9_146,vec4(l9_144));
}
#else
{
l9_147=l9_146;
}
#endif
l9_121=l9_147.xyz;
}
#else
{
l9_121=vec3(0.0);
}
#endif
bool l9_148=NODE_38_DROPLIST_ITEM==2;
vec3 l9_149;
if (l9_148)
{
l9_149=l9_121+tempGlobals.VertexColor.xyz;
}
else
{
l9_149=l9_121;
}
vec3 l9_150;
if (l9_148||(int(ENABLE_EMISSIVE)!=0))
{
l9_150=ssPow((l9_149*emissiveColor)*vec3(emissiveIntensity),vec3(2.2));
}
else
{
l9_150=l9_149;
}
vec3 l9_151;
#if (ENABLE_SIMPLE_REFLECTION)
{
vec3 l9_152=tempGlobals.ViewDirWS;
vec3 l9_153=reflect(l9_152,l9_65);
float l9_154=l9_153.x;
float l9_155=l9_153.y;
float l9_156=(-l9_153.z)+1.0;
float l9_157=((l9_154*l9_154)+(l9_155*l9_155))+(l9_156*l9_156);
float l9_158;
if (l9_157<=0.0)
{
l9_158=0.0;
}
else
{
l9_158=sqrt(l9_157);
}
float l9_159=2.0*l9_158;
vec2 l9_160=vec2(1.0)-((l9_153.xy/vec2(l9_159))+vec2(0.5));
int l9_161;
#if (reflectionTexHasSwappedViews)
{
l9_161=1-sc_GetStereoViewIndex();
}
#else
{
l9_161=sc_GetStereoViewIndex();
}
#endif
bool l9_162=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionTex)!=0));
float l9_163=l9_160.x;
sc_SoftwareWrapEarly(l9_163,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x);
float l9_164=l9_163;
float l9_165=l9_160.y;
sc_SoftwareWrapEarly(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y);
float l9_166=l9_165;
vec2 l9_167;
float l9_168;
#if (SC_USE_UV_MIN_MAX_reflectionTex)
{
bool l9_169;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_169=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x==3;
}
#else
{
l9_169=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_170=l9_164;
float l9_171=1.0;
sc_ClampUV(l9_170,reflectionTexUvMinMax.x,reflectionTexUvMinMax.z,l9_169,l9_171);
float l9_172=l9_170;
float l9_173=l9_171;
bool l9_174;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_174=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y==3;
}
#else
{
l9_174=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex)!=0);
}
#endif
float l9_175=l9_166;
float l9_176=l9_173;
sc_ClampUV(l9_175,reflectionTexUvMinMax.y,reflectionTexUvMinMax.w,l9_174,l9_176);
l9_168=l9_176;
l9_167=vec2(l9_172,l9_175);
}
#else
{
l9_168=1.0;
l9_167=vec2(l9_164,l9_166);
}
#endif
vec2 l9_177=sc_TransformUV(l9_167,(int(SC_USE_UV_TRANSFORM_reflectionTex)!=0),reflectionTexTransform);
float l9_178=l9_177.x;
float l9_179=l9_168;
sc_SoftwareWrapLate(l9_178,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).x,l9_162,l9_179);
float l9_180=l9_177.y;
float l9_181=l9_179;
sc_SoftwareWrapLate(l9_180,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex,SC_SOFTWARE_WRAP_MODE_V_reflectionTex).y,l9_162,l9_181);
float l9_182=l9_181;
vec3 l9_183=sc_SamplingCoordsViewToGlobal(vec2(l9_178,l9_180),reflectionTexLayout,l9_161);
vec4 l9_184=texture2D(reflectionTex,l9_183.xy,0.0);
vec4 l9_185;
#if (SC_USE_CLAMP_TO_BORDER_reflectionTex)
{
l9_185=mix(reflectionTexBorderColor,l9_184,vec4(l9_182));
}
#else
{
l9_185=l9_184;
}
#endif
vec3 l9_186;
#if (Tweak_N177)
{
vec2 l9_187=N7_getUV(NODE_228_DROPLIST_ITEM);
int l9_188;
#if (reflectionModulationTexHasSwappedViews)
{
l9_188=1-sc_GetStereoViewIndex();
}
#else
{
l9_188=sc_GetStereoViewIndex();
}
#endif
bool l9_189=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_reflectionModulationTex)!=0));
float l9_190=l9_187.x;
sc_SoftwareWrapEarly(l9_190,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x);
float l9_191=l9_190;
float l9_192=l9_187.y;
sc_SoftwareWrapEarly(l9_192,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y);
float l9_193=l9_192;
vec2 l9_194;
float l9_195;
#if (SC_USE_UV_MIN_MAX_reflectionModulationTex)
{
bool l9_196;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_196=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x==3;
}
#else
{
l9_196=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_197=l9_191;
float l9_198=1.0;
sc_ClampUV(l9_197,reflectionModulationTexUvMinMax.x,reflectionModulationTexUvMinMax.z,l9_196,l9_198);
float l9_199=l9_197;
float l9_200=l9_198;
bool l9_201;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_201=ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y==3;
}
#else
{
l9_201=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)!=0);
}
#endif
float l9_202=l9_193;
float l9_203=l9_200;
sc_ClampUV(l9_202,reflectionModulationTexUvMinMax.y,reflectionModulationTexUvMinMax.w,l9_201,l9_203);
l9_195=l9_203;
l9_194=vec2(l9_199,l9_202);
}
#else
{
l9_195=1.0;
l9_194=vec2(l9_191,l9_193);
}
#endif
vec2 l9_204=sc_TransformUV(l9_194,(int(SC_USE_UV_TRANSFORM_reflectionModulationTex)!=0),reflectionModulationTexTransform);
float l9_205=l9_204.x;
float l9_206=l9_195;
sc_SoftwareWrapLate(l9_205,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).x,l9_189,l9_206);
float l9_207=l9_204.y;
float l9_208=l9_206;
sc_SoftwareWrapLate(l9_207,ivec2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex).y,l9_189,l9_208);
float l9_209=l9_208;
vec3 l9_210=sc_SamplingCoordsViewToGlobal(vec2(l9_205,l9_207),reflectionModulationTexLayout,l9_188);
vec4 l9_211=texture2D(reflectionModulationTex,l9_210.xy,0.0);
vec4 l9_212;
#if (SC_USE_CLAMP_TO_BORDER_reflectionModulationTex)
{
l9_212=mix(reflectionModulationTexBorderColor,l9_211,vec4(l9_209));
}
#else
{
l9_212=l9_211;
}
#endif
l9_186=l9_185.xyz*l9_212.xyz;
}
#else
{
l9_186=l9_185.xyz;
}
#endif
l9_151=ssSRGB_to_Linear(l9_186)*reflectionIntensity;
}
#else
{
l9_151=vec3(0.0);
}
#endif
vec3 l9_213;
#if (ENABLE_RIM_HIGHLIGHT)
{
vec3 l9_214=rimColor*rimIntensity;
vec3 l9_215;
#if (Tweak_N216)
{
vec2 l9_216=N7_getUV(NODE_315_DROPLIST_ITEM);
int l9_217;
#if (rimColorTexHasSwappedViews)
{
l9_217=1-sc_GetStereoViewIndex();
}
#else
{
l9_217=sc_GetStereoViewIndex();
}
#endif
bool l9_218=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_rimColorTex)!=0));
float l9_219=l9_216.x;
sc_SoftwareWrapEarly(l9_219,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x);
float l9_220=l9_219;
float l9_221=l9_216.y;
sc_SoftwareWrapEarly(l9_221,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y);
float l9_222=l9_221;
vec2 l9_223;
float l9_224;
#if (SC_USE_UV_MIN_MAX_rimColorTex)
{
bool l9_225;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_225=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x==3;
}
#else
{
l9_225=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_226=l9_220;
float l9_227=1.0;
sc_ClampUV(l9_226,rimColorTexUvMinMax.x,rimColorTexUvMinMax.z,l9_225,l9_227);
float l9_228=l9_226;
float l9_229=l9_227;
bool l9_230;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_230=ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y==3;
}
#else
{
l9_230=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex)!=0);
}
#endif
float l9_231=l9_222;
float l9_232=l9_229;
sc_ClampUV(l9_231,rimColorTexUvMinMax.y,rimColorTexUvMinMax.w,l9_230,l9_232);
l9_224=l9_232;
l9_223=vec2(l9_228,l9_231);
}
#else
{
l9_224=1.0;
l9_223=vec2(l9_220,l9_222);
}
#endif
vec2 l9_233=sc_TransformUV(l9_223,(int(SC_USE_UV_TRANSFORM_rimColorTex)!=0),rimColorTexTransform);
float l9_234=l9_233.x;
float l9_235=l9_224;
sc_SoftwareWrapLate(l9_234,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).x,l9_218,l9_235);
float l9_236=l9_233.y;
float l9_237=l9_235;
sc_SoftwareWrapLate(l9_236,ivec2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex,SC_SOFTWARE_WRAP_MODE_V_rimColorTex).y,l9_218,l9_237);
float l9_238=l9_237;
vec3 l9_239=sc_SamplingCoordsViewToGlobal(vec2(l9_234,l9_236),rimColorTexLayout,l9_217);
vec4 l9_240=texture2D(rimColorTex,l9_239.xy,0.0);
vec4 l9_241;
#if (SC_USE_CLAMP_TO_BORDER_rimColorTex)
{
l9_241=mix(rimColorTexBorderColor,l9_240,vec4(l9_238));
}
#else
{
l9_241=l9_240;
}
#endif
l9_215=l9_214*l9_241.xyz;
}
#else
{
l9_215=l9_214;
}
#endif
vec3 l9_242=tempGlobals.ViewDirWS;
float l9_243=dot(l9_65,l9_242);
float l9_244=abs(l9_243);
float l9_245;
if (!(int(ENABLE_RIM_INVERT)!=0))
{
l9_245=1.0-l9_244;
}
else
{
l9_245=l9_244;
}
l9_213=vec3(0.0)+(ssSRGB_to_Linear(l9_215)*ssPow(l9_245,rimExponent));
}
#else
{
l9_213=vec3(0.0);
}
#endif
vec3 l9_246=ssPow((l9_150+l9_151)+l9_213,vec3(0.45454547));
vec3 l9_247;
if (NODE_38_DROPLIST_ITEM==3)
{
l9_247=tempGlobals.VertexColor.xyz;
}
else
{
l9_247=vec3(1.0);
}
float l9_248;
vec3 l9_249;
float l9_250;
#if (ENABLE_MATERIAL_PARAM_TEX)
{
vec2 l9_251=N7_getUV(NODE_221_DROPLIST_ITEM);
int l9_252;
#if (materialParamsTexHasSwappedViews)
{
l9_252=1-sc_GetStereoViewIndex();
}
#else
{
l9_252=sc_GetStereoViewIndex();
}
#endif
bool l9_253=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_materialParamsTex)!=0));
float l9_254=l9_251.x;
sc_SoftwareWrapEarly(l9_254,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x);
float l9_255=l9_254;
float l9_256=l9_251.y;
sc_SoftwareWrapEarly(l9_256,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y);
float l9_257=l9_256;
vec2 l9_258;
float l9_259;
#if (SC_USE_UV_MIN_MAX_materialParamsTex)
{
bool l9_260;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_260=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x==3;
}
#else
{
l9_260=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_261=l9_255;
float l9_262=1.0;
sc_ClampUV(l9_261,materialParamsTexUvMinMax.x,materialParamsTexUvMinMax.z,l9_260,l9_262);
float l9_263=l9_261;
float l9_264=l9_262;
bool l9_265;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_265=ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y==3;
}
#else
{
l9_265=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex)!=0);
}
#endif
float l9_266=l9_257;
float l9_267=l9_264;
sc_ClampUV(l9_266,materialParamsTexUvMinMax.y,materialParamsTexUvMinMax.w,l9_265,l9_267);
l9_259=l9_267;
l9_258=vec2(l9_263,l9_266);
}
#else
{
l9_259=1.0;
l9_258=vec2(l9_255,l9_257);
}
#endif
vec2 l9_268=sc_TransformUV(l9_258,(int(SC_USE_UV_TRANSFORM_materialParamsTex)!=0),materialParamsTexTransform);
float l9_269=l9_268.x;
float l9_270=l9_259;
sc_SoftwareWrapLate(l9_269,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).x,l9_253,l9_270);
float l9_271=l9_268.y;
float l9_272=l9_270;
sc_SoftwareWrapLate(l9_271,ivec2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex).y,l9_253,l9_272);
float l9_273=l9_272;
vec3 l9_274=sc_SamplingCoordsViewToGlobal(vec2(l9_269,l9_271),materialParamsTexLayout,l9_252);
vec4 l9_275=texture2D(materialParamsTex,l9_274.xy,0.0);
vec4 l9_276;
#if (SC_USE_CLAMP_TO_BORDER_materialParamsTex)
{
l9_276=mix(materialParamsTexBorderColor,l9_275,vec4(l9_273));
}
#else
{
l9_276=l9_275;
}
#endif
l9_250=roughness*l9_276.y;
l9_249=l9_247*l9_276.z;
l9_248=metallic*l9_276.x;
}
#else
{
l9_250=roughness;
l9_249=l9_247;
l9_248=metallic;
}
#endif
vec3 l9_277;
#if (ENABLE_SPECULAR_AO)
{
vec3 l9_278=mix(vec3(0.039999999),l9_63.xyz*l9_248,vec3(l9_248));
l9_277=mix(vec3(1.0),mix((l9_278*(1.0-specularAoDarkening))*l9_278,vec3(1.0),vec3(l9_249.x)),vec3(specularAoIntensity));
}
#else
{
l9_277=vec3(1.0);
}
#endif
vec3 l9_279;
#if (ENABLE_SIMPLE_REFLECTION)
{
l9_279=vec3(0.0);
}
#else
{
l9_279=l9_277;
}
#endif
vec3 l9_280;
#if (!sc_ProjectiveShadowsCaster)
{
l9_280=l9_65;
}
#else
{
l9_280=vec3(0.0);
}
#endif
float l9_281=clamp(l9_64,0.0,1.0);
#if (sc_BlendMode_AlphaTest)
{
if (l9_281<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_281<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec3 l9_282=max(l9_63.xyz,vec3(0.0));
vec4 l9_283;
#if (sc_ProjectiveShadowsCaster)
{
l9_283=vec4(l9_282,l9_281);
}
#else
{
float l9_284=clamp(l9_248,0.0,1.0);
float l9_285=clamp(l9_250,0.0,1.0);
vec3 l9_286=clamp(l9_249,vec3(0.0),vec3(1.0));
vec3 l9_287=clamp(l9_279,vec3(0.0),vec3(1.0));
vec3 l9_288=ssSRGB_to_Linear(l9_282);
vec3 l9_289=normalize(l9_280);
vec3 l9_290=ssSRGB_to_Linear(max(l9_246,vec3(0.0)));
vec3 l9_291;
#if (sc_SSAOEnabled)
{
l9_291=evaluateSSAO(varPos);
}
#else
{
l9_291=l9_286;
}
#endif
vec3 l9_292=vec3(l9_284);
vec3 l9_293=mix(vec3(0.039999999),l9_288*l9_284,l9_292);
vec3 l9_294=mix(l9_288*(1.0-l9_284),vec3(0.0),l9_292);
SurfaceProperties l9_295=SurfaceProperties(l9_294,l9_281,l9_289,varPos,l9_4,l9_284,l9_285,l9_290,l9_291,l9_287,vec3(1.0),l9_293);
vec4 l9_296=vec4(1.0);
vec3 l9_297;
vec3 l9_298;
vec3 l9_299;
vec3 l9_300;
int l9_301;
vec3 l9_302;
vec3 l9_303;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_304;
vec3 l9_305;
vec3 l9_306;
vec3 l9_307;
int l9_308;
vec3 l9_309;
vec3 l9_310;
l9_310=vec3(1.0);
l9_309=vec3(0.0);
l9_308=0;
l9_307=vec3(0.0);
l9_306=vec3(0.0);
l9_305=vec3(0.0);
l9_304=vec3(0.0);
LightingComponents l9_311;
LightProperties l9_312;
SurfaceProperties l9_313;
vec3 l9_314;
int l9_315=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_315<sc_DirectionalLightsCount)
{
LightingComponents l9_316=accumulateLight(LightingComponents(l9_304,l9_305,l9_310,l9_309,l9_307,l9_306),LightProperties(sc_DirectionalLights[l9_315].direction,sc_DirectionalLights[l9_315].color.xyz,sc_DirectionalLights[l9_315].color.w*l9_296[(l9_308<3) ? l9_308 : 3]),l9_295,l9_4);
l9_310=l9_316.indirectDiffuse;
l9_309=l9_316.indirectSpecular;
l9_308++;
l9_307=l9_316.emitted;
l9_306=l9_316.transmitted;
l9_305=l9_316.directSpecular;
l9_304=l9_316.directDiffuse;
l9_315++;
continue;
}
else
{
break;
}
}
l9_303=l9_310;
l9_302=l9_309;
l9_301=l9_308;
l9_300=l9_307;
l9_299=l9_306;
l9_298=l9_305;
l9_297=l9_304;
}
#else
{
l9_303=vec3(1.0);
l9_302=vec3(0.0);
l9_301=0;
l9_300=vec3(0.0);
l9_299=vec3(0.0);
l9_298=vec3(0.0);
l9_297=vec3(0.0);
}
#endif
vec3 l9_317;
vec3 l9_318;
vec3 l9_319;
#if (sc_PointLightsCount>0)
{
vec3 l9_320;
vec3 l9_321;
vec3 l9_322;
vec3 l9_323;
vec3 l9_324;
vec3 l9_325;
l9_325=l9_303;
l9_324=l9_302;
l9_323=l9_300;
l9_322=l9_299;
l9_321=l9_298;
l9_320=l9_297;
int l9_326;
vec3 l9_327;
vec3 l9_328;
vec3 l9_329;
vec3 l9_330;
vec3 l9_331;
vec3 l9_332;
int l9_333=0;
int l9_334=l9_301;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_333<sc_PointLightsCount)
{
vec3 l9_335=sc_PointLights[l9_333].position-varPos;
vec3 l9_336=normalize(l9_335);
float l9_337=l9_296[(l9_334<3) ? l9_334 : 3];
float l9_338=clamp((dot(l9_336,sc_PointLights[l9_333].direction)*sc_PointLights[l9_333].angleScale)+sc_PointLights[l9_333].angleOffset,0.0,1.0);
float l9_339=(sc_PointLights[l9_333].color.w*l9_337)*(l9_338*l9_338);
float l9_340;
if (sc_PointLights[l9_333].falloffEnabled)
{
l9_340=l9_339*computeDistanceAttenuation(length(l9_335),sc_PointLights[l9_333].falloffEndDistance);
}
else
{
l9_340=l9_339;
}
l9_326=l9_334+1;
LightingComponents l9_341=accumulateLight(LightingComponents(l9_320,l9_321,l9_325,l9_324,l9_323,l9_322),LightProperties(l9_336,sc_PointLights[l9_333].color.xyz,l9_340),l9_295,l9_4);
l9_327=l9_341.directDiffuse;
l9_328=l9_341.directSpecular;
l9_329=l9_341.indirectDiffuse;
l9_330=l9_341.indirectSpecular;
l9_331=l9_341.emitted;
l9_332=l9_341.transmitted;
l9_325=l9_329;
l9_324=l9_330;
l9_334=l9_326;
l9_323=l9_331;
l9_322=l9_332;
l9_321=l9_328;
l9_320=l9_327;
l9_333++;
continue;
}
else
{
break;
}
}
l9_319=l9_322;
l9_318=l9_321;
l9_317=l9_320;
}
#else
{
l9_319=l9_299;
l9_318=l9_298;
l9_317=l9_297;
}
#endif
vec3 l9_342;
vec3 l9_343;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_344;
#if (sc_ProjectiveShadowsReceiver)
{
vec2 l9_345=abs(varShadowTex-vec2(0.5));
vec4 l9_346=texture2D(sc_ShadowTexture,varShadowTex)*step(max(l9_345.x,l9_345.y),0.5);
l9_344=mix(vec3(1.0),mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_346.xyz,vec3(sc_ShadowColor.w)),vec3(l9_346.w*sc_ShadowDensity));
}
#else
{
l9_344=vec3(1.0);
}
#endif
l9_343=l9_317*l9_344;
l9_342=l9_318*l9_344;
}
#else
{
l9_343=l9_317;
l9_342=l9_318;
}
#endif
vec3 l9_347;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec2 l9_348=calcPanoramicTexCoordsFromDir(l9_289,sc_EnvmapRotation.y);
vec4 l9_349;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_350;
#if (SC_DEVICE_CLASS>=2)
{
l9_350=calcSeamlessPanoramicUvsForSampling(l9_348,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_350=l9_348;
}
#endif
l9_349=sc_EnvmapSpecularSampleViewIndexBias(l9_350,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#else
{
vec4 l9_351;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
vec2 l9_352=calcSeamlessPanoramicUvsForSampling(l9_348,sc_EnvmapDiffuseSize.xy,0.0);
int l9_353;
#if (sc_EnvmapDiffuseHasSwappedViews)
{
l9_353=1-sc_GetStereoViewIndex();
}
#else
{
l9_353=sc_GetStereoViewIndex();
}
#endif
l9_351=texture2D(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(l9_352,sc_EnvmapDiffuseLayout,l9_353).xy,-13.0);
}
#else
{
l9_351=sc_EnvmapSpecularSampleViewIndexBias(l9_348,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#endif
l9_349=l9_351;
}
#endif
l9_347=(l9_349.xyz*(1.0/l9_349.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_354;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_355=-l9_289;
float l9_356=l9_355.x;
float l9_357=l9_355.y;
float l9_358=l9_355.z;
l9_354=(((((((sc_Sh[8]*0.42904299)*((l9_356*l9_356)-(l9_357*l9_357)))+((sc_Sh[6]*0.74312502)*(l9_358*l9_358)))+(sc_Sh[0]*0.88622701))-(sc_Sh[6]*0.24770799))+((((sc_Sh[4]*(l9_356*l9_357))+(sc_Sh[7]*(l9_356*l9_358)))+(sc_Sh[5]*(l9_357*l9_358)))*0.85808599))+((((sc_Sh[3]*l9_356)+(sc_Sh[1]*l9_357))+(sc_Sh[2]*l9_358))*1.0233279))*sc_ShIntensity;
}
#else
{
l9_354=vec3(0.0);
}
#endif
l9_347=l9_354;
}
#endif
vec3 l9_359;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_360;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_360=l9_347+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_361=l9_347;
l9_361.x=l9_347.x+(1e-06*sc_AmbientLights[0].color.x);
l9_360=l9_361;
}
#endif
l9_359=l9_360;
}
#else
{
l9_359=l9_347;
}
#endif
vec3 l9_362;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_363;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_363=l9_359+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_364=l9_359;
l9_364.x=l9_359.x+(1e-06*sc_AmbientLights[1].color.x);
l9_363=l9_364;
}
#endif
l9_362=l9_363;
}
#else
{
l9_362=l9_359;
}
#endif
vec3 l9_365;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_366;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_366=l9_362+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_367=l9_362;
l9_367.x=l9_362.x+(1e-06*sc_AmbientLights[2].color.x);
l9_366=l9_367;
}
#endif
l9_365=l9_366;
}
#else
{
l9_365=l9_362;
}
#endif
vec3 l9_368;
#if (sc_LightEstimation)
{
vec3 l9_369;
l9_369=sc_LightEstimationData.ambientLight;
vec3 l9_370;
int l9_371=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_371<sc_LightEstimationSGCount)
{
float l9_372=dot(sc_LightEstimationData.sg[l9_371].axis,l9_289);
float l9_373=exp(-sc_LightEstimationData.sg[l9_371].sharpness);
float l9_374=l9_373*l9_373;
float l9_375=1.0/sc_LightEstimationData.sg[l9_371].sharpness;
float l9_376=(1.0+(2.0*l9_374))-l9_375;
float l9_377=sqrt(1.0-l9_376);
float l9_378=0.36000001*l9_372;
float l9_379=(1.0/(4.0*0.36000001))*l9_377;
float l9_380=l9_378+l9_379;
float l9_381;
if (step(abs(l9_378),l9_379)>0.5)
{
l9_381=(l9_380*l9_380)/l9_377;
}
else
{
l9_381=clamp(l9_372,0.0,1.0);
}
l9_370=l9_369+((((sc_LightEstimationData.sg[l9_371].color/vec3(sc_LightEstimationData.sg[l9_371].sharpness))*6.2831855)*((l9_376*l9_381)+(((l9_373-l9_374)*l9_375)-l9_374)))/vec3(3.1415927));
l9_369=l9_370;
l9_371++;
continue;
}
else
{
break;
}
}
l9_368=l9_365+l9_369;
}
#else
{
l9_368=l9_365;
}
#endif
vec3 l9_382;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_383=clamp(pow(l9_285,0.66666669),0.0,1.0)*5.0;
vec2 l9_384=calcPanoramicTexCoordsFromDir(getSpecularDominantDir(l9_289,reflect(-l9_4,l9_289),l9_285),sc_EnvmapRotation.y);
vec4 l9_385;
#if (SC_DEVICE_CLASS>=2)
{
float l9_386=floor(l9_383);
float l9_387=ceil(l9_383);
l9_385=mix(sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_384,sc_EnvmapSpecularSize.xy,l9_386),sc_EnvmapSpecularGetStereoViewIndex(),l9_386),sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_384,sc_EnvmapSpecularSize.xy,l9_387),sc_EnvmapSpecularGetStereoViewIndex(),l9_387),vec4(l9_383-l9_386));
}
#else
{
l9_385=sc_EnvmapSpecularSampleViewIndexLevel(l9_384,sc_EnvmapSpecularGetStereoViewIndex(),l9_383);
}
#endif
l9_382=vec3(0.0)+((((l9_385.xyz*(1.0/l9_385.w))*sc_EnvmapExposure)+vec3(1e-06))*envBRDFApprox(l9_295,abs(dot(l9_289,l9_4))));
}
#else
{
l9_382=vec3(0.0);
}
#endif
vec3 l9_388;
#if (sc_LightEstimation)
{
float l9_389=clamp(l9_285*l9_285,0.0099999998,1.0);
vec3 l9_390;
l9_390=sc_LightEstimationData.ambientLight*l9_293;
int l9_391=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_391<sc_LightEstimationSGCount)
{
float l9_392=l9_389*l9_389;
vec3 l9_393=reflect(-l9_4,l9_289);
float l9_394=dot(l9_289,l9_4);
float l9_395=(2.0/l9_392)/(4.0*max(l9_394,9.9999997e-05));
float l9_396=length((l9_393*l9_395)+(sc_LightEstimationData.sg[l9_391].axis*sc_LightEstimationData.sg[l9_391].sharpness));
float l9_397=clamp(dot(l9_289,l9_393),0.0,1.0);
float l9_398=clamp(l9_394,0.0,1.0);
float l9_399=1.0-l9_392;
l9_390+=((((((((vec3(1.0/(3.1415927*l9_392))*exp((l9_396-l9_395)-sc_LightEstimationData.sg[l9_391].sharpness))*sc_LightEstimationData.sg[l9_391].color)*6.2831855)*(1.0-exp((-2.0)*l9_396)))/vec3(l9_396))*((1.0/(l9_397+sqrt(l9_392+((l9_399*l9_397)*l9_397))))*(1.0/(l9_398+sqrt(l9_392+((l9_399*l9_398)*l9_398))))))*(l9_293+((vec3(1.0)-l9_293)*pow(1.0-clamp(dot(l9_393,normalize(l9_393+l9_4)),0.0,1.0),5.0))))*l9_397);
l9_391++;
continue;
}
else
{
break;
}
}
l9_388=l9_382+l9_390;
}
#else
{
l9_388=l9_382;
}
#endif
float l9_400;
vec3 l9_401;
vec3 l9_402;
vec3 l9_403;
#if (sc_BlendMode_ColoredGlass)
{
l9_403=vec3(0.0);
l9_402=vec3(0.0);
l9_401=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_294,vec3(l9_281));
l9_400=1.0;
}
#else
{
l9_403=l9_343;
l9_402=l9_368;
l9_401=l9_319;
l9_400=l9_281;
}
#endif
bool l9_404;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_404=true;
}
#else
{
l9_404=false;
}
#endif
vec3 l9_405=l9_402*l9_291;
vec3 l9_406=l9_403+l9_405;
vec3 l9_407=l9_294*l9_406;
vec3 l9_408=l9_388*l9_287;
vec3 l9_409=l9_342+l9_408;
vec3 l9_410;
if (l9_404)
{
l9_410=l9_407*srgbToLinear(l9_400);
}
else
{
l9_410=l9_407;
}
vec3 l9_411=l9_410+l9_409;
vec3 l9_412=(l9_411+l9_290)+l9_401;
float l9_413=l9_412.x;
vec4 l9_414=vec4(l9_413,l9_412.yz,l9_400);
vec4 l9_415;
#if (sc_IsEditor)
{
vec4 l9_416=l9_414;
l9_416.x=l9_413+((l9_291.x*l9_287.x)*9.9999997e-06);
l9_415=l9_416;
}
#else
{
l9_415=l9_414;
}
#endif
vec4 l9_417;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_418=l9_415.xyz*1.8;
vec3 l9_419=(l9_415.xyz*(l9_418+vec3(1.4)))/((l9_415.xyz*(l9_418+vec3(0.5)))+vec3(1.5));
l9_417=vec4(l9_419.x,l9_419.y,l9_419.z,l9_415.w);
}
#else
{
l9_417=l9_415;
}
#endif
vec3 l9_420=vec3(linearToSrgb(l9_417.x),linearToSrgb(l9_417.y),linearToSrgb(l9_417.z));
l9_283=vec4(l9_420.x,l9_420.y,l9_420.z,l9_417.w);
}
#endif
vec4 l9_421=max(l9_283,vec4(0.0));
int l9_422;
#if (bodyDepthTexHasSwappedViews)
{
l9_422=1-sc_GetStereoViewIndex();
}
#else
{
l9_422=sc_GetStereoViewIndex();
}
#endif
bool l9_423=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_bodyDepthTex)!=0));
float l9_424=l9_3.x;
sc_SoftwareWrapEarly(l9_424,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x);
float l9_425=l9_424;
float l9_426=l9_3.y;
sc_SoftwareWrapEarly(l9_426,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y);
float l9_427=l9_426;
vec2 l9_428;
float l9_429;
#if (SC_USE_UV_MIN_MAX_bodyDepthTex)
{
bool l9_430;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_430=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x==3;
}
#else
{
l9_430=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_431=l9_425;
float l9_432=1.0;
sc_ClampUV(l9_431,bodyDepthTexUvMinMax.x,bodyDepthTexUvMinMax.z,l9_430,l9_432);
float l9_433=l9_431;
float l9_434=l9_432;
bool l9_435;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_435=ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y==3;
}
#else
{
l9_435=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex)!=0);
}
#endif
float l9_436=l9_427;
float l9_437=l9_434;
sc_ClampUV(l9_436,bodyDepthTexUvMinMax.y,bodyDepthTexUvMinMax.w,l9_435,l9_437);
l9_429=l9_437;
l9_428=vec2(l9_433,l9_436);
}
#else
{
l9_429=1.0;
l9_428=vec2(l9_425,l9_427);
}
#endif
vec2 l9_438=sc_TransformUV(l9_428,(int(SC_USE_UV_TRANSFORM_bodyDepthTex)!=0),bodyDepthTexTransform);
float l9_439=l9_438.x;
float l9_440=l9_429;
sc_SoftwareWrapLate(l9_439,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).x,l9_423,l9_440);
float l9_441=l9_438.y;
float l9_442=l9_440;
sc_SoftwareWrapLate(l9_441,ivec2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex).y,l9_423,l9_442);
float l9_443=l9_442;
vec3 l9_444=sc_SamplingCoordsViewToGlobal(vec2(l9_439,l9_441),bodyDepthTexLayout,l9_422);
vec4 l9_445=texture2D(bodyDepthTex,l9_444.xy,0.0);
vec4 l9_446;
#if (SC_USE_CLAMP_TO_BORDER_bodyDepthTex)
{
l9_446=mix(bodyDepthTexBorderColor,l9_445,vec4(l9_443));
}
#else
{
l9_446=l9_445;
}
#endif
float l9_447=(l9_446.x*2.0)-1.0;
float l9_448;
if (bodyDepthTexProjectionMatrixTerms.z==0.0)
{
l9_448=(l9_447-bodyDepthTexProjectionMatrixTerms.y)/bodyDepthTexProjectionMatrixTerms.x;
}
else
{
l9_448=bodyDepthTexProjectionMatrixTerms.y/((-l9_447)-bodyDepthTexProjectionMatrixTerms.x);
}
tempGlobals=l9_5;
if ((bodyIntersection==1.0)&&((1.0-clamp(ssPow((l9_448-(1.0-((sc_Camera.clipPlanes.y*sc_Camera.clipPlanes.x)/(sc_Camera.clipPlanes.y+(gl_FragCoord.z*(sc_Camera.clipPlanes.x-sc_Camera.clipPlanes.y))))))*0.035,100.0),0.0,1.0))<1.0))
{
discard;
}
vec4 l9_449;
#if (sc_ProjectiveShadowsCaster)
{
float l9_450;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_450=l9_421.w;
}
#else
{
float l9_451;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_451=clamp(l9_421.w*2.0,0.0,1.0);
}
#else
{
float l9_452;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_452=clamp(dot(l9_421.xyz,vec3(l9_421.w)),0.0,1.0);
}
#else
{
float l9_453;
#if (sc_BlendMode_AlphaTest)
{
l9_453=1.0;
}
#else
{
float l9_454;
#if (sc_BlendMode_Multiply)
{
l9_454=(1.0-dot(l9_421.xyz,vec3(0.33333001)))*l9_421.w;
}
#else
{
float l9_455;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_455=(1.0-clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0))*l9_421.w;
}
#else
{
float l9_456;
#if (sc_BlendMode_ColoredGlass)
{
l9_456=clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0)*l9_421.w;
}
#else
{
float l9_457;
#if (sc_BlendMode_Add)
{
l9_457=clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_458;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_458=clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0)*l9_421.w;
}
#else
{
float l9_459;
#if (sc_BlendMode_Screen)
{
l9_459=dot(l9_421.xyz,vec3(0.33333001))*l9_421.w;
}
#else
{
float l9_460;
#if (sc_BlendMode_Min)
{
l9_460=1.0-clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_461;
#if (sc_BlendMode_Max)
{
l9_461=clamp(dot(l9_421.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_461=1.0;
}
#endif
l9_460=l9_461;
}
#endif
l9_459=l9_460;
}
#endif
l9_458=l9_459;
}
#endif
l9_457=l9_458;
}
#endif
l9_456=l9_457;
}
#endif
l9_455=l9_456;
}
#endif
l9_454=l9_455;
}
#endif
l9_453=l9_454;
}
#endif
l9_452=l9_453;
}
#endif
l9_451=l9_452;
}
#endif
l9_450=l9_451;
}
#endif
l9_449=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_421.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_450);
}
#else
{
vec4 l9_462;
#if (sc_RenderAlphaToColor)
{
l9_462=vec4(l9_421.w);
}
#else
{
vec4 l9_463;
#if (sc_BlendMode_Custom)
{
vec3 l9_464=sc_GetFramebufferColor().xyz;
vec3 l9_465=mix(l9_464,definedBlend(l9_464,l9_421.xyz).xyz,vec3(l9_421.w));
vec4 l9_466=vec4(l9_465.x,l9_465.y,l9_465.z,vec4(0.0).w);
l9_466.w=1.0;
l9_463=l9_466;
}
#else
{
vec4 l9_467;
#if (sc_BlendMode_MultiplyOriginal)
{
float l9_468=l9_421.w;
l9_467=vec4(mix(vec3(1.0),l9_421.xyz,vec3(l9_468)),l9_468);
}
#else
{
vec4 l9_469;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_470=l9_421.w;
float l9_471;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_471=clamp(l9_470,0.0,1.0);
}
#else
{
l9_471=l9_470;
}
#endif
l9_469=vec4(l9_421.xyz*l9_471,l9_471);
}
#else
{
l9_469=l9_421;
}
#endif
l9_467=l9_469;
}
#endif
l9_463=l9_467;
}
#endif
l9_462=l9_463;
}
#endif
l9_449=l9_462;
}
#endif
vec4 l9_472;
if (PreviewEnabled==1)
{
vec4 l9_473;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_473=PreviewVertexColor;
}
else
{
l9_473=vec4(0.0);
}
l9_472=l9_473;
}
else
{
l9_472=l9_449;
}
vec4 l9_474;
#if (sc_ShaderComplexityAnalyzer)
{
l9_474=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_474=vec4(0.0);
}
#endif
vec4 l9_475;
if (l9_474.w>0.0)
{
l9_475=l9_474;
}
else
{
l9_475=l9_472;
}
vec4 l9_476=outputMotionVectorsIfNeeded(varPos,max(l9_475,vec4(0.0)));
vec4 l9_477=clamp(l9_476,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_478=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_478-0.0039215689)),min(1.0,l9_478+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_479=sc_ScreenCoordsGlobalToView(l9_2);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_479).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_480=encodeDepth(viewSpaceDepth(),texture2D(sc_OITFilteredDepthBoundsTexture,l9_479).xy);
float l9_481=packValue(l9_480);
int l9_488=int(l9_477.w*255.0);
float l9_489=packValue(l9_488);
sc_writeFragData0Internal(vec4(packValue(l9_480),packValue(l9_480),packValue(l9_480),packValue(l9_480)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_481,packValue(l9_480),packValue(l9_480),packValue(l9_480)));
sc_writeFragData2(vec4(l9_489,packValue(l9_488),packValue(l9_488),packValue(l9_488)));
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
vec2 l9_492=sc_ScreenCoordsGlobalToView(l9_2);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,l9_492).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_493[8];
int l9_494[8];
int l9_495=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_495<8)
{
l9_493[l9_495]=0;
l9_494[l9_495]=0;
l9_495++;
continue;
}
else
{
break;
}
}
int l9_496;
#if (sc_OITMaxLayers8)
{
l9_496=2;
}
#else
{
l9_496=1;
}
#endif
int l9_497=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_497<l9_496)
{
vec4 l9_498;
vec4 l9_499;
vec4 l9_500;
if (l9_497==0)
{
l9_500=texture2D(sc_OITAlpha0,l9_492);
l9_499=texture2D(sc_OITDepthLow0,l9_492);
l9_498=texture2D(sc_OITDepthHigh0,l9_492);
}
else
{
l9_500=vec4(0.0);
l9_499=vec4(0.0);
l9_498=vec4(0.0);
}
vec4 l9_501;
vec4 l9_502;
vec4 l9_503;
if (l9_497==1)
{
l9_503=texture2D(sc_OITAlpha1,l9_492);
l9_502=texture2D(sc_OITDepthLow1,l9_492);
l9_501=texture2D(sc_OITDepthHigh1,l9_492);
}
else
{
l9_503=l9_500;
l9_502=l9_499;
l9_501=l9_498;
}
if (any(notEqual(l9_501,vec4(0.0)))||any(notEqual(l9_502,vec4(0.0))))
{
int l9_504[8]=l9_493;
unpackValues(l9_501.w,l9_497,l9_504);
unpackValues(l9_501.z,l9_497,l9_504);
unpackValues(l9_501.y,l9_497,l9_504);
unpackValues(l9_501.x,l9_497,l9_504);
unpackValues(l9_502.w,l9_497,l9_504);
unpackValues(l9_502.z,l9_497,l9_504);
unpackValues(l9_502.y,l9_497,l9_504);
unpackValues(l9_502.x,l9_497,l9_504);
int l9_513[8]=l9_494;
unpackValues(l9_503.w,l9_497,l9_513);
unpackValues(l9_503.z,l9_497,l9_513);
unpackValues(l9_503.y,l9_497,l9_513);
unpackValues(l9_503.x,l9_497,l9_513);
}
l9_497++;
continue;
}
else
{
break;
}
}
vec4 l9_518=texture2D(sc_OITFilteredDepthBoundsTexture,l9_492);
vec2 l9_519=l9_518.xy;
int l9_520;
#if (sc_SkinBonesCount>0)
{
l9_520=encodeDepth(((1.0-l9_518.x)*1000.0)+getDepthOrderingEpsilon(),l9_519);
}
#else
{
l9_520=0;
}
#endif
int l9_521=encodeDepth(viewSpaceDepth(),l9_519);
vec4 l9_522;
l9_522=l9_477*l9_477.w;
vec4 l9_523;
int l9_524=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_524<8)
{
int l9_525=l9_493[l9_524];
int l9_526=l9_521-l9_520;
bool l9_527=l9_525<l9_526;
bool l9_528;
if (l9_527)
{
l9_528=l9_493[l9_524]>0;
}
else
{
l9_528=l9_527;
}
if (l9_528)
{
vec3 l9_529=l9_522.xyz*(1.0-(float(l9_494[l9_524])/255.0));
l9_523=vec4(l9_529.x,l9_529.y,l9_529.z,l9_522.w);
}
else
{
l9_523=l9_522;
}
l9_522=l9_523;
l9_524++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_522,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
if (abs(gl_FragCoord.z-texture2D(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(l9_2)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_477,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_476,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
