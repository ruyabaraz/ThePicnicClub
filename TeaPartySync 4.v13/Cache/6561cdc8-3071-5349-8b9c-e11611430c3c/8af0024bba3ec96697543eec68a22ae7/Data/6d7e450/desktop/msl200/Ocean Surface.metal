#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING 1
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
//sampler sampler bodyDepthTexSmpSC 0:26
//sampler sampler distortionTexSmpSC 0:27
//sampler sampler fluidPressureSmpSC 0:28
//sampler sampler intensityTextureSmpSC 0:29
//sampler sampler oceanHeightmapSmpSC 0:30
//sampler sampler oceanNormalSmpSC 0:31
//sampler sampler sc_EnvmapDiffuseSmpSC 0:32
//sampler sampler sc_EnvmapSpecularSmpSC 0:33
//sampler sampler sc_RayTracedAoTextureSmpSC 0:35
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:36
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:37
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:38
//sampler sampler sc_SSAOTextureSmpSC 0:39
//sampler sampler sc_ScreenTextureSmpSC 0:40
//sampler sampler sc_ShadowTextureSmpSC 0:41
//sampler sampler screenTexSmpSC 0:43
//texture texture2D bodyDepthTex 0:1:0:26
//texture texture2D distortionTex 0:2:0:27
//texture texture2D fluidPressure 0:3:0:28
//texture texture2D intensityTexture 0:4:0:29
//texture texture2D oceanHeightmap 0:5:0:30
//texture texture2D oceanNormal 0:6:0:31
//texture texture2D sc_EnvmapDiffuse 0:7:0:32
//texture texture2D sc_EnvmapSpecular 0:8:0:33
//texture texture2D sc_RayTracedAoTexture 0:17:0:35
//texture texture2D sc_RayTracedDiffIndTexture 0:18:0:36
//texture texture2D sc_RayTracedReflectionTexture 0:19:0:37
//texture texture2D sc_RayTracedShadowTexture 0:20:0:38
//texture texture2D sc_SSAOTexture 0:21:0:39
//texture texture2D sc_ScreenTexture 0:22:0:40
//texture texture2D sc_ShadowTexture 0:23:0:41
//texture texture2D screenTex 0:25:0:43
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:44:5440 {
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
//bool receivesRayTracedShadows 3828
//bool receivesRayTracedDiffuseIndirect 3832
//bool receivesRayTracedAo 3836
//float receiver_mask 4032
//float3 OriginNormalizationScale 4048
//float3 OriginNormalizationOffset 4080
//int receiverId 4096
//float correctedIntensity 4100
//float3x3 intensityTextureTransform 4160
//float4 intensityTextureUvMinMax 4208
//float4 intensityTextureBorderColor 4224
//int PreviewEnabled 4388
//int PreviewNodeID 4392
//float alphaTestThreshold 4396
//float3 oceanMin 4400
//float3 oceanMax 4416
//float speed 4432
//float enableFoam 4436
//float fbmScale 4440
//float enableInfinite 4444
//float3x3 screenTexTransform 4496
//float4 screenTexUvMinMax 4544
//float4 screenTexBorderColor 4560
//float3x3 distortionTexTransform 4624
//float4 distortionTexUvMinMax 4672
//float4 distortionTexBorderColor 4688
//float distortionScale 4704
//float distortionIntensity 4708
//float3x3 oceanHeightmapTransform 4768
//float4 oceanHeightmapUvMinMax 4816
//float4 oceanHeightmapBorderColor 4832
//float3x3 oceanNormalTransform 4896
//float4 oceanNormalUvMinMax 4944
//float4 oceanNormalBorderColor 4960
//float enableFluid 4976
//float2 pressureRange 4984
//float3x3 fluidPressureTransform 5040
//float4 fluidPressureUvMinMax 5088
//float4 fluidPressureBorderColor 5104
//float fluidMul 5120
//float2 unpackVal 5128
//float4 colorTrough 5136
//float4 colorMiddle 5152
//float4 colorCrest 5168
//float bodyIntersection 5184
//float3x3 bodyDepthTexTransform 5248
//float4 bodyDepthTexUvMinMax 5296
//float4 bodyDepthTexBorderColor 5312
//float4 bodyDepthTexProjectionMatrixTerms 5328
//float Port_Position1_N030 5344
//float Port_Position2_N030 5348
//float Port_Position3_N030 5352
//float Port_Position4_N030 5356
//float Port_Opacity_N013 5360
//float3 Port_Emissive_N013 5376
//float Port_Metallic_N013 5392
//float Port_Roughness_N013 5396
//float3 Port_AO_N013 5408
//float3 Port_SpecularAO_N013 5424
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
//spec_const bool sc_BlendMode_AddWithAlphaFactor 59 0
//spec_const bool sc_BlendMode_Add 60 0
//spec_const bool sc_BlendMode_AlphaTest 61 0
//spec_const bool sc_BlendMode_AlphaToCoverage 62 0
//spec_const bool sc_BlendMode_ColoredGlass 63 0
//spec_const bool sc_BlendMode_Custom 64 0
//spec_const bool sc_BlendMode_Max 65 0
//spec_const bool sc_BlendMode_Min 66 0
//spec_const bool sc_BlendMode_MultiplyOriginal 67 0
//spec_const bool sc_BlendMode_Multiply 68 0
//spec_const bool sc_BlendMode_Normal 69 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 70 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 71 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 72 0
//spec_const bool sc_BlendMode_Screen 73 0
//spec_const bool sc_DepthOnly 74 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 75 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 76 0
//spec_const bool sc_FramebufferFetch 77 0
//spec_const bool sc_HasDiffuseEnvmap 78 0
//spec_const bool sc_LightEstimation 79 0
//spec_const bool sc_MotionVectorsPass 80 0
//spec_const bool sc_OITCompositingPass 81 0
//spec_const bool sc_OITDepthBoundsPass 82 0
//spec_const bool sc_OITDepthGatherPass 83 0
//spec_const bool sc_ProjectiveShadowsCaster 84 0
//spec_const bool sc_ProjectiveShadowsReceiver 85 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 86 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 87 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 88 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 89 0
//spec_const bool sc_RenderAlphaToColor 90 0
//spec_const bool sc_SSAOEnabled 91 0
//spec_const bool sc_ScreenTextureHasSwappedViews 92 0
//spec_const bool sc_ShaderComplexityAnalyzer 93 0
//spec_const bool sc_TAAEnabled 94 0
//spec_const bool sc_UseFramebufferFetchMarker 95 0
//spec_const bool sc_VertexBlendingUseNormals 96 0
//spec_const bool sc_VertexBlending 97 0
//spec_const bool screenTexHasSwappedViews 98 0
//spec_const int SC_DEVICE_CLASS 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_distortionTex 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanNormal 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_distortionTex 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanNormal 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 113 -1
//spec_const int bodyDepthTexLayout 114 0
//spec_const int distortionTexLayout 115 0
//spec_const int fluidPressureLayout 116 0
//spec_const int intensityTextureLayout 117 0
//spec_const int oceanHeightmapLayout 118 0
//spec_const int oceanNormalLayout 119 0
//spec_const int sc_AmbientLightMode0 120 0
//spec_const int sc_AmbientLightMode1 121 0
//spec_const int sc_AmbientLightMode2 122 0
//spec_const int sc_AmbientLightMode_Constant 123 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 124 0
//spec_const int sc_AmbientLightMode_FromCamera 125 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 126 0
//spec_const int sc_AmbientLightsCount 127 0
//spec_const int sc_DepthBufferMode 128 0
//spec_const int sc_DirectionalLightsCount 129 0
//spec_const int sc_EnvLightMode 130 0
//spec_const int sc_EnvmapDiffuseLayout 131 0
//spec_const int sc_EnvmapSpecularLayout 132 0
//spec_const int sc_LightEstimationSGCount 133 0
//spec_const int sc_MaxTextureImageUnits 134 0
//spec_const int sc_PointLightsCount 135 0
//spec_const int sc_RayTracedAoTextureLayout 136 0
//spec_const int sc_RayTracedDiffIndTextureLayout 137 0
//spec_const int sc_RayTracedReflectionTextureLayout 138 0
//spec_const int sc_RayTracedShadowTextureLayout 139 0
//spec_const int sc_RenderingSpace 140 -1
//spec_const int sc_ScreenTextureLayout 141 0
//spec_const int sc_ShaderCacheConstant 142 0
//spec_const int sc_SkinBonesCount 143 0
//spec_const int sc_StereoRenderingMode 144 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 145 0
//spec_const int screenTexLayout 146 0
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
constant bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_bodyDepthTex) ? SC_USE_CLAMP_TO_BORDER_bodyDepthTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_distortionTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_distortionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_distortionTex) ? SC_USE_CLAMP_TO_BORDER_distortionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_fluidPressure) ? SC_USE_CLAMP_TO_BORDER_fluidPressure : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_oceanHeightmap) ? SC_USE_CLAMP_TO_BORDER_oceanHeightmap : false;
constant bool SC_USE_CLAMP_TO_BORDER_oceanNormal [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_oceanNormal) ? SC_USE_CLAMP_TO_BORDER_oceanNormal : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTex [[function_constant(37)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTex) ? SC_USE_CLAMP_TO_BORDER_screenTex : false;
constant bool SC_USE_UV_MIN_MAX_bodyDepthTex [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_bodyDepthTex) ? SC_USE_UV_MIN_MAX_bodyDepthTex : false;
constant bool SC_USE_UV_MIN_MAX_distortionTex [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_distortionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_distortionTex) ? SC_USE_UV_MIN_MAX_distortionTex : false;
constant bool SC_USE_UV_MIN_MAX_fluidPressure [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_fluidPressure) ? SC_USE_UV_MIN_MAX_fluidPressure : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_oceanHeightmap [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_oceanHeightmap) ? SC_USE_UV_MIN_MAX_oceanHeightmap : false;
constant bool SC_USE_UV_MIN_MAX_oceanNormal [[function_constant(43)]];
constant bool SC_USE_UV_MIN_MAX_oceanNormal_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_oceanNormal) ? SC_USE_UV_MIN_MAX_oceanNormal : false;
constant bool SC_USE_UV_MIN_MAX_screenTex [[function_constant(44)]];
constant bool SC_USE_UV_MIN_MAX_screenTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTex) ? SC_USE_UV_MIN_MAX_screenTex : false;
constant bool SC_USE_UV_TRANSFORM_bodyDepthTex [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_bodyDepthTex) ? SC_USE_UV_TRANSFORM_bodyDepthTex : false;
constant bool SC_USE_UV_TRANSFORM_distortionTex [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_distortionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_distortionTex) ? SC_USE_UV_TRANSFORM_distortionTex : false;
constant bool SC_USE_UV_TRANSFORM_fluidPressure [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_fluidPressure) ? SC_USE_UV_TRANSFORM_fluidPressure : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_oceanHeightmap [[function_constant(49)]];
constant bool SC_USE_UV_TRANSFORM_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_oceanHeightmap) ? SC_USE_UV_TRANSFORM_oceanHeightmap : false;
constant bool SC_USE_UV_TRANSFORM_oceanNormal [[function_constant(50)]];
constant bool SC_USE_UV_TRANSFORM_oceanNormal_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_oceanNormal) ? SC_USE_UV_TRANSFORM_oceanNormal : false;
constant bool SC_USE_UV_TRANSFORM_screenTex [[function_constant(51)]];
constant bool SC_USE_UV_TRANSFORM_screenTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTex) ? SC_USE_UV_TRANSFORM_screenTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(52)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool bodyDepthTexHasSwappedViews [[function_constant(53)]];
constant bool bodyDepthTexHasSwappedViews_tmp = is_function_constant_defined(bodyDepthTexHasSwappedViews) ? bodyDepthTexHasSwappedViews : false;
constant bool distortionTexHasSwappedViews [[function_constant(54)]];
constant bool distortionTexHasSwappedViews_tmp = is_function_constant_defined(distortionTexHasSwappedViews) ? distortionTexHasSwappedViews : false;
constant bool fluidPressureHasSwappedViews [[function_constant(55)]];
constant bool fluidPressureHasSwappedViews_tmp = is_function_constant_defined(fluidPressureHasSwappedViews) ? fluidPressureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(56)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool oceanHeightmapHasSwappedViews [[function_constant(57)]];
constant bool oceanHeightmapHasSwappedViews_tmp = is_function_constant_defined(oceanHeightmapHasSwappedViews) ? oceanHeightmapHasSwappedViews : false;
constant bool oceanNormalHasSwappedViews [[function_constant(58)]];
constant bool oceanNormalHasSwappedViews_tmp = is_function_constant_defined(oceanNormalHasSwappedViews) ? oceanNormalHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(59)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(60)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(61)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(62)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(63)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(64)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(65)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(66)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(67)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(68)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(69)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(70)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(71)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(72)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(73)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(74)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(75)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(76)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(77)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(78)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(79)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(80)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(81)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(82)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(83)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(84)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(85)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(86)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(87)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(88)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(89)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(90)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(91)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(92)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(93)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(94)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(95)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(96)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(97)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool screenTexHasSwappedViews [[function_constant(98)]];
constant bool screenTexHasSwappedViews_tmp = is_function_constant_defined(screenTexHasSwappedViews) ? screenTexHasSwappedViews : false;
constant int SC_DEVICE_CLASS [[function_constant(99)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex [[function_constant(100)]];
constant int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex) ? SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_distortionTex [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_U_distortionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_distortionTex) ? SC_SOFTWARE_WRAP_MODE_U_distortionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_U_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap [[function_constant(104)]];
constant int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap) ? SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_oceanNormal [[function_constant(105)]];
constant int SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_oceanNormal) ? SC_SOFTWARE_WRAP_MODE_U_oceanNormal : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex [[function_constant(106)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTex) ? SC_SOFTWARE_WRAP_MODE_U_screenTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex [[function_constant(107)]];
constant int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex) ? SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_distortionTex [[function_constant(108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_distortionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_distortionTex) ? SC_SOFTWARE_WRAP_MODE_V_distortionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure [[function_constant(109)]];
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_V_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(110)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap [[function_constant(111)]];
constant int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap) ? SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_oceanNormal [[function_constant(112)]];
constant int SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_oceanNormal) ? SC_SOFTWARE_WRAP_MODE_V_oceanNormal : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex [[function_constant(113)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTex) ? SC_SOFTWARE_WRAP_MODE_V_screenTex : -1;
constant int bodyDepthTexLayout [[function_constant(114)]];
constant int bodyDepthTexLayout_tmp = is_function_constant_defined(bodyDepthTexLayout) ? bodyDepthTexLayout : 0;
constant int distortionTexLayout [[function_constant(115)]];
constant int distortionTexLayout_tmp = is_function_constant_defined(distortionTexLayout) ? distortionTexLayout : 0;
constant int fluidPressureLayout [[function_constant(116)]];
constant int fluidPressureLayout_tmp = is_function_constant_defined(fluidPressureLayout) ? fluidPressureLayout : 0;
constant int intensityTextureLayout [[function_constant(117)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int oceanHeightmapLayout [[function_constant(118)]];
constant int oceanHeightmapLayout_tmp = is_function_constant_defined(oceanHeightmapLayout) ? oceanHeightmapLayout : 0;
constant int oceanNormalLayout [[function_constant(119)]];
constant int oceanNormalLayout_tmp = is_function_constant_defined(oceanNormalLayout) ? oceanNormalLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(120)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(121)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(122)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(123)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(124)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(125)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(126)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(127)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(128)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(129)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(130)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(131)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(132)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(133)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(134)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(135)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(136)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(137)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(138)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(139)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(140)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(141)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(142)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(143)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(144)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(145)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTexLayout [[function_constant(146)]];
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float N123_fbm;
float N123_TatalHeightRemap;
float3 SurfacePosition_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 gScreenCoord;
float3 ViewDirWS;
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
float3 oceanMin;
float3 oceanMax;
float speed;
float enableFoam;
float fbmScale;
float enableInfinite;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float4 distortionTexSize;
float4 distortionTexDims;
float4 distortionTexView;
float3x3 distortionTexTransform;
float4 distortionTexUvMinMax;
float4 distortionTexBorderColor;
float distortionScale;
float distortionIntensity;
float4 oceanHeightmapSize;
float4 oceanHeightmapDims;
float4 oceanHeightmapView;
float3x3 oceanHeightmapTransform;
float4 oceanHeightmapUvMinMax;
float4 oceanHeightmapBorderColor;
float4 oceanNormalSize;
float4 oceanNormalDims;
float4 oceanNormalView;
float3x3 oceanNormalTransform;
float4 oceanNormalUvMinMax;
float4 oceanNormalBorderColor;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float2 unpackVal;
float4 colorTrough;
float4 colorMiddle;
float4 colorCrest;
float bodyIntersection;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_Position1_N030;
float Port_Position2_N030;
float Port_Position3_N030;
float Port_Position4_N030;
float Port_Opacity_N013;
float3 Port_Emissive_N013;
float Port_Metallic_N013;
float Port_Roughness_N013;
float3 Port_AO_N013;
float3 Port_SpecularAO_N013;
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
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> bodyDepthTex [[id(1)]];
texture2d<float> distortionTex [[id(2)]];
texture2d<float> fluidPressure [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> oceanHeightmap [[id(5)]];
texture2d<float> oceanNormal [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
texture2d<float> sc_ShadowTexture [[id(23)]];
texture2d<float> screenTex [[id(25)]];
sampler bodyDepthTexSmpSC [[id(26)]];
sampler distortionTexSmpSC [[id(27)]];
sampler fluidPressureSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler oceanHeightmapSmpSC [[id(30)]];
sampler oceanNormalSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler screenTexSmpSC [[id(43)]];
constant userUniformsObj* UserUniforms [[id(44)]];
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
float3 N123_OceanAabbMin=float3(0.0);
float3 N123_OceanAabbMax=float3(0.0);
float N123_OceanSpeed=0.0;
float N123_EnableFoam=0.0;
float N123_FBMScale=0.0;
float N123_EnableInfinite=0.0;
float N123_EnableFluid=0.0;
float2 N123_pressureRange=float2(0.0);
float N123_FluidMul=0.0;
float2 N123_unpackVal=float2(0.0);
float3 N123_SurfacePosition=float3(0.0);
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set0.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set0.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set0.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set0.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set0.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set0.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=int(in.boneData.x);
int l9_56=int(in.boneData.y);
int l9_57=int(in.boneData.z);
int l9_58=int(in.boneData.w);
int l9_59=l9_55;
float4 l9_60=l9_51.position;
float3 l9_61=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_62=l9_59;
float4 l9_63=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[0];
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[1];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[2];
float4 l9_66[3];
l9_66[0]=l9_63;
l9_66[1]=l9_64;
l9_66[2]=l9_65;
l9_61=float3(dot(l9_60,l9_66[0]),dot(l9_60,l9_66[1]),dot(l9_60,l9_66[2]));
}
else
{
l9_61=l9_60.xyz;
}
float3 l9_67=l9_61;
float3 l9_68=l9_67;
float l9_69=l9_54.x;
int l9_70=l9_56;
float4 l9_71=l9_51.position;
float3 l9_72=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_73=l9_70;
float4 l9_74=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[0];
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[1];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[2];
float4 l9_77[3];
l9_77[0]=l9_74;
l9_77[1]=l9_75;
l9_77[2]=l9_76;
l9_72=float3(dot(l9_71,l9_77[0]),dot(l9_71,l9_77[1]),dot(l9_71,l9_77[2]));
}
else
{
l9_72=l9_71.xyz;
}
float3 l9_78=l9_72;
float3 l9_79=l9_78;
float l9_80=l9_54.y;
int l9_81=l9_57;
float4 l9_82=l9_51.position;
float3 l9_83=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_84=l9_81;
float4 l9_85=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[0];
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[1];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[2];
float4 l9_88[3];
l9_88[0]=l9_85;
l9_88[1]=l9_86;
l9_88[2]=l9_87;
l9_83=float3(dot(l9_82,l9_88[0]),dot(l9_82,l9_88[1]),dot(l9_82,l9_88[2]));
}
else
{
l9_83=l9_82.xyz;
}
float3 l9_89=l9_83;
float3 l9_90=l9_89;
float l9_91=l9_54.z;
int l9_92=l9_58;
float4 l9_93=l9_51.position;
float3 l9_94=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_95=l9_92;
float4 l9_96=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[0];
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[1];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[2];
float4 l9_99[3];
l9_99[0]=l9_96;
l9_99[1]=l9_97;
l9_99[2]=l9_98;
l9_94=float3(dot(l9_93,l9_99[0]),dot(l9_93,l9_99[1]),dot(l9_93,l9_99[2]));
}
else
{
l9_94=l9_93.xyz;
}
float3 l9_100=l9_94;
float3 l9_101=(((l9_68*l9_69)+(l9_79*l9_80))+(l9_90*l9_91))+(l9_100*l9_54.w);
l9_51.position=float4(l9_101.x,l9_101.y,l9_101.z,l9_51.position.w);
int l9_102=l9_55;
float3x3 l9_103=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[2].xyz));
float3x3 l9_104=l9_103;
float3x3 l9_105=l9_104;
int l9_106=l9_56;
float3x3 l9_107=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[2].xyz));
float3x3 l9_108=l9_107;
float3x3 l9_109=l9_108;
int l9_110=l9_57;
float3x3 l9_111=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[2].xyz));
float3x3 l9_112=l9_111;
float3x3 l9_113=l9_112;
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
l9_51.normal=((((l9_105*l9_51.normal)*l9_54.x)+((l9_109*l9_51.normal)*l9_54.y))+((l9_113*l9_51.normal)*l9_54.z))+((l9_117*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_105*l9_51.tangent)*l9_54.x)+((l9_109*l9_51.tangent)*l9_54.y))+((l9_113*l9_51.tangent)*l9_54.z))+((l9_117*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_118=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_118.x,l9_118.y,l9_118.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_WorldSpace=out.varPos;
Globals.VertexNormal_WorldSpace=out.varNormal;
Globals.VertexTangent_WorldSpace=out.varTangent.xyz;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*out.varTangent.w;
Globals.Surface_UVCoord0=v.texture0;
int l9_119=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_119=0;
}
else
{
l9_119=gl_InstanceIndex%2;
}
int l9_120=l9_119;
float4 Result=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_120]*float4(out.varPos,1.0);
float3 l9_121=Result.xyz/float3(Result.w);
Result=float4(l9_121.x,l9_121.y,l9_121.z,Result.w);
Globals.gScreenCoord=(Result.xy*0.5)+float2(0.5);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 SurfacePosition_N123=float3(0.0);
ssGlobals param_2=Globals;
ssGlobals tempGlobals=param_2;
float3 param_1=float3(0.0);
float3 l9_122=float3(0.0);
float3 l9_123=float3(0.0);
float3 l9_124=(*sc_set0.UserUniforms).oceanMin;
l9_123=l9_124;
l9_122=l9_123;
float3 l9_125=l9_122;
N123_OceanAabbMin=l9_125;
float3 l9_126=float3(0.0);
float3 l9_127=float3(0.0);
float3 l9_128=(*sc_set0.UserUniforms).oceanMax;
l9_127=l9_128;
l9_126=l9_127;
float3 l9_129=l9_126;
N123_OceanAabbMax=l9_129;
float l9_130=0.0;
float l9_131=0.0;
float l9_132=(*sc_set0.UserUniforms).speed;
l9_131=l9_132;
l9_130=l9_131;
float l9_133=l9_130;
N123_OceanSpeed=l9_133;
float l9_134=0.0;
float l9_135=0.0;
float l9_136=(*sc_set0.UserUniforms).enableFoam;
l9_135=l9_136;
l9_134=l9_135;
float l9_137=l9_134;
N123_EnableFoam=l9_137;
float l9_138=0.0;
float l9_139=0.0;
float l9_140=(*sc_set0.UserUniforms).fbmScale;
l9_139=l9_140;
l9_138=l9_139;
float l9_141=l9_138;
N123_FBMScale=l9_141;
float l9_142=0.0;
float l9_143=0.0;
float l9_144=(*sc_set0.UserUniforms).enableInfinite;
l9_143=l9_144;
l9_142=l9_143;
float l9_145=l9_142;
N123_EnableInfinite=l9_145;
float l9_146=0.0;
float l9_147=0.0;
float l9_148=(*sc_set0.UserUniforms).enableFluid;
l9_147=l9_148;
l9_146=l9_147;
float l9_149=l9_146;
N123_EnableFluid=l9_149;
float2 l9_150=float2(0.0);
float2 l9_151=float2(0.0);
float2 l9_152=(*sc_set0.UserUniforms).pressureRange;
l9_151=l9_152;
l9_150=l9_151;
float2 l9_153=l9_150;
N123_pressureRange=l9_153;
float l9_154=0.0;
float l9_155=0.0;
float l9_156=(*sc_set0.UserUniforms).fluidMul;
l9_155=l9_156;
l9_154=l9_155;
float l9_157=l9_154;
N123_FluidMul=l9_157;
float2 l9_158=float2(0.0);
float2 l9_159=float2(0.0);
float2 l9_160=(*sc_set0.UserUniforms).unpackVal;
l9_159=l9_160;
l9_158=l9_159;
float2 l9_161=l9_158;
N123_unpackVal=l9_161;
float l9_162=0.0;
l9_162=tempGlobals.N123_TatalHeightRemap;
float4 l9_163=float4(0.0);
float4 l9_164=(*sc_set0.UserUniforms).colorTrough;
l9_163=l9_164;
float4 l9_165=float4(0.0);
float4 l9_166=(*sc_set0.UserUniforms).colorMiddle;
l9_165=l9_166;
float4 l9_167=float4(0.0);
float4 l9_168=(*sc_set0.UserUniforms).colorCrest;
l9_167=l9_168;
float l9_169=0.0;
l9_169=tempGlobals.N123_fbm;
float4 l9_170=float4(0.0);
l9_170=mix(l9_165,l9_167,float4(l9_169));
float l9_171=l9_162;
float4 l9_172=l9_163;
float l9_173=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_174=l9_163;
float l9_175=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_176=l9_163;
float l9_177=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_178=l9_165;
float l9_179=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_180=l9_170;
float4 l9_181=l9_170;
l9_171=fast::clamp(l9_171,0.0,1.0);
float4 l9_182;
if (l9_171<l9_173)
{
l9_182=mix(l9_172,l9_174,float4(fast::clamp(l9_171/l9_173,0.0,1.0)));
}
else
{
if (l9_171<l9_175)
{
l9_182=mix(l9_174,l9_176,float4(fast::clamp((l9_171-l9_173)/(l9_175-l9_173),0.0,1.0)));
}
else
{
if (l9_171<l9_177)
{
l9_182=mix(l9_176,l9_178,float4(fast::clamp((l9_171-l9_175)/(l9_177-l9_175),0.0,1.0)));
}
else
{
if (l9_171<l9_179)
{
l9_182=mix(l9_178,l9_180,float4(fast::clamp((l9_171-l9_177)/(l9_179-l9_177),0.0,1.0)));
}
else
{
l9_182=mix(l9_180,l9_181,float4(fast::clamp((l9_171-l9_179)/(1.0-l9_179),0.0,1.0)));
}
}
}
}
bool l9_183=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_184;
if (l9_183)
{
l9_184=!PreviewInfo.Saved;
}
else
{
l9_184=l9_183;
}
bool l9_185;
if (l9_184)
{
l9_185=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_185=l9_184;
}
if (l9_185)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_182;
}
float2 l9_186=tempGlobals.Surface_UVCoord0;
float2 l9_187=l9_186;
float3 l9_188=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_189=l9_188;
float2 l9_190=l9_187;
if (N123_EnableInfinite==1.0)
{
float2 l9_191=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_192=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_193=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_194=float2(0.0)+(((l9_193.xz-l9_191)*1.0)/((l9_192-l9_191)+float2(1e-06)));
l9_194.y=1.0-l9_194.y;
l9_190=(l9_187+l9_194)-float2(0.5);
}
float2 l9_195=l9_190;
float4 l9_196=float4(0.0);
int l9_197=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_198=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_198=0;
}
else
{
l9_198=gl_InstanceIndex%2;
}
int l9_199=l9_198;
l9_197=1-l9_199;
}
else
{
int l9_200=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_200=0;
}
else
{
l9_200=gl_InstanceIndex%2;
}
int l9_201=l9_200;
l9_197=l9_201;
}
int l9_202=l9_197;
int l9_203=oceanHeightmapLayout_tmp;
int l9_204=l9_202;
float2 l9_205=l9_195;
bool l9_206=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_207=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_208=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_209=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_210=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_211=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_212=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_213=0.0;
bool l9_214=l9_211&&(!l9_209);
float l9_215=1.0;
float l9_216=l9_205.x;
int l9_217=l9_208.x;
if (l9_217==1)
{
l9_216=fract(l9_216);
}
else
{
if (l9_217==2)
{
float l9_218=fract(l9_216);
float l9_219=l9_216-l9_218;
float l9_220=step(0.25,fract(l9_219*0.5));
l9_216=mix(l9_218,1.0-l9_218,fast::clamp(l9_220,0.0,1.0));
}
}
l9_205.x=l9_216;
float l9_221=l9_205.y;
int l9_222=l9_208.y;
if (l9_222==1)
{
l9_221=fract(l9_221);
}
else
{
if (l9_222==2)
{
float l9_223=fract(l9_221);
float l9_224=l9_221-l9_223;
float l9_225=step(0.25,fract(l9_224*0.5));
l9_221=mix(l9_223,1.0-l9_223,fast::clamp(l9_225,0.0,1.0));
}
}
l9_205.y=l9_221;
if (l9_209)
{
bool l9_226=l9_211;
bool l9_227;
if (l9_226)
{
l9_227=l9_208.x==3;
}
else
{
l9_227=l9_226;
}
float l9_228=l9_205.x;
float l9_229=l9_210.x;
float l9_230=l9_210.z;
bool l9_231=l9_227;
float l9_232=l9_215;
float l9_233=fast::clamp(l9_228,l9_229,l9_230);
float l9_234=step(abs(l9_228-l9_233),9.9999997e-06);
l9_232*=(l9_234+((1.0-float(l9_231))*(1.0-l9_234)));
l9_228=l9_233;
l9_205.x=l9_228;
l9_215=l9_232;
bool l9_235=l9_211;
bool l9_236;
if (l9_235)
{
l9_236=l9_208.y==3;
}
else
{
l9_236=l9_235;
}
float l9_237=l9_205.y;
float l9_238=l9_210.y;
float l9_239=l9_210.w;
bool l9_240=l9_236;
float l9_241=l9_215;
float l9_242=fast::clamp(l9_237,l9_238,l9_239);
float l9_243=step(abs(l9_237-l9_242),9.9999997e-06);
l9_241*=(l9_243+((1.0-float(l9_240))*(1.0-l9_243)));
l9_237=l9_242;
l9_205.y=l9_237;
l9_215=l9_241;
}
float2 l9_244=l9_205;
bool l9_245=l9_206;
float3x3 l9_246=l9_207;
if (l9_245)
{
l9_244=float2((l9_246*float3(l9_244,1.0)).xy);
}
float2 l9_247=l9_244;
float2 l9_248=l9_247;
float2 l9_249=l9_248;
l9_205=l9_249;
float l9_250=l9_205.x;
int l9_251=l9_208.x;
bool l9_252=l9_214;
float l9_253=l9_215;
if ((l9_251==0)||(l9_251==3))
{
float l9_254=l9_250;
float l9_255=0.0;
float l9_256=1.0;
bool l9_257=l9_252;
float l9_258=l9_253;
float l9_259=fast::clamp(l9_254,l9_255,l9_256);
float l9_260=step(abs(l9_254-l9_259),9.9999997e-06);
l9_258*=(l9_260+((1.0-float(l9_257))*(1.0-l9_260)));
l9_254=l9_259;
l9_250=l9_254;
l9_253=l9_258;
}
l9_205.x=l9_250;
l9_215=l9_253;
float l9_261=l9_205.y;
int l9_262=l9_208.y;
bool l9_263=l9_214;
float l9_264=l9_215;
if ((l9_262==0)||(l9_262==3))
{
float l9_265=l9_261;
float l9_266=0.0;
float l9_267=1.0;
bool l9_268=l9_263;
float l9_269=l9_264;
float l9_270=fast::clamp(l9_265,l9_266,l9_267);
float l9_271=step(abs(l9_265-l9_270),9.9999997e-06);
l9_269*=(l9_271+((1.0-float(l9_268))*(1.0-l9_271)));
l9_265=l9_270;
l9_261=l9_265;
l9_264=l9_269;
}
l9_205.y=l9_261;
l9_215=l9_264;
float2 l9_272=l9_205;
int l9_273=l9_203;
int l9_274=l9_204;
float l9_275=l9_213;
float2 l9_276=l9_272;
int l9_277=l9_273;
int l9_278=l9_274;
float3 l9_279=float3(0.0);
if (l9_277==0)
{
l9_279=float3(l9_276,0.0);
}
else
{
if (l9_277==1)
{
l9_279=float3(l9_276.x,(l9_276.y*0.5)+(0.5-(float(l9_278)*0.5)),0.0);
}
else
{
l9_279=float3(l9_276,float(l9_278));
}
}
float3 l9_280=l9_279;
float3 l9_281=l9_280;
float2 l9_282=l9_281.xy;
float l9_283=l9_275;
float4 l9_284=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_282,level(l9_283));
float4 l9_285=l9_284;
float4 l9_286=l9_285;
if (l9_211)
{
l9_286=mix(l9_212,l9_286,float4(l9_215));
}
float4 l9_287=l9_286;
l9_196=l9_287;
float4 l9_288=l9_196;
float2 l9_289=l9_288.xy;
float l9_290=N123_unpackVal.x;
float l9_291=N123_unpackVal.y;
float l9_292=0.0;
float2 l9_293=l9_289;
float l9_294=l9_290;
float l9_295=l9_291;
float l9_296=0.99998999;
float2 l9_297=l9_293;
#if (1)
{
l9_297=floor((l9_297*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_298=dot(l9_297,float2(1.0,0.0039215689));
float l9_299=l9_298;
float l9_300=0.0;
float l9_301=l9_296;
float l9_302=l9_294;
float l9_303=l9_295;
float l9_304=l9_302+(((l9_299-l9_300)*(l9_303-l9_302))/(l9_301-l9_300));
float l9_305=l9_304;
l9_292=l9_305;
float l9_306=l9_292;
float l9_307=l9_306;
float l9_308=0.0+(((l9_307-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_308;
float l9_309=l9_307;
if (N123_EnableFluid==1.0)
{
float2 l9_310=l9_187;
float4 l9_311=float4(0.0);
int l9_312=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_313=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_313=0;
}
else
{
l9_313=gl_InstanceIndex%2;
}
int l9_314=l9_313;
l9_312=1-l9_314;
}
else
{
int l9_315=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_315=0;
}
else
{
l9_315=gl_InstanceIndex%2;
}
int l9_316=l9_315;
l9_312=l9_316;
}
int l9_317=l9_312;
int l9_318=fluidPressureLayout_tmp;
int l9_319=l9_317;
float2 l9_320=l9_310;
bool l9_321=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_322=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_323=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_324=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_325=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_326=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_327=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_328=0.0;
bool l9_329=l9_326&&(!l9_324);
float l9_330=1.0;
float l9_331=l9_320.x;
int l9_332=l9_323.x;
if (l9_332==1)
{
l9_331=fract(l9_331);
}
else
{
if (l9_332==2)
{
float l9_333=fract(l9_331);
float l9_334=l9_331-l9_333;
float l9_335=step(0.25,fract(l9_334*0.5));
l9_331=mix(l9_333,1.0-l9_333,fast::clamp(l9_335,0.0,1.0));
}
}
l9_320.x=l9_331;
float l9_336=l9_320.y;
int l9_337=l9_323.y;
if (l9_337==1)
{
l9_336=fract(l9_336);
}
else
{
if (l9_337==2)
{
float l9_338=fract(l9_336);
float l9_339=l9_336-l9_338;
float l9_340=step(0.25,fract(l9_339*0.5));
l9_336=mix(l9_338,1.0-l9_338,fast::clamp(l9_340,0.0,1.0));
}
}
l9_320.y=l9_336;
if (l9_324)
{
bool l9_341=l9_326;
bool l9_342;
if (l9_341)
{
l9_342=l9_323.x==3;
}
else
{
l9_342=l9_341;
}
float l9_343=l9_320.x;
float l9_344=l9_325.x;
float l9_345=l9_325.z;
bool l9_346=l9_342;
float l9_347=l9_330;
float l9_348=fast::clamp(l9_343,l9_344,l9_345);
float l9_349=step(abs(l9_343-l9_348),9.9999997e-06);
l9_347*=(l9_349+((1.0-float(l9_346))*(1.0-l9_349)));
l9_343=l9_348;
l9_320.x=l9_343;
l9_330=l9_347;
bool l9_350=l9_326;
bool l9_351;
if (l9_350)
{
l9_351=l9_323.y==3;
}
else
{
l9_351=l9_350;
}
float l9_352=l9_320.y;
float l9_353=l9_325.y;
float l9_354=l9_325.w;
bool l9_355=l9_351;
float l9_356=l9_330;
float l9_357=fast::clamp(l9_352,l9_353,l9_354);
float l9_358=step(abs(l9_352-l9_357),9.9999997e-06);
l9_356*=(l9_358+((1.0-float(l9_355))*(1.0-l9_358)));
l9_352=l9_357;
l9_320.y=l9_352;
l9_330=l9_356;
}
float2 l9_359=l9_320;
bool l9_360=l9_321;
float3x3 l9_361=l9_322;
if (l9_360)
{
l9_359=float2((l9_361*float3(l9_359,1.0)).xy);
}
float2 l9_362=l9_359;
float2 l9_363=l9_362;
float2 l9_364=l9_363;
l9_320=l9_364;
float l9_365=l9_320.x;
int l9_366=l9_323.x;
bool l9_367=l9_329;
float l9_368=l9_330;
if ((l9_366==0)||(l9_366==3))
{
float l9_369=l9_365;
float l9_370=0.0;
float l9_371=1.0;
bool l9_372=l9_367;
float l9_373=l9_368;
float l9_374=fast::clamp(l9_369,l9_370,l9_371);
float l9_375=step(abs(l9_369-l9_374),9.9999997e-06);
l9_373*=(l9_375+((1.0-float(l9_372))*(1.0-l9_375)));
l9_369=l9_374;
l9_365=l9_369;
l9_368=l9_373;
}
l9_320.x=l9_365;
l9_330=l9_368;
float l9_376=l9_320.y;
int l9_377=l9_323.y;
bool l9_378=l9_329;
float l9_379=l9_330;
if ((l9_377==0)||(l9_377==3))
{
float l9_380=l9_376;
float l9_381=0.0;
float l9_382=1.0;
bool l9_383=l9_378;
float l9_384=l9_379;
float l9_385=fast::clamp(l9_380,l9_381,l9_382);
float l9_386=step(abs(l9_380-l9_385),9.9999997e-06);
l9_384*=(l9_386+((1.0-float(l9_383))*(1.0-l9_386)));
l9_380=l9_385;
l9_376=l9_380;
l9_379=l9_384;
}
l9_320.y=l9_376;
l9_330=l9_379;
float2 l9_387=l9_320;
int l9_388=l9_318;
int l9_389=l9_319;
float l9_390=l9_328;
float2 l9_391=l9_387;
int l9_392=l9_388;
int l9_393=l9_389;
float3 l9_394=float3(0.0);
if (l9_392==0)
{
l9_394=float3(l9_391,0.0);
}
else
{
if (l9_392==1)
{
l9_394=float3(l9_391.x,(l9_391.y*0.5)+(0.5-(float(l9_393)*0.5)),0.0);
}
else
{
l9_394=float3(l9_391,float(l9_393));
}
}
float3 l9_395=l9_394;
float3 l9_396=l9_395;
float2 l9_397=l9_396.xy;
float l9_398=l9_390;
float4 l9_399=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_397,level(l9_398));
float4 l9_400=l9_399;
float4 l9_401=l9_400;
if (l9_326)
{
l9_401=mix(l9_327,l9_401,float4(l9_330));
}
float4 l9_402=l9_401;
l9_311=l9_402;
float4 l9_403=l9_311;
float2 l9_404=l9_403.xy;
float l9_405=N123_pressureRange.x;
float l9_406=N123_pressureRange.y;
float l9_407=0.0;
float2 l9_408=l9_404;
float l9_409=l9_405;
float l9_410=l9_406;
float l9_411=0.99998999;
float2 l9_412=l9_408;
#if (1)
{
l9_412=floor((l9_412*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_413=dot(l9_412,float2(1.0,0.0039215689));
float l9_414=l9_413;
float l9_415=0.0;
float l9_416=l9_411;
float l9_417=l9_409;
float l9_418=l9_410;
float l9_419=l9_417+(((l9_414-l9_415)*(l9_418-l9_417))/(l9_416-l9_415));
float l9_420=l9_419;
l9_407=l9_420;
float l9_421=l9_407;
float l9_422=l9_421;
float l9_423=l9_422*N123_FluidMul;
l9_309=l9_307+l9_423;
float l9_424=(0.0+(((fast::clamp(l9_423,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_424;
}
N123_SurfacePosition=float3(0.0,l9_309,0.0)+l9_189;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_425=tempGlobals.gTimeElapsed;
float2 l9_426=N123_SurfacePosition.zx*N123_FBMScale;
float l9_427=l9_425*N123_OceanSpeed;
float l9_428=0.0;
float2 l9_429=l9_426+float2(l9_427);
float2 l9_430=floor(l9_429);
float2 l9_431=fract(l9_429);
l9_431=(l9_431*l9_431)*(float2(3.0)-(l9_431*2.0));
float2 l9_432=l9_430;
float l9_433=fract(sin(dot(l9_432,float2(12.9898,4.1413999)))*43758.547);
float2 l9_434=l9_430+float2(1.0,0.0);
float l9_435=fract(sin(dot(l9_434,float2(12.9898,4.1413999)))*43758.547);
float2 l9_436=l9_430+float2(0.0,1.0);
float l9_437=fract(sin(dot(l9_436,float2(12.9898,4.1413999)))*43758.547);
float2 l9_438=l9_430+float2(1.0);
float l9_439=fract(sin(dot(l9_438,float2(12.9898,4.1413999)))*43758.547);
float l9_440=mix(mix(l9_433,l9_435,l9_431.x),mix(l9_437,l9_439,l9_431.x),l9_431.y);
float l9_441=l9_440*l9_440;
l9_428+=(0.5*l9_441);
l9_426=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_426)*2.02;
float2 l9_442=l9_426;
float2 l9_443=floor(l9_442);
float2 l9_444=fract(l9_442);
l9_444=(l9_444*l9_444)*(float2(3.0)-(l9_444*2.0));
float2 l9_445=l9_443;
float l9_446=fract(sin(dot(l9_445,float2(12.9898,4.1413999)))*43758.547);
float2 l9_447=l9_443+float2(1.0,0.0);
float l9_448=fract(sin(dot(l9_447,float2(12.9898,4.1413999)))*43758.547);
float2 l9_449=l9_443+float2(0.0,1.0);
float l9_450=fract(sin(dot(l9_449,float2(12.9898,4.1413999)))*43758.547);
float2 l9_451=l9_443+float2(1.0);
float l9_452=fract(sin(dot(l9_451,float2(12.9898,4.1413999)))*43758.547);
float l9_453=mix(mix(l9_446,l9_448,l9_444.x),mix(l9_450,l9_452,l9_444.x),l9_444.y);
float l9_454=l9_453*l9_453;
l9_428+=(0.03125*l9_454);
l9_426=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_426)*2.01;
float2 l9_455=l9_426;
float2 l9_456=floor(l9_455);
float2 l9_457=fract(l9_455);
l9_457=(l9_457*l9_457)*(float2(3.0)-(l9_457*2.0));
float2 l9_458=l9_456;
float l9_459=fract(sin(dot(l9_458,float2(12.9898,4.1413999)))*43758.547);
float2 l9_460=l9_456+float2(1.0,0.0);
float l9_461=fract(sin(dot(l9_460,float2(12.9898,4.1413999)))*43758.547);
float2 l9_462=l9_456+float2(0.0,1.0);
float l9_463=fract(sin(dot(l9_462,float2(12.9898,4.1413999)))*43758.547);
float2 l9_464=l9_456+float2(1.0);
float l9_465=fract(sin(dot(l9_464,float2(12.9898,4.1413999)))*43758.547);
float l9_466=mix(mix(l9_459,l9_461,l9_457.x),mix(l9_463,l9_465,l9_457.x),l9_457.y);
float l9_467=l9_466*l9_466;
l9_428+=(0.25*l9_467);
l9_426=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_426)*2.03;
float2 l9_468=l9_426;
float2 l9_469=floor(l9_468);
float2 l9_470=fract(l9_468);
l9_470=(l9_470*l9_470)*(float2(3.0)-(l9_470*2.0));
float2 l9_471=l9_469;
float l9_472=fract(sin(dot(l9_471,float2(12.9898,4.1413999)))*43758.547);
float2 l9_473=l9_469+float2(1.0,0.0);
float l9_474=fract(sin(dot(l9_473,float2(12.9898,4.1413999)))*43758.547);
float2 l9_475=l9_469+float2(0.0,1.0);
float l9_476=fract(sin(dot(l9_475,float2(12.9898,4.1413999)))*43758.547);
float2 l9_477=l9_469+float2(1.0);
float l9_478=fract(sin(dot(l9_477,float2(12.9898,4.1413999)))*43758.547);
float l9_479=mix(mix(l9_472,l9_474,l9_470.x),mix(l9_476,l9_478,l9_470.x),l9_470.y);
float l9_480=l9_479*l9_479;
l9_428+=(0.125*l9_480);
l9_426=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_426)*2.01;
float2 l9_481=l9_426;
float2 l9_482=floor(l9_481);
float2 l9_483=fract(l9_481);
l9_483=(l9_483*l9_483)*(float2(3.0)-(l9_483*2.0));
float2 l9_484=l9_482;
float l9_485=fract(sin(dot(l9_484,float2(12.9898,4.1413999)))*43758.547);
float2 l9_486=l9_482+float2(1.0,0.0);
float l9_487=fract(sin(dot(l9_486,float2(12.9898,4.1413999)))*43758.547);
float2 l9_488=l9_482+float2(0.0,1.0);
float l9_489=fract(sin(dot(l9_488,float2(12.9898,4.1413999)))*43758.547);
float2 l9_490=l9_482+float2(1.0);
float l9_491=fract(sin(dot(l9_490,float2(12.9898,4.1413999)))*43758.547);
float l9_492=mix(mix(l9_485,l9_487,l9_483.x),mix(l9_489,l9_491,l9_483.x),l9_483.y);
float l9_493=l9_492*l9_492;
l9_428+=(0.0625*l9_493);
l9_426=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_426)*2.04;
float2 l9_494=l9_426+float2(sin(l9_427));
float2 l9_495=floor(l9_494);
float2 l9_496=fract(l9_494);
l9_496=(l9_496*l9_496)*(float2(3.0)-(l9_496*2.0));
float2 l9_497=l9_495;
float l9_498=fract(sin(dot(l9_497,float2(12.9898,4.1413999)))*43758.547);
float2 l9_499=l9_495+float2(1.0,0.0);
float l9_500=fract(sin(dot(l9_499,float2(12.9898,4.1413999)))*43758.547);
float2 l9_501=l9_495+float2(0.0,1.0);
float l9_502=fract(sin(dot(l9_501,float2(12.9898,4.1413999)))*43758.547);
float2 l9_503=l9_495+float2(1.0);
float l9_504=fract(sin(dot(l9_503,float2(12.9898,4.1413999)))*43758.547);
float l9_505=mix(mix(l9_498,l9_500,l9_496.x),mix(l9_502,l9_504,l9_496.x),l9_496.y);
float l9_506=l9_505*l9_505;
l9_428+=(0.015625*l9_506);
float l9_507=l9_428/0.96875;
tempGlobals.N123_fbm=1.0-l9_507;
}
float l9_508=0.0;
l9_508=tempGlobals.N123_TatalHeightRemap;
float4 l9_509=float4(0.0);
float4 l9_510=(*sc_set0.UserUniforms).colorTrough;
l9_509=l9_510;
float4 l9_511=float4(0.0);
float4 l9_512=(*sc_set0.UserUniforms).colorMiddle;
l9_511=l9_512;
float4 l9_513=float4(0.0);
float4 l9_514=(*sc_set0.UserUniforms).colorCrest;
l9_513=l9_514;
float l9_515=0.0;
l9_515=tempGlobals.N123_fbm;
float4 l9_516=float4(0.0);
l9_516=mix(l9_511,l9_513,float4(l9_515));
float l9_517=l9_508;
float4 l9_518=l9_509;
float l9_519=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_520=l9_509;
float l9_521=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_522=l9_509;
float l9_523=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_524=l9_511;
float l9_525=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_526=l9_516;
float4 l9_527=l9_516;
l9_517=fast::clamp(l9_517,0.0,1.0);
float4 l9_528;
if (l9_517<l9_519)
{
l9_528=mix(l9_518,l9_520,float4(fast::clamp(l9_517/l9_519,0.0,1.0)));
}
else
{
if (l9_517<l9_521)
{
l9_528=mix(l9_520,l9_522,float4(fast::clamp((l9_517-l9_519)/(l9_521-l9_519),0.0,1.0)));
}
else
{
if (l9_517<l9_523)
{
l9_528=mix(l9_522,l9_524,float4(fast::clamp((l9_517-l9_521)/(l9_523-l9_521),0.0,1.0)));
}
else
{
if (l9_517<l9_525)
{
l9_528=mix(l9_524,l9_526,float4(fast::clamp((l9_517-l9_523)/(l9_525-l9_523),0.0,1.0)));
}
else
{
l9_528=mix(l9_526,l9_527,float4(fast::clamp((l9_517-l9_525)/(1.0-l9_525),0.0,1.0)));
}
}
}
}
bool l9_529=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_530;
if (l9_529)
{
l9_530=!PreviewInfo.Saved;
}
else
{
l9_530=l9_529;
}
bool l9_531;
if (l9_530)
{
l9_531=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_531=l9_530;
}
if (l9_531)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_528;
}
param_1=N123_SurfacePosition;
SurfacePosition_N123=param_1;
WorldPosition=SurfacePosition_N123;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_3=v;
float3 param_4=WorldPosition;
float3 param_5=WorldNormal;
float3 param_6=WorldTangent;
float4 param_7=v.position;
out.varPos=param_4;
out.varNormal=normalize(param_5);
float3 l9_532=normalize(param_6);
out.varTangent=float4(l9_532.x,l9_532.y,l9_532.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_533=param_3.position;
float4 l9_534=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_535=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_535=0;
}
else
{
l9_535=gl_InstanceIndex%2;
}
int l9_536=l9_535;
l9_534=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_536]*l9_533;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_537=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_537=0;
}
else
{
l9_537=gl_InstanceIndex%2;
}
int l9_538=l9_537;
l9_534=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_538]*l9_533;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_539=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_539=0;
}
else
{
l9_539=gl_InstanceIndex%2;
}
int l9_540=l9_539;
l9_534=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_540]*l9_533;
}
else
{
l9_534=l9_533;
}
}
}
float4 l9_541=l9_534;
out.varViewSpaceDepth=-l9_541.z;
}
float4 l9_542=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_542=param_7;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_543=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_543=0;
}
else
{
l9_543=gl_InstanceIndex%2;
}
int l9_544=l9_543;
l9_542=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_544]*param_3.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_545=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_545=0;
}
else
{
l9_545=gl_InstanceIndex%2;
}
int l9_546=l9_545;
l9_542=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_546]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_547=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_547=0;
}
else
{
l9_547=gl_InstanceIndex%2;
}
int l9_548=l9_547;
l9_542=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_548]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_3.texture0,param_3.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_549=param_3.position;
float4 l9_550=l9_549;
if (sc_RenderingSpace_tmp==1)
{
l9_550=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_549;
}
float4 l9_551=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_550;
float2 l9_552=((l9_551.xy/float2(l9_551.w))*0.5)+float2(0.5);
out.varShadowTex=l9_552;
}
float4 l9_553=l9_542;
if (sc_DepthBufferMode_tmp==1)
{
int l9_554=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_554=0;
}
else
{
l9_554=gl_InstanceIndex%2;
}
int l9_555=l9_554;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_555][2].w!=0.0)
{
float l9_556=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_553.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_553.w))*l9_556)-1.0)*l9_553.w;
}
}
float4 l9_557=l9_553;
l9_542=l9_557;
float4 l9_558=l9_542;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_559=l9_558.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_558.w);
l9_558=float4(l9_559.x,l9_559.y,l9_558.z,l9_558.w);
}
float4 l9_560=l9_558;
l9_542=l9_560;
float4 l9_561=l9_542;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_561.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_562=l9_561;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_563=dot(l9_562,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_564=l9_563;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_564;
}
}
float4 l9_565=float4(l9_561.x,-l9_561.y,(l9_561.z*0.5)+(l9_561.w*0.5),l9_561.w);
out.gl_Position=l9_565;
v=param_3;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
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
float N123_fbm;
float N123_TatalHeightRemap;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float gFrontFacing;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
float2 gScreenCoord;
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
float3 oceanMin;
float3 oceanMax;
float speed;
float enableFoam;
float fbmScale;
float enableInfinite;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float4 distortionTexSize;
float4 distortionTexDims;
float4 distortionTexView;
float3x3 distortionTexTransform;
float4 distortionTexUvMinMax;
float4 distortionTexBorderColor;
float distortionScale;
float distortionIntensity;
float4 oceanHeightmapSize;
float4 oceanHeightmapDims;
float4 oceanHeightmapView;
float3x3 oceanHeightmapTransform;
float4 oceanHeightmapUvMinMax;
float4 oceanHeightmapBorderColor;
float4 oceanNormalSize;
float4 oceanNormalDims;
float4 oceanNormalView;
float3x3 oceanNormalTransform;
float4 oceanNormalUvMinMax;
float4 oceanNormalBorderColor;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float2 unpackVal;
float4 colorTrough;
float4 colorMiddle;
float4 colorCrest;
float bodyIntersection;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_Position1_N030;
float Port_Position2_N030;
float Port_Position3_N030;
float Port_Position4_N030;
float Port_Opacity_N013;
float3 Port_Emissive_N013;
float Port_Metallic_N013;
float Port_Roughness_N013;
float3 Port_AO_N013;
float3 Port_SpecularAO_N013;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> bodyDepthTex [[id(1)]];
texture2d<float> distortionTex [[id(2)]];
texture2d<float> fluidPressure [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> oceanHeightmap [[id(5)]];
texture2d<float> oceanNormal [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
texture2d<float> sc_ShadowTexture [[id(23)]];
texture2d<float> screenTex [[id(25)]];
sampler bodyDepthTexSmpSC [[id(26)]];
sampler distortionTexSmpSC [[id(27)]];
sampler fluidPressureSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler oceanHeightmapSmpSC [[id(30)]];
sampler oceanNormalSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler screenTexSmpSC [[id(43)]];
constant userUniformsObj* UserUniforms [[id(44)]];
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
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
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
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
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
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]],bool gl_FrontFacing [[front_facing]])
{
main_frag_out out={};
float N34_EnableBodyDepth=0.0;
float4 N34_OceanColor=float4(0.0);
float N34_BodyDepth=0.0;
float N34_cameraDepth=0.0;
float4 N34_Result=float4(0.0);
float3 N123_OceanAabbMin=float3(0.0);
float3 N123_OceanAabbMax=float3(0.0);
float N123_OceanSpeed=0.0;
float N123_EnableFoam=0.0;
float N123_FBMScale=0.0;
float N123_EnableInfinite=0.0;
float N123_DistortionScale=0.0;
float N123_DistortionIntensity=0.0;
float N123_EnableFluid=0.0;
float2 N123_pressureRange=float2(0.0);
float N123_FluidMul=0.0;
float2 N123_unpackVal=float2(0.0);
float4 N123_FrontFacing=float4(0.0);
float4 N123_BackFacing=float4(0.0);
float3 N123_Normal=float3(0.0);
float3 N123_SurfacePosition=float3(0.0);
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
float4 FinalColor=float4(1.0,0.38046801,0.47592899,1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
bool l9_0=gl_FrontFacing;
Globals.gFrontFacing=float(l9_0);
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3=l9_2;
float2 l9_4=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_5=1;
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=in.varStereoViewID;
}
int l9_7=l9_6;
int l9_8=l9_7;
float3 l9_9=float3(l9_3,0.0);
int l9_10=l9_5;
int l9_11=l9_8;
if (l9_10==1)
{
l9_9.y=((2.0*l9_9.y)+float(l9_11))-1.0;
}
float2 l9_12=l9_9.xy;
l9_4=l9_12;
}
else
{
l9_4=l9_3;
}
float2 l9_13=l9_4;
float2 l9_14=l9_13;
Globals.gScreenCoord=l9_14;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float Output_N40=0.0;
float param=(*sc_set0.UserUniforms).bodyIntersection;
Output_N40=param;
float4 Output_N14=float4(0.0);
float param_1=1.0;
float4 param_2=float4(1.0);
float4 param_3=float4(1.0,0.0,0.0,0.0);
ssGlobals param_5=Globals;
float l9_15=0.0;
l9_15=param_5.gFrontFacing;
param_1=l9_15;
ssGlobals tempGlobals;
float4 param_4;
if ((param_1*1.0)!=0.0)
{
float4 l9_16=float4(0.0);
ssGlobals l9_17=param_5;
tempGlobals=l9_17;
float4 l9_18=float4(0.0);
float3 l9_19=float3(0.0);
float3 l9_20=float3(0.0);
float3 l9_21=(*sc_set0.UserUniforms).oceanMin;
l9_20=l9_21;
l9_19=l9_20;
float3 l9_22=l9_19;
N123_OceanAabbMin=l9_22;
float3 l9_23=float3(0.0);
float3 l9_24=float3(0.0);
float3 l9_25=(*sc_set0.UserUniforms).oceanMax;
l9_24=l9_25;
l9_23=l9_24;
float3 l9_26=l9_23;
N123_OceanAabbMax=l9_26;
float l9_27=0.0;
float l9_28=0.0;
float l9_29=(*sc_set0.UserUniforms).speed;
l9_28=l9_29;
l9_27=l9_28;
float l9_30=l9_27;
N123_OceanSpeed=l9_30;
float l9_31=0.0;
float l9_32=0.0;
float l9_33=(*sc_set0.UserUniforms).enableFoam;
l9_32=l9_33;
l9_31=l9_32;
float l9_34=l9_31;
N123_EnableFoam=l9_34;
float l9_35=0.0;
float l9_36=0.0;
float l9_37=(*sc_set0.UserUniforms).fbmScale;
l9_36=l9_37;
l9_35=l9_36;
float l9_38=l9_35;
N123_FBMScale=l9_38;
float l9_39=0.0;
float l9_40=0.0;
float l9_41=(*sc_set0.UserUniforms).enableInfinite;
l9_40=l9_41;
l9_39=l9_40;
float l9_42=l9_39;
N123_EnableInfinite=l9_42;
float l9_43=0.0;
float l9_44=0.0;
float l9_45=(*sc_set0.UserUniforms).distortionScale;
l9_44=l9_45;
l9_43=l9_44;
float l9_46=l9_43;
N123_DistortionScale=l9_46;
float l9_47=0.0;
float l9_48=0.0;
float l9_49=(*sc_set0.UserUniforms).distortionIntensity;
l9_48=l9_49;
l9_47=l9_48;
float l9_50=l9_47;
N123_DistortionIntensity=l9_50;
float l9_51=0.0;
float l9_52=0.0;
float l9_53=(*sc_set0.UserUniforms).enableFluid;
l9_52=l9_53;
l9_51=l9_52;
float l9_54=l9_51;
N123_EnableFluid=l9_54;
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=(*sc_set0.UserUniforms).pressureRange;
l9_56=l9_57;
l9_55=l9_56;
float2 l9_58=l9_55;
N123_pressureRange=l9_58;
float l9_59=0.0;
float l9_60=0.0;
float l9_61=(*sc_set0.UserUniforms).fluidMul;
l9_60=l9_61;
l9_59=l9_60;
float l9_62=l9_59;
N123_FluidMul=l9_62;
float2 l9_63=float2(0.0);
float2 l9_64=float2(0.0);
float2 l9_65=(*sc_set0.UserUniforms).unpackVal;
l9_64=l9_65;
l9_63=l9_64;
float2 l9_66=l9_63;
N123_unpackVal=l9_66;
float l9_67=0.0;
l9_67=tempGlobals.N123_TatalHeightRemap;
float4 l9_68=float4(0.0);
float4 l9_69=(*sc_set0.UserUniforms).colorTrough;
l9_68=l9_69;
float4 l9_70=float4(0.0);
float4 l9_71=(*sc_set0.UserUniforms).colorMiddle;
l9_70=l9_71;
float4 l9_72=float4(0.0);
float4 l9_73=(*sc_set0.UserUniforms).colorCrest;
l9_72=l9_73;
float l9_74=0.0;
l9_74=tempGlobals.N123_fbm;
float4 l9_75=float4(0.0);
l9_75=mix(l9_70,l9_72,float4(l9_74));
float l9_76=l9_67;
float4 l9_77=l9_68;
float l9_78=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_79=l9_68;
float l9_80=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_81=l9_68;
float l9_82=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_83=l9_70;
float l9_84=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_85=l9_75;
float4 l9_86=l9_75;
l9_76=fast::clamp(l9_76,0.0,1.0);
float4 l9_87;
if (l9_76<l9_78)
{
l9_87=mix(l9_77,l9_79,float4(fast::clamp(l9_76/l9_78,0.0,1.0)));
}
else
{
if (l9_76<l9_80)
{
l9_87=mix(l9_79,l9_81,float4(fast::clamp((l9_76-l9_78)/(l9_80-l9_78),0.0,1.0)));
}
else
{
if (l9_76<l9_82)
{
l9_87=mix(l9_81,l9_83,float4(fast::clamp((l9_76-l9_80)/(l9_82-l9_80),0.0,1.0)));
}
else
{
if (l9_76<l9_84)
{
l9_87=mix(l9_83,l9_85,float4(fast::clamp((l9_76-l9_82)/(l9_84-l9_82),0.0,1.0)));
}
else
{
l9_87=mix(l9_85,l9_86,float4(fast::clamp((l9_76-l9_84)/(1.0-l9_84),0.0,1.0)));
}
}
}
}
bool l9_88=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_89;
if (l9_88)
{
l9_89=!PreviewInfo.Saved;
}
else
{
l9_89=l9_88;
}
bool l9_90;
if (l9_89)
{
l9_90=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_90=l9_89;
}
if (l9_90)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_87;
}
float2 l9_91=tempGlobals.gScreenCoord;
float2 l9_92=l9_91;
float2 l9_93=tempGlobals.Surface_UVCoord0;
float2 l9_94=l9_93;
float3 l9_95=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_96=l9_95;
float2 l9_97=l9_94*N123_DistortionScale;
float4 l9_98=float4(0.0);
int l9_99=0;
if ((int(distortionTexHasSwappedViews_tmp)!=0))
{
int l9_100=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_100=0;
}
else
{
l9_100=in.varStereoViewID;
}
int l9_101=l9_100;
l9_99=1-l9_101;
}
else
{
int l9_102=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_102=0;
}
else
{
l9_102=in.varStereoViewID;
}
int l9_103=l9_102;
l9_99=l9_103;
}
int l9_104=l9_99;
int l9_105=distortionTexLayout_tmp;
int l9_106=l9_104;
float2 l9_107=l9_97;
bool l9_108=(int(SC_USE_UV_TRANSFORM_distortionTex_tmp)!=0);
float3x3 l9_109=(*sc_set0.UserUniforms).distortionTexTransform;
int2 l9_110=int2(SC_SOFTWARE_WRAP_MODE_U_distortionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_distortionTex_tmp);
bool l9_111=(int(SC_USE_UV_MIN_MAX_distortionTex_tmp)!=0);
float4 l9_112=(*sc_set0.UserUniforms).distortionTexUvMinMax;
bool l9_113=(int(SC_USE_CLAMP_TO_BORDER_distortionTex_tmp)!=0);
float4 l9_114=(*sc_set0.UserUniforms).distortionTexBorderColor;
float l9_115=0.0;
bool l9_116=l9_113&&(!l9_111);
float l9_117=1.0;
float l9_118=l9_107.x;
int l9_119=l9_110.x;
if (l9_119==1)
{
l9_118=fract(l9_118);
}
else
{
if (l9_119==2)
{
float l9_120=fract(l9_118);
float l9_121=l9_118-l9_120;
float l9_122=step(0.25,fract(l9_121*0.5));
l9_118=mix(l9_120,1.0-l9_120,fast::clamp(l9_122,0.0,1.0));
}
}
l9_107.x=l9_118;
float l9_123=l9_107.y;
int l9_124=l9_110.y;
if (l9_124==1)
{
l9_123=fract(l9_123);
}
else
{
if (l9_124==2)
{
float l9_125=fract(l9_123);
float l9_126=l9_123-l9_125;
float l9_127=step(0.25,fract(l9_126*0.5));
l9_123=mix(l9_125,1.0-l9_125,fast::clamp(l9_127,0.0,1.0));
}
}
l9_107.y=l9_123;
if (l9_111)
{
bool l9_128=l9_113;
bool l9_129;
if (l9_128)
{
l9_129=l9_110.x==3;
}
else
{
l9_129=l9_128;
}
float l9_130=l9_107.x;
float l9_131=l9_112.x;
float l9_132=l9_112.z;
bool l9_133=l9_129;
float l9_134=l9_117;
float l9_135=fast::clamp(l9_130,l9_131,l9_132);
float l9_136=step(abs(l9_130-l9_135),9.9999997e-06);
l9_134*=(l9_136+((1.0-float(l9_133))*(1.0-l9_136)));
l9_130=l9_135;
l9_107.x=l9_130;
l9_117=l9_134;
bool l9_137=l9_113;
bool l9_138;
if (l9_137)
{
l9_138=l9_110.y==3;
}
else
{
l9_138=l9_137;
}
float l9_139=l9_107.y;
float l9_140=l9_112.y;
float l9_141=l9_112.w;
bool l9_142=l9_138;
float l9_143=l9_117;
float l9_144=fast::clamp(l9_139,l9_140,l9_141);
float l9_145=step(abs(l9_139-l9_144),9.9999997e-06);
l9_143*=(l9_145+((1.0-float(l9_142))*(1.0-l9_145)));
l9_139=l9_144;
l9_107.y=l9_139;
l9_117=l9_143;
}
float2 l9_146=l9_107;
bool l9_147=l9_108;
float3x3 l9_148=l9_109;
if (l9_147)
{
l9_146=float2((l9_148*float3(l9_146,1.0)).xy);
}
float2 l9_149=l9_146;
float2 l9_150=l9_149;
float2 l9_151=l9_150;
l9_107=l9_151;
float l9_152=l9_107.x;
int l9_153=l9_110.x;
bool l9_154=l9_116;
float l9_155=l9_117;
if ((l9_153==0)||(l9_153==3))
{
float l9_156=l9_152;
float l9_157=0.0;
float l9_158=1.0;
bool l9_159=l9_154;
float l9_160=l9_155;
float l9_161=fast::clamp(l9_156,l9_157,l9_158);
float l9_162=step(abs(l9_156-l9_161),9.9999997e-06);
l9_160*=(l9_162+((1.0-float(l9_159))*(1.0-l9_162)));
l9_156=l9_161;
l9_152=l9_156;
l9_155=l9_160;
}
l9_107.x=l9_152;
l9_117=l9_155;
float l9_163=l9_107.y;
int l9_164=l9_110.y;
bool l9_165=l9_116;
float l9_166=l9_117;
if ((l9_164==0)||(l9_164==3))
{
float l9_167=l9_163;
float l9_168=0.0;
float l9_169=1.0;
bool l9_170=l9_165;
float l9_171=l9_166;
float l9_172=fast::clamp(l9_167,l9_168,l9_169);
float l9_173=step(abs(l9_167-l9_172),9.9999997e-06);
l9_171*=(l9_173+((1.0-float(l9_170))*(1.0-l9_173)));
l9_167=l9_172;
l9_163=l9_167;
l9_166=l9_171;
}
l9_107.y=l9_163;
l9_117=l9_166;
float2 l9_174=l9_107;
int l9_175=l9_105;
int l9_176=l9_106;
float l9_177=l9_115;
float2 l9_178=l9_174;
int l9_179=l9_175;
int l9_180=l9_176;
float3 l9_181=float3(0.0);
if (l9_179==0)
{
l9_181=float3(l9_178,0.0);
}
else
{
if (l9_179==1)
{
l9_181=float3(l9_178.x,(l9_178.y*0.5)+(0.5-(float(l9_180)*0.5)),0.0);
}
else
{
l9_181=float3(l9_178,float(l9_180));
}
}
float3 l9_182=l9_181;
float3 l9_183=l9_182;
float2 l9_184=l9_183.xy;
float l9_185=l9_177;
float4 l9_186=sc_set0.distortionTex.sample(sc_set0.distortionTexSmpSC,l9_184,bias(l9_185));
float4 l9_187=l9_186;
float4 l9_188=l9_187;
if (l9_113)
{
l9_188=mix(l9_114,l9_188,float4(l9_117));
}
float4 l9_189=l9_188;
l9_98=l9_189;
float4 l9_190=l9_98;
float2 l9_191=l9_190.xy;
float2 l9_192=(((l9_191-float2(1.0))*N123_DistortionIntensity)+l9_92)+float2(0.30000001);
float2 l9_193=float2(l9_192.x-0.15000001,1.0-l9_192.y)*0.89999998;
float4 l9_194=float4(0.0);
int l9_195=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_196=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_196=0;
}
else
{
l9_196=in.varStereoViewID;
}
int l9_197=l9_196;
l9_195=1-l9_197;
}
else
{
int l9_198=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_198=0;
}
else
{
l9_198=in.varStereoViewID;
}
int l9_199=l9_198;
l9_195=l9_199;
}
int l9_200=l9_195;
int l9_201=screenTexLayout_tmp;
int l9_202=l9_200;
float2 l9_203=l9_193;
bool l9_204=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_205=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_206=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_207=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_208=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_209=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_210=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_211=0.0;
bool l9_212=l9_209&&(!l9_207);
float l9_213=1.0;
float l9_214=l9_203.x;
int l9_215=l9_206.x;
if (l9_215==1)
{
l9_214=fract(l9_214);
}
else
{
if (l9_215==2)
{
float l9_216=fract(l9_214);
float l9_217=l9_214-l9_216;
float l9_218=step(0.25,fract(l9_217*0.5));
l9_214=mix(l9_216,1.0-l9_216,fast::clamp(l9_218,0.0,1.0));
}
}
l9_203.x=l9_214;
float l9_219=l9_203.y;
int l9_220=l9_206.y;
if (l9_220==1)
{
l9_219=fract(l9_219);
}
else
{
if (l9_220==2)
{
float l9_221=fract(l9_219);
float l9_222=l9_219-l9_221;
float l9_223=step(0.25,fract(l9_222*0.5));
l9_219=mix(l9_221,1.0-l9_221,fast::clamp(l9_223,0.0,1.0));
}
}
l9_203.y=l9_219;
if (l9_207)
{
bool l9_224=l9_209;
bool l9_225;
if (l9_224)
{
l9_225=l9_206.x==3;
}
else
{
l9_225=l9_224;
}
float l9_226=l9_203.x;
float l9_227=l9_208.x;
float l9_228=l9_208.z;
bool l9_229=l9_225;
float l9_230=l9_213;
float l9_231=fast::clamp(l9_226,l9_227,l9_228);
float l9_232=step(abs(l9_226-l9_231),9.9999997e-06);
l9_230*=(l9_232+((1.0-float(l9_229))*(1.0-l9_232)));
l9_226=l9_231;
l9_203.x=l9_226;
l9_213=l9_230;
bool l9_233=l9_209;
bool l9_234;
if (l9_233)
{
l9_234=l9_206.y==3;
}
else
{
l9_234=l9_233;
}
float l9_235=l9_203.y;
float l9_236=l9_208.y;
float l9_237=l9_208.w;
bool l9_238=l9_234;
float l9_239=l9_213;
float l9_240=fast::clamp(l9_235,l9_236,l9_237);
float l9_241=step(abs(l9_235-l9_240),9.9999997e-06);
l9_239*=(l9_241+((1.0-float(l9_238))*(1.0-l9_241)));
l9_235=l9_240;
l9_203.y=l9_235;
l9_213=l9_239;
}
float2 l9_242=l9_203;
bool l9_243=l9_204;
float3x3 l9_244=l9_205;
if (l9_243)
{
l9_242=float2((l9_244*float3(l9_242,1.0)).xy);
}
float2 l9_245=l9_242;
float2 l9_246=l9_245;
float2 l9_247=l9_246;
l9_203=l9_247;
float l9_248=l9_203.x;
int l9_249=l9_206.x;
bool l9_250=l9_212;
float l9_251=l9_213;
if ((l9_249==0)||(l9_249==3))
{
float l9_252=l9_248;
float l9_253=0.0;
float l9_254=1.0;
bool l9_255=l9_250;
float l9_256=l9_251;
float l9_257=fast::clamp(l9_252,l9_253,l9_254);
float l9_258=step(abs(l9_252-l9_257),9.9999997e-06);
l9_256*=(l9_258+((1.0-float(l9_255))*(1.0-l9_258)));
l9_252=l9_257;
l9_248=l9_252;
l9_251=l9_256;
}
l9_203.x=l9_248;
l9_213=l9_251;
float l9_259=l9_203.y;
int l9_260=l9_206.y;
bool l9_261=l9_212;
float l9_262=l9_213;
if ((l9_260==0)||(l9_260==3))
{
float l9_263=l9_259;
float l9_264=0.0;
float l9_265=1.0;
bool l9_266=l9_261;
float l9_267=l9_262;
float l9_268=fast::clamp(l9_263,l9_264,l9_265);
float l9_269=step(abs(l9_263-l9_268),9.9999997e-06);
l9_267*=(l9_269+((1.0-float(l9_266))*(1.0-l9_269)));
l9_263=l9_268;
l9_259=l9_263;
l9_262=l9_267;
}
l9_203.y=l9_259;
l9_213=l9_262;
float2 l9_270=l9_203;
int l9_271=l9_201;
int l9_272=l9_202;
float l9_273=l9_211;
float2 l9_274=l9_270;
int l9_275=l9_271;
int l9_276=l9_272;
float3 l9_277=float3(0.0);
if (l9_275==0)
{
l9_277=float3(l9_274,0.0);
}
else
{
if (l9_275==1)
{
l9_277=float3(l9_274.x,(l9_274.y*0.5)+(0.5-(float(l9_276)*0.5)),0.0);
}
else
{
l9_277=float3(l9_274,float(l9_276));
}
}
float3 l9_278=l9_277;
float3 l9_279=l9_278;
float2 l9_280=l9_279.xy;
float l9_281=l9_273;
float4 l9_282=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_280,bias(l9_281));
float4 l9_283=l9_282;
float4 l9_284=l9_283;
if (l9_209)
{
l9_284=mix(l9_210,l9_284,float4(l9_213));
}
float4 l9_285=l9_284;
l9_194=l9_285;
float4 l9_286=l9_194;
float4 l9_287=l9_286;
float2 l9_288=((l9_192-float2(0.1))*0.5)+float2(0.1);
float2 l9_289=l9_288;
float4 l9_290=float4(0.0);
int l9_291=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_292=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_292=0;
}
else
{
l9_292=in.varStereoViewID;
}
int l9_293=l9_292;
l9_291=1-l9_293;
}
else
{
int l9_294=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_294=0;
}
else
{
l9_294=in.varStereoViewID;
}
int l9_295=l9_294;
l9_291=l9_295;
}
int l9_296=l9_291;
int l9_297=screenTexLayout_tmp;
int l9_298=l9_296;
float2 l9_299=l9_289;
bool l9_300=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_301=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_302=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_303=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_304=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_305=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_306=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_307=0.0;
bool l9_308=l9_305&&(!l9_303);
float l9_309=1.0;
float l9_310=l9_299.x;
int l9_311=l9_302.x;
if (l9_311==1)
{
l9_310=fract(l9_310);
}
else
{
if (l9_311==2)
{
float l9_312=fract(l9_310);
float l9_313=l9_310-l9_312;
float l9_314=step(0.25,fract(l9_313*0.5));
l9_310=mix(l9_312,1.0-l9_312,fast::clamp(l9_314,0.0,1.0));
}
}
l9_299.x=l9_310;
float l9_315=l9_299.y;
int l9_316=l9_302.y;
if (l9_316==1)
{
l9_315=fract(l9_315);
}
else
{
if (l9_316==2)
{
float l9_317=fract(l9_315);
float l9_318=l9_315-l9_317;
float l9_319=step(0.25,fract(l9_318*0.5));
l9_315=mix(l9_317,1.0-l9_317,fast::clamp(l9_319,0.0,1.0));
}
}
l9_299.y=l9_315;
if (l9_303)
{
bool l9_320=l9_305;
bool l9_321;
if (l9_320)
{
l9_321=l9_302.x==3;
}
else
{
l9_321=l9_320;
}
float l9_322=l9_299.x;
float l9_323=l9_304.x;
float l9_324=l9_304.z;
bool l9_325=l9_321;
float l9_326=l9_309;
float l9_327=fast::clamp(l9_322,l9_323,l9_324);
float l9_328=step(abs(l9_322-l9_327),9.9999997e-06);
l9_326*=(l9_328+((1.0-float(l9_325))*(1.0-l9_328)));
l9_322=l9_327;
l9_299.x=l9_322;
l9_309=l9_326;
bool l9_329=l9_305;
bool l9_330;
if (l9_329)
{
l9_330=l9_302.y==3;
}
else
{
l9_330=l9_329;
}
float l9_331=l9_299.y;
float l9_332=l9_304.y;
float l9_333=l9_304.w;
bool l9_334=l9_330;
float l9_335=l9_309;
float l9_336=fast::clamp(l9_331,l9_332,l9_333);
float l9_337=step(abs(l9_331-l9_336),9.9999997e-06);
l9_335*=(l9_337+((1.0-float(l9_334))*(1.0-l9_337)));
l9_331=l9_336;
l9_299.y=l9_331;
l9_309=l9_335;
}
float2 l9_338=l9_299;
bool l9_339=l9_300;
float3x3 l9_340=l9_301;
if (l9_339)
{
l9_338=float2((l9_340*float3(l9_338,1.0)).xy);
}
float2 l9_341=l9_338;
float2 l9_342=l9_341;
float2 l9_343=l9_342;
l9_299=l9_343;
float l9_344=l9_299.x;
int l9_345=l9_302.x;
bool l9_346=l9_308;
float l9_347=l9_309;
if ((l9_345==0)||(l9_345==3))
{
float l9_348=l9_344;
float l9_349=0.0;
float l9_350=1.0;
bool l9_351=l9_346;
float l9_352=l9_347;
float l9_353=fast::clamp(l9_348,l9_349,l9_350);
float l9_354=step(abs(l9_348-l9_353),9.9999997e-06);
l9_352*=(l9_354+((1.0-float(l9_351))*(1.0-l9_354)));
l9_348=l9_353;
l9_344=l9_348;
l9_347=l9_352;
}
l9_299.x=l9_344;
l9_309=l9_347;
float l9_355=l9_299.y;
int l9_356=l9_302.y;
bool l9_357=l9_308;
float l9_358=l9_309;
if ((l9_356==0)||(l9_356==3))
{
float l9_359=l9_355;
float l9_360=0.0;
float l9_361=1.0;
bool l9_362=l9_357;
float l9_363=l9_358;
float l9_364=fast::clamp(l9_359,l9_360,l9_361);
float l9_365=step(abs(l9_359-l9_364),9.9999997e-06);
l9_363*=(l9_365+((1.0-float(l9_362))*(1.0-l9_365)));
l9_359=l9_364;
l9_355=l9_359;
l9_358=l9_363;
}
l9_299.y=l9_355;
l9_309=l9_358;
float2 l9_366=l9_299;
int l9_367=l9_297;
int l9_368=l9_298;
float l9_369=l9_307;
float2 l9_370=l9_366;
int l9_371=l9_367;
int l9_372=l9_368;
float3 l9_373=float3(0.0);
if (l9_371==0)
{
l9_373=float3(l9_370,0.0);
}
else
{
if (l9_371==1)
{
l9_373=float3(l9_370.x,(l9_370.y*0.5)+(0.5-(float(l9_372)*0.5)),0.0);
}
else
{
l9_373=float3(l9_370,float(l9_372));
}
}
float3 l9_374=l9_373;
float3 l9_375=l9_374;
float2 l9_376=l9_375.xy;
float l9_377=l9_369;
float4 l9_378=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_376,bias(l9_377));
float4 l9_379=l9_378;
float4 l9_380=l9_379;
if (l9_305)
{
l9_380=mix(l9_306,l9_380,float4(l9_309));
}
float4 l9_381=l9_380;
l9_290=l9_381;
float4 l9_382=l9_290;
float4 l9_383=l9_382;
float2 l9_384=l9_94;
if (N123_EnableInfinite==1.0)
{
float2 l9_385=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_386=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_387=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_388=float2(0.0)+(((l9_387.xz-l9_385)*1.0)/((l9_386-l9_385)+float2(1e-06)));
l9_388.y=1.0-l9_388.y;
l9_384=(l9_94+l9_388)-float2(0.5);
}
float2 l9_389=l9_384;
float4 l9_390=float4(0.0);
int l9_391=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_392=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_392=0;
}
else
{
l9_392=in.varStereoViewID;
}
int l9_393=l9_392;
l9_391=1-l9_393;
}
else
{
int l9_394=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_394=0;
}
else
{
l9_394=in.varStereoViewID;
}
int l9_395=l9_394;
l9_391=l9_395;
}
int l9_396=l9_391;
int l9_397=oceanHeightmapLayout_tmp;
int l9_398=l9_396;
float2 l9_399=l9_389;
bool l9_400=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_401=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_402=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_403=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_404=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_405=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_406=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_407=0.0;
bool l9_408=l9_405&&(!l9_403);
float l9_409=1.0;
float l9_410=l9_399.x;
int l9_411=l9_402.x;
if (l9_411==1)
{
l9_410=fract(l9_410);
}
else
{
if (l9_411==2)
{
float l9_412=fract(l9_410);
float l9_413=l9_410-l9_412;
float l9_414=step(0.25,fract(l9_413*0.5));
l9_410=mix(l9_412,1.0-l9_412,fast::clamp(l9_414,0.0,1.0));
}
}
l9_399.x=l9_410;
float l9_415=l9_399.y;
int l9_416=l9_402.y;
if (l9_416==1)
{
l9_415=fract(l9_415);
}
else
{
if (l9_416==2)
{
float l9_417=fract(l9_415);
float l9_418=l9_415-l9_417;
float l9_419=step(0.25,fract(l9_418*0.5));
l9_415=mix(l9_417,1.0-l9_417,fast::clamp(l9_419,0.0,1.0));
}
}
l9_399.y=l9_415;
if (l9_403)
{
bool l9_420=l9_405;
bool l9_421;
if (l9_420)
{
l9_421=l9_402.x==3;
}
else
{
l9_421=l9_420;
}
float l9_422=l9_399.x;
float l9_423=l9_404.x;
float l9_424=l9_404.z;
bool l9_425=l9_421;
float l9_426=l9_409;
float l9_427=fast::clamp(l9_422,l9_423,l9_424);
float l9_428=step(abs(l9_422-l9_427),9.9999997e-06);
l9_426*=(l9_428+((1.0-float(l9_425))*(1.0-l9_428)));
l9_422=l9_427;
l9_399.x=l9_422;
l9_409=l9_426;
bool l9_429=l9_405;
bool l9_430;
if (l9_429)
{
l9_430=l9_402.y==3;
}
else
{
l9_430=l9_429;
}
float l9_431=l9_399.y;
float l9_432=l9_404.y;
float l9_433=l9_404.w;
bool l9_434=l9_430;
float l9_435=l9_409;
float l9_436=fast::clamp(l9_431,l9_432,l9_433);
float l9_437=step(abs(l9_431-l9_436),9.9999997e-06);
l9_435*=(l9_437+((1.0-float(l9_434))*(1.0-l9_437)));
l9_431=l9_436;
l9_399.y=l9_431;
l9_409=l9_435;
}
float2 l9_438=l9_399;
bool l9_439=l9_400;
float3x3 l9_440=l9_401;
if (l9_439)
{
l9_438=float2((l9_440*float3(l9_438,1.0)).xy);
}
float2 l9_441=l9_438;
float2 l9_442=l9_441;
float2 l9_443=l9_442;
l9_399=l9_443;
float l9_444=l9_399.x;
int l9_445=l9_402.x;
bool l9_446=l9_408;
float l9_447=l9_409;
if ((l9_445==0)||(l9_445==3))
{
float l9_448=l9_444;
float l9_449=0.0;
float l9_450=1.0;
bool l9_451=l9_446;
float l9_452=l9_447;
float l9_453=fast::clamp(l9_448,l9_449,l9_450);
float l9_454=step(abs(l9_448-l9_453),9.9999997e-06);
l9_452*=(l9_454+((1.0-float(l9_451))*(1.0-l9_454)));
l9_448=l9_453;
l9_444=l9_448;
l9_447=l9_452;
}
l9_399.x=l9_444;
l9_409=l9_447;
float l9_455=l9_399.y;
int l9_456=l9_402.y;
bool l9_457=l9_408;
float l9_458=l9_409;
if ((l9_456==0)||(l9_456==3))
{
float l9_459=l9_455;
float l9_460=0.0;
float l9_461=1.0;
bool l9_462=l9_457;
float l9_463=l9_458;
float l9_464=fast::clamp(l9_459,l9_460,l9_461);
float l9_465=step(abs(l9_459-l9_464),9.9999997e-06);
l9_463*=(l9_465+((1.0-float(l9_462))*(1.0-l9_465)));
l9_459=l9_464;
l9_455=l9_459;
l9_458=l9_463;
}
l9_399.y=l9_455;
l9_409=l9_458;
float2 l9_466=l9_399;
int l9_467=l9_397;
int l9_468=l9_398;
float l9_469=l9_407;
float2 l9_470=l9_466;
int l9_471=l9_467;
int l9_472=l9_468;
float3 l9_473=float3(0.0);
if (l9_471==0)
{
l9_473=float3(l9_470,0.0);
}
else
{
if (l9_471==1)
{
l9_473=float3(l9_470.x,(l9_470.y*0.5)+(0.5-(float(l9_472)*0.5)),0.0);
}
else
{
l9_473=float3(l9_470,float(l9_472));
}
}
float3 l9_474=l9_473;
float3 l9_475=l9_474;
float2 l9_476=l9_475.xy;
float l9_477=l9_469;
float4 l9_478=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_476,bias(l9_477));
float4 l9_479=l9_478;
float4 l9_480=l9_479;
if (l9_405)
{
l9_480=mix(l9_406,l9_480,float4(l9_409));
}
float4 l9_481=l9_480;
l9_390=l9_481;
float4 l9_482=l9_390;
float2 l9_483=l9_482.xy;
float l9_484=N123_unpackVal.x;
float l9_485=N123_unpackVal.y;
float l9_486=0.0;
float2 l9_487=l9_483;
float l9_488=l9_484;
float l9_489=l9_485;
float l9_490=0.99998999;
float2 l9_491=l9_487;
#if (1)
{
l9_491=floor((l9_491*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_492=dot(l9_491,float2(1.0,0.0039215689));
float l9_493=l9_492;
float l9_494=0.0;
float l9_495=l9_490;
float l9_496=l9_488;
float l9_497=l9_489;
float l9_498=l9_496+(((l9_493-l9_494)*(l9_497-l9_496))/(l9_495-l9_494));
float l9_499=l9_498;
l9_486=l9_499;
float l9_500=l9_486;
float l9_501=l9_500;
float l9_502=0.0+(((l9_501-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_502;
float l9_503=l9_501;
if (N123_EnableFluid==1.0)
{
float2 l9_504=l9_94;
float4 l9_505=float4(0.0);
int l9_506=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_507=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_507=0;
}
else
{
l9_507=in.varStereoViewID;
}
int l9_508=l9_507;
l9_506=1-l9_508;
}
else
{
int l9_509=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_509=0;
}
else
{
l9_509=in.varStereoViewID;
}
int l9_510=l9_509;
l9_506=l9_510;
}
int l9_511=l9_506;
int l9_512=fluidPressureLayout_tmp;
int l9_513=l9_511;
float2 l9_514=l9_504;
bool l9_515=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_516=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_517=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_518=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_519=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_520=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_521=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_522=0.0;
bool l9_523=l9_520&&(!l9_518);
float l9_524=1.0;
float l9_525=l9_514.x;
int l9_526=l9_517.x;
if (l9_526==1)
{
l9_525=fract(l9_525);
}
else
{
if (l9_526==2)
{
float l9_527=fract(l9_525);
float l9_528=l9_525-l9_527;
float l9_529=step(0.25,fract(l9_528*0.5));
l9_525=mix(l9_527,1.0-l9_527,fast::clamp(l9_529,0.0,1.0));
}
}
l9_514.x=l9_525;
float l9_530=l9_514.y;
int l9_531=l9_517.y;
if (l9_531==1)
{
l9_530=fract(l9_530);
}
else
{
if (l9_531==2)
{
float l9_532=fract(l9_530);
float l9_533=l9_530-l9_532;
float l9_534=step(0.25,fract(l9_533*0.5));
l9_530=mix(l9_532,1.0-l9_532,fast::clamp(l9_534,0.0,1.0));
}
}
l9_514.y=l9_530;
if (l9_518)
{
bool l9_535=l9_520;
bool l9_536;
if (l9_535)
{
l9_536=l9_517.x==3;
}
else
{
l9_536=l9_535;
}
float l9_537=l9_514.x;
float l9_538=l9_519.x;
float l9_539=l9_519.z;
bool l9_540=l9_536;
float l9_541=l9_524;
float l9_542=fast::clamp(l9_537,l9_538,l9_539);
float l9_543=step(abs(l9_537-l9_542),9.9999997e-06);
l9_541*=(l9_543+((1.0-float(l9_540))*(1.0-l9_543)));
l9_537=l9_542;
l9_514.x=l9_537;
l9_524=l9_541;
bool l9_544=l9_520;
bool l9_545;
if (l9_544)
{
l9_545=l9_517.y==3;
}
else
{
l9_545=l9_544;
}
float l9_546=l9_514.y;
float l9_547=l9_519.y;
float l9_548=l9_519.w;
bool l9_549=l9_545;
float l9_550=l9_524;
float l9_551=fast::clamp(l9_546,l9_547,l9_548);
float l9_552=step(abs(l9_546-l9_551),9.9999997e-06);
l9_550*=(l9_552+((1.0-float(l9_549))*(1.0-l9_552)));
l9_546=l9_551;
l9_514.y=l9_546;
l9_524=l9_550;
}
float2 l9_553=l9_514;
bool l9_554=l9_515;
float3x3 l9_555=l9_516;
if (l9_554)
{
l9_553=float2((l9_555*float3(l9_553,1.0)).xy);
}
float2 l9_556=l9_553;
float2 l9_557=l9_556;
float2 l9_558=l9_557;
l9_514=l9_558;
float l9_559=l9_514.x;
int l9_560=l9_517.x;
bool l9_561=l9_523;
float l9_562=l9_524;
if ((l9_560==0)||(l9_560==3))
{
float l9_563=l9_559;
float l9_564=0.0;
float l9_565=1.0;
bool l9_566=l9_561;
float l9_567=l9_562;
float l9_568=fast::clamp(l9_563,l9_564,l9_565);
float l9_569=step(abs(l9_563-l9_568),9.9999997e-06);
l9_567*=(l9_569+((1.0-float(l9_566))*(1.0-l9_569)));
l9_563=l9_568;
l9_559=l9_563;
l9_562=l9_567;
}
l9_514.x=l9_559;
l9_524=l9_562;
float l9_570=l9_514.y;
int l9_571=l9_517.y;
bool l9_572=l9_523;
float l9_573=l9_524;
if ((l9_571==0)||(l9_571==3))
{
float l9_574=l9_570;
float l9_575=0.0;
float l9_576=1.0;
bool l9_577=l9_572;
float l9_578=l9_573;
float l9_579=fast::clamp(l9_574,l9_575,l9_576);
float l9_580=step(abs(l9_574-l9_579),9.9999997e-06);
l9_578*=(l9_580+((1.0-float(l9_577))*(1.0-l9_580)));
l9_574=l9_579;
l9_570=l9_574;
l9_573=l9_578;
}
l9_514.y=l9_570;
l9_524=l9_573;
float2 l9_581=l9_514;
int l9_582=l9_512;
int l9_583=l9_513;
float l9_584=l9_522;
float2 l9_585=l9_581;
int l9_586=l9_582;
int l9_587=l9_583;
float3 l9_588=float3(0.0);
if (l9_586==0)
{
l9_588=float3(l9_585,0.0);
}
else
{
if (l9_586==1)
{
l9_588=float3(l9_585.x,(l9_585.y*0.5)+(0.5-(float(l9_587)*0.5)),0.0);
}
else
{
l9_588=float3(l9_585,float(l9_587));
}
}
float3 l9_589=l9_588;
float3 l9_590=l9_589;
float2 l9_591=l9_590.xy;
float l9_592=l9_584;
float4 l9_593=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_591,bias(l9_592));
float4 l9_594=l9_593;
float4 l9_595=l9_594;
if (l9_520)
{
l9_595=mix(l9_521,l9_595,float4(l9_524));
}
float4 l9_596=l9_595;
l9_505=l9_596;
float4 l9_597=l9_505;
float2 l9_598=l9_597.xy;
float l9_599=N123_pressureRange.x;
float l9_600=N123_pressureRange.y;
float l9_601=0.0;
float2 l9_602=l9_598;
float l9_603=l9_599;
float l9_604=l9_600;
float l9_605=0.99998999;
float2 l9_606=l9_602;
#if (1)
{
l9_606=floor((l9_606*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_607=dot(l9_606,float2(1.0,0.0039215689));
float l9_608=l9_607;
float l9_609=0.0;
float l9_610=l9_605;
float l9_611=l9_603;
float l9_612=l9_604;
float l9_613=l9_611+(((l9_608-l9_609)*(l9_612-l9_611))/(l9_610-l9_609));
float l9_614=l9_613;
l9_601=l9_614;
float l9_615=l9_601;
float l9_616=l9_615;
float l9_617=l9_616*N123_FluidMul;
l9_503=l9_501+l9_617;
float l9_618=(0.0+(((fast::clamp(l9_617,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_618;
}
float l9_619=fast::clamp(smoothstep(0.44999999,0.60000002,tempGlobals.N123_TatalHeightRemap),0.0,1.0);
float2 l9_620=l9_384;
float4 l9_621=float4(0.0);
int l9_622=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_623=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_623=0;
}
else
{
l9_623=in.varStereoViewID;
}
int l9_624=l9_623;
l9_622=1-l9_624;
}
else
{
int l9_625=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_625=0;
}
else
{
l9_625=in.varStereoViewID;
}
int l9_626=l9_625;
l9_622=l9_626;
}
int l9_627=l9_622;
int l9_628=oceanNormalLayout_tmp;
int l9_629=l9_627;
float2 l9_630=l9_620;
bool l9_631=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_632=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_633=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_634=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_635=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_636=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_637=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_638=0.0;
bool l9_639=l9_636&&(!l9_634);
float l9_640=1.0;
float l9_641=l9_630.x;
int l9_642=l9_633.x;
if (l9_642==1)
{
l9_641=fract(l9_641);
}
else
{
if (l9_642==2)
{
float l9_643=fract(l9_641);
float l9_644=l9_641-l9_643;
float l9_645=step(0.25,fract(l9_644*0.5));
l9_641=mix(l9_643,1.0-l9_643,fast::clamp(l9_645,0.0,1.0));
}
}
l9_630.x=l9_641;
float l9_646=l9_630.y;
int l9_647=l9_633.y;
if (l9_647==1)
{
l9_646=fract(l9_646);
}
else
{
if (l9_647==2)
{
float l9_648=fract(l9_646);
float l9_649=l9_646-l9_648;
float l9_650=step(0.25,fract(l9_649*0.5));
l9_646=mix(l9_648,1.0-l9_648,fast::clamp(l9_650,0.0,1.0));
}
}
l9_630.y=l9_646;
if (l9_634)
{
bool l9_651=l9_636;
bool l9_652;
if (l9_651)
{
l9_652=l9_633.x==3;
}
else
{
l9_652=l9_651;
}
float l9_653=l9_630.x;
float l9_654=l9_635.x;
float l9_655=l9_635.z;
bool l9_656=l9_652;
float l9_657=l9_640;
float l9_658=fast::clamp(l9_653,l9_654,l9_655);
float l9_659=step(abs(l9_653-l9_658),9.9999997e-06);
l9_657*=(l9_659+((1.0-float(l9_656))*(1.0-l9_659)));
l9_653=l9_658;
l9_630.x=l9_653;
l9_640=l9_657;
bool l9_660=l9_636;
bool l9_661;
if (l9_660)
{
l9_661=l9_633.y==3;
}
else
{
l9_661=l9_660;
}
float l9_662=l9_630.y;
float l9_663=l9_635.y;
float l9_664=l9_635.w;
bool l9_665=l9_661;
float l9_666=l9_640;
float l9_667=fast::clamp(l9_662,l9_663,l9_664);
float l9_668=step(abs(l9_662-l9_667),9.9999997e-06);
l9_666*=(l9_668+((1.0-float(l9_665))*(1.0-l9_668)));
l9_662=l9_667;
l9_630.y=l9_662;
l9_640=l9_666;
}
float2 l9_669=l9_630;
bool l9_670=l9_631;
float3x3 l9_671=l9_632;
if (l9_670)
{
l9_669=float2((l9_671*float3(l9_669,1.0)).xy);
}
float2 l9_672=l9_669;
float2 l9_673=l9_672;
float2 l9_674=l9_673;
l9_630=l9_674;
float l9_675=l9_630.x;
int l9_676=l9_633.x;
bool l9_677=l9_639;
float l9_678=l9_640;
if ((l9_676==0)||(l9_676==3))
{
float l9_679=l9_675;
float l9_680=0.0;
float l9_681=1.0;
bool l9_682=l9_677;
float l9_683=l9_678;
float l9_684=fast::clamp(l9_679,l9_680,l9_681);
float l9_685=step(abs(l9_679-l9_684),9.9999997e-06);
l9_683*=(l9_685+((1.0-float(l9_682))*(1.0-l9_685)));
l9_679=l9_684;
l9_675=l9_679;
l9_678=l9_683;
}
l9_630.x=l9_675;
l9_640=l9_678;
float l9_686=l9_630.y;
int l9_687=l9_633.y;
bool l9_688=l9_639;
float l9_689=l9_640;
if ((l9_687==0)||(l9_687==3))
{
float l9_690=l9_686;
float l9_691=0.0;
float l9_692=1.0;
bool l9_693=l9_688;
float l9_694=l9_689;
float l9_695=fast::clamp(l9_690,l9_691,l9_692);
float l9_696=step(abs(l9_690-l9_695),9.9999997e-06);
l9_694*=(l9_696+((1.0-float(l9_693))*(1.0-l9_696)));
l9_690=l9_695;
l9_686=l9_690;
l9_689=l9_694;
}
l9_630.y=l9_686;
l9_640=l9_689;
float2 l9_697=l9_630;
int l9_698=l9_628;
int l9_699=l9_629;
float l9_700=l9_638;
float2 l9_701=l9_697;
int l9_702=l9_698;
int l9_703=l9_699;
float3 l9_704=float3(0.0);
if (l9_702==0)
{
l9_704=float3(l9_701,0.0);
}
else
{
if (l9_702==1)
{
l9_704=float3(l9_701.x,(l9_701.y*0.5)+(0.5-(float(l9_703)*0.5)),0.0);
}
else
{
l9_704=float3(l9_701,float(l9_703));
}
}
float3 l9_705=l9_704;
float3 l9_706=l9_705;
float2 l9_707=l9_706.xy;
float l9_708=l9_700;
float4 l9_709=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_707,bias(l9_708));
float4 l9_710=l9_709;
float4 l9_711=l9_710;
if (l9_636)
{
l9_711=mix(l9_637,l9_711,float4(l9_640));
}
float4 l9_712=l9_711;
l9_621=l9_712;
float4 l9_713=l9_621;
float3 l9_714=(l9_713.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_714;
N123_SurfacePosition=float3(0.0,l9_503,0.0)+l9_96;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_715=tempGlobals.gTimeElapsed;
float2 l9_716=N123_SurfacePosition.zx*N123_FBMScale;
float l9_717=l9_715*N123_OceanSpeed;
float l9_718=0.0;
float2 l9_719=l9_716+float2(l9_717);
float2 l9_720=floor(l9_719);
float2 l9_721=fract(l9_719);
l9_721=(l9_721*l9_721)*(float2(3.0)-(l9_721*2.0));
float2 l9_722=l9_720;
float l9_723=fract(sin(dot(l9_722,float2(12.9898,4.1413999)))*43758.547);
float2 l9_724=l9_720+float2(1.0,0.0);
float l9_725=fract(sin(dot(l9_724,float2(12.9898,4.1413999)))*43758.547);
float2 l9_726=l9_720+float2(0.0,1.0);
float l9_727=fract(sin(dot(l9_726,float2(12.9898,4.1413999)))*43758.547);
float2 l9_728=l9_720+float2(1.0);
float l9_729=fract(sin(dot(l9_728,float2(12.9898,4.1413999)))*43758.547);
float l9_730=mix(mix(l9_723,l9_725,l9_721.x),mix(l9_727,l9_729,l9_721.x),l9_721.y);
float l9_731=l9_730*l9_730;
l9_718+=(0.5*l9_731);
l9_716=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_716)*2.02;
float2 l9_732=l9_716;
float2 l9_733=floor(l9_732);
float2 l9_734=fract(l9_732);
l9_734=(l9_734*l9_734)*(float2(3.0)-(l9_734*2.0));
float2 l9_735=l9_733;
float l9_736=fract(sin(dot(l9_735,float2(12.9898,4.1413999)))*43758.547);
float2 l9_737=l9_733+float2(1.0,0.0);
float l9_738=fract(sin(dot(l9_737,float2(12.9898,4.1413999)))*43758.547);
float2 l9_739=l9_733+float2(0.0,1.0);
float l9_740=fract(sin(dot(l9_739,float2(12.9898,4.1413999)))*43758.547);
float2 l9_741=l9_733+float2(1.0);
float l9_742=fract(sin(dot(l9_741,float2(12.9898,4.1413999)))*43758.547);
float l9_743=mix(mix(l9_736,l9_738,l9_734.x),mix(l9_740,l9_742,l9_734.x),l9_734.y);
float l9_744=l9_743*l9_743;
l9_718+=(0.03125*l9_744);
l9_716=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_716)*2.01;
float2 l9_745=l9_716;
float2 l9_746=floor(l9_745);
float2 l9_747=fract(l9_745);
l9_747=(l9_747*l9_747)*(float2(3.0)-(l9_747*2.0));
float2 l9_748=l9_746;
float l9_749=fract(sin(dot(l9_748,float2(12.9898,4.1413999)))*43758.547);
float2 l9_750=l9_746+float2(1.0,0.0);
float l9_751=fract(sin(dot(l9_750,float2(12.9898,4.1413999)))*43758.547);
float2 l9_752=l9_746+float2(0.0,1.0);
float l9_753=fract(sin(dot(l9_752,float2(12.9898,4.1413999)))*43758.547);
float2 l9_754=l9_746+float2(1.0);
float l9_755=fract(sin(dot(l9_754,float2(12.9898,4.1413999)))*43758.547);
float l9_756=mix(mix(l9_749,l9_751,l9_747.x),mix(l9_753,l9_755,l9_747.x),l9_747.y);
float l9_757=l9_756*l9_756;
l9_718+=(0.25*l9_757);
l9_716=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_716)*2.03;
float2 l9_758=l9_716;
float2 l9_759=floor(l9_758);
float2 l9_760=fract(l9_758);
l9_760=(l9_760*l9_760)*(float2(3.0)-(l9_760*2.0));
float2 l9_761=l9_759;
float l9_762=fract(sin(dot(l9_761,float2(12.9898,4.1413999)))*43758.547);
float2 l9_763=l9_759+float2(1.0,0.0);
float l9_764=fract(sin(dot(l9_763,float2(12.9898,4.1413999)))*43758.547);
float2 l9_765=l9_759+float2(0.0,1.0);
float l9_766=fract(sin(dot(l9_765,float2(12.9898,4.1413999)))*43758.547);
float2 l9_767=l9_759+float2(1.0);
float l9_768=fract(sin(dot(l9_767,float2(12.9898,4.1413999)))*43758.547);
float l9_769=mix(mix(l9_762,l9_764,l9_760.x),mix(l9_766,l9_768,l9_760.x),l9_760.y);
float l9_770=l9_769*l9_769;
l9_718+=(0.125*l9_770);
l9_716=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_716)*2.01;
float2 l9_771=l9_716;
float2 l9_772=floor(l9_771);
float2 l9_773=fract(l9_771);
l9_773=(l9_773*l9_773)*(float2(3.0)-(l9_773*2.0));
float2 l9_774=l9_772;
float l9_775=fract(sin(dot(l9_774,float2(12.9898,4.1413999)))*43758.547);
float2 l9_776=l9_772+float2(1.0,0.0);
float l9_777=fract(sin(dot(l9_776,float2(12.9898,4.1413999)))*43758.547);
float2 l9_778=l9_772+float2(0.0,1.0);
float l9_779=fract(sin(dot(l9_778,float2(12.9898,4.1413999)))*43758.547);
float2 l9_780=l9_772+float2(1.0);
float l9_781=fract(sin(dot(l9_780,float2(12.9898,4.1413999)))*43758.547);
float l9_782=mix(mix(l9_775,l9_777,l9_773.x),mix(l9_779,l9_781,l9_773.x),l9_773.y);
float l9_783=l9_782*l9_782;
l9_718+=(0.0625*l9_783);
l9_716=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_716)*2.04;
float2 l9_784=l9_716+float2(sin(l9_717));
float2 l9_785=floor(l9_784);
float2 l9_786=fract(l9_784);
l9_786=(l9_786*l9_786)*(float2(3.0)-(l9_786*2.0));
float2 l9_787=l9_785;
float l9_788=fract(sin(dot(l9_787,float2(12.9898,4.1413999)))*43758.547);
float2 l9_789=l9_785+float2(1.0,0.0);
float l9_790=fract(sin(dot(l9_789,float2(12.9898,4.1413999)))*43758.547);
float2 l9_791=l9_785+float2(0.0,1.0);
float l9_792=fract(sin(dot(l9_791,float2(12.9898,4.1413999)))*43758.547);
float2 l9_793=l9_785+float2(1.0);
float l9_794=fract(sin(dot(l9_793,float2(12.9898,4.1413999)))*43758.547);
float l9_795=mix(mix(l9_788,l9_790,l9_786.x),mix(l9_792,l9_794,l9_786.x),l9_786.y);
float l9_796=l9_795*l9_795;
l9_718+=(0.015625*l9_796);
float l9_797=l9_718/0.96875;
tempGlobals.N123_fbm=1.0-l9_797;
}
float3 l9_798=N123_Normal;
float l9_799=6.0;
float l9_800=4.0;
float3 l9_801=tempGlobals.VertexTangent_WorldSpace;
float3 l9_802=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_803=tempGlobals.VertexNormal_WorldSpace;
float3 l9_804=float3x3(float3(l9_801),float3(l9_802),float3(l9_803))*l9_798;
float3 l9_805=tempGlobals.ViewDirWS;
float l9_806=abs(dot(-l9_805,l9_804));
float l9_807=1.0-l9_806;
float l9_808=l9_799;
float l9_809;
if (l9_807<=0.0)
{
l9_809=0.0;
}
else
{
l9_809=pow(l9_807,l9_808);
}
float l9_810=l9_809;
float l9_811=l9_810;
l9_811=fast::max(l9_811,0.0);
l9_811*=l9_800;
float l9_812=l9_811;
float l9_813=fast::clamp(l9_812,0.0,1.0);
float4 l9_814=float4(0.0);
float l9_815=0.0;
l9_815=tempGlobals.N123_TatalHeightRemap;
float4 l9_816=float4(0.0);
float4 l9_817=(*sc_set0.UserUniforms).colorTrough;
l9_816=l9_817;
float4 l9_818=float4(0.0);
float4 l9_819=(*sc_set0.UserUniforms).colorMiddle;
l9_818=l9_819;
float4 l9_820=float4(0.0);
float4 l9_821=(*sc_set0.UserUniforms).colorCrest;
l9_820=l9_821;
float l9_822=0.0;
l9_822=tempGlobals.N123_fbm;
float4 l9_823=float4(0.0);
l9_823=mix(l9_818,l9_820,float4(l9_822));
float4 l9_824=float4(0.0);
float l9_825=l9_815;
float4 l9_826=l9_816;
float l9_827=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_828=l9_816;
float l9_829=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_830=l9_816;
float l9_831=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_832=l9_818;
float l9_833=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_834=l9_823;
float4 l9_835=l9_823;
l9_825=fast::clamp(l9_825,0.0,1.0);
float4 l9_836;
if (l9_825<l9_827)
{
l9_836=mix(l9_826,l9_828,float4(fast::clamp(l9_825/l9_827,0.0,1.0)));
}
else
{
if (l9_825<l9_829)
{
l9_836=mix(l9_828,l9_830,float4(fast::clamp((l9_825-l9_827)/(l9_829-l9_827),0.0,1.0)));
}
else
{
if (l9_825<l9_831)
{
l9_836=mix(l9_830,l9_832,float4(fast::clamp((l9_825-l9_829)/(l9_831-l9_829),0.0,1.0)));
}
else
{
if (l9_825<l9_833)
{
l9_836=mix(l9_832,l9_834,float4(fast::clamp((l9_825-l9_831)/(l9_833-l9_831),0.0,1.0)));
}
else
{
l9_836=mix(l9_834,l9_835,float4(fast::clamp((l9_825-l9_833)/(1.0-l9_833),0.0,1.0)));
}
}
}
}
bool l9_837=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_838;
if (l9_837)
{
l9_838=!PreviewInfo.Saved;
}
else
{
l9_838=l9_837;
}
bool l9_839;
if (l9_838)
{
l9_839=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_839=l9_838;
}
if (l9_839)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_836;
}
l9_824=l9_836;
l9_814=l9_824;
float4 l9_840=l9_814;
float4 l9_841=l9_840;
int l9_842=0;
l9_842=sc_DirectionalLightsCount_tmp;
int l9_843=l9_842;
if (l9_843>0)
{
float l9_844;
int l9_845=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_846=0;
l9_846=sc_DirectionalLightsCount_tmp;
int l9_847=l9_846;
if (l9_845<l9_847)
{
int l9_848=l9_845;
float3 l9_849=float3(0.0);
if (l9_848<sc_DirectionalLightsCount_tmp)
{
l9_849=-(*sc_set0.UserUniforms).sc_DirectionalLights[l9_848].direction;
}
float3 l9_850=l9_849;
float3 l9_851=l9_850;
float l9_852=(dot(N123_Normal,l9_851)*0.60000002)+0.40000001;
float l9_853=10.0;
if (l9_852<=0.0)
{
l9_844=0.0;
}
else
{
l9_844=pow(l9_852,l9_853);
}
float l9_854=l9_844;
float l9_855=fast::clamp(l9_854,0.0,1.0);
float4 l9_856=mix(l9_841,l9_383,float4(l9_855));
float4 l9_857=l9_841*l9_287;
float l9_858=fast::max(l9_813,l9_619)*0.89999998;
N123_FrontFacing=mix(l9_856,l9_857,float4(l9_858));
N123_BackFacing=l9_287;
l9_845++;
continue;
}
else
{
break;
}
}
}
l9_18=N123_FrontFacing;
l9_16=l9_18;
param_2=l9_16;
param_4=param_2;
}
else
{
float4 l9_859=float4(0.0);
ssGlobals l9_860=param_5;
tempGlobals=l9_860;
float4 l9_861=float4(0.0);
float3 l9_862=float3(0.0);
float3 l9_863=float3(0.0);
float3 l9_864=(*sc_set0.UserUniforms).oceanMin;
l9_863=l9_864;
l9_862=l9_863;
float3 l9_865=l9_862;
N123_OceanAabbMin=l9_865;
float3 l9_866=float3(0.0);
float3 l9_867=float3(0.0);
float3 l9_868=(*sc_set0.UserUniforms).oceanMax;
l9_867=l9_868;
l9_866=l9_867;
float3 l9_869=l9_866;
N123_OceanAabbMax=l9_869;
float l9_870=0.0;
float l9_871=0.0;
float l9_872=(*sc_set0.UserUniforms).speed;
l9_871=l9_872;
l9_870=l9_871;
float l9_873=l9_870;
N123_OceanSpeed=l9_873;
float l9_874=0.0;
float l9_875=0.0;
float l9_876=(*sc_set0.UserUniforms).enableFoam;
l9_875=l9_876;
l9_874=l9_875;
float l9_877=l9_874;
N123_EnableFoam=l9_877;
float l9_878=0.0;
float l9_879=0.0;
float l9_880=(*sc_set0.UserUniforms).fbmScale;
l9_879=l9_880;
l9_878=l9_879;
float l9_881=l9_878;
N123_FBMScale=l9_881;
float l9_882=0.0;
float l9_883=0.0;
float l9_884=(*sc_set0.UserUniforms).enableInfinite;
l9_883=l9_884;
l9_882=l9_883;
float l9_885=l9_882;
N123_EnableInfinite=l9_885;
float l9_886=0.0;
float l9_887=0.0;
float l9_888=(*sc_set0.UserUniforms).distortionScale;
l9_887=l9_888;
l9_886=l9_887;
float l9_889=l9_886;
N123_DistortionScale=l9_889;
float l9_890=0.0;
float l9_891=0.0;
float l9_892=(*sc_set0.UserUniforms).distortionIntensity;
l9_891=l9_892;
l9_890=l9_891;
float l9_893=l9_890;
N123_DistortionIntensity=l9_893;
float l9_894=0.0;
float l9_895=0.0;
float l9_896=(*sc_set0.UserUniforms).enableFluid;
l9_895=l9_896;
l9_894=l9_895;
float l9_897=l9_894;
N123_EnableFluid=l9_897;
float2 l9_898=float2(0.0);
float2 l9_899=float2(0.0);
float2 l9_900=(*sc_set0.UserUniforms).pressureRange;
l9_899=l9_900;
l9_898=l9_899;
float2 l9_901=l9_898;
N123_pressureRange=l9_901;
float l9_902=0.0;
float l9_903=0.0;
float l9_904=(*sc_set0.UserUniforms).fluidMul;
l9_903=l9_904;
l9_902=l9_903;
float l9_905=l9_902;
N123_FluidMul=l9_905;
float2 l9_906=float2(0.0);
float2 l9_907=float2(0.0);
float2 l9_908=(*sc_set0.UserUniforms).unpackVal;
l9_907=l9_908;
l9_906=l9_907;
float2 l9_909=l9_906;
N123_unpackVal=l9_909;
float l9_910=0.0;
l9_910=tempGlobals.N123_TatalHeightRemap;
float4 l9_911=float4(0.0);
float4 l9_912=(*sc_set0.UserUniforms).colorTrough;
l9_911=l9_912;
float4 l9_913=float4(0.0);
float4 l9_914=(*sc_set0.UserUniforms).colorMiddle;
l9_913=l9_914;
float4 l9_915=float4(0.0);
float4 l9_916=(*sc_set0.UserUniforms).colorCrest;
l9_915=l9_916;
float l9_917=0.0;
l9_917=tempGlobals.N123_fbm;
float4 l9_918=float4(0.0);
l9_918=mix(l9_913,l9_915,float4(l9_917));
float l9_919=l9_910;
float4 l9_920=l9_911;
float l9_921=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_922=l9_911;
float l9_923=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_924=l9_911;
float l9_925=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_926=l9_913;
float l9_927=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_928=l9_918;
float4 l9_929=l9_918;
l9_919=fast::clamp(l9_919,0.0,1.0);
float4 l9_930;
if (l9_919<l9_921)
{
l9_930=mix(l9_920,l9_922,float4(fast::clamp(l9_919/l9_921,0.0,1.0)));
}
else
{
if (l9_919<l9_923)
{
l9_930=mix(l9_922,l9_924,float4(fast::clamp((l9_919-l9_921)/(l9_923-l9_921),0.0,1.0)));
}
else
{
if (l9_919<l9_925)
{
l9_930=mix(l9_924,l9_926,float4(fast::clamp((l9_919-l9_923)/(l9_925-l9_923),0.0,1.0)));
}
else
{
if (l9_919<l9_927)
{
l9_930=mix(l9_926,l9_928,float4(fast::clamp((l9_919-l9_925)/(l9_927-l9_925),0.0,1.0)));
}
else
{
l9_930=mix(l9_928,l9_929,float4(fast::clamp((l9_919-l9_927)/(1.0-l9_927),0.0,1.0)));
}
}
}
}
bool l9_931=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_932;
if (l9_931)
{
l9_932=!PreviewInfo.Saved;
}
else
{
l9_932=l9_931;
}
bool l9_933;
if (l9_932)
{
l9_933=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_933=l9_932;
}
if (l9_933)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_930;
}
float2 l9_934=tempGlobals.gScreenCoord;
float2 l9_935=l9_934;
float2 l9_936=tempGlobals.Surface_UVCoord0;
float2 l9_937=l9_936;
float3 l9_938=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_939=l9_938;
float2 l9_940=l9_937*N123_DistortionScale;
float4 l9_941=float4(0.0);
int l9_942=0;
if ((int(distortionTexHasSwappedViews_tmp)!=0))
{
int l9_943=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_943=0;
}
else
{
l9_943=in.varStereoViewID;
}
int l9_944=l9_943;
l9_942=1-l9_944;
}
else
{
int l9_945=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_945=0;
}
else
{
l9_945=in.varStereoViewID;
}
int l9_946=l9_945;
l9_942=l9_946;
}
int l9_947=l9_942;
int l9_948=distortionTexLayout_tmp;
int l9_949=l9_947;
float2 l9_950=l9_940;
bool l9_951=(int(SC_USE_UV_TRANSFORM_distortionTex_tmp)!=0);
float3x3 l9_952=(*sc_set0.UserUniforms).distortionTexTransform;
int2 l9_953=int2(SC_SOFTWARE_WRAP_MODE_U_distortionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_distortionTex_tmp);
bool l9_954=(int(SC_USE_UV_MIN_MAX_distortionTex_tmp)!=0);
float4 l9_955=(*sc_set0.UserUniforms).distortionTexUvMinMax;
bool l9_956=(int(SC_USE_CLAMP_TO_BORDER_distortionTex_tmp)!=0);
float4 l9_957=(*sc_set0.UserUniforms).distortionTexBorderColor;
float l9_958=0.0;
bool l9_959=l9_956&&(!l9_954);
float l9_960=1.0;
float l9_961=l9_950.x;
int l9_962=l9_953.x;
if (l9_962==1)
{
l9_961=fract(l9_961);
}
else
{
if (l9_962==2)
{
float l9_963=fract(l9_961);
float l9_964=l9_961-l9_963;
float l9_965=step(0.25,fract(l9_964*0.5));
l9_961=mix(l9_963,1.0-l9_963,fast::clamp(l9_965,0.0,1.0));
}
}
l9_950.x=l9_961;
float l9_966=l9_950.y;
int l9_967=l9_953.y;
if (l9_967==1)
{
l9_966=fract(l9_966);
}
else
{
if (l9_967==2)
{
float l9_968=fract(l9_966);
float l9_969=l9_966-l9_968;
float l9_970=step(0.25,fract(l9_969*0.5));
l9_966=mix(l9_968,1.0-l9_968,fast::clamp(l9_970,0.0,1.0));
}
}
l9_950.y=l9_966;
if (l9_954)
{
bool l9_971=l9_956;
bool l9_972;
if (l9_971)
{
l9_972=l9_953.x==3;
}
else
{
l9_972=l9_971;
}
float l9_973=l9_950.x;
float l9_974=l9_955.x;
float l9_975=l9_955.z;
bool l9_976=l9_972;
float l9_977=l9_960;
float l9_978=fast::clamp(l9_973,l9_974,l9_975);
float l9_979=step(abs(l9_973-l9_978),9.9999997e-06);
l9_977*=(l9_979+((1.0-float(l9_976))*(1.0-l9_979)));
l9_973=l9_978;
l9_950.x=l9_973;
l9_960=l9_977;
bool l9_980=l9_956;
bool l9_981;
if (l9_980)
{
l9_981=l9_953.y==3;
}
else
{
l9_981=l9_980;
}
float l9_982=l9_950.y;
float l9_983=l9_955.y;
float l9_984=l9_955.w;
bool l9_985=l9_981;
float l9_986=l9_960;
float l9_987=fast::clamp(l9_982,l9_983,l9_984);
float l9_988=step(abs(l9_982-l9_987),9.9999997e-06);
l9_986*=(l9_988+((1.0-float(l9_985))*(1.0-l9_988)));
l9_982=l9_987;
l9_950.y=l9_982;
l9_960=l9_986;
}
float2 l9_989=l9_950;
bool l9_990=l9_951;
float3x3 l9_991=l9_952;
if (l9_990)
{
l9_989=float2((l9_991*float3(l9_989,1.0)).xy);
}
float2 l9_992=l9_989;
float2 l9_993=l9_992;
float2 l9_994=l9_993;
l9_950=l9_994;
float l9_995=l9_950.x;
int l9_996=l9_953.x;
bool l9_997=l9_959;
float l9_998=l9_960;
if ((l9_996==0)||(l9_996==3))
{
float l9_999=l9_995;
float l9_1000=0.0;
float l9_1001=1.0;
bool l9_1002=l9_997;
float l9_1003=l9_998;
float l9_1004=fast::clamp(l9_999,l9_1000,l9_1001);
float l9_1005=step(abs(l9_999-l9_1004),9.9999997e-06);
l9_1003*=(l9_1005+((1.0-float(l9_1002))*(1.0-l9_1005)));
l9_999=l9_1004;
l9_995=l9_999;
l9_998=l9_1003;
}
l9_950.x=l9_995;
l9_960=l9_998;
float l9_1006=l9_950.y;
int l9_1007=l9_953.y;
bool l9_1008=l9_959;
float l9_1009=l9_960;
if ((l9_1007==0)||(l9_1007==3))
{
float l9_1010=l9_1006;
float l9_1011=0.0;
float l9_1012=1.0;
bool l9_1013=l9_1008;
float l9_1014=l9_1009;
float l9_1015=fast::clamp(l9_1010,l9_1011,l9_1012);
float l9_1016=step(abs(l9_1010-l9_1015),9.9999997e-06);
l9_1014*=(l9_1016+((1.0-float(l9_1013))*(1.0-l9_1016)));
l9_1010=l9_1015;
l9_1006=l9_1010;
l9_1009=l9_1014;
}
l9_950.y=l9_1006;
l9_960=l9_1009;
float2 l9_1017=l9_950;
int l9_1018=l9_948;
int l9_1019=l9_949;
float l9_1020=l9_958;
float2 l9_1021=l9_1017;
int l9_1022=l9_1018;
int l9_1023=l9_1019;
float3 l9_1024=float3(0.0);
if (l9_1022==0)
{
l9_1024=float3(l9_1021,0.0);
}
else
{
if (l9_1022==1)
{
l9_1024=float3(l9_1021.x,(l9_1021.y*0.5)+(0.5-(float(l9_1023)*0.5)),0.0);
}
else
{
l9_1024=float3(l9_1021,float(l9_1023));
}
}
float3 l9_1025=l9_1024;
float3 l9_1026=l9_1025;
float2 l9_1027=l9_1026.xy;
float l9_1028=l9_1020;
float4 l9_1029=sc_set0.distortionTex.sample(sc_set0.distortionTexSmpSC,l9_1027,bias(l9_1028));
float4 l9_1030=l9_1029;
float4 l9_1031=l9_1030;
if (l9_956)
{
l9_1031=mix(l9_957,l9_1031,float4(l9_960));
}
float4 l9_1032=l9_1031;
l9_941=l9_1032;
float4 l9_1033=l9_941;
float2 l9_1034=l9_1033.xy;
float2 l9_1035=(((l9_1034-float2(1.0))*N123_DistortionIntensity)+l9_935)+float2(0.30000001);
float2 l9_1036=float2(l9_1035.x-0.15000001,1.0-l9_1035.y)*0.89999998;
float4 l9_1037=float4(0.0);
int l9_1038=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1039=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1039=0;
}
else
{
l9_1039=in.varStereoViewID;
}
int l9_1040=l9_1039;
l9_1038=1-l9_1040;
}
else
{
int l9_1041=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1041=0;
}
else
{
l9_1041=in.varStereoViewID;
}
int l9_1042=l9_1041;
l9_1038=l9_1042;
}
int l9_1043=l9_1038;
int l9_1044=screenTexLayout_tmp;
int l9_1045=l9_1043;
float2 l9_1046=l9_1036;
bool l9_1047=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1048=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1049=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1050=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1051=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1052=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1053=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1054=0.0;
bool l9_1055=l9_1052&&(!l9_1050);
float l9_1056=1.0;
float l9_1057=l9_1046.x;
int l9_1058=l9_1049.x;
if (l9_1058==1)
{
l9_1057=fract(l9_1057);
}
else
{
if (l9_1058==2)
{
float l9_1059=fract(l9_1057);
float l9_1060=l9_1057-l9_1059;
float l9_1061=step(0.25,fract(l9_1060*0.5));
l9_1057=mix(l9_1059,1.0-l9_1059,fast::clamp(l9_1061,0.0,1.0));
}
}
l9_1046.x=l9_1057;
float l9_1062=l9_1046.y;
int l9_1063=l9_1049.y;
if (l9_1063==1)
{
l9_1062=fract(l9_1062);
}
else
{
if (l9_1063==2)
{
float l9_1064=fract(l9_1062);
float l9_1065=l9_1062-l9_1064;
float l9_1066=step(0.25,fract(l9_1065*0.5));
l9_1062=mix(l9_1064,1.0-l9_1064,fast::clamp(l9_1066,0.0,1.0));
}
}
l9_1046.y=l9_1062;
if (l9_1050)
{
bool l9_1067=l9_1052;
bool l9_1068;
if (l9_1067)
{
l9_1068=l9_1049.x==3;
}
else
{
l9_1068=l9_1067;
}
float l9_1069=l9_1046.x;
float l9_1070=l9_1051.x;
float l9_1071=l9_1051.z;
bool l9_1072=l9_1068;
float l9_1073=l9_1056;
float l9_1074=fast::clamp(l9_1069,l9_1070,l9_1071);
float l9_1075=step(abs(l9_1069-l9_1074),9.9999997e-06);
l9_1073*=(l9_1075+((1.0-float(l9_1072))*(1.0-l9_1075)));
l9_1069=l9_1074;
l9_1046.x=l9_1069;
l9_1056=l9_1073;
bool l9_1076=l9_1052;
bool l9_1077;
if (l9_1076)
{
l9_1077=l9_1049.y==3;
}
else
{
l9_1077=l9_1076;
}
float l9_1078=l9_1046.y;
float l9_1079=l9_1051.y;
float l9_1080=l9_1051.w;
bool l9_1081=l9_1077;
float l9_1082=l9_1056;
float l9_1083=fast::clamp(l9_1078,l9_1079,l9_1080);
float l9_1084=step(abs(l9_1078-l9_1083),9.9999997e-06);
l9_1082*=(l9_1084+((1.0-float(l9_1081))*(1.0-l9_1084)));
l9_1078=l9_1083;
l9_1046.y=l9_1078;
l9_1056=l9_1082;
}
float2 l9_1085=l9_1046;
bool l9_1086=l9_1047;
float3x3 l9_1087=l9_1048;
if (l9_1086)
{
l9_1085=float2((l9_1087*float3(l9_1085,1.0)).xy);
}
float2 l9_1088=l9_1085;
float2 l9_1089=l9_1088;
float2 l9_1090=l9_1089;
l9_1046=l9_1090;
float l9_1091=l9_1046.x;
int l9_1092=l9_1049.x;
bool l9_1093=l9_1055;
float l9_1094=l9_1056;
if ((l9_1092==0)||(l9_1092==3))
{
float l9_1095=l9_1091;
float l9_1096=0.0;
float l9_1097=1.0;
bool l9_1098=l9_1093;
float l9_1099=l9_1094;
float l9_1100=fast::clamp(l9_1095,l9_1096,l9_1097);
float l9_1101=step(abs(l9_1095-l9_1100),9.9999997e-06);
l9_1099*=(l9_1101+((1.0-float(l9_1098))*(1.0-l9_1101)));
l9_1095=l9_1100;
l9_1091=l9_1095;
l9_1094=l9_1099;
}
l9_1046.x=l9_1091;
l9_1056=l9_1094;
float l9_1102=l9_1046.y;
int l9_1103=l9_1049.y;
bool l9_1104=l9_1055;
float l9_1105=l9_1056;
if ((l9_1103==0)||(l9_1103==3))
{
float l9_1106=l9_1102;
float l9_1107=0.0;
float l9_1108=1.0;
bool l9_1109=l9_1104;
float l9_1110=l9_1105;
float l9_1111=fast::clamp(l9_1106,l9_1107,l9_1108);
float l9_1112=step(abs(l9_1106-l9_1111),9.9999997e-06);
l9_1110*=(l9_1112+((1.0-float(l9_1109))*(1.0-l9_1112)));
l9_1106=l9_1111;
l9_1102=l9_1106;
l9_1105=l9_1110;
}
l9_1046.y=l9_1102;
l9_1056=l9_1105;
float2 l9_1113=l9_1046;
int l9_1114=l9_1044;
int l9_1115=l9_1045;
float l9_1116=l9_1054;
float2 l9_1117=l9_1113;
int l9_1118=l9_1114;
int l9_1119=l9_1115;
float3 l9_1120=float3(0.0);
if (l9_1118==0)
{
l9_1120=float3(l9_1117,0.0);
}
else
{
if (l9_1118==1)
{
l9_1120=float3(l9_1117.x,(l9_1117.y*0.5)+(0.5-(float(l9_1119)*0.5)),0.0);
}
else
{
l9_1120=float3(l9_1117,float(l9_1119));
}
}
float3 l9_1121=l9_1120;
float3 l9_1122=l9_1121;
float2 l9_1123=l9_1122.xy;
float l9_1124=l9_1116;
float4 l9_1125=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1123,bias(l9_1124));
float4 l9_1126=l9_1125;
float4 l9_1127=l9_1126;
if (l9_1052)
{
l9_1127=mix(l9_1053,l9_1127,float4(l9_1056));
}
float4 l9_1128=l9_1127;
l9_1037=l9_1128;
float4 l9_1129=l9_1037;
float4 l9_1130=l9_1129;
float2 l9_1131=((l9_1035-float2(0.1))*0.5)+float2(0.1);
float2 l9_1132=l9_1131;
float4 l9_1133=float4(0.0);
int l9_1134=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1135=0;
}
else
{
l9_1135=in.varStereoViewID;
}
int l9_1136=l9_1135;
l9_1134=1-l9_1136;
}
else
{
int l9_1137=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1137=0;
}
else
{
l9_1137=in.varStereoViewID;
}
int l9_1138=l9_1137;
l9_1134=l9_1138;
}
int l9_1139=l9_1134;
int l9_1140=screenTexLayout_tmp;
int l9_1141=l9_1139;
float2 l9_1142=l9_1132;
bool l9_1143=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1144=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1145=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1146=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1147=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1148=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1149=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1150=0.0;
bool l9_1151=l9_1148&&(!l9_1146);
float l9_1152=1.0;
float l9_1153=l9_1142.x;
int l9_1154=l9_1145.x;
if (l9_1154==1)
{
l9_1153=fract(l9_1153);
}
else
{
if (l9_1154==2)
{
float l9_1155=fract(l9_1153);
float l9_1156=l9_1153-l9_1155;
float l9_1157=step(0.25,fract(l9_1156*0.5));
l9_1153=mix(l9_1155,1.0-l9_1155,fast::clamp(l9_1157,0.0,1.0));
}
}
l9_1142.x=l9_1153;
float l9_1158=l9_1142.y;
int l9_1159=l9_1145.y;
if (l9_1159==1)
{
l9_1158=fract(l9_1158);
}
else
{
if (l9_1159==2)
{
float l9_1160=fract(l9_1158);
float l9_1161=l9_1158-l9_1160;
float l9_1162=step(0.25,fract(l9_1161*0.5));
l9_1158=mix(l9_1160,1.0-l9_1160,fast::clamp(l9_1162,0.0,1.0));
}
}
l9_1142.y=l9_1158;
if (l9_1146)
{
bool l9_1163=l9_1148;
bool l9_1164;
if (l9_1163)
{
l9_1164=l9_1145.x==3;
}
else
{
l9_1164=l9_1163;
}
float l9_1165=l9_1142.x;
float l9_1166=l9_1147.x;
float l9_1167=l9_1147.z;
bool l9_1168=l9_1164;
float l9_1169=l9_1152;
float l9_1170=fast::clamp(l9_1165,l9_1166,l9_1167);
float l9_1171=step(abs(l9_1165-l9_1170),9.9999997e-06);
l9_1169*=(l9_1171+((1.0-float(l9_1168))*(1.0-l9_1171)));
l9_1165=l9_1170;
l9_1142.x=l9_1165;
l9_1152=l9_1169;
bool l9_1172=l9_1148;
bool l9_1173;
if (l9_1172)
{
l9_1173=l9_1145.y==3;
}
else
{
l9_1173=l9_1172;
}
float l9_1174=l9_1142.y;
float l9_1175=l9_1147.y;
float l9_1176=l9_1147.w;
bool l9_1177=l9_1173;
float l9_1178=l9_1152;
float l9_1179=fast::clamp(l9_1174,l9_1175,l9_1176);
float l9_1180=step(abs(l9_1174-l9_1179),9.9999997e-06);
l9_1178*=(l9_1180+((1.0-float(l9_1177))*(1.0-l9_1180)));
l9_1174=l9_1179;
l9_1142.y=l9_1174;
l9_1152=l9_1178;
}
float2 l9_1181=l9_1142;
bool l9_1182=l9_1143;
float3x3 l9_1183=l9_1144;
if (l9_1182)
{
l9_1181=float2((l9_1183*float3(l9_1181,1.0)).xy);
}
float2 l9_1184=l9_1181;
float2 l9_1185=l9_1184;
float2 l9_1186=l9_1185;
l9_1142=l9_1186;
float l9_1187=l9_1142.x;
int l9_1188=l9_1145.x;
bool l9_1189=l9_1151;
float l9_1190=l9_1152;
if ((l9_1188==0)||(l9_1188==3))
{
float l9_1191=l9_1187;
float l9_1192=0.0;
float l9_1193=1.0;
bool l9_1194=l9_1189;
float l9_1195=l9_1190;
float l9_1196=fast::clamp(l9_1191,l9_1192,l9_1193);
float l9_1197=step(abs(l9_1191-l9_1196),9.9999997e-06);
l9_1195*=(l9_1197+((1.0-float(l9_1194))*(1.0-l9_1197)));
l9_1191=l9_1196;
l9_1187=l9_1191;
l9_1190=l9_1195;
}
l9_1142.x=l9_1187;
l9_1152=l9_1190;
float l9_1198=l9_1142.y;
int l9_1199=l9_1145.y;
bool l9_1200=l9_1151;
float l9_1201=l9_1152;
if ((l9_1199==0)||(l9_1199==3))
{
float l9_1202=l9_1198;
float l9_1203=0.0;
float l9_1204=1.0;
bool l9_1205=l9_1200;
float l9_1206=l9_1201;
float l9_1207=fast::clamp(l9_1202,l9_1203,l9_1204);
float l9_1208=step(abs(l9_1202-l9_1207),9.9999997e-06);
l9_1206*=(l9_1208+((1.0-float(l9_1205))*(1.0-l9_1208)));
l9_1202=l9_1207;
l9_1198=l9_1202;
l9_1201=l9_1206;
}
l9_1142.y=l9_1198;
l9_1152=l9_1201;
float2 l9_1209=l9_1142;
int l9_1210=l9_1140;
int l9_1211=l9_1141;
float l9_1212=l9_1150;
float2 l9_1213=l9_1209;
int l9_1214=l9_1210;
int l9_1215=l9_1211;
float3 l9_1216=float3(0.0);
if (l9_1214==0)
{
l9_1216=float3(l9_1213,0.0);
}
else
{
if (l9_1214==1)
{
l9_1216=float3(l9_1213.x,(l9_1213.y*0.5)+(0.5-(float(l9_1215)*0.5)),0.0);
}
else
{
l9_1216=float3(l9_1213,float(l9_1215));
}
}
float3 l9_1217=l9_1216;
float3 l9_1218=l9_1217;
float2 l9_1219=l9_1218.xy;
float l9_1220=l9_1212;
float4 l9_1221=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1219,bias(l9_1220));
float4 l9_1222=l9_1221;
float4 l9_1223=l9_1222;
if (l9_1148)
{
l9_1223=mix(l9_1149,l9_1223,float4(l9_1152));
}
float4 l9_1224=l9_1223;
l9_1133=l9_1224;
float4 l9_1225=l9_1133;
float4 l9_1226=l9_1225;
float2 l9_1227=l9_937;
if (N123_EnableInfinite==1.0)
{
float2 l9_1228=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_1229=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_1230=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_1231=float2(0.0)+(((l9_1230.xz-l9_1228)*1.0)/((l9_1229-l9_1228)+float2(1e-06)));
l9_1231.y=1.0-l9_1231.y;
l9_1227=(l9_937+l9_1231)-float2(0.5);
}
float2 l9_1232=l9_1227;
float4 l9_1233=float4(0.0);
int l9_1234=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_1235=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1235=0;
}
else
{
l9_1235=in.varStereoViewID;
}
int l9_1236=l9_1235;
l9_1234=1-l9_1236;
}
else
{
int l9_1237=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1237=0;
}
else
{
l9_1237=in.varStereoViewID;
}
int l9_1238=l9_1237;
l9_1234=l9_1238;
}
int l9_1239=l9_1234;
int l9_1240=oceanHeightmapLayout_tmp;
int l9_1241=l9_1239;
float2 l9_1242=l9_1232;
bool l9_1243=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_1244=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_1245=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_1246=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_1247=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_1248=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_1249=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_1250=0.0;
bool l9_1251=l9_1248&&(!l9_1246);
float l9_1252=1.0;
float l9_1253=l9_1242.x;
int l9_1254=l9_1245.x;
if (l9_1254==1)
{
l9_1253=fract(l9_1253);
}
else
{
if (l9_1254==2)
{
float l9_1255=fract(l9_1253);
float l9_1256=l9_1253-l9_1255;
float l9_1257=step(0.25,fract(l9_1256*0.5));
l9_1253=mix(l9_1255,1.0-l9_1255,fast::clamp(l9_1257,0.0,1.0));
}
}
l9_1242.x=l9_1253;
float l9_1258=l9_1242.y;
int l9_1259=l9_1245.y;
if (l9_1259==1)
{
l9_1258=fract(l9_1258);
}
else
{
if (l9_1259==2)
{
float l9_1260=fract(l9_1258);
float l9_1261=l9_1258-l9_1260;
float l9_1262=step(0.25,fract(l9_1261*0.5));
l9_1258=mix(l9_1260,1.0-l9_1260,fast::clamp(l9_1262,0.0,1.0));
}
}
l9_1242.y=l9_1258;
if (l9_1246)
{
bool l9_1263=l9_1248;
bool l9_1264;
if (l9_1263)
{
l9_1264=l9_1245.x==3;
}
else
{
l9_1264=l9_1263;
}
float l9_1265=l9_1242.x;
float l9_1266=l9_1247.x;
float l9_1267=l9_1247.z;
bool l9_1268=l9_1264;
float l9_1269=l9_1252;
float l9_1270=fast::clamp(l9_1265,l9_1266,l9_1267);
float l9_1271=step(abs(l9_1265-l9_1270),9.9999997e-06);
l9_1269*=(l9_1271+((1.0-float(l9_1268))*(1.0-l9_1271)));
l9_1265=l9_1270;
l9_1242.x=l9_1265;
l9_1252=l9_1269;
bool l9_1272=l9_1248;
bool l9_1273;
if (l9_1272)
{
l9_1273=l9_1245.y==3;
}
else
{
l9_1273=l9_1272;
}
float l9_1274=l9_1242.y;
float l9_1275=l9_1247.y;
float l9_1276=l9_1247.w;
bool l9_1277=l9_1273;
float l9_1278=l9_1252;
float l9_1279=fast::clamp(l9_1274,l9_1275,l9_1276);
float l9_1280=step(abs(l9_1274-l9_1279),9.9999997e-06);
l9_1278*=(l9_1280+((1.0-float(l9_1277))*(1.0-l9_1280)));
l9_1274=l9_1279;
l9_1242.y=l9_1274;
l9_1252=l9_1278;
}
float2 l9_1281=l9_1242;
bool l9_1282=l9_1243;
float3x3 l9_1283=l9_1244;
if (l9_1282)
{
l9_1281=float2((l9_1283*float3(l9_1281,1.0)).xy);
}
float2 l9_1284=l9_1281;
float2 l9_1285=l9_1284;
float2 l9_1286=l9_1285;
l9_1242=l9_1286;
float l9_1287=l9_1242.x;
int l9_1288=l9_1245.x;
bool l9_1289=l9_1251;
float l9_1290=l9_1252;
if ((l9_1288==0)||(l9_1288==3))
{
float l9_1291=l9_1287;
float l9_1292=0.0;
float l9_1293=1.0;
bool l9_1294=l9_1289;
float l9_1295=l9_1290;
float l9_1296=fast::clamp(l9_1291,l9_1292,l9_1293);
float l9_1297=step(abs(l9_1291-l9_1296),9.9999997e-06);
l9_1295*=(l9_1297+((1.0-float(l9_1294))*(1.0-l9_1297)));
l9_1291=l9_1296;
l9_1287=l9_1291;
l9_1290=l9_1295;
}
l9_1242.x=l9_1287;
l9_1252=l9_1290;
float l9_1298=l9_1242.y;
int l9_1299=l9_1245.y;
bool l9_1300=l9_1251;
float l9_1301=l9_1252;
if ((l9_1299==0)||(l9_1299==3))
{
float l9_1302=l9_1298;
float l9_1303=0.0;
float l9_1304=1.0;
bool l9_1305=l9_1300;
float l9_1306=l9_1301;
float l9_1307=fast::clamp(l9_1302,l9_1303,l9_1304);
float l9_1308=step(abs(l9_1302-l9_1307),9.9999997e-06);
l9_1306*=(l9_1308+((1.0-float(l9_1305))*(1.0-l9_1308)));
l9_1302=l9_1307;
l9_1298=l9_1302;
l9_1301=l9_1306;
}
l9_1242.y=l9_1298;
l9_1252=l9_1301;
float2 l9_1309=l9_1242;
int l9_1310=l9_1240;
int l9_1311=l9_1241;
float l9_1312=l9_1250;
float2 l9_1313=l9_1309;
int l9_1314=l9_1310;
int l9_1315=l9_1311;
float3 l9_1316=float3(0.0);
if (l9_1314==0)
{
l9_1316=float3(l9_1313,0.0);
}
else
{
if (l9_1314==1)
{
l9_1316=float3(l9_1313.x,(l9_1313.y*0.5)+(0.5-(float(l9_1315)*0.5)),0.0);
}
else
{
l9_1316=float3(l9_1313,float(l9_1315));
}
}
float3 l9_1317=l9_1316;
float3 l9_1318=l9_1317;
float2 l9_1319=l9_1318.xy;
float l9_1320=l9_1312;
float4 l9_1321=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_1319,bias(l9_1320));
float4 l9_1322=l9_1321;
float4 l9_1323=l9_1322;
if (l9_1248)
{
l9_1323=mix(l9_1249,l9_1323,float4(l9_1252));
}
float4 l9_1324=l9_1323;
l9_1233=l9_1324;
float4 l9_1325=l9_1233;
float2 l9_1326=l9_1325.xy;
float l9_1327=N123_unpackVal.x;
float l9_1328=N123_unpackVal.y;
float l9_1329=0.0;
float2 l9_1330=l9_1326;
float l9_1331=l9_1327;
float l9_1332=l9_1328;
float l9_1333=0.99998999;
float2 l9_1334=l9_1330;
#if (1)
{
l9_1334=floor((l9_1334*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1335=dot(l9_1334,float2(1.0,0.0039215689));
float l9_1336=l9_1335;
float l9_1337=0.0;
float l9_1338=l9_1333;
float l9_1339=l9_1331;
float l9_1340=l9_1332;
float l9_1341=l9_1339+(((l9_1336-l9_1337)*(l9_1340-l9_1339))/(l9_1338-l9_1337));
float l9_1342=l9_1341;
l9_1329=l9_1342;
float l9_1343=l9_1329;
float l9_1344=l9_1343;
float l9_1345=0.0+(((l9_1344-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_1345;
float l9_1346=l9_1344;
if (N123_EnableFluid==1.0)
{
float2 l9_1347=l9_937;
float4 l9_1348=float4(0.0);
int l9_1349=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_1350=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1350=0;
}
else
{
l9_1350=in.varStereoViewID;
}
int l9_1351=l9_1350;
l9_1349=1-l9_1351;
}
else
{
int l9_1352=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1352=0;
}
else
{
l9_1352=in.varStereoViewID;
}
int l9_1353=l9_1352;
l9_1349=l9_1353;
}
int l9_1354=l9_1349;
int l9_1355=fluidPressureLayout_tmp;
int l9_1356=l9_1354;
float2 l9_1357=l9_1347;
bool l9_1358=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_1359=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_1360=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_1361=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_1362=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_1363=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_1364=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_1365=0.0;
bool l9_1366=l9_1363&&(!l9_1361);
float l9_1367=1.0;
float l9_1368=l9_1357.x;
int l9_1369=l9_1360.x;
if (l9_1369==1)
{
l9_1368=fract(l9_1368);
}
else
{
if (l9_1369==2)
{
float l9_1370=fract(l9_1368);
float l9_1371=l9_1368-l9_1370;
float l9_1372=step(0.25,fract(l9_1371*0.5));
l9_1368=mix(l9_1370,1.0-l9_1370,fast::clamp(l9_1372,0.0,1.0));
}
}
l9_1357.x=l9_1368;
float l9_1373=l9_1357.y;
int l9_1374=l9_1360.y;
if (l9_1374==1)
{
l9_1373=fract(l9_1373);
}
else
{
if (l9_1374==2)
{
float l9_1375=fract(l9_1373);
float l9_1376=l9_1373-l9_1375;
float l9_1377=step(0.25,fract(l9_1376*0.5));
l9_1373=mix(l9_1375,1.0-l9_1375,fast::clamp(l9_1377,0.0,1.0));
}
}
l9_1357.y=l9_1373;
if (l9_1361)
{
bool l9_1378=l9_1363;
bool l9_1379;
if (l9_1378)
{
l9_1379=l9_1360.x==3;
}
else
{
l9_1379=l9_1378;
}
float l9_1380=l9_1357.x;
float l9_1381=l9_1362.x;
float l9_1382=l9_1362.z;
bool l9_1383=l9_1379;
float l9_1384=l9_1367;
float l9_1385=fast::clamp(l9_1380,l9_1381,l9_1382);
float l9_1386=step(abs(l9_1380-l9_1385),9.9999997e-06);
l9_1384*=(l9_1386+((1.0-float(l9_1383))*(1.0-l9_1386)));
l9_1380=l9_1385;
l9_1357.x=l9_1380;
l9_1367=l9_1384;
bool l9_1387=l9_1363;
bool l9_1388;
if (l9_1387)
{
l9_1388=l9_1360.y==3;
}
else
{
l9_1388=l9_1387;
}
float l9_1389=l9_1357.y;
float l9_1390=l9_1362.y;
float l9_1391=l9_1362.w;
bool l9_1392=l9_1388;
float l9_1393=l9_1367;
float l9_1394=fast::clamp(l9_1389,l9_1390,l9_1391);
float l9_1395=step(abs(l9_1389-l9_1394),9.9999997e-06);
l9_1393*=(l9_1395+((1.0-float(l9_1392))*(1.0-l9_1395)));
l9_1389=l9_1394;
l9_1357.y=l9_1389;
l9_1367=l9_1393;
}
float2 l9_1396=l9_1357;
bool l9_1397=l9_1358;
float3x3 l9_1398=l9_1359;
if (l9_1397)
{
l9_1396=float2((l9_1398*float3(l9_1396,1.0)).xy);
}
float2 l9_1399=l9_1396;
float2 l9_1400=l9_1399;
float2 l9_1401=l9_1400;
l9_1357=l9_1401;
float l9_1402=l9_1357.x;
int l9_1403=l9_1360.x;
bool l9_1404=l9_1366;
float l9_1405=l9_1367;
if ((l9_1403==0)||(l9_1403==3))
{
float l9_1406=l9_1402;
float l9_1407=0.0;
float l9_1408=1.0;
bool l9_1409=l9_1404;
float l9_1410=l9_1405;
float l9_1411=fast::clamp(l9_1406,l9_1407,l9_1408);
float l9_1412=step(abs(l9_1406-l9_1411),9.9999997e-06);
l9_1410*=(l9_1412+((1.0-float(l9_1409))*(1.0-l9_1412)));
l9_1406=l9_1411;
l9_1402=l9_1406;
l9_1405=l9_1410;
}
l9_1357.x=l9_1402;
l9_1367=l9_1405;
float l9_1413=l9_1357.y;
int l9_1414=l9_1360.y;
bool l9_1415=l9_1366;
float l9_1416=l9_1367;
if ((l9_1414==0)||(l9_1414==3))
{
float l9_1417=l9_1413;
float l9_1418=0.0;
float l9_1419=1.0;
bool l9_1420=l9_1415;
float l9_1421=l9_1416;
float l9_1422=fast::clamp(l9_1417,l9_1418,l9_1419);
float l9_1423=step(abs(l9_1417-l9_1422),9.9999997e-06);
l9_1421*=(l9_1423+((1.0-float(l9_1420))*(1.0-l9_1423)));
l9_1417=l9_1422;
l9_1413=l9_1417;
l9_1416=l9_1421;
}
l9_1357.y=l9_1413;
l9_1367=l9_1416;
float2 l9_1424=l9_1357;
int l9_1425=l9_1355;
int l9_1426=l9_1356;
float l9_1427=l9_1365;
float2 l9_1428=l9_1424;
int l9_1429=l9_1425;
int l9_1430=l9_1426;
float3 l9_1431=float3(0.0);
if (l9_1429==0)
{
l9_1431=float3(l9_1428,0.0);
}
else
{
if (l9_1429==1)
{
l9_1431=float3(l9_1428.x,(l9_1428.y*0.5)+(0.5-(float(l9_1430)*0.5)),0.0);
}
else
{
l9_1431=float3(l9_1428,float(l9_1430));
}
}
float3 l9_1432=l9_1431;
float3 l9_1433=l9_1432;
float2 l9_1434=l9_1433.xy;
float l9_1435=l9_1427;
float4 l9_1436=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_1434,bias(l9_1435));
float4 l9_1437=l9_1436;
float4 l9_1438=l9_1437;
if (l9_1363)
{
l9_1438=mix(l9_1364,l9_1438,float4(l9_1367));
}
float4 l9_1439=l9_1438;
l9_1348=l9_1439;
float4 l9_1440=l9_1348;
float2 l9_1441=l9_1440.xy;
float l9_1442=N123_pressureRange.x;
float l9_1443=N123_pressureRange.y;
float l9_1444=0.0;
float2 l9_1445=l9_1441;
float l9_1446=l9_1442;
float l9_1447=l9_1443;
float l9_1448=0.99998999;
float2 l9_1449=l9_1445;
#if (1)
{
l9_1449=floor((l9_1449*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1450=dot(l9_1449,float2(1.0,0.0039215689));
float l9_1451=l9_1450;
float l9_1452=0.0;
float l9_1453=l9_1448;
float l9_1454=l9_1446;
float l9_1455=l9_1447;
float l9_1456=l9_1454+(((l9_1451-l9_1452)*(l9_1455-l9_1454))/(l9_1453-l9_1452));
float l9_1457=l9_1456;
l9_1444=l9_1457;
float l9_1458=l9_1444;
float l9_1459=l9_1458;
float l9_1460=l9_1459*N123_FluidMul;
l9_1346=l9_1344+l9_1460;
float l9_1461=(0.0+(((fast::clamp(l9_1460,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_1461;
}
float l9_1462=fast::clamp(smoothstep(0.44999999,0.60000002,tempGlobals.N123_TatalHeightRemap),0.0,1.0);
float2 l9_1463=l9_1227;
float4 l9_1464=float4(0.0);
int l9_1465=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_1466=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1466=0;
}
else
{
l9_1466=in.varStereoViewID;
}
int l9_1467=l9_1466;
l9_1465=1-l9_1467;
}
else
{
int l9_1468=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1468=0;
}
else
{
l9_1468=in.varStereoViewID;
}
int l9_1469=l9_1468;
l9_1465=l9_1469;
}
int l9_1470=l9_1465;
int l9_1471=oceanNormalLayout_tmp;
int l9_1472=l9_1470;
float2 l9_1473=l9_1463;
bool l9_1474=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_1475=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_1476=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_1477=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_1478=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_1479=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_1480=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_1481=0.0;
bool l9_1482=l9_1479&&(!l9_1477);
float l9_1483=1.0;
float l9_1484=l9_1473.x;
int l9_1485=l9_1476.x;
if (l9_1485==1)
{
l9_1484=fract(l9_1484);
}
else
{
if (l9_1485==2)
{
float l9_1486=fract(l9_1484);
float l9_1487=l9_1484-l9_1486;
float l9_1488=step(0.25,fract(l9_1487*0.5));
l9_1484=mix(l9_1486,1.0-l9_1486,fast::clamp(l9_1488,0.0,1.0));
}
}
l9_1473.x=l9_1484;
float l9_1489=l9_1473.y;
int l9_1490=l9_1476.y;
if (l9_1490==1)
{
l9_1489=fract(l9_1489);
}
else
{
if (l9_1490==2)
{
float l9_1491=fract(l9_1489);
float l9_1492=l9_1489-l9_1491;
float l9_1493=step(0.25,fract(l9_1492*0.5));
l9_1489=mix(l9_1491,1.0-l9_1491,fast::clamp(l9_1493,0.0,1.0));
}
}
l9_1473.y=l9_1489;
if (l9_1477)
{
bool l9_1494=l9_1479;
bool l9_1495;
if (l9_1494)
{
l9_1495=l9_1476.x==3;
}
else
{
l9_1495=l9_1494;
}
float l9_1496=l9_1473.x;
float l9_1497=l9_1478.x;
float l9_1498=l9_1478.z;
bool l9_1499=l9_1495;
float l9_1500=l9_1483;
float l9_1501=fast::clamp(l9_1496,l9_1497,l9_1498);
float l9_1502=step(abs(l9_1496-l9_1501),9.9999997e-06);
l9_1500*=(l9_1502+((1.0-float(l9_1499))*(1.0-l9_1502)));
l9_1496=l9_1501;
l9_1473.x=l9_1496;
l9_1483=l9_1500;
bool l9_1503=l9_1479;
bool l9_1504;
if (l9_1503)
{
l9_1504=l9_1476.y==3;
}
else
{
l9_1504=l9_1503;
}
float l9_1505=l9_1473.y;
float l9_1506=l9_1478.y;
float l9_1507=l9_1478.w;
bool l9_1508=l9_1504;
float l9_1509=l9_1483;
float l9_1510=fast::clamp(l9_1505,l9_1506,l9_1507);
float l9_1511=step(abs(l9_1505-l9_1510),9.9999997e-06);
l9_1509*=(l9_1511+((1.0-float(l9_1508))*(1.0-l9_1511)));
l9_1505=l9_1510;
l9_1473.y=l9_1505;
l9_1483=l9_1509;
}
float2 l9_1512=l9_1473;
bool l9_1513=l9_1474;
float3x3 l9_1514=l9_1475;
if (l9_1513)
{
l9_1512=float2((l9_1514*float3(l9_1512,1.0)).xy);
}
float2 l9_1515=l9_1512;
float2 l9_1516=l9_1515;
float2 l9_1517=l9_1516;
l9_1473=l9_1517;
float l9_1518=l9_1473.x;
int l9_1519=l9_1476.x;
bool l9_1520=l9_1482;
float l9_1521=l9_1483;
if ((l9_1519==0)||(l9_1519==3))
{
float l9_1522=l9_1518;
float l9_1523=0.0;
float l9_1524=1.0;
bool l9_1525=l9_1520;
float l9_1526=l9_1521;
float l9_1527=fast::clamp(l9_1522,l9_1523,l9_1524);
float l9_1528=step(abs(l9_1522-l9_1527),9.9999997e-06);
l9_1526*=(l9_1528+((1.0-float(l9_1525))*(1.0-l9_1528)));
l9_1522=l9_1527;
l9_1518=l9_1522;
l9_1521=l9_1526;
}
l9_1473.x=l9_1518;
l9_1483=l9_1521;
float l9_1529=l9_1473.y;
int l9_1530=l9_1476.y;
bool l9_1531=l9_1482;
float l9_1532=l9_1483;
if ((l9_1530==0)||(l9_1530==3))
{
float l9_1533=l9_1529;
float l9_1534=0.0;
float l9_1535=1.0;
bool l9_1536=l9_1531;
float l9_1537=l9_1532;
float l9_1538=fast::clamp(l9_1533,l9_1534,l9_1535);
float l9_1539=step(abs(l9_1533-l9_1538),9.9999997e-06);
l9_1537*=(l9_1539+((1.0-float(l9_1536))*(1.0-l9_1539)));
l9_1533=l9_1538;
l9_1529=l9_1533;
l9_1532=l9_1537;
}
l9_1473.y=l9_1529;
l9_1483=l9_1532;
float2 l9_1540=l9_1473;
int l9_1541=l9_1471;
int l9_1542=l9_1472;
float l9_1543=l9_1481;
float2 l9_1544=l9_1540;
int l9_1545=l9_1541;
int l9_1546=l9_1542;
float3 l9_1547=float3(0.0);
if (l9_1545==0)
{
l9_1547=float3(l9_1544,0.0);
}
else
{
if (l9_1545==1)
{
l9_1547=float3(l9_1544.x,(l9_1544.y*0.5)+(0.5-(float(l9_1546)*0.5)),0.0);
}
else
{
l9_1547=float3(l9_1544,float(l9_1546));
}
}
float3 l9_1548=l9_1547;
float3 l9_1549=l9_1548;
float2 l9_1550=l9_1549.xy;
float l9_1551=l9_1543;
float4 l9_1552=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_1550,bias(l9_1551));
float4 l9_1553=l9_1552;
float4 l9_1554=l9_1553;
if (l9_1479)
{
l9_1554=mix(l9_1480,l9_1554,float4(l9_1483));
}
float4 l9_1555=l9_1554;
l9_1464=l9_1555;
float4 l9_1556=l9_1464;
float3 l9_1557=(l9_1556.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_1557;
N123_SurfacePosition=float3(0.0,l9_1346,0.0)+l9_939;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_1558=tempGlobals.gTimeElapsed;
float2 l9_1559=N123_SurfacePosition.zx*N123_FBMScale;
float l9_1560=l9_1558*N123_OceanSpeed;
float l9_1561=0.0;
float2 l9_1562=l9_1559+float2(l9_1560);
float2 l9_1563=floor(l9_1562);
float2 l9_1564=fract(l9_1562);
l9_1564=(l9_1564*l9_1564)*(float2(3.0)-(l9_1564*2.0));
float2 l9_1565=l9_1563;
float l9_1566=fract(sin(dot(l9_1565,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1567=l9_1563+float2(1.0,0.0);
float l9_1568=fract(sin(dot(l9_1567,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1569=l9_1563+float2(0.0,1.0);
float l9_1570=fract(sin(dot(l9_1569,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1571=l9_1563+float2(1.0);
float l9_1572=fract(sin(dot(l9_1571,float2(12.9898,4.1413999)))*43758.547);
float l9_1573=mix(mix(l9_1566,l9_1568,l9_1564.x),mix(l9_1570,l9_1572,l9_1564.x),l9_1564.y);
float l9_1574=l9_1573*l9_1573;
l9_1561+=(0.5*l9_1574);
l9_1559=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1559)*2.02;
float2 l9_1575=l9_1559;
float2 l9_1576=floor(l9_1575);
float2 l9_1577=fract(l9_1575);
l9_1577=(l9_1577*l9_1577)*(float2(3.0)-(l9_1577*2.0));
float2 l9_1578=l9_1576;
float l9_1579=fract(sin(dot(l9_1578,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1580=l9_1576+float2(1.0,0.0);
float l9_1581=fract(sin(dot(l9_1580,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1582=l9_1576+float2(0.0,1.0);
float l9_1583=fract(sin(dot(l9_1582,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1584=l9_1576+float2(1.0);
float l9_1585=fract(sin(dot(l9_1584,float2(12.9898,4.1413999)))*43758.547);
float l9_1586=mix(mix(l9_1579,l9_1581,l9_1577.x),mix(l9_1583,l9_1585,l9_1577.x),l9_1577.y);
float l9_1587=l9_1586*l9_1586;
l9_1561+=(0.03125*l9_1587);
l9_1559=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1559)*2.01;
float2 l9_1588=l9_1559;
float2 l9_1589=floor(l9_1588);
float2 l9_1590=fract(l9_1588);
l9_1590=(l9_1590*l9_1590)*(float2(3.0)-(l9_1590*2.0));
float2 l9_1591=l9_1589;
float l9_1592=fract(sin(dot(l9_1591,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1593=l9_1589+float2(1.0,0.0);
float l9_1594=fract(sin(dot(l9_1593,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1595=l9_1589+float2(0.0,1.0);
float l9_1596=fract(sin(dot(l9_1595,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1597=l9_1589+float2(1.0);
float l9_1598=fract(sin(dot(l9_1597,float2(12.9898,4.1413999)))*43758.547);
float l9_1599=mix(mix(l9_1592,l9_1594,l9_1590.x),mix(l9_1596,l9_1598,l9_1590.x),l9_1590.y);
float l9_1600=l9_1599*l9_1599;
l9_1561+=(0.25*l9_1600);
l9_1559=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1559)*2.03;
float2 l9_1601=l9_1559;
float2 l9_1602=floor(l9_1601);
float2 l9_1603=fract(l9_1601);
l9_1603=(l9_1603*l9_1603)*(float2(3.0)-(l9_1603*2.0));
float2 l9_1604=l9_1602;
float l9_1605=fract(sin(dot(l9_1604,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1606=l9_1602+float2(1.0,0.0);
float l9_1607=fract(sin(dot(l9_1606,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1608=l9_1602+float2(0.0,1.0);
float l9_1609=fract(sin(dot(l9_1608,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1610=l9_1602+float2(1.0);
float l9_1611=fract(sin(dot(l9_1610,float2(12.9898,4.1413999)))*43758.547);
float l9_1612=mix(mix(l9_1605,l9_1607,l9_1603.x),mix(l9_1609,l9_1611,l9_1603.x),l9_1603.y);
float l9_1613=l9_1612*l9_1612;
l9_1561+=(0.125*l9_1613);
l9_1559=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1559)*2.01;
float2 l9_1614=l9_1559;
float2 l9_1615=floor(l9_1614);
float2 l9_1616=fract(l9_1614);
l9_1616=(l9_1616*l9_1616)*(float2(3.0)-(l9_1616*2.0));
float2 l9_1617=l9_1615;
float l9_1618=fract(sin(dot(l9_1617,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1619=l9_1615+float2(1.0,0.0);
float l9_1620=fract(sin(dot(l9_1619,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1621=l9_1615+float2(0.0,1.0);
float l9_1622=fract(sin(dot(l9_1621,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1623=l9_1615+float2(1.0);
float l9_1624=fract(sin(dot(l9_1623,float2(12.9898,4.1413999)))*43758.547);
float l9_1625=mix(mix(l9_1618,l9_1620,l9_1616.x),mix(l9_1622,l9_1624,l9_1616.x),l9_1616.y);
float l9_1626=l9_1625*l9_1625;
l9_1561+=(0.0625*l9_1626);
l9_1559=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1559)*2.04;
float2 l9_1627=l9_1559+float2(sin(l9_1560));
float2 l9_1628=floor(l9_1627);
float2 l9_1629=fract(l9_1627);
l9_1629=(l9_1629*l9_1629)*(float2(3.0)-(l9_1629*2.0));
float2 l9_1630=l9_1628;
float l9_1631=fract(sin(dot(l9_1630,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1632=l9_1628+float2(1.0,0.0);
float l9_1633=fract(sin(dot(l9_1632,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1634=l9_1628+float2(0.0,1.0);
float l9_1635=fract(sin(dot(l9_1634,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1636=l9_1628+float2(1.0);
float l9_1637=fract(sin(dot(l9_1636,float2(12.9898,4.1413999)))*43758.547);
float l9_1638=mix(mix(l9_1631,l9_1633,l9_1629.x),mix(l9_1635,l9_1637,l9_1629.x),l9_1629.y);
float l9_1639=l9_1638*l9_1638;
l9_1561+=(0.015625*l9_1639);
float l9_1640=l9_1561/0.96875;
tempGlobals.N123_fbm=1.0-l9_1640;
}
float3 l9_1641=N123_Normal;
float l9_1642=6.0;
float l9_1643=4.0;
float3 l9_1644=tempGlobals.VertexTangent_WorldSpace;
float3 l9_1645=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_1646=tempGlobals.VertexNormal_WorldSpace;
float3 l9_1647=float3x3(float3(l9_1644),float3(l9_1645),float3(l9_1646))*l9_1641;
float3 l9_1648=tempGlobals.ViewDirWS;
float l9_1649=abs(dot(-l9_1648,l9_1647));
float l9_1650=1.0-l9_1649;
float l9_1651=l9_1642;
float l9_1652;
if (l9_1650<=0.0)
{
l9_1652=0.0;
}
else
{
l9_1652=pow(l9_1650,l9_1651);
}
float l9_1653=l9_1652;
float l9_1654=l9_1653;
l9_1654=fast::max(l9_1654,0.0);
l9_1654*=l9_1643;
float l9_1655=l9_1654;
float l9_1656=fast::clamp(l9_1655,0.0,1.0);
float4 l9_1657=float4(0.0);
float l9_1658=0.0;
l9_1658=tempGlobals.N123_TatalHeightRemap;
float4 l9_1659=float4(0.0);
float4 l9_1660=(*sc_set0.UserUniforms).colorTrough;
l9_1659=l9_1660;
float4 l9_1661=float4(0.0);
float4 l9_1662=(*sc_set0.UserUniforms).colorMiddle;
l9_1661=l9_1662;
float4 l9_1663=float4(0.0);
float4 l9_1664=(*sc_set0.UserUniforms).colorCrest;
l9_1663=l9_1664;
float l9_1665=0.0;
l9_1665=tempGlobals.N123_fbm;
float4 l9_1666=float4(0.0);
l9_1666=mix(l9_1661,l9_1663,float4(l9_1665));
float4 l9_1667=float4(0.0);
float l9_1668=l9_1658;
float4 l9_1669=l9_1659;
float l9_1670=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_1671=l9_1659;
float l9_1672=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_1673=l9_1659;
float l9_1674=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_1675=l9_1661;
float l9_1676=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_1677=l9_1666;
float4 l9_1678=l9_1666;
l9_1668=fast::clamp(l9_1668,0.0,1.0);
float4 l9_1679;
if (l9_1668<l9_1670)
{
l9_1679=mix(l9_1669,l9_1671,float4(fast::clamp(l9_1668/l9_1670,0.0,1.0)));
}
else
{
if (l9_1668<l9_1672)
{
l9_1679=mix(l9_1671,l9_1673,float4(fast::clamp((l9_1668-l9_1670)/(l9_1672-l9_1670),0.0,1.0)));
}
else
{
if (l9_1668<l9_1674)
{
l9_1679=mix(l9_1673,l9_1675,float4(fast::clamp((l9_1668-l9_1672)/(l9_1674-l9_1672),0.0,1.0)));
}
else
{
if (l9_1668<l9_1676)
{
l9_1679=mix(l9_1675,l9_1677,float4(fast::clamp((l9_1668-l9_1674)/(l9_1676-l9_1674),0.0,1.0)));
}
else
{
l9_1679=mix(l9_1677,l9_1678,float4(fast::clamp((l9_1668-l9_1676)/(1.0-l9_1676),0.0,1.0)));
}
}
}
}
bool l9_1680=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_1681;
if (l9_1680)
{
l9_1681=!PreviewInfo.Saved;
}
else
{
l9_1681=l9_1680;
}
bool l9_1682;
if (l9_1681)
{
l9_1682=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_1682=l9_1681;
}
if (l9_1682)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_1679;
}
l9_1667=l9_1679;
l9_1657=l9_1667;
float4 l9_1683=l9_1657;
float4 l9_1684=l9_1683;
int l9_1685=0;
l9_1685=sc_DirectionalLightsCount_tmp;
int l9_1686=l9_1685;
if (l9_1686>0)
{
float l9_1687;
int l9_1688=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_1689=0;
l9_1689=sc_DirectionalLightsCount_tmp;
int l9_1690=l9_1689;
if (l9_1688<l9_1690)
{
int l9_1691=l9_1688;
float3 l9_1692=float3(0.0);
if (l9_1691<sc_DirectionalLightsCount_tmp)
{
l9_1692=-(*sc_set0.UserUniforms).sc_DirectionalLights[l9_1691].direction;
}
float3 l9_1693=l9_1692;
float3 l9_1694=l9_1693;
float l9_1695=(dot(N123_Normal,l9_1694)*0.60000002)+0.40000001;
float l9_1696=10.0;
if (l9_1695<=0.0)
{
l9_1687=0.0;
}
else
{
l9_1687=pow(l9_1695,l9_1696);
}
float l9_1697=l9_1687;
float l9_1698=fast::clamp(l9_1697,0.0,1.0);
float4 l9_1699=mix(l9_1684,l9_1226,float4(l9_1698));
float4 l9_1700=l9_1684*l9_1130;
float l9_1701=fast::max(l9_1656,l9_1462)*0.89999998;
N123_FrontFacing=mix(l9_1699,l9_1700,float4(l9_1701));
N123_BackFacing=l9_1130;
l9_1688++;
continue;
}
else
{
break;
}
}
}
l9_861=N123_BackFacing;
l9_859=l9_861;
param_3=l9_859;
param_4=param_3;
}
Output_N14=param_4;
float3 Normal_N123=float3(0.0);
ssGlobals param_7=Globals;
tempGlobals=param_7;
float3 param_6=float3(0.0);
float3 l9_1702=float3(0.0);
float3 l9_1703=float3(0.0);
float3 l9_1704=(*sc_set0.UserUniforms).oceanMin;
l9_1703=l9_1704;
l9_1702=l9_1703;
float3 l9_1705=l9_1702;
N123_OceanAabbMin=l9_1705;
float3 l9_1706=float3(0.0);
float3 l9_1707=float3(0.0);
float3 l9_1708=(*sc_set0.UserUniforms).oceanMax;
l9_1707=l9_1708;
l9_1706=l9_1707;
float3 l9_1709=l9_1706;
N123_OceanAabbMax=l9_1709;
float l9_1710=0.0;
float l9_1711=0.0;
float l9_1712=(*sc_set0.UserUniforms).speed;
l9_1711=l9_1712;
l9_1710=l9_1711;
float l9_1713=l9_1710;
N123_OceanSpeed=l9_1713;
float l9_1714=0.0;
float l9_1715=0.0;
float l9_1716=(*sc_set0.UserUniforms).enableFoam;
l9_1715=l9_1716;
l9_1714=l9_1715;
float l9_1717=l9_1714;
N123_EnableFoam=l9_1717;
float l9_1718=0.0;
float l9_1719=0.0;
float l9_1720=(*sc_set0.UserUniforms).fbmScale;
l9_1719=l9_1720;
l9_1718=l9_1719;
float l9_1721=l9_1718;
N123_FBMScale=l9_1721;
float l9_1722=0.0;
float l9_1723=0.0;
float l9_1724=(*sc_set0.UserUniforms).enableInfinite;
l9_1723=l9_1724;
l9_1722=l9_1723;
float l9_1725=l9_1722;
N123_EnableInfinite=l9_1725;
float l9_1726=0.0;
float l9_1727=0.0;
float l9_1728=(*sc_set0.UserUniforms).distortionScale;
l9_1727=l9_1728;
l9_1726=l9_1727;
float l9_1729=l9_1726;
N123_DistortionScale=l9_1729;
float l9_1730=0.0;
float l9_1731=0.0;
float l9_1732=(*sc_set0.UserUniforms).distortionIntensity;
l9_1731=l9_1732;
l9_1730=l9_1731;
float l9_1733=l9_1730;
N123_DistortionIntensity=l9_1733;
float l9_1734=0.0;
float l9_1735=0.0;
float l9_1736=(*sc_set0.UserUniforms).enableFluid;
l9_1735=l9_1736;
l9_1734=l9_1735;
float l9_1737=l9_1734;
N123_EnableFluid=l9_1737;
float2 l9_1738=float2(0.0);
float2 l9_1739=float2(0.0);
float2 l9_1740=(*sc_set0.UserUniforms).pressureRange;
l9_1739=l9_1740;
l9_1738=l9_1739;
float2 l9_1741=l9_1738;
N123_pressureRange=l9_1741;
float l9_1742=0.0;
float l9_1743=0.0;
float l9_1744=(*sc_set0.UserUniforms).fluidMul;
l9_1743=l9_1744;
l9_1742=l9_1743;
float l9_1745=l9_1742;
N123_FluidMul=l9_1745;
float2 l9_1746=float2(0.0);
float2 l9_1747=float2(0.0);
float2 l9_1748=(*sc_set0.UserUniforms).unpackVal;
l9_1747=l9_1748;
l9_1746=l9_1747;
float2 l9_1749=l9_1746;
N123_unpackVal=l9_1749;
float l9_1750=0.0;
l9_1750=tempGlobals.N123_TatalHeightRemap;
float4 l9_1751=float4(0.0);
float4 l9_1752=(*sc_set0.UserUniforms).colorTrough;
l9_1751=l9_1752;
float4 l9_1753=float4(0.0);
float4 l9_1754=(*sc_set0.UserUniforms).colorMiddle;
l9_1753=l9_1754;
float4 l9_1755=float4(0.0);
float4 l9_1756=(*sc_set0.UserUniforms).colorCrest;
l9_1755=l9_1756;
float l9_1757=0.0;
l9_1757=tempGlobals.N123_fbm;
float4 l9_1758=float4(0.0);
l9_1758=mix(l9_1753,l9_1755,float4(l9_1757));
float l9_1759=l9_1750;
float4 l9_1760=l9_1751;
float l9_1761=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_1762=l9_1751;
float l9_1763=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_1764=l9_1751;
float l9_1765=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_1766=l9_1753;
float l9_1767=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_1768=l9_1758;
float4 l9_1769=l9_1758;
l9_1759=fast::clamp(l9_1759,0.0,1.0);
float4 l9_1770;
if (l9_1759<l9_1761)
{
l9_1770=mix(l9_1760,l9_1762,float4(fast::clamp(l9_1759/l9_1761,0.0,1.0)));
}
else
{
if (l9_1759<l9_1763)
{
l9_1770=mix(l9_1762,l9_1764,float4(fast::clamp((l9_1759-l9_1761)/(l9_1763-l9_1761),0.0,1.0)));
}
else
{
if (l9_1759<l9_1765)
{
l9_1770=mix(l9_1764,l9_1766,float4(fast::clamp((l9_1759-l9_1763)/(l9_1765-l9_1763),0.0,1.0)));
}
else
{
if (l9_1759<l9_1767)
{
l9_1770=mix(l9_1766,l9_1768,float4(fast::clamp((l9_1759-l9_1765)/(l9_1767-l9_1765),0.0,1.0)));
}
else
{
l9_1770=mix(l9_1768,l9_1769,float4(fast::clamp((l9_1759-l9_1767)/(1.0-l9_1767),0.0,1.0)));
}
}
}
}
bool l9_1771=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_1772;
if (l9_1771)
{
l9_1772=!PreviewInfo.Saved;
}
else
{
l9_1772=l9_1771;
}
bool l9_1773;
if (l9_1772)
{
l9_1773=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_1773=l9_1772;
}
if (l9_1773)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_1770;
}
float2 l9_1774=tempGlobals.gScreenCoord;
float2 l9_1775=l9_1774;
float2 l9_1776=tempGlobals.Surface_UVCoord0;
float2 l9_1777=l9_1776;
float3 l9_1778=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_1779=l9_1778;
float2 l9_1780=l9_1777*N123_DistortionScale;
float4 l9_1781=float4(0.0);
int l9_1782=0;
if ((int(distortionTexHasSwappedViews_tmp)!=0))
{
int l9_1783=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1783=0;
}
else
{
l9_1783=in.varStereoViewID;
}
int l9_1784=l9_1783;
l9_1782=1-l9_1784;
}
else
{
int l9_1785=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1785=0;
}
else
{
l9_1785=in.varStereoViewID;
}
int l9_1786=l9_1785;
l9_1782=l9_1786;
}
int l9_1787=l9_1782;
int l9_1788=distortionTexLayout_tmp;
int l9_1789=l9_1787;
float2 l9_1790=l9_1780;
bool l9_1791=(int(SC_USE_UV_TRANSFORM_distortionTex_tmp)!=0);
float3x3 l9_1792=(*sc_set0.UserUniforms).distortionTexTransform;
int2 l9_1793=int2(SC_SOFTWARE_WRAP_MODE_U_distortionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_distortionTex_tmp);
bool l9_1794=(int(SC_USE_UV_MIN_MAX_distortionTex_tmp)!=0);
float4 l9_1795=(*sc_set0.UserUniforms).distortionTexUvMinMax;
bool l9_1796=(int(SC_USE_CLAMP_TO_BORDER_distortionTex_tmp)!=0);
float4 l9_1797=(*sc_set0.UserUniforms).distortionTexBorderColor;
float l9_1798=0.0;
bool l9_1799=l9_1796&&(!l9_1794);
float l9_1800=1.0;
float l9_1801=l9_1790.x;
int l9_1802=l9_1793.x;
if (l9_1802==1)
{
l9_1801=fract(l9_1801);
}
else
{
if (l9_1802==2)
{
float l9_1803=fract(l9_1801);
float l9_1804=l9_1801-l9_1803;
float l9_1805=step(0.25,fract(l9_1804*0.5));
l9_1801=mix(l9_1803,1.0-l9_1803,fast::clamp(l9_1805,0.0,1.0));
}
}
l9_1790.x=l9_1801;
float l9_1806=l9_1790.y;
int l9_1807=l9_1793.y;
if (l9_1807==1)
{
l9_1806=fract(l9_1806);
}
else
{
if (l9_1807==2)
{
float l9_1808=fract(l9_1806);
float l9_1809=l9_1806-l9_1808;
float l9_1810=step(0.25,fract(l9_1809*0.5));
l9_1806=mix(l9_1808,1.0-l9_1808,fast::clamp(l9_1810,0.0,1.0));
}
}
l9_1790.y=l9_1806;
if (l9_1794)
{
bool l9_1811=l9_1796;
bool l9_1812;
if (l9_1811)
{
l9_1812=l9_1793.x==3;
}
else
{
l9_1812=l9_1811;
}
float l9_1813=l9_1790.x;
float l9_1814=l9_1795.x;
float l9_1815=l9_1795.z;
bool l9_1816=l9_1812;
float l9_1817=l9_1800;
float l9_1818=fast::clamp(l9_1813,l9_1814,l9_1815);
float l9_1819=step(abs(l9_1813-l9_1818),9.9999997e-06);
l9_1817*=(l9_1819+((1.0-float(l9_1816))*(1.0-l9_1819)));
l9_1813=l9_1818;
l9_1790.x=l9_1813;
l9_1800=l9_1817;
bool l9_1820=l9_1796;
bool l9_1821;
if (l9_1820)
{
l9_1821=l9_1793.y==3;
}
else
{
l9_1821=l9_1820;
}
float l9_1822=l9_1790.y;
float l9_1823=l9_1795.y;
float l9_1824=l9_1795.w;
bool l9_1825=l9_1821;
float l9_1826=l9_1800;
float l9_1827=fast::clamp(l9_1822,l9_1823,l9_1824);
float l9_1828=step(abs(l9_1822-l9_1827),9.9999997e-06);
l9_1826*=(l9_1828+((1.0-float(l9_1825))*(1.0-l9_1828)));
l9_1822=l9_1827;
l9_1790.y=l9_1822;
l9_1800=l9_1826;
}
float2 l9_1829=l9_1790;
bool l9_1830=l9_1791;
float3x3 l9_1831=l9_1792;
if (l9_1830)
{
l9_1829=float2((l9_1831*float3(l9_1829,1.0)).xy);
}
float2 l9_1832=l9_1829;
float2 l9_1833=l9_1832;
float2 l9_1834=l9_1833;
l9_1790=l9_1834;
float l9_1835=l9_1790.x;
int l9_1836=l9_1793.x;
bool l9_1837=l9_1799;
float l9_1838=l9_1800;
if ((l9_1836==0)||(l9_1836==3))
{
float l9_1839=l9_1835;
float l9_1840=0.0;
float l9_1841=1.0;
bool l9_1842=l9_1837;
float l9_1843=l9_1838;
float l9_1844=fast::clamp(l9_1839,l9_1840,l9_1841);
float l9_1845=step(abs(l9_1839-l9_1844),9.9999997e-06);
l9_1843*=(l9_1845+((1.0-float(l9_1842))*(1.0-l9_1845)));
l9_1839=l9_1844;
l9_1835=l9_1839;
l9_1838=l9_1843;
}
l9_1790.x=l9_1835;
l9_1800=l9_1838;
float l9_1846=l9_1790.y;
int l9_1847=l9_1793.y;
bool l9_1848=l9_1799;
float l9_1849=l9_1800;
if ((l9_1847==0)||(l9_1847==3))
{
float l9_1850=l9_1846;
float l9_1851=0.0;
float l9_1852=1.0;
bool l9_1853=l9_1848;
float l9_1854=l9_1849;
float l9_1855=fast::clamp(l9_1850,l9_1851,l9_1852);
float l9_1856=step(abs(l9_1850-l9_1855),9.9999997e-06);
l9_1854*=(l9_1856+((1.0-float(l9_1853))*(1.0-l9_1856)));
l9_1850=l9_1855;
l9_1846=l9_1850;
l9_1849=l9_1854;
}
l9_1790.y=l9_1846;
l9_1800=l9_1849;
float2 l9_1857=l9_1790;
int l9_1858=l9_1788;
int l9_1859=l9_1789;
float l9_1860=l9_1798;
float2 l9_1861=l9_1857;
int l9_1862=l9_1858;
int l9_1863=l9_1859;
float3 l9_1864=float3(0.0);
if (l9_1862==0)
{
l9_1864=float3(l9_1861,0.0);
}
else
{
if (l9_1862==1)
{
l9_1864=float3(l9_1861.x,(l9_1861.y*0.5)+(0.5-(float(l9_1863)*0.5)),0.0);
}
else
{
l9_1864=float3(l9_1861,float(l9_1863));
}
}
float3 l9_1865=l9_1864;
float3 l9_1866=l9_1865;
float2 l9_1867=l9_1866.xy;
float l9_1868=l9_1860;
float4 l9_1869=sc_set0.distortionTex.sample(sc_set0.distortionTexSmpSC,l9_1867,bias(l9_1868));
float4 l9_1870=l9_1869;
float4 l9_1871=l9_1870;
if (l9_1796)
{
l9_1871=mix(l9_1797,l9_1871,float4(l9_1800));
}
float4 l9_1872=l9_1871;
l9_1781=l9_1872;
float4 l9_1873=l9_1781;
float2 l9_1874=l9_1873.xy;
float2 l9_1875=(((l9_1874-float2(1.0))*N123_DistortionIntensity)+l9_1775)+float2(0.30000001);
float2 l9_1876=float2(l9_1875.x-0.15000001,1.0-l9_1875.y)*0.89999998;
float4 l9_1877=float4(0.0);
int l9_1878=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1879=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1879=0;
}
else
{
l9_1879=in.varStereoViewID;
}
int l9_1880=l9_1879;
l9_1878=1-l9_1880;
}
else
{
int l9_1881=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1881=0;
}
else
{
l9_1881=in.varStereoViewID;
}
int l9_1882=l9_1881;
l9_1878=l9_1882;
}
int l9_1883=l9_1878;
int l9_1884=screenTexLayout_tmp;
int l9_1885=l9_1883;
float2 l9_1886=l9_1876;
bool l9_1887=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1888=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1889=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1890=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1891=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1892=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1893=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1894=0.0;
bool l9_1895=l9_1892&&(!l9_1890);
float l9_1896=1.0;
float l9_1897=l9_1886.x;
int l9_1898=l9_1889.x;
if (l9_1898==1)
{
l9_1897=fract(l9_1897);
}
else
{
if (l9_1898==2)
{
float l9_1899=fract(l9_1897);
float l9_1900=l9_1897-l9_1899;
float l9_1901=step(0.25,fract(l9_1900*0.5));
l9_1897=mix(l9_1899,1.0-l9_1899,fast::clamp(l9_1901,0.0,1.0));
}
}
l9_1886.x=l9_1897;
float l9_1902=l9_1886.y;
int l9_1903=l9_1889.y;
if (l9_1903==1)
{
l9_1902=fract(l9_1902);
}
else
{
if (l9_1903==2)
{
float l9_1904=fract(l9_1902);
float l9_1905=l9_1902-l9_1904;
float l9_1906=step(0.25,fract(l9_1905*0.5));
l9_1902=mix(l9_1904,1.0-l9_1904,fast::clamp(l9_1906,0.0,1.0));
}
}
l9_1886.y=l9_1902;
if (l9_1890)
{
bool l9_1907=l9_1892;
bool l9_1908;
if (l9_1907)
{
l9_1908=l9_1889.x==3;
}
else
{
l9_1908=l9_1907;
}
float l9_1909=l9_1886.x;
float l9_1910=l9_1891.x;
float l9_1911=l9_1891.z;
bool l9_1912=l9_1908;
float l9_1913=l9_1896;
float l9_1914=fast::clamp(l9_1909,l9_1910,l9_1911);
float l9_1915=step(abs(l9_1909-l9_1914),9.9999997e-06);
l9_1913*=(l9_1915+((1.0-float(l9_1912))*(1.0-l9_1915)));
l9_1909=l9_1914;
l9_1886.x=l9_1909;
l9_1896=l9_1913;
bool l9_1916=l9_1892;
bool l9_1917;
if (l9_1916)
{
l9_1917=l9_1889.y==3;
}
else
{
l9_1917=l9_1916;
}
float l9_1918=l9_1886.y;
float l9_1919=l9_1891.y;
float l9_1920=l9_1891.w;
bool l9_1921=l9_1917;
float l9_1922=l9_1896;
float l9_1923=fast::clamp(l9_1918,l9_1919,l9_1920);
float l9_1924=step(abs(l9_1918-l9_1923),9.9999997e-06);
l9_1922*=(l9_1924+((1.0-float(l9_1921))*(1.0-l9_1924)));
l9_1918=l9_1923;
l9_1886.y=l9_1918;
l9_1896=l9_1922;
}
float2 l9_1925=l9_1886;
bool l9_1926=l9_1887;
float3x3 l9_1927=l9_1888;
if (l9_1926)
{
l9_1925=float2((l9_1927*float3(l9_1925,1.0)).xy);
}
float2 l9_1928=l9_1925;
float2 l9_1929=l9_1928;
float2 l9_1930=l9_1929;
l9_1886=l9_1930;
float l9_1931=l9_1886.x;
int l9_1932=l9_1889.x;
bool l9_1933=l9_1895;
float l9_1934=l9_1896;
if ((l9_1932==0)||(l9_1932==3))
{
float l9_1935=l9_1931;
float l9_1936=0.0;
float l9_1937=1.0;
bool l9_1938=l9_1933;
float l9_1939=l9_1934;
float l9_1940=fast::clamp(l9_1935,l9_1936,l9_1937);
float l9_1941=step(abs(l9_1935-l9_1940),9.9999997e-06);
l9_1939*=(l9_1941+((1.0-float(l9_1938))*(1.0-l9_1941)));
l9_1935=l9_1940;
l9_1931=l9_1935;
l9_1934=l9_1939;
}
l9_1886.x=l9_1931;
l9_1896=l9_1934;
float l9_1942=l9_1886.y;
int l9_1943=l9_1889.y;
bool l9_1944=l9_1895;
float l9_1945=l9_1896;
if ((l9_1943==0)||(l9_1943==3))
{
float l9_1946=l9_1942;
float l9_1947=0.0;
float l9_1948=1.0;
bool l9_1949=l9_1944;
float l9_1950=l9_1945;
float l9_1951=fast::clamp(l9_1946,l9_1947,l9_1948);
float l9_1952=step(abs(l9_1946-l9_1951),9.9999997e-06);
l9_1950*=(l9_1952+((1.0-float(l9_1949))*(1.0-l9_1952)));
l9_1946=l9_1951;
l9_1942=l9_1946;
l9_1945=l9_1950;
}
l9_1886.y=l9_1942;
l9_1896=l9_1945;
float2 l9_1953=l9_1886;
int l9_1954=l9_1884;
int l9_1955=l9_1885;
float l9_1956=l9_1894;
float2 l9_1957=l9_1953;
int l9_1958=l9_1954;
int l9_1959=l9_1955;
float3 l9_1960=float3(0.0);
if (l9_1958==0)
{
l9_1960=float3(l9_1957,0.0);
}
else
{
if (l9_1958==1)
{
l9_1960=float3(l9_1957.x,(l9_1957.y*0.5)+(0.5-(float(l9_1959)*0.5)),0.0);
}
else
{
l9_1960=float3(l9_1957,float(l9_1959));
}
}
float3 l9_1961=l9_1960;
float3 l9_1962=l9_1961;
float2 l9_1963=l9_1962.xy;
float l9_1964=l9_1956;
float4 l9_1965=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1963,bias(l9_1964));
float4 l9_1966=l9_1965;
float4 l9_1967=l9_1966;
if (l9_1892)
{
l9_1967=mix(l9_1893,l9_1967,float4(l9_1896));
}
float4 l9_1968=l9_1967;
l9_1877=l9_1968;
float4 l9_1969=l9_1877;
float4 l9_1970=l9_1969;
float2 l9_1971=((l9_1875-float2(0.1))*0.5)+float2(0.1);
float2 l9_1972=l9_1971;
float4 l9_1973=float4(0.0);
int l9_1974=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1975=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1975=0;
}
else
{
l9_1975=in.varStereoViewID;
}
int l9_1976=l9_1975;
l9_1974=1-l9_1976;
}
else
{
int l9_1977=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1977=0;
}
else
{
l9_1977=in.varStereoViewID;
}
int l9_1978=l9_1977;
l9_1974=l9_1978;
}
int l9_1979=l9_1974;
int l9_1980=screenTexLayout_tmp;
int l9_1981=l9_1979;
float2 l9_1982=l9_1972;
bool l9_1983=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1984=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1985=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1986=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1987=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1988=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1989=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1990=0.0;
bool l9_1991=l9_1988&&(!l9_1986);
float l9_1992=1.0;
float l9_1993=l9_1982.x;
int l9_1994=l9_1985.x;
if (l9_1994==1)
{
l9_1993=fract(l9_1993);
}
else
{
if (l9_1994==2)
{
float l9_1995=fract(l9_1993);
float l9_1996=l9_1993-l9_1995;
float l9_1997=step(0.25,fract(l9_1996*0.5));
l9_1993=mix(l9_1995,1.0-l9_1995,fast::clamp(l9_1997,0.0,1.0));
}
}
l9_1982.x=l9_1993;
float l9_1998=l9_1982.y;
int l9_1999=l9_1985.y;
if (l9_1999==1)
{
l9_1998=fract(l9_1998);
}
else
{
if (l9_1999==2)
{
float l9_2000=fract(l9_1998);
float l9_2001=l9_1998-l9_2000;
float l9_2002=step(0.25,fract(l9_2001*0.5));
l9_1998=mix(l9_2000,1.0-l9_2000,fast::clamp(l9_2002,0.0,1.0));
}
}
l9_1982.y=l9_1998;
if (l9_1986)
{
bool l9_2003=l9_1988;
bool l9_2004;
if (l9_2003)
{
l9_2004=l9_1985.x==3;
}
else
{
l9_2004=l9_2003;
}
float l9_2005=l9_1982.x;
float l9_2006=l9_1987.x;
float l9_2007=l9_1987.z;
bool l9_2008=l9_2004;
float l9_2009=l9_1992;
float l9_2010=fast::clamp(l9_2005,l9_2006,l9_2007);
float l9_2011=step(abs(l9_2005-l9_2010),9.9999997e-06);
l9_2009*=(l9_2011+((1.0-float(l9_2008))*(1.0-l9_2011)));
l9_2005=l9_2010;
l9_1982.x=l9_2005;
l9_1992=l9_2009;
bool l9_2012=l9_1988;
bool l9_2013;
if (l9_2012)
{
l9_2013=l9_1985.y==3;
}
else
{
l9_2013=l9_2012;
}
float l9_2014=l9_1982.y;
float l9_2015=l9_1987.y;
float l9_2016=l9_1987.w;
bool l9_2017=l9_2013;
float l9_2018=l9_1992;
float l9_2019=fast::clamp(l9_2014,l9_2015,l9_2016);
float l9_2020=step(abs(l9_2014-l9_2019),9.9999997e-06);
l9_2018*=(l9_2020+((1.0-float(l9_2017))*(1.0-l9_2020)));
l9_2014=l9_2019;
l9_1982.y=l9_2014;
l9_1992=l9_2018;
}
float2 l9_2021=l9_1982;
bool l9_2022=l9_1983;
float3x3 l9_2023=l9_1984;
if (l9_2022)
{
l9_2021=float2((l9_2023*float3(l9_2021,1.0)).xy);
}
float2 l9_2024=l9_2021;
float2 l9_2025=l9_2024;
float2 l9_2026=l9_2025;
l9_1982=l9_2026;
float l9_2027=l9_1982.x;
int l9_2028=l9_1985.x;
bool l9_2029=l9_1991;
float l9_2030=l9_1992;
if ((l9_2028==0)||(l9_2028==3))
{
float l9_2031=l9_2027;
float l9_2032=0.0;
float l9_2033=1.0;
bool l9_2034=l9_2029;
float l9_2035=l9_2030;
float l9_2036=fast::clamp(l9_2031,l9_2032,l9_2033);
float l9_2037=step(abs(l9_2031-l9_2036),9.9999997e-06);
l9_2035*=(l9_2037+((1.0-float(l9_2034))*(1.0-l9_2037)));
l9_2031=l9_2036;
l9_2027=l9_2031;
l9_2030=l9_2035;
}
l9_1982.x=l9_2027;
l9_1992=l9_2030;
float l9_2038=l9_1982.y;
int l9_2039=l9_1985.y;
bool l9_2040=l9_1991;
float l9_2041=l9_1992;
if ((l9_2039==0)||(l9_2039==3))
{
float l9_2042=l9_2038;
float l9_2043=0.0;
float l9_2044=1.0;
bool l9_2045=l9_2040;
float l9_2046=l9_2041;
float l9_2047=fast::clamp(l9_2042,l9_2043,l9_2044);
float l9_2048=step(abs(l9_2042-l9_2047),9.9999997e-06);
l9_2046*=(l9_2048+((1.0-float(l9_2045))*(1.0-l9_2048)));
l9_2042=l9_2047;
l9_2038=l9_2042;
l9_2041=l9_2046;
}
l9_1982.y=l9_2038;
l9_1992=l9_2041;
float2 l9_2049=l9_1982;
int l9_2050=l9_1980;
int l9_2051=l9_1981;
float l9_2052=l9_1990;
float2 l9_2053=l9_2049;
int l9_2054=l9_2050;
int l9_2055=l9_2051;
float3 l9_2056=float3(0.0);
if (l9_2054==0)
{
l9_2056=float3(l9_2053,0.0);
}
else
{
if (l9_2054==1)
{
l9_2056=float3(l9_2053.x,(l9_2053.y*0.5)+(0.5-(float(l9_2055)*0.5)),0.0);
}
else
{
l9_2056=float3(l9_2053,float(l9_2055));
}
}
float3 l9_2057=l9_2056;
float3 l9_2058=l9_2057;
float2 l9_2059=l9_2058.xy;
float l9_2060=l9_2052;
float4 l9_2061=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_2059,bias(l9_2060));
float4 l9_2062=l9_2061;
float4 l9_2063=l9_2062;
if (l9_1988)
{
l9_2063=mix(l9_1989,l9_2063,float4(l9_1992));
}
float4 l9_2064=l9_2063;
l9_1973=l9_2064;
float4 l9_2065=l9_1973;
float4 l9_2066=l9_2065;
float2 l9_2067=l9_1777;
if (N123_EnableInfinite==1.0)
{
float2 l9_2068=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_2069=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_2070=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_2071=float2(0.0)+(((l9_2070.xz-l9_2068)*1.0)/((l9_2069-l9_2068)+float2(1e-06)));
l9_2071.y=1.0-l9_2071.y;
l9_2067=(l9_1777+l9_2071)-float2(0.5);
}
float2 l9_2072=l9_2067;
float4 l9_2073=float4(0.0);
int l9_2074=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_2075=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2075=0;
}
else
{
l9_2075=in.varStereoViewID;
}
int l9_2076=l9_2075;
l9_2074=1-l9_2076;
}
else
{
int l9_2077=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2077=0;
}
else
{
l9_2077=in.varStereoViewID;
}
int l9_2078=l9_2077;
l9_2074=l9_2078;
}
int l9_2079=l9_2074;
int l9_2080=oceanHeightmapLayout_tmp;
int l9_2081=l9_2079;
float2 l9_2082=l9_2072;
bool l9_2083=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_2084=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_2085=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_2086=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_2087=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_2088=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_2089=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_2090=0.0;
bool l9_2091=l9_2088&&(!l9_2086);
float l9_2092=1.0;
float l9_2093=l9_2082.x;
int l9_2094=l9_2085.x;
if (l9_2094==1)
{
l9_2093=fract(l9_2093);
}
else
{
if (l9_2094==2)
{
float l9_2095=fract(l9_2093);
float l9_2096=l9_2093-l9_2095;
float l9_2097=step(0.25,fract(l9_2096*0.5));
l9_2093=mix(l9_2095,1.0-l9_2095,fast::clamp(l9_2097,0.0,1.0));
}
}
l9_2082.x=l9_2093;
float l9_2098=l9_2082.y;
int l9_2099=l9_2085.y;
if (l9_2099==1)
{
l9_2098=fract(l9_2098);
}
else
{
if (l9_2099==2)
{
float l9_2100=fract(l9_2098);
float l9_2101=l9_2098-l9_2100;
float l9_2102=step(0.25,fract(l9_2101*0.5));
l9_2098=mix(l9_2100,1.0-l9_2100,fast::clamp(l9_2102,0.0,1.0));
}
}
l9_2082.y=l9_2098;
if (l9_2086)
{
bool l9_2103=l9_2088;
bool l9_2104;
if (l9_2103)
{
l9_2104=l9_2085.x==3;
}
else
{
l9_2104=l9_2103;
}
float l9_2105=l9_2082.x;
float l9_2106=l9_2087.x;
float l9_2107=l9_2087.z;
bool l9_2108=l9_2104;
float l9_2109=l9_2092;
float l9_2110=fast::clamp(l9_2105,l9_2106,l9_2107);
float l9_2111=step(abs(l9_2105-l9_2110),9.9999997e-06);
l9_2109*=(l9_2111+((1.0-float(l9_2108))*(1.0-l9_2111)));
l9_2105=l9_2110;
l9_2082.x=l9_2105;
l9_2092=l9_2109;
bool l9_2112=l9_2088;
bool l9_2113;
if (l9_2112)
{
l9_2113=l9_2085.y==3;
}
else
{
l9_2113=l9_2112;
}
float l9_2114=l9_2082.y;
float l9_2115=l9_2087.y;
float l9_2116=l9_2087.w;
bool l9_2117=l9_2113;
float l9_2118=l9_2092;
float l9_2119=fast::clamp(l9_2114,l9_2115,l9_2116);
float l9_2120=step(abs(l9_2114-l9_2119),9.9999997e-06);
l9_2118*=(l9_2120+((1.0-float(l9_2117))*(1.0-l9_2120)));
l9_2114=l9_2119;
l9_2082.y=l9_2114;
l9_2092=l9_2118;
}
float2 l9_2121=l9_2082;
bool l9_2122=l9_2083;
float3x3 l9_2123=l9_2084;
if (l9_2122)
{
l9_2121=float2((l9_2123*float3(l9_2121,1.0)).xy);
}
float2 l9_2124=l9_2121;
float2 l9_2125=l9_2124;
float2 l9_2126=l9_2125;
l9_2082=l9_2126;
float l9_2127=l9_2082.x;
int l9_2128=l9_2085.x;
bool l9_2129=l9_2091;
float l9_2130=l9_2092;
if ((l9_2128==0)||(l9_2128==3))
{
float l9_2131=l9_2127;
float l9_2132=0.0;
float l9_2133=1.0;
bool l9_2134=l9_2129;
float l9_2135=l9_2130;
float l9_2136=fast::clamp(l9_2131,l9_2132,l9_2133);
float l9_2137=step(abs(l9_2131-l9_2136),9.9999997e-06);
l9_2135*=(l9_2137+((1.0-float(l9_2134))*(1.0-l9_2137)));
l9_2131=l9_2136;
l9_2127=l9_2131;
l9_2130=l9_2135;
}
l9_2082.x=l9_2127;
l9_2092=l9_2130;
float l9_2138=l9_2082.y;
int l9_2139=l9_2085.y;
bool l9_2140=l9_2091;
float l9_2141=l9_2092;
if ((l9_2139==0)||(l9_2139==3))
{
float l9_2142=l9_2138;
float l9_2143=0.0;
float l9_2144=1.0;
bool l9_2145=l9_2140;
float l9_2146=l9_2141;
float l9_2147=fast::clamp(l9_2142,l9_2143,l9_2144);
float l9_2148=step(abs(l9_2142-l9_2147),9.9999997e-06);
l9_2146*=(l9_2148+((1.0-float(l9_2145))*(1.0-l9_2148)));
l9_2142=l9_2147;
l9_2138=l9_2142;
l9_2141=l9_2146;
}
l9_2082.y=l9_2138;
l9_2092=l9_2141;
float2 l9_2149=l9_2082;
int l9_2150=l9_2080;
int l9_2151=l9_2081;
float l9_2152=l9_2090;
float2 l9_2153=l9_2149;
int l9_2154=l9_2150;
int l9_2155=l9_2151;
float3 l9_2156=float3(0.0);
if (l9_2154==0)
{
l9_2156=float3(l9_2153,0.0);
}
else
{
if (l9_2154==1)
{
l9_2156=float3(l9_2153.x,(l9_2153.y*0.5)+(0.5-(float(l9_2155)*0.5)),0.0);
}
else
{
l9_2156=float3(l9_2153,float(l9_2155));
}
}
float3 l9_2157=l9_2156;
float3 l9_2158=l9_2157;
float2 l9_2159=l9_2158.xy;
float l9_2160=l9_2152;
float4 l9_2161=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_2159,bias(l9_2160));
float4 l9_2162=l9_2161;
float4 l9_2163=l9_2162;
if (l9_2088)
{
l9_2163=mix(l9_2089,l9_2163,float4(l9_2092));
}
float4 l9_2164=l9_2163;
l9_2073=l9_2164;
float4 l9_2165=l9_2073;
float2 l9_2166=l9_2165.xy;
float l9_2167=N123_unpackVal.x;
float l9_2168=N123_unpackVal.y;
float l9_2169=0.0;
float2 l9_2170=l9_2166;
float l9_2171=l9_2167;
float l9_2172=l9_2168;
float l9_2173=0.99998999;
float2 l9_2174=l9_2170;
#if (1)
{
l9_2174=floor((l9_2174*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_2175=dot(l9_2174,float2(1.0,0.0039215689));
float l9_2176=l9_2175;
float l9_2177=0.0;
float l9_2178=l9_2173;
float l9_2179=l9_2171;
float l9_2180=l9_2172;
float l9_2181=l9_2179+(((l9_2176-l9_2177)*(l9_2180-l9_2179))/(l9_2178-l9_2177));
float l9_2182=l9_2181;
l9_2169=l9_2182;
float l9_2183=l9_2169;
float l9_2184=l9_2183;
float l9_2185=0.0+(((l9_2184-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_2185;
float l9_2186=l9_2184;
if (N123_EnableFluid==1.0)
{
float2 l9_2187=l9_1777;
float4 l9_2188=float4(0.0);
int l9_2189=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_2190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2190=0;
}
else
{
l9_2190=in.varStereoViewID;
}
int l9_2191=l9_2190;
l9_2189=1-l9_2191;
}
else
{
int l9_2192=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2192=0;
}
else
{
l9_2192=in.varStereoViewID;
}
int l9_2193=l9_2192;
l9_2189=l9_2193;
}
int l9_2194=l9_2189;
int l9_2195=fluidPressureLayout_tmp;
int l9_2196=l9_2194;
float2 l9_2197=l9_2187;
bool l9_2198=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_2199=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_2200=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_2201=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_2202=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_2203=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_2204=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_2205=0.0;
bool l9_2206=l9_2203&&(!l9_2201);
float l9_2207=1.0;
float l9_2208=l9_2197.x;
int l9_2209=l9_2200.x;
if (l9_2209==1)
{
l9_2208=fract(l9_2208);
}
else
{
if (l9_2209==2)
{
float l9_2210=fract(l9_2208);
float l9_2211=l9_2208-l9_2210;
float l9_2212=step(0.25,fract(l9_2211*0.5));
l9_2208=mix(l9_2210,1.0-l9_2210,fast::clamp(l9_2212,0.0,1.0));
}
}
l9_2197.x=l9_2208;
float l9_2213=l9_2197.y;
int l9_2214=l9_2200.y;
if (l9_2214==1)
{
l9_2213=fract(l9_2213);
}
else
{
if (l9_2214==2)
{
float l9_2215=fract(l9_2213);
float l9_2216=l9_2213-l9_2215;
float l9_2217=step(0.25,fract(l9_2216*0.5));
l9_2213=mix(l9_2215,1.0-l9_2215,fast::clamp(l9_2217,0.0,1.0));
}
}
l9_2197.y=l9_2213;
if (l9_2201)
{
bool l9_2218=l9_2203;
bool l9_2219;
if (l9_2218)
{
l9_2219=l9_2200.x==3;
}
else
{
l9_2219=l9_2218;
}
float l9_2220=l9_2197.x;
float l9_2221=l9_2202.x;
float l9_2222=l9_2202.z;
bool l9_2223=l9_2219;
float l9_2224=l9_2207;
float l9_2225=fast::clamp(l9_2220,l9_2221,l9_2222);
float l9_2226=step(abs(l9_2220-l9_2225),9.9999997e-06);
l9_2224*=(l9_2226+((1.0-float(l9_2223))*(1.0-l9_2226)));
l9_2220=l9_2225;
l9_2197.x=l9_2220;
l9_2207=l9_2224;
bool l9_2227=l9_2203;
bool l9_2228;
if (l9_2227)
{
l9_2228=l9_2200.y==3;
}
else
{
l9_2228=l9_2227;
}
float l9_2229=l9_2197.y;
float l9_2230=l9_2202.y;
float l9_2231=l9_2202.w;
bool l9_2232=l9_2228;
float l9_2233=l9_2207;
float l9_2234=fast::clamp(l9_2229,l9_2230,l9_2231);
float l9_2235=step(abs(l9_2229-l9_2234),9.9999997e-06);
l9_2233*=(l9_2235+((1.0-float(l9_2232))*(1.0-l9_2235)));
l9_2229=l9_2234;
l9_2197.y=l9_2229;
l9_2207=l9_2233;
}
float2 l9_2236=l9_2197;
bool l9_2237=l9_2198;
float3x3 l9_2238=l9_2199;
if (l9_2237)
{
l9_2236=float2((l9_2238*float3(l9_2236,1.0)).xy);
}
float2 l9_2239=l9_2236;
float2 l9_2240=l9_2239;
float2 l9_2241=l9_2240;
l9_2197=l9_2241;
float l9_2242=l9_2197.x;
int l9_2243=l9_2200.x;
bool l9_2244=l9_2206;
float l9_2245=l9_2207;
if ((l9_2243==0)||(l9_2243==3))
{
float l9_2246=l9_2242;
float l9_2247=0.0;
float l9_2248=1.0;
bool l9_2249=l9_2244;
float l9_2250=l9_2245;
float l9_2251=fast::clamp(l9_2246,l9_2247,l9_2248);
float l9_2252=step(abs(l9_2246-l9_2251),9.9999997e-06);
l9_2250*=(l9_2252+((1.0-float(l9_2249))*(1.0-l9_2252)));
l9_2246=l9_2251;
l9_2242=l9_2246;
l9_2245=l9_2250;
}
l9_2197.x=l9_2242;
l9_2207=l9_2245;
float l9_2253=l9_2197.y;
int l9_2254=l9_2200.y;
bool l9_2255=l9_2206;
float l9_2256=l9_2207;
if ((l9_2254==0)||(l9_2254==3))
{
float l9_2257=l9_2253;
float l9_2258=0.0;
float l9_2259=1.0;
bool l9_2260=l9_2255;
float l9_2261=l9_2256;
float l9_2262=fast::clamp(l9_2257,l9_2258,l9_2259);
float l9_2263=step(abs(l9_2257-l9_2262),9.9999997e-06);
l9_2261*=(l9_2263+((1.0-float(l9_2260))*(1.0-l9_2263)));
l9_2257=l9_2262;
l9_2253=l9_2257;
l9_2256=l9_2261;
}
l9_2197.y=l9_2253;
l9_2207=l9_2256;
float2 l9_2264=l9_2197;
int l9_2265=l9_2195;
int l9_2266=l9_2196;
float l9_2267=l9_2205;
float2 l9_2268=l9_2264;
int l9_2269=l9_2265;
int l9_2270=l9_2266;
float3 l9_2271=float3(0.0);
if (l9_2269==0)
{
l9_2271=float3(l9_2268,0.0);
}
else
{
if (l9_2269==1)
{
l9_2271=float3(l9_2268.x,(l9_2268.y*0.5)+(0.5-(float(l9_2270)*0.5)),0.0);
}
else
{
l9_2271=float3(l9_2268,float(l9_2270));
}
}
float3 l9_2272=l9_2271;
float3 l9_2273=l9_2272;
float2 l9_2274=l9_2273.xy;
float l9_2275=l9_2267;
float4 l9_2276=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_2274,bias(l9_2275));
float4 l9_2277=l9_2276;
float4 l9_2278=l9_2277;
if (l9_2203)
{
l9_2278=mix(l9_2204,l9_2278,float4(l9_2207));
}
float4 l9_2279=l9_2278;
l9_2188=l9_2279;
float4 l9_2280=l9_2188;
float2 l9_2281=l9_2280.xy;
float l9_2282=N123_pressureRange.x;
float l9_2283=N123_pressureRange.y;
float l9_2284=0.0;
float2 l9_2285=l9_2281;
float l9_2286=l9_2282;
float l9_2287=l9_2283;
float l9_2288=0.99998999;
float2 l9_2289=l9_2285;
#if (1)
{
l9_2289=floor((l9_2289*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_2290=dot(l9_2289,float2(1.0,0.0039215689));
float l9_2291=l9_2290;
float l9_2292=0.0;
float l9_2293=l9_2288;
float l9_2294=l9_2286;
float l9_2295=l9_2287;
float l9_2296=l9_2294+(((l9_2291-l9_2292)*(l9_2295-l9_2294))/(l9_2293-l9_2292));
float l9_2297=l9_2296;
l9_2284=l9_2297;
float l9_2298=l9_2284;
float l9_2299=l9_2298;
float l9_2300=l9_2299*N123_FluidMul;
l9_2186=l9_2184+l9_2300;
float l9_2301=(0.0+(((fast::clamp(l9_2300,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_2301;
}
float l9_2302=fast::clamp(smoothstep(0.44999999,0.60000002,tempGlobals.N123_TatalHeightRemap),0.0,1.0);
float2 l9_2303=l9_2067;
float4 l9_2304=float4(0.0);
int l9_2305=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_2306=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2306=0;
}
else
{
l9_2306=in.varStereoViewID;
}
int l9_2307=l9_2306;
l9_2305=1-l9_2307;
}
else
{
int l9_2308=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2308=0;
}
else
{
l9_2308=in.varStereoViewID;
}
int l9_2309=l9_2308;
l9_2305=l9_2309;
}
int l9_2310=l9_2305;
int l9_2311=oceanNormalLayout_tmp;
int l9_2312=l9_2310;
float2 l9_2313=l9_2303;
bool l9_2314=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_2315=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_2316=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_2317=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_2318=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_2319=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_2320=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_2321=0.0;
bool l9_2322=l9_2319&&(!l9_2317);
float l9_2323=1.0;
float l9_2324=l9_2313.x;
int l9_2325=l9_2316.x;
if (l9_2325==1)
{
l9_2324=fract(l9_2324);
}
else
{
if (l9_2325==2)
{
float l9_2326=fract(l9_2324);
float l9_2327=l9_2324-l9_2326;
float l9_2328=step(0.25,fract(l9_2327*0.5));
l9_2324=mix(l9_2326,1.0-l9_2326,fast::clamp(l9_2328,0.0,1.0));
}
}
l9_2313.x=l9_2324;
float l9_2329=l9_2313.y;
int l9_2330=l9_2316.y;
if (l9_2330==1)
{
l9_2329=fract(l9_2329);
}
else
{
if (l9_2330==2)
{
float l9_2331=fract(l9_2329);
float l9_2332=l9_2329-l9_2331;
float l9_2333=step(0.25,fract(l9_2332*0.5));
l9_2329=mix(l9_2331,1.0-l9_2331,fast::clamp(l9_2333,0.0,1.0));
}
}
l9_2313.y=l9_2329;
if (l9_2317)
{
bool l9_2334=l9_2319;
bool l9_2335;
if (l9_2334)
{
l9_2335=l9_2316.x==3;
}
else
{
l9_2335=l9_2334;
}
float l9_2336=l9_2313.x;
float l9_2337=l9_2318.x;
float l9_2338=l9_2318.z;
bool l9_2339=l9_2335;
float l9_2340=l9_2323;
float l9_2341=fast::clamp(l9_2336,l9_2337,l9_2338);
float l9_2342=step(abs(l9_2336-l9_2341),9.9999997e-06);
l9_2340*=(l9_2342+((1.0-float(l9_2339))*(1.0-l9_2342)));
l9_2336=l9_2341;
l9_2313.x=l9_2336;
l9_2323=l9_2340;
bool l9_2343=l9_2319;
bool l9_2344;
if (l9_2343)
{
l9_2344=l9_2316.y==3;
}
else
{
l9_2344=l9_2343;
}
float l9_2345=l9_2313.y;
float l9_2346=l9_2318.y;
float l9_2347=l9_2318.w;
bool l9_2348=l9_2344;
float l9_2349=l9_2323;
float l9_2350=fast::clamp(l9_2345,l9_2346,l9_2347);
float l9_2351=step(abs(l9_2345-l9_2350),9.9999997e-06);
l9_2349*=(l9_2351+((1.0-float(l9_2348))*(1.0-l9_2351)));
l9_2345=l9_2350;
l9_2313.y=l9_2345;
l9_2323=l9_2349;
}
float2 l9_2352=l9_2313;
bool l9_2353=l9_2314;
float3x3 l9_2354=l9_2315;
if (l9_2353)
{
l9_2352=float2((l9_2354*float3(l9_2352,1.0)).xy);
}
float2 l9_2355=l9_2352;
float2 l9_2356=l9_2355;
float2 l9_2357=l9_2356;
l9_2313=l9_2357;
float l9_2358=l9_2313.x;
int l9_2359=l9_2316.x;
bool l9_2360=l9_2322;
float l9_2361=l9_2323;
if ((l9_2359==0)||(l9_2359==3))
{
float l9_2362=l9_2358;
float l9_2363=0.0;
float l9_2364=1.0;
bool l9_2365=l9_2360;
float l9_2366=l9_2361;
float l9_2367=fast::clamp(l9_2362,l9_2363,l9_2364);
float l9_2368=step(abs(l9_2362-l9_2367),9.9999997e-06);
l9_2366*=(l9_2368+((1.0-float(l9_2365))*(1.0-l9_2368)));
l9_2362=l9_2367;
l9_2358=l9_2362;
l9_2361=l9_2366;
}
l9_2313.x=l9_2358;
l9_2323=l9_2361;
float l9_2369=l9_2313.y;
int l9_2370=l9_2316.y;
bool l9_2371=l9_2322;
float l9_2372=l9_2323;
if ((l9_2370==0)||(l9_2370==3))
{
float l9_2373=l9_2369;
float l9_2374=0.0;
float l9_2375=1.0;
bool l9_2376=l9_2371;
float l9_2377=l9_2372;
float l9_2378=fast::clamp(l9_2373,l9_2374,l9_2375);
float l9_2379=step(abs(l9_2373-l9_2378),9.9999997e-06);
l9_2377*=(l9_2379+((1.0-float(l9_2376))*(1.0-l9_2379)));
l9_2373=l9_2378;
l9_2369=l9_2373;
l9_2372=l9_2377;
}
l9_2313.y=l9_2369;
l9_2323=l9_2372;
float2 l9_2380=l9_2313;
int l9_2381=l9_2311;
int l9_2382=l9_2312;
float l9_2383=l9_2321;
float2 l9_2384=l9_2380;
int l9_2385=l9_2381;
int l9_2386=l9_2382;
float3 l9_2387=float3(0.0);
if (l9_2385==0)
{
l9_2387=float3(l9_2384,0.0);
}
else
{
if (l9_2385==1)
{
l9_2387=float3(l9_2384.x,(l9_2384.y*0.5)+(0.5-(float(l9_2386)*0.5)),0.0);
}
else
{
l9_2387=float3(l9_2384,float(l9_2386));
}
}
float3 l9_2388=l9_2387;
float3 l9_2389=l9_2388;
float2 l9_2390=l9_2389.xy;
float l9_2391=l9_2383;
float4 l9_2392=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_2390,bias(l9_2391));
float4 l9_2393=l9_2392;
float4 l9_2394=l9_2393;
if (l9_2319)
{
l9_2394=mix(l9_2320,l9_2394,float4(l9_2323));
}
float4 l9_2395=l9_2394;
l9_2304=l9_2395;
float4 l9_2396=l9_2304;
float3 l9_2397=(l9_2396.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_2397;
N123_SurfacePosition=float3(0.0,l9_2186,0.0)+l9_1779;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_2398=tempGlobals.gTimeElapsed;
float2 l9_2399=N123_SurfacePosition.zx*N123_FBMScale;
float l9_2400=l9_2398*N123_OceanSpeed;
float l9_2401=0.0;
float2 l9_2402=l9_2399+float2(l9_2400);
float2 l9_2403=floor(l9_2402);
float2 l9_2404=fract(l9_2402);
l9_2404=(l9_2404*l9_2404)*(float2(3.0)-(l9_2404*2.0));
float2 l9_2405=l9_2403;
float l9_2406=fract(sin(dot(l9_2405,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2407=l9_2403+float2(1.0,0.0);
float l9_2408=fract(sin(dot(l9_2407,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2409=l9_2403+float2(0.0,1.0);
float l9_2410=fract(sin(dot(l9_2409,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2411=l9_2403+float2(1.0);
float l9_2412=fract(sin(dot(l9_2411,float2(12.9898,4.1413999)))*43758.547);
float l9_2413=mix(mix(l9_2406,l9_2408,l9_2404.x),mix(l9_2410,l9_2412,l9_2404.x),l9_2404.y);
float l9_2414=l9_2413*l9_2413;
l9_2401+=(0.5*l9_2414);
l9_2399=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_2399)*2.02;
float2 l9_2415=l9_2399;
float2 l9_2416=floor(l9_2415);
float2 l9_2417=fract(l9_2415);
l9_2417=(l9_2417*l9_2417)*(float2(3.0)-(l9_2417*2.0));
float2 l9_2418=l9_2416;
float l9_2419=fract(sin(dot(l9_2418,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2420=l9_2416+float2(1.0,0.0);
float l9_2421=fract(sin(dot(l9_2420,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2422=l9_2416+float2(0.0,1.0);
float l9_2423=fract(sin(dot(l9_2422,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2424=l9_2416+float2(1.0);
float l9_2425=fract(sin(dot(l9_2424,float2(12.9898,4.1413999)))*43758.547);
float l9_2426=mix(mix(l9_2419,l9_2421,l9_2417.x),mix(l9_2423,l9_2425,l9_2417.x),l9_2417.y);
float l9_2427=l9_2426*l9_2426;
l9_2401+=(0.03125*l9_2427);
l9_2399=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_2399)*2.01;
float2 l9_2428=l9_2399;
float2 l9_2429=floor(l9_2428);
float2 l9_2430=fract(l9_2428);
l9_2430=(l9_2430*l9_2430)*(float2(3.0)-(l9_2430*2.0));
float2 l9_2431=l9_2429;
float l9_2432=fract(sin(dot(l9_2431,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2433=l9_2429+float2(1.0,0.0);
float l9_2434=fract(sin(dot(l9_2433,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2435=l9_2429+float2(0.0,1.0);
float l9_2436=fract(sin(dot(l9_2435,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2437=l9_2429+float2(1.0);
float l9_2438=fract(sin(dot(l9_2437,float2(12.9898,4.1413999)))*43758.547);
float l9_2439=mix(mix(l9_2432,l9_2434,l9_2430.x),mix(l9_2436,l9_2438,l9_2430.x),l9_2430.y);
float l9_2440=l9_2439*l9_2439;
l9_2401+=(0.25*l9_2440);
l9_2399=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_2399)*2.03;
float2 l9_2441=l9_2399;
float2 l9_2442=floor(l9_2441);
float2 l9_2443=fract(l9_2441);
l9_2443=(l9_2443*l9_2443)*(float2(3.0)-(l9_2443*2.0));
float2 l9_2444=l9_2442;
float l9_2445=fract(sin(dot(l9_2444,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2446=l9_2442+float2(1.0,0.0);
float l9_2447=fract(sin(dot(l9_2446,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2448=l9_2442+float2(0.0,1.0);
float l9_2449=fract(sin(dot(l9_2448,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2450=l9_2442+float2(1.0);
float l9_2451=fract(sin(dot(l9_2450,float2(12.9898,4.1413999)))*43758.547);
float l9_2452=mix(mix(l9_2445,l9_2447,l9_2443.x),mix(l9_2449,l9_2451,l9_2443.x),l9_2443.y);
float l9_2453=l9_2452*l9_2452;
l9_2401+=(0.125*l9_2453);
l9_2399=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_2399)*2.01;
float2 l9_2454=l9_2399;
float2 l9_2455=floor(l9_2454);
float2 l9_2456=fract(l9_2454);
l9_2456=(l9_2456*l9_2456)*(float2(3.0)-(l9_2456*2.0));
float2 l9_2457=l9_2455;
float l9_2458=fract(sin(dot(l9_2457,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2459=l9_2455+float2(1.0,0.0);
float l9_2460=fract(sin(dot(l9_2459,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2461=l9_2455+float2(0.0,1.0);
float l9_2462=fract(sin(dot(l9_2461,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2463=l9_2455+float2(1.0);
float l9_2464=fract(sin(dot(l9_2463,float2(12.9898,4.1413999)))*43758.547);
float l9_2465=mix(mix(l9_2458,l9_2460,l9_2456.x),mix(l9_2462,l9_2464,l9_2456.x),l9_2456.y);
float l9_2466=l9_2465*l9_2465;
l9_2401+=(0.0625*l9_2466);
l9_2399=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_2399)*2.04;
float2 l9_2467=l9_2399+float2(sin(l9_2400));
float2 l9_2468=floor(l9_2467);
float2 l9_2469=fract(l9_2467);
l9_2469=(l9_2469*l9_2469)*(float2(3.0)-(l9_2469*2.0));
float2 l9_2470=l9_2468;
float l9_2471=fract(sin(dot(l9_2470,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2472=l9_2468+float2(1.0,0.0);
float l9_2473=fract(sin(dot(l9_2472,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2474=l9_2468+float2(0.0,1.0);
float l9_2475=fract(sin(dot(l9_2474,float2(12.9898,4.1413999)))*43758.547);
float2 l9_2476=l9_2468+float2(1.0);
float l9_2477=fract(sin(dot(l9_2476,float2(12.9898,4.1413999)))*43758.547);
float l9_2478=mix(mix(l9_2471,l9_2473,l9_2469.x),mix(l9_2475,l9_2477,l9_2469.x),l9_2469.y);
float l9_2479=l9_2478*l9_2478;
l9_2401+=(0.015625*l9_2479);
float l9_2480=l9_2401/0.96875;
tempGlobals.N123_fbm=1.0-l9_2480;
}
float3 l9_2481=N123_Normal;
float l9_2482=6.0;
float l9_2483=4.0;
float3 l9_2484=tempGlobals.VertexTangent_WorldSpace;
float3 l9_2485=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_2486=tempGlobals.VertexNormal_WorldSpace;
float3 l9_2487=float3x3(float3(l9_2484),float3(l9_2485),float3(l9_2486))*l9_2481;
float3 l9_2488=tempGlobals.ViewDirWS;
float l9_2489=abs(dot(-l9_2488,l9_2487));
float l9_2490=1.0-l9_2489;
float l9_2491=l9_2482;
float l9_2492;
if (l9_2490<=0.0)
{
l9_2492=0.0;
}
else
{
l9_2492=pow(l9_2490,l9_2491);
}
float l9_2493=l9_2492;
float l9_2494=l9_2493;
l9_2494=fast::max(l9_2494,0.0);
l9_2494*=l9_2483;
float l9_2495=l9_2494;
float l9_2496=fast::clamp(l9_2495,0.0,1.0);
float4 l9_2497=float4(0.0);
float l9_2498=0.0;
l9_2498=tempGlobals.N123_TatalHeightRemap;
float4 l9_2499=float4(0.0);
float4 l9_2500=(*sc_set0.UserUniforms).colorTrough;
l9_2499=l9_2500;
float4 l9_2501=float4(0.0);
float4 l9_2502=(*sc_set0.UserUniforms).colorMiddle;
l9_2501=l9_2502;
float4 l9_2503=float4(0.0);
float4 l9_2504=(*sc_set0.UserUniforms).colorCrest;
l9_2503=l9_2504;
float l9_2505=0.0;
l9_2505=tempGlobals.N123_fbm;
float4 l9_2506=float4(0.0);
l9_2506=mix(l9_2501,l9_2503,float4(l9_2505));
float4 l9_2507=float4(0.0);
float l9_2508=l9_2498;
float4 l9_2509=l9_2499;
float l9_2510=(*sc_set0.UserUniforms).Port_Position1_N030;
float4 l9_2511=l9_2499;
float l9_2512=(*sc_set0.UserUniforms).Port_Position2_N030;
float4 l9_2513=l9_2499;
float l9_2514=(*sc_set0.UserUniforms).Port_Position3_N030;
float4 l9_2515=l9_2501;
float l9_2516=(*sc_set0.UserUniforms).Port_Position4_N030;
float4 l9_2517=l9_2506;
float4 l9_2518=l9_2506;
l9_2508=fast::clamp(l9_2508,0.0,1.0);
float4 l9_2519;
if (l9_2508<l9_2510)
{
l9_2519=mix(l9_2509,l9_2511,float4(fast::clamp(l9_2508/l9_2510,0.0,1.0)));
}
else
{
if (l9_2508<l9_2512)
{
l9_2519=mix(l9_2511,l9_2513,float4(fast::clamp((l9_2508-l9_2510)/(l9_2512-l9_2510),0.0,1.0)));
}
else
{
if (l9_2508<l9_2514)
{
l9_2519=mix(l9_2513,l9_2515,float4(fast::clamp((l9_2508-l9_2512)/(l9_2514-l9_2512),0.0,1.0)));
}
else
{
if (l9_2508<l9_2516)
{
l9_2519=mix(l9_2515,l9_2517,float4(fast::clamp((l9_2508-l9_2514)/(l9_2516-l9_2514),0.0,1.0)));
}
else
{
l9_2519=mix(l9_2517,l9_2518,float4(fast::clamp((l9_2508-l9_2516)/(1.0-l9_2516),0.0,1.0)));
}
}
}
}
bool l9_2520=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_2521;
if (l9_2520)
{
l9_2521=!PreviewInfo.Saved;
}
else
{
l9_2521=l9_2520;
}
bool l9_2522;
if (l9_2521)
{
l9_2522=30==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_2522=l9_2521;
}
if (l9_2522)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_2519;
}
l9_2507=l9_2519;
l9_2497=l9_2507;
float4 l9_2523=l9_2497;
float4 l9_2524=l9_2523;
int l9_2525=0;
l9_2525=sc_DirectionalLightsCount_tmp;
int l9_2526=l9_2525;
if (l9_2526>0)
{
float l9_2527;
int l9_2528=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_2529=0;
l9_2529=sc_DirectionalLightsCount_tmp;
int l9_2530=l9_2529;
if (l9_2528<l9_2530)
{
int l9_2531=l9_2528;
float3 l9_2532=float3(0.0);
if (l9_2531<sc_DirectionalLightsCount_tmp)
{
l9_2532=-(*sc_set0.UserUniforms).sc_DirectionalLights[l9_2531].direction;
}
float3 l9_2533=l9_2532;
float3 l9_2534=l9_2533;
float l9_2535=(dot(N123_Normal,l9_2534)*0.60000002)+0.40000001;
float l9_2536=10.0;
if (l9_2535<=0.0)
{
l9_2527=0.0;
}
else
{
l9_2527=pow(l9_2535,l9_2536);
}
float l9_2537=l9_2527;
float l9_2538=fast::clamp(l9_2537,0.0,1.0);
float4 l9_2539=mix(l9_2524,l9_2066,float4(l9_2538));
float4 l9_2540=l9_2524*l9_1970;
float l9_2541=fast::max(l9_2496,l9_2302)*0.89999998;
N123_FrontFacing=mix(l9_2539,l9_2540,float4(l9_2541));
N123_BackFacing=l9_1970;
l9_2528++;
continue;
}
else
{
break;
}
}
}
param_6=N123_Normal;
Normal_N123=param_6;
float4 Output_N13=float4(0.0);
float3 param_8=Output_N14.xyz;
float param_9=(*sc_set0.UserUniforms).Port_Opacity_N013;
float3 param_10=Normal_N123;
float3 param_11=(*sc_set0.UserUniforms).Port_Emissive_N013;
float param_12=(*sc_set0.UserUniforms).Port_Metallic_N013;
float param_13=(*sc_set0.UserUniforms).Port_Roughness_N013;
float3 param_14=(*sc_set0.UserUniforms).Port_AO_N013;
float3 param_15=(*sc_set0.UserUniforms).Port_SpecularAO_N013;
ssGlobals param_17=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_17.BumpedNormal=float3x3(float3(param_17.VertexTangent_WorldSpace),float3(param_17.VertexBinormal_WorldSpace),float3(param_17.VertexNormal_WorldSpace))*param_10;
}
float l9_2542=param_9;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_2542<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_2543=gl_FragCoord;
float2 l9_2544=floor(mod(l9_2543.xy,float2(4.0)));
float l9_2545=(mod(dot(l9_2544,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_2542<l9_2545)
{
discard_fragment();
}
}
param_8=fast::max(param_8,float3(0.0));
float4 param_16;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_16=float4(param_8,param_9);
}
else
{
float3 l9_2546=param_8;
float l9_2547=param_9;
float3 l9_2548=param_17.BumpedNormal;
float3 l9_2549=param_17.PositionWS;
float3 l9_2550=param_17.ViewDirWS;
float3 l9_2551=param_11;
float l9_2552=param_12;
float l9_2553=param_13;
float3 l9_2554=param_14;
float3 l9_2555=param_15;
SurfaceProperties l9_2556;
l9_2556.albedo=float3(0.0);
l9_2556.opacity=1.0;
l9_2556.normal=float3(0.0);
l9_2556.positionWS=float3(0.0);
l9_2556.viewDirWS=float3(0.0);
l9_2556.metallic=0.0;
l9_2556.roughness=0.0;
l9_2556.emissive=float3(0.0);
l9_2556.ao=float3(1.0);
l9_2556.specularAo=float3(1.0);
l9_2556.bakedShadows=float3(1.0);
SurfaceProperties l9_2557=l9_2556;
SurfaceProperties l9_2558=l9_2557;
l9_2558.opacity=l9_2547;
float3 l9_2559=l9_2546;
float3 l9_2560;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2560=float3(pow(l9_2559.x,2.2),pow(l9_2559.y,2.2),pow(l9_2559.z,2.2));
}
else
{
l9_2560=l9_2559*l9_2559;
}
float3 l9_2561=l9_2560;
l9_2558.albedo=l9_2561;
l9_2558.normal=normalize(l9_2548);
l9_2558.positionWS=l9_2549;
l9_2558.viewDirWS=l9_2550;
float3 l9_2562=l9_2551;
float3 l9_2563;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2563=float3(pow(l9_2562.x,2.2),pow(l9_2562.y,2.2),pow(l9_2562.z,2.2));
}
else
{
l9_2563=l9_2562*l9_2562;
}
float3 l9_2564=l9_2563;
l9_2558.emissive=l9_2564;
l9_2558.metallic=l9_2552;
l9_2558.roughness=l9_2553;
l9_2558.ao=l9_2554;
l9_2558.specularAo=l9_2555;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_2565=l9_2558.positionWS;
l9_2558.ao=evaluateSSAO(l9_2565,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_2566=l9_2558;
SurfaceProperties l9_2567=l9_2566;
float3 l9_2568=mix(float3(0.039999999),l9_2567.albedo*l9_2567.metallic,float3(l9_2567.metallic));
float3 l9_2569=mix(l9_2567.albedo*(1.0-l9_2567.metallic),float3(0.0),float3(l9_2567.metallic));
l9_2566.albedo=l9_2569;
l9_2566.specColor=l9_2568;
SurfaceProperties l9_2570=l9_2566;
l9_2558=l9_2570;
SurfaceProperties l9_2571=l9_2558;
LightingComponents l9_2572;
l9_2572.directDiffuse=float3(0.0);
l9_2572.directSpecular=float3(0.0);
l9_2572.indirectDiffuse=float3(1.0);
l9_2572.indirectSpecular=float3(0.0);
l9_2572.emitted=float3(0.0);
l9_2572.transmitted=float3(0.0);
LightingComponents l9_2573=l9_2572;
LightingComponents l9_2574=l9_2573;
float3 l9_2575=l9_2571.viewDirWS;
int l9_2576=0;
float4 l9_2577=float4(l9_2571.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_2578;
LightProperties l9_2579;
int l9_2580=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2580<sc_DirectionalLightsCount_tmp)
{
l9_2578.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_2580].direction;
l9_2578.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_2580].color;
l9_2579.direction=l9_2578.direction;
l9_2579.color=l9_2578.color.xyz;
l9_2579.attenuation=l9_2578.color.w;
l9_2579.attenuation*=l9_2577[(l9_2576<3) ? l9_2576 : 3];
l9_2576++;
LightingComponents l9_2581=l9_2574;
LightProperties l9_2582=l9_2579;
SurfaceProperties l9_2583=l9_2571;
float3 l9_2584=l9_2575;
SurfaceProperties l9_2585=l9_2583;
float3 l9_2586=l9_2582.direction;
float l9_2587=dot(l9_2585.normal,l9_2586);
float l9_2588=fast::clamp(l9_2587,0.0,1.0);
float3 l9_2589=float3(l9_2588);
l9_2581.directDiffuse+=((l9_2589*l9_2582.color)*l9_2582.attenuation);
SurfaceProperties l9_2590=l9_2583;
float3 l9_2591=l9_2582.direction;
float3 l9_2592=l9_2584;
l9_2581.directSpecular+=((calculateDirectSpecular(l9_2590,l9_2591,l9_2592)*l9_2582.color)*l9_2582.attenuation);
LightingComponents l9_2593=l9_2581;
l9_2574=l9_2593;
l9_2580++;
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
sc_PointLight_t_1 l9_2594;
LightProperties l9_2595;
int l9_2596=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2596<sc_PointLightsCount_tmp)
{
l9_2594.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].falloffEnabled!=0;
l9_2594.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].falloffEndDistance;
l9_2594.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].negRcpFalloffEndDistance4;
l9_2594.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].angleScale;
l9_2594.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].angleOffset;
l9_2594.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].direction;
l9_2594.position=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].position;
l9_2594.color=(*sc_set0.UserUniforms).sc_PointLights[l9_2596].color;
float3 l9_2597=l9_2594.position-l9_2571.positionWS;
l9_2595.direction=normalize(l9_2597);
l9_2595.color=l9_2594.color.xyz;
l9_2595.attenuation=l9_2594.color.w;
l9_2595.attenuation*=l9_2577[(l9_2576<3) ? l9_2576 : 3];
float3 l9_2598=l9_2595.direction;
float3 l9_2599=l9_2594.direction;
float l9_2600=l9_2594.angleScale;
float l9_2601=l9_2594.angleOffset;
float l9_2602=dot(l9_2598,l9_2599);
float l9_2603=fast::clamp((l9_2602*l9_2600)+l9_2601,0.0,1.0);
float l9_2604=l9_2603*l9_2603;
l9_2595.attenuation*=l9_2604;
if (l9_2594.falloffEnabled)
{
float l9_2605=length(l9_2597);
float l9_2606=l9_2594.falloffEndDistance;
l9_2595.attenuation*=computeDistanceAttenuation(l9_2605,l9_2606);
}
l9_2576++;
LightingComponents l9_2607=l9_2574;
LightProperties l9_2608=l9_2595;
SurfaceProperties l9_2609=l9_2571;
float3 l9_2610=l9_2575;
SurfaceProperties l9_2611=l9_2609;
float3 l9_2612=l9_2608.direction;
float l9_2613=dot(l9_2611.normal,l9_2612);
float l9_2614=fast::clamp(l9_2613,0.0,1.0);
float3 l9_2615=float3(l9_2614);
l9_2607.directDiffuse+=((l9_2615*l9_2608.color)*l9_2608.attenuation);
SurfaceProperties l9_2616=l9_2609;
float3 l9_2617=l9_2608.direction;
float3 l9_2618=l9_2610;
l9_2607.directSpecular+=((calculateDirectSpecular(l9_2616,l9_2617,l9_2618)*l9_2608.color)*l9_2608.attenuation);
LightingComponents l9_2619=l9_2607;
l9_2574=l9_2619;
l9_2596++;
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
float3 l9_2620=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_2621=abs(in.varShadowTex-float2(0.5));
float l9_2622=fast::max(l9_2621.x,l9_2621.y);
float l9_2623=step(l9_2622,0.5);
float4 l9_2624=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_2623;
float3 l9_2625=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_2624.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_2626=l9_2624.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_2620=mix(float3(1.0),l9_2625,float3(l9_2626));
}
else
{
l9_2620=float3(1.0);
}
float3 l9_2627=l9_2620;
float3 l9_2628=l9_2627;
l9_2574.directDiffuse*=l9_2628;
l9_2574.directSpecular*=l9_2628;
}
bool l9_2629=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_2629)
{
float4 l9_2630=gl_FragCoord;
float2 l9_2631=l9_2630.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2632=l9_2631;
float2 l9_2633=l9_2632;
int l9_2634=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_2635=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2635=0;
}
else
{
l9_2635=in.varStereoViewID;
}
int l9_2636=l9_2635;
l9_2634=1-l9_2636;
}
else
{
int l9_2637=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2637=0;
}
else
{
l9_2637=in.varStereoViewID;
}
int l9_2638=l9_2637;
l9_2634=l9_2638;
}
int l9_2639=l9_2634;
float2 l9_2640=l9_2633;
int l9_2641=l9_2639;
float2 l9_2642=l9_2640;
int l9_2643=l9_2641;
float l9_2644=0.0;
float4 l9_2645=float4(0.0);
float2 l9_2646=l9_2642;
int l9_2647=sc_RayTracedShadowTextureLayout_tmp;
int l9_2648=l9_2643;
float l9_2649=l9_2644;
float2 l9_2650=l9_2646;
int l9_2651=l9_2647;
int l9_2652=l9_2648;
float3 l9_2653=float3(0.0);
if (l9_2651==0)
{
l9_2653=float3(l9_2650,0.0);
}
else
{
if (l9_2651==1)
{
l9_2653=float3(l9_2650.x,(l9_2650.y*0.5)+(0.5-(float(l9_2652)*0.5)),0.0);
}
else
{
l9_2653=float3(l9_2650,float(l9_2652));
}
}
float3 l9_2654=l9_2653;
float3 l9_2655=l9_2654;
float2 l9_2656=l9_2655.xy;
float l9_2657=l9_2649;
float4 l9_2658=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_2656,bias(l9_2657));
float4 l9_2659=l9_2658;
l9_2645=l9_2659;
float4 l9_2660=l9_2645;
float4 l9_2661=l9_2660;
float4 l9_2662=l9_2661;
float l9_2663=l9_2662.x;
float3 l9_2664=float3(l9_2663);
float3 l9_2665=l9_2664;
l9_2574.directDiffuse*=(float3(1.0)-l9_2665);
l9_2574.directSpecular*=(float3(1.0)-l9_2665);
}
SurfaceProperties l9_2666=l9_2571;
float3 l9_2667=l9_2666.normal;
float3 l9_2668=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_2669=l9_2667;
float3 l9_2670=l9_2669;
float l9_2671=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_2672=float2(0.0);
float l9_2673=l9_2670.x;
float l9_2674=-l9_2670.z;
float l9_2675=(l9_2673<0.0) ? (-1.0) : 1.0;
float l9_2676=l9_2675*acos(fast::clamp(l9_2674/length(float2(l9_2673,l9_2674)),-1.0,1.0));
l9_2672.x=l9_2676-1.5707964;
l9_2672.y=acos(l9_2670.y);
l9_2672/=float2(6.2831855,3.1415927);
l9_2672.y=1.0-l9_2672.y;
l9_2672.x+=(l9_2671/360.0);
l9_2672.x=fract((l9_2672.x+floor(l9_2672.x))+1.0);
float2 l9_2677=l9_2672;
float2 l9_2678=l9_2677;
float4 l9_2679=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_2680=l9_2678;
float2 l9_2681=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2682=5.0;
l9_2678=calcSeamlessPanoramicUvsForSampling(l9_2680,l9_2681,l9_2682);
}
float2 l9_2683=l9_2678;
float l9_2684=13.0;
int l9_2685=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2686=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2686=0;
}
else
{
l9_2686=in.varStereoViewID;
}
int l9_2687=l9_2686;
l9_2685=1-l9_2687;
}
else
{
int l9_2688=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2688=0;
}
else
{
l9_2688=in.varStereoViewID;
}
int l9_2689=l9_2688;
l9_2685=l9_2689;
}
int l9_2690=l9_2685;
float2 l9_2691=l9_2683;
int l9_2692=l9_2690;
float l9_2693=l9_2684;
float4 l9_2694=float4(0.0);
float2 l9_2695=l9_2691;
int l9_2696=sc_EnvmapSpecularLayout_tmp;
int l9_2697=l9_2692;
float l9_2698=l9_2693;
float2 l9_2699=l9_2695;
int l9_2700=l9_2696;
int l9_2701=l9_2697;
float3 l9_2702=float3(0.0);
if (l9_2700==0)
{
l9_2702=float3(l9_2699,0.0);
}
else
{
if (l9_2700==1)
{
l9_2702=float3(l9_2699.x,(l9_2699.y*0.5)+(0.5-(float(l9_2701)*0.5)),0.0);
}
else
{
l9_2702=float3(l9_2699,float(l9_2701));
}
}
float3 l9_2703=l9_2702;
float3 l9_2704=l9_2703;
float2 l9_2705=l9_2704.xy;
float l9_2706=l9_2698;
float4 l9_2707=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2705,bias(l9_2706));
float4 l9_2708=l9_2707;
l9_2694=l9_2708;
float4 l9_2709=l9_2694;
float4 l9_2710=l9_2709;
l9_2679=l9_2710;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_2711=l9_2678;
float2 l9_2712=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_2713=0.0;
l9_2678=calcSeamlessPanoramicUvsForSampling(l9_2711,l9_2712,l9_2713);
float2 l9_2714=l9_2678;
float l9_2715=-13.0;
int l9_2716=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_2717=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2717=0;
}
else
{
l9_2717=in.varStereoViewID;
}
int l9_2718=l9_2717;
l9_2716=1-l9_2718;
}
else
{
int l9_2719=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2719=0;
}
else
{
l9_2719=in.varStereoViewID;
}
int l9_2720=l9_2719;
l9_2716=l9_2720;
}
int l9_2721=l9_2716;
float2 l9_2722=l9_2714;
int l9_2723=l9_2721;
float l9_2724=l9_2715;
float4 l9_2725=float4(0.0);
float2 l9_2726=l9_2722;
int l9_2727=sc_EnvmapDiffuseLayout_tmp;
int l9_2728=l9_2723;
float l9_2729=l9_2724;
float2 l9_2730=l9_2726;
int l9_2731=l9_2727;
int l9_2732=l9_2728;
float3 l9_2733=float3(0.0);
if (l9_2731==0)
{
l9_2733=float3(l9_2730,0.0);
}
else
{
if (l9_2731==1)
{
l9_2733=float3(l9_2730.x,(l9_2730.y*0.5)+(0.5-(float(l9_2732)*0.5)),0.0);
}
else
{
l9_2733=float3(l9_2730,float(l9_2732));
}
}
float3 l9_2734=l9_2733;
float3 l9_2735=l9_2734;
float2 l9_2736=l9_2735.xy;
float l9_2737=l9_2729;
float4 l9_2738=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_2736,bias(l9_2737));
float4 l9_2739=l9_2738;
l9_2725=l9_2739;
float4 l9_2740=l9_2725;
float4 l9_2741=l9_2740;
l9_2679=l9_2741;
}
else
{
float2 l9_2742=l9_2678;
float l9_2743=13.0;
int l9_2744=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2745=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2745=0;
}
else
{
l9_2745=in.varStereoViewID;
}
int l9_2746=l9_2745;
l9_2744=1-l9_2746;
}
else
{
int l9_2747=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2747=0;
}
else
{
l9_2747=in.varStereoViewID;
}
int l9_2748=l9_2747;
l9_2744=l9_2748;
}
int l9_2749=l9_2744;
float2 l9_2750=l9_2742;
int l9_2751=l9_2749;
float l9_2752=l9_2743;
float4 l9_2753=float4(0.0);
float2 l9_2754=l9_2750;
int l9_2755=sc_EnvmapSpecularLayout_tmp;
int l9_2756=l9_2751;
float l9_2757=l9_2752;
float2 l9_2758=l9_2754;
int l9_2759=l9_2755;
int l9_2760=l9_2756;
float3 l9_2761=float3(0.0);
if (l9_2759==0)
{
l9_2761=float3(l9_2758,0.0);
}
else
{
if (l9_2759==1)
{
l9_2761=float3(l9_2758.x,(l9_2758.y*0.5)+(0.5-(float(l9_2760)*0.5)),0.0);
}
else
{
l9_2761=float3(l9_2758,float(l9_2760));
}
}
float3 l9_2762=l9_2761;
float3 l9_2763=l9_2762;
float2 l9_2764=l9_2763.xy;
float l9_2765=l9_2757;
float4 l9_2766=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2764,bias(l9_2765));
float4 l9_2767=l9_2766;
l9_2753=l9_2767;
float4 l9_2768=l9_2753;
float4 l9_2769=l9_2768;
l9_2679=l9_2769;
}
}
float4 l9_2770=l9_2679;
float3 l9_2771=l9_2770.xyz*(1.0/l9_2770.w);
float3 l9_2772=l9_2771*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_2668=l9_2772;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_2773=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_2774=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_2775=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_2776=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_2777=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_2778=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_2779=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_2780=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_2781=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_2782=-l9_2667;
float l9_2783=0.0;
l9_2783=l9_2782.x;
float l9_2784=l9_2782.y;
float l9_2785=l9_2782.z;
float l9_2786=l9_2783*l9_2783;
float l9_2787=l9_2784*l9_2784;
float l9_2788=l9_2785*l9_2785;
float l9_2789=l9_2783*l9_2784;
float l9_2790=l9_2784*l9_2785;
float l9_2791=l9_2783*l9_2785;
float3 l9_2792=((((((l9_2781*0.42904299)*(l9_2786-l9_2787))+((l9_2779*0.74312502)*l9_2788))+(l9_2773*0.88622701))-(l9_2779*0.24770799))+((((l9_2777*l9_2789)+(l9_2780*l9_2791))+(l9_2778*l9_2790))*0.85808599))+((((l9_2776*l9_2783)+(l9_2774*l9_2784))+(l9_2775*l9_2785))*1.0233279);
l9_2668=l9_2792*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_2793=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_2793)
{
float4 l9_2794=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_2668=mix(l9_2668,l9_2794.xyz,float3(l9_2794.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2668+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_2668.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2668+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_2668.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2668+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_2668.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_2795=l9_2667;
float3 l9_2796=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_2797;
float l9_2798;
int l9_2799=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2799<sc_LightEstimationSGCount_tmp)
{
l9_2797.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2799].color;
l9_2797.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2799].sharpness;
l9_2797.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2799].axis;
float3 l9_2800=l9_2795;
float l9_2801=dot(l9_2797.axis,l9_2800);
float l9_2802=l9_2797.sharpness;
float l9_2803=0.36000001;
float l9_2804=1.0/(4.0*l9_2803);
float l9_2805=exp(-l9_2802);
float l9_2806=l9_2805*l9_2805;
float l9_2807=1.0/l9_2802;
float l9_2808=(1.0+(2.0*l9_2806))-l9_2807;
float l9_2809=((l9_2805-l9_2806)*l9_2807)-l9_2806;
float l9_2810=sqrt(1.0-l9_2808);
float l9_2811=l9_2803*l9_2801;
float l9_2812=l9_2804*l9_2810;
float l9_2813=l9_2811+l9_2812;
float l9_2814=l9_2801;
float l9_2815=fast::clamp(l9_2814,0.0,1.0);
float l9_2816=l9_2815;
if (step(abs(l9_2811),l9_2812)>0.5)
{
l9_2798=(l9_2813*l9_2813)/l9_2810;
}
else
{
l9_2798=l9_2816;
}
l9_2816=l9_2798;
float l9_2817=(l9_2808*l9_2816)+l9_2809;
sc_SphericalGaussianLight_t l9_2818=l9_2797;
float3 l9_2819=(l9_2818.color/float3(l9_2818.sharpness))*6.2831855;
float3 l9_2820=(l9_2819*l9_2817)/float3(3.1415927);
l9_2796+=l9_2820;
l9_2799++;
continue;
}
else
{
break;
}
}
float3 l9_2821=l9_2796;
l9_2668+=l9_2821;
}
float3 l9_2822=l9_2668;
float3 l9_2823=l9_2822;
l9_2574.indirectDiffuse=l9_2823;
SurfaceProperties l9_2824=l9_2571;
float3 l9_2825=l9_2575;
float3 l9_2826=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_2827=l9_2824;
float3 l9_2828=l9_2825;
float3 l9_2829=l9_2827.normal;
float3 l9_2830=reflect(-l9_2828,l9_2829);
float3 l9_2831=l9_2829;
float3 l9_2832=l9_2830;
float l9_2833=l9_2827.roughness;
l9_2830=getSpecularDominantDir(l9_2831,l9_2832,l9_2833);
float l9_2834=l9_2827.roughness;
float l9_2835=pow(l9_2834,0.66666669);
float l9_2836=fast::clamp(l9_2835,0.0,1.0);
float l9_2837=l9_2836*5.0;
float l9_2838=l9_2837;
float l9_2839=l9_2838;
float3 l9_2840=l9_2830;
float l9_2841=l9_2839;
float3 l9_2842=l9_2840;
float l9_2843=l9_2841;
float4 l9_2844=float4(0.0);
float3 l9_2845=l9_2842;
float l9_2846=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_2847=float2(0.0);
float l9_2848=l9_2845.x;
float l9_2849=-l9_2845.z;
float l9_2850=(l9_2848<0.0) ? (-1.0) : 1.0;
float l9_2851=l9_2850*acos(fast::clamp(l9_2849/length(float2(l9_2848,l9_2849)),-1.0,1.0));
l9_2847.x=l9_2851-1.5707964;
l9_2847.y=acos(l9_2845.y);
l9_2847/=float2(6.2831855,3.1415927);
l9_2847.y=1.0-l9_2847.y;
l9_2847.x+=(l9_2846/360.0);
l9_2847.x=fract((l9_2847.x+floor(l9_2847.x))+1.0);
float2 l9_2852=l9_2847;
float2 l9_2853=l9_2852;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_2854=floor(l9_2843);
float l9_2855=ceil(l9_2843);
float l9_2856=l9_2843-l9_2854;
float2 l9_2857=l9_2853;
float2 l9_2858=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2859=l9_2854;
float2 l9_2860=calcSeamlessPanoramicUvsForSampling(l9_2857,l9_2858,l9_2859);
float2 l9_2861=l9_2860;
float l9_2862=l9_2854;
float2 l9_2863=l9_2861;
float l9_2864=l9_2862;
int l9_2865=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2866=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2866=0;
}
else
{
l9_2866=in.varStereoViewID;
}
int l9_2867=l9_2866;
l9_2865=1-l9_2867;
}
else
{
int l9_2868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2868=0;
}
else
{
l9_2868=in.varStereoViewID;
}
int l9_2869=l9_2868;
l9_2865=l9_2869;
}
int l9_2870=l9_2865;
float2 l9_2871=l9_2863;
int l9_2872=l9_2870;
float l9_2873=l9_2864;
float4 l9_2874=float4(0.0);
float2 l9_2875=l9_2871;
int l9_2876=sc_EnvmapSpecularLayout_tmp;
int l9_2877=l9_2872;
float l9_2878=l9_2873;
float2 l9_2879=l9_2875;
int l9_2880=l9_2876;
int l9_2881=l9_2877;
float3 l9_2882=float3(0.0);
if (l9_2880==0)
{
l9_2882=float3(l9_2879,0.0);
}
else
{
if (l9_2880==1)
{
l9_2882=float3(l9_2879.x,(l9_2879.y*0.5)+(0.5-(float(l9_2881)*0.5)),0.0);
}
else
{
l9_2882=float3(l9_2879,float(l9_2881));
}
}
float3 l9_2883=l9_2882;
float3 l9_2884=l9_2883;
float2 l9_2885=l9_2884.xy;
float l9_2886=l9_2878;
float4 l9_2887=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2885,level(l9_2886));
float4 l9_2888=l9_2887;
l9_2874=l9_2888;
float4 l9_2889=l9_2874;
float4 l9_2890=l9_2889;
float4 l9_2891=l9_2890;
float4 l9_2892=l9_2891;
float2 l9_2893=l9_2853;
float2 l9_2894=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2895=l9_2855;
float2 l9_2896=calcSeamlessPanoramicUvsForSampling(l9_2893,l9_2894,l9_2895);
float2 l9_2897=l9_2896;
float l9_2898=l9_2855;
float2 l9_2899=l9_2897;
float l9_2900=l9_2898;
int l9_2901=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2902=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2902=0;
}
else
{
l9_2902=in.varStereoViewID;
}
int l9_2903=l9_2902;
l9_2901=1-l9_2903;
}
else
{
int l9_2904=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2904=0;
}
else
{
l9_2904=in.varStereoViewID;
}
int l9_2905=l9_2904;
l9_2901=l9_2905;
}
int l9_2906=l9_2901;
float2 l9_2907=l9_2899;
int l9_2908=l9_2906;
float l9_2909=l9_2900;
float4 l9_2910=float4(0.0);
float2 l9_2911=l9_2907;
int l9_2912=sc_EnvmapSpecularLayout_tmp;
int l9_2913=l9_2908;
float l9_2914=l9_2909;
float2 l9_2915=l9_2911;
int l9_2916=l9_2912;
int l9_2917=l9_2913;
float3 l9_2918=float3(0.0);
if (l9_2916==0)
{
l9_2918=float3(l9_2915,0.0);
}
else
{
if (l9_2916==1)
{
l9_2918=float3(l9_2915.x,(l9_2915.y*0.5)+(0.5-(float(l9_2917)*0.5)),0.0);
}
else
{
l9_2918=float3(l9_2915,float(l9_2917));
}
}
float3 l9_2919=l9_2918;
float3 l9_2920=l9_2919;
float2 l9_2921=l9_2920.xy;
float l9_2922=l9_2914;
float4 l9_2923=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2921,level(l9_2922));
float4 l9_2924=l9_2923;
l9_2910=l9_2924;
float4 l9_2925=l9_2910;
float4 l9_2926=l9_2925;
float4 l9_2927=l9_2926;
float4 l9_2928=l9_2927;
l9_2844=mix(l9_2892,l9_2928,float4(l9_2856));
}
else
{
float2 l9_2929=l9_2853;
float l9_2930=l9_2843;
float2 l9_2931=l9_2929;
float l9_2932=l9_2930;
int l9_2933=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2934=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2934=0;
}
else
{
l9_2934=in.varStereoViewID;
}
int l9_2935=l9_2934;
l9_2933=1-l9_2935;
}
else
{
int l9_2936=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2936=0;
}
else
{
l9_2936=in.varStereoViewID;
}
int l9_2937=l9_2936;
l9_2933=l9_2937;
}
int l9_2938=l9_2933;
float2 l9_2939=l9_2931;
int l9_2940=l9_2938;
float l9_2941=l9_2932;
float4 l9_2942=float4(0.0);
float2 l9_2943=l9_2939;
int l9_2944=sc_EnvmapSpecularLayout_tmp;
int l9_2945=l9_2940;
float l9_2946=l9_2941;
float2 l9_2947=l9_2943;
int l9_2948=l9_2944;
int l9_2949=l9_2945;
float3 l9_2950=float3(0.0);
if (l9_2948==0)
{
l9_2950=float3(l9_2947,0.0);
}
else
{
if (l9_2948==1)
{
l9_2950=float3(l9_2947.x,(l9_2947.y*0.5)+(0.5-(float(l9_2949)*0.5)),0.0);
}
else
{
l9_2950=float3(l9_2947,float(l9_2949));
}
}
float3 l9_2951=l9_2950;
float3 l9_2952=l9_2951;
float2 l9_2953=l9_2952.xy;
float l9_2954=l9_2946;
float4 l9_2955=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2953,level(l9_2954));
float4 l9_2956=l9_2955;
l9_2942=l9_2956;
float4 l9_2957=l9_2942;
float4 l9_2958=l9_2957;
float4 l9_2959=l9_2958;
l9_2844=l9_2959;
}
float4 l9_2960=l9_2844;
float3 l9_2961=l9_2960.xyz*(1.0/l9_2960.w);
float3 l9_2962=l9_2961;
float3 l9_2963=l9_2962*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_2963+=float3(1e-06);
float3 l9_2964=l9_2963;
float3 l9_2965=l9_2964;
bool l9_2966=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_2966)
{
float4 l9_2967=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_2965=mix(l9_2965,l9_2967.xyz,float3(l9_2967.w));
}
SurfaceProperties l9_2968=l9_2827;
float l9_2969=abs(dot(l9_2829,l9_2828));
float3 l9_2970=l9_2965*envBRDFApprox(l9_2968,l9_2969);
l9_2826+=l9_2970;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_2971=l9_2824;
float3 l9_2972=l9_2825;
float l9_2973=fast::clamp(l9_2971.roughness*l9_2971.roughness,0.0099999998,1.0);
float3 l9_2974=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_2971.specColor;
sc_SphericalGaussianLight_t l9_2975;
sc_SphericalGaussianLight_t l9_2976;
sc_SphericalGaussianLight_t l9_2977;
int l9_2978=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2978<sc_LightEstimationSGCount_tmp)
{
l9_2975.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2978].color;
l9_2975.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2978].sharpness;
l9_2975.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2978].axis;
float3 l9_2979=l9_2971.normal;
float l9_2980=l9_2973;
float3 l9_2981=l9_2972;
float3 l9_2982=l9_2971.specColor;
float3 l9_2983=l9_2979;
float l9_2984=l9_2980;
l9_2976.axis=l9_2983;
float l9_2985=l9_2984*l9_2984;
l9_2976.sharpness=2.0/l9_2985;
l9_2976.color=float3(1.0/(3.1415927*l9_2985));
sc_SphericalGaussianLight_t l9_2986=l9_2976;
sc_SphericalGaussianLight_t l9_2987=l9_2986;
sc_SphericalGaussianLight_t l9_2988=l9_2987;
float3 l9_2989=l9_2981;
l9_2977.axis=reflect(-l9_2989,l9_2988.axis);
l9_2977.color=l9_2988.color;
l9_2977.sharpness=l9_2988.sharpness;
l9_2977.sharpness/=(4.0*fast::max(dot(l9_2988.axis,l9_2989),9.9999997e-05));
sc_SphericalGaussianLight_t l9_2990=l9_2977;
sc_SphericalGaussianLight_t l9_2991=l9_2990;
sc_SphericalGaussianLight_t l9_2992=l9_2991;
sc_SphericalGaussianLight_t l9_2993=l9_2975;
float l9_2994=length((l9_2992.axis*l9_2992.sharpness)+(l9_2993.axis*l9_2993.sharpness));
float3 l9_2995=(l9_2992.color*exp((l9_2994-l9_2992.sharpness)-l9_2993.sharpness))*l9_2993.color;
float l9_2996=1.0-exp((-2.0)*l9_2994);
float3 l9_2997=((l9_2995*6.2831855)*l9_2996)/float3(l9_2994);
float3 l9_2998=l9_2997;
float3 l9_2999=l9_2991.axis;
float l9_3000=l9_2980*l9_2980;
float l9_3001=dot(l9_2979,l9_2999);
float l9_3002=fast::clamp(l9_3001,0.0,1.0);
float l9_3003=l9_3002;
float l9_3004=dot(l9_2979,l9_2981);
float l9_3005=fast::clamp(l9_3004,0.0,1.0);
float l9_3006=l9_3005;
float3 l9_3007=normalize(l9_2991.axis+l9_2981);
float l9_3008=l9_3000;
float l9_3009=l9_3003;
float l9_3010=1.0/(l9_3009+sqrt(l9_3008+(((1.0-l9_3008)*l9_3009)*l9_3009)));
float l9_3011=l9_3000;
float l9_3012=l9_3006;
float l9_3013=1.0/(l9_3012+sqrt(l9_3011+(((1.0-l9_3011)*l9_3012)*l9_3012)));
l9_2998*=(l9_3010*l9_3013);
float l9_3014=dot(l9_2999,l9_3007);
float l9_3015=fast::clamp(l9_3014,0.0,1.0);
float l9_3016=pow(1.0-l9_3015,5.0);
l9_2998*=(l9_2982+((float3(1.0)-l9_2982)*l9_3016));
l9_2998*=l9_3003;
float3 l9_3017=l9_2998;
l9_2974+=l9_3017;
l9_2978++;
continue;
}
else
{
break;
}
}
float3 l9_3018=l9_2974;
l9_2826+=l9_3018;
}
float3 l9_3019=l9_2826;
l9_2574.indirectSpecular=l9_3019;
LightingComponents l9_3020=l9_2574;
LightingComponents l9_3021=l9_3020;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3021.directDiffuse=float3(0.0);
l9_3021.indirectDiffuse=float3(0.0);
float4 l9_3022=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3023=out.FragColor0;
float4 l9_3024=l9_3023;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3024.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3025=l9_3024;
l9_3022=l9_3025;
}
else
{
float4 l9_3026=gl_FragCoord;
float2 l9_3027=l9_3026.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3028=l9_3027;
float2 l9_3029=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3030=1;
int l9_3031=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3031=0;
}
else
{
l9_3031=in.varStereoViewID;
}
int l9_3032=l9_3031;
int l9_3033=l9_3032;
float3 l9_3034=float3(l9_3028,0.0);
int l9_3035=l9_3030;
int l9_3036=l9_3033;
if (l9_3035==1)
{
l9_3034.y=((2.0*l9_3034.y)+float(l9_3036))-1.0;
}
float2 l9_3037=l9_3034.xy;
l9_3029=l9_3037;
}
else
{
l9_3029=l9_3028;
}
float2 l9_3038=l9_3029;
float2 l9_3039=l9_3038;
float2 l9_3040=l9_3039;
int l9_3041=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3042=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3042=0;
}
else
{
l9_3042=in.varStereoViewID;
}
int l9_3043=l9_3042;
l9_3041=1-l9_3043;
}
else
{
int l9_3044=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3044=0;
}
else
{
l9_3044=in.varStereoViewID;
}
int l9_3045=l9_3044;
l9_3041=l9_3045;
}
int l9_3046=l9_3041;
float2 l9_3047=l9_3040;
int l9_3048=l9_3046;
float2 l9_3049=l9_3047;
int l9_3050=l9_3048;
float l9_3051=0.0;
float4 l9_3052=float4(0.0);
float2 l9_3053=l9_3049;
int l9_3054=sc_ScreenTextureLayout_tmp;
int l9_3055=l9_3050;
float l9_3056=l9_3051;
float2 l9_3057=l9_3053;
int l9_3058=l9_3054;
int l9_3059=l9_3055;
float3 l9_3060=float3(0.0);
if (l9_3058==0)
{
l9_3060=float3(l9_3057,0.0);
}
else
{
if (l9_3058==1)
{
l9_3060=float3(l9_3057.x,(l9_3057.y*0.5)+(0.5-(float(l9_3059)*0.5)),0.0);
}
else
{
l9_3060=float3(l9_3057,float(l9_3059));
}
}
float3 l9_3061=l9_3060;
float3 l9_3062=l9_3061;
float2 l9_3063=l9_3062.xy;
float l9_3064=l9_3056;
float4 l9_3065=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3063,bias(l9_3064));
float4 l9_3066=l9_3065;
l9_3052=l9_3066;
float4 l9_3067=l9_3052;
float4 l9_3068=l9_3067;
float4 l9_3069=l9_3068;
l9_3022=l9_3069;
}
float4 l9_3070=l9_3022;
float4 l9_3071=l9_3070;
float3 l9_3072=l9_3071.xyz;
float3 l9_3073;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3073=float3(pow(l9_3072.x,2.2),pow(l9_3072.y,2.2),pow(l9_3072.z,2.2));
}
else
{
l9_3073=l9_3072*l9_3072;
}
float3 l9_3074=l9_3073;
float3 l9_3075=l9_3074;
l9_3021.transmitted=l9_3075*mix(float3(1.0),l9_2558.albedo,float3(l9_2558.opacity));
l9_2558.opacity=1.0;
}
bool l9_3076=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3076=true;
}
SurfaceProperties l9_3077=l9_2558;
LightingComponents l9_3078=l9_3021;
bool l9_3079=l9_3076;
float3 l9_3080=float3(0.0);
bool l9_3081=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_3081)
{
l9_3080=l9_3077.albedo*(l9_3078.directDiffuse+(l9_3078.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_3080=l9_3077.albedo*(l9_3078.directDiffuse+(l9_3078.indirectDiffuse*l9_3077.ao));
}
float3 l9_3082=l9_3078.directSpecular+(l9_3078.indirectSpecular*l9_3077.specularAo);
float3 l9_3083=l9_3077.emissive;
float3 l9_3084=l9_3078.transmitted;
if (l9_3079)
{
float l9_3085=l9_3077.opacity;
l9_3080*=srgbToLinear(l9_3085);
}
float3 l9_3086=((l9_3080+l9_3082)+l9_3083)+l9_3084;
float3 l9_3087=l9_3086;
float4 l9_3088=float4(l9_3087,l9_2558.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_3089=l9_3088.xyz;
float l9_3090=1.8;
float l9_3091=1.4;
float l9_3092=0.5;
float l9_3093=1.5;
float3 l9_3094=(l9_3089*((l9_3089*l9_3090)+float3(l9_3091)))/((l9_3089*((l9_3089*l9_3090)+float3(l9_3092)))+float3(l9_3093));
l9_3088=float4(l9_3094.x,l9_3094.y,l9_3094.z,l9_3088.w);
}
float3 l9_3095=l9_3088.xyz;
float l9_3096=l9_3095.x;
float l9_3097=l9_3095.y;
float l9_3098=l9_3095.z;
float3 l9_3099=float3(linearToSrgb(l9_3096),linearToSrgb(l9_3097),linearToSrgb(l9_3098));
l9_3088=float4(l9_3099.x,l9_3099.y,l9_3099.z,l9_3088.w);
float4 l9_3100=l9_3088;
param_16=l9_3100;
}
param_16=fast::max(param_16,float4(0.0));
Output_N13=param_16;
float2 ScreenCoord_N36=float2(0.0);
ScreenCoord_N36=Globals.gScreenCoord;
float Depth_N35=0.0;
int l9_3101=0;
if ((int(bodyDepthTexHasSwappedViews_tmp)!=0))
{
int l9_3102=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3102=0;
}
else
{
l9_3102=in.varStereoViewID;
}
int l9_3103=l9_3102;
l9_3101=1-l9_3103;
}
else
{
int l9_3104=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3104=0;
}
else
{
l9_3104=in.varStereoViewID;
}
int l9_3105=l9_3104;
l9_3101=l9_3105;
}
int l9_3106=l9_3101;
int param_18=bodyDepthTexLayout_tmp;
int param_19=l9_3106;
float2 param_20=ScreenCoord_N36;
bool param_21=(int(SC_USE_UV_TRANSFORM_bodyDepthTex_tmp)!=0);
float3x3 param_22=(*sc_set0.UserUniforms).bodyDepthTexTransform;
int2 param_23=int2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex_tmp,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex_tmp);
bool param_24=(int(SC_USE_UV_MIN_MAX_bodyDepthTex_tmp)!=0);
float4 param_25=(*sc_set0.UserUniforms).bodyDepthTexUvMinMax;
bool param_26=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex_tmp)!=0);
float4 param_27=(*sc_set0.UserUniforms).bodyDepthTexBorderColor;
float param_28=0.0;
bool l9_3107=param_26&&(!param_24);
float l9_3108=1.0;
float l9_3109=param_20.x;
int l9_3110=param_23.x;
if (l9_3110==1)
{
l9_3109=fract(l9_3109);
}
else
{
if (l9_3110==2)
{
float l9_3111=fract(l9_3109);
float l9_3112=l9_3109-l9_3111;
float l9_3113=step(0.25,fract(l9_3112*0.5));
l9_3109=mix(l9_3111,1.0-l9_3111,fast::clamp(l9_3113,0.0,1.0));
}
}
param_20.x=l9_3109;
float l9_3114=param_20.y;
int l9_3115=param_23.y;
if (l9_3115==1)
{
l9_3114=fract(l9_3114);
}
else
{
if (l9_3115==2)
{
float l9_3116=fract(l9_3114);
float l9_3117=l9_3114-l9_3116;
float l9_3118=step(0.25,fract(l9_3117*0.5));
l9_3114=mix(l9_3116,1.0-l9_3116,fast::clamp(l9_3118,0.0,1.0));
}
}
param_20.y=l9_3114;
if (param_24)
{
bool l9_3119=param_26;
bool l9_3120;
if (l9_3119)
{
l9_3120=param_23.x==3;
}
else
{
l9_3120=l9_3119;
}
float l9_3121=param_20.x;
float l9_3122=param_25.x;
float l9_3123=param_25.z;
bool l9_3124=l9_3120;
float l9_3125=l9_3108;
float l9_3126=fast::clamp(l9_3121,l9_3122,l9_3123);
float l9_3127=step(abs(l9_3121-l9_3126),9.9999997e-06);
l9_3125*=(l9_3127+((1.0-float(l9_3124))*(1.0-l9_3127)));
l9_3121=l9_3126;
param_20.x=l9_3121;
l9_3108=l9_3125;
bool l9_3128=param_26;
bool l9_3129;
if (l9_3128)
{
l9_3129=param_23.y==3;
}
else
{
l9_3129=l9_3128;
}
float l9_3130=param_20.y;
float l9_3131=param_25.y;
float l9_3132=param_25.w;
bool l9_3133=l9_3129;
float l9_3134=l9_3108;
float l9_3135=fast::clamp(l9_3130,l9_3131,l9_3132);
float l9_3136=step(abs(l9_3130-l9_3135),9.9999997e-06);
l9_3134*=(l9_3136+((1.0-float(l9_3133))*(1.0-l9_3136)));
l9_3130=l9_3135;
param_20.y=l9_3130;
l9_3108=l9_3134;
}
float2 l9_3137=param_20;
bool l9_3138=param_21;
float3x3 l9_3139=param_22;
if (l9_3138)
{
l9_3137=float2((l9_3139*float3(l9_3137,1.0)).xy);
}
float2 l9_3140=l9_3137;
float2 l9_3141=l9_3140;
float2 l9_3142=l9_3141;
param_20=l9_3142;
float l9_3143=param_20.x;
int l9_3144=param_23.x;
bool l9_3145=l9_3107;
float l9_3146=l9_3108;
if ((l9_3144==0)||(l9_3144==3))
{
float l9_3147=l9_3143;
float l9_3148=0.0;
float l9_3149=1.0;
bool l9_3150=l9_3145;
float l9_3151=l9_3146;
float l9_3152=fast::clamp(l9_3147,l9_3148,l9_3149);
float l9_3153=step(abs(l9_3147-l9_3152),9.9999997e-06);
l9_3151*=(l9_3153+((1.0-float(l9_3150))*(1.0-l9_3153)));
l9_3147=l9_3152;
l9_3143=l9_3147;
l9_3146=l9_3151;
}
param_20.x=l9_3143;
l9_3108=l9_3146;
float l9_3154=param_20.y;
int l9_3155=param_23.y;
bool l9_3156=l9_3107;
float l9_3157=l9_3108;
if ((l9_3155==0)||(l9_3155==3))
{
float l9_3158=l9_3154;
float l9_3159=0.0;
float l9_3160=1.0;
bool l9_3161=l9_3156;
float l9_3162=l9_3157;
float l9_3163=fast::clamp(l9_3158,l9_3159,l9_3160);
float l9_3164=step(abs(l9_3158-l9_3163),9.9999997e-06);
l9_3162*=(l9_3164+((1.0-float(l9_3161))*(1.0-l9_3164)));
l9_3158=l9_3163;
l9_3154=l9_3158;
l9_3157=l9_3162;
}
param_20.y=l9_3154;
l9_3108=l9_3157;
float2 l9_3165=param_20;
int l9_3166=param_18;
int l9_3167=param_19;
float l9_3168=param_28;
float2 l9_3169=l9_3165;
int l9_3170=l9_3166;
int l9_3171=l9_3167;
float3 l9_3172=float3(0.0);
if (l9_3170==0)
{
l9_3172=float3(l9_3169,0.0);
}
else
{
if (l9_3170==1)
{
l9_3172=float3(l9_3169.x,(l9_3169.y*0.5)+(0.5-(float(l9_3171)*0.5)),0.0);
}
else
{
l9_3172=float3(l9_3169,float(l9_3171));
}
}
float3 l9_3173=l9_3172;
float3 l9_3174=l9_3173;
float2 l9_3175=l9_3174.xy;
float l9_3176=l9_3168;
float4 l9_3177=sc_set0.bodyDepthTex.sample(sc_set0.bodyDepthTexSmpSC,l9_3175,bias(l9_3176));
float4 l9_3178=l9_3177;
float4 l9_3179=l9_3178;
if (param_26)
{
l9_3179=mix(param_27,l9_3179,float4(l9_3108));
}
float4 l9_3180=l9_3179;
float param_29=l9_3180.x;
float4 param_30=(*sc_set0.UserUniforms).bodyDepthTexProjectionMatrixTerms;
float l9_3181=param_30.x;
float l9_3182=param_30.y;
bool l9_3183=param_30.z==0.0;
param_29=(param_29*2.0)-1.0;
float l9_3184;
if (l9_3183)
{
l9_3184=(param_29-l9_3182)/l9_3181;
}
else
{
l9_3184=l9_3182/((-param_29)-l9_3181);
}
float l9_3185=l9_3184;
Depth_N35=l9_3185;
float Depth_N37=0.0;
float l9_3186=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.x;
float l9_3187=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.y;
float4 l9_3188=gl_FragCoord;
float param_31=(l9_3187*l9_3186)/(l9_3187+(l9_3188.z*(l9_3186-l9_3187)));
Depth_N37=param_31;
float4 Result_N34=float4(0.0);
float param_32=Output_N40;
float4 param_33=Output_N13;
float param_34=Depth_N35;
float param_35=Depth_N37;
ssGlobals param_37=Globals;
tempGlobals=param_37;
float4 param_36=float4(0.0);
N34_EnableBodyDepth=param_32;
N34_OceanColor=param_33;
N34_BodyDepth=param_34;
N34_cameraDepth=param_35;
float l9_3189=N34_BodyDepth-(1.0-N34_cameraDepth);
float l9_3190=l9_3189*0.039999999;
float l9_3191=30.0;
float l9_3192;
if (l9_3190<=0.0)
{
l9_3192=0.0;
}
else
{
l9_3192=pow(l9_3190,l9_3191);
}
float l9_3193=l9_3192;
l9_3189=1.0-fast::clamp(l9_3193,0.0,1.0);
N34_Result=mix(N34_OceanColor,float4(N34_OceanColor.xyz,l9_3189),float4(N34_EnableBodyDepth));
if (!(SC_DEVICE_CLASS_tmp>=2))
{
N34_Result=N34_OceanColor;
}
else
{
}
param_36=N34_Result;
Result_N34=param_36;
FinalColor=Result_N34;
float4 param_38=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_3194=param_38;
float4 l9_3195=l9_3194;
float l9_3196=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3196=l9_3195.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3196=fast::clamp(l9_3195.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3196=fast::clamp(dot(l9_3195.xyz,float3(l9_3195.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_3196=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_3196=(1.0-dot(l9_3195.xyz,float3(0.33333001)))*l9_3195.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3196=(1.0-fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0))*l9_3195.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3196=fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0)*l9_3195.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_3196=fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3196=fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0)*l9_3195.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_3196=dot(l9_3195.xyz,float3(0.33333001))*l9_3195.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_3196=1.0-fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_3196=fast::clamp(dot(l9_3195.xyz,float3(1.0)),0.0,1.0);
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
float l9_3197=l9_3196;
float l9_3198=l9_3197;
float l9_3199=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_3198;
float3 l9_3200=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_3194.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_3201=float4(l9_3200.x,l9_3200.y,l9_3200.z,l9_3199);
param_38=l9_3201;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_38=float4(param_38.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_3202=param_38;
float4 l9_3203=float4(0.0);
float4 l9_3204=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3205=out.FragColor0;
float4 l9_3206=l9_3205;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3206.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3207=l9_3206;
l9_3204=l9_3207;
}
else
{
float4 l9_3208=gl_FragCoord;
float2 l9_3209=l9_3208.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3210=l9_3209;
float2 l9_3211=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3212=1;
int l9_3213=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3213=0;
}
else
{
l9_3213=in.varStereoViewID;
}
int l9_3214=l9_3213;
int l9_3215=l9_3214;
float3 l9_3216=float3(l9_3210,0.0);
int l9_3217=l9_3212;
int l9_3218=l9_3215;
if (l9_3217==1)
{
l9_3216.y=((2.0*l9_3216.y)+float(l9_3218))-1.0;
}
float2 l9_3219=l9_3216.xy;
l9_3211=l9_3219;
}
else
{
l9_3211=l9_3210;
}
float2 l9_3220=l9_3211;
float2 l9_3221=l9_3220;
float2 l9_3222=l9_3221;
int l9_3223=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3224=0;
}
else
{
l9_3224=in.varStereoViewID;
}
int l9_3225=l9_3224;
l9_3223=1-l9_3225;
}
else
{
int l9_3226=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3226=0;
}
else
{
l9_3226=in.varStereoViewID;
}
int l9_3227=l9_3226;
l9_3223=l9_3227;
}
int l9_3228=l9_3223;
float2 l9_3229=l9_3222;
int l9_3230=l9_3228;
float2 l9_3231=l9_3229;
int l9_3232=l9_3230;
float l9_3233=0.0;
float4 l9_3234=float4(0.0);
float2 l9_3235=l9_3231;
int l9_3236=sc_ScreenTextureLayout_tmp;
int l9_3237=l9_3232;
float l9_3238=l9_3233;
float2 l9_3239=l9_3235;
int l9_3240=l9_3236;
int l9_3241=l9_3237;
float3 l9_3242=float3(0.0);
if (l9_3240==0)
{
l9_3242=float3(l9_3239,0.0);
}
else
{
if (l9_3240==1)
{
l9_3242=float3(l9_3239.x,(l9_3239.y*0.5)+(0.5-(float(l9_3241)*0.5)),0.0);
}
else
{
l9_3242=float3(l9_3239,float(l9_3241));
}
}
float3 l9_3243=l9_3242;
float3 l9_3244=l9_3243;
float2 l9_3245=l9_3244.xy;
float l9_3246=l9_3238;
float4 l9_3247=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3245,bias(l9_3246));
float4 l9_3248=l9_3247;
l9_3234=l9_3248;
float4 l9_3249=l9_3234;
float4 l9_3250=l9_3249;
float4 l9_3251=l9_3250;
l9_3204=l9_3251;
}
float4 l9_3252=l9_3204;
float4 l9_3253=l9_3252;
float3 l9_3254=l9_3253.xyz;
float3 l9_3255=l9_3254;
float3 l9_3256=l9_3202.xyz;
float3 l9_3257=definedBlend(l9_3255,l9_3256,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_3203=float4(l9_3257.x,l9_3257.y,l9_3257.z,l9_3203.w);
float3 l9_3258=mix(l9_3254,l9_3203.xyz,float3(l9_3202.w));
l9_3203=float4(l9_3258.x,l9_3258.y,l9_3258.z,l9_3203.w);
l9_3203.w=1.0;
float4 l9_3259=l9_3203;
param_38=l9_3259;
}
else
{
float4 l9_3260=param_38;
float4 l9_3261=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3261=float4(mix(float3(1.0),l9_3260.xyz,float3(l9_3260.w)),l9_3260.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3262=l9_3260.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3262=fast::clamp(l9_3262,0.0,1.0);
}
l9_3261=float4(l9_3260.xyz*l9_3262,l9_3262);
}
else
{
l9_3261=l9_3260;
}
}
float4 l9_3263=l9_3261;
param_38=l9_3263;
}
}
}
float4 l9_3264=param_38;
FinalColor=l9_3264;
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
float4 l9_3265=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3265=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3265=float4(0.0);
}
float4 l9_3266=l9_3265;
float4 Cost=l9_3266;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_39=in.varPos;
float4 param_40=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_39,param_40,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_41=FinalColor;
float4 l9_3267=param_41;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_3267.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_3267;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float N123_fbm;
float N123_TatalHeightRemap;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float gFrontFacing;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
float2 gScreenCoord;
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
float3 oceanMin;
float3 oceanMax;
float speed;
float enableFoam;
float fbmScale;
float enableInfinite;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float4 distortionTexSize;
float4 distortionTexDims;
float4 distortionTexView;
float3x3 distortionTexTransform;
float4 distortionTexUvMinMax;
float4 distortionTexBorderColor;
float distortionScale;
float distortionIntensity;
float4 oceanHeightmapSize;
float4 oceanHeightmapDims;
float4 oceanHeightmapView;
float3x3 oceanHeightmapTransform;
float4 oceanHeightmapUvMinMax;
float4 oceanHeightmapBorderColor;
float4 oceanNormalSize;
float4 oceanNormalDims;
float4 oceanNormalView;
float3x3 oceanNormalTransform;
float4 oceanNormalUvMinMax;
float4 oceanNormalBorderColor;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float2 unpackVal;
float4 colorTrough;
float4 colorMiddle;
float4 colorCrest;
float bodyIntersection;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_Position1_N030;
float Port_Position2_N030;
float Port_Position3_N030;
float Port_Position4_N030;
float Port_Opacity_N013;
float3 Port_Emissive_N013;
float Port_Metallic_N013;
float Port_Roughness_N013;
float3 Port_AO_N013;
float3 Port_SpecularAO_N013;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> bodyDepthTex [[id(1)]];
texture2d<float> distortionTex [[id(2)]];
texture2d<float> fluidPressure [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> oceanHeightmap [[id(5)]];
texture2d<float> oceanNormal [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
texture2d<float> sc_ShadowTexture [[id(23)]];
texture2d<float> screenTex [[id(25)]];
sampler bodyDepthTexSmpSC [[id(26)]];
sampler distortionTexSmpSC [[id(27)]];
sampler fluidPressureSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler oceanHeightmapSmpSC [[id(30)]];
sampler oceanNormalSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler screenTexSmpSC [[id(43)]];
constant userUniformsObj* UserUniforms [[id(44)]];
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
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]],bool gl_FrontFacing [[front_facing]])
{
main_recv_out out={};
float3 N123_OceanAabbMin=float3(0.0);
float3 N123_OceanAabbMax=float3(0.0);
float N123_OceanSpeed=0.0;
float N123_EnableFoam=0.0;
float N123_FBMScale=0.0;
float N123_EnableInfinite=0.0;
float N123_EnableFluid=0.0;
float2 N123_pressureRange=float2(0.0);
float N123_FluidMul=0.0;
float2 N123_unpackVal=float2(0.0);
float3 N123_Normal=float3(0.0);
float3 N123_SurfacePosition=float3(0.0);
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
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
bool l9_0=gl_FrontFacing;
Globals.gFrontFacing=float(l9_0);
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3=l9_2;
float2 l9_4=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_5=1;
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=in.varStereoViewID;
}
int l9_7=l9_6;
int l9_8=l9_7;
float3 l9_9=float3(l9_3,0.0);
int l9_10=l9_5;
int l9_11=l9_8;
if (l9_10==1)
{
l9_9.y=((2.0*l9_9.y)+float(l9_11))-1.0;
}
float2 l9_12=l9_9.xy;
l9_4=l9_12;
}
else
{
l9_4=l9_3;
}
float2 l9_13=l9_4;
float2 l9_14=l9_13;
Globals.gScreenCoord=l9_14;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float param=1.0;
ssGlobals param_1=Globals;
float l9_15=0.0;
l9_15=param_1.gFrontFacing;
param=l9_15;
ssGlobals tempGlobals;
if ((param*1.0)!=0.0)
{
ssGlobals l9_16=param_1;
tempGlobals=l9_16;
float3 l9_17=float3(0.0);
float3 l9_18=float3(0.0);
float3 l9_19=(*sc_set0.UserUniforms).oceanMin;
l9_18=l9_19;
l9_17=l9_18;
float3 l9_20=l9_17;
N123_OceanAabbMin=l9_20;
float3 l9_21=float3(0.0);
float3 l9_22=float3(0.0);
float3 l9_23=(*sc_set0.UserUniforms).oceanMax;
l9_22=l9_23;
l9_21=l9_22;
float3 l9_24=l9_21;
N123_OceanAabbMax=l9_24;
float l9_25=0.0;
float l9_26=0.0;
float l9_27=(*sc_set0.UserUniforms).speed;
l9_26=l9_27;
l9_25=l9_26;
float l9_28=l9_25;
N123_OceanSpeed=l9_28;
float l9_29=0.0;
float l9_30=0.0;
float l9_31=(*sc_set0.UserUniforms).enableFoam;
l9_30=l9_31;
l9_29=l9_30;
float l9_32=l9_29;
N123_EnableFoam=l9_32;
float l9_33=0.0;
float l9_34=0.0;
float l9_35=(*sc_set0.UserUniforms).fbmScale;
l9_34=l9_35;
l9_33=l9_34;
float l9_36=l9_33;
N123_FBMScale=l9_36;
float l9_37=0.0;
float l9_38=0.0;
float l9_39=(*sc_set0.UserUniforms).enableInfinite;
l9_38=l9_39;
l9_37=l9_38;
float l9_40=l9_37;
N123_EnableInfinite=l9_40;
float l9_41=0.0;
float l9_42=0.0;
float l9_43=(*sc_set0.UserUniforms).enableFluid;
l9_42=l9_43;
l9_41=l9_42;
float l9_44=l9_41;
N123_EnableFluid=l9_44;
float2 l9_45=float2(0.0);
float2 l9_46=float2(0.0);
float2 l9_47=(*sc_set0.UserUniforms).pressureRange;
l9_46=l9_47;
l9_45=l9_46;
float2 l9_48=l9_45;
N123_pressureRange=l9_48;
float l9_49=0.0;
float l9_50=0.0;
float l9_51=(*sc_set0.UserUniforms).fluidMul;
l9_50=l9_51;
l9_49=l9_50;
float l9_52=l9_49;
N123_FluidMul=l9_52;
float2 l9_53=float2(0.0);
float2 l9_54=float2(0.0);
float2 l9_55=(*sc_set0.UserUniforms).unpackVal;
l9_54=l9_55;
l9_53=l9_54;
float2 l9_56=l9_53;
N123_unpackVal=l9_56;
float2 l9_57=tempGlobals.Surface_UVCoord0;
float2 l9_58=l9_57;
float3 l9_59=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_60=l9_59;
float2 l9_61=l9_58;
if (N123_EnableInfinite==1.0)
{
float2 l9_62=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_63=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_64=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_65=float2(0.0)+(((l9_64.xz-l9_62)*1.0)/((l9_63-l9_62)+float2(1e-06)));
l9_65.y=1.0-l9_65.y;
l9_61=(l9_58+l9_65)-float2(0.5);
}
float2 l9_66=l9_61;
float4 l9_67=float4(0.0);
int l9_68=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_69=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_69=0;
}
else
{
l9_69=in.varStereoViewID;
}
int l9_70=l9_69;
l9_68=1-l9_70;
}
else
{
int l9_71=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_71=0;
}
else
{
l9_71=in.varStereoViewID;
}
int l9_72=l9_71;
l9_68=l9_72;
}
int l9_73=l9_68;
int l9_74=oceanHeightmapLayout_tmp;
int l9_75=l9_73;
float2 l9_76=l9_66;
bool l9_77=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_78=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_79=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_80=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_81=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_82=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_83=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_84=0.0;
bool l9_85=l9_82&&(!l9_80);
float l9_86=1.0;
float l9_87=l9_76.x;
int l9_88=l9_79.x;
if (l9_88==1)
{
l9_87=fract(l9_87);
}
else
{
if (l9_88==2)
{
float l9_89=fract(l9_87);
float l9_90=l9_87-l9_89;
float l9_91=step(0.25,fract(l9_90*0.5));
l9_87=mix(l9_89,1.0-l9_89,fast::clamp(l9_91,0.0,1.0));
}
}
l9_76.x=l9_87;
float l9_92=l9_76.y;
int l9_93=l9_79.y;
if (l9_93==1)
{
l9_92=fract(l9_92);
}
else
{
if (l9_93==2)
{
float l9_94=fract(l9_92);
float l9_95=l9_92-l9_94;
float l9_96=step(0.25,fract(l9_95*0.5));
l9_92=mix(l9_94,1.0-l9_94,fast::clamp(l9_96,0.0,1.0));
}
}
l9_76.y=l9_92;
if (l9_80)
{
bool l9_97=l9_82;
bool l9_98;
if (l9_97)
{
l9_98=l9_79.x==3;
}
else
{
l9_98=l9_97;
}
float l9_99=l9_76.x;
float l9_100=l9_81.x;
float l9_101=l9_81.z;
bool l9_102=l9_98;
float l9_103=l9_86;
float l9_104=fast::clamp(l9_99,l9_100,l9_101);
float l9_105=step(abs(l9_99-l9_104),9.9999997e-06);
l9_103*=(l9_105+((1.0-float(l9_102))*(1.0-l9_105)));
l9_99=l9_104;
l9_76.x=l9_99;
l9_86=l9_103;
bool l9_106=l9_82;
bool l9_107;
if (l9_106)
{
l9_107=l9_79.y==3;
}
else
{
l9_107=l9_106;
}
float l9_108=l9_76.y;
float l9_109=l9_81.y;
float l9_110=l9_81.w;
bool l9_111=l9_107;
float l9_112=l9_86;
float l9_113=fast::clamp(l9_108,l9_109,l9_110);
float l9_114=step(abs(l9_108-l9_113),9.9999997e-06);
l9_112*=(l9_114+((1.0-float(l9_111))*(1.0-l9_114)));
l9_108=l9_113;
l9_76.y=l9_108;
l9_86=l9_112;
}
float2 l9_115=l9_76;
bool l9_116=l9_77;
float3x3 l9_117=l9_78;
if (l9_116)
{
l9_115=float2((l9_117*float3(l9_115,1.0)).xy);
}
float2 l9_118=l9_115;
float2 l9_119=l9_118;
float2 l9_120=l9_119;
l9_76=l9_120;
float l9_121=l9_76.x;
int l9_122=l9_79.x;
bool l9_123=l9_85;
float l9_124=l9_86;
if ((l9_122==0)||(l9_122==3))
{
float l9_125=l9_121;
float l9_126=0.0;
float l9_127=1.0;
bool l9_128=l9_123;
float l9_129=l9_124;
float l9_130=fast::clamp(l9_125,l9_126,l9_127);
float l9_131=step(abs(l9_125-l9_130),9.9999997e-06);
l9_129*=(l9_131+((1.0-float(l9_128))*(1.0-l9_131)));
l9_125=l9_130;
l9_121=l9_125;
l9_124=l9_129;
}
l9_76.x=l9_121;
l9_86=l9_124;
float l9_132=l9_76.y;
int l9_133=l9_79.y;
bool l9_134=l9_85;
float l9_135=l9_86;
if ((l9_133==0)||(l9_133==3))
{
float l9_136=l9_132;
float l9_137=0.0;
float l9_138=1.0;
bool l9_139=l9_134;
float l9_140=l9_135;
float l9_141=fast::clamp(l9_136,l9_137,l9_138);
float l9_142=step(abs(l9_136-l9_141),9.9999997e-06);
l9_140*=(l9_142+((1.0-float(l9_139))*(1.0-l9_142)));
l9_136=l9_141;
l9_132=l9_136;
l9_135=l9_140;
}
l9_76.y=l9_132;
l9_86=l9_135;
float2 l9_143=l9_76;
int l9_144=l9_74;
int l9_145=l9_75;
float l9_146=l9_84;
float2 l9_147=l9_143;
int l9_148=l9_144;
int l9_149=l9_145;
float3 l9_150=float3(0.0);
if (l9_148==0)
{
l9_150=float3(l9_147,0.0);
}
else
{
if (l9_148==1)
{
l9_150=float3(l9_147.x,(l9_147.y*0.5)+(0.5-(float(l9_149)*0.5)),0.0);
}
else
{
l9_150=float3(l9_147,float(l9_149));
}
}
float3 l9_151=l9_150;
float3 l9_152=l9_151;
float2 l9_153=l9_152.xy;
float l9_154=l9_146;
float4 l9_155=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_153,bias(l9_154));
float4 l9_156=l9_155;
float4 l9_157=l9_156;
if (l9_82)
{
l9_157=mix(l9_83,l9_157,float4(l9_86));
}
float4 l9_158=l9_157;
l9_67=l9_158;
float4 l9_159=l9_67;
float2 l9_160=l9_159.xy;
float l9_161=N123_unpackVal.x;
float l9_162=N123_unpackVal.y;
float l9_163=0.0;
float2 l9_164=l9_160;
float l9_165=l9_161;
float l9_166=l9_162;
float l9_167=0.99998999;
float2 l9_168=l9_164;
#if (1)
{
l9_168=floor((l9_168*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_169=dot(l9_168,float2(1.0,0.0039215689));
float l9_170=l9_169;
float l9_171=0.0;
float l9_172=l9_167;
float l9_173=l9_165;
float l9_174=l9_166;
float l9_175=l9_173+(((l9_170-l9_171)*(l9_174-l9_173))/(l9_172-l9_171));
float l9_176=l9_175;
l9_163=l9_176;
float l9_177=l9_163;
float l9_178=l9_177;
float l9_179=0.0+(((l9_178-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_179;
float l9_180=l9_178;
if (N123_EnableFluid==1.0)
{
float2 l9_181=l9_58;
float4 l9_182=float4(0.0);
int l9_183=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=in.varStereoViewID;
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
l9_186=in.varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
int l9_189=fluidPressureLayout_tmp;
int l9_190=l9_188;
float2 l9_191=l9_181;
bool l9_192=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_193=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_194=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_195=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_196=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_197=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_198=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_199=0.0;
bool l9_200=l9_197&&(!l9_195);
float l9_201=1.0;
float l9_202=l9_191.x;
int l9_203=l9_194.x;
if (l9_203==1)
{
l9_202=fract(l9_202);
}
else
{
if (l9_203==2)
{
float l9_204=fract(l9_202);
float l9_205=l9_202-l9_204;
float l9_206=step(0.25,fract(l9_205*0.5));
l9_202=mix(l9_204,1.0-l9_204,fast::clamp(l9_206,0.0,1.0));
}
}
l9_191.x=l9_202;
float l9_207=l9_191.y;
int l9_208=l9_194.y;
if (l9_208==1)
{
l9_207=fract(l9_207);
}
else
{
if (l9_208==2)
{
float l9_209=fract(l9_207);
float l9_210=l9_207-l9_209;
float l9_211=step(0.25,fract(l9_210*0.5));
l9_207=mix(l9_209,1.0-l9_209,fast::clamp(l9_211,0.0,1.0));
}
}
l9_191.y=l9_207;
if (l9_195)
{
bool l9_212=l9_197;
bool l9_213;
if (l9_212)
{
l9_213=l9_194.x==3;
}
else
{
l9_213=l9_212;
}
float l9_214=l9_191.x;
float l9_215=l9_196.x;
float l9_216=l9_196.z;
bool l9_217=l9_213;
float l9_218=l9_201;
float l9_219=fast::clamp(l9_214,l9_215,l9_216);
float l9_220=step(abs(l9_214-l9_219),9.9999997e-06);
l9_218*=(l9_220+((1.0-float(l9_217))*(1.0-l9_220)));
l9_214=l9_219;
l9_191.x=l9_214;
l9_201=l9_218;
bool l9_221=l9_197;
bool l9_222;
if (l9_221)
{
l9_222=l9_194.y==3;
}
else
{
l9_222=l9_221;
}
float l9_223=l9_191.y;
float l9_224=l9_196.y;
float l9_225=l9_196.w;
bool l9_226=l9_222;
float l9_227=l9_201;
float l9_228=fast::clamp(l9_223,l9_224,l9_225);
float l9_229=step(abs(l9_223-l9_228),9.9999997e-06);
l9_227*=(l9_229+((1.0-float(l9_226))*(1.0-l9_229)));
l9_223=l9_228;
l9_191.y=l9_223;
l9_201=l9_227;
}
float2 l9_230=l9_191;
bool l9_231=l9_192;
float3x3 l9_232=l9_193;
if (l9_231)
{
l9_230=float2((l9_232*float3(l9_230,1.0)).xy);
}
float2 l9_233=l9_230;
float2 l9_234=l9_233;
float2 l9_235=l9_234;
l9_191=l9_235;
float l9_236=l9_191.x;
int l9_237=l9_194.x;
bool l9_238=l9_200;
float l9_239=l9_201;
if ((l9_237==0)||(l9_237==3))
{
float l9_240=l9_236;
float l9_241=0.0;
float l9_242=1.0;
bool l9_243=l9_238;
float l9_244=l9_239;
float l9_245=fast::clamp(l9_240,l9_241,l9_242);
float l9_246=step(abs(l9_240-l9_245),9.9999997e-06);
l9_244*=(l9_246+((1.0-float(l9_243))*(1.0-l9_246)));
l9_240=l9_245;
l9_236=l9_240;
l9_239=l9_244;
}
l9_191.x=l9_236;
l9_201=l9_239;
float l9_247=l9_191.y;
int l9_248=l9_194.y;
bool l9_249=l9_200;
float l9_250=l9_201;
if ((l9_248==0)||(l9_248==3))
{
float l9_251=l9_247;
float l9_252=0.0;
float l9_253=1.0;
bool l9_254=l9_249;
float l9_255=l9_250;
float l9_256=fast::clamp(l9_251,l9_252,l9_253);
float l9_257=step(abs(l9_251-l9_256),9.9999997e-06);
l9_255*=(l9_257+((1.0-float(l9_254))*(1.0-l9_257)));
l9_251=l9_256;
l9_247=l9_251;
l9_250=l9_255;
}
l9_191.y=l9_247;
l9_201=l9_250;
float2 l9_258=l9_191;
int l9_259=l9_189;
int l9_260=l9_190;
float l9_261=l9_199;
float2 l9_262=l9_258;
int l9_263=l9_259;
int l9_264=l9_260;
float3 l9_265=float3(0.0);
if (l9_263==0)
{
l9_265=float3(l9_262,0.0);
}
else
{
if (l9_263==1)
{
l9_265=float3(l9_262.x,(l9_262.y*0.5)+(0.5-(float(l9_264)*0.5)),0.0);
}
else
{
l9_265=float3(l9_262,float(l9_264));
}
}
float3 l9_266=l9_265;
float3 l9_267=l9_266;
float2 l9_268=l9_267.xy;
float l9_269=l9_261;
float4 l9_270=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_268,bias(l9_269));
float4 l9_271=l9_270;
float4 l9_272=l9_271;
if (l9_197)
{
l9_272=mix(l9_198,l9_272,float4(l9_201));
}
float4 l9_273=l9_272;
l9_182=l9_273;
float4 l9_274=l9_182;
float2 l9_275=l9_274.xy;
float l9_276=N123_pressureRange.x;
float l9_277=N123_pressureRange.y;
float l9_278=0.0;
float2 l9_279=l9_275;
float l9_280=l9_276;
float l9_281=l9_277;
float l9_282=0.99998999;
float2 l9_283=l9_279;
#if (1)
{
l9_283=floor((l9_283*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_284=dot(l9_283,float2(1.0,0.0039215689));
float l9_285=l9_284;
float l9_286=0.0;
float l9_287=l9_282;
float l9_288=l9_280;
float l9_289=l9_281;
float l9_290=l9_288+(((l9_285-l9_286)*(l9_289-l9_288))/(l9_287-l9_286));
float l9_291=l9_290;
l9_278=l9_291;
float l9_292=l9_278;
float l9_293=l9_292;
float l9_294=l9_293*N123_FluidMul;
l9_180=l9_178+l9_294;
float l9_295=(0.0+(((fast::clamp(l9_294,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_295;
}
float2 l9_296=l9_61;
float4 l9_297=float4(0.0);
int l9_298=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_299=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_299=0;
}
else
{
l9_299=in.varStereoViewID;
}
int l9_300=l9_299;
l9_298=1-l9_300;
}
else
{
int l9_301=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_301=0;
}
else
{
l9_301=in.varStereoViewID;
}
int l9_302=l9_301;
l9_298=l9_302;
}
int l9_303=l9_298;
int l9_304=oceanNormalLayout_tmp;
int l9_305=l9_303;
float2 l9_306=l9_296;
bool l9_307=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_308=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_309=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_310=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_311=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_312=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_313=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_314=0.0;
bool l9_315=l9_312&&(!l9_310);
float l9_316=1.0;
float l9_317=l9_306.x;
int l9_318=l9_309.x;
if (l9_318==1)
{
l9_317=fract(l9_317);
}
else
{
if (l9_318==2)
{
float l9_319=fract(l9_317);
float l9_320=l9_317-l9_319;
float l9_321=step(0.25,fract(l9_320*0.5));
l9_317=mix(l9_319,1.0-l9_319,fast::clamp(l9_321,0.0,1.0));
}
}
l9_306.x=l9_317;
float l9_322=l9_306.y;
int l9_323=l9_309.y;
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
l9_306.y=l9_322;
if (l9_310)
{
bool l9_327=l9_312;
bool l9_328;
if (l9_327)
{
l9_328=l9_309.x==3;
}
else
{
l9_328=l9_327;
}
float l9_329=l9_306.x;
float l9_330=l9_311.x;
float l9_331=l9_311.z;
bool l9_332=l9_328;
float l9_333=l9_316;
float l9_334=fast::clamp(l9_329,l9_330,l9_331);
float l9_335=step(abs(l9_329-l9_334),9.9999997e-06);
l9_333*=(l9_335+((1.0-float(l9_332))*(1.0-l9_335)));
l9_329=l9_334;
l9_306.x=l9_329;
l9_316=l9_333;
bool l9_336=l9_312;
bool l9_337;
if (l9_336)
{
l9_337=l9_309.y==3;
}
else
{
l9_337=l9_336;
}
float l9_338=l9_306.y;
float l9_339=l9_311.y;
float l9_340=l9_311.w;
bool l9_341=l9_337;
float l9_342=l9_316;
float l9_343=fast::clamp(l9_338,l9_339,l9_340);
float l9_344=step(abs(l9_338-l9_343),9.9999997e-06);
l9_342*=(l9_344+((1.0-float(l9_341))*(1.0-l9_344)));
l9_338=l9_343;
l9_306.y=l9_338;
l9_316=l9_342;
}
float2 l9_345=l9_306;
bool l9_346=l9_307;
float3x3 l9_347=l9_308;
if (l9_346)
{
l9_345=float2((l9_347*float3(l9_345,1.0)).xy);
}
float2 l9_348=l9_345;
float2 l9_349=l9_348;
float2 l9_350=l9_349;
l9_306=l9_350;
float l9_351=l9_306.x;
int l9_352=l9_309.x;
bool l9_353=l9_315;
float l9_354=l9_316;
if ((l9_352==0)||(l9_352==3))
{
float l9_355=l9_351;
float l9_356=0.0;
float l9_357=1.0;
bool l9_358=l9_353;
float l9_359=l9_354;
float l9_360=fast::clamp(l9_355,l9_356,l9_357);
float l9_361=step(abs(l9_355-l9_360),9.9999997e-06);
l9_359*=(l9_361+((1.0-float(l9_358))*(1.0-l9_361)));
l9_355=l9_360;
l9_351=l9_355;
l9_354=l9_359;
}
l9_306.x=l9_351;
l9_316=l9_354;
float l9_362=l9_306.y;
int l9_363=l9_309.y;
bool l9_364=l9_315;
float l9_365=l9_316;
if ((l9_363==0)||(l9_363==3))
{
float l9_366=l9_362;
float l9_367=0.0;
float l9_368=1.0;
bool l9_369=l9_364;
float l9_370=l9_365;
float l9_371=fast::clamp(l9_366,l9_367,l9_368);
float l9_372=step(abs(l9_366-l9_371),9.9999997e-06);
l9_370*=(l9_372+((1.0-float(l9_369))*(1.0-l9_372)));
l9_366=l9_371;
l9_362=l9_366;
l9_365=l9_370;
}
l9_306.y=l9_362;
l9_316=l9_365;
float2 l9_373=l9_306;
int l9_374=l9_304;
int l9_375=l9_305;
float l9_376=l9_314;
float2 l9_377=l9_373;
int l9_378=l9_374;
int l9_379=l9_375;
float3 l9_380=float3(0.0);
if (l9_378==0)
{
l9_380=float3(l9_377,0.0);
}
else
{
if (l9_378==1)
{
l9_380=float3(l9_377.x,(l9_377.y*0.5)+(0.5-(float(l9_379)*0.5)),0.0);
}
else
{
l9_380=float3(l9_377,float(l9_379));
}
}
float3 l9_381=l9_380;
float3 l9_382=l9_381;
float2 l9_383=l9_382.xy;
float l9_384=l9_376;
float4 l9_385=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_383,bias(l9_384));
float4 l9_386=l9_385;
float4 l9_387=l9_386;
if (l9_312)
{
l9_387=mix(l9_313,l9_387,float4(l9_316));
}
float4 l9_388=l9_387;
l9_297=l9_388;
float4 l9_389=l9_297;
float3 l9_390=(l9_389.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_390;
N123_SurfacePosition=float3(0.0,l9_180,0.0)+l9_60;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_391=tempGlobals.gTimeElapsed;
float2 l9_392=N123_SurfacePosition.zx*N123_FBMScale;
float l9_393=l9_391*N123_OceanSpeed;
float l9_394=0.0;
float2 l9_395=l9_392+float2(l9_393);
float2 l9_396=floor(l9_395);
float2 l9_397=fract(l9_395);
l9_397=(l9_397*l9_397)*(float2(3.0)-(l9_397*2.0));
float2 l9_398=l9_396;
float l9_399=fract(sin(dot(l9_398,float2(12.9898,4.1413999)))*43758.547);
float2 l9_400=l9_396+float2(1.0,0.0);
float l9_401=fract(sin(dot(l9_400,float2(12.9898,4.1413999)))*43758.547);
float2 l9_402=l9_396+float2(0.0,1.0);
float l9_403=fract(sin(dot(l9_402,float2(12.9898,4.1413999)))*43758.547);
float2 l9_404=l9_396+float2(1.0);
float l9_405=fract(sin(dot(l9_404,float2(12.9898,4.1413999)))*43758.547);
float l9_406=mix(mix(l9_399,l9_401,l9_397.x),mix(l9_403,l9_405,l9_397.x),l9_397.y);
float l9_407=l9_406*l9_406;
l9_394+=(0.5*l9_407);
l9_392=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_392)*2.02;
float2 l9_408=l9_392;
float2 l9_409=floor(l9_408);
float2 l9_410=fract(l9_408);
l9_410=(l9_410*l9_410)*(float2(3.0)-(l9_410*2.0));
float2 l9_411=l9_409;
float l9_412=fract(sin(dot(l9_411,float2(12.9898,4.1413999)))*43758.547);
float2 l9_413=l9_409+float2(1.0,0.0);
float l9_414=fract(sin(dot(l9_413,float2(12.9898,4.1413999)))*43758.547);
float2 l9_415=l9_409+float2(0.0,1.0);
float l9_416=fract(sin(dot(l9_415,float2(12.9898,4.1413999)))*43758.547);
float2 l9_417=l9_409+float2(1.0);
float l9_418=fract(sin(dot(l9_417,float2(12.9898,4.1413999)))*43758.547);
float l9_419=mix(mix(l9_412,l9_414,l9_410.x),mix(l9_416,l9_418,l9_410.x),l9_410.y);
float l9_420=l9_419*l9_419;
l9_394+=(0.03125*l9_420);
l9_392=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_392)*2.01;
float2 l9_421=l9_392;
float2 l9_422=floor(l9_421);
float2 l9_423=fract(l9_421);
l9_423=(l9_423*l9_423)*(float2(3.0)-(l9_423*2.0));
float2 l9_424=l9_422;
float l9_425=fract(sin(dot(l9_424,float2(12.9898,4.1413999)))*43758.547);
float2 l9_426=l9_422+float2(1.0,0.0);
float l9_427=fract(sin(dot(l9_426,float2(12.9898,4.1413999)))*43758.547);
float2 l9_428=l9_422+float2(0.0,1.0);
float l9_429=fract(sin(dot(l9_428,float2(12.9898,4.1413999)))*43758.547);
float2 l9_430=l9_422+float2(1.0);
float l9_431=fract(sin(dot(l9_430,float2(12.9898,4.1413999)))*43758.547);
float l9_432=mix(mix(l9_425,l9_427,l9_423.x),mix(l9_429,l9_431,l9_423.x),l9_423.y);
float l9_433=l9_432*l9_432;
l9_394+=(0.25*l9_433);
l9_392=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_392)*2.03;
float2 l9_434=l9_392;
float2 l9_435=floor(l9_434);
float2 l9_436=fract(l9_434);
l9_436=(l9_436*l9_436)*(float2(3.0)-(l9_436*2.0));
float2 l9_437=l9_435;
float l9_438=fract(sin(dot(l9_437,float2(12.9898,4.1413999)))*43758.547);
float2 l9_439=l9_435+float2(1.0,0.0);
float l9_440=fract(sin(dot(l9_439,float2(12.9898,4.1413999)))*43758.547);
float2 l9_441=l9_435+float2(0.0,1.0);
float l9_442=fract(sin(dot(l9_441,float2(12.9898,4.1413999)))*43758.547);
float2 l9_443=l9_435+float2(1.0);
float l9_444=fract(sin(dot(l9_443,float2(12.9898,4.1413999)))*43758.547);
float l9_445=mix(mix(l9_438,l9_440,l9_436.x),mix(l9_442,l9_444,l9_436.x),l9_436.y);
float l9_446=l9_445*l9_445;
l9_394+=(0.125*l9_446);
l9_392=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_392)*2.01;
float2 l9_447=l9_392;
float2 l9_448=floor(l9_447);
float2 l9_449=fract(l9_447);
l9_449=(l9_449*l9_449)*(float2(3.0)-(l9_449*2.0));
float2 l9_450=l9_448;
float l9_451=fract(sin(dot(l9_450,float2(12.9898,4.1413999)))*43758.547);
float2 l9_452=l9_448+float2(1.0,0.0);
float l9_453=fract(sin(dot(l9_452,float2(12.9898,4.1413999)))*43758.547);
float2 l9_454=l9_448+float2(0.0,1.0);
float l9_455=fract(sin(dot(l9_454,float2(12.9898,4.1413999)))*43758.547);
float2 l9_456=l9_448+float2(1.0);
float l9_457=fract(sin(dot(l9_456,float2(12.9898,4.1413999)))*43758.547);
float l9_458=mix(mix(l9_451,l9_453,l9_449.x),mix(l9_455,l9_457,l9_449.x),l9_449.y);
float l9_459=l9_458*l9_458;
l9_394+=(0.0625*l9_459);
l9_392=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_392)*2.04;
float2 l9_460=l9_392+float2(sin(l9_393));
float2 l9_461=floor(l9_460);
float2 l9_462=fract(l9_460);
l9_462=(l9_462*l9_462)*(float2(3.0)-(l9_462*2.0));
float2 l9_463=l9_461;
float l9_464=fract(sin(dot(l9_463,float2(12.9898,4.1413999)))*43758.547);
float2 l9_465=l9_461+float2(1.0,0.0);
float l9_466=fract(sin(dot(l9_465,float2(12.9898,4.1413999)))*43758.547);
float2 l9_467=l9_461+float2(0.0,1.0);
float l9_468=fract(sin(dot(l9_467,float2(12.9898,4.1413999)))*43758.547);
float2 l9_469=l9_461+float2(1.0);
float l9_470=fract(sin(dot(l9_469,float2(12.9898,4.1413999)))*43758.547);
float l9_471=mix(mix(l9_464,l9_466,l9_462.x),mix(l9_468,l9_470,l9_462.x),l9_462.y);
float l9_472=l9_471*l9_471;
l9_394+=(0.015625*l9_472);
float l9_473=l9_394/0.96875;
tempGlobals.N123_fbm=1.0-l9_473;
}
}
else
{
ssGlobals l9_474=param_1;
tempGlobals=l9_474;
float3 l9_475=float3(0.0);
float3 l9_476=float3(0.0);
float3 l9_477=(*sc_set0.UserUniforms).oceanMin;
l9_476=l9_477;
l9_475=l9_476;
float3 l9_478=l9_475;
N123_OceanAabbMin=l9_478;
float3 l9_479=float3(0.0);
float3 l9_480=float3(0.0);
float3 l9_481=(*sc_set0.UserUniforms).oceanMax;
l9_480=l9_481;
l9_479=l9_480;
float3 l9_482=l9_479;
N123_OceanAabbMax=l9_482;
float l9_483=0.0;
float l9_484=0.0;
float l9_485=(*sc_set0.UserUniforms).speed;
l9_484=l9_485;
l9_483=l9_484;
float l9_486=l9_483;
N123_OceanSpeed=l9_486;
float l9_487=0.0;
float l9_488=0.0;
float l9_489=(*sc_set0.UserUniforms).enableFoam;
l9_488=l9_489;
l9_487=l9_488;
float l9_490=l9_487;
N123_EnableFoam=l9_490;
float l9_491=0.0;
float l9_492=0.0;
float l9_493=(*sc_set0.UserUniforms).fbmScale;
l9_492=l9_493;
l9_491=l9_492;
float l9_494=l9_491;
N123_FBMScale=l9_494;
float l9_495=0.0;
float l9_496=0.0;
float l9_497=(*sc_set0.UserUniforms).enableInfinite;
l9_496=l9_497;
l9_495=l9_496;
float l9_498=l9_495;
N123_EnableInfinite=l9_498;
float l9_499=0.0;
float l9_500=0.0;
float l9_501=(*sc_set0.UserUniforms).enableFluid;
l9_500=l9_501;
l9_499=l9_500;
float l9_502=l9_499;
N123_EnableFluid=l9_502;
float2 l9_503=float2(0.0);
float2 l9_504=float2(0.0);
float2 l9_505=(*sc_set0.UserUniforms).pressureRange;
l9_504=l9_505;
l9_503=l9_504;
float2 l9_506=l9_503;
N123_pressureRange=l9_506;
float l9_507=0.0;
float l9_508=0.0;
float l9_509=(*sc_set0.UserUniforms).fluidMul;
l9_508=l9_509;
l9_507=l9_508;
float l9_510=l9_507;
N123_FluidMul=l9_510;
float2 l9_511=float2(0.0);
float2 l9_512=float2(0.0);
float2 l9_513=(*sc_set0.UserUniforms).unpackVal;
l9_512=l9_513;
l9_511=l9_512;
float2 l9_514=l9_511;
N123_unpackVal=l9_514;
float2 l9_515=tempGlobals.Surface_UVCoord0;
float2 l9_516=l9_515;
float3 l9_517=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_518=l9_517;
float2 l9_519=l9_516;
if (N123_EnableInfinite==1.0)
{
float2 l9_520=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_521=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_522=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_523=float2(0.0)+(((l9_522.xz-l9_520)*1.0)/((l9_521-l9_520)+float2(1e-06)));
l9_523.y=1.0-l9_523.y;
l9_519=(l9_516+l9_523)-float2(0.5);
}
float2 l9_524=l9_519;
float4 l9_525=float4(0.0);
int l9_526=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_527=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_527=0;
}
else
{
l9_527=in.varStereoViewID;
}
int l9_528=l9_527;
l9_526=1-l9_528;
}
else
{
int l9_529=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_529=0;
}
else
{
l9_529=in.varStereoViewID;
}
int l9_530=l9_529;
l9_526=l9_530;
}
int l9_531=l9_526;
int l9_532=oceanHeightmapLayout_tmp;
int l9_533=l9_531;
float2 l9_534=l9_524;
bool l9_535=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_536=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_537=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_538=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_539=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_540=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_541=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_542=0.0;
bool l9_543=l9_540&&(!l9_538);
float l9_544=1.0;
float l9_545=l9_534.x;
int l9_546=l9_537.x;
if (l9_546==1)
{
l9_545=fract(l9_545);
}
else
{
if (l9_546==2)
{
float l9_547=fract(l9_545);
float l9_548=l9_545-l9_547;
float l9_549=step(0.25,fract(l9_548*0.5));
l9_545=mix(l9_547,1.0-l9_547,fast::clamp(l9_549,0.0,1.0));
}
}
l9_534.x=l9_545;
float l9_550=l9_534.y;
int l9_551=l9_537.y;
if (l9_551==1)
{
l9_550=fract(l9_550);
}
else
{
if (l9_551==2)
{
float l9_552=fract(l9_550);
float l9_553=l9_550-l9_552;
float l9_554=step(0.25,fract(l9_553*0.5));
l9_550=mix(l9_552,1.0-l9_552,fast::clamp(l9_554,0.0,1.0));
}
}
l9_534.y=l9_550;
if (l9_538)
{
bool l9_555=l9_540;
bool l9_556;
if (l9_555)
{
l9_556=l9_537.x==3;
}
else
{
l9_556=l9_555;
}
float l9_557=l9_534.x;
float l9_558=l9_539.x;
float l9_559=l9_539.z;
bool l9_560=l9_556;
float l9_561=l9_544;
float l9_562=fast::clamp(l9_557,l9_558,l9_559);
float l9_563=step(abs(l9_557-l9_562),9.9999997e-06);
l9_561*=(l9_563+((1.0-float(l9_560))*(1.0-l9_563)));
l9_557=l9_562;
l9_534.x=l9_557;
l9_544=l9_561;
bool l9_564=l9_540;
bool l9_565;
if (l9_564)
{
l9_565=l9_537.y==3;
}
else
{
l9_565=l9_564;
}
float l9_566=l9_534.y;
float l9_567=l9_539.y;
float l9_568=l9_539.w;
bool l9_569=l9_565;
float l9_570=l9_544;
float l9_571=fast::clamp(l9_566,l9_567,l9_568);
float l9_572=step(abs(l9_566-l9_571),9.9999997e-06);
l9_570*=(l9_572+((1.0-float(l9_569))*(1.0-l9_572)));
l9_566=l9_571;
l9_534.y=l9_566;
l9_544=l9_570;
}
float2 l9_573=l9_534;
bool l9_574=l9_535;
float3x3 l9_575=l9_536;
if (l9_574)
{
l9_573=float2((l9_575*float3(l9_573,1.0)).xy);
}
float2 l9_576=l9_573;
float2 l9_577=l9_576;
float2 l9_578=l9_577;
l9_534=l9_578;
float l9_579=l9_534.x;
int l9_580=l9_537.x;
bool l9_581=l9_543;
float l9_582=l9_544;
if ((l9_580==0)||(l9_580==3))
{
float l9_583=l9_579;
float l9_584=0.0;
float l9_585=1.0;
bool l9_586=l9_581;
float l9_587=l9_582;
float l9_588=fast::clamp(l9_583,l9_584,l9_585);
float l9_589=step(abs(l9_583-l9_588),9.9999997e-06);
l9_587*=(l9_589+((1.0-float(l9_586))*(1.0-l9_589)));
l9_583=l9_588;
l9_579=l9_583;
l9_582=l9_587;
}
l9_534.x=l9_579;
l9_544=l9_582;
float l9_590=l9_534.y;
int l9_591=l9_537.y;
bool l9_592=l9_543;
float l9_593=l9_544;
if ((l9_591==0)||(l9_591==3))
{
float l9_594=l9_590;
float l9_595=0.0;
float l9_596=1.0;
bool l9_597=l9_592;
float l9_598=l9_593;
float l9_599=fast::clamp(l9_594,l9_595,l9_596);
float l9_600=step(abs(l9_594-l9_599),9.9999997e-06);
l9_598*=(l9_600+((1.0-float(l9_597))*(1.0-l9_600)));
l9_594=l9_599;
l9_590=l9_594;
l9_593=l9_598;
}
l9_534.y=l9_590;
l9_544=l9_593;
float2 l9_601=l9_534;
int l9_602=l9_532;
int l9_603=l9_533;
float l9_604=l9_542;
float2 l9_605=l9_601;
int l9_606=l9_602;
int l9_607=l9_603;
float3 l9_608=float3(0.0);
if (l9_606==0)
{
l9_608=float3(l9_605,0.0);
}
else
{
if (l9_606==1)
{
l9_608=float3(l9_605.x,(l9_605.y*0.5)+(0.5-(float(l9_607)*0.5)),0.0);
}
else
{
l9_608=float3(l9_605,float(l9_607));
}
}
float3 l9_609=l9_608;
float3 l9_610=l9_609;
float2 l9_611=l9_610.xy;
float l9_612=l9_604;
float4 l9_613=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_611,bias(l9_612));
float4 l9_614=l9_613;
float4 l9_615=l9_614;
if (l9_540)
{
l9_615=mix(l9_541,l9_615,float4(l9_544));
}
float4 l9_616=l9_615;
l9_525=l9_616;
float4 l9_617=l9_525;
float2 l9_618=l9_617.xy;
float l9_619=N123_unpackVal.x;
float l9_620=N123_unpackVal.y;
float l9_621=0.0;
float2 l9_622=l9_618;
float l9_623=l9_619;
float l9_624=l9_620;
float l9_625=0.99998999;
float2 l9_626=l9_622;
#if (1)
{
l9_626=floor((l9_626*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_627=dot(l9_626,float2(1.0,0.0039215689));
float l9_628=l9_627;
float l9_629=0.0;
float l9_630=l9_625;
float l9_631=l9_623;
float l9_632=l9_624;
float l9_633=l9_631+(((l9_628-l9_629)*(l9_632-l9_631))/(l9_630-l9_629));
float l9_634=l9_633;
l9_621=l9_634;
float l9_635=l9_621;
float l9_636=l9_635;
float l9_637=0.0+(((l9_636-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_637;
float l9_638=l9_636;
if (N123_EnableFluid==1.0)
{
float2 l9_639=l9_516;
float4 l9_640=float4(0.0);
int l9_641=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_642=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_642=0;
}
else
{
l9_642=in.varStereoViewID;
}
int l9_643=l9_642;
l9_641=1-l9_643;
}
else
{
int l9_644=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_644=0;
}
else
{
l9_644=in.varStereoViewID;
}
int l9_645=l9_644;
l9_641=l9_645;
}
int l9_646=l9_641;
int l9_647=fluidPressureLayout_tmp;
int l9_648=l9_646;
float2 l9_649=l9_639;
bool l9_650=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_651=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_652=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_653=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_654=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_655=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_656=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_657=0.0;
bool l9_658=l9_655&&(!l9_653);
float l9_659=1.0;
float l9_660=l9_649.x;
int l9_661=l9_652.x;
if (l9_661==1)
{
l9_660=fract(l9_660);
}
else
{
if (l9_661==2)
{
float l9_662=fract(l9_660);
float l9_663=l9_660-l9_662;
float l9_664=step(0.25,fract(l9_663*0.5));
l9_660=mix(l9_662,1.0-l9_662,fast::clamp(l9_664,0.0,1.0));
}
}
l9_649.x=l9_660;
float l9_665=l9_649.y;
int l9_666=l9_652.y;
if (l9_666==1)
{
l9_665=fract(l9_665);
}
else
{
if (l9_666==2)
{
float l9_667=fract(l9_665);
float l9_668=l9_665-l9_667;
float l9_669=step(0.25,fract(l9_668*0.5));
l9_665=mix(l9_667,1.0-l9_667,fast::clamp(l9_669,0.0,1.0));
}
}
l9_649.y=l9_665;
if (l9_653)
{
bool l9_670=l9_655;
bool l9_671;
if (l9_670)
{
l9_671=l9_652.x==3;
}
else
{
l9_671=l9_670;
}
float l9_672=l9_649.x;
float l9_673=l9_654.x;
float l9_674=l9_654.z;
bool l9_675=l9_671;
float l9_676=l9_659;
float l9_677=fast::clamp(l9_672,l9_673,l9_674);
float l9_678=step(abs(l9_672-l9_677),9.9999997e-06);
l9_676*=(l9_678+((1.0-float(l9_675))*(1.0-l9_678)));
l9_672=l9_677;
l9_649.x=l9_672;
l9_659=l9_676;
bool l9_679=l9_655;
bool l9_680;
if (l9_679)
{
l9_680=l9_652.y==3;
}
else
{
l9_680=l9_679;
}
float l9_681=l9_649.y;
float l9_682=l9_654.y;
float l9_683=l9_654.w;
bool l9_684=l9_680;
float l9_685=l9_659;
float l9_686=fast::clamp(l9_681,l9_682,l9_683);
float l9_687=step(abs(l9_681-l9_686),9.9999997e-06);
l9_685*=(l9_687+((1.0-float(l9_684))*(1.0-l9_687)));
l9_681=l9_686;
l9_649.y=l9_681;
l9_659=l9_685;
}
float2 l9_688=l9_649;
bool l9_689=l9_650;
float3x3 l9_690=l9_651;
if (l9_689)
{
l9_688=float2((l9_690*float3(l9_688,1.0)).xy);
}
float2 l9_691=l9_688;
float2 l9_692=l9_691;
float2 l9_693=l9_692;
l9_649=l9_693;
float l9_694=l9_649.x;
int l9_695=l9_652.x;
bool l9_696=l9_658;
float l9_697=l9_659;
if ((l9_695==0)||(l9_695==3))
{
float l9_698=l9_694;
float l9_699=0.0;
float l9_700=1.0;
bool l9_701=l9_696;
float l9_702=l9_697;
float l9_703=fast::clamp(l9_698,l9_699,l9_700);
float l9_704=step(abs(l9_698-l9_703),9.9999997e-06);
l9_702*=(l9_704+((1.0-float(l9_701))*(1.0-l9_704)));
l9_698=l9_703;
l9_694=l9_698;
l9_697=l9_702;
}
l9_649.x=l9_694;
l9_659=l9_697;
float l9_705=l9_649.y;
int l9_706=l9_652.y;
bool l9_707=l9_658;
float l9_708=l9_659;
if ((l9_706==0)||(l9_706==3))
{
float l9_709=l9_705;
float l9_710=0.0;
float l9_711=1.0;
bool l9_712=l9_707;
float l9_713=l9_708;
float l9_714=fast::clamp(l9_709,l9_710,l9_711);
float l9_715=step(abs(l9_709-l9_714),9.9999997e-06);
l9_713*=(l9_715+((1.0-float(l9_712))*(1.0-l9_715)));
l9_709=l9_714;
l9_705=l9_709;
l9_708=l9_713;
}
l9_649.y=l9_705;
l9_659=l9_708;
float2 l9_716=l9_649;
int l9_717=l9_647;
int l9_718=l9_648;
float l9_719=l9_657;
float2 l9_720=l9_716;
int l9_721=l9_717;
int l9_722=l9_718;
float3 l9_723=float3(0.0);
if (l9_721==0)
{
l9_723=float3(l9_720,0.0);
}
else
{
if (l9_721==1)
{
l9_723=float3(l9_720.x,(l9_720.y*0.5)+(0.5-(float(l9_722)*0.5)),0.0);
}
else
{
l9_723=float3(l9_720,float(l9_722));
}
}
float3 l9_724=l9_723;
float3 l9_725=l9_724;
float2 l9_726=l9_725.xy;
float l9_727=l9_719;
float4 l9_728=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_726,bias(l9_727));
float4 l9_729=l9_728;
float4 l9_730=l9_729;
if (l9_655)
{
l9_730=mix(l9_656,l9_730,float4(l9_659));
}
float4 l9_731=l9_730;
l9_640=l9_731;
float4 l9_732=l9_640;
float2 l9_733=l9_732.xy;
float l9_734=N123_pressureRange.x;
float l9_735=N123_pressureRange.y;
float l9_736=0.0;
float2 l9_737=l9_733;
float l9_738=l9_734;
float l9_739=l9_735;
float l9_740=0.99998999;
float2 l9_741=l9_737;
#if (1)
{
l9_741=floor((l9_741*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_742=dot(l9_741,float2(1.0,0.0039215689));
float l9_743=l9_742;
float l9_744=0.0;
float l9_745=l9_740;
float l9_746=l9_738;
float l9_747=l9_739;
float l9_748=l9_746+(((l9_743-l9_744)*(l9_747-l9_746))/(l9_745-l9_744));
float l9_749=l9_748;
l9_736=l9_749;
float l9_750=l9_736;
float l9_751=l9_750;
float l9_752=l9_751*N123_FluidMul;
l9_638=l9_636+l9_752;
float l9_753=(0.0+(((fast::clamp(l9_752,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_753;
}
float2 l9_754=l9_519;
float4 l9_755=float4(0.0);
int l9_756=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_757=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_757=0;
}
else
{
l9_757=in.varStereoViewID;
}
int l9_758=l9_757;
l9_756=1-l9_758;
}
else
{
int l9_759=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_759=0;
}
else
{
l9_759=in.varStereoViewID;
}
int l9_760=l9_759;
l9_756=l9_760;
}
int l9_761=l9_756;
int l9_762=oceanNormalLayout_tmp;
int l9_763=l9_761;
float2 l9_764=l9_754;
bool l9_765=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_766=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_767=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_768=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_769=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_770=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_771=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_772=0.0;
bool l9_773=l9_770&&(!l9_768);
float l9_774=1.0;
float l9_775=l9_764.x;
int l9_776=l9_767.x;
if (l9_776==1)
{
l9_775=fract(l9_775);
}
else
{
if (l9_776==2)
{
float l9_777=fract(l9_775);
float l9_778=l9_775-l9_777;
float l9_779=step(0.25,fract(l9_778*0.5));
l9_775=mix(l9_777,1.0-l9_777,fast::clamp(l9_779,0.0,1.0));
}
}
l9_764.x=l9_775;
float l9_780=l9_764.y;
int l9_781=l9_767.y;
if (l9_781==1)
{
l9_780=fract(l9_780);
}
else
{
if (l9_781==2)
{
float l9_782=fract(l9_780);
float l9_783=l9_780-l9_782;
float l9_784=step(0.25,fract(l9_783*0.5));
l9_780=mix(l9_782,1.0-l9_782,fast::clamp(l9_784,0.0,1.0));
}
}
l9_764.y=l9_780;
if (l9_768)
{
bool l9_785=l9_770;
bool l9_786;
if (l9_785)
{
l9_786=l9_767.x==3;
}
else
{
l9_786=l9_785;
}
float l9_787=l9_764.x;
float l9_788=l9_769.x;
float l9_789=l9_769.z;
bool l9_790=l9_786;
float l9_791=l9_774;
float l9_792=fast::clamp(l9_787,l9_788,l9_789);
float l9_793=step(abs(l9_787-l9_792),9.9999997e-06);
l9_791*=(l9_793+((1.0-float(l9_790))*(1.0-l9_793)));
l9_787=l9_792;
l9_764.x=l9_787;
l9_774=l9_791;
bool l9_794=l9_770;
bool l9_795;
if (l9_794)
{
l9_795=l9_767.y==3;
}
else
{
l9_795=l9_794;
}
float l9_796=l9_764.y;
float l9_797=l9_769.y;
float l9_798=l9_769.w;
bool l9_799=l9_795;
float l9_800=l9_774;
float l9_801=fast::clamp(l9_796,l9_797,l9_798);
float l9_802=step(abs(l9_796-l9_801),9.9999997e-06);
l9_800*=(l9_802+((1.0-float(l9_799))*(1.0-l9_802)));
l9_796=l9_801;
l9_764.y=l9_796;
l9_774=l9_800;
}
float2 l9_803=l9_764;
bool l9_804=l9_765;
float3x3 l9_805=l9_766;
if (l9_804)
{
l9_803=float2((l9_805*float3(l9_803,1.0)).xy);
}
float2 l9_806=l9_803;
float2 l9_807=l9_806;
float2 l9_808=l9_807;
l9_764=l9_808;
float l9_809=l9_764.x;
int l9_810=l9_767.x;
bool l9_811=l9_773;
float l9_812=l9_774;
if ((l9_810==0)||(l9_810==3))
{
float l9_813=l9_809;
float l9_814=0.0;
float l9_815=1.0;
bool l9_816=l9_811;
float l9_817=l9_812;
float l9_818=fast::clamp(l9_813,l9_814,l9_815);
float l9_819=step(abs(l9_813-l9_818),9.9999997e-06);
l9_817*=(l9_819+((1.0-float(l9_816))*(1.0-l9_819)));
l9_813=l9_818;
l9_809=l9_813;
l9_812=l9_817;
}
l9_764.x=l9_809;
l9_774=l9_812;
float l9_820=l9_764.y;
int l9_821=l9_767.y;
bool l9_822=l9_773;
float l9_823=l9_774;
if ((l9_821==0)||(l9_821==3))
{
float l9_824=l9_820;
float l9_825=0.0;
float l9_826=1.0;
bool l9_827=l9_822;
float l9_828=l9_823;
float l9_829=fast::clamp(l9_824,l9_825,l9_826);
float l9_830=step(abs(l9_824-l9_829),9.9999997e-06);
l9_828*=(l9_830+((1.0-float(l9_827))*(1.0-l9_830)));
l9_824=l9_829;
l9_820=l9_824;
l9_823=l9_828;
}
l9_764.y=l9_820;
l9_774=l9_823;
float2 l9_831=l9_764;
int l9_832=l9_762;
int l9_833=l9_763;
float l9_834=l9_772;
float2 l9_835=l9_831;
int l9_836=l9_832;
int l9_837=l9_833;
float3 l9_838=float3(0.0);
if (l9_836==0)
{
l9_838=float3(l9_835,0.0);
}
else
{
if (l9_836==1)
{
l9_838=float3(l9_835.x,(l9_835.y*0.5)+(0.5-(float(l9_837)*0.5)),0.0);
}
else
{
l9_838=float3(l9_835,float(l9_837));
}
}
float3 l9_839=l9_838;
float3 l9_840=l9_839;
float2 l9_841=l9_840.xy;
float l9_842=l9_834;
float4 l9_843=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_841,bias(l9_842));
float4 l9_844=l9_843;
float4 l9_845=l9_844;
if (l9_770)
{
l9_845=mix(l9_771,l9_845,float4(l9_774));
}
float4 l9_846=l9_845;
l9_755=l9_846;
float4 l9_847=l9_755;
float3 l9_848=(l9_847.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_848;
N123_SurfacePosition=float3(0.0,l9_638,0.0)+l9_518;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_849=tempGlobals.gTimeElapsed;
float2 l9_850=N123_SurfacePosition.zx*N123_FBMScale;
float l9_851=l9_849*N123_OceanSpeed;
float l9_852=0.0;
float2 l9_853=l9_850+float2(l9_851);
float2 l9_854=floor(l9_853);
float2 l9_855=fract(l9_853);
l9_855=(l9_855*l9_855)*(float2(3.0)-(l9_855*2.0));
float2 l9_856=l9_854;
float l9_857=fract(sin(dot(l9_856,float2(12.9898,4.1413999)))*43758.547);
float2 l9_858=l9_854+float2(1.0,0.0);
float l9_859=fract(sin(dot(l9_858,float2(12.9898,4.1413999)))*43758.547);
float2 l9_860=l9_854+float2(0.0,1.0);
float l9_861=fract(sin(dot(l9_860,float2(12.9898,4.1413999)))*43758.547);
float2 l9_862=l9_854+float2(1.0);
float l9_863=fract(sin(dot(l9_862,float2(12.9898,4.1413999)))*43758.547);
float l9_864=mix(mix(l9_857,l9_859,l9_855.x),mix(l9_861,l9_863,l9_855.x),l9_855.y);
float l9_865=l9_864*l9_864;
l9_852+=(0.5*l9_865);
l9_850=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_850)*2.02;
float2 l9_866=l9_850;
float2 l9_867=floor(l9_866);
float2 l9_868=fract(l9_866);
l9_868=(l9_868*l9_868)*(float2(3.0)-(l9_868*2.0));
float2 l9_869=l9_867;
float l9_870=fract(sin(dot(l9_869,float2(12.9898,4.1413999)))*43758.547);
float2 l9_871=l9_867+float2(1.0,0.0);
float l9_872=fract(sin(dot(l9_871,float2(12.9898,4.1413999)))*43758.547);
float2 l9_873=l9_867+float2(0.0,1.0);
float l9_874=fract(sin(dot(l9_873,float2(12.9898,4.1413999)))*43758.547);
float2 l9_875=l9_867+float2(1.0);
float l9_876=fract(sin(dot(l9_875,float2(12.9898,4.1413999)))*43758.547);
float l9_877=mix(mix(l9_870,l9_872,l9_868.x),mix(l9_874,l9_876,l9_868.x),l9_868.y);
float l9_878=l9_877*l9_877;
l9_852+=(0.03125*l9_878);
l9_850=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_850)*2.01;
float2 l9_879=l9_850;
float2 l9_880=floor(l9_879);
float2 l9_881=fract(l9_879);
l9_881=(l9_881*l9_881)*(float2(3.0)-(l9_881*2.0));
float2 l9_882=l9_880;
float l9_883=fract(sin(dot(l9_882,float2(12.9898,4.1413999)))*43758.547);
float2 l9_884=l9_880+float2(1.0,0.0);
float l9_885=fract(sin(dot(l9_884,float2(12.9898,4.1413999)))*43758.547);
float2 l9_886=l9_880+float2(0.0,1.0);
float l9_887=fract(sin(dot(l9_886,float2(12.9898,4.1413999)))*43758.547);
float2 l9_888=l9_880+float2(1.0);
float l9_889=fract(sin(dot(l9_888,float2(12.9898,4.1413999)))*43758.547);
float l9_890=mix(mix(l9_883,l9_885,l9_881.x),mix(l9_887,l9_889,l9_881.x),l9_881.y);
float l9_891=l9_890*l9_890;
l9_852+=(0.25*l9_891);
l9_850=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_850)*2.03;
float2 l9_892=l9_850;
float2 l9_893=floor(l9_892);
float2 l9_894=fract(l9_892);
l9_894=(l9_894*l9_894)*(float2(3.0)-(l9_894*2.0));
float2 l9_895=l9_893;
float l9_896=fract(sin(dot(l9_895,float2(12.9898,4.1413999)))*43758.547);
float2 l9_897=l9_893+float2(1.0,0.0);
float l9_898=fract(sin(dot(l9_897,float2(12.9898,4.1413999)))*43758.547);
float2 l9_899=l9_893+float2(0.0,1.0);
float l9_900=fract(sin(dot(l9_899,float2(12.9898,4.1413999)))*43758.547);
float2 l9_901=l9_893+float2(1.0);
float l9_902=fract(sin(dot(l9_901,float2(12.9898,4.1413999)))*43758.547);
float l9_903=mix(mix(l9_896,l9_898,l9_894.x),mix(l9_900,l9_902,l9_894.x),l9_894.y);
float l9_904=l9_903*l9_903;
l9_852+=(0.125*l9_904);
l9_850=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_850)*2.01;
float2 l9_905=l9_850;
float2 l9_906=floor(l9_905);
float2 l9_907=fract(l9_905);
l9_907=(l9_907*l9_907)*(float2(3.0)-(l9_907*2.0));
float2 l9_908=l9_906;
float l9_909=fract(sin(dot(l9_908,float2(12.9898,4.1413999)))*43758.547);
float2 l9_910=l9_906+float2(1.0,0.0);
float l9_911=fract(sin(dot(l9_910,float2(12.9898,4.1413999)))*43758.547);
float2 l9_912=l9_906+float2(0.0,1.0);
float l9_913=fract(sin(dot(l9_912,float2(12.9898,4.1413999)))*43758.547);
float2 l9_914=l9_906+float2(1.0);
float l9_915=fract(sin(dot(l9_914,float2(12.9898,4.1413999)))*43758.547);
float l9_916=mix(mix(l9_909,l9_911,l9_907.x),mix(l9_913,l9_915,l9_907.x),l9_907.y);
float l9_917=l9_916*l9_916;
l9_852+=(0.0625*l9_917);
l9_850=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_850)*2.04;
float2 l9_918=l9_850+float2(sin(l9_851));
float2 l9_919=floor(l9_918);
float2 l9_920=fract(l9_918);
l9_920=(l9_920*l9_920)*(float2(3.0)-(l9_920*2.0));
float2 l9_921=l9_919;
float l9_922=fract(sin(dot(l9_921,float2(12.9898,4.1413999)))*43758.547);
float2 l9_923=l9_919+float2(1.0,0.0);
float l9_924=fract(sin(dot(l9_923,float2(12.9898,4.1413999)))*43758.547);
float2 l9_925=l9_919+float2(0.0,1.0);
float l9_926=fract(sin(dot(l9_925,float2(12.9898,4.1413999)))*43758.547);
float2 l9_927=l9_919+float2(1.0);
float l9_928=fract(sin(dot(l9_927,float2(12.9898,4.1413999)))*43758.547);
float l9_929=mix(mix(l9_922,l9_924,l9_920.x),mix(l9_926,l9_928,l9_920.x),l9_920.y);
float l9_930=l9_929*l9_929;
l9_852+=(0.015625*l9_930);
float l9_931=l9_852/0.96875;
tempGlobals.N123_fbm=1.0-l9_931;
}
}
float3 Normal_N123=float3(0.0);
ssGlobals param_3=Globals;
tempGlobals=param_3;
float3 param_2=float3(0.0);
float3 l9_932=float3(0.0);
float3 l9_933=float3(0.0);
float3 l9_934=(*sc_set0.UserUniforms).oceanMin;
l9_933=l9_934;
l9_932=l9_933;
float3 l9_935=l9_932;
N123_OceanAabbMin=l9_935;
float3 l9_936=float3(0.0);
float3 l9_937=float3(0.0);
float3 l9_938=(*sc_set0.UserUniforms).oceanMax;
l9_937=l9_938;
l9_936=l9_937;
float3 l9_939=l9_936;
N123_OceanAabbMax=l9_939;
float l9_940=0.0;
float l9_941=0.0;
float l9_942=(*sc_set0.UserUniforms).speed;
l9_941=l9_942;
l9_940=l9_941;
float l9_943=l9_940;
N123_OceanSpeed=l9_943;
float l9_944=0.0;
float l9_945=0.0;
float l9_946=(*sc_set0.UserUniforms).enableFoam;
l9_945=l9_946;
l9_944=l9_945;
float l9_947=l9_944;
N123_EnableFoam=l9_947;
float l9_948=0.0;
float l9_949=0.0;
float l9_950=(*sc_set0.UserUniforms).fbmScale;
l9_949=l9_950;
l9_948=l9_949;
float l9_951=l9_948;
N123_FBMScale=l9_951;
float l9_952=0.0;
float l9_953=0.0;
float l9_954=(*sc_set0.UserUniforms).enableInfinite;
l9_953=l9_954;
l9_952=l9_953;
float l9_955=l9_952;
N123_EnableInfinite=l9_955;
float l9_956=0.0;
float l9_957=0.0;
float l9_958=(*sc_set0.UserUniforms).enableFluid;
l9_957=l9_958;
l9_956=l9_957;
float l9_959=l9_956;
N123_EnableFluid=l9_959;
float2 l9_960=float2(0.0);
float2 l9_961=float2(0.0);
float2 l9_962=(*sc_set0.UserUniforms).pressureRange;
l9_961=l9_962;
l9_960=l9_961;
float2 l9_963=l9_960;
N123_pressureRange=l9_963;
float l9_964=0.0;
float l9_965=0.0;
float l9_966=(*sc_set0.UserUniforms).fluidMul;
l9_965=l9_966;
l9_964=l9_965;
float l9_967=l9_964;
N123_FluidMul=l9_967;
float2 l9_968=float2(0.0);
float2 l9_969=float2(0.0);
float2 l9_970=(*sc_set0.UserUniforms).unpackVal;
l9_969=l9_970;
l9_968=l9_969;
float2 l9_971=l9_968;
N123_unpackVal=l9_971;
float2 l9_972=tempGlobals.Surface_UVCoord0;
float2 l9_973=l9_972;
float3 l9_974=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_975=l9_974;
float2 l9_976=l9_973;
if (N123_EnableInfinite==1.0)
{
float2 l9_977=float2(N123_OceanAabbMin.x,N123_OceanAabbMin.z);
float2 l9_978=float2(N123_OceanAabbMax.x,N123_OceanAabbMax.z);
float3 l9_979=(*sc_set0.UserUniforms).sc_Camera.position;
float2 l9_980=float2(0.0)+(((l9_979.xz-l9_977)*1.0)/((l9_978-l9_977)+float2(1e-06)));
l9_980.y=1.0-l9_980.y;
l9_976=(l9_973+l9_980)-float2(0.5);
}
float2 l9_981=l9_976;
float4 l9_982=float4(0.0);
int l9_983=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_984=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_984=0;
}
else
{
l9_984=in.varStereoViewID;
}
int l9_985=l9_984;
l9_983=1-l9_985;
}
else
{
int l9_986=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_986=0;
}
else
{
l9_986=in.varStereoViewID;
}
int l9_987=l9_986;
l9_983=l9_987;
}
int l9_988=l9_983;
int l9_989=oceanHeightmapLayout_tmp;
int l9_990=l9_988;
float2 l9_991=l9_981;
bool l9_992=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_993=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_994=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_995=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_996=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_997=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_998=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_999=0.0;
bool l9_1000=l9_997&&(!l9_995);
float l9_1001=1.0;
float l9_1002=l9_991.x;
int l9_1003=l9_994.x;
if (l9_1003==1)
{
l9_1002=fract(l9_1002);
}
else
{
if (l9_1003==2)
{
float l9_1004=fract(l9_1002);
float l9_1005=l9_1002-l9_1004;
float l9_1006=step(0.25,fract(l9_1005*0.5));
l9_1002=mix(l9_1004,1.0-l9_1004,fast::clamp(l9_1006,0.0,1.0));
}
}
l9_991.x=l9_1002;
float l9_1007=l9_991.y;
int l9_1008=l9_994.y;
if (l9_1008==1)
{
l9_1007=fract(l9_1007);
}
else
{
if (l9_1008==2)
{
float l9_1009=fract(l9_1007);
float l9_1010=l9_1007-l9_1009;
float l9_1011=step(0.25,fract(l9_1010*0.5));
l9_1007=mix(l9_1009,1.0-l9_1009,fast::clamp(l9_1011,0.0,1.0));
}
}
l9_991.y=l9_1007;
if (l9_995)
{
bool l9_1012=l9_997;
bool l9_1013;
if (l9_1012)
{
l9_1013=l9_994.x==3;
}
else
{
l9_1013=l9_1012;
}
float l9_1014=l9_991.x;
float l9_1015=l9_996.x;
float l9_1016=l9_996.z;
bool l9_1017=l9_1013;
float l9_1018=l9_1001;
float l9_1019=fast::clamp(l9_1014,l9_1015,l9_1016);
float l9_1020=step(abs(l9_1014-l9_1019),9.9999997e-06);
l9_1018*=(l9_1020+((1.0-float(l9_1017))*(1.0-l9_1020)));
l9_1014=l9_1019;
l9_991.x=l9_1014;
l9_1001=l9_1018;
bool l9_1021=l9_997;
bool l9_1022;
if (l9_1021)
{
l9_1022=l9_994.y==3;
}
else
{
l9_1022=l9_1021;
}
float l9_1023=l9_991.y;
float l9_1024=l9_996.y;
float l9_1025=l9_996.w;
bool l9_1026=l9_1022;
float l9_1027=l9_1001;
float l9_1028=fast::clamp(l9_1023,l9_1024,l9_1025);
float l9_1029=step(abs(l9_1023-l9_1028),9.9999997e-06);
l9_1027*=(l9_1029+((1.0-float(l9_1026))*(1.0-l9_1029)));
l9_1023=l9_1028;
l9_991.y=l9_1023;
l9_1001=l9_1027;
}
float2 l9_1030=l9_991;
bool l9_1031=l9_992;
float3x3 l9_1032=l9_993;
if (l9_1031)
{
l9_1030=float2((l9_1032*float3(l9_1030,1.0)).xy);
}
float2 l9_1033=l9_1030;
float2 l9_1034=l9_1033;
float2 l9_1035=l9_1034;
l9_991=l9_1035;
float l9_1036=l9_991.x;
int l9_1037=l9_994.x;
bool l9_1038=l9_1000;
float l9_1039=l9_1001;
if ((l9_1037==0)||(l9_1037==3))
{
float l9_1040=l9_1036;
float l9_1041=0.0;
float l9_1042=1.0;
bool l9_1043=l9_1038;
float l9_1044=l9_1039;
float l9_1045=fast::clamp(l9_1040,l9_1041,l9_1042);
float l9_1046=step(abs(l9_1040-l9_1045),9.9999997e-06);
l9_1044*=(l9_1046+((1.0-float(l9_1043))*(1.0-l9_1046)));
l9_1040=l9_1045;
l9_1036=l9_1040;
l9_1039=l9_1044;
}
l9_991.x=l9_1036;
l9_1001=l9_1039;
float l9_1047=l9_991.y;
int l9_1048=l9_994.y;
bool l9_1049=l9_1000;
float l9_1050=l9_1001;
if ((l9_1048==0)||(l9_1048==3))
{
float l9_1051=l9_1047;
float l9_1052=0.0;
float l9_1053=1.0;
bool l9_1054=l9_1049;
float l9_1055=l9_1050;
float l9_1056=fast::clamp(l9_1051,l9_1052,l9_1053);
float l9_1057=step(abs(l9_1051-l9_1056),9.9999997e-06);
l9_1055*=(l9_1057+((1.0-float(l9_1054))*(1.0-l9_1057)));
l9_1051=l9_1056;
l9_1047=l9_1051;
l9_1050=l9_1055;
}
l9_991.y=l9_1047;
l9_1001=l9_1050;
float2 l9_1058=l9_991;
int l9_1059=l9_989;
int l9_1060=l9_990;
float l9_1061=l9_999;
float2 l9_1062=l9_1058;
int l9_1063=l9_1059;
int l9_1064=l9_1060;
float3 l9_1065=float3(0.0);
if (l9_1063==0)
{
l9_1065=float3(l9_1062,0.0);
}
else
{
if (l9_1063==1)
{
l9_1065=float3(l9_1062.x,(l9_1062.y*0.5)+(0.5-(float(l9_1064)*0.5)),0.0);
}
else
{
l9_1065=float3(l9_1062,float(l9_1064));
}
}
float3 l9_1066=l9_1065;
float3 l9_1067=l9_1066;
float2 l9_1068=l9_1067.xy;
float l9_1069=l9_1061;
float4 l9_1070=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_1068,bias(l9_1069));
float4 l9_1071=l9_1070;
float4 l9_1072=l9_1071;
if (l9_997)
{
l9_1072=mix(l9_998,l9_1072,float4(l9_1001));
}
float4 l9_1073=l9_1072;
l9_982=l9_1073;
float4 l9_1074=l9_982;
float2 l9_1075=l9_1074.xy;
float l9_1076=N123_unpackVal.x;
float l9_1077=N123_unpackVal.y;
float l9_1078=0.0;
float2 l9_1079=l9_1075;
float l9_1080=l9_1076;
float l9_1081=l9_1077;
float l9_1082=0.99998999;
float2 l9_1083=l9_1079;
#if (1)
{
l9_1083=floor((l9_1083*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1084=dot(l9_1083,float2(1.0,0.0039215689));
float l9_1085=l9_1084;
float l9_1086=0.0;
float l9_1087=l9_1082;
float l9_1088=l9_1080;
float l9_1089=l9_1081;
float l9_1090=l9_1088+(((l9_1085-l9_1086)*(l9_1089-l9_1088))/(l9_1087-l9_1086));
float l9_1091=l9_1090;
l9_1078=l9_1091;
float l9_1092=l9_1078;
float l9_1093=l9_1092;
float l9_1094=0.0+(((l9_1093-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06));
tempGlobals.N123_TatalHeightRemap=l9_1094;
float l9_1095=l9_1093;
if (N123_EnableFluid==1.0)
{
float2 l9_1096=l9_973;
float4 l9_1097=float4(0.0);
int l9_1098=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_1099=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1099=0;
}
else
{
l9_1099=in.varStereoViewID;
}
int l9_1100=l9_1099;
l9_1098=1-l9_1100;
}
else
{
int l9_1101=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1101=0;
}
else
{
l9_1101=in.varStereoViewID;
}
int l9_1102=l9_1101;
l9_1098=l9_1102;
}
int l9_1103=l9_1098;
int l9_1104=fluidPressureLayout_tmp;
int l9_1105=l9_1103;
float2 l9_1106=l9_1096;
bool l9_1107=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_1108=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_1109=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_1110=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_1111=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_1112=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_1113=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_1114=0.0;
bool l9_1115=l9_1112&&(!l9_1110);
float l9_1116=1.0;
float l9_1117=l9_1106.x;
int l9_1118=l9_1109.x;
if (l9_1118==1)
{
l9_1117=fract(l9_1117);
}
else
{
if (l9_1118==2)
{
float l9_1119=fract(l9_1117);
float l9_1120=l9_1117-l9_1119;
float l9_1121=step(0.25,fract(l9_1120*0.5));
l9_1117=mix(l9_1119,1.0-l9_1119,fast::clamp(l9_1121,0.0,1.0));
}
}
l9_1106.x=l9_1117;
float l9_1122=l9_1106.y;
int l9_1123=l9_1109.y;
if (l9_1123==1)
{
l9_1122=fract(l9_1122);
}
else
{
if (l9_1123==2)
{
float l9_1124=fract(l9_1122);
float l9_1125=l9_1122-l9_1124;
float l9_1126=step(0.25,fract(l9_1125*0.5));
l9_1122=mix(l9_1124,1.0-l9_1124,fast::clamp(l9_1126,0.0,1.0));
}
}
l9_1106.y=l9_1122;
if (l9_1110)
{
bool l9_1127=l9_1112;
bool l9_1128;
if (l9_1127)
{
l9_1128=l9_1109.x==3;
}
else
{
l9_1128=l9_1127;
}
float l9_1129=l9_1106.x;
float l9_1130=l9_1111.x;
float l9_1131=l9_1111.z;
bool l9_1132=l9_1128;
float l9_1133=l9_1116;
float l9_1134=fast::clamp(l9_1129,l9_1130,l9_1131);
float l9_1135=step(abs(l9_1129-l9_1134),9.9999997e-06);
l9_1133*=(l9_1135+((1.0-float(l9_1132))*(1.0-l9_1135)));
l9_1129=l9_1134;
l9_1106.x=l9_1129;
l9_1116=l9_1133;
bool l9_1136=l9_1112;
bool l9_1137;
if (l9_1136)
{
l9_1137=l9_1109.y==3;
}
else
{
l9_1137=l9_1136;
}
float l9_1138=l9_1106.y;
float l9_1139=l9_1111.y;
float l9_1140=l9_1111.w;
bool l9_1141=l9_1137;
float l9_1142=l9_1116;
float l9_1143=fast::clamp(l9_1138,l9_1139,l9_1140);
float l9_1144=step(abs(l9_1138-l9_1143),9.9999997e-06);
l9_1142*=(l9_1144+((1.0-float(l9_1141))*(1.0-l9_1144)));
l9_1138=l9_1143;
l9_1106.y=l9_1138;
l9_1116=l9_1142;
}
float2 l9_1145=l9_1106;
bool l9_1146=l9_1107;
float3x3 l9_1147=l9_1108;
if (l9_1146)
{
l9_1145=float2((l9_1147*float3(l9_1145,1.0)).xy);
}
float2 l9_1148=l9_1145;
float2 l9_1149=l9_1148;
float2 l9_1150=l9_1149;
l9_1106=l9_1150;
float l9_1151=l9_1106.x;
int l9_1152=l9_1109.x;
bool l9_1153=l9_1115;
float l9_1154=l9_1116;
if ((l9_1152==0)||(l9_1152==3))
{
float l9_1155=l9_1151;
float l9_1156=0.0;
float l9_1157=1.0;
bool l9_1158=l9_1153;
float l9_1159=l9_1154;
float l9_1160=fast::clamp(l9_1155,l9_1156,l9_1157);
float l9_1161=step(abs(l9_1155-l9_1160),9.9999997e-06);
l9_1159*=(l9_1161+((1.0-float(l9_1158))*(1.0-l9_1161)));
l9_1155=l9_1160;
l9_1151=l9_1155;
l9_1154=l9_1159;
}
l9_1106.x=l9_1151;
l9_1116=l9_1154;
float l9_1162=l9_1106.y;
int l9_1163=l9_1109.y;
bool l9_1164=l9_1115;
float l9_1165=l9_1116;
if ((l9_1163==0)||(l9_1163==3))
{
float l9_1166=l9_1162;
float l9_1167=0.0;
float l9_1168=1.0;
bool l9_1169=l9_1164;
float l9_1170=l9_1165;
float l9_1171=fast::clamp(l9_1166,l9_1167,l9_1168);
float l9_1172=step(abs(l9_1166-l9_1171),9.9999997e-06);
l9_1170*=(l9_1172+((1.0-float(l9_1169))*(1.0-l9_1172)));
l9_1166=l9_1171;
l9_1162=l9_1166;
l9_1165=l9_1170;
}
l9_1106.y=l9_1162;
l9_1116=l9_1165;
float2 l9_1173=l9_1106;
int l9_1174=l9_1104;
int l9_1175=l9_1105;
float l9_1176=l9_1114;
float2 l9_1177=l9_1173;
int l9_1178=l9_1174;
int l9_1179=l9_1175;
float3 l9_1180=float3(0.0);
if (l9_1178==0)
{
l9_1180=float3(l9_1177,0.0);
}
else
{
if (l9_1178==1)
{
l9_1180=float3(l9_1177.x,(l9_1177.y*0.5)+(0.5-(float(l9_1179)*0.5)),0.0);
}
else
{
l9_1180=float3(l9_1177,float(l9_1179));
}
}
float3 l9_1181=l9_1180;
float3 l9_1182=l9_1181;
float2 l9_1183=l9_1182.xy;
float l9_1184=l9_1176;
float4 l9_1185=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_1183,bias(l9_1184));
float4 l9_1186=l9_1185;
float4 l9_1187=l9_1186;
if (l9_1112)
{
l9_1187=mix(l9_1113,l9_1187,float4(l9_1116));
}
float4 l9_1188=l9_1187;
l9_1097=l9_1188;
float4 l9_1189=l9_1097;
float2 l9_1190=l9_1189.xy;
float l9_1191=N123_pressureRange.x;
float l9_1192=N123_pressureRange.y;
float l9_1193=0.0;
float2 l9_1194=l9_1190;
float l9_1195=l9_1191;
float l9_1196=l9_1192;
float l9_1197=0.99998999;
float2 l9_1198=l9_1194;
#if (1)
{
l9_1198=floor((l9_1198*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_1199=dot(l9_1198,float2(1.0,0.0039215689));
float l9_1200=l9_1199;
float l9_1201=0.0;
float l9_1202=l9_1197;
float l9_1203=l9_1195;
float l9_1204=l9_1196;
float l9_1205=l9_1203+(((l9_1200-l9_1201)*(l9_1204-l9_1203))/(l9_1202-l9_1201));
float l9_1206=l9_1205;
l9_1193=l9_1206;
float l9_1207=l9_1193;
float l9_1208=l9_1207;
float l9_1209=l9_1208*N123_FluidMul;
l9_1095=l9_1093+l9_1209;
float l9_1210=(0.0+(((fast::clamp(l9_1209,N123_unpackVal.x,N123_unpackVal.y)-N123_unpackVal.x)*1.0)/((N123_unpackVal.y-N123_unpackVal.x)+1e-06)))*0.60000002;
tempGlobals.N123_TatalHeightRemap+=l9_1210;
}
float2 l9_1211=l9_976;
float4 l9_1212=float4(0.0);
int l9_1213=0;
if ((int(oceanNormalHasSwappedViews_tmp)!=0))
{
int l9_1214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1214=0;
}
else
{
l9_1214=in.varStereoViewID;
}
int l9_1215=l9_1214;
l9_1213=1-l9_1215;
}
else
{
int l9_1216=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1216=0;
}
else
{
l9_1216=in.varStereoViewID;
}
int l9_1217=l9_1216;
l9_1213=l9_1217;
}
int l9_1218=l9_1213;
int l9_1219=oceanNormalLayout_tmp;
int l9_1220=l9_1218;
float2 l9_1221=l9_1211;
bool l9_1222=(int(SC_USE_UV_TRANSFORM_oceanNormal_tmp)!=0);
float3x3 l9_1223=(*sc_set0.UserUniforms).oceanNormalTransform;
int2 l9_1224=int2(SC_SOFTWARE_WRAP_MODE_U_oceanNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanNormal_tmp);
bool l9_1225=(int(SC_USE_UV_MIN_MAX_oceanNormal_tmp)!=0);
float4 l9_1226=(*sc_set0.UserUniforms).oceanNormalUvMinMax;
bool l9_1227=(int(SC_USE_CLAMP_TO_BORDER_oceanNormal_tmp)!=0);
float4 l9_1228=(*sc_set0.UserUniforms).oceanNormalBorderColor;
float l9_1229=0.0;
bool l9_1230=l9_1227&&(!l9_1225);
float l9_1231=1.0;
float l9_1232=l9_1221.x;
int l9_1233=l9_1224.x;
if (l9_1233==1)
{
l9_1232=fract(l9_1232);
}
else
{
if (l9_1233==2)
{
float l9_1234=fract(l9_1232);
float l9_1235=l9_1232-l9_1234;
float l9_1236=step(0.25,fract(l9_1235*0.5));
l9_1232=mix(l9_1234,1.0-l9_1234,fast::clamp(l9_1236,0.0,1.0));
}
}
l9_1221.x=l9_1232;
float l9_1237=l9_1221.y;
int l9_1238=l9_1224.y;
if (l9_1238==1)
{
l9_1237=fract(l9_1237);
}
else
{
if (l9_1238==2)
{
float l9_1239=fract(l9_1237);
float l9_1240=l9_1237-l9_1239;
float l9_1241=step(0.25,fract(l9_1240*0.5));
l9_1237=mix(l9_1239,1.0-l9_1239,fast::clamp(l9_1241,0.0,1.0));
}
}
l9_1221.y=l9_1237;
if (l9_1225)
{
bool l9_1242=l9_1227;
bool l9_1243;
if (l9_1242)
{
l9_1243=l9_1224.x==3;
}
else
{
l9_1243=l9_1242;
}
float l9_1244=l9_1221.x;
float l9_1245=l9_1226.x;
float l9_1246=l9_1226.z;
bool l9_1247=l9_1243;
float l9_1248=l9_1231;
float l9_1249=fast::clamp(l9_1244,l9_1245,l9_1246);
float l9_1250=step(abs(l9_1244-l9_1249),9.9999997e-06);
l9_1248*=(l9_1250+((1.0-float(l9_1247))*(1.0-l9_1250)));
l9_1244=l9_1249;
l9_1221.x=l9_1244;
l9_1231=l9_1248;
bool l9_1251=l9_1227;
bool l9_1252;
if (l9_1251)
{
l9_1252=l9_1224.y==3;
}
else
{
l9_1252=l9_1251;
}
float l9_1253=l9_1221.y;
float l9_1254=l9_1226.y;
float l9_1255=l9_1226.w;
bool l9_1256=l9_1252;
float l9_1257=l9_1231;
float l9_1258=fast::clamp(l9_1253,l9_1254,l9_1255);
float l9_1259=step(abs(l9_1253-l9_1258),9.9999997e-06);
l9_1257*=(l9_1259+((1.0-float(l9_1256))*(1.0-l9_1259)));
l9_1253=l9_1258;
l9_1221.y=l9_1253;
l9_1231=l9_1257;
}
float2 l9_1260=l9_1221;
bool l9_1261=l9_1222;
float3x3 l9_1262=l9_1223;
if (l9_1261)
{
l9_1260=float2((l9_1262*float3(l9_1260,1.0)).xy);
}
float2 l9_1263=l9_1260;
float2 l9_1264=l9_1263;
float2 l9_1265=l9_1264;
l9_1221=l9_1265;
float l9_1266=l9_1221.x;
int l9_1267=l9_1224.x;
bool l9_1268=l9_1230;
float l9_1269=l9_1231;
if ((l9_1267==0)||(l9_1267==3))
{
float l9_1270=l9_1266;
float l9_1271=0.0;
float l9_1272=1.0;
bool l9_1273=l9_1268;
float l9_1274=l9_1269;
float l9_1275=fast::clamp(l9_1270,l9_1271,l9_1272);
float l9_1276=step(abs(l9_1270-l9_1275),9.9999997e-06);
l9_1274*=(l9_1276+((1.0-float(l9_1273))*(1.0-l9_1276)));
l9_1270=l9_1275;
l9_1266=l9_1270;
l9_1269=l9_1274;
}
l9_1221.x=l9_1266;
l9_1231=l9_1269;
float l9_1277=l9_1221.y;
int l9_1278=l9_1224.y;
bool l9_1279=l9_1230;
float l9_1280=l9_1231;
if ((l9_1278==0)||(l9_1278==3))
{
float l9_1281=l9_1277;
float l9_1282=0.0;
float l9_1283=1.0;
bool l9_1284=l9_1279;
float l9_1285=l9_1280;
float l9_1286=fast::clamp(l9_1281,l9_1282,l9_1283);
float l9_1287=step(abs(l9_1281-l9_1286),9.9999997e-06);
l9_1285*=(l9_1287+((1.0-float(l9_1284))*(1.0-l9_1287)));
l9_1281=l9_1286;
l9_1277=l9_1281;
l9_1280=l9_1285;
}
l9_1221.y=l9_1277;
l9_1231=l9_1280;
float2 l9_1288=l9_1221;
int l9_1289=l9_1219;
int l9_1290=l9_1220;
float l9_1291=l9_1229;
float2 l9_1292=l9_1288;
int l9_1293=l9_1289;
int l9_1294=l9_1290;
float3 l9_1295=float3(0.0);
if (l9_1293==0)
{
l9_1295=float3(l9_1292,0.0);
}
else
{
if (l9_1293==1)
{
l9_1295=float3(l9_1292.x,(l9_1292.y*0.5)+(0.5-(float(l9_1294)*0.5)),0.0);
}
else
{
l9_1295=float3(l9_1292,float(l9_1294));
}
}
float3 l9_1296=l9_1295;
float3 l9_1297=l9_1296;
float2 l9_1298=l9_1297.xy;
float l9_1299=l9_1291;
float4 l9_1300=sc_set0.oceanNormal.sample(sc_set0.oceanNormalSmpSC,l9_1298,bias(l9_1299));
float4 l9_1301=l9_1300;
float4 l9_1302=l9_1301;
if (l9_1227)
{
l9_1302=mix(l9_1228,l9_1302,float4(l9_1231));
}
float4 l9_1303=l9_1302;
l9_1212=l9_1303;
float4 l9_1304=l9_1212;
float3 l9_1305=(l9_1304.xyz*1.9921875)-float3(1.0);
N123_Normal=l9_1305;
N123_SurfacePosition=float3(0.0,l9_1095,0.0)+l9_975;
tempGlobals.N123_fbm=1.0;
if (N123_EnableFoam==1.0)
{
float l9_1306=tempGlobals.gTimeElapsed;
float2 l9_1307=N123_SurfacePosition.zx*N123_FBMScale;
float l9_1308=l9_1306*N123_OceanSpeed;
float l9_1309=0.0;
float2 l9_1310=l9_1307+float2(l9_1308);
float2 l9_1311=floor(l9_1310);
float2 l9_1312=fract(l9_1310);
l9_1312=(l9_1312*l9_1312)*(float2(3.0)-(l9_1312*2.0));
float2 l9_1313=l9_1311;
float l9_1314=fract(sin(dot(l9_1313,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1315=l9_1311+float2(1.0,0.0);
float l9_1316=fract(sin(dot(l9_1315,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1317=l9_1311+float2(0.0,1.0);
float l9_1318=fract(sin(dot(l9_1317,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1319=l9_1311+float2(1.0);
float l9_1320=fract(sin(dot(l9_1319,float2(12.9898,4.1413999)))*43758.547);
float l9_1321=mix(mix(l9_1314,l9_1316,l9_1312.x),mix(l9_1318,l9_1320,l9_1312.x),l9_1312.y);
float l9_1322=l9_1321*l9_1321;
l9_1309+=(0.5*l9_1322);
l9_1307=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1307)*2.02;
float2 l9_1323=l9_1307;
float2 l9_1324=floor(l9_1323);
float2 l9_1325=fract(l9_1323);
l9_1325=(l9_1325*l9_1325)*(float2(3.0)-(l9_1325*2.0));
float2 l9_1326=l9_1324;
float l9_1327=fract(sin(dot(l9_1326,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1328=l9_1324+float2(1.0,0.0);
float l9_1329=fract(sin(dot(l9_1328,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1330=l9_1324+float2(0.0,1.0);
float l9_1331=fract(sin(dot(l9_1330,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1332=l9_1324+float2(1.0);
float l9_1333=fract(sin(dot(l9_1332,float2(12.9898,4.1413999)))*43758.547);
float l9_1334=mix(mix(l9_1327,l9_1329,l9_1325.x),mix(l9_1331,l9_1333,l9_1325.x),l9_1325.y);
float l9_1335=l9_1334*l9_1334;
l9_1309+=(0.03125*l9_1335);
l9_1307=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1307)*2.01;
float2 l9_1336=l9_1307;
float2 l9_1337=floor(l9_1336);
float2 l9_1338=fract(l9_1336);
l9_1338=(l9_1338*l9_1338)*(float2(3.0)-(l9_1338*2.0));
float2 l9_1339=l9_1337;
float l9_1340=fract(sin(dot(l9_1339,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1341=l9_1337+float2(1.0,0.0);
float l9_1342=fract(sin(dot(l9_1341,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1343=l9_1337+float2(0.0,1.0);
float l9_1344=fract(sin(dot(l9_1343,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1345=l9_1337+float2(1.0);
float l9_1346=fract(sin(dot(l9_1345,float2(12.9898,4.1413999)))*43758.547);
float l9_1347=mix(mix(l9_1340,l9_1342,l9_1338.x),mix(l9_1344,l9_1346,l9_1338.x),l9_1338.y);
float l9_1348=l9_1347*l9_1347;
l9_1309+=(0.25*l9_1348);
l9_1307=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1307)*2.03;
float2 l9_1349=l9_1307;
float2 l9_1350=floor(l9_1349);
float2 l9_1351=fract(l9_1349);
l9_1351=(l9_1351*l9_1351)*(float2(3.0)-(l9_1351*2.0));
float2 l9_1352=l9_1350;
float l9_1353=fract(sin(dot(l9_1352,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1354=l9_1350+float2(1.0,0.0);
float l9_1355=fract(sin(dot(l9_1354,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1356=l9_1350+float2(0.0,1.0);
float l9_1357=fract(sin(dot(l9_1356,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1358=l9_1350+float2(1.0);
float l9_1359=fract(sin(dot(l9_1358,float2(12.9898,4.1413999)))*43758.547);
float l9_1360=mix(mix(l9_1353,l9_1355,l9_1351.x),mix(l9_1357,l9_1359,l9_1351.x),l9_1351.y);
float l9_1361=l9_1360*l9_1360;
l9_1309+=(0.125*l9_1361);
l9_1307=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1307)*2.01;
float2 l9_1362=l9_1307;
float2 l9_1363=floor(l9_1362);
float2 l9_1364=fract(l9_1362);
l9_1364=(l9_1364*l9_1364)*(float2(3.0)-(l9_1364*2.0));
float2 l9_1365=l9_1363;
float l9_1366=fract(sin(dot(l9_1365,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1367=l9_1363+float2(1.0,0.0);
float l9_1368=fract(sin(dot(l9_1367,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1369=l9_1363+float2(0.0,1.0);
float l9_1370=fract(sin(dot(l9_1369,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1371=l9_1363+float2(1.0);
float l9_1372=fract(sin(dot(l9_1371,float2(12.9898,4.1413999)))*43758.547);
float l9_1373=mix(mix(l9_1366,l9_1368,l9_1364.x),mix(l9_1370,l9_1372,l9_1364.x),l9_1364.y);
float l9_1374=l9_1373*l9_1373;
l9_1309+=(0.0625*l9_1374);
l9_1307=(float2x2(float2(0.80000001,0.60000002),float2(-0.60000002,0.80000001))*l9_1307)*2.04;
float2 l9_1375=l9_1307+float2(sin(l9_1308));
float2 l9_1376=floor(l9_1375);
float2 l9_1377=fract(l9_1375);
l9_1377=(l9_1377*l9_1377)*(float2(3.0)-(l9_1377*2.0));
float2 l9_1378=l9_1376;
float l9_1379=fract(sin(dot(l9_1378,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1380=l9_1376+float2(1.0,0.0);
float l9_1381=fract(sin(dot(l9_1380,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1382=l9_1376+float2(0.0,1.0);
float l9_1383=fract(sin(dot(l9_1382,float2(12.9898,4.1413999)))*43758.547);
float2 l9_1384=l9_1376+float2(1.0);
float l9_1385=fract(sin(dot(l9_1384,float2(12.9898,4.1413999)))*43758.547);
float l9_1386=mix(mix(l9_1379,l9_1381,l9_1377.x),mix(l9_1383,l9_1385,l9_1377.x),l9_1377.y);
float l9_1387=l9_1386*l9_1386;
l9_1309+=(0.015625*l9_1387);
float l9_1388=l9_1309/0.96875;
tempGlobals.N123_fbm=1.0-l9_1388;
}
param_2=N123_Normal;
Normal_N123=param_2;
float param_4=(*sc_set0.UserUniforms).Port_Opacity_N013;
float3 param_5=Normal_N123;
float param_6=(*sc_set0.UserUniforms).Port_Roughness_N013;
ssGlobals param_7=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_7.BumpedNormal=float3x3(float3(param_7.VertexTangent_WorldSpace),float3(param_7.VertexBinormal_WorldSpace),float3(param_7.VertexNormal_WorldSpace))*param_5;
}
float l9_1389=param_4;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1389<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1390=gl_FragCoord;
float2 l9_1391=floor(mod(l9_1390.xy,float2(4.0)));
float l9_1392=(mod(dot(l9_1391,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1389<l9_1392)
{
discard_fragment();
}
}
float3 l9_1393=param_7.PositionWS;
float3 l9_1394=param_7.BumpedNormal;
float l9_1395=param_6;
float3 l9_1396=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_1393);
if (dot(l9_1396,l9_1394)>=(-0.050000001))
{
uint3 l9_1397=uint3(round((l9_1393-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_1397.x,l9_1397.y,l9_1397.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_1398=l9_1394;
float l9_1399=dot(abs(l9_1398),float3(1.0));
l9_1398/=float3(l9_1399);
float l9_1400=fast::clamp(-l9_1398.z,0.0,1.0);
float2 l9_1401=l9_1398.xy;
float l9_1402;
if (l9_1398.x>=0.0)
{
l9_1402=l9_1400;
}
else
{
l9_1402=-l9_1400;
}
l9_1401.x+=l9_1402;
float l9_1403;
if (l9_1398.y>=0.0)
{
l9_1403=l9_1400;
}
else
{
l9_1403=-l9_1400;
}
l9_1401.y+=l9_1403;
float2 l9_1404=l9_1401;
float2 l9_1405=l9_1404;
uint2 l9_1406=uint2(as_type<uint>(half2(float2(l9_1405.x,0.0))),as_type<uint>(half2(float2(l9_1405.y,0.0))));
out.normal_and_more=uint4(l9_1406.x,l9_1406.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_1407;
if (l9_1395<0.0)
{
l9_1407=1023u;
}
else
{
l9_1407=uint(fast::clamp(l9_1395,0.0,1.0)*1000.0);
}
uint l9_1408=l9_1407;
l9_1408 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_1408;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
ssGlobals param_8=Globals;
tempGlobals=param_8;
return out;
}
} // RECEIVER MODE SHADER
