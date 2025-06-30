#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#ifdef Tweak_N65
#undef Tweak_N65
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
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
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
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
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 0:29
//sampler sampler intensityTextureSmpSC 0:30
//sampler sampler materialParamsTexSmpSC 0:31
//sampler sampler normalTexSmpSC 0:32
//sampler sampler sc_EnvmapDiffuseSmpSC 0:33
//sampler sampler sc_EnvmapSpecularSmpSC 0:34
//sampler sampler sc_RayTracedAoTextureSmpSC 0:36
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:37
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:38
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:39
//sampler sampler sc_SSAOTextureSmpSC 0:40
//sampler sampler sc_ScreenTextureSmpSC 0:41
//sampler sampler sc_ShadowTextureSmpSC 0:42
//sampler sampler screenTexSmpSC 0:44
//sampler sampler z_hitIdAndBarycentricSmp 0:45
//sampler sampler z_rayDirectionsSmpSC 0:46
//texture texture2D baseTex 0:4:0:29
//texture texture2D intensityTexture 0:5:0:30
//texture texture2D materialParamsTex 0:6:0:31
//texture texture2D normalTex 0:7:0:32
//texture texture2D sc_EnvmapDiffuse 0:8:0:33
//texture texture2D sc_EnvmapSpecular 0:9:0:34
//texture texture2D sc_RayTracedAoTexture 0:18:0:36
//texture texture2D sc_RayTracedDiffIndTexture 0:19:0:37
//texture texture2D sc_RayTracedReflectionTexture 0:20:0:38
//texture texture2D sc_RayTracedShadowTexture 0:21:0:39
//texture texture2D sc_SSAOTexture 0:22:0:40
//texture texture2D sc_ScreenTexture 0:23:0:41
//texture texture2D sc_ShadowTexture 0:24:0:42
//texture texture2D screenTex 0:26:0:44
//texture utexture2D z_hitIdAndBarycentric 0:27:0:45
//texture texture2D z_rayDirections 0:28:0:46
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:47:5600 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapSpecularSize 1136
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float shaderComplexityValue 3604
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//bool receivesRayTracedReflections 3824
//bool isProxyMode 3828
//bool receivesRayTracedShadows 3832
//bool receivesRayTracedDiffuseIndirect 3836
//bool receivesRayTracedAo 3840
//float receiver_mask 4048
//float3 OriginNormalizationScale 4064
//float3 OriginNormalizationOffset 4096
//int receiverId 4112
//int instance_id 4116
//int lray_triangles_last 4120
//bool noEarlyZ 4124
//bool has_animated_pn 4128
//int emitter_stride 4132
//int proxy_offset_position 4136
//int proxy_offset_normal 4140
//int proxy_offset_tangent 4144
//int proxy_offset_color 4148
//int proxy_offset_texture0 4152
//int proxy_offset_texture1 4156
//int proxy_offset_texture2 4160
//int proxy_offset_texture3 4164
//int proxy_format_position 4168
//int proxy_format_normal 4172
//int proxy_format_tangent 4176
//int proxy_format_color 4180
//int proxy_format_texture0 4184
//int proxy_format_texture1 4188
//int proxy_format_texture2 4192
//int proxy_format_texture3 4196
//float correctedIntensity 4256
//float3x3 intensityTextureTransform 4320
//float4 intensityTextureUvMinMax 4368
//float4 intensityTextureBorderColor 4384
//int PreviewEnabled 4548
//float alphaTestThreshold 4556
//float3x3 screenTexTransform 4608
//float4 screenTexUvMinMax 4656
//float4 screenTexBorderColor 4672
//float refractionDistortSpeed 4688
//float2 noiseScale 4696
//float refractIntensity 4704
//float jitter 4708
//float reafractiveRimIntensity 4712
//float4 refractRimColor 4720
//float4 Tweak_N26 4736
//float whitening 4752
//float refractMetallic 4756
//float refractRoughness 4760
//float4 objectRim 4768
//float objectRimIntensity 4784
//float3x3 baseTexTransform 4848
//float4 baseTexUvMinMax 4896
//float4 baseTexBorderColor 4912
//float uvScale 4928
//float3x3 normalTexTransform 4992
//float4 normalTexUvMinMax 5040
//float4 normalTexBorderColor 5056
//float Tweak_N20 5072
//float3x3 materialParamsTexTransform 5136
//float4 materialParamsTexUvMinMax 5184
//float4 materialParamsTexBorderColor 5200
//float lineDistortSpeed 5216
//float lineDistortionIntensity 5220
//float3 direction 5232
//bool Tweak_N65 5248
//float progressadnan 5252
//float lineWidth 5256
//float lineFeathering 5260
//float refractiveRegionWidth 5264
//float4 lineColor 5280
//float opacityBias 5296
//float2 Port_Direction_N034 5304
//float2 Port_Direction_N044 5312
//float2 Port_Input1_N028 5320
//float Port_Offset_N042 5328
//float4 Port_Input2_N043 5344
//float Port_RangeMinA_N036 5360
//float Port_RangeMaxA_N036 5364
//float Port_RangeMinB_N036 5368
//float Port_RangeMaxB_N036 5372
//float Port_LODValue_N012 5376
//float3 Port_Normal_N049 5392
//float Port_Exponent_N049 5408
//float Port_Opacity_N008 5412
//float3 Port_Emissive_N008 5440
//float3 Port_AO_N008 5456
//float3 Port_SpecularAO_N008 5472
//float3 Port_Normal_N046 5488
//float Port_Exponent_N046 5504
//float2 Port_Center_N018 5512
//float3 Port_Emissive_N025 5520
//float3 Port_SpecularAO_N025 5536
//float2 Port_Direction_N011 5552
//float2 Port_Scale_N002 5560
//float4 Port_Value1_N066 5568
//float depthRef 5584
//}
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 35 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 36 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 37 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 39 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 40 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 41 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 42 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 43 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 44 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
//spec_const bool baseTexHasSwappedViews 47 0
//spec_const bool intensityTextureHasSwappedViews 48 0
//spec_const bool materialParamsTexHasSwappedViews 49 0
//spec_const bool normalTexHasSwappedViews 50 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 51 0
//spec_const bool sc_BlendMode_Add 52 0
//spec_const bool sc_BlendMode_AlphaTest 53 0
//spec_const bool sc_BlendMode_AlphaToCoverage 54 0
//spec_const bool sc_BlendMode_ColoredGlass 55 0
//spec_const bool sc_BlendMode_Custom 56 0
//spec_const bool sc_BlendMode_Max 57 0
//spec_const bool sc_BlendMode_Min 58 0
//spec_const bool sc_BlendMode_MultiplyOriginal 59 0
//spec_const bool sc_BlendMode_Multiply 60 0
//spec_const bool sc_BlendMode_Normal 61 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 62 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 63 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 64 0
//spec_const bool sc_BlendMode_Screen 65 0
//spec_const bool sc_DepthOnly 66 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 67 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 68 0
//spec_const bool sc_FramebufferFetch 69 0
//spec_const bool sc_HasDiffuseEnvmap 70 0
//spec_const bool sc_LightEstimation 71 0
//spec_const bool sc_MotionVectorsPass 72 0
//spec_const bool sc_OITCompositingPass 73 0
//spec_const bool sc_OITDepthBoundsPass 74 0
//spec_const bool sc_OITDepthGatherPass 75 0
//spec_const bool sc_ProjectiveShadowsCaster 76 0
//spec_const bool sc_ProjectiveShadowsReceiver 77 0
//spec_const bool sc_ProxyAlphaOne 78 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 79 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 80 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 81 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 82 0
//spec_const bool sc_RenderAlphaToColor 83 0
//spec_const bool sc_SSAOEnabled 84 0
//spec_const bool sc_ScreenTextureHasSwappedViews 85 0
//spec_const bool sc_ShaderComplexityAnalyzer 86 0
//spec_const bool sc_TAAEnabled 87 0
//spec_const bool sc_UseFramebufferFetchMarker 88 0
//spec_const bool sc_VertexBlendingUseNormals 89 0
//spec_const bool sc_VertexBlending 90 0
//spec_const bool screenTexHasSwappedViews 91 0
//spec_const int SC_DEVICE_CLASS 92 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 94 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 95 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 97 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 98 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 102 -1
//spec_const int baseTexLayout 103 0
//spec_const int intensityTextureLayout 104 0
//spec_const int materialParamsTexLayout 105 0
//spec_const int normalTexLayout 106 0
//spec_const int sc_AmbientLightMode0 107 0
//spec_const int sc_AmbientLightMode1 108 0
//spec_const int sc_AmbientLightMode2 109 0
//spec_const int sc_AmbientLightMode_Constant 110 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 111 0
//spec_const int sc_AmbientLightMode_FromCamera 112 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 113 0
//spec_const int sc_AmbientLightsCount 114 0
//spec_const int sc_DepthBufferMode 115 0
//spec_const int sc_DirectionalLightsCount 116 0
//spec_const int sc_EnvLightMode 117 0
//spec_const int sc_EnvmapDiffuseLayout 118 0
//spec_const int sc_EnvmapSpecularLayout 119 0
//spec_const int sc_LightEstimationSGCount 120 0
//spec_const int sc_MaxTextureImageUnits 121 0
//spec_const int sc_PointLightsCount 122 0
//spec_const int sc_RayTracedAoTextureLayout 123 0
//spec_const int sc_RayTracedDiffIndTextureLayout 124 0
//spec_const int sc_RayTracedReflectionTextureLayout 125 0
//spec_const int sc_RayTracedShadowTextureLayout 126 0
//spec_const int sc_RenderingSpace 127 -1
//spec_const int sc_ScreenTextureLayout 128 0
//spec_const int sc_ShaderCacheConstant 129 0
//spec_const int sc_SkinBonesCount 130 0
//spec_const int sc_StereoRenderingMode 131 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 132 0
//spec_const int screenTexLayout 133 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTex [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTex) ? SC_USE_CLAMP_TO_BORDER_screenTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_screenTex [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_screenTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTex) ? SC_USE_UV_MIN_MAX_screenTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_screenTex [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_screenTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTex) ? SC_USE_UV_TRANSFORM_screenTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(46)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(47)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(48)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(49)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(50)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(51)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(52)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(53)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(54)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(55)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(56)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(57)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(58)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(59)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(60)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(61)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(62)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(63)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(64)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(65)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(66)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(67)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(68)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(69)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(70)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(71)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(72)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(73)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(74)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(75)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(76)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(77)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(78)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(79)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(80)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(81)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(82)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(83)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(84)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(85)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(86)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(87)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(88)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(89)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(90)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool screenTexHasSwappedViews [[function_constant(91)]];
constant bool screenTexHasSwappedViews_tmp = is_function_constant_defined(screenTexHasSwappedViews) ? screenTexHasSwappedViews : false;
constant int SC_DEVICE_CLASS [[function_constant(92)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(93)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(94)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(95)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(96)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex [[function_constant(97)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTex) ? SC_SOFTWARE_WRAP_MODE_U_screenTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(98)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(99)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(100)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTex) ? SC_SOFTWARE_WRAP_MODE_V_screenTex : -1;
constant int baseTexLayout [[function_constant(103)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(104)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(105)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(106)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(107)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(108)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(109)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(110)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(111)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(112)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(113)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(114)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(115)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(116)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(117)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(118)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(119)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(120)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(121)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(122)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(123)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(124)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(125)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(126)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(127)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(128)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(129)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(130)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(131)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(132)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTexLayout [[function_constant(133)]];
constant int screenTexLayout_tmp = is_function_constant_defined(screenTexLayout) ? screenTexLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float refractionDistortSpeed;
float2 noiseScale;
float refractIntensity;
float jitter;
float reafractiveRimIntensity;
float4 refractRimColor;
float4 Tweak_N26;
float whitening;
float refractMetallic;
float refractRoughness;
float4 objectRim;
float objectRimIntensity;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float uvScale;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float Tweak_N20;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float lineDistortSpeed;
float lineDistortionIntensity;
float3 direction;
int Tweak_N65;
float progressadnan;
float lineWidth;
float lineFeathering;
float refractiveRegionWidth;
float4 lineColor;
float opacityBias;
float2 Port_Direction_N034;
float2 Port_Direction_N044;
float2 Port_Input1_N028;
float Port_Offset_N042;
float4 Port_Input2_N043;
float Port_RangeMinA_N036;
float Port_RangeMaxA_N036;
float Port_RangeMinB_N036;
float Port_RangeMaxB_N036;
float Port_LODValue_N012;
float3 Port_Normal_N049;
float Port_Exponent_N049;
float Port_Opacity_N008;
float3 Port_Normal_N008;
float3 Port_Emissive_N008;
float3 Port_AO_N008;
float3 Port_SpecularAO_N008;
float3 Port_Normal_N046;
float Port_Exponent_N046;
float2 Port_Center_N018;
float3 Port_Emissive_N025;
float3 Port_SpecularAO_N025;
float2 Port_Direction_N011;
float2 Port_Scale_N002;
float4 Port_Value1_N066;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedAoTexture [[id(18)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(19)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(21)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<float> screenTex [[id(26)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler materialParamsTexSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler sc_EnvmapDiffuseSmpSC [[id(33)]];
sampler sc_EnvmapSpecularSmpSC [[id(34)]];
sampler sc_RayTracedAoTextureSmpSC [[id(36)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(37)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(39)]];
sampler sc_SSAOTextureSmpSC [[id(40)]];
sampler sc_ScreenTextureSmpSC [[id(41)]];
sampler sc_ShadowTextureSmpSC [[id(42)]];
sampler screenTexSmpSC [[id(44)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_124=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_125=normalize(param_5);
out.varTangent=float4(l9_125.x,l9_125.y,l9_125.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_126=param_2.position;
float4 l9_127=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_127=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_129]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_127=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_131]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=gl_InstanceIndex%2;
}
int l9_133=l9_132;
l9_127=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_133]*l9_126;
}
else
{
l9_127=l9_126;
}
}
}
float4 l9_134=l9_127;
out.varViewSpaceDepth=-l9_134.z;
}
float4 l9_135=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_135=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_137]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_141]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_142=param_2.position;
float4 l9_143=l9_142;
if (sc_RenderingSpace_tmp==1)
{
l9_143=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_142;
}
float4 l9_144=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_143;
float2 l9_145=((l9_144.xy/float2(l9_144.w))*0.5)+float2(0.5);
out.varShadowTex=l9_145;
}
float4 l9_146=l9_135;
if (sc_DepthBufferMode_tmp==1)
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148][2].w!=0.0)
{
float l9_149=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_146.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_146.w))*l9_149)-1.0)*l9_146.w;
}
}
float4 l9_150=l9_146;
l9_135=l9_150;
float4 l9_151=l9_135;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_152=l9_151.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_151.w);
l9_151=float4(l9_152.x,l9_152.y,l9_151.z,l9_151.w);
}
float4 l9_153=l9_151;
l9_135=l9_153;
float4 l9_154=l9_135;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_154.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_155=l9_154;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_156=dot(l9_155,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_157=l9_156;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_157;
}
}
float4 l9_158=float4(l9_154.x,-l9_154.y,(l9_154.z*0.5)+(l9_154.w*0.5),l9_154.w);
out.gl_Position=l9_158;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
float3 SurfacePosition_ObjectSpace;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float refractionDistortSpeed;
float2 noiseScale;
float refractIntensity;
float jitter;
float reafractiveRimIntensity;
float4 refractRimColor;
float4 Tweak_N26;
float whitening;
float refractMetallic;
float refractRoughness;
float4 objectRim;
float objectRimIntensity;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float uvScale;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float Tweak_N20;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float lineDistortSpeed;
float lineDistortionIntensity;
float3 direction;
int Tweak_N65;
float progressadnan;
float lineWidth;
float lineFeathering;
float refractiveRegionWidth;
float4 lineColor;
float opacityBias;
float2 Port_Direction_N034;
float2 Port_Direction_N044;
float2 Port_Input1_N028;
float Port_Offset_N042;
float4 Port_Input2_N043;
float Port_RangeMinA_N036;
float Port_RangeMaxA_N036;
float Port_RangeMinB_N036;
float Port_RangeMaxB_N036;
float Port_LODValue_N012;
float3 Port_Normal_N049;
float Port_Exponent_N049;
float Port_Opacity_N008;
float3 Port_Normal_N008;
float3 Port_Emissive_N008;
float3 Port_AO_N008;
float3 Port_SpecularAO_N008;
float3 Port_Normal_N046;
float Port_Exponent_N046;
float2 Port_Center_N018;
float3 Port_Emissive_N025;
float3 Port_SpecularAO_N025;
float2 Port_Direction_N011;
float2 Port_Scale_N002;
float4 Port_Value1_N066;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedAoTexture [[id(18)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(19)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(21)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<float> screenTex [[id(26)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler materialParamsTexSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler sc_EnvmapDiffuseSmpSC [[id(33)]];
sampler sc_EnvmapSpecularSmpSC [[id(34)]];
sampler sc_RayTracedAoTextureSmpSC [[id(36)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(37)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(39)]];
sampler sc_SSAOTextureSmpSC [[id(40)]];
sampler sc_ScreenTextureSmpSC [[id(41)]];
sampler sc_ShadowTextureSmpSC [[id(42)]];
sampler screenTexSmpSC [[id(44)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
float2 VoronoiHash2D(thread float2& UV,thread const float& Offset)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2x2 m=float2x2(float2(0.15270001,0.4763),float2(0.4991,0.8998));
UV=fract(sin(mod(UV*m,float2(3.1400001)))*0.32345);
return float2((sin(UV.y*Offset)*0.5)+0.5,(cos(UV.x*Offset)*0.5)+0.5);
}
else
{
return float2(0.0);
}
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
bool l9_10=UserUniforms.isProxyMode!=0;
if (l9_10)
{
l9_9=1e-07;
}
float l9_11=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_12=param_6;
float l9_13=param_8;
float l9_14=l9_13+1.0;
l9_14=(l9_14*l9_14)*0.125;
float l9_15=(l9_12*(1.0-l9_14))+l9_14;
float l9_16=param_7;
float l9_17=param_8;
float l9_18=l9_17+1.0;
l9_18=(l9_18*l9_18)*0.125;
float l9_19=(l9_16*(1.0-l9_18))+l9_18;
float l9_20=1.0/(l9_15*l9_19);
float param_9=VdotH;
float3 param_10=F0;
float l9_21=param_9;
float3 l9_22=param_10;
float3 l9_23=float3(1.0);
float l9_24=1.0-l9_21;
float l9_25=l9_24*l9_24;
float l9_26=(l9_25*l9_25)*l9_24;
float3 l9_27=l9_22+((l9_23-l9_22)*l9_26);
float3 l9_28=l9_27;
return l9_28*(((l9_11*l9_20)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_29=param_11;
float3 l9_30=param_12;
float3 l9_31=float3(1.0);
float l9_32=1.0-l9_29;
float l9_33=l9_32*l9_32;
float l9_34=(l9_33*l9_33)*l9_32;
float3 l9_35=l9_30+((l9_31-l9_30)*l9_34);
float3 l9_36=l9_35;
return ((l9_36*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedReflectionTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread texture2d<float> sc_RayTracedShadowTexture,thread sampler sc_RayTracedShadowTextureSmpSC,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
bool l9_67=UserUniforms.receivesRayTracedShadows!=0;
if (l9_67)
{
float4 l9_68=gl_FragCoord;
float2 l9_69=l9_68.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
int l9_72=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_71;
int l9_79=l9_77;
float2 l9_80=l9_78;
int l9_81=l9_79;
float l9_82=0.0;
float4 l9_83=float4(0.0);
float2 l9_84=l9_80;
int l9_85=sc_RayTracedShadowTextureLayout_tmp;
int l9_86=l9_81;
float l9_87=l9_82;
float2 l9_88=l9_84;
int l9_89=l9_85;
int l9_90=l9_86;
float3 l9_91=float3(0.0);
if (l9_89==0)
{
l9_91=float3(l9_88,0.0);
}
else
{
if (l9_89==1)
{
l9_91=float3(l9_88.x,(l9_88.y*0.5)+(0.5-(float(l9_90)*0.5)),0.0);
}
else
{
l9_91=float3(l9_88,float(l9_90));
}
}
float3 l9_92=l9_91;
float3 l9_93=l9_92;
float2 l9_94=l9_93.xy;
float l9_95=l9_87;
float4 l9_96=sc_RayTracedShadowTexture.sample(sc_RayTracedShadowTextureSmpSC,l9_94,bias(l9_95));
float4 l9_97=l9_96;
l9_83=l9_97;
float4 l9_98=l9_83;
float4 l9_99=l9_98;
float4 l9_100=l9_99;
float l9_101=l9_100.x;
float3 l9_102=float3(l9_101);
float3 l9_103=l9_102;
l9_12.directDiffuse*=(float3(1.0)-l9_103);
l9_12.directSpecular*=(float3(1.0)-l9_103);
}
SurfaceProperties l9_104=param_4;
float3 l9_105=l9_104.normal;
float3 l9_106=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_107=l9_105;
float3 l9_108=l9_107;
float l9_109=UserUniforms.sc_EnvmapRotation.y;
float2 l9_110=float2(0.0);
float l9_111=l9_108.x;
float l9_112=-l9_108.z;
float l9_113=(l9_111<0.0) ? (-1.0) : 1.0;
float l9_114=l9_113*acos(fast::clamp(l9_112/length(float2(l9_111,l9_112)),-1.0,1.0));
l9_110.x=l9_114-1.5707964;
l9_110.y=acos(l9_108.y);
l9_110/=float2(6.2831855,3.1415927);
l9_110.y=1.0-l9_110.y;
l9_110.x+=(l9_109/360.0);
l9_110.x=fract((l9_110.x+floor(l9_110.x))+1.0);
float2 l9_115=l9_110;
float2 l9_116=l9_115;
float4 l9_117=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_118=l9_116;
float2 l9_119=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_120=5.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_118,l9_119,l9_120);
}
float2 l9_121=l9_116;
float l9_122=13.0;
int l9_123=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
float2 l9_129=l9_121;
int l9_130=l9_128;
float l9_131=l9_122;
float4 l9_132=float4(0.0);
float2 l9_133=l9_129;
int l9_134=sc_EnvmapSpecularLayout_tmp;
int l9_135=l9_130;
float l9_136=l9_131;
float2 l9_137=l9_133;
int l9_138=l9_134;
int l9_139=l9_135;
float3 l9_140=float3(0.0);
if (l9_138==0)
{
l9_140=float3(l9_137,0.0);
}
else
{
if (l9_138==1)
{
l9_140=float3(l9_137.x,(l9_137.y*0.5)+(0.5-(float(l9_139)*0.5)),0.0);
}
else
{
l9_140=float3(l9_137,float(l9_139));
}
}
float3 l9_141=l9_140;
float3 l9_142=l9_141;
float2 l9_143=l9_142.xy;
float l9_144=l9_136;
float4 l9_145=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_143,bias(l9_144));
float4 l9_146=l9_145;
l9_132=l9_146;
float4 l9_147=l9_132;
float4 l9_148=l9_147;
l9_117=l9_148;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_149=l9_116;
float2 l9_150=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_151=0.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_149,l9_150,l9_151);
bool l9_152=UserUniforms.isProxyMode!=0;
if (l9_152)
{
float2 l9_153=l9_116;
float l9_154=0.0;
int l9_155=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=l9_160;
float l9_163=l9_154;
float4 l9_164=float4(0.0);
float2 l9_165=l9_161;
int l9_166=sc_EnvmapDiffuseLayout_tmp;
int l9_167=l9_162;
float l9_168=l9_163;
float2 l9_169=l9_165;
int l9_170=l9_166;
int l9_171=l9_167;
float3 l9_172=float3(0.0);
if (l9_170==0)
{
l9_172=float3(l9_169,0.0);
}
else
{
if (l9_170==1)
{
l9_172=float3(l9_169.x,(l9_169.y*0.5)+(0.5-(float(l9_171)*0.5)),0.0);
}
else
{
l9_172=float3(l9_169,float(l9_171));
}
}
float3 l9_173=l9_172;
float3 l9_174=l9_173;
float2 l9_175=l9_174.xy;
float l9_176=l9_168;
float4 l9_177=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_175,level(l9_176));
float4 l9_178=l9_177;
l9_164=l9_178;
float4 l9_179=l9_164;
float4 l9_180=l9_179;
l9_117=l9_180;
}
else
{
float2 l9_181=l9_116;
float l9_182=-13.0;
int l9_183=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=varStereoViewID;
}
int l9_185=l9_184;
l9_183=1-l9_185;
}
else
{
int l9_186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_186=0;
}
else
{
l9_186=varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
float2 l9_189=l9_181;
int l9_190=l9_188;
float l9_191=l9_182;
float4 l9_192=float4(0.0);
float2 l9_193=l9_189;
int l9_194=sc_EnvmapDiffuseLayout_tmp;
int l9_195=l9_190;
float l9_196=l9_191;
float2 l9_197=l9_193;
int l9_198=l9_194;
int l9_199=l9_195;
float3 l9_200=float3(0.0);
if (l9_198==0)
{
l9_200=float3(l9_197,0.0);
}
else
{
if (l9_198==1)
{
l9_200=float3(l9_197.x,(l9_197.y*0.5)+(0.5-(float(l9_199)*0.5)),0.0);
}
else
{
l9_200=float3(l9_197,float(l9_199));
}
}
float3 l9_201=l9_200;
float3 l9_202=l9_201;
float2 l9_203=l9_202.xy;
float l9_204=l9_196;
float4 l9_205=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_203,bias(l9_204));
float4 l9_206=l9_205;
l9_192=l9_206;
float4 l9_207=l9_192;
float4 l9_208=l9_207;
l9_117=l9_208;
}
}
else
{
float2 l9_209=l9_116;
float l9_210=13.0;
int l9_211=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=varStereoViewID;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=varStereoViewID;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
float2 l9_217=l9_209;
int l9_218=l9_216;
float l9_219=l9_210;
float4 l9_220=float4(0.0);
float2 l9_221=l9_217;
int l9_222=sc_EnvmapSpecularLayout_tmp;
int l9_223=l9_218;
float l9_224=l9_219;
float2 l9_225=l9_221;
int l9_226=l9_222;
int l9_227=l9_223;
float3 l9_228=float3(0.0);
if (l9_226==0)
{
l9_228=float3(l9_225,0.0);
}
else
{
if (l9_226==1)
{
l9_228=float3(l9_225.x,(l9_225.y*0.5)+(0.5-(float(l9_227)*0.5)),0.0);
}
else
{
l9_228=float3(l9_225,float(l9_227));
}
}
float3 l9_229=l9_228;
float3 l9_230=l9_229;
float2 l9_231=l9_230.xy;
float l9_232=l9_224;
float4 l9_233=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
l9_220=l9_234;
float4 l9_235=l9_220;
float4 l9_236=l9_235;
l9_117=l9_236;
}
}
float4 l9_237=l9_117;
float3 l9_238=l9_237.xyz*(1.0/l9_237.w);
float3 l9_239=l9_238*UserUniforms.sc_EnvmapExposure;
l9_106=l9_239;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_240=UserUniforms.sc_Sh[0];
float3 l9_241=UserUniforms.sc_Sh[1];
float3 l9_242=UserUniforms.sc_Sh[2];
float3 l9_243=UserUniforms.sc_Sh[3];
float3 l9_244=UserUniforms.sc_Sh[4];
float3 l9_245=UserUniforms.sc_Sh[5];
float3 l9_246=UserUniforms.sc_Sh[6];
float3 l9_247=UserUniforms.sc_Sh[7];
float3 l9_248=UserUniforms.sc_Sh[8];
float3 l9_249=-l9_105;
float l9_250=0.0;
l9_250=l9_249.x;
float l9_251=l9_249.y;
float l9_252=l9_249.z;
float l9_253=l9_250*l9_250;
float l9_254=l9_251*l9_251;
float l9_255=l9_252*l9_252;
float l9_256=l9_250*l9_251;
float l9_257=l9_251*l9_252;
float l9_258=l9_250*l9_252;
float3 l9_259=((((((l9_248*0.42904299)*(l9_253-l9_254))+((l9_246*0.74312502)*l9_255))+(l9_240*0.88622701))-(l9_246*0.24770799))+((((l9_244*l9_256)+(l9_247*l9_258))+(l9_245*l9_257))*0.85808599))+((((l9_243*l9_250)+(l9_241*l9_251))+(l9_242*l9_252))*1.0233279);
l9_106=l9_259*UserUniforms.sc_ShIntensity;
}
}
bool l9_260=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_260)
{
float4 l9_261=sampleRayTracedIndirectDiffuse(varStereoViewID,UserUniforms,sc_RayTracedDiffIndTexture,sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_106=mix(l9_106,l9_261.xyz,float3(l9_261.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_262=l9_105;
float3 l9_263=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_264;
float l9_265;
int l9_266=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_266<sc_LightEstimationSGCount_tmp)
{
l9_264.color=UserUniforms.sc_LightEstimationData.sg[l9_266].color;
l9_264.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_266].sharpness;
l9_264.axis=UserUniforms.sc_LightEstimationData.sg[l9_266].axis;
float3 l9_267=l9_262;
float l9_268=dot(l9_264.axis,l9_267);
float l9_269=l9_264.sharpness;
float l9_270=0.36000001;
float l9_271=1.0/(4.0*l9_270);
float l9_272=exp(-l9_269);
float l9_273=l9_272*l9_272;
float l9_274=1.0/l9_269;
float l9_275=(1.0+(2.0*l9_273))-l9_274;
float l9_276=((l9_272-l9_273)*l9_274)-l9_273;
float l9_277=sqrt(1.0-l9_275);
float l9_278=l9_270*l9_268;
float l9_279=l9_271*l9_277;
float l9_280=l9_278+l9_279;
float l9_281=l9_268;
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282;
if (step(abs(l9_278),l9_279)>0.5)
{
l9_265=(l9_280*l9_280)/l9_277;
}
else
{
l9_265=l9_283;
}
l9_283=l9_265;
float l9_284=(l9_275*l9_283)+l9_276;
sc_SphericalGaussianLight_t l9_285=l9_264;
float3 l9_286=(l9_285.color/float3(l9_285.sharpness))*6.2831855;
float3 l9_287=(l9_286*l9_284)/float3(3.1415927);
l9_263+=l9_287;
l9_266++;
continue;
}
else
{
break;
}
}
float3 l9_288=l9_263;
l9_106+=l9_288;
}
float3 l9_289=l9_106;
float3 l9_290=l9_289;
l9_12.indirectDiffuse=l9_290;
SurfaceProperties l9_291=param_4;
float3 l9_292=l9_13;
float3 l9_293=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_294=l9_291;
float3 l9_295=l9_292;
float3 l9_296=l9_294.normal;
float3 l9_297=reflect(-l9_295,l9_296);
float3 l9_298=l9_296;
float3 l9_299=l9_297;
float l9_300=l9_294.roughness;
l9_297=getSpecularDominantDir(l9_298,l9_299,l9_300);
float l9_301=l9_294.roughness;
float l9_302=pow(l9_301,0.66666669);
float l9_303=fast::clamp(l9_302,0.0,1.0);
float l9_304=l9_303*5.0;
float l9_305=l9_304;
float l9_306=l9_305;
float3 l9_307=l9_297;
float l9_308=l9_306;
float3 l9_309=l9_307;
float l9_310=l9_308;
float4 l9_311=float4(0.0);
float3 l9_312=l9_309;
float l9_313=UserUniforms.sc_EnvmapRotation.y;
float2 l9_314=float2(0.0);
float l9_315=l9_312.x;
float l9_316=-l9_312.z;
float l9_317=(l9_315<0.0) ? (-1.0) : 1.0;
float l9_318=l9_317*acos(fast::clamp(l9_316/length(float2(l9_315,l9_316)),-1.0,1.0));
l9_314.x=l9_318-1.5707964;
l9_314.y=acos(l9_312.y);
l9_314/=float2(6.2831855,3.1415927);
l9_314.y=1.0-l9_314.y;
l9_314.x+=(l9_313/360.0);
l9_314.x=fract((l9_314.x+floor(l9_314.x))+1.0);
float2 l9_319=l9_314;
float2 l9_320=l9_319;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_321=floor(l9_310);
float l9_322=ceil(l9_310);
float l9_323=l9_310-l9_321;
float2 l9_324=l9_320;
float2 l9_325=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_326=l9_321;
float2 l9_327=calcSeamlessPanoramicUvsForSampling(l9_324,l9_325,l9_326);
float2 l9_328=l9_327;
float l9_329=l9_321;
float2 l9_330=l9_328;
float l9_331=l9_329;
int l9_332=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_333=0;
}
else
{
l9_333=varStereoViewID;
}
int l9_334=l9_333;
l9_332=1-l9_334;
}
else
{
int l9_335=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_335=0;
}
else
{
l9_335=varStereoViewID;
}
int l9_336=l9_335;
l9_332=l9_336;
}
int l9_337=l9_332;
float2 l9_338=l9_330;
int l9_339=l9_337;
float l9_340=l9_331;
float4 l9_341=float4(0.0);
float2 l9_342=l9_338;
int l9_343=sc_EnvmapSpecularLayout_tmp;
int l9_344=l9_339;
float l9_345=l9_340;
float2 l9_346=l9_342;
int l9_347=l9_343;
int l9_348=l9_344;
float3 l9_349=float3(0.0);
if (l9_347==0)
{
l9_349=float3(l9_346,0.0);
}
else
{
if (l9_347==1)
{
l9_349=float3(l9_346.x,(l9_346.y*0.5)+(0.5-(float(l9_348)*0.5)),0.0);
}
else
{
l9_349=float3(l9_346,float(l9_348));
}
}
float3 l9_350=l9_349;
float3 l9_351=l9_350;
float2 l9_352=l9_351.xy;
float l9_353=l9_345;
float4 l9_354=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_352,level(l9_353));
float4 l9_355=l9_354;
l9_341=l9_355;
float4 l9_356=l9_341;
float4 l9_357=l9_356;
float4 l9_358=l9_357;
float4 l9_359=l9_358;
float2 l9_360=l9_320;
float2 l9_361=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_362=l9_322;
float2 l9_363=calcSeamlessPanoramicUvsForSampling(l9_360,l9_361,l9_362);
float2 l9_364=l9_363;
float l9_365=l9_322;
float2 l9_366=l9_364;
float l9_367=l9_365;
int l9_368=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_369=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_369=0;
}
else
{
l9_369=varStereoViewID;
}
int l9_370=l9_369;
l9_368=1-l9_370;
}
else
{
int l9_371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_371=0;
}
else
{
l9_371=varStereoViewID;
}
int l9_372=l9_371;
l9_368=l9_372;
}
int l9_373=l9_368;
float2 l9_374=l9_366;
int l9_375=l9_373;
float l9_376=l9_367;
float4 l9_377=float4(0.0);
float2 l9_378=l9_374;
int l9_379=sc_EnvmapSpecularLayout_tmp;
int l9_380=l9_375;
float l9_381=l9_376;
float2 l9_382=l9_378;
int l9_383=l9_379;
int l9_384=l9_380;
float3 l9_385=float3(0.0);
if (l9_383==0)
{
l9_385=float3(l9_382,0.0);
}
else
{
if (l9_383==1)
{
l9_385=float3(l9_382.x,(l9_382.y*0.5)+(0.5-(float(l9_384)*0.5)),0.0);
}
else
{
l9_385=float3(l9_382,float(l9_384));
}
}
float3 l9_386=l9_385;
float3 l9_387=l9_386;
float2 l9_388=l9_387.xy;
float l9_389=l9_381;
float4 l9_390=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_388,level(l9_389));
float4 l9_391=l9_390;
l9_377=l9_391;
float4 l9_392=l9_377;
float4 l9_393=l9_392;
float4 l9_394=l9_393;
float4 l9_395=l9_394;
l9_311=mix(l9_359,l9_395,float4(l9_323));
}
else
{
float2 l9_396=l9_320;
float l9_397=l9_310;
float2 l9_398=l9_396;
float l9_399=l9_397;
int l9_400=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_401=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_401=0;
}
else
{
l9_401=varStereoViewID;
}
int l9_402=l9_401;
l9_400=1-l9_402;
}
else
{
int l9_403=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_403=0;
}
else
{
l9_403=varStereoViewID;
}
int l9_404=l9_403;
l9_400=l9_404;
}
int l9_405=l9_400;
float2 l9_406=l9_398;
int l9_407=l9_405;
float l9_408=l9_399;
float4 l9_409=float4(0.0);
float2 l9_410=l9_406;
int l9_411=sc_EnvmapSpecularLayout_tmp;
int l9_412=l9_407;
float l9_413=l9_408;
float2 l9_414=l9_410;
int l9_415=l9_411;
int l9_416=l9_412;
float3 l9_417=float3(0.0);
if (l9_415==0)
{
l9_417=float3(l9_414,0.0);
}
else
{
if (l9_415==1)
{
l9_417=float3(l9_414.x,(l9_414.y*0.5)+(0.5-(float(l9_416)*0.5)),0.0);
}
else
{
l9_417=float3(l9_414,float(l9_416));
}
}
float3 l9_418=l9_417;
float3 l9_419=l9_418;
float2 l9_420=l9_419.xy;
float l9_421=l9_413;
float4 l9_422=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_420,level(l9_421));
float4 l9_423=l9_422;
l9_409=l9_423;
float4 l9_424=l9_409;
float4 l9_425=l9_424;
float4 l9_426=l9_425;
l9_311=l9_426;
}
float4 l9_427=l9_311;
float3 l9_428=l9_427.xyz*(1.0/l9_427.w);
float3 l9_429=l9_428;
float3 l9_430=l9_429*UserUniforms.sc_EnvmapExposure;
l9_430+=float3(1e-06);
float3 l9_431=l9_430;
float3 l9_432=l9_431;
bool l9_433=UserUniforms.receivesRayTracedReflections!=0;
if (l9_433)
{
float4 l9_434=sampleRayTracedReflections(varStereoViewID,UserUniforms,sc_RayTracedReflectionTexture,sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_432=mix(l9_432,l9_434.xyz,float3(l9_434.w));
}
SurfaceProperties l9_435=l9_294;
float l9_436=abs(dot(l9_296,l9_295));
float3 l9_437=l9_432*envBRDFApprox(l9_435,l9_436);
l9_293+=l9_437;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_438=l9_291;
float3 l9_439=l9_292;
float l9_440=fast::clamp(l9_438.roughness*l9_438.roughness,0.0099999998,1.0);
float3 l9_441=UserUniforms.sc_LightEstimationData.ambientLight*l9_438.specColor;
sc_SphericalGaussianLight_t l9_442;
sc_SphericalGaussianLight_t l9_443;
sc_SphericalGaussianLight_t l9_444;
int l9_445=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_445<sc_LightEstimationSGCount_tmp)
{
l9_442.color=UserUniforms.sc_LightEstimationData.sg[l9_445].color;
l9_442.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_445].sharpness;
l9_442.axis=UserUniforms.sc_LightEstimationData.sg[l9_445].axis;
float3 l9_446=l9_438.normal;
float l9_447=l9_440;
float3 l9_448=l9_439;
float3 l9_449=l9_438.specColor;
float3 l9_450=l9_446;
float l9_451=l9_447;
l9_443.axis=l9_450;
float l9_452=l9_451*l9_451;
l9_443.sharpness=2.0/l9_452;
l9_443.color=float3(1.0/(3.1415927*l9_452));
sc_SphericalGaussianLight_t l9_453=l9_443;
sc_SphericalGaussianLight_t l9_454=l9_453;
sc_SphericalGaussianLight_t l9_455=l9_454;
float3 l9_456=l9_448;
l9_444.axis=reflect(-l9_456,l9_455.axis);
l9_444.color=l9_455.color;
l9_444.sharpness=l9_455.sharpness;
l9_444.sharpness/=(4.0*fast::max(dot(l9_455.axis,l9_456),9.9999997e-05));
sc_SphericalGaussianLight_t l9_457=l9_444;
sc_SphericalGaussianLight_t l9_458=l9_457;
sc_SphericalGaussianLight_t l9_459=l9_458;
sc_SphericalGaussianLight_t l9_460=l9_442;
float l9_461=length((l9_459.axis*l9_459.sharpness)+(l9_460.axis*l9_460.sharpness));
float3 l9_462=(l9_459.color*exp((l9_461-l9_459.sharpness)-l9_460.sharpness))*l9_460.color;
float l9_463=1.0-exp((-2.0)*l9_461);
float3 l9_464=((l9_462*6.2831855)*l9_463)/float3(l9_461);
float3 l9_465=l9_464;
float3 l9_466=l9_458.axis;
float l9_467=l9_447*l9_447;
float l9_468=dot(l9_446,l9_466);
float l9_469=fast::clamp(l9_468,0.0,1.0);
float l9_470=l9_469;
float l9_471=dot(l9_446,l9_448);
float l9_472=fast::clamp(l9_471,0.0,1.0);
float l9_473=l9_472;
float3 l9_474=normalize(l9_458.axis+l9_448);
float l9_475=l9_467;
float l9_476=l9_470;
float l9_477=1.0/(l9_476+sqrt(l9_475+(((1.0-l9_475)*l9_476)*l9_476)));
float l9_478=l9_467;
float l9_479=l9_473;
float l9_480=1.0/(l9_479+sqrt(l9_478+(((1.0-l9_478)*l9_479)*l9_479)));
l9_465*=(l9_477*l9_480);
float l9_481=dot(l9_466,l9_474);
float l9_482=fast::clamp(l9_481,0.0,1.0);
float l9_483=pow(1.0-l9_482,5.0);
l9_465*=(l9_449+((float3(1.0)-l9_449)*l9_483));
l9_465*=l9_470;
float3 l9_484=l9_465;
l9_441+=l9_484;
l9_445++;
continue;
}
else
{
break;
}
}
float3 l9_485=l9_441;
l9_293+=l9_485;
}
float3 l9_486=l9_293;
l9_12.indirectSpecular=l9_486;
LightingComponents l9_487=l9_12;
LightingComponents lighting=l9_487;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_488=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_489=FragColor0;
float4 l9_490=l9_489;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_490.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_491=l9_490;
l9_488=l9_491;
}
else
{
float4 l9_492=gl_FragCoord;
float2 l9_493=l9_492.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_494=l9_493;
float2 l9_495=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_496=1;
int l9_497=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_497=0;
}
else
{
l9_497=varStereoViewID;
}
int l9_498=l9_497;
int l9_499=l9_498;
float3 l9_500=float3(l9_494,0.0);
int l9_501=l9_496;
int l9_502=l9_499;
if (l9_501==1)
{
l9_500.y=((2.0*l9_500.y)+float(l9_502))-1.0;
}
float2 l9_503=l9_500.xy;
l9_495=l9_503;
}
else
{
l9_495=l9_494;
}
float2 l9_504=l9_495;
float2 l9_505=l9_504;
float2 l9_506=l9_505;
int l9_507=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_508=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_508=0;
}
else
{
l9_508=varStereoViewID;
}
int l9_509=l9_508;
l9_507=1-l9_509;
}
else
{
int l9_510=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_510=0;
}
else
{
l9_510=varStereoViewID;
}
int l9_511=l9_510;
l9_507=l9_511;
}
int l9_512=l9_507;
float2 l9_513=l9_506;
int l9_514=l9_512;
float2 l9_515=l9_513;
int l9_516=l9_514;
float l9_517=0.0;
float4 l9_518=float4(0.0);
float2 l9_519=l9_515;
int l9_520=sc_ScreenTextureLayout_tmp;
int l9_521=l9_516;
float l9_522=l9_517;
float2 l9_523=l9_519;
int l9_524=l9_520;
int l9_525=l9_521;
float3 l9_526=float3(0.0);
if (l9_524==0)
{
l9_526=float3(l9_523,0.0);
}
else
{
if (l9_524==1)
{
l9_526=float3(l9_523.x,(l9_523.y*0.5)+(0.5-(float(l9_525)*0.5)),0.0);
}
else
{
l9_526=float3(l9_523,float(l9_525));
}
}
float3 l9_527=l9_526;
float3 l9_528=l9_527;
float2 l9_529=l9_528.xy;
float l9_530=l9_522;
float4 l9_531=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_529,bias(l9_530));
float4 l9_532=l9_531;
l9_518=l9_532;
float4 l9_533=l9_518;
float4 l9_534=l9_533;
float4 l9_535=l9_534;
l9_488=l9_535;
}
float4 l9_536=l9_488;
float4 l9_537=l9_536;
float3 param_5=l9_537.xyz;
float3 l9_538;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_538=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_538=param_5*param_5;
}
float3 l9_539=l9_538;
float3 framebuffer=l9_539;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_540=float3(0.0);
bool l9_541=UserUniforms.receivesRayTracedAo!=0;
if (l9_541)
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*float3(1.0-sampleRayTracedAo(varStereoViewID,UserUniforms,sc_RayTracedAoTexture,sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
}
float3 l9_542=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_543=param_6.emissive;
float3 l9_544=param_7.transmitted;
if (param_8)
{
float l9_545=param_6.opacity;
l9_540*=srgbToLinear(l9_545);
}
float3 l9_546=((l9_540+l9_542)+l9_543)+l9_544;
float3 l9_547=l9_546;
float4 Output=float4(l9_547,surfaceProperties.opacity);
bool l9_548=UserUniforms.isProxyMode!=0;
if (l9_548)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_549=1.8;
float l9_550=1.4;
float l9_551=0.5;
float l9_552=1.5;
float3 l9_553=(param_9*((param_9*l9_549)+float3(l9_550)))/((param_9*((param_9*l9_549)+float3(l9_551)))+float3(l9_552));
Output=float4(l9_553.x,l9_553.y,l9_553.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_554=param_10.x;
float l9_555=param_10.y;
float l9_556=param_10.z;
float3 l9_557=float3(linearToSrgb(l9_554),linearToSrgb(l9_555),linearToSrgb(l9_556));
Output=float4(l9_557.x,l9_557.y,l9_557.z,Output.w);
return Output;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
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
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
float3 N0_Result=float3(0.0);
float N53_ratio=0.0;
float N53_progress=0.0;
float N53_lineWidth=0.0;
float N53_lineFeathering=0.0;
float N53_refractiveRegionWidth=0.0;
float N53_blendGradient=0.0;
float N53_line=0.0;
float N53_opacity=0.0;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float4 FinalColor1=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
int2 l9_2=int2(l9_1.xy);
RayHitPayload l9_3=GetHitData(l9_2,(*sc_set0.UserUniforms),sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,sc_set0.z_hitIdAndBarycentric,sc_set0.z_hitIdAndBarycentricSmp,(*sc_set0.layoutVertices),(*sc_set0.layoutVerticesPN),(*sc_set0.layoutIndices));
RayHitPayload rhp=l9_3;
bool l9_4=(*sc_set0.UserUniforms).noEarlyZ!=0;
if (l9_4)
{
if (rhp.id.x!=uint((*sc_set0.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(rhp.positionWS,1.0)).xyz;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
float4 emitterPositionCS=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_6]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.SurfacePosition_WorldSpace=rhp.positionWS;
Globals.Surface_UVCoord0=rhp.uv0;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(in.varPos,1.0)).xyz;
float4 l9_7=gl_FragCoord;
float2 l9_8=l9_7.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_9=l9_8;
float2 l9_10=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_11=1;
int l9_12=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12=0;
}
else
{
l9_12=in.varStereoViewID;
}
int l9_13=l9_12;
int l9_14=l9_13;
float3 l9_15=float3(l9_9,0.0);
int l9_16=l9_11;
int l9_17=l9_14;
if (l9_16==1)
{
l9_15.y=((2.0*l9_15.y)+float(l9_17))-1.0;
}
float2 l9_18=l9_15.xy;
l9_10=l9_18;
}
else
{
l9_10=l9_9;
}
float2 l9_19=l9_10;
float2 l9_20=l9_19;
Globals.gScreenCoord=l9_20;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.Surface_UVCoord0=in.varPackedTex.xy;
}
float3 Result_N0=float3(0.0);
ssGlobals param_1=Globals;
ssGlobals tempGlobals=param_1;
float3 param=float3(0.0);
float3 l9_21=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_22=l9_21;
float3 l9_23=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_24=l9_23;
float3 l9_25=tempGlobals.SurfacePosition_ObjectSpace;
float3 l9_26=l9_25;
float3 l9_27=(l9_26-l9_22)/(l9_24-l9_22);
N0_Result=l9_27;
param=N0_Result;
Result_N0=param;
float Output_N32=0.0;
float param_2=(*sc_set0.UserUniforms).refractionDistortSpeed;
Output_N32=param_2;
float2 CoordsOut_N34=float2(0.0);
CoordsOut_N34=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N034*(Globals.gTimeElapsed*Output_N32));
float2 Output_N27=float2(0.0);
float2 param_3=(*sc_set0.UserUniforms).noiseScale;
Output_N27=param_3;
float Noise_N35=0.0;
float2 param_4=CoordsOut_N34;
float2 param_5=Output_N27;
param_4.x=floor(param_4.x*10000.0)*9.9999997e-05;
param_4.y=floor(param_4.y*10000.0)*9.9999997e-05;
param_4*=(param_5*0.5);
float2 l9_28=param_4;
float param_6=(snoise(l9_28)*0.5)+0.5;
param_6=floor(param_6*10000.0)*9.9999997e-05;
Noise_N35=param_6;
float2 CoordsOut_N44=float2(0.0);
CoordsOut_N44=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N044*(Globals.gTimeElapsed*Output_N32));
float2 Output_N28=float2(0.0);
Output_N28=Output_N27*(*sc_set0.UserUniforms).Port_Input1_N028;
float Noise_N42=0.0;
float2 param_7=CoordsOut_N44;
float2 param_8=Output_N28;
float param_9=(*sc_set0.UserUniforms).Port_Offset_N042;
float param_10;
if (SC_DEVICE_CLASS_tmp>=2)
{
param_7.x=floor(param_7.x*10000.0)*9.9999997e-05;
param_7.y=floor(param_7.y*10000.0)*9.9999997e-05;
float2 l9_29=floor(param_7*param_8);
float2 l9_30=fract(param_7*param_8);
float3 l9_31=float3(8.0,0.0,0.0);
int l9_32=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_32<=1)
{
int l9_33=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_33<=1)
{
float2 l9_34=float2(float(l9_33),float(l9_32));
float2 l9_35=l9_34+l9_29;
float l9_36=abs(param_9)+1000.0;
float2 l9_37=VoronoiHash2D(l9_35,l9_36);
float2 l9_38=l9_37;
float l9_39=distance(l9_34+l9_38,l9_30);
if (l9_39<l9_31.x)
{
l9_31=float3(l9_39,l9_38.x,l9_38.y);
param_10=l9_31.x;
param_10=floor(param_10*10000.0)*9.9999997e-05;
}
l9_33++;
continue;
}
else
{
break;
}
}
l9_32++;
continue;
}
else
{
break;
}
}
}
else
{
param_10=0.5;
}
Noise_N42=param_10;
float4 Output_N43=float4(0.0);
Output_N43=mix(float4(Noise_N35),float4(Noise_N42),(*sc_set0.UserUniforms).Port_Input2_N043);
float4 ValueOut_N36=float4(0.0);
ValueOut_N36=(((Output_N43-float4((*sc_set0.UserUniforms).Port_RangeMinA_N036))/float4(((*sc_set0.UserUniforms).Port_RangeMaxA_N036-(*sc_set0.UserUniforms).Port_RangeMinA_N036)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N036-(*sc_set0.UserUniforms).Port_RangeMinB_N036))+float4((*sc_set0.UserUniforms).Port_RangeMinB_N036);
float4 Output_N37=float4(0.0);
Output_N37=cos(ValueOut_N36);
float4 Output_N38=float4(0.0);
Output_N38=sin(ValueOut_N36);
float2 Value_N39=float2(0.0);
Value_N39.x=Output_N37.x;
Value_N39.y=Output_N38.x;
float Output_N61=0.0;
float param_11=(*sc_set0.UserUniforms).refractIntensity;
Output_N61=param_11;
float2 Output_N40=float2(0.0);
Output_N40=Value_N39*float2(Output_N61);
float2 ScreenCoord_N13=float2(0.0);
ScreenCoord_N13=Globals.gScreenCoord;
float Output_N63=0.0;
float param_12=(*sc_set0.UserUniforms).jitter;
Output_N63=param_12;
float2 CoordsOut_N14=float2(0.0);
float2 l9_40=ScreenCoord_N13;
float l9_41=Output_N63;
float4 param_13=ScreenCoord_N13.xyxy+float4(Output_N40,0.0,0.0);
float4 l9_42=float4(81.239487,17.348024,37.349838,59.39484);
float4 l9_43=param_13;
int l9_44=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_44<3)
{
l9_43.x=fract(dot(l9_43,l9_42));
l9_43.y=fract(dot(l9_43,l9_42));
l9_43.z=fract(dot(l9_43,l9_42));
l9_43.w=fract(dot(l9_43,l9_42));
l9_44++;
continue;
}
else
{
break;
}
}
float4 l9_45=l9_43;
CoordsOut_N14=l9_40+((float2(l9_41)*0.0099999998)*((l9_45.zw*2.0)-float2(1.0)));
float2 Output_N41=float2(0.0);
Output_N41=Output_N40+CoordsOut_N14;
float4 Color_N12=float4(0.0);
int l9_46=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_47=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_47=0;
}
else
{
l9_47=in.varStereoViewID;
}
int l9_48=l9_47;
l9_46=1-l9_48;
}
else
{
int l9_49=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_49=0;
}
else
{
l9_49=in.varStereoViewID;
}
int l9_50=l9_49;
l9_46=l9_50;
}
int l9_51=l9_46;
int param_14=screenTexLayout_tmp;
int param_15=l9_51;
float2 param_16=Output_N41;
bool param_17=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 param_18=(*sc_set0.UserUniforms).screenTexTransform;
int2 param_19=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool param_20=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 param_21=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool param_22=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 param_23=(*sc_set0.UserUniforms).screenTexBorderColor;
float param_24=(*sc_set0.UserUniforms).Port_LODValue_N012;
bool l9_52=param_22&&(!param_20);
float l9_53=1.0;
float l9_54=param_16.x;
int l9_55=param_19.x;
if (l9_55==1)
{
l9_54=fract(l9_54);
}
else
{
if (l9_55==2)
{
float l9_56=fract(l9_54);
float l9_57=l9_54-l9_56;
float l9_58=step(0.25,fract(l9_57*0.5));
l9_54=mix(l9_56,1.0-l9_56,fast::clamp(l9_58,0.0,1.0));
}
}
param_16.x=l9_54;
float l9_59=param_16.y;
int l9_60=param_19.y;
if (l9_60==1)
{
l9_59=fract(l9_59);
}
else
{
if (l9_60==2)
{
float l9_61=fract(l9_59);
float l9_62=l9_59-l9_61;
float l9_63=step(0.25,fract(l9_62*0.5));
l9_59=mix(l9_61,1.0-l9_61,fast::clamp(l9_63,0.0,1.0));
}
}
param_16.y=l9_59;
if (param_20)
{
bool l9_64=param_22;
bool l9_65;
if (l9_64)
{
l9_65=param_19.x==3;
}
else
{
l9_65=l9_64;
}
float l9_66=param_16.x;
float l9_67=param_21.x;
float l9_68=param_21.z;
bool l9_69=l9_65;
float l9_70=l9_53;
float l9_71=fast::clamp(l9_66,l9_67,l9_68);
float l9_72=step(abs(l9_66-l9_71),9.9999997e-06);
l9_70*=(l9_72+((1.0-float(l9_69))*(1.0-l9_72)));
l9_66=l9_71;
param_16.x=l9_66;
l9_53=l9_70;
bool l9_73=param_22;
bool l9_74;
if (l9_73)
{
l9_74=param_19.y==3;
}
else
{
l9_74=l9_73;
}
float l9_75=param_16.y;
float l9_76=param_21.y;
float l9_77=param_21.w;
bool l9_78=l9_74;
float l9_79=l9_53;
float l9_80=fast::clamp(l9_75,l9_76,l9_77);
float l9_81=step(abs(l9_75-l9_80),9.9999997e-06);
l9_79*=(l9_81+((1.0-float(l9_78))*(1.0-l9_81)));
l9_75=l9_80;
param_16.y=l9_75;
l9_53=l9_79;
}
float2 l9_82=param_16;
bool l9_83=param_17;
float3x3 l9_84=param_18;
if (l9_83)
{
l9_82=float2((l9_84*float3(l9_82,1.0)).xy);
}
float2 l9_85=l9_82;
float2 l9_86=l9_85;
float2 l9_87=l9_86;
param_16=l9_87;
float l9_88=param_16.x;
int l9_89=param_19.x;
bool l9_90=l9_52;
float l9_91=l9_53;
if ((l9_89==0)||(l9_89==3))
{
float l9_92=l9_88;
float l9_93=0.0;
float l9_94=1.0;
bool l9_95=l9_90;
float l9_96=l9_91;
float l9_97=fast::clamp(l9_92,l9_93,l9_94);
float l9_98=step(abs(l9_92-l9_97),9.9999997e-06);
l9_96*=(l9_98+((1.0-float(l9_95))*(1.0-l9_98)));
l9_92=l9_97;
l9_88=l9_92;
l9_91=l9_96;
}
param_16.x=l9_88;
l9_53=l9_91;
float l9_99=param_16.y;
int l9_100=param_19.y;
bool l9_101=l9_52;
float l9_102=l9_53;
if ((l9_100==0)||(l9_100==3))
{
float l9_103=l9_99;
float l9_104=0.0;
float l9_105=1.0;
bool l9_106=l9_101;
float l9_107=l9_102;
float l9_108=fast::clamp(l9_103,l9_104,l9_105);
float l9_109=step(abs(l9_103-l9_108),9.9999997e-06);
l9_107*=(l9_109+((1.0-float(l9_106))*(1.0-l9_109)));
l9_103=l9_108;
l9_99=l9_103;
l9_102=l9_107;
}
param_16.y=l9_99;
l9_53=l9_102;
float2 l9_110=param_16;
int l9_111=param_14;
int l9_112=param_15;
float l9_113=param_24;
float2 l9_114=l9_110;
int l9_115=l9_111;
int l9_116=l9_112;
float3 l9_117=float3(0.0);
if (l9_115==0)
{
l9_117=float3(l9_114,0.0);
}
else
{
if (l9_115==1)
{
l9_117=float3(l9_114.x,(l9_114.y*0.5)+(0.5-(float(l9_116)*0.5)),0.0);
}
else
{
l9_117=float3(l9_114,float(l9_116));
}
}
float3 l9_118=l9_117;
float3 l9_119=l9_118;
float2 l9_120=l9_119.xy;
float l9_121=l9_113;
float4 l9_122=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_120,level(l9_121));
float4 l9_123=l9_122;
float4 l9_124=l9_123;
if (param_22)
{
l9_124=mix(param_23,l9_124,float4(l9_53));
}
float4 l9_125=l9_124;
Color_N12=l9_125;
float Output_N72=0.0;
float param_25=(*sc_set0.UserUniforms).reafractiveRimIntensity;
Output_N72=param_25;
float Rim_N49=0.0;
float3 param_26=(*sc_set0.UserUniforms).Port_Normal_N049;
float param_27=(*sc_set0.UserUniforms).Port_Exponent_N049;
float param_28=Output_N72;
ssGlobals param_30=Globals;
param_26=float3x3(float3(param_30.VertexTangent_WorldSpace),float3(param_30.VertexBinormal_WorldSpace),float3(param_30.VertexNormal_WorldSpace))*param_26;
float l9_126=abs(dot(-param_30.ViewDirWS,param_26));
float param_29=pow(1.0-l9_126,param_27);
param_29=fast::max(param_29,0.0);
param_29*=param_28;
Rim_N49=param_29;
float4 Output_N51=float4(0.0);
float4 param_31=(*sc_set0.UserUniforms).refractRimColor;
Output_N51=param_31;
float4 Output_N50=float4(0.0);
Output_N50=float4(Rim_N49)*Output_N51;
float4 Output_N48=float4(0.0);
Output_N48=Color_N12+Output_N50;
float4 Output_N26=float4(0.0);
float4 param_32=(*sc_set0.UserUniforms).Tweak_N26;
Output_N26=param_32;
float4 Output_N6=float4(0.0);
Output_N6=Output_N48*Output_N26;
float Output_N74=0.0;
float param_33=(*sc_set0.UserUniforms).whitening;
Output_N74=param_33;
float4 Output_N75=float4(0.0);
Output_N75=Output_N6+float4(Output_N74);
float Output_N68=0.0;
float param_34=(*sc_set0.UserUniforms).refractMetallic;
Output_N68=param_34;
float Output_N69=0.0;
float param_35=(*sc_set0.UserUniforms).refractRoughness;
Output_N69=param_35;
float4 Output_N8=float4(0.0);
float3 param_36=Output_N75.xyz;
float param_37=(*sc_set0.UserUniforms).Port_Opacity_N008;
float3 param_38=(*sc_set0.UserUniforms).Port_Emissive_N008;
float param_39=Output_N68;
float param_40=Output_N69;
float3 param_41=(*sc_set0.UserUniforms).Port_AO_N008;
float3 param_42=(*sc_set0.UserUniforms).Port_SpecularAO_N008;
ssGlobals param_44=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_44.BumpedNormal=param_44.VertexNormal_WorldSpace;
}
float l9_127=param_37;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_127<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_128=gl_FragCoord;
float2 l9_129=floor(mod(l9_128.xy,float2(4.0)));
float l9_130=(mod(dot(l9_129,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_127<l9_130)
{
discard_fragment();
}
}
param_36=fast::max(param_36,float3(0.0));
float4 param_43;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_43=float4(param_36,param_37);
}
else
{
param_39=fast::clamp(param_39,0.0,1.0);
param_40=fast::clamp(param_40,0.0,1.0);
float3 l9_131=param_36;
float l9_132=param_37;
float3 l9_133=param_44.BumpedNormal;
float3 l9_134=param_44.PositionWS;
float3 l9_135=param_44.ViewDirWS;
float3 l9_136=param_38;
float l9_137=param_39;
float l9_138=param_40;
float3 l9_139=param_41;
float3 l9_140=param_42;
param_43=ngsCalculateLighting(l9_131,l9_132,l9_133,l9_134,l9_135,l9_136,l9_137,l9_138,l9_139,l9_140,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_43=fast::max(param_43,float4(0.0));
Output_N8=param_43;
float4 Output_N57=float4(0.0);
float4 param_45=(*sc_set0.UserUniforms).objectRim;
Output_N57=param_45;
float Output_N71=0.0;
float param_46=(*sc_set0.UserUniforms).objectRimIntensity;
Output_N71=param_46;
float Rim_N46=0.0;
float3 param_47=(*sc_set0.UserUniforms).Port_Normal_N046;
float param_48=(*sc_set0.UserUniforms).Port_Exponent_N046;
float param_49=Output_N71;
ssGlobals param_51=Globals;
param_47=float3x3(float3(param_51.VertexTangent_WorldSpace),float3(param_51.VertexBinormal_WorldSpace),float3(param_51.VertexNormal_WorldSpace))*param_47;
float l9_141=abs(dot(-param_51.ViewDirWS,param_47));
float param_50=pow(1.0-l9_141,param_48);
param_50=fast::max(param_50,0.0);
param_50*=param_49;
Rim_N46=param_50;
float4 Output_N7=float4(0.0);
Output_N7=Output_N57*float4(Rim_N46);
float2 UVCoord_N16=float2(0.0);
UVCoord_N16=Globals.Surface_UVCoord0;
float Output_N17=0.0;
float param_52=(*sc_set0.UserUniforms).uvScale;
Output_N17=param_52;
float2 CoordsOut_N18=float2(0.0);
CoordsOut_N18=((UVCoord_N16-(*sc_set0.UserUniforms).Port_Center_N018)*float2(Output_N17))+(*sc_set0.UserUniforms).Port_Center_N018;
float4 Output_N19=float4(0.0);
int l9_142=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_143=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_143=0;
}
else
{
l9_143=in.varStereoViewID;
}
int l9_144=l9_143;
l9_142=1-l9_144;
}
else
{
int l9_145=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_145=0;
}
else
{
l9_145=in.varStereoViewID;
}
int l9_146=l9_145;
l9_142=l9_146;
}
int l9_147=l9_142;
int param_53=baseTexLayout_tmp;
int param_54=l9_147;
float2 param_55=CoordsOut_N18;
bool param_56=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_57=(*sc_set0.UserUniforms).baseTexTransform;
int2 param_58=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_59=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_60=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool param_61=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_62=(*sc_set0.UserUniforms).baseTexBorderColor;
float param_63=0.0;
bool l9_148=param_61&&(!param_59);
float l9_149=1.0;
float l9_150=param_55.x;
int l9_151=param_58.x;
if (l9_151==1)
{
l9_150=fract(l9_150);
}
else
{
if (l9_151==2)
{
float l9_152=fract(l9_150);
float l9_153=l9_150-l9_152;
float l9_154=step(0.25,fract(l9_153*0.5));
l9_150=mix(l9_152,1.0-l9_152,fast::clamp(l9_154,0.0,1.0));
}
}
param_55.x=l9_150;
float l9_155=param_55.y;
int l9_156=param_58.y;
if (l9_156==1)
{
l9_155=fract(l9_155);
}
else
{
if (l9_156==2)
{
float l9_157=fract(l9_155);
float l9_158=l9_155-l9_157;
float l9_159=step(0.25,fract(l9_158*0.5));
l9_155=mix(l9_157,1.0-l9_157,fast::clamp(l9_159,0.0,1.0));
}
}
param_55.y=l9_155;
if (param_59)
{
bool l9_160=param_61;
bool l9_161;
if (l9_160)
{
l9_161=param_58.x==3;
}
else
{
l9_161=l9_160;
}
float l9_162=param_55.x;
float l9_163=param_60.x;
float l9_164=param_60.z;
bool l9_165=l9_161;
float l9_166=l9_149;
float l9_167=fast::clamp(l9_162,l9_163,l9_164);
float l9_168=step(abs(l9_162-l9_167),9.9999997e-06);
l9_166*=(l9_168+((1.0-float(l9_165))*(1.0-l9_168)));
l9_162=l9_167;
param_55.x=l9_162;
l9_149=l9_166;
bool l9_169=param_61;
bool l9_170;
if (l9_169)
{
l9_170=param_58.y==3;
}
else
{
l9_170=l9_169;
}
float l9_171=param_55.y;
float l9_172=param_60.y;
float l9_173=param_60.w;
bool l9_174=l9_170;
float l9_175=l9_149;
float l9_176=fast::clamp(l9_171,l9_172,l9_173);
float l9_177=step(abs(l9_171-l9_176),9.9999997e-06);
l9_175*=(l9_177+((1.0-float(l9_174))*(1.0-l9_177)));
l9_171=l9_176;
param_55.y=l9_171;
l9_149=l9_175;
}
float2 l9_178=param_55;
bool l9_179=param_56;
float3x3 l9_180=param_57;
if (l9_179)
{
l9_178=float2((l9_180*float3(l9_178,1.0)).xy);
}
float2 l9_181=l9_178;
float2 l9_182=l9_181;
float2 l9_183=l9_182;
param_55=l9_183;
float l9_184=param_55.x;
int l9_185=param_58.x;
bool l9_186=l9_148;
float l9_187=l9_149;
if ((l9_185==0)||(l9_185==3))
{
float l9_188=l9_184;
float l9_189=0.0;
float l9_190=1.0;
bool l9_191=l9_186;
float l9_192=l9_187;
float l9_193=fast::clamp(l9_188,l9_189,l9_190);
float l9_194=step(abs(l9_188-l9_193),9.9999997e-06);
l9_192*=(l9_194+((1.0-float(l9_191))*(1.0-l9_194)));
l9_188=l9_193;
l9_184=l9_188;
l9_187=l9_192;
}
param_55.x=l9_184;
l9_149=l9_187;
float l9_195=param_55.y;
int l9_196=param_58.y;
bool l9_197=l9_148;
float l9_198=l9_149;
if ((l9_196==0)||(l9_196==3))
{
float l9_199=l9_195;
float l9_200=0.0;
float l9_201=1.0;
bool l9_202=l9_197;
float l9_203=l9_198;
float l9_204=fast::clamp(l9_199,l9_200,l9_201);
float l9_205=step(abs(l9_199-l9_204),9.9999997e-06);
l9_203*=(l9_205+((1.0-float(l9_202))*(1.0-l9_205)));
l9_199=l9_204;
l9_195=l9_199;
l9_198=l9_203;
}
param_55.y=l9_195;
l9_149=l9_198;
float2 l9_206=param_55;
int l9_207=param_53;
int l9_208=param_54;
float l9_209=param_63;
float2 l9_210=l9_206;
int l9_211=l9_207;
int l9_212=l9_208;
float3 l9_213=float3(0.0);
if (l9_211==0)
{
l9_213=float3(l9_210,0.0);
}
else
{
if (l9_211==1)
{
l9_213=float3(l9_210.x,(l9_210.y*0.5)+(0.5-(float(l9_212)*0.5)),0.0);
}
else
{
l9_213=float3(l9_210,float(l9_212));
}
}
float3 l9_214=l9_213;
float3 l9_215=l9_214;
float2 l9_216=l9_215.xy;
float l9_217=l9_209;
float4 l9_218=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_216,bias(l9_217));
float4 l9_219=l9_218;
float4 l9_220=l9_219;
if (param_61)
{
l9_220=mix(param_62,l9_220,float4(l9_149));
}
float4 l9_221=l9_220;
Output_N19=l9_221;
float4 Output_N47=float4(0.0);
Output_N47=Output_N7+Output_N19;
float Output_N21=0.0;
Output_N21=Output_N19.w;
float4 Output_N22=float4(0.0);
float2 param_64=CoordsOut_N18;
int l9_222=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_223=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_223=0;
}
else
{
l9_223=in.varStereoViewID;
}
int l9_224=l9_223;
l9_222=1-l9_224;
}
else
{
int l9_225=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_225=0;
}
else
{
l9_225=in.varStereoViewID;
}
int l9_226=l9_225;
l9_222=l9_226;
}
int l9_227=l9_222;
int l9_228=normalTexLayout_tmp;
int l9_229=l9_227;
float2 l9_230=param_64;
bool l9_231=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_232=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_233=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_234=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_235=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_236=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_237=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_238=0.0;
bool l9_239=l9_236&&(!l9_234);
float l9_240=1.0;
float l9_241=l9_230.x;
int l9_242=l9_233.x;
if (l9_242==1)
{
l9_241=fract(l9_241);
}
else
{
if (l9_242==2)
{
float l9_243=fract(l9_241);
float l9_244=l9_241-l9_243;
float l9_245=step(0.25,fract(l9_244*0.5));
l9_241=mix(l9_243,1.0-l9_243,fast::clamp(l9_245,0.0,1.0));
}
}
l9_230.x=l9_241;
float l9_246=l9_230.y;
int l9_247=l9_233.y;
if (l9_247==1)
{
l9_246=fract(l9_246);
}
else
{
if (l9_247==2)
{
float l9_248=fract(l9_246);
float l9_249=l9_246-l9_248;
float l9_250=step(0.25,fract(l9_249*0.5));
l9_246=mix(l9_248,1.0-l9_248,fast::clamp(l9_250,0.0,1.0));
}
}
l9_230.y=l9_246;
if (l9_234)
{
bool l9_251=l9_236;
bool l9_252;
if (l9_251)
{
l9_252=l9_233.x==3;
}
else
{
l9_252=l9_251;
}
float l9_253=l9_230.x;
float l9_254=l9_235.x;
float l9_255=l9_235.z;
bool l9_256=l9_252;
float l9_257=l9_240;
float l9_258=fast::clamp(l9_253,l9_254,l9_255);
float l9_259=step(abs(l9_253-l9_258),9.9999997e-06);
l9_257*=(l9_259+((1.0-float(l9_256))*(1.0-l9_259)));
l9_253=l9_258;
l9_230.x=l9_253;
l9_240=l9_257;
bool l9_260=l9_236;
bool l9_261;
if (l9_260)
{
l9_261=l9_233.y==3;
}
else
{
l9_261=l9_260;
}
float l9_262=l9_230.y;
float l9_263=l9_235.y;
float l9_264=l9_235.w;
bool l9_265=l9_261;
float l9_266=l9_240;
float l9_267=fast::clamp(l9_262,l9_263,l9_264);
float l9_268=step(abs(l9_262-l9_267),9.9999997e-06);
l9_266*=(l9_268+((1.0-float(l9_265))*(1.0-l9_268)));
l9_262=l9_267;
l9_230.y=l9_262;
l9_240=l9_266;
}
float2 l9_269=l9_230;
bool l9_270=l9_231;
float3x3 l9_271=l9_232;
if (l9_270)
{
l9_269=float2((l9_271*float3(l9_269,1.0)).xy);
}
float2 l9_272=l9_269;
float2 l9_273=l9_272;
float2 l9_274=l9_273;
l9_230=l9_274;
float l9_275=l9_230.x;
int l9_276=l9_233.x;
bool l9_277=l9_239;
float l9_278=l9_240;
if ((l9_276==0)||(l9_276==3))
{
float l9_279=l9_275;
float l9_280=0.0;
float l9_281=1.0;
bool l9_282=l9_277;
float l9_283=l9_278;
float l9_284=fast::clamp(l9_279,l9_280,l9_281);
float l9_285=step(abs(l9_279-l9_284),9.9999997e-06);
l9_283*=(l9_285+((1.0-float(l9_282))*(1.0-l9_285)));
l9_279=l9_284;
l9_275=l9_279;
l9_278=l9_283;
}
l9_230.x=l9_275;
l9_240=l9_278;
float l9_286=l9_230.y;
int l9_287=l9_233.y;
bool l9_288=l9_239;
float l9_289=l9_240;
if ((l9_287==0)||(l9_287==3))
{
float l9_290=l9_286;
float l9_291=0.0;
float l9_292=1.0;
bool l9_293=l9_288;
float l9_294=l9_289;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_286=l9_290;
l9_289=l9_294;
}
l9_230.y=l9_286;
l9_240=l9_289;
float2 l9_297=l9_230;
int l9_298=l9_228;
int l9_299=l9_229;
float l9_300=l9_238;
float2 l9_301=l9_297;
int l9_302=l9_298;
int l9_303=l9_299;
float3 l9_304=float3(0.0);
if (l9_302==0)
{
l9_304=float3(l9_301,0.0);
}
else
{
if (l9_302==1)
{
l9_304=float3(l9_301.x,(l9_301.y*0.5)+(0.5-(float(l9_303)*0.5)),0.0);
}
else
{
l9_304=float3(l9_301,float(l9_303));
}
}
float3 l9_305=l9_304;
float3 l9_306=l9_305;
float2 l9_307=l9_306.xy;
float l9_308=l9_300;
float4 l9_309=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_307,bias(l9_308));
float4 l9_310=l9_309;
float4 l9_311=l9_310;
if (l9_236)
{
l9_311=mix(l9_237,l9_311,float4(l9_240));
}
float4 l9_312=l9_311;
float4 param_65=l9_312;
float3 l9_313=(param_65.xyz*1.9921875)-float3(1.0);
param_65=float4(l9_313.x,l9_313.y,l9_313.z,param_65.w);
Output_N22=param_65;
float Output_N20=0.0;
float param_66=(*sc_set0.UserUniforms).Tweak_N20;
Output_N20=param_66;
float4 Output_N23=float4(0.0);
int l9_314=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_315=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_315=0;
}
else
{
l9_315=in.varStereoViewID;
}
int l9_316=l9_315;
l9_314=1-l9_316;
}
else
{
int l9_317=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_317=0;
}
else
{
l9_317=in.varStereoViewID;
}
int l9_318=l9_317;
l9_314=l9_318;
}
int l9_319=l9_314;
int param_67=materialParamsTexLayout_tmp;
int param_68=l9_319;
float2 param_69=CoordsOut_N18;
bool param_70=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_71=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_72=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_73=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_74=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_75=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_76=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_77=0.0;
bool l9_320=param_75&&(!param_73);
float l9_321=1.0;
float l9_322=param_69.x;
int l9_323=param_72.x;
if (l9_323==1)
{
l9_322=fract(l9_322);
}
else
{
if (l9_323==2)
{
float l9_324=fract(l9_322);
float l9_325=l9_322-l9_324;
float l9_326=step(0.25,fract(l9_325*0.5));
l9_322=mix(l9_324,1.0-l9_324,fast::clamp(l9_326,0.0,1.0));
}
}
param_69.x=l9_322;
float l9_327=param_69.y;
int l9_328=param_72.y;
if (l9_328==1)
{
l9_327=fract(l9_327);
}
else
{
if (l9_328==2)
{
float l9_329=fract(l9_327);
float l9_330=l9_327-l9_329;
float l9_331=step(0.25,fract(l9_330*0.5));
l9_327=mix(l9_329,1.0-l9_329,fast::clamp(l9_331,0.0,1.0));
}
}
param_69.y=l9_327;
if (param_73)
{
bool l9_332=param_75;
bool l9_333;
if (l9_332)
{
l9_333=param_72.x==3;
}
else
{
l9_333=l9_332;
}
float l9_334=param_69.x;
float l9_335=param_74.x;
float l9_336=param_74.z;
bool l9_337=l9_333;
float l9_338=l9_321;
float l9_339=fast::clamp(l9_334,l9_335,l9_336);
float l9_340=step(abs(l9_334-l9_339),9.9999997e-06);
l9_338*=(l9_340+((1.0-float(l9_337))*(1.0-l9_340)));
l9_334=l9_339;
param_69.x=l9_334;
l9_321=l9_338;
bool l9_341=param_75;
bool l9_342;
if (l9_341)
{
l9_342=param_72.y==3;
}
else
{
l9_342=l9_341;
}
float l9_343=param_69.y;
float l9_344=param_74.y;
float l9_345=param_74.w;
bool l9_346=l9_342;
float l9_347=l9_321;
float l9_348=fast::clamp(l9_343,l9_344,l9_345);
float l9_349=step(abs(l9_343-l9_348),9.9999997e-06);
l9_347*=(l9_349+((1.0-float(l9_346))*(1.0-l9_349)));
l9_343=l9_348;
param_69.y=l9_343;
l9_321=l9_347;
}
float2 l9_350=param_69;
bool l9_351=param_70;
float3x3 l9_352=param_71;
if (l9_351)
{
l9_350=float2((l9_352*float3(l9_350,1.0)).xy);
}
float2 l9_353=l9_350;
float2 l9_354=l9_353;
float2 l9_355=l9_354;
param_69=l9_355;
float l9_356=param_69.x;
int l9_357=param_72.x;
bool l9_358=l9_320;
float l9_359=l9_321;
if ((l9_357==0)||(l9_357==3))
{
float l9_360=l9_356;
float l9_361=0.0;
float l9_362=1.0;
bool l9_363=l9_358;
float l9_364=l9_359;
float l9_365=fast::clamp(l9_360,l9_361,l9_362);
float l9_366=step(abs(l9_360-l9_365),9.9999997e-06);
l9_364*=(l9_366+((1.0-float(l9_363))*(1.0-l9_366)));
l9_360=l9_365;
l9_356=l9_360;
l9_359=l9_364;
}
param_69.x=l9_356;
l9_321=l9_359;
float l9_367=param_69.y;
int l9_368=param_72.y;
bool l9_369=l9_320;
float l9_370=l9_321;
if ((l9_368==0)||(l9_368==3))
{
float l9_371=l9_367;
float l9_372=0.0;
float l9_373=1.0;
bool l9_374=l9_369;
float l9_375=l9_370;
float l9_376=fast::clamp(l9_371,l9_372,l9_373);
float l9_377=step(abs(l9_371-l9_376),9.9999997e-06);
l9_375*=(l9_377+((1.0-float(l9_374))*(1.0-l9_377)));
l9_371=l9_376;
l9_367=l9_371;
l9_370=l9_375;
}
param_69.y=l9_367;
l9_321=l9_370;
float2 l9_378=param_69;
int l9_379=param_67;
int l9_380=param_68;
float l9_381=param_77;
float2 l9_382=l9_378;
int l9_383=l9_379;
int l9_384=l9_380;
float3 l9_385=float3(0.0);
if (l9_383==0)
{
l9_385=float3(l9_382,0.0);
}
else
{
if (l9_383==1)
{
l9_385=float3(l9_382.x,(l9_382.y*0.5)+(0.5-(float(l9_384)*0.5)),0.0);
}
else
{
l9_385=float3(l9_382,float(l9_384));
}
}
float3 l9_386=l9_385;
float3 l9_387=l9_386;
float2 l9_388=l9_387.xy;
float l9_389=l9_381;
float4 l9_390=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_388,bias(l9_389));
float4 l9_391=l9_390;
float4 l9_392=l9_391;
if (param_75)
{
l9_392=mix(param_76,l9_392,float4(l9_321));
}
float4 l9_393=l9_392;
Output_N23=l9_393;
float Value2_N24=0.0;
float Value3_N24=0.0;
float4 param_78=Output_N23;
float param_79=param_78.y;
float param_80=param_78.z;
Value2_N24=param_79;
Value3_N24=param_80;
float4 Output_N25=float4(0.0);
float3 param_81=Output_N47.xyz;
float param_82=Output_N21;
float3 param_83=Output_N22.xyz;
float3 param_84=(*sc_set0.UserUniforms).Port_Emissive_N025;
float param_85=Output_N20;
float param_86=Value2_N24;
float3 param_87=float3(Value3_N24);
float3 param_88=(*sc_set0.UserUniforms).Port_SpecularAO_N025;
ssGlobals param_90=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_90.BumpedNormal=float3x3(float3(param_90.VertexTangent_WorldSpace),float3(param_90.VertexBinormal_WorldSpace),float3(param_90.VertexNormal_WorldSpace))*param_83;
}
param_82=fast::clamp(param_82,0.0,1.0);
float l9_394=param_82;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_394<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_395=gl_FragCoord;
float2 l9_396=floor(mod(l9_395.xy,float2(4.0)));
float l9_397=(mod(dot(l9_396,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_394<l9_397)
{
discard_fragment();
}
}
param_81=fast::max(param_81,float3(0.0));
float4 param_89;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_89=float4(param_81,param_82);
}
else
{
param_85=fast::clamp(param_85,0.0,1.0);
param_86=fast::clamp(param_86,0.0,1.0);
param_87=fast::clamp(param_87,float3(0.0),float3(1.0));
float3 l9_398=param_81;
float l9_399=param_82;
float3 l9_400=param_90.BumpedNormal;
float3 l9_401=param_90.PositionWS;
float3 l9_402=param_90.ViewDirWS;
float3 l9_403=param_84;
float l9_404=param_85;
float l9_405=param_86;
float3 l9_406=param_87;
float3 l9_407=param_88;
param_89=ngsCalculateLighting(l9_398,l9_399,l9_400,l9_401,l9_402,l9_403,l9_404,l9_405,l9_406,l9_407,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_89=fast::max(param_89,float4(0.0));
Output_N25=param_89;
float Output_N31=0.0;
float param_91=(*sc_set0.UserUniforms).lineDistortSpeed;
Output_N31=param_91;
float2 CoordsOut_N11=float2(0.0);
CoordsOut_N11=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N011*(Globals.gTimeElapsed*Output_N31));
float Noise_N2=0.0;
float2 param_92=CoordsOut_N11;
float2 param_93=(*sc_set0.UserUniforms).Port_Scale_N002;
param_92.x=floor(param_92.x*10000.0)*9.9999997e-05;
param_92.y=floor(param_92.y*10000.0)*9.9999997e-05;
param_92*=(param_93*0.5);
float2 l9_408=param_92;
float param_94=(snoise(l9_408)*0.5)+0.5;
param_94=floor(param_94*10000.0)*9.9999997e-05;
Noise_N2=param_94;
float Output_N52=0.0;
float param_95=(*sc_set0.UserUniforms).lineDistortionIntensity;
Output_N52=param_95;
float Output_N10=0.0;
Output_N10=Noise_N2*Output_N52;
float3 Output_N9=float3(0.0);
Output_N9=Result_N0+float3(Output_N10);
float3 Output_N54=float3(0.0);
float3 param_96=(*sc_set0.UserUniforms).direction;
Output_N54=param_96;
float3 Output_N73=float3(0.0);
Output_N73=abs(Output_N54);
float3 Output_N56=float3(0.0);
float3 param_97=Output_N73;
float l9_409=dot(param_97,param_97);
float l9_410;
if (l9_409>0.0)
{
l9_410=1.0/sqrt(l9_409);
}
else
{
l9_410=0.0;
}
float l9_411=l9_410;
float3 param_98=param_97*l9_411;
Output_N56=param_98;
float Output_N55=0.0;
Output_N55=dot(Output_N9,Output_N56);
float4 Result_N66=float4(0.0);
float param_99=0.0;
float4 param_100=(*sc_set0.UserUniforms).Port_Value1_N066;
float4 param_101=float4(0.0);
float l9_412=0.0;
float l9_413=float((*sc_set0.UserUniforms).Tweak_N65!=0);
l9_412=l9_413;
param_99=l9_412;
float4 param_102;
if ((param_99*1.0)!=0.0)
{
param_102=param_100;
}
else
{
float l9_414=0.0;
float l9_415=(*sc_set0.UserUniforms).progressadnan;
l9_414=l9_415;
param_101=float4(l9_414);
param_102=param_101;
}
Result_N66=param_102;
float Output_N58=0.0;
float param_103=(*sc_set0.UserUniforms).lineWidth;
Output_N58=param_103;
float Output_N62=0.0;
float param_104=(*sc_set0.UserUniforms).lineFeathering;
Output_N62=param_104;
float Output_N59=0.0;
float param_105=(*sc_set0.UserUniforms).refractiveRegionWidth;
Output_N59=param_105;
float blendGradient_N53=0.0;
float line_N53=0.0;
float opacity_N53=0.0;
float param_106=Output_N55;
float param_107=Result_N66.x;
float param_108=Output_N58;
float param_109=Output_N62;
float param_110=Output_N59;
ssGlobals param_114=Globals;
tempGlobals=param_114;
float param_111=0.0;
float param_112=0.0;
float param_113=0.0;
N53_ratio=param_106;
N53_progress=param_107;
N53_lineWidth=param_108;
N53_lineFeathering=param_109;
N53_refractiveRegionWidth=param_110;
N53_blendGradient=smoothstep(N53_progress+0.0099999998,N53_progress,N53_ratio);
N53_line=smoothstep((N53_progress+N53_lineFeathering)+N53_lineWidth,N53_progress+N53_lineWidth,N53_ratio);
N53_line-=N53_blendGradient;
N53_opacity=smoothstep(N53_progress+N53_refractiveRegionWidth,N53_progress,N53_ratio);
param_111=N53_blendGradient;
param_112=N53_line;
param_113=N53_opacity;
blendGradient_N53=param_111;
line_N53=param_112;
opacity_N53=param_113;
float4 Output_N15=float4(0.0);
Output_N15=mix(Output_N8,Output_N25,float4(blendGradient_N53));
float4 Output_N3=float4(0.0);
float4 param_115=(*sc_set0.UserUniforms).lineColor;
Output_N3=param_115;
float4 Output_N29=float4(0.0);
Output_N29=float4(line_N53)*Output_N3;
float4 Output_N30=float4(0.0);
Output_N30=Output_N15+Output_N29;
float Output_N70=0.0;
float param_116=(*sc_set0.UserUniforms).opacityBias;
Output_N70=param_116;
float Output_N45=0.0;
float l9_416;
if (opacity_N53<=0.0)
{
l9_416=0.0;
}
else
{
l9_416=pow(opacity_N53,Output_N70);
}
Output_N45=l9_416;
float4 Value_N33=float4(0.0);
Value_N33=float4(Output_N30.xyz.x,Output_N30.xyz.y,Output_N30.xyz.z,Value_N33.w);
Value_N33.w=Output_N45;
FinalColor=Value_N33;
float3 Result_N0_1=float3(0.0);
ssGlobals param_118=Globals;
tempGlobals=param_118;
float3 param_117=float3(0.0);
float3 l9_417=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_418=l9_417;
float3 l9_419=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_420=l9_419;
float3 l9_421=tempGlobals.SurfacePosition_ObjectSpace;
float3 l9_422=l9_421;
float3 l9_423=(l9_422-l9_418)/(l9_420-l9_418);
N0_Result=l9_423;
param_117=N0_Result;
Result_N0_1=param_117;
float Output_N31_1=0.0;
float param_119=(*sc_set0.UserUniforms).lineDistortSpeed;
Output_N31_1=param_119;
float2 CoordsOut_N11_1=float2(0.0);
CoordsOut_N11_1=Result_N0_1.xy+((*sc_set0.UserUniforms).Port_Direction_N011*(Globals.gTimeElapsed*Output_N31_1));
float Noise_N2_1=0.0;
float2 param_120=CoordsOut_N11_1;
float2 param_121=(*sc_set0.UserUniforms).Port_Scale_N002;
param_120.x=floor(param_120.x*10000.0)*9.9999997e-05;
param_120.y=floor(param_120.y*10000.0)*9.9999997e-05;
param_120*=(param_121*0.5);
float2 l9_424=param_120;
float param_122=(snoise(l9_424)*0.5)+0.5;
param_122=floor(param_122*10000.0)*9.9999997e-05;
Noise_N2_1=param_122;
float Output_N52_1=0.0;
float param_123=(*sc_set0.UserUniforms).lineDistortionIntensity;
Output_N52_1=param_123;
float Output_N10_1=0.0;
Output_N10_1=Noise_N2_1*Output_N52_1;
float3 Output_N9_1=float3(0.0);
Output_N9_1=Result_N0_1+float3(Output_N10_1);
float3 Output_N54_1=float3(0.0);
float3 param_124=(*sc_set0.UserUniforms).direction;
Output_N54_1=param_124;
float3 Output_N73_1=float3(0.0);
Output_N73_1=abs(Output_N54_1);
float3 Output_N56_1=float3(0.0);
float3 param_125=Output_N73_1;
float l9_425=dot(param_125,param_125);
float l9_426;
if (l9_425>0.0)
{
l9_426=1.0/sqrt(l9_425);
}
else
{
l9_426=0.0;
}
float l9_427=l9_426;
float3 param_126=param_125*l9_427;
Output_N56_1=param_126;
float Output_N55_1=0.0;
Output_N55_1=dot(Output_N9_1,Output_N56_1);
float4 Result_N66_1=float4(0.0);
float param_127=0.0;
float4 param_128=(*sc_set0.UserUniforms).Port_Value1_N066;
float4 param_129=float4(0.0);
float l9_428=0.0;
float l9_429=float((*sc_set0.UserUniforms).Tweak_N65!=0);
l9_428=l9_429;
param_127=l9_428;
float4 param_130;
if ((param_127*1.0)!=0.0)
{
param_130=param_128;
}
else
{
float l9_430=0.0;
float l9_431=(*sc_set0.UserUniforms).progressadnan;
l9_430=l9_431;
param_129=float4(l9_430);
param_130=param_129;
}
Result_N66_1=param_130;
float Output_N58_1=0.0;
float param_131=(*sc_set0.UserUniforms).lineWidth;
Output_N58_1=param_131;
float Output_N62_1=0.0;
float param_132=(*sc_set0.UserUniforms).lineFeathering;
Output_N62_1=param_132;
float Output_N59_1=0.0;
float param_133=(*sc_set0.UserUniforms).refractiveRegionWidth;
Output_N59_1=param_133;
float line_N53_1=0.0;
float param_134=Output_N55_1;
float param_135=Result_N66_1.x;
float param_136=Output_N58_1;
float param_137=Output_N62_1;
float param_138=Output_N59_1;
ssGlobals param_140=Globals;
tempGlobals=param_140;
float param_139=0.0;
N53_ratio=param_134;
N53_progress=param_135;
N53_lineWidth=param_136;
N53_lineFeathering=param_137;
N53_refractiveRegionWidth=param_138;
N53_blendGradient=smoothstep(N53_progress+0.0099999998,N53_progress,N53_ratio);
N53_line=smoothstep((N53_progress+N53_lineFeathering)+N53_lineWidth,N53_progress+N53_lineWidth,N53_ratio);
N53_line-=N53_blendGradient;
N53_opacity=smoothstep(N53_progress+N53_refractiveRegionWidth,N53_progress,N53_ratio);
param_139=N53_line;
line_N53_1=param_139;
float4 Output_N3_1=float4(0.0);
float4 param_141=(*sc_set0.UserUniforms).lineColor;
Output_N3_1=param_141;
float4 Output_N29_1=float4(0.0);
Output_N29_1=float4(line_N53_1)*Output_N3_1;
FinalColor1=Output_N29_1;
bool l9_432=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_432)
{
float4 param_142=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_142.w=1.0;
}
float4 l9_433=fast::max(param_142,float4(0.0));
float4 param_143=l9_433;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_143.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_143;
return out;
}
float4 param_144=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_434=param_144;
float4 l9_435=l9_434;
float l9_436=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_436=l9_435.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_436=fast::clamp(l9_435.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_436=fast::clamp(dot(l9_435.xyz,float3(l9_435.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_436=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_436=(1.0-dot(l9_435.xyz,float3(0.33333001)))*l9_435.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_436=(1.0-fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0))*l9_435.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_436=fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0)*l9_435.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_436=fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_436=fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0)*l9_435.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_436=dot(l9_435.xyz,float3(0.33333001))*l9_435.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_436=1.0-fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_436=fast::clamp(dot(l9_435.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_437=l9_436;
float l9_438=l9_437;
float l9_439=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_438;
float3 l9_440=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_434.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_441=float4(l9_440.x,l9_440.y,l9_440.z,l9_439);
param_144=l9_441;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_144=float4(param_144.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_442=param_144;
float4 l9_443=float4(0.0);
float4 l9_444=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_445=out.FragColor0;
float4 l9_446=l9_445;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_446.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_447=l9_446;
l9_444=l9_447;
}
else
{
float4 l9_448=gl_FragCoord;
float2 l9_449=l9_448.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_450=l9_449;
float2 l9_451=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_452=1;
int l9_453=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_453=0;
}
else
{
l9_453=in.varStereoViewID;
}
int l9_454=l9_453;
int l9_455=l9_454;
float3 l9_456=float3(l9_450,0.0);
int l9_457=l9_452;
int l9_458=l9_455;
if (l9_457==1)
{
l9_456.y=((2.0*l9_456.y)+float(l9_458))-1.0;
}
float2 l9_459=l9_456.xy;
l9_451=l9_459;
}
else
{
l9_451=l9_450;
}
float2 l9_460=l9_451;
float2 l9_461=l9_460;
float2 l9_462=l9_461;
int l9_463=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_464=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_464=0;
}
else
{
l9_464=in.varStereoViewID;
}
int l9_465=l9_464;
l9_463=1-l9_465;
}
else
{
int l9_466=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_466=0;
}
else
{
l9_466=in.varStereoViewID;
}
int l9_467=l9_466;
l9_463=l9_467;
}
int l9_468=l9_463;
float2 l9_469=l9_462;
int l9_470=l9_468;
float2 l9_471=l9_469;
int l9_472=l9_470;
float l9_473=0.0;
float4 l9_474=float4(0.0);
float2 l9_475=l9_471;
int l9_476=sc_ScreenTextureLayout_tmp;
int l9_477=l9_472;
float l9_478=l9_473;
float2 l9_479=l9_475;
int l9_480=l9_476;
int l9_481=l9_477;
float3 l9_482=float3(0.0);
if (l9_480==0)
{
l9_482=float3(l9_479,0.0);
}
else
{
if (l9_480==1)
{
l9_482=float3(l9_479.x,(l9_479.y*0.5)+(0.5-(float(l9_481)*0.5)),0.0);
}
else
{
l9_482=float3(l9_479,float(l9_481));
}
}
float3 l9_483=l9_482;
float3 l9_484=l9_483;
float2 l9_485=l9_484.xy;
float l9_486=l9_478;
float4 l9_487=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_485,bias(l9_486));
float4 l9_488=l9_487;
l9_474=l9_488;
float4 l9_489=l9_474;
float4 l9_490=l9_489;
float4 l9_491=l9_490;
l9_444=l9_491;
}
float4 l9_492=l9_444;
float4 l9_493=l9_492;
float3 l9_494=l9_493.xyz;
float3 l9_495=l9_494;
float3 l9_496=l9_442.xyz;
float3 l9_497=definedBlend(l9_495,l9_496,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_443=float4(l9_497.x,l9_497.y,l9_497.z,l9_443.w);
float3 l9_498=mix(l9_494,l9_443.xyz,float3(l9_442.w));
l9_443=float4(l9_498.x,l9_498.y,l9_498.z,l9_443.w);
l9_443.w=1.0;
float4 l9_499=l9_443;
param_144=l9_499;
}
else
{
float4 l9_500=param_144;
float4 l9_501=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_501=float4(mix(float3(1.0),l9_500.xyz,float3(l9_500.w)),l9_500.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_502=l9_500.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_502=fast::clamp(l9_502,0.0,1.0);
}
l9_501=float4(l9_500.xyz*l9_502,l9_502);
}
else
{
l9_501=l9_500;
}
}
float4 l9_503=l9_501;
param_144=l9_503;
}
}
}
float4 l9_504=param_144;
FinalColor=l9_504;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_505=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_505=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_505=float4(0.0);
}
float4 l9_506=l9_505;
float4 Cost=l9_506;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
FinalColor1=fast::max(FinalColor1,float4(0.0));
FinalColor+=(FinalColor1*1e-06);
float4 param_145=FinalColor1;
out.FragColor1=param_145;
float3 param_146=in.varPos;
float4 param_147=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_146,param_147,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_148=FinalColor;
float4 l9_507=param_148;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_507.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_507;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
float3 SurfacePosition_ObjectSpace;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float refractionDistortSpeed;
float2 noiseScale;
float refractIntensity;
float jitter;
float reafractiveRimIntensity;
float4 refractRimColor;
float4 Tweak_N26;
float whitening;
float refractMetallic;
float refractRoughness;
float4 objectRim;
float objectRimIntensity;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float uvScale;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float Tweak_N20;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float lineDistortSpeed;
float lineDistortionIntensity;
float3 direction;
int Tweak_N65;
float progressadnan;
float lineWidth;
float lineFeathering;
float refractiveRegionWidth;
float4 lineColor;
float opacityBias;
float2 Port_Direction_N034;
float2 Port_Direction_N044;
float2 Port_Input1_N028;
float Port_Offset_N042;
float4 Port_Input2_N043;
float Port_RangeMinA_N036;
float Port_RangeMaxA_N036;
float Port_RangeMinB_N036;
float Port_RangeMaxB_N036;
float Port_LODValue_N012;
float3 Port_Normal_N049;
float Port_Exponent_N049;
float Port_Opacity_N008;
float3 Port_Normal_N008;
float3 Port_Emissive_N008;
float3 Port_AO_N008;
float3 Port_SpecularAO_N008;
float3 Port_Normal_N046;
float Port_Exponent_N046;
float2 Port_Center_N018;
float3 Port_Emissive_N025;
float3 Port_SpecularAO_N025;
float2 Port_Direction_N011;
float2 Port_Scale_N002;
float4 Port_Value1_N066;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedAoTexture [[id(18)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(19)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(21)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<float> screenTex [[id(26)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler materialParamsTexSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler sc_EnvmapDiffuseSmpSC [[id(33)]];
sampler sc_EnvmapSpecularSmpSC [[id(34)]];
sampler sc_RayTracedAoTextureSmpSC [[id(36)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(37)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(39)]];
sampler sc_SSAOTextureSmpSC [[id(40)]];
sampler sc_ScreenTextureSmpSC [[id(41)]];
sampler sc_ShadowTextureSmpSC [[id(42)]];
sampler screenTexSmpSC [[id(44)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
float2 VoronoiHash2D(thread float2& UV,thread const float& Offset)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2x2 m=float2x2(float2(0.15270001,0.4763),float2(0.4991,0.8998));
UV=fract(sin(mod(UV*m,float2(3.1400001)))*0.32345);
return float2((sin(UV.y*Offset)*0.5)+0.5,(cos(UV.x*Offset)*0.5)+0.5);
}
else
{
return float2(0.0);
}
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
float3 N0_Result=float3(0.0);
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(in.varPos,1.0)).xyz;
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float3 Result_N0=float3(0.0);
ssGlobals param_1=Globals;
ssGlobals tempGlobals=param_1;
float3 param=float3(0.0);
float3 l9_14=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_15=l9_14;
float3 l9_16=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_17=l9_16;
float3 l9_18=tempGlobals.SurfacePosition_ObjectSpace;
float3 l9_19=l9_18;
float3 l9_20=(l9_19-l9_15)/(l9_17-l9_15);
N0_Result=l9_20;
param=N0_Result;
Result_N0=param;
float Output_N32=0.0;
float param_2=(*sc_set0.UserUniforms).refractionDistortSpeed;
Output_N32=param_2;
float2 CoordsOut_N34=float2(0.0);
CoordsOut_N34=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N034*(Globals.gTimeElapsed*Output_N32));
float2 Output_N27=float2(0.0);
float2 param_3=(*sc_set0.UserUniforms).noiseScale;
Output_N27=param_3;
float2 param_4=CoordsOut_N34;
float2 param_5=Output_N27;
param_4.x=floor(param_4.x*10000.0)*9.9999997e-05;
param_4.y=floor(param_4.y*10000.0)*9.9999997e-05;
param_4*=(param_5*0.5);
float2 l9_21=param_4;
float2 CoordsOut_N44=float2(0.0);
CoordsOut_N44=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N044*(Globals.gTimeElapsed*Output_N32));
float2 Output_N28=float2(0.0);
Output_N28=Output_N27*(*sc_set0.UserUniforms).Port_Input1_N028;
float2 param_6=CoordsOut_N44;
float2 param_7=Output_N28;
float param_8=(*sc_set0.UserUniforms).Port_Offset_N042;
if (SC_DEVICE_CLASS_tmp>=2)
{
param_6.x=floor(param_6.x*10000.0)*9.9999997e-05;
param_6.y=floor(param_6.y*10000.0)*9.9999997e-05;
float2 l9_22=floor(param_6*param_7);
int l9_23=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_23<=1)
{
int l9_24=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_24<=1)
{
float2 l9_25=float2(float(l9_24),float(l9_23));
float2 l9_26=l9_25+l9_22;
float l9_27=abs(param_8)+1000.0;
float2 l9_28=VoronoiHash2D(l9_26,l9_27);
l9_24++;
continue;
}
else
{
break;
}
}
l9_23++;
continue;
}
else
{
break;
}
}
}
else
{
}
float Output_N69=0.0;
float param_9=(*sc_set0.UserUniforms).refractRoughness;
Output_N69=param_9;
float param_10=(*sc_set0.UserUniforms).Port_Opacity_N008;
float param_11=Output_N69;
ssGlobals param_12=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_12.BumpedNormal=param_12.VertexNormal_WorldSpace;
}
float l9_29=param_10;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_29<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_30=gl_FragCoord;
float2 l9_31=floor(mod(l9_30.xy,float2(4.0)));
float l9_32=(mod(dot(l9_31,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_29<l9_32)
{
discard_fragment();
}
}
float3 l9_33=param_12.PositionWS;
float3 l9_34=param_12.BumpedNormal;
float l9_35=param_11;
float3 l9_36=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_33);
if (dot(l9_36,l9_34)>=(-0.050000001))
{
uint3 l9_37=uint3(round((l9_33-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_37.x,l9_37.y,l9_37.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_38=l9_34;
float l9_39=dot(abs(l9_38),float3(1.0));
l9_38/=float3(l9_39);
float l9_40=fast::clamp(-l9_38.z,0.0,1.0);
float2 l9_41=l9_38.xy;
float l9_42;
if (l9_38.x>=0.0)
{
l9_42=l9_40;
}
else
{
l9_42=-l9_40;
}
l9_41.x+=l9_42;
float l9_43;
if (l9_38.y>=0.0)
{
l9_43=l9_40;
}
else
{
l9_43=-l9_40;
}
l9_41.y+=l9_43;
float2 l9_44=l9_41;
float2 l9_45=l9_44;
uint2 l9_46=uint2(as_type<uint>(half2(float2(l9_45.x,0.0))),as_type<uint>(half2(float2(l9_45.y,0.0))));
out.normal_and_more=uint4(l9_46.x,l9_46.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_47;
if (l9_35<0.0)
{
l9_47=1023u;
}
else
{
l9_47=uint(fast::clamp(l9_35,0.0,1.0)*1000.0);
}
uint l9_48=l9_47;
l9_48 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_48;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
float2 UVCoord_N16=float2(0.0);
UVCoord_N16=Globals.Surface_UVCoord0;
float Output_N17=0.0;
float param_13=(*sc_set0.UserUniforms).uvScale;
Output_N17=param_13;
float2 CoordsOut_N18=float2(0.0);
CoordsOut_N18=((UVCoord_N16-(*sc_set0.UserUniforms).Port_Center_N018)*float2(Output_N17))+(*sc_set0.UserUniforms).Port_Center_N018;
float4 Output_N19=float4(0.0);
int l9_49=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_50=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_50=0;
}
else
{
l9_50=in.varStereoViewID;
}
int l9_51=l9_50;
l9_49=1-l9_51;
}
else
{
int l9_52=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_52=0;
}
else
{
l9_52=in.varStereoViewID;
}
int l9_53=l9_52;
l9_49=l9_53;
}
int l9_54=l9_49;
int param_14=baseTexLayout_tmp;
int param_15=l9_54;
float2 param_16=CoordsOut_N18;
bool param_17=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_18=(*sc_set0.UserUniforms).baseTexTransform;
int2 param_19=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_20=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_21=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool param_22=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_23=(*sc_set0.UserUniforms).baseTexBorderColor;
float param_24=0.0;
bool l9_55=param_22&&(!param_20);
float l9_56=1.0;
float l9_57=param_16.x;
int l9_58=param_19.x;
if (l9_58==1)
{
l9_57=fract(l9_57);
}
else
{
if (l9_58==2)
{
float l9_59=fract(l9_57);
float l9_60=l9_57-l9_59;
float l9_61=step(0.25,fract(l9_60*0.5));
l9_57=mix(l9_59,1.0-l9_59,fast::clamp(l9_61,0.0,1.0));
}
}
param_16.x=l9_57;
float l9_62=param_16.y;
int l9_63=param_19.y;
if (l9_63==1)
{
l9_62=fract(l9_62);
}
else
{
if (l9_63==2)
{
float l9_64=fract(l9_62);
float l9_65=l9_62-l9_64;
float l9_66=step(0.25,fract(l9_65*0.5));
l9_62=mix(l9_64,1.0-l9_64,fast::clamp(l9_66,0.0,1.0));
}
}
param_16.y=l9_62;
if (param_20)
{
bool l9_67=param_22;
bool l9_68;
if (l9_67)
{
l9_68=param_19.x==3;
}
else
{
l9_68=l9_67;
}
float l9_69=param_16.x;
float l9_70=param_21.x;
float l9_71=param_21.z;
bool l9_72=l9_68;
float l9_73=l9_56;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
param_16.x=l9_69;
l9_56=l9_73;
bool l9_76=param_22;
bool l9_77;
if (l9_76)
{
l9_77=param_19.y==3;
}
else
{
l9_77=l9_76;
}
float l9_78=param_16.y;
float l9_79=param_21.y;
float l9_80=param_21.w;
bool l9_81=l9_77;
float l9_82=l9_56;
float l9_83=fast::clamp(l9_78,l9_79,l9_80);
float l9_84=step(abs(l9_78-l9_83),9.9999997e-06);
l9_82*=(l9_84+((1.0-float(l9_81))*(1.0-l9_84)));
l9_78=l9_83;
param_16.y=l9_78;
l9_56=l9_82;
}
float2 l9_85=param_16;
bool l9_86=param_17;
float3x3 l9_87=param_18;
if (l9_86)
{
l9_85=float2((l9_87*float3(l9_85,1.0)).xy);
}
float2 l9_88=l9_85;
float2 l9_89=l9_88;
float2 l9_90=l9_89;
param_16=l9_90;
float l9_91=param_16.x;
int l9_92=param_19.x;
bool l9_93=l9_55;
float l9_94=l9_56;
if ((l9_92==0)||(l9_92==3))
{
float l9_95=l9_91;
float l9_96=0.0;
float l9_97=1.0;
bool l9_98=l9_93;
float l9_99=l9_94;
float l9_100=fast::clamp(l9_95,l9_96,l9_97);
float l9_101=step(abs(l9_95-l9_100),9.9999997e-06);
l9_99*=(l9_101+((1.0-float(l9_98))*(1.0-l9_101)));
l9_95=l9_100;
l9_91=l9_95;
l9_94=l9_99;
}
param_16.x=l9_91;
l9_56=l9_94;
float l9_102=param_16.y;
int l9_103=param_19.y;
bool l9_104=l9_55;
float l9_105=l9_56;
if ((l9_103==0)||(l9_103==3))
{
float l9_106=l9_102;
float l9_107=0.0;
float l9_108=1.0;
bool l9_109=l9_104;
float l9_110=l9_105;
float l9_111=fast::clamp(l9_106,l9_107,l9_108);
float l9_112=step(abs(l9_106-l9_111),9.9999997e-06);
l9_110*=(l9_112+((1.0-float(l9_109))*(1.0-l9_112)));
l9_106=l9_111;
l9_102=l9_106;
l9_105=l9_110;
}
param_16.y=l9_102;
l9_56=l9_105;
float2 l9_113=param_16;
int l9_114=param_14;
int l9_115=param_15;
float l9_116=param_24;
float2 l9_117=l9_113;
int l9_118=l9_114;
int l9_119=l9_115;
float3 l9_120=float3(0.0);
if (l9_118==0)
{
l9_120=float3(l9_117,0.0);
}
else
{
if (l9_118==1)
{
l9_120=float3(l9_117.x,(l9_117.y*0.5)+(0.5-(float(l9_119)*0.5)),0.0);
}
else
{
l9_120=float3(l9_117,float(l9_119));
}
}
float3 l9_121=l9_120;
float3 l9_122=l9_121;
float2 l9_123=l9_122.xy;
float l9_124=l9_116;
float4 l9_125=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_123,bias(l9_124));
float4 l9_126=l9_125;
float4 l9_127=l9_126;
if (param_22)
{
l9_127=mix(param_23,l9_127,float4(l9_56));
}
float4 l9_128=l9_127;
Output_N19=l9_128;
float Output_N21=0.0;
Output_N21=Output_N19.w;
float4 Output_N22=float4(0.0);
float2 param_25=CoordsOut_N18;
int l9_129=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=in.varStereoViewID;
}
int l9_131=l9_130;
l9_129=1-l9_131;
}
else
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=in.varStereoViewID;
}
int l9_133=l9_132;
l9_129=l9_133;
}
int l9_134=l9_129;
int l9_135=normalTexLayout_tmp;
int l9_136=l9_134;
float2 l9_137=param_25;
bool l9_138=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_139=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_140=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_141=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_142=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_143=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_144=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_145=0.0;
bool l9_146=l9_143&&(!l9_141);
float l9_147=1.0;
float l9_148=l9_137.x;
int l9_149=l9_140.x;
if (l9_149==1)
{
l9_148=fract(l9_148);
}
else
{
if (l9_149==2)
{
float l9_150=fract(l9_148);
float l9_151=l9_148-l9_150;
float l9_152=step(0.25,fract(l9_151*0.5));
l9_148=mix(l9_150,1.0-l9_150,fast::clamp(l9_152,0.0,1.0));
}
}
l9_137.x=l9_148;
float l9_153=l9_137.y;
int l9_154=l9_140.y;
if (l9_154==1)
{
l9_153=fract(l9_153);
}
else
{
if (l9_154==2)
{
float l9_155=fract(l9_153);
float l9_156=l9_153-l9_155;
float l9_157=step(0.25,fract(l9_156*0.5));
l9_153=mix(l9_155,1.0-l9_155,fast::clamp(l9_157,0.0,1.0));
}
}
l9_137.y=l9_153;
if (l9_141)
{
bool l9_158=l9_143;
bool l9_159;
if (l9_158)
{
l9_159=l9_140.x==3;
}
else
{
l9_159=l9_158;
}
float l9_160=l9_137.x;
float l9_161=l9_142.x;
float l9_162=l9_142.z;
bool l9_163=l9_159;
float l9_164=l9_147;
float l9_165=fast::clamp(l9_160,l9_161,l9_162);
float l9_166=step(abs(l9_160-l9_165),9.9999997e-06);
l9_164*=(l9_166+((1.0-float(l9_163))*(1.0-l9_166)));
l9_160=l9_165;
l9_137.x=l9_160;
l9_147=l9_164;
bool l9_167=l9_143;
bool l9_168;
if (l9_167)
{
l9_168=l9_140.y==3;
}
else
{
l9_168=l9_167;
}
float l9_169=l9_137.y;
float l9_170=l9_142.y;
float l9_171=l9_142.w;
bool l9_172=l9_168;
float l9_173=l9_147;
float l9_174=fast::clamp(l9_169,l9_170,l9_171);
float l9_175=step(abs(l9_169-l9_174),9.9999997e-06);
l9_173*=(l9_175+((1.0-float(l9_172))*(1.0-l9_175)));
l9_169=l9_174;
l9_137.y=l9_169;
l9_147=l9_173;
}
float2 l9_176=l9_137;
bool l9_177=l9_138;
float3x3 l9_178=l9_139;
if (l9_177)
{
l9_176=float2((l9_178*float3(l9_176,1.0)).xy);
}
float2 l9_179=l9_176;
float2 l9_180=l9_179;
float2 l9_181=l9_180;
l9_137=l9_181;
float l9_182=l9_137.x;
int l9_183=l9_140.x;
bool l9_184=l9_146;
float l9_185=l9_147;
if ((l9_183==0)||(l9_183==3))
{
float l9_186=l9_182;
float l9_187=0.0;
float l9_188=1.0;
bool l9_189=l9_184;
float l9_190=l9_185;
float l9_191=fast::clamp(l9_186,l9_187,l9_188);
float l9_192=step(abs(l9_186-l9_191),9.9999997e-06);
l9_190*=(l9_192+((1.0-float(l9_189))*(1.0-l9_192)));
l9_186=l9_191;
l9_182=l9_186;
l9_185=l9_190;
}
l9_137.x=l9_182;
l9_147=l9_185;
float l9_193=l9_137.y;
int l9_194=l9_140.y;
bool l9_195=l9_146;
float l9_196=l9_147;
if ((l9_194==0)||(l9_194==3))
{
float l9_197=l9_193;
float l9_198=0.0;
float l9_199=1.0;
bool l9_200=l9_195;
float l9_201=l9_196;
float l9_202=fast::clamp(l9_197,l9_198,l9_199);
float l9_203=step(abs(l9_197-l9_202),9.9999997e-06);
l9_201*=(l9_203+((1.0-float(l9_200))*(1.0-l9_203)));
l9_197=l9_202;
l9_193=l9_197;
l9_196=l9_201;
}
l9_137.y=l9_193;
l9_147=l9_196;
float2 l9_204=l9_137;
int l9_205=l9_135;
int l9_206=l9_136;
float l9_207=l9_145;
float2 l9_208=l9_204;
int l9_209=l9_205;
int l9_210=l9_206;
float3 l9_211=float3(0.0);
if (l9_209==0)
{
l9_211=float3(l9_208,0.0);
}
else
{
if (l9_209==1)
{
l9_211=float3(l9_208.x,(l9_208.y*0.5)+(0.5-(float(l9_210)*0.5)),0.0);
}
else
{
l9_211=float3(l9_208,float(l9_210));
}
}
float3 l9_212=l9_211;
float3 l9_213=l9_212;
float2 l9_214=l9_213.xy;
float l9_215=l9_207;
float4 l9_216=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_214,bias(l9_215));
float4 l9_217=l9_216;
float4 l9_218=l9_217;
if (l9_143)
{
l9_218=mix(l9_144,l9_218,float4(l9_147));
}
float4 l9_219=l9_218;
float4 param_26=l9_219;
float3 l9_220=(param_26.xyz*1.9921875)-float3(1.0);
param_26=float4(l9_220.x,l9_220.y,l9_220.z,param_26.w);
Output_N22=param_26;
float4 Output_N23=float4(0.0);
int l9_221=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_222=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_222=0;
}
else
{
l9_222=in.varStereoViewID;
}
int l9_223=l9_222;
l9_221=1-l9_223;
}
else
{
int l9_224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_224=0;
}
else
{
l9_224=in.varStereoViewID;
}
int l9_225=l9_224;
l9_221=l9_225;
}
int l9_226=l9_221;
int param_27=materialParamsTexLayout_tmp;
int param_28=l9_226;
float2 param_29=CoordsOut_N18;
bool param_30=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_31=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_32=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_33=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_34=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_35=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_36=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_37=0.0;
bool l9_227=param_35&&(!param_33);
float l9_228=1.0;
float l9_229=param_29.x;
int l9_230=param_32.x;
if (l9_230==1)
{
l9_229=fract(l9_229);
}
else
{
if (l9_230==2)
{
float l9_231=fract(l9_229);
float l9_232=l9_229-l9_231;
float l9_233=step(0.25,fract(l9_232*0.5));
l9_229=mix(l9_231,1.0-l9_231,fast::clamp(l9_233,0.0,1.0));
}
}
param_29.x=l9_229;
float l9_234=param_29.y;
int l9_235=param_32.y;
if (l9_235==1)
{
l9_234=fract(l9_234);
}
else
{
if (l9_235==2)
{
float l9_236=fract(l9_234);
float l9_237=l9_234-l9_236;
float l9_238=step(0.25,fract(l9_237*0.5));
l9_234=mix(l9_236,1.0-l9_236,fast::clamp(l9_238,0.0,1.0));
}
}
param_29.y=l9_234;
if (param_33)
{
bool l9_239=param_35;
bool l9_240;
if (l9_239)
{
l9_240=param_32.x==3;
}
else
{
l9_240=l9_239;
}
float l9_241=param_29.x;
float l9_242=param_34.x;
float l9_243=param_34.z;
bool l9_244=l9_240;
float l9_245=l9_228;
float l9_246=fast::clamp(l9_241,l9_242,l9_243);
float l9_247=step(abs(l9_241-l9_246),9.9999997e-06);
l9_245*=(l9_247+((1.0-float(l9_244))*(1.0-l9_247)));
l9_241=l9_246;
param_29.x=l9_241;
l9_228=l9_245;
bool l9_248=param_35;
bool l9_249;
if (l9_248)
{
l9_249=param_32.y==3;
}
else
{
l9_249=l9_248;
}
float l9_250=param_29.y;
float l9_251=param_34.y;
float l9_252=param_34.w;
bool l9_253=l9_249;
float l9_254=l9_228;
float l9_255=fast::clamp(l9_250,l9_251,l9_252);
float l9_256=step(abs(l9_250-l9_255),9.9999997e-06);
l9_254*=(l9_256+((1.0-float(l9_253))*(1.0-l9_256)));
l9_250=l9_255;
param_29.y=l9_250;
l9_228=l9_254;
}
float2 l9_257=param_29;
bool l9_258=param_30;
float3x3 l9_259=param_31;
if (l9_258)
{
l9_257=float2((l9_259*float3(l9_257,1.0)).xy);
}
float2 l9_260=l9_257;
float2 l9_261=l9_260;
float2 l9_262=l9_261;
param_29=l9_262;
float l9_263=param_29.x;
int l9_264=param_32.x;
bool l9_265=l9_227;
float l9_266=l9_228;
if ((l9_264==0)||(l9_264==3))
{
float l9_267=l9_263;
float l9_268=0.0;
float l9_269=1.0;
bool l9_270=l9_265;
float l9_271=l9_266;
float l9_272=fast::clamp(l9_267,l9_268,l9_269);
float l9_273=step(abs(l9_267-l9_272),9.9999997e-06);
l9_271*=(l9_273+((1.0-float(l9_270))*(1.0-l9_273)));
l9_267=l9_272;
l9_263=l9_267;
l9_266=l9_271;
}
param_29.x=l9_263;
l9_228=l9_266;
float l9_274=param_29.y;
int l9_275=param_32.y;
bool l9_276=l9_227;
float l9_277=l9_228;
if ((l9_275==0)||(l9_275==3))
{
float l9_278=l9_274;
float l9_279=0.0;
float l9_280=1.0;
bool l9_281=l9_276;
float l9_282=l9_277;
float l9_283=fast::clamp(l9_278,l9_279,l9_280);
float l9_284=step(abs(l9_278-l9_283),9.9999997e-06);
l9_282*=(l9_284+((1.0-float(l9_281))*(1.0-l9_284)));
l9_278=l9_283;
l9_274=l9_278;
l9_277=l9_282;
}
param_29.y=l9_274;
l9_228=l9_277;
float2 l9_285=param_29;
int l9_286=param_27;
int l9_287=param_28;
float l9_288=param_37;
float2 l9_289=l9_285;
int l9_290=l9_286;
int l9_291=l9_287;
float3 l9_292=float3(0.0);
if (l9_290==0)
{
l9_292=float3(l9_289,0.0);
}
else
{
if (l9_290==1)
{
l9_292=float3(l9_289.x,(l9_289.y*0.5)+(0.5-(float(l9_291)*0.5)),0.0);
}
else
{
l9_292=float3(l9_289,float(l9_291));
}
}
float3 l9_293=l9_292;
float3 l9_294=l9_293;
float2 l9_295=l9_294.xy;
float l9_296=l9_288;
float4 l9_297=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_295,bias(l9_296));
float4 l9_298=l9_297;
float4 l9_299=l9_298;
if (param_35)
{
l9_299=mix(param_36,l9_299,float4(l9_228));
}
float4 l9_300=l9_299;
Output_N23=l9_300;
float Value2_N24=0.0;
float4 param_38=Output_N23;
float param_39=param_38.y;
Value2_N24=param_39;
float param_40=Output_N21;
float3 param_41=Output_N22.xyz;
float param_42=Value2_N24;
ssGlobals param_43=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_43.BumpedNormal=float3x3(float3(param_43.VertexTangent_WorldSpace),float3(param_43.VertexBinormal_WorldSpace),float3(param_43.VertexNormal_WorldSpace))*param_41;
}
param_40=fast::clamp(param_40,0.0,1.0);
float l9_301=param_40;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_301<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_302=gl_FragCoord;
float2 l9_303=floor(mod(l9_302.xy,float2(4.0)));
float l9_304=(mod(dot(l9_303,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_301<l9_304)
{
discard_fragment();
}
}
float3 l9_305=param_43.PositionWS;
float3 l9_306=param_43.BumpedNormal;
float l9_307=param_42;
float3 l9_308=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_305);
if (dot(l9_308,l9_306)>=(-0.050000001))
{
uint3 l9_309=uint3(round((l9_305-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_309.x,l9_309.y,l9_309.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_310=l9_306;
float l9_311=dot(abs(l9_310),float3(1.0));
l9_310/=float3(l9_311);
float l9_312=fast::clamp(-l9_310.z,0.0,1.0);
float2 l9_313=l9_310.xy;
float l9_314;
if (l9_310.x>=0.0)
{
l9_314=l9_312;
}
else
{
l9_314=-l9_312;
}
l9_313.x+=l9_314;
float l9_315;
if (l9_310.y>=0.0)
{
l9_315=l9_312;
}
else
{
l9_315=-l9_312;
}
l9_313.y+=l9_315;
float2 l9_316=l9_313;
float2 l9_317=l9_316;
uint2 l9_318=uint2(as_type<uint>(half2(float2(l9_317.x,0.0))),as_type<uint>(half2(float2(l9_317.y,0.0))));
out.normal_and_more=uint4(l9_318.x,l9_318.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_319;
if (l9_307<0.0)
{
l9_319=1023u;
}
else
{
l9_319=uint(fast::clamp(l9_307,0.0,1.0)*1000.0);
}
uint l9_320=l9_319;
l9_320 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_320;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
float Output_N31=0.0;
float param_44=(*sc_set0.UserUniforms).lineDistortSpeed;
Output_N31=param_44;
float2 CoordsOut_N11=float2(0.0);
CoordsOut_N11=Result_N0.xy+((*sc_set0.UserUniforms).Port_Direction_N011*(Globals.gTimeElapsed*Output_N31));
float2 param_45=CoordsOut_N11;
float2 param_46=(*sc_set0.UserUniforms).Port_Scale_N002;
param_45.x=floor(param_45.x*10000.0)*9.9999997e-05;
param_45.y=floor(param_45.y*10000.0)*9.9999997e-05;
param_45*=(param_46*0.5);
float2 l9_321=param_45;
ssGlobals param_47=Globals;
tempGlobals=param_47;
return out;
}
} // RECEIVER MODE SHADER
