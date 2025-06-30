#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
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
//sampler sampler intensityTextureSmpSC 0:22
//sampler sampler sBoundarySmpSC 0:23
//sampler sampler sColorSmpSC 0:24
//sampler sampler sImpulseTextureSmpSC 0:25
//sampler sampler sTargetSmpSC 0:26
//sampler sampler sVelocitySmpSC 0:27
//sampler sampler sc_ScreenTextureSmpSC 0:32
//sampler sampler userVelocityInputTexSmpSC 0:35
//texture texture2D intensityTexture 0:1:0:22
//texture texture2D sBoundary 0:2:0:23
//texture texture2D sColor 0:3:0:24
//texture texture2D sImpulseTexture 0:4:0:25
//texture texture2D sTarget 0:5:0:26
//texture texture2D sVelocity 0:6:0:27
//texture texture2D sc_ScreenTexture 0:18:0:32
//texture texture2D userVelocityInputTex 0:21:0:35
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:36:4960 {
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
//float correctedIntensity 3824
//float3x3 intensityTextureTransform 3888
//float4 intensityTextureUvMinMax 3936
//float4 intensityTextureBorderColor 3952
//int PreviewEnabled 4116
//float alphaTestThreshold 4124
//float3x3 sVelocityTransform 4176
//float4 sVelocityUvMinMax 4224
//float4 sVelocityBorderColor 4240
//float4 sTargetSize 4256
//float3x3 sTargetTransform 4304
//float4 sTargetUvMinMax 4352
//float4 sTargetBorderColor 4368
//float3x3 sBoundaryTransform 4432
//float4 sBoundaryUvMinMax 4480
//float4 sBoundaryBorderColor 4496
//float3x3 sColorTransform 4560
//float4 sColorUvMinMax 4608
//float4 sColorBorderColor 4624
//float2 velocityRange 4640
//float2 impulseRange 4648
//float diffusionRate 4656
//float timeMult 4660
//int reset 4668
//float impulseMult 4672
//bool useVelocityInputTexture 4676
//bool useVelocityComponentInput 4680
//float3x3 userVelocityInputTexTransform 4736
//float4 userVelocityInputTexUvMinMax 4784
//float4 userVelocityInputTexBorderColor 4800
//float3x3 sImpulseTextureTransform 4864
//float4 sImpulseTextureUvMinMax 4912
//float4 sImpulseTextureBorderColor 4928
//bool buoyancyEnable 4944
//float ambientTemperature 4948
//float buoyancy 4952
//float weight 4956
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sBoundary 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sColor 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sImpulseTexture 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sTarget 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sVelocity 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_userVelocityInputTex 37 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 38 0
//spec_const bool SC_USE_UV_MIN_MAX_sBoundary 39 0
//spec_const bool SC_USE_UV_MIN_MAX_sColor 40 0
//spec_const bool SC_USE_UV_MIN_MAX_sImpulseTexture 41 0
//spec_const bool SC_USE_UV_MIN_MAX_sTarget 42 0
//spec_const bool SC_USE_UV_MIN_MAX_sVelocity 43 0
//spec_const bool SC_USE_UV_MIN_MAX_userVelocityInputTex 44 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 45 0
//spec_const bool SC_USE_UV_TRANSFORM_sBoundary 46 0
//spec_const bool SC_USE_UV_TRANSFORM_sColor 47 0
//spec_const bool SC_USE_UV_TRANSFORM_sImpulseTexture 48 0
//spec_const bool SC_USE_UV_TRANSFORM_sTarget 49 0
//spec_const bool SC_USE_UV_TRANSFORM_sVelocity 50 0
//spec_const bool SC_USE_UV_TRANSFORM_userVelocityInputTex 51 0
//spec_const bool UseViewSpaceDepthVariant 52 1
//spec_const bool intensityTextureHasSwappedViews 53 0
//spec_const bool sBoundaryHasSwappedViews 54 0
//spec_const bool sColorHasSwappedViews 55 0
//spec_const bool sImpulseTextureHasSwappedViews 56 0
//spec_const bool sTargetHasSwappedViews 57 0
//spec_const bool sVelocityHasSwappedViews 58 0
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
//spec_const bool sc_FramebufferFetch 75 0
//spec_const bool sc_MotionVectorsPass 76 0
//spec_const bool sc_OITCompositingPass 77 0
//spec_const bool sc_OITDepthBoundsPass 78 0
//spec_const bool sc_OITDepthGatherPass 79 0
//spec_const bool sc_ProjectiveShadowsCaster 80 0
//spec_const bool sc_ProjectiveShadowsReceiver 81 0
//spec_const bool sc_RenderAlphaToColor 82 0
//spec_const bool sc_ScreenTextureHasSwappedViews 83 0
//spec_const bool sc_ShaderComplexityAnalyzer 84 0
//spec_const bool sc_TAAEnabled 85 0
//spec_const bool sc_UseFramebufferFetchMarker 86 0
//spec_const bool sc_VertexBlendingUseNormals 87 0
//spec_const bool sc_VertexBlending 88 0
//spec_const bool userVelocityInputTexHasSwappedViews 89 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sBoundary 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sColor 92 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sTarget 94 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sVelocity 95 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 97 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sBoundary 98 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sColor 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sTarget 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sVelocity 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex 103 -1
//spec_const int intensityTextureLayout 104 0
//spec_const int sBoundaryLayout 105 0
//spec_const int sColorLayout 106 0
//spec_const int sImpulseTextureLayout 107 0
//spec_const int sTargetLayout 108 0
//spec_const int sVelocityLayout 109 0
//spec_const int sc_DepthBufferMode 110 0
//spec_const int sc_RenderingSpace 111 -1
//spec_const int sc_ScreenTextureLayout 112 0
//spec_const int sc_ShaderCacheConstant 113 0
//spec_const int sc_SkinBonesCount 114 0
//spec_const int sc_StereoRenderingMode 115 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 116 0
//spec_const int userVelocityInputTexLayout 117 0
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
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sBoundary [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_sBoundary_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sBoundary) ? SC_USE_CLAMP_TO_BORDER_sBoundary : false;
constant bool SC_USE_CLAMP_TO_BORDER_sColor [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_sColor_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sColor) ? SC_USE_CLAMP_TO_BORDER_sColor : false;
constant bool SC_USE_CLAMP_TO_BORDER_sImpulseTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_sImpulseTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sImpulseTexture) ? SC_USE_CLAMP_TO_BORDER_sImpulseTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sTarget [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_sTarget_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sTarget) ? SC_USE_CLAMP_TO_BORDER_sTarget : false;
constant bool SC_USE_CLAMP_TO_BORDER_sVelocity [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_sVelocity_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sVelocity) ? SC_USE_CLAMP_TO_BORDER_sVelocity : false;
constant bool SC_USE_CLAMP_TO_BORDER_userVelocityInputTex [[function_constant(37)]];
constant bool SC_USE_CLAMP_TO_BORDER_userVelocityInputTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_userVelocityInputTex) ? SC_USE_CLAMP_TO_BORDER_userVelocityInputTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_sBoundary [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sBoundary) ? SC_USE_UV_MIN_MAX_sBoundary : false;
constant bool SC_USE_UV_MIN_MAX_sColor [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_sColor_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sColor) ? SC_USE_UV_MIN_MAX_sColor : false;
constant bool SC_USE_UV_MIN_MAX_sImpulseTexture [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_sImpulseTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sImpulseTexture) ? SC_USE_UV_MIN_MAX_sImpulseTexture : false;
constant bool SC_USE_UV_MIN_MAX_sTarget [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_sTarget_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sTarget) ? SC_USE_UV_MIN_MAX_sTarget : false;
constant bool SC_USE_UV_MIN_MAX_sVelocity [[function_constant(43)]];
constant bool SC_USE_UV_MIN_MAX_sVelocity_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sVelocity) ? SC_USE_UV_MIN_MAX_sVelocity : false;
constant bool SC_USE_UV_MIN_MAX_userVelocityInputTex [[function_constant(44)]];
constant bool SC_USE_UV_MIN_MAX_userVelocityInputTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_userVelocityInputTex) ? SC_USE_UV_MIN_MAX_userVelocityInputTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_sBoundary [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sBoundary) ? SC_USE_UV_TRANSFORM_sBoundary : false;
constant bool SC_USE_UV_TRANSFORM_sColor [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_sColor_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sColor) ? SC_USE_UV_TRANSFORM_sColor : false;
constant bool SC_USE_UV_TRANSFORM_sImpulseTexture [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_sImpulseTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sImpulseTexture) ? SC_USE_UV_TRANSFORM_sImpulseTexture : false;
constant bool SC_USE_UV_TRANSFORM_sTarget [[function_constant(49)]];
constant bool SC_USE_UV_TRANSFORM_sTarget_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sTarget) ? SC_USE_UV_TRANSFORM_sTarget : false;
constant bool SC_USE_UV_TRANSFORM_sVelocity [[function_constant(50)]];
constant bool SC_USE_UV_TRANSFORM_sVelocity_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sVelocity) ? SC_USE_UV_TRANSFORM_sVelocity : false;
constant bool SC_USE_UV_TRANSFORM_userVelocityInputTex [[function_constant(51)]];
constant bool SC_USE_UV_TRANSFORM_userVelocityInputTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_userVelocityInputTex) ? SC_USE_UV_TRANSFORM_userVelocityInputTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(52)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(53)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sBoundaryHasSwappedViews [[function_constant(54)]];
constant bool sBoundaryHasSwappedViews_tmp = is_function_constant_defined(sBoundaryHasSwappedViews) ? sBoundaryHasSwappedViews : false;
constant bool sColorHasSwappedViews [[function_constant(55)]];
constant bool sColorHasSwappedViews_tmp = is_function_constant_defined(sColorHasSwappedViews) ? sColorHasSwappedViews : false;
constant bool sImpulseTextureHasSwappedViews [[function_constant(56)]];
constant bool sImpulseTextureHasSwappedViews_tmp = is_function_constant_defined(sImpulseTextureHasSwappedViews) ? sImpulseTextureHasSwappedViews : false;
constant bool sTargetHasSwappedViews [[function_constant(57)]];
constant bool sTargetHasSwappedViews_tmp = is_function_constant_defined(sTargetHasSwappedViews) ? sTargetHasSwappedViews : false;
constant bool sVelocityHasSwappedViews [[function_constant(58)]];
constant bool sVelocityHasSwappedViews_tmp = is_function_constant_defined(sVelocityHasSwappedViews) ? sVelocityHasSwappedViews : false;
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
constant bool sc_FramebufferFetch [[function_constant(75)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(76)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(77)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(78)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(79)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(80)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(81)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(82)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(83)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(84)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(85)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(86)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(87)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(88)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool userVelocityInputTexHasSwappedViews [[function_constant(89)]];
constant bool userVelocityInputTexHasSwappedViews_tmp = is_function_constant_defined(userVelocityInputTexHasSwappedViews) ? userVelocityInputTexHasSwappedViews : false;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(90)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary [[function_constant(91)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sBoundary) ? SC_SOFTWARE_WRAP_MODE_U_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sColor [[function_constant(92)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sColor_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sColor) ? SC_SOFTWARE_WRAP_MODE_U_sColor : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture [[function_constant(93)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture) ? SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sTarget [[function_constant(94)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sTarget_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sTarget) ? SC_SOFTWARE_WRAP_MODE_U_sTarget : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sVelocity [[function_constant(95)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sVelocity) ? SC_SOFTWARE_WRAP_MODE_U_sVelocity : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex [[function_constant(96)]];
constant int SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex) ? SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(97)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary [[function_constant(98)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sBoundary) ? SC_SOFTWARE_WRAP_MODE_V_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sColor [[function_constant(99)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sColor_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sColor) ? SC_SOFTWARE_WRAP_MODE_V_sColor : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture [[function_constant(100)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture) ? SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sTarget [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sTarget_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sTarget) ? SC_SOFTWARE_WRAP_MODE_V_sTarget : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sVelocity [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sVelocity) ? SC_SOFTWARE_WRAP_MODE_V_sVelocity : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex) ? SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex : -1;
constant int intensityTextureLayout [[function_constant(104)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sBoundaryLayout [[function_constant(105)]];
constant int sBoundaryLayout_tmp = is_function_constant_defined(sBoundaryLayout) ? sBoundaryLayout : 0;
constant int sColorLayout [[function_constant(106)]];
constant int sColorLayout_tmp = is_function_constant_defined(sColorLayout) ? sColorLayout : 0;
constant int sImpulseTextureLayout [[function_constant(107)]];
constant int sImpulseTextureLayout_tmp = is_function_constant_defined(sImpulseTextureLayout) ? sImpulseTextureLayout : 0;
constant int sTargetLayout [[function_constant(108)]];
constant int sTargetLayout_tmp = is_function_constant_defined(sTargetLayout) ? sTargetLayout : 0;
constant int sVelocityLayout [[function_constant(109)]];
constant int sVelocityLayout_tmp = is_function_constant_defined(sVelocityLayout) ? sVelocityLayout : 0;
constant int sc_DepthBufferMode [[function_constant(110)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(111)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(112)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(113)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(114)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(115)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(116)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int userVelocityInputTexLayout [[function_constant(117)]];
constant int userVelocityInputTexLayout_tmp = is_function_constant_defined(userVelocityInputTexLayout) ? userVelocityInputTexLayout : 0;

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
float4 sVelocitySize;
float4 sVelocityDims;
float4 sVelocityView;
float3x3 sVelocityTransform;
float4 sVelocityUvMinMax;
float4 sVelocityBorderColor;
float4 sTargetSize;
float4 sTargetDims;
float4 sTargetView;
float3x3 sTargetTransform;
float4 sTargetUvMinMax;
float4 sTargetBorderColor;
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float4 sColorSize;
float4 sColorDims;
float4 sColorView;
float3x3 sColorTransform;
float4 sColorUvMinMax;
float4 sColorBorderColor;
float2 velocityRange;
float2 impulseRange;
float diffusionRate;
float timeMult;
int wrapMode;
int reset;
float impulseMult;
int useVelocityInputTexture;
int useVelocityComponentInput;
float4 userVelocityInputTexSize;
float4 userVelocityInputTexDims;
float4 userVelocityInputTexView;
float3x3 userVelocityInputTexTransform;
float4 userVelocityInputTexUvMinMax;
float4 userVelocityInputTexBorderColor;
float4 sImpulseTextureSize;
float4 sImpulseTextureDims;
float4 sImpulseTextureView;
float3x3 sImpulseTextureTransform;
float4 sImpulseTextureUvMinMax;
float4 sImpulseTextureBorderColor;
int buoyancyEnable;
float ambientTemperature;
float buoyancy;
float weight;
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
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sBoundary [[id(2)]];
texture2d<float> sColor [[id(3)]];
texture2d<float> sImpulseTexture [[id(4)]];
texture2d<float> sTarget [[id(5)]];
texture2d<float> sVelocity [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<float> userVelocityInputTex [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler sBoundarySmpSC [[id(23)]];
sampler sColorSmpSC [[id(24)]];
sampler sImpulseTextureSmpSC [[id(25)]];
sampler sTargetSmpSC [[id(26)]];
sampler sVelocitySmpSC [[id(27)]];
sampler sc_ScreenTextureSmpSC [[id(32)]];
sampler userVelocityInputTexSmpSC [[id(35)]];
constant userUniformsObj* UserUniforms [[id(36)]];
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
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPos=param_2;
out.varNormal=normalize(param_3);
float3 l9_119=normalize(param_4);
out.varTangent=float4(l9_119.x,l9_119.y,l9_119.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_120=param_1.position;
float4 l9_121=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_122=0;
}
else
{
l9_122=gl_InstanceIndex%2;
}
int l9_123=l9_122;
l9_121=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_123]*l9_120;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=gl_InstanceIndex%2;
}
int l9_125=l9_124;
l9_121=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_125]*l9_120;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=gl_InstanceIndex%2;
}
int l9_127=l9_126;
l9_121=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_127]*l9_120;
}
else
{
l9_121=l9_120;
}
}
}
float4 l9_128=l9_121;
out.varViewSpaceDepth=-l9_128.z;
}
float4 l9_129=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_129=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
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
l9_129=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_131]*param_1.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
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
l9_129=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_133]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_134=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_134=0;
}
else
{
l9_134=gl_InstanceIndex%2;
}
int l9_135=l9_134;
l9_129=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_135]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_136=param_1.position;
float4 l9_137=l9_136;
if (sc_RenderingSpace_tmp==1)
{
l9_137=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_136;
}
float4 l9_138=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_137;
float2 l9_139=((l9_138.xy/float2(l9_138.w))*0.5)+float2(0.5);
out.varShadowTex=l9_139;
}
float4 l9_140=l9_129;
if (sc_DepthBufferMode_tmp==1)
{
int l9_141=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_141=0;
}
else
{
l9_141=gl_InstanceIndex%2;
}
int l9_142=l9_141;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_142][2].w!=0.0)
{
float l9_143=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_140.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_140.w))*l9_143)-1.0)*l9_140.w;
}
}
float4 l9_144=l9_140;
l9_129=l9_144;
float4 l9_145=l9_129;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_146=l9_145.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_145.w);
l9_145=float4(l9_146.x,l9_146.y,l9_145.z,l9_145.w);
}
float4 l9_147=l9_145;
l9_129=l9_147;
float4 l9_148=l9_129;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_148.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_149=l9_148;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_150=dot(l9_149,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_151=l9_150;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_151;
}
}
float4 l9_152=float4(l9_148.x,-l9_148.y,(l9_148.z*0.5)+(l9_148.w*0.5),l9_148.w);
out.gl_Position=l9_152;
v=param_1;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
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
float4 sVelocitySize;
float4 sVelocityDims;
float4 sVelocityView;
float3x3 sVelocityTransform;
float4 sVelocityUvMinMax;
float4 sVelocityBorderColor;
float4 sTargetSize;
float4 sTargetDims;
float4 sTargetView;
float3x3 sTargetTransform;
float4 sTargetUvMinMax;
float4 sTargetBorderColor;
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float4 sColorSize;
float4 sColorDims;
float4 sColorView;
float3x3 sColorTransform;
float4 sColorUvMinMax;
float4 sColorBorderColor;
float2 velocityRange;
float2 impulseRange;
float diffusionRate;
float timeMult;
int wrapMode;
int reset;
float impulseMult;
int useVelocityInputTexture;
int useVelocityComponentInput;
float4 userVelocityInputTexSize;
float4 userVelocityInputTexDims;
float4 userVelocityInputTexView;
float3x3 userVelocityInputTexTransform;
float4 userVelocityInputTexUvMinMax;
float4 userVelocityInputTexBorderColor;
float4 sImpulseTextureSize;
float4 sImpulseTextureDims;
float4 sImpulseTextureView;
float3x3 sImpulseTextureTransform;
float4 sImpulseTextureUvMinMax;
float4 sImpulseTextureBorderColor;
int buoyancyEnable;
float ambientTemperature;
float buoyancy;
float weight;
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
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sBoundary [[id(2)]];
texture2d<float> sColor [[id(3)]];
texture2d<float> sImpulseTexture [[id(4)]];
texture2d<float> sTarget [[id(5)]];
texture2d<float> sVelocity [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<float> userVelocityInputTex [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler sBoundarySmpSC [[id(23)]];
sampler sColorSmpSC [[id(24)]];
sampler sImpulseTextureSmpSC [[id(25)]];
sampler sTargetSmpSC [[id(26)]];
sampler sVelocitySmpSC [[id(27)]];
sampler sc_ScreenTextureSmpSC [[id(32)]];
sampler userVelocityInputTexSmpSC [[id(35)]];
constant userUniformsObj* UserUniforms [[id(36)]];
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
int N50_reset=0;
bool N50_useUserInputTexture=false;
bool N50_useComponentInputTexture=false;
bool N50_buoyancyEnable=false;
float2 N50_velocityRange=float2(0.0);
float2 N50_impulseRange=float2(0.0);
float N50_diffusionRate=0.0;
float N50_timeMult=0.0;
float N50_impulseMult=0.0;
float N50_ambientTemp=0.0;
float N50_buoyancy=0.0;
float N50_weight=0.0;
float4 N50_velocityOut=float4(0.0);
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
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float2 Output_N5=float2(0.0);
float2 param=(*sc_set0.UserUniforms).velocityRange;
Output_N5=param;
float2 Output_N86=float2(0.0);
float2 param_1=(*sc_set0.UserUniforms).impulseRange;
Output_N86=param_1;
float Output_N8=0.0;
float param_2=(*sc_set0.UserUniforms).diffusionRate;
Output_N8=param_2;
float Output_N3=0.0;
float param_3=(*sc_set0.UserUniforms).timeMult;
Output_N3=param_3;
float Output_N9=0.0;
float param_4=float((*sc_set0.UserUniforms).reset);
Output_N9=param_4;
float Output_N6=0.0;
float param_5=(*sc_set0.UserUniforms).impulseMult;
Output_N6=param_5;
float Output_N80=0.0;
float param_6=float((*sc_set0.UserUniforms).useVelocityInputTexture!=0);
Output_N80=param_6;
float Output_N48=0.0;
float param_7=float((*sc_set0.UserUniforms).useVelocityComponentInput!=0);
Output_N48=param_7;
float Output_N13=0.0;
float param_8=float((*sc_set0.UserUniforms).buoyancyEnable!=0);
Output_N13=param_8;
float Output_N14=0.0;
float param_9=(*sc_set0.UserUniforms).ambientTemperature;
Output_N14=param_9;
float Output_N15=0.0;
float param_10=(*sc_set0.UserUniforms).buoyancy;
Output_N15=param_10;
float Output_N16=0.0;
float param_11=(*sc_set0.UserUniforms).weight;
Output_N16=param_11;
float4 velocityOut_N50=float4(0.0);
float2 param_12=Output_N5;
float2 param_13=Output_N86;
float param_14=Output_N8;
float param_15=Output_N3;
float param_16=Output_N9;
float param_17=Output_N6;
float param_18=Output_N80;
float param_19=Output_N48;
float param_20=Output_N13;
float param_21=Output_N14;
float param_22=Output_N15;
float param_23=Output_N16;
ssGlobals param_25=Globals;
ssGlobals tempGlobals=param_25;
float4 param_24=float4(0.0);
N50_velocityRange=param_12;
N50_impulseRange=param_13;
N50_diffusionRate=param_14;
N50_timeMult=param_15;
N50_reset=int(param_16);
N50_impulseMult=param_17;
N50_useUserInputTexture=param_18!=0.0;
N50_useComponentInputTexture=param_19!=0.0;
N50_buoyancyEnable=param_20!=0.0;
N50_ambientTemp=param_21;
N50_buoyancy=param_22;
N50_weight=param_23;
float2 l9_0=tempGlobals.Surface_UVCoord0;
float2 l9_1=l9_0;
float l9_2=tempGlobals.gTimeDelta;
float l9_3=l9_2*N50_timeMult;
float2 l9_4=l9_1;
float4 l9_5=float4(0.0);
int l9_6=0;
if ((int(sVelocityHasSwappedViews_tmp)!=0))
{
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
l9_6=1-l9_8;
}
else
{
int l9_9=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9=0;
}
else
{
l9_9=in.varStereoViewID;
}
int l9_10=l9_9;
l9_6=l9_10;
}
int l9_11=l9_6;
int l9_12=sVelocityLayout_tmp;
int l9_13=l9_11;
float2 l9_14=l9_4;
bool l9_15=(int(SC_USE_UV_TRANSFORM_sVelocity_tmp)!=0);
float3x3 l9_16=(*sc_set0.UserUniforms).sVelocityTransform;
int2 l9_17=int2(SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp,SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp);
bool l9_18=(int(SC_USE_UV_MIN_MAX_sVelocity_tmp)!=0);
float4 l9_19=(*sc_set0.UserUniforms).sVelocityUvMinMax;
bool l9_20=(int(SC_USE_CLAMP_TO_BORDER_sVelocity_tmp)!=0);
float4 l9_21=(*sc_set0.UserUniforms).sVelocityBorderColor;
float l9_22=0.0;
bool l9_23=l9_20&&(!l9_18);
float l9_24=1.0;
float l9_25=l9_14.x;
int l9_26=l9_17.x;
if (l9_26==1)
{
l9_25=fract(l9_25);
}
else
{
if (l9_26==2)
{
float l9_27=fract(l9_25);
float l9_28=l9_25-l9_27;
float l9_29=step(0.25,fract(l9_28*0.5));
l9_25=mix(l9_27,1.0-l9_27,fast::clamp(l9_29,0.0,1.0));
}
}
l9_14.x=l9_25;
float l9_30=l9_14.y;
int l9_31=l9_17.y;
if (l9_31==1)
{
l9_30=fract(l9_30);
}
else
{
if (l9_31==2)
{
float l9_32=fract(l9_30);
float l9_33=l9_30-l9_32;
float l9_34=step(0.25,fract(l9_33*0.5));
l9_30=mix(l9_32,1.0-l9_32,fast::clamp(l9_34,0.0,1.0));
}
}
l9_14.y=l9_30;
if (l9_18)
{
bool l9_35=l9_20;
bool l9_36;
if (l9_35)
{
l9_36=l9_17.x==3;
}
else
{
l9_36=l9_35;
}
float l9_37=l9_14.x;
float l9_38=l9_19.x;
float l9_39=l9_19.z;
bool l9_40=l9_36;
float l9_41=l9_24;
float l9_42=fast::clamp(l9_37,l9_38,l9_39);
float l9_43=step(abs(l9_37-l9_42),9.9999997e-06);
l9_41*=(l9_43+((1.0-float(l9_40))*(1.0-l9_43)));
l9_37=l9_42;
l9_14.x=l9_37;
l9_24=l9_41;
bool l9_44=l9_20;
bool l9_45;
if (l9_44)
{
l9_45=l9_17.y==3;
}
else
{
l9_45=l9_44;
}
float l9_46=l9_14.y;
float l9_47=l9_19.y;
float l9_48=l9_19.w;
bool l9_49=l9_45;
float l9_50=l9_24;
float l9_51=fast::clamp(l9_46,l9_47,l9_48);
float l9_52=step(abs(l9_46-l9_51),9.9999997e-06);
l9_50*=(l9_52+((1.0-float(l9_49))*(1.0-l9_52)));
l9_46=l9_51;
l9_14.y=l9_46;
l9_24=l9_50;
}
float2 l9_53=l9_14;
bool l9_54=l9_15;
float3x3 l9_55=l9_16;
if (l9_54)
{
l9_53=float2((l9_55*float3(l9_53,1.0)).xy);
}
float2 l9_56=l9_53;
float2 l9_57=l9_56;
float2 l9_58=l9_57;
l9_14=l9_58;
float l9_59=l9_14.x;
int l9_60=l9_17.x;
bool l9_61=l9_23;
float l9_62=l9_24;
if ((l9_60==0)||(l9_60==3))
{
float l9_63=l9_59;
float l9_64=0.0;
float l9_65=1.0;
bool l9_66=l9_61;
float l9_67=l9_62;
float l9_68=fast::clamp(l9_63,l9_64,l9_65);
float l9_69=step(abs(l9_63-l9_68),9.9999997e-06);
l9_67*=(l9_69+((1.0-float(l9_66))*(1.0-l9_69)));
l9_63=l9_68;
l9_59=l9_63;
l9_62=l9_67;
}
l9_14.x=l9_59;
l9_24=l9_62;
float l9_70=l9_14.y;
int l9_71=l9_17.y;
bool l9_72=l9_23;
float l9_73=l9_24;
if ((l9_71==0)||(l9_71==3))
{
float l9_74=l9_70;
float l9_75=0.0;
float l9_76=1.0;
bool l9_77=l9_72;
float l9_78=l9_73;
float l9_79=fast::clamp(l9_74,l9_75,l9_76);
float l9_80=step(abs(l9_74-l9_79),9.9999997e-06);
l9_78*=(l9_80+((1.0-float(l9_77))*(1.0-l9_80)));
l9_74=l9_79;
l9_70=l9_74;
l9_73=l9_78;
}
l9_14.y=l9_70;
l9_24=l9_73;
float2 l9_81=l9_14;
int l9_82=l9_12;
int l9_83=l9_13;
float l9_84=l9_22;
float2 l9_85=l9_81;
int l9_86=l9_82;
int l9_87=l9_83;
float3 l9_88=float3(0.0);
if (l9_86==0)
{
l9_88=float3(l9_85,0.0);
}
else
{
if (l9_86==1)
{
l9_88=float3(l9_85.x,(l9_85.y*0.5)+(0.5-(float(l9_87)*0.5)),0.0);
}
else
{
l9_88=float3(l9_85,float(l9_87));
}
}
float3 l9_89=l9_88;
float3 l9_90=l9_89;
float2 l9_91=l9_90.xy;
float l9_92=l9_84;
float4 l9_93=sc_set0.sVelocity.sample(sc_set0.sVelocitySmpSC,l9_91,bias(l9_92));
float4 l9_94=l9_93;
float4 l9_95=l9_94;
if (l9_20)
{
l9_95=mix(l9_21,l9_95,float4(l9_24));
}
float4 l9_96=l9_95;
l9_5=l9_96;
float4 l9_97=l9_5;
float4 l9_98=l9_97;
float2 l9_99=l9_98.xy;
float l9_100=N50_velocityRange.x;
float l9_101=N50_velocityRange.y;
float l9_102=0.0;
float2 l9_103=l9_99;
float l9_104=l9_100;
float l9_105=l9_101;
float l9_106=0.99998999;
float2 l9_107=l9_103;
#if (1)
{
l9_107=floor((l9_107*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_108=dot(l9_107,float2(1.0,0.0039215689));
float l9_109=l9_108;
float l9_110=0.0;
float l9_111=l9_106;
float l9_112=l9_104;
float l9_113=l9_105;
float l9_114=l9_112+(((l9_109-l9_110)*(l9_113-l9_112))/(l9_111-l9_110));
float l9_115=l9_114;
l9_102=l9_115;
float l9_116=l9_102;
float l9_117=l9_116;
float2 l9_118=l9_98.zw;
float l9_119=N50_velocityRange.x;
float l9_120=N50_velocityRange.y;
float l9_121=0.0;
float2 l9_122=l9_118;
float l9_123=l9_119;
float l9_124=l9_120;
float l9_125=0.99998999;
float2 l9_126=l9_122;
#if (1)
{
l9_126=floor((l9_126*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_127=dot(l9_126,float2(1.0,0.0039215689));
float l9_128=l9_127;
float l9_129=0.0;
float l9_130=l9_125;
float l9_131=l9_123;
float l9_132=l9_124;
float l9_133=l9_131+(((l9_128-l9_129)*(l9_132-l9_131))/(l9_130-l9_129));
float l9_134=l9_133;
l9_121=l9_134;
float l9_135=l9_121;
float2 l9_136=float2(l9_117,l9_135);
float2 l9_137=l9_1-(l9_136*l9_3);
float2 l9_138=l9_137;
float2 l9_139=float2(0.0);
l9_139=(*sc_set0.UserUniforms).sTargetSize.zw;
float2 l9_140=l9_139;
float2 l9_141=l9_140;
l9_138=((l9_138/l9_141)-float2(0.5))-(l9_141*0.5);
float2 l9_142=fract(l9_138);
l9_138=floor(l9_138);
float2 l9_143=(l9_138+float2(0.5))*l9_141;
float2 l9_144=l9_143;
float4 l9_145=float4(0.0);
int l9_146=0;
if ((int(sTargetHasSwappedViews_tmp)!=0))
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=in.varStereoViewID;
}
int l9_148=l9_147;
l9_146=1-l9_148;
}
else
{
int l9_149=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_149=0;
}
else
{
l9_149=in.varStereoViewID;
}
int l9_150=l9_149;
l9_146=l9_150;
}
int l9_151=l9_146;
int l9_152=sTargetLayout_tmp;
int l9_153=l9_151;
float2 l9_154=l9_144;
bool l9_155=(int(SC_USE_UV_TRANSFORM_sTarget_tmp)!=0);
float3x3 l9_156=(*sc_set0.UserUniforms).sTargetTransform;
int2 l9_157=int2(SC_SOFTWARE_WRAP_MODE_U_sTarget_tmp,SC_SOFTWARE_WRAP_MODE_V_sTarget_tmp);
bool l9_158=(int(SC_USE_UV_MIN_MAX_sTarget_tmp)!=0);
float4 l9_159=(*sc_set0.UserUniforms).sTargetUvMinMax;
bool l9_160=(int(SC_USE_CLAMP_TO_BORDER_sTarget_tmp)!=0);
float4 l9_161=(*sc_set0.UserUniforms).sTargetBorderColor;
float l9_162=0.0;
bool l9_163=l9_160&&(!l9_158);
float l9_164=1.0;
float l9_165=l9_154.x;
int l9_166=l9_157.x;
if (l9_166==1)
{
l9_165=fract(l9_165);
}
else
{
if (l9_166==2)
{
float l9_167=fract(l9_165);
float l9_168=l9_165-l9_167;
float l9_169=step(0.25,fract(l9_168*0.5));
l9_165=mix(l9_167,1.0-l9_167,fast::clamp(l9_169,0.0,1.0));
}
}
l9_154.x=l9_165;
float l9_170=l9_154.y;
int l9_171=l9_157.y;
if (l9_171==1)
{
l9_170=fract(l9_170);
}
else
{
if (l9_171==2)
{
float l9_172=fract(l9_170);
float l9_173=l9_170-l9_172;
float l9_174=step(0.25,fract(l9_173*0.5));
l9_170=mix(l9_172,1.0-l9_172,fast::clamp(l9_174,0.0,1.0));
}
}
l9_154.y=l9_170;
if (l9_158)
{
bool l9_175=l9_160;
bool l9_176;
if (l9_175)
{
l9_176=l9_157.x==3;
}
else
{
l9_176=l9_175;
}
float l9_177=l9_154.x;
float l9_178=l9_159.x;
float l9_179=l9_159.z;
bool l9_180=l9_176;
float l9_181=l9_164;
float l9_182=fast::clamp(l9_177,l9_178,l9_179);
float l9_183=step(abs(l9_177-l9_182),9.9999997e-06);
l9_181*=(l9_183+((1.0-float(l9_180))*(1.0-l9_183)));
l9_177=l9_182;
l9_154.x=l9_177;
l9_164=l9_181;
bool l9_184=l9_160;
bool l9_185;
if (l9_184)
{
l9_185=l9_157.y==3;
}
else
{
l9_185=l9_184;
}
float l9_186=l9_154.y;
float l9_187=l9_159.y;
float l9_188=l9_159.w;
bool l9_189=l9_185;
float l9_190=l9_164;
float l9_191=fast::clamp(l9_186,l9_187,l9_188);
float l9_192=step(abs(l9_186-l9_191),9.9999997e-06);
l9_190*=(l9_192+((1.0-float(l9_189))*(1.0-l9_192)));
l9_186=l9_191;
l9_154.y=l9_186;
l9_164=l9_190;
}
float2 l9_193=l9_154;
bool l9_194=l9_155;
float3x3 l9_195=l9_156;
if (l9_194)
{
l9_193=float2((l9_195*float3(l9_193,1.0)).xy);
}
float2 l9_196=l9_193;
float2 l9_197=l9_196;
float2 l9_198=l9_197;
l9_154=l9_198;
float l9_199=l9_154.x;
int l9_200=l9_157.x;
bool l9_201=l9_163;
float l9_202=l9_164;
if ((l9_200==0)||(l9_200==3))
{
float l9_203=l9_199;
float l9_204=0.0;
float l9_205=1.0;
bool l9_206=l9_201;
float l9_207=l9_202;
float l9_208=fast::clamp(l9_203,l9_204,l9_205);
float l9_209=step(abs(l9_203-l9_208),9.9999997e-06);
l9_207*=(l9_209+((1.0-float(l9_206))*(1.0-l9_209)));
l9_203=l9_208;
l9_199=l9_203;
l9_202=l9_207;
}
l9_154.x=l9_199;
l9_164=l9_202;
float l9_210=l9_154.y;
int l9_211=l9_157.y;
bool l9_212=l9_163;
float l9_213=l9_164;
if ((l9_211==0)||(l9_211==3))
{
float l9_214=l9_210;
float l9_215=0.0;
float l9_216=1.0;
bool l9_217=l9_212;
float l9_218=l9_213;
float l9_219=fast::clamp(l9_214,l9_215,l9_216);
float l9_220=step(abs(l9_214-l9_219),9.9999997e-06);
l9_218*=(l9_220+((1.0-float(l9_217))*(1.0-l9_220)));
l9_214=l9_219;
l9_210=l9_214;
l9_213=l9_218;
}
l9_154.y=l9_210;
l9_164=l9_213;
float2 l9_221=l9_154;
int l9_222=l9_152;
int l9_223=l9_153;
float l9_224=l9_162;
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
float4 l9_233=sc_set0.sTarget.sample(sc_set0.sTargetSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
float4 l9_235=l9_234;
if (l9_160)
{
l9_235=mix(l9_161,l9_235,float4(l9_164));
}
float4 l9_236=l9_235;
l9_145=l9_236;
float4 l9_237=l9_145;
float4 l9_238=l9_237;
float2 l9_239=l9_238.xy;
float l9_240=N50_velocityRange.x;
float l9_241=N50_velocityRange.y;
float l9_242=0.0;
float2 l9_243=l9_239;
float l9_244=l9_240;
float l9_245=l9_241;
float l9_246=0.99998999;
float2 l9_247=l9_243;
#if (1)
{
l9_247=floor((l9_247*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_248=dot(l9_247,float2(1.0,0.0039215689));
float l9_249=l9_248;
float l9_250=0.0;
float l9_251=l9_246;
float l9_252=l9_244;
float l9_253=l9_245;
float l9_254=l9_252+(((l9_249-l9_250)*(l9_253-l9_252))/(l9_251-l9_250));
float l9_255=l9_254;
l9_242=l9_255;
float l9_256=l9_242;
float l9_257=l9_256;
float2 l9_258=l9_238.zw;
float l9_259=N50_velocityRange.x;
float l9_260=N50_velocityRange.y;
float l9_261=0.0;
float2 l9_262=l9_258;
float l9_263=l9_259;
float l9_264=l9_260;
float l9_265=0.99998999;
float2 l9_266=l9_262;
#if (1)
{
l9_266=floor((l9_266*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_267=dot(l9_266,float2(1.0,0.0039215689));
float l9_268=l9_267;
float l9_269=0.0;
float l9_270=l9_265;
float l9_271=l9_263;
float l9_272=l9_264;
float l9_273=l9_271+(((l9_268-l9_269)*(l9_272-l9_271))/(l9_270-l9_269));
float l9_274=l9_273;
l9_261=l9_274;
float l9_275=l9_261;
float2 l9_276=float2(l9_257,l9_275);
float2 l9_277=l9_276;
float2 l9_278=l9_277;
float2 l9_279=(l9_138+float2(1.5,0.5))*l9_141;
float2 l9_280=l9_279;
float4 l9_281=float4(0.0);
int l9_282=0;
if ((int(sTargetHasSwappedViews_tmp)!=0))
{
int l9_283=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_283=0;
}
else
{
l9_283=in.varStereoViewID;
}
int l9_284=l9_283;
l9_282=1-l9_284;
}
else
{
int l9_285=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_285=0;
}
else
{
l9_285=in.varStereoViewID;
}
int l9_286=l9_285;
l9_282=l9_286;
}
int l9_287=l9_282;
int l9_288=sTargetLayout_tmp;
int l9_289=l9_287;
float2 l9_290=l9_280;
bool l9_291=(int(SC_USE_UV_TRANSFORM_sTarget_tmp)!=0);
float3x3 l9_292=(*sc_set0.UserUniforms).sTargetTransform;
int2 l9_293=int2(SC_SOFTWARE_WRAP_MODE_U_sTarget_tmp,SC_SOFTWARE_WRAP_MODE_V_sTarget_tmp);
bool l9_294=(int(SC_USE_UV_MIN_MAX_sTarget_tmp)!=0);
float4 l9_295=(*sc_set0.UserUniforms).sTargetUvMinMax;
bool l9_296=(int(SC_USE_CLAMP_TO_BORDER_sTarget_tmp)!=0);
float4 l9_297=(*sc_set0.UserUniforms).sTargetBorderColor;
float l9_298=0.0;
bool l9_299=l9_296&&(!l9_294);
float l9_300=1.0;
float l9_301=l9_290.x;
int l9_302=l9_293.x;
if (l9_302==1)
{
l9_301=fract(l9_301);
}
else
{
if (l9_302==2)
{
float l9_303=fract(l9_301);
float l9_304=l9_301-l9_303;
float l9_305=step(0.25,fract(l9_304*0.5));
l9_301=mix(l9_303,1.0-l9_303,fast::clamp(l9_305,0.0,1.0));
}
}
l9_290.x=l9_301;
float l9_306=l9_290.y;
int l9_307=l9_293.y;
if (l9_307==1)
{
l9_306=fract(l9_306);
}
else
{
if (l9_307==2)
{
float l9_308=fract(l9_306);
float l9_309=l9_306-l9_308;
float l9_310=step(0.25,fract(l9_309*0.5));
l9_306=mix(l9_308,1.0-l9_308,fast::clamp(l9_310,0.0,1.0));
}
}
l9_290.y=l9_306;
if (l9_294)
{
bool l9_311=l9_296;
bool l9_312;
if (l9_311)
{
l9_312=l9_293.x==3;
}
else
{
l9_312=l9_311;
}
float l9_313=l9_290.x;
float l9_314=l9_295.x;
float l9_315=l9_295.z;
bool l9_316=l9_312;
float l9_317=l9_300;
float l9_318=fast::clamp(l9_313,l9_314,l9_315);
float l9_319=step(abs(l9_313-l9_318),9.9999997e-06);
l9_317*=(l9_319+((1.0-float(l9_316))*(1.0-l9_319)));
l9_313=l9_318;
l9_290.x=l9_313;
l9_300=l9_317;
bool l9_320=l9_296;
bool l9_321;
if (l9_320)
{
l9_321=l9_293.y==3;
}
else
{
l9_321=l9_320;
}
float l9_322=l9_290.y;
float l9_323=l9_295.y;
float l9_324=l9_295.w;
bool l9_325=l9_321;
float l9_326=l9_300;
float l9_327=fast::clamp(l9_322,l9_323,l9_324);
float l9_328=step(abs(l9_322-l9_327),9.9999997e-06);
l9_326*=(l9_328+((1.0-float(l9_325))*(1.0-l9_328)));
l9_322=l9_327;
l9_290.y=l9_322;
l9_300=l9_326;
}
float2 l9_329=l9_290;
bool l9_330=l9_291;
float3x3 l9_331=l9_292;
if (l9_330)
{
l9_329=float2((l9_331*float3(l9_329,1.0)).xy);
}
float2 l9_332=l9_329;
float2 l9_333=l9_332;
float2 l9_334=l9_333;
l9_290=l9_334;
float l9_335=l9_290.x;
int l9_336=l9_293.x;
bool l9_337=l9_299;
float l9_338=l9_300;
if ((l9_336==0)||(l9_336==3))
{
float l9_339=l9_335;
float l9_340=0.0;
float l9_341=1.0;
bool l9_342=l9_337;
float l9_343=l9_338;
float l9_344=fast::clamp(l9_339,l9_340,l9_341);
float l9_345=step(abs(l9_339-l9_344),9.9999997e-06);
l9_343*=(l9_345+((1.0-float(l9_342))*(1.0-l9_345)));
l9_339=l9_344;
l9_335=l9_339;
l9_338=l9_343;
}
l9_290.x=l9_335;
l9_300=l9_338;
float l9_346=l9_290.y;
int l9_347=l9_293.y;
bool l9_348=l9_299;
float l9_349=l9_300;
if ((l9_347==0)||(l9_347==3))
{
float l9_350=l9_346;
float l9_351=0.0;
float l9_352=1.0;
bool l9_353=l9_348;
float l9_354=l9_349;
float l9_355=fast::clamp(l9_350,l9_351,l9_352);
float l9_356=step(abs(l9_350-l9_355),9.9999997e-06);
l9_354*=(l9_356+((1.0-float(l9_353))*(1.0-l9_356)));
l9_350=l9_355;
l9_346=l9_350;
l9_349=l9_354;
}
l9_290.y=l9_346;
l9_300=l9_349;
float2 l9_357=l9_290;
int l9_358=l9_288;
int l9_359=l9_289;
float l9_360=l9_298;
float2 l9_361=l9_357;
int l9_362=l9_358;
int l9_363=l9_359;
float3 l9_364=float3(0.0);
if (l9_362==0)
{
l9_364=float3(l9_361,0.0);
}
else
{
if (l9_362==1)
{
l9_364=float3(l9_361.x,(l9_361.y*0.5)+(0.5-(float(l9_363)*0.5)),0.0);
}
else
{
l9_364=float3(l9_361,float(l9_363));
}
}
float3 l9_365=l9_364;
float3 l9_366=l9_365;
float2 l9_367=l9_366.xy;
float l9_368=l9_360;
float4 l9_369=sc_set0.sTarget.sample(sc_set0.sTargetSmpSC,l9_367,bias(l9_368));
float4 l9_370=l9_369;
float4 l9_371=l9_370;
if (l9_296)
{
l9_371=mix(l9_297,l9_371,float4(l9_300));
}
float4 l9_372=l9_371;
l9_281=l9_372;
float4 l9_373=l9_281;
float4 l9_374=l9_373;
float2 l9_375=l9_374.xy;
float l9_376=N50_velocityRange.x;
float l9_377=N50_velocityRange.y;
float l9_378=0.0;
float2 l9_379=l9_375;
float l9_380=l9_376;
float l9_381=l9_377;
float l9_382=0.99998999;
float2 l9_383=l9_379;
#if (1)
{
l9_383=floor((l9_383*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_384=dot(l9_383,float2(1.0,0.0039215689));
float l9_385=l9_384;
float l9_386=0.0;
float l9_387=l9_382;
float l9_388=l9_380;
float l9_389=l9_381;
float l9_390=l9_388+(((l9_385-l9_386)*(l9_389-l9_388))/(l9_387-l9_386));
float l9_391=l9_390;
l9_378=l9_391;
float l9_392=l9_378;
float l9_393=l9_392;
float2 l9_394=l9_374.zw;
float l9_395=N50_velocityRange.x;
float l9_396=N50_velocityRange.y;
float l9_397=0.0;
float2 l9_398=l9_394;
float l9_399=l9_395;
float l9_400=l9_396;
float l9_401=0.99998999;
float2 l9_402=l9_398;
#if (1)
{
l9_402=floor((l9_402*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_403=dot(l9_402,float2(1.0,0.0039215689));
float l9_404=l9_403;
float l9_405=0.0;
float l9_406=l9_401;
float l9_407=l9_399;
float l9_408=l9_400;
float l9_409=l9_407+(((l9_404-l9_405)*(l9_408-l9_407))/(l9_406-l9_405));
float l9_410=l9_409;
l9_397=l9_410;
float l9_411=l9_397;
float2 l9_412=float2(l9_393,l9_411);
float2 l9_413=l9_412;
float2 l9_414=l9_413;
float2 l9_415=(l9_138+float2(0.5,1.5))*l9_141;
float2 l9_416=l9_415;
float4 l9_417=float4(0.0);
int l9_418=0;
if ((int(sTargetHasSwappedViews_tmp)!=0))
{
int l9_419=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_419=0;
}
else
{
l9_419=in.varStereoViewID;
}
int l9_420=l9_419;
l9_418=1-l9_420;
}
else
{
int l9_421=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_421=0;
}
else
{
l9_421=in.varStereoViewID;
}
int l9_422=l9_421;
l9_418=l9_422;
}
int l9_423=l9_418;
int l9_424=sTargetLayout_tmp;
int l9_425=l9_423;
float2 l9_426=l9_416;
bool l9_427=(int(SC_USE_UV_TRANSFORM_sTarget_tmp)!=0);
float3x3 l9_428=(*sc_set0.UserUniforms).sTargetTransform;
int2 l9_429=int2(SC_SOFTWARE_WRAP_MODE_U_sTarget_tmp,SC_SOFTWARE_WRAP_MODE_V_sTarget_tmp);
bool l9_430=(int(SC_USE_UV_MIN_MAX_sTarget_tmp)!=0);
float4 l9_431=(*sc_set0.UserUniforms).sTargetUvMinMax;
bool l9_432=(int(SC_USE_CLAMP_TO_BORDER_sTarget_tmp)!=0);
float4 l9_433=(*sc_set0.UserUniforms).sTargetBorderColor;
float l9_434=0.0;
bool l9_435=l9_432&&(!l9_430);
float l9_436=1.0;
float l9_437=l9_426.x;
int l9_438=l9_429.x;
if (l9_438==1)
{
l9_437=fract(l9_437);
}
else
{
if (l9_438==2)
{
float l9_439=fract(l9_437);
float l9_440=l9_437-l9_439;
float l9_441=step(0.25,fract(l9_440*0.5));
l9_437=mix(l9_439,1.0-l9_439,fast::clamp(l9_441,0.0,1.0));
}
}
l9_426.x=l9_437;
float l9_442=l9_426.y;
int l9_443=l9_429.y;
if (l9_443==1)
{
l9_442=fract(l9_442);
}
else
{
if (l9_443==2)
{
float l9_444=fract(l9_442);
float l9_445=l9_442-l9_444;
float l9_446=step(0.25,fract(l9_445*0.5));
l9_442=mix(l9_444,1.0-l9_444,fast::clamp(l9_446,0.0,1.0));
}
}
l9_426.y=l9_442;
if (l9_430)
{
bool l9_447=l9_432;
bool l9_448;
if (l9_447)
{
l9_448=l9_429.x==3;
}
else
{
l9_448=l9_447;
}
float l9_449=l9_426.x;
float l9_450=l9_431.x;
float l9_451=l9_431.z;
bool l9_452=l9_448;
float l9_453=l9_436;
float l9_454=fast::clamp(l9_449,l9_450,l9_451);
float l9_455=step(abs(l9_449-l9_454),9.9999997e-06);
l9_453*=(l9_455+((1.0-float(l9_452))*(1.0-l9_455)));
l9_449=l9_454;
l9_426.x=l9_449;
l9_436=l9_453;
bool l9_456=l9_432;
bool l9_457;
if (l9_456)
{
l9_457=l9_429.y==3;
}
else
{
l9_457=l9_456;
}
float l9_458=l9_426.y;
float l9_459=l9_431.y;
float l9_460=l9_431.w;
bool l9_461=l9_457;
float l9_462=l9_436;
float l9_463=fast::clamp(l9_458,l9_459,l9_460);
float l9_464=step(abs(l9_458-l9_463),9.9999997e-06);
l9_462*=(l9_464+((1.0-float(l9_461))*(1.0-l9_464)));
l9_458=l9_463;
l9_426.y=l9_458;
l9_436=l9_462;
}
float2 l9_465=l9_426;
bool l9_466=l9_427;
float3x3 l9_467=l9_428;
if (l9_466)
{
l9_465=float2((l9_467*float3(l9_465,1.0)).xy);
}
float2 l9_468=l9_465;
float2 l9_469=l9_468;
float2 l9_470=l9_469;
l9_426=l9_470;
float l9_471=l9_426.x;
int l9_472=l9_429.x;
bool l9_473=l9_435;
float l9_474=l9_436;
if ((l9_472==0)||(l9_472==3))
{
float l9_475=l9_471;
float l9_476=0.0;
float l9_477=1.0;
bool l9_478=l9_473;
float l9_479=l9_474;
float l9_480=fast::clamp(l9_475,l9_476,l9_477);
float l9_481=step(abs(l9_475-l9_480),9.9999997e-06);
l9_479*=(l9_481+((1.0-float(l9_478))*(1.0-l9_481)));
l9_475=l9_480;
l9_471=l9_475;
l9_474=l9_479;
}
l9_426.x=l9_471;
l9_436=l9_474;
float l9_482=l9_426.y;
int l9_483=l9_429.y;
bool l9_484=l9_435;
float l9_485=l9_436;
if ((l9_483==0)||(l9_483==3))
{
float l9_486=l9_482;
float l9_487=0.0;
float l9_488=1.0;
bool l9_489=l9_484;
float l9_490=l9_485;
float l9_491=fast::clamp(l9_486,l9_487,l9_488);
float l9_492=step(abs(l9_486-l9_491),9.9999997e-06);
l9_490*=(l9_492+((1.0-float(l9_489))*(1.0-l9_492)));
l9_486=l9_491;
l9_482=l9_486;
l9_485=l9_490;
}
l9_426.y=l9_482;
l9_436=l9_485;
float2 l9_493=l9_426;
int l9_494=l9_424;
int l9_495=l9_425;
float l9_496=l9_434;
float2 l9_497=l9_493;
int l9_498=l9_494;
int l9_499=l9_495;
float3 l9_500=float3(0.0);
if (l9_498==0)
{
l9_500=float3(l9_497,0.0);
}
else
{
if (l9_498==1)
{
l9_500=float3(l9_497.x,(l9_497.y*0.5)+(0.5-(float(l9_499)*0.5)),0.0);
}
else
{
l9_500=float3(l9_497,float(l9_499));
}
}
float3 l9_501=l9_500;
float3 l9_502=l9_501;
float2 l9_503=l9_502.xy;
float l9_504=l9_496;
float4 l9_505=sc_set0.sTarget.sample(sc_set0.sTargetSmpSC,l9_503,bias(l9_504));
float4 l9_506=l9_505;
float4 l9_507=l9_506;
if (l9_432)
{
l9_507=mix(l9_433,l9_507,float4(l9_436));
}
float4 l9_508=l9_507;
l9_417=l9_508;
float4 l9_509=l9_417;
float4 l9_510=l9_509;
float2 l9_511=l9_510.xy;
float l9_512=N50_velocityRange.x;
float l9_513=N50_velocityRange.y;
float l9_514=0.0;
float2 l9_515=l9_511;
float l9_516=l9_512;
float l9_517=l9_513;
float l9_518=0.99998999;
float2 l9_519=l9_515;
#if (1)
{
l9_519=floor((l9_519*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_520=dot(l9_519,float2(1.0,0.0039215689));
float l9_521=l9_520;
float l9_522=0.0;
float l9_523=l9_518;
float l9_524=l9_516;
float l9_525=l9_517;
float l9_526=l9_524+(((l9_521-l9_522)*(l9_525-l9_524))/(l9_523-l9_522));
float l9_527=l9_526;
l9_514=l9_527;
float l9_528=l9_514;
float l9_529=l9_528;
float2 l9_530=l9_510.zw;
float l9_531=N50_velocityRange.x;
float l9_532=N50_velocityRange.y;
float l9_533=0.0;
float2 l9_534=l9_530;
float l9_535=l9_531;
float l9_536=l9_532;
float l9_537=0.99998999;
float2 l9_538=l9_534;
#if (1)
{
l9_538=floor((l9_538*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_539=dot(l9_538,float2(1.0,0.0039215689));
float l9_540=l9_539;
float l9_541=0.0;
float l9_542=l9_537;
float l9_543=l9_535;
float l9_544=l9_536;
float l9_545=l9_543+(((l9_540-l9_541)*(l9_544-l9_543))/(l9_542-l9_541));
float l9_546=l9_545;
l9_533=l9_546;
float l9_547=l9_533;
float2 l9_548=float2(l9_529,l9_547);
float2 l9_549=l9_548;
float2 l9_550=l9_549;
float2 l9_551=(l9_138+float2(1.5))*l9_141;
float2 l9_552=l9_551;
float4 l9_553=float4(0.0);
int l9_554=0;
if ((int(sTargetHasSwappedViews_tmp)!=0))
{
int l9_555=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_555=0;
}
else
{
l9_555=in.varStereoViewID;
}
int l9_556=l9_555;
l9_554=1-l9_556;
}
else
{
int l9_557=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_557=0;
}
else
{
l9_557=in.varStereoViewID;
}
int l9_558=l9_557;
l9_554=l9_558;
}
int l9_559=l9_554;
int l9_560=sTargetLayout_tmp;
int l9_561=l9_559;
float2 l9_562=l9_552;
bool l9_563=(int(SC_USE_UV_TRANSFORM_sTarget_tmp)!=0);
float3x3 l9_564=(*sc_set0.UserUniforms).sTargetTransform;
int2 l9_565=int2(SC_SOFTWARE_WRAP_MODE_U_sTarget_tmp,SC_SOFTWARE_WRAP_MODE_V_sTarget_tmp);
bool l9_566=(int(SC_USE_UV_MIN_MAX_sTarget_tmp)!=0);
float4 l9_567=(*sc_set0.UserUniforms).sTargetUvMinMax;
bool l9_568=(int(SC_USE_CLAMP_TO_BORDER_sTarget_tmp)!=0);
float4 l9_569=(*sc_set0.UserUniforms).sTargetBorderColor;
float l9_570=0.0;
bool l9_571=l9_568&&(!l9_566);
float l9_572=1.0;
float l9_573=l9_562.x;
int l9_574=l9_565.x;
if (l9_574==1)
{
l9_573=fract(l9_573);
}
else
{
if (l9_574==2)
{
float l9_575=fract(l9_573);
float l9_576=l9_573-l9_575;
float l9_577=step(0.25,fract(l9_576*0.5));
l9_573=mix(l9_575,1.0-l9_575,fast::clamp(l9_577,0.0,1.0));
}
}
l9_562.x=l9_573;
float l9_578=l9_562.y;
int l9_579=l9_565.y;
if (l9_579==1)
{
l9_578=fract(l9_578);
}
else
{
if (l9_579==2)
{
float l9_580=fract(l9_578);
float l9_581=l9_578-l9_580;
float l9_582=step(0.25,fract(l9_581*0.5));
l9_578=mix(l9_580,1.0-l9_580,fast::clamp(l9_582,0.0,1.0));
}
}
l9_562.y=l9_578;
if (l9_566)
{
bool l9_583=l9_568;
bool l9_584;
if (l9_583)
{
l9_584=l9_565.x==3;
}
else
{
l9_584=l9_583;
}
float l9_585=l9_562.x;
float l9_586=l9_567.x;
float l9_587=l9_567.z;
bool l9_588=l9_584;
float l9_589=l9_572;
float l9_590=fast::clamp(l9_585,l9_586,l9_587);
float l9_591=step(abs(l9_585-l9_590),9.9999997e-06);
l9_589*=(l9_591+((1.0-float(l9_588))*(1.0-l9_591)));
l9_585=l9_590;
l9_562.x=l9_585;
l9_572=l9_589;
bool l9_592=l9_568;
bool l9_593;
if (l9_592)
{
l9_593=l9_565.y==3;
}
else
{
l9_593=l9_592;
}
float l9_594=l9_562.y;
float l9_595=l9_567.y;
float l9_596=l9_567.w;
bool l9_597=l9_593;
float l9_598=l9_572;
float l9_599=fast::clamp(l9_594,l9_595,l9_596);
float l9_600=step(abs(l9_594-l9_599),9.9999997e-06);
l9_598*=(l9_600+((1.0-float(l9_597))*(1.0-l9_600)));
l9_594=l9_599;
l9_562.y=l9_594;
l9_572=l9_598;
}
float2 l9_601=l9_562;
bool l9_602=l9_563;
float3x3 l9_603=l9_564;
if (l9_602)
{
l9_601=float2((l9_603*float3(l9_601,1.0)).xy);
}
float2 l9_604=l9_601;
float2 l9_605=l9_604;
float2 l9_606=l9_605;
l9_562=l9_606;
float l9_607=l9_562.x;
int l9_608=l9_565.x;
bool l9_609=l9_571;
float l9_610=l9_572;
if ((l9_608==0)||(l9_608==3))
{
float l9_611=l9_607;
float l9_612=0.0;
float l9_613=1.0;
bool l9_614=l9_609;
float l9_615=l9_610;
float l9_616=fast::clamp(l9_611,l9_612,l9_613);
float l9_617=step(abs(l9_611-l9_616),9.9999997e-06);
l9_615*=(l9_617+((1.0-float(l9_614))*(1.0-l9_617)));
l9_611=l9_616;
l9_607=l9_611;
l9_610=l9_615;
}
l9_562.x=l9_607;
l9_572=l9_610;
float l9_618=l9_562.y;
int l9_619=l9_565.y;
bool l9_620=l9_571;
float l9_621=l9_572;
if ((l9_619==0)||(l9_619==3))
{
float l9_622=l9_618;
float l9_623=0.0;
float l9_624=1.0;
bool l9_625=l9_620;
float l9_626=l9_621;
float l9_627=fast::clamp(l9_622,l9_623,l9_624);
float l9_628=step(abs(l9_622-l9_627),9.9999997e-06);
l9_626*=(l9_628+((1.0-float(l9_625))*(1.0-l9_628)));
l9_622=l9_627;
l9_618=l9_622;
l9_621=l9_626;
}
l9_562.y=l9_618;
l9_572=l9_621;
float2 l9_629=l9_562;
int l9_630=l9_560;
int l9_631=l9_561;
float l9_632=l9_570;
float2 l9_633=l9_629;
int l9_634=l9_630;
int l9_635=l9_631;
float3 l9_636=float3(0.0);
if (l9_634==0)
{
l9_636=float3(l9_633,0.0);
}
else
{
if (l9_634==1)
{
l9_636=float3(l9_633.x,(l9_633.y*0.5)+(0.5-(float(l9_635)*0.5)),0.0);
}
else
{
l9_636=float3(l9_633,float(l9_635));
}
}
float3 l9_637=l9_636;
float3 l9_638=l9_637;
float2 l9_639=l9_638.xy;
float l9_640=l9_632;
float4 l9_641=sc_set0.sTarget.sample(sc_set0.sTargetSmpSC,l9_639,bias(l9_640));
float4 l9_642=l9_641;
float4 l9_643=l9_642;
if (l9_568)
{
l9_643=mix(l9_569,l9_643,float4(l9_572));
}
float4 l9_644=l9_643;
l9_553=l9_644;
float4 l9_645=l9_553;
float4 l9_646=l9_645;
float2 l9_647=l9_646.xy;
float l9_648=N50_velocityRange.x;
float l9_649=N50_velocityRange.y;
float l9_650=0.0;
float2 l9_651=l9_647;
float l9_652=l9_648;
float l9_653=l9_649;
float l9_654=0.99998999;
float2 l9_655=l9_651;
#if (1)
{
l9_655=floor((l9_655*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_656=dot(l9_655,float2(1.0,0.0039215689));
float l9_657=l9_656;
float l9_658=0.0;
float l9_659=l9_654;
float l9_660=l9_652;
float l9_661=l9_653;
float l9_662=l9_660+(((l9_657-l9_658)*(l9_661-l9_660))/(l9_659-l9_658));
float l9_663=l9_662;
l9_650=l9_663;
float l9_664=l9_650;
float l9_665=l9_664;
float2 l9_666=l9_646.zw;
float l9_667=N50_velocityRange.x;
float l9_668=N50_velocityRange.y;
float l9_669=0.0;
float2 l9_670=l9_666;
float l9_671=l9_667;
float l9_672=l9_668;
float l9_673=0.99998999;
float2 l9_674=l9_670;
#if (1)
{
l9_674=floor((l9_674*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_675=dot(l9_674,float2(1.0,0.0039215689));
float l9_676=l9_675;
float l9_677=0.0;
float l9_678=l9_673;
float l9_679=l9_671;
float l9_680=l9_672;
float l9_681=l9_679+(((l9_676-l9_677)*(l9_680-l9_679))/(l9_678-l9_677));
float l9_682=l9_681;
l9_669=l9_682;
float l9_683=l9_669;
float2 l9_684=float2(l9_665,l9_683);
float2 l9_685=l9_684;
float2 l9_686=l9_685;
float2 l9_687=mix(mix(l9_278,l9_414,float2(l9_142.x)),mix(l9_550,l9_686,float2(l9_142.x)),float2(l9_142.y));
l9_136=l9_687;
float l9_688=1.0-N50_diffusionRate;
float l9_689;
if (l9_688<=0.0)
{
l9_689=0.0;
}
else
{
l9_689=sqrt(l9_688);
}
float l9_690=l9_689;
l9_136*=l9_690;
float2 l9_691=float2(0.0);
float2 l9_692=float2(0.0);
if (N50_useUserInputTexture)
{
float2 l9_693=l9_1;
float4 l9_694=float4(0.0);
int l9_695=0;
if ((int(userVelocityInputTexHasSwappedViews_tmp)!=0))
{
int l9_696=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_696=0;
}
else
{
l9_696=in.varStereoViewID;
}
int l9_697=l9_696;
l9_695=1-l9_697;
}
else
{
int l9_698=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_698=0;
}
else
{
l9_698=in.varStereoViewID;
}
int l9_699=l9_698;
l9_695=l9_699;
}
int l9_700=l9_695;
int l9_701=userVelocityInputTexLayout_tmp;
int l9_702=l9_700;
float2 l9_703=l9_693;
bool l9_704=(int(SC_USE_UV_TRANSFORM_userVelocityInputTex_tmp)!=0);
float3x3 l9_705=(*sc_set0.UserUniforms).userVelocityInputTexTransform;
int2 l9_706=int2(SC_SOFTWARE_WRAP_MODE_U_userVelocityInputTex_tmp,SC_SOFTWARE_WRAP_MODE_V_userVelocityInputTex_tmp);
bool l9_707=(int(SC_USE_UV_MIN_MAX_userVelocityInputTex_tmp)!=0);
float4 l9_708=(*sc_set0.UserUniforms).userVelocityInputTexUvMinMax;
bool l9_709=(int(SC_USE_CLAMP_TO_BORDER_userVelocityInputTex_tmp)!=0);
float4 l9_710=(*sc_set0.UserUniforms).userVelocityInputTexBorderColor;
float l9_711=0.0;
bool l9_712=l9_709&&(!l9_707);
float l9_713=1.0;
float l9_714=l9_703.x;
int l9_715=l9_706.x;
if (l9_715==1)
{
l9_714=fract(l9_714);
}
else
{
if (l9_715==2)
{
float l9_716=fract(l9_714);
float l9_717=l9_714-l9_716;
float l9_718=step(0.25,fract(l9_717*0.5));
l9_714=mix(l9_716,1.0-l9_716,fast::clamp(l9_718,0.0,1.0));
}
}
l9_703.x=l9_714;
float l9_719=l9_703.y;
int l9_720=l9_706.y;
if (l9_720==1)
{
l9_719=fract(l9_719);
}
else
{
if (l9_720==2)
{
float l9_721=fract(l9_719);
float l9_722=l9_719-l9_721;
float l9_723=step(0.25,fract(l9_722*0.5));
l9_719=mix(l9_721,1.0-l9_721,fast::clamp(l9_723,0.0,1.0));
}
}
l9_703.y=l9_719;
if (l9_707)
{
bool l9_724=l9_709;
bool l9_725;
if (l9_724)
{
l9_725=l9_706.x==3;
}
else
{
l9_725=l9_724;
}
float l9_726=l9_703.x;
float l9_727=l9_708.x;
float l9_728=l9_708.z;
bool l9_729=l9_725;
float l9_730=l9_713;
float l9_731=fast::clamp(l9_726,l9_727,l9_728);
float l9_732=step(abs(l9_726-l9_731),9.9999997e-06);
l9_730*=(l9_732+((1.0-float(l9_729))*(1.0-l9_732)));
l9_726=l9_731;
l9_703.x=l9_726;
l9_713=l9_730;
bool l9_733=l9_709;
bool l9_734;
if (l9_733)
{
l9_734=l9_706.y==3;
}
else
{
l9_734=l9_733;
}
float l9_735=l9_703.y;
float l9_736=l9_708.y;
float l9_737=l9_708.w;
bool l9_738=l9_734;
float l9_739=l9_713;
float l9_740=fast::clamp(l9_735,l9_736,l9_737);
float l9_741=step(abs(l9_735-l9_740),9.9999997e-06);
l9_739*=(l9_741+((1.0-float(l9_738))*(1.0-l9_741)));
l9_735=l9_740;
l9_703.y=l9_735;
l9_713=l9_739;
}
float2 l9_742=l9_703;
bool l9_743=l9_704;
float3x3 l9_744=l9_705;
if (l9_743)
{
l9_742=float2((l9_744*float3(l9_742,1.0)).xy);
}
float2 l9_745=l9_742;
float2 l9_746=l9_745;
float2 l9_747=l9_746;
l9_703=l9_747;
float l9_748=l9_703.x;
int l9_749=l9_706.x;
bool l9_750=l9_712;
float l9_751=l9_713;
if ((l9_749==0)||(l9_749==3))
{
float l9_752=l9_748;
float l9_753=0.0;
float l9_754=1.0;
bool l9_755=l9_750;
float l9_756=l9_751;
float l9_757=fast::clamp(l9_752,l9_753,l9_754);
float l9_758=step(abs(l9_752-l9_757),9.9999997e-06);
l9_756*=(l9_758+((1.0-float(l9_755))*(1.0-l9_758)));
l9_752=l9_757;
l9_748=l9_752;
l9_751=l9_756;
}
l9_703.x=l9_748;
l9_713=l9_751;
float l9_759=l9_703.y;
int l9_760=l9_706.y;
bool l9_761=l9_712;
float l9_762=l9_713;
if ((l9_760==0)||(l9_760==3))
{
float l9_763=l9_759;
float l9_764=0.0;
float l9_765=1.0;
bool l9_766=l9_761;
float l9_767=l9_762;
float l9_768=fast::clamp(l9_763,l9_764,l9_765);
float l9_769=step(abs(l9_763-l9_768),9.9999997e-06);
l9_767*=(l9_769+((1.0-float(l9_766))*(1.0-l9_769)));
l9_763=l9_768;
l9_759=l9_763;
l9_762=l9_767;
}
l9_703.y=l9_759;
l9_713=l9_762;
float2 l9_770=l9_703;
int l9_771=l9_701;
int l9_772=l9_702;
float l9_773=l9_711;
float2 l9_774=l9_770;
int l9_775=l9_771;
int l9_776=l9_772;
float3 l9_777=float3(0.0);
if (l9_775==0)
{
l9_777=float3(l9_774,0.0);
}
else
{
if (l9_775==1)
{
l9_777=float3(l9_774.x,(l9_774.y*0.5)+(0.5-(float(l9_776)*0.5)),0.0);
}
else
{
l9_777=float3(l9_774,float(l9_776));
}
}
float3 l9_778=l9_777;
float3 l9_779=l9_778;
float2 l9_780=l9_779.xy;
float l9_781=l9_773;
float4 l9_782=sc_set0.userVelocityInputTex.sample(sc_set0.userVelocityInputTexSmpSC,l9_780,bias(l9_781));
float4 l9_783=l9_782;
float4 l9_784=l9_783;
if (l9_709)
{
l9_784=mix(l9_710,l9_784,float4(l9_713));
}
float4 l9_785=l9_784;
l9_694=l9_785;
float4 l9_786=l9_694;
float4 l9_787=l9_786;
float2 l9_788=l9_787.xy;
float l9_789=N50_impulseRange.x;
float l9_790=N50_impulseRange.y;
float l9_791=0.0;
float2 l9_792=l9_788;
float l9_793=l9_789;
float l9_794=l9_790;
float l9_795=0.99998999;
float2 l9_796=l9_792;
#if (1)
{
l9_796=floor((l9_796*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_797=dot(l9_796,float2(1.0,0.0039215689));
float l9_798=l9_797;
float l9_799=0.0;
float l9_800=l9_795;
float l9_801=l9_793;
float l9_802=l9_794;
float l9_803=l9_801+(((l9_798-l9_799)*(l9_802-l9_801))/(l9_800-l9_799));
float l9_804=l9_803;
l9_791=l9_804;
float l9_805=l9_791;
float l9_806=l9_805;
float2 l9_807=l9_787.zw;
float l9_808=N50_impulseRange.x;
float l9_809=N50_impulseRange.y;
float l9_810=0.0;
float2 l9_811=l9_807;
float l9_812=l9_808;
float l9_813=l9_809;
float l9_814=0.99998999;
float2 l9_815=l9_811;
#if (1)
{
l9_815=floor((l9_815*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_816=dot(l9_815,float2(1.0,0.0039215689));
float l9_817=l9_816;
float l9_818=0.0;
float l9_819=l9_814;
float l9_820=l9_812;
float l9_821=l9_813;
float l9_822=l9_820+(((l9_817-l9_818)*(l9_821-l9_820))/(l9_819-l9_818));
float l9_823=l9_822;
l9_810=l9_823;
float l9_824=l9_810;
l9_691=float2(l9_806,l9_824);
l9_691*=l9_3;
}
if (N50_useComponentInputTexture)
{
float2 l9_825=l9_1;
float4 l9_826=float4(0.0);
int l9_827=0;
if ((int(sImpulseTextureHasSwappedViews_tmp)!=0))
{
int l9_828=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_828=0;
}
else
{
l9_828=in.varStereoViewID;
}
int l9_829=l9_828;
l9_827=1-l9_829;
}
else
{
int l9_830=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_830=0;
}
else
{
l9_830=in.varStereoViewID;
}
int l9_831=l9_830;
l9_827=l9_831;
}
int l9_832=l9_827;
int l9_833=sImpulseTextureLayout_tmp;
int l9_834=l9_832;
float2 l9_835=l9_825;
bool l9_836=(int(SC_USE_UV_TRANSFORM_sImpulseTexture_tmp)!=0);
float3x3 l9_837=(*sc_set0.UserUniforms).sImpulseTextureTransform;
int2 l9_838=int2(SC_SOFTWARE_WRAP_MODE_U_sImpulseTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sImpulseTexture_tmp);
bool l9_839=(int(SC_USE_UV_MIN_MAX_sImpulseTexture_tmp)!=0);
float4 l9_840=(*sc_set0.UserUniforms).sImpulseTextureUvMinMax;
bool l9_841=(int(SC_USE_CLAMP_TO_BORDER_sImpulseTexture_tmp)!=0);
float4 l9_842=(*sc_set0.UserUniforms).sImpulseTextureBorderColor;
float l9_843=0.0;
bool l9_844=l9_841&&(!l9_839);
float l9_845=1.0;
float l9_846=l9_835.x;
int l9_847=l9_838.x;
if (l9_847==1)
{
l9_846=fract(l9_846);
}
else
{
if (l9_847==2)
{
float l9_848=fract(l9_846);
float l9_849=l9_846-l9_848;
float l9_850=step(0.25,fract(l9_849*0.5));
l9_846=mix(l9_848,1.0-l9_848,fast::clamp(l9_850,0.0,1.0));
}
}
l9_835.x=l9_846;
float l9_851=l9_835.y;
int l9_852=l9_838.y;
if (l9_852==1)
{
l9_851=fract(l9_851);
}
else
{
if (l9_852==2)
{
float l9_853=fract(l9_851);
float l9_854=l9_851-l9_853;
float l9_855=step(0.25,fract(l9_854*0.5));
l9_851=mix(l9_853,1.0-l9_853,fast::clamp(l9_855,0.0,1.0));
}
}
l9_835.y=l9_851;
if (l9_839)
{
bool l9_856=l9_841;
bool l9_857;
if (l9_856)
{
l9_857=l9_838.x==3;
}
else
{
l9_857=l9_856;
}
float l9_858=l9_835.x;
float l9_859=l9_840.x;
float l9_860=l9_840.z;
bool l9_861=l9_857;
float l9_862=l9_845;
float l9_863=fast::clamp(l9_858,l9_859,l9_860);
float l9_864=step(abs(l9_858-l9_863),9.9999997e-06);
l9_862*=(l9_864+((1.0-float(l9_861))*(1.0-l9_864)));
l9_858=l9_863;
l9_835.x=l9_858;
l9_845=l9_862;
bool l9_865=l9_841;
bool l9_866;
if (l9_865)
{
l9_866=l9_838.y==3;
}
else
{
l9_866=l9_865;
}
float l9_867=l9_835.y;
float l9_868=l9_840.y;
float l9_869=l9_840.w;
bool l9_870=l9_866;
float l9_871=l9_845;
float l9_872=fast::clamp(l9_867,l9_868,l9_869);
float l9_873=step(abs(l9_867-l9_872),9.9999997e-06);
l9_871*=(l9_873+((1.0-float(l9_870))*(1.0-l9_873)));
l9_867=l9_872;
l9_835.y=l9_867;
l9_845=l9_871;
}
float2 l9_874=l9_835;
bool l9_875=l9_836;
float3x3 l9_876=l9_837;
if (l9_875)
{
l9_874=float2((l9_876*float3(l9_874,1.0)).xy);
}
float2 l9_877=l9_874;
float2 l9_878=l9_877;
float2 l9_879=l9_878;
l9_835=l9_879;
float l9_880=l9_835.x;
int l9_881=l9_838.x;
bool l9_882=l9_844;
float l9_883=l9_845;
if ((l9_881==0)||(l9_881==3))
{
float l9_884=l9_880;
float l9_885=0.0;
float l9_886=1.0;
bool l9_887=l9_882;
float l9_888=l9_883;
float l9_889=fast::clamp(l9_884,l9_885,l9_886);
float l9_890=step(abs(l9_884-l9_889),9.9999997e-06);
l9_888*=(l9_890+((1.0-float(l9_887))*(1.0-l9_890)));
l9_884=l9_889;
l9_880=l9_884;
l9_883=l9_888;
}
l9_835.x=l9_880;
l9_845=l9_883;
float l9_891=l9_835.y;
int l9_892=l9_838.y;
bool l9_893=l9_844;
float l9_894=l9_845;
if ((l9_892==0)||(l9_892==3))
{
float l9_895=l9_891;
float l9_896=0.0;
float l9_897=1.0;
bool l9_898=l9_893;
float l9_899=l9_894;
float l9_900=fast::clamp(l9_895,l9_896,l9_897);
float l9_901=step(abs(l9_895-l9_900),9.9999997e-06);
l9_899*=(l9_901+((1.0-float(l9_898))*(1.0-l9_901)));
l9_895=l9_900;
l9_891=l9_895;
l9_894=l9_899;
}
l9_835.y=l9_891;
l9_845=l9_894;
float2 l9_902=l9_835;
int l9_903=l9_833;
int l9_904=l9_834;
float l9_905=l9_843;
float2 l9_906=l9_902;
int l9_907=l9_903;
int l9_908=l9_904;
float3 l9_909=float3(0.0);
if (l9_907==0)
{
l9_909=float3(l9_906,0.0);
}
else
{
if (l9_907==1)
{
l9_909=float3(l9_906.x,(l9_906.y*0.5)+(0.5-(float(l9_908)*0.5)),0.0);
}
else
{
l9_909=float3(l9_906,float(l9_908));
}
}
float3 l9_910=l9_909;
float3 l9_911=l9_910;
float2 l9_912=l9_911.xy;
float l9_913=l9_905;
float4 l9_914=sc_set0.sImpulseTexture.sample(sc_set0.sImpulseTextureSmpSC,l9_912,bias(l9_913));
float4 l9_915=l9_914;
float4 l9_916=l9_915;
if (l9_841)
{
l9_916=mix(l9_842,l9_916,float4(l9_845));
}
float4 l9_917=l9_916;
l9_826=l9_917;
float4 l9_918=l9_826;
float4 l9_919=l9_918;
float2 l9_920=l9_919.xy;
float l9_921=N50_impulseRange.x;
float l9_922=N50_impulseRange.y;
float l9_923=0.0;
float2 l9_924=l9_920;
float l9_925=l9_921;
float l9_926=l9_922;
float l9_927=0.99998999;
float2 l9_928=l9_924;
#if (1)
{
l9_928=floor((l9_928*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_929=dot(l9_928,float2(1.0,0.0039215689));
float l9_930=l9_929;
float l9_931=0.0;
float l9_932=l9_927;
float l9_933=l9_925;
float l9_934=l9_926;
float l9_935=l9_933+(((l9_930-l9_931)*(l9_934-l9_933))/(l9_932-l9_931));
float l9_936=l9_935;
l9_923=l9_936;
float l9_937=l9_923;
float l9_938=l9_937;
float2 l9_939=l9_919.zw;
float l9_940=N50_impulseRange.x;
float l9_941=N50_impulseRange.y;
float l9_942=0.0;
float2 l9_943=l9_939;
float l9_944=l9_940;
float l9_945=l9_941;
float l9_946=0.99998999;
float2 l9_947=l9_943;
#if (1)
{
l9_947=floor((l9_947*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_948=dot(l9_947,float2(1.0,0.0039215689));
float l9_949=l9_948;
float l9_950=0.0;
float l9_951=l9_946;
float l9_952=l9_944;
float l9_953=l9_945;
float l9_954=l9_952+(((l9_949-l9_950)*(l9_953-l9_952))/(l9_951-l9_950));
float l9_955=l9_954;
l9_942=l9_955;
float l9_956=l9_942;
l9_692=float2(l9_938,l9_956);
l9_692*=l9_3;
}
float2 l9_957=l9_1;
float4 l9_958=float4(0.0);
int l9_959=0;
if ((int(sColorHasSwappedViews_tmp)!=0))
{
int l9_960=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_960=0;
}
else
{
l9_960=in.varStereoViewID;
}
int l9_961=l9_960;
l9_959=1-l9_961;
}
else
{
int l9_962=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_962=0;
}
else
{
l9_962=in.varStereoViewID;
}
int l9_963=l9_962;
l9_959=l9_963;
}
int l9_964=l9_959;
int l9_965=sColorLayout_tmp;
int l9_966=l9_964;
float2 l9_967=l9_957;
bool l9_968=(int(SC_USE_UV_TRANSFORM_sColor_tmp)!=0);
float3x3 l9_969=(*sc_set0.UserUniforms).sColorTransform;
int2 l9_970=int2(SC_SOFTWARE_WRAP_MODE_U_sColor_tmp,SC_SOFTWARE_WRAP_MODE_V_sColor_tmp);
bool l9_971=(int(SC_USE_UV_MIN_MAX_sColor_tmp)!=0);
float4 l9_972=(*sc_set0.UserUniforms).sColorUvMinMax;
bool l9_973=(int(SC_USE_CLAMP_TO_BORDER_sColor_tmp)!=0);
float4 l9_974=(*sc_set0.UserUniforms).sColorBorderColor;
float l9_975=0.0;
bool l9_976=l9_973&&(!l9_971);
float l9_977=1.0;
float l9_978=l9_967.x;
int l9_979=l9_970.x;
if (l9_979==1)
{
l9_978=fract(l9_978);
}
else
{
if (l9_979==2)
{
float l9_980=fract(l9_978);
float l9_981=l9_978-l9_980;
float l9_982=step(0.25,fract(l9_981*0.5));
l9_978=mix(l9_980,1.0-l9_980,fast::clamp(l9_982,0.0,1.0));
}
}
l9_967.x=l9_978;
float l9_983=l9_967.y;
int l9_984=l9_970.y;
if (l9_984==1)
{
l9_983=fract(l9_983);
}
else
{
if (l9_984==2)
{
float l9_985=fract(l9_983);
float l9_986=l9_983-l9_985;
float l9_987=step(0.25,fract(l9_986*0.5));
l9_983=mix(l9_985,1.0-l9_985,fast::clamp(l9_987,0.0,1.0));
}
}
l9_967.y=l9_983;
if (l9_971)
{
bool l9_988=l9_973;
bool l9_989;
if (l9_988)
{
l9_989=l9_970.x==3;
}
else
{
l9_989=l9_988;
}
float l9_990=l9_967.x;
float l9_991=l9_972.x;
float l9_992=l9_972.z;
bool l9_993=l9_989;
float l9_994=l9_977;
float l9_995=fast::clamp(l9_990,l9_991,l9_992);
float l9_996=step(abs(l9_990-l9_995),9.9999997e-06);
l9_994*=(l9_996+((1.0-float(l9_993))*(1.0-l9_996)));
l9_990=l9_995;
l9_967.x=l9_990;
l9_977=l9_994;
bool l9_997=l9_973;
bool l9_998;
if (l9_997)
{
l9_998=l9_970.y==3;
}
else
{
l9_998=l9_997;
}
float l9_999=l9_967.y;
float l9_1000=l9_972.y;
float l9_1001=l9_972.w;
bool l9_1002=l9_998;
float l9_1003=l9_977;
float l9_1004=fast::clamp(l9_999,l9_1000,l9_1001);
float l9_1005=step(abs(l9_999-l9_1004),9.9999997e-06);
l9_1003*=(l9_1005+((1.0-float(l9_1002))*(1.0-l9_1005)));
l9_999=l9_1004;
l9_967.y=l9_999;
l9_977=l9_1003;
}
float2 l9_1006=l9_967;
bool l9_1007=l9_968;
float3x3 l9_1008=l9_969;
if (l9_1007)
{
l9_1006=float2((l9_1008*float3(l9_1006,1.0)).xy);
}
float2 l9_1009=l9_1006;
float2 l9_1010=l9_1009;
float2 l9_1011=l9_1010;
l9_967=l9_1011;
float l9_1012=l9_967.x;
int l9_1013=l9_970.x;
bool l9_1014=l9_976;
float l9_1015=l9_977;
if ((l9_1013==0)||(l9_1013==3))
{
float l9_1016=l9_1012;
float l9_1017=0.0;
float l9_1018=1.0;
bool l9_1019=l9_1014;
float l9_1020=l9_1015;
float l9_1021=fast::clamp(l9_1016,l9_1017,l9_1018);
float l9_1022=step(abs(l9_1016-l9_1021),9.9999997e-06);
l9_1020*=(l9_1022+((1.0-float(l9_1019))*(1.0-l9_1022)));
l9_1016=l9_1021;
l9_1012=l9_1016;
l9_1015=l9_1020;
}
l9_967.x=l9_1012;
l9_977=l9_1015;
float l9_1023=l9_967.y;
int l9_1024=l9_970.y;
bool l9_1025=l9_976;
float l9_1026=l9_977;
if ((l9_1024==0)||(l9_1024==3))
{
float l9_1027=l9_1023;
float l9_1028=0.0;
float l9_1029=1.0;
bool l9_1030=l9_1025;
float l9_1031=l9_1026;
float l9_1032=fast::clamp(l9_1027,l9_1028,l9_1029);
float l9_1033=step(abs(l9_1027-l9_1032),9.9999997e-06);
l9_1031*=(l9_1033+((1.0-float(l9_1030))*(1.0-l9_1033)));
l9_1027=l9_1032;
l9_1023=l9_1027;
l9_1026=l9_1031;
}
l9_967.y=l9_1023;
l9_977=l9_1026;
float2 l9_1034=l9_967;
int l9_1035=l9_965;
int l9_1036=l9_966;
float l9_1037=l9_975;
float2 l9_1038=l9_1034;
int l9_1039=l9_1035;
int l9_1040=l9_1036;
float3 l9_1041=float3(0.0);
if (l9_1039==0)
{
l9_1041=float3(l9_1038,0.0);
}
else
{
if (l9_1039==1)
{
l9_1041=float3(l9_1038.x,(l9_1038.y*0.5)+(0.5-(float(l9_1040)*0.5)),0.0);
}
else
{
l9_1041=float3(l9_1038,float(l9_1040));
}
}
float3 l9_1042=l9_1041;
float3 l9_1043=l9_1042;
float2 l9_1044=l9_1043.xy;
float l9_1045=l9_1037;
float4 l9_1046=sc_set0.sColor.sample(sc_set0.sColorSmpSC,l9_1044,bias(l9_1045));
float4 l9_1047=l9_1046;
float4 l9_1048=l9_1047;
if (l9_973)
{
l9_1048=mix(l9_974,l9_1048,float4(l9_977));
}
float4 l9_1049=l9_1048;
l9_958=l9_1049;
float4 l9_1050=l9_958;
float4 l9_1051=l9_1050;
float3 l9_1052=l9_1051.xyz;
float l9_1053=dot(l9_1052,float3(0.29899999,0.58700001,0.114));
float l9_1054=l9_1053;
float l9_1055=l9_1051.w;
float2 l9_1056=float2(0.0);
if (N50_buoyancyEnable)
{
if (l9_1055>N50_ambientTemp)
{
l9_1056=float2(0.0,1.0)*(((l9_3*(l9_1055-N50_ambientTemp))*N50_buoyancy)-(l9_1054*N50_weight));
}
}
float2 l9_1057=l9_1;
float4 l9_1058=float4(0.0);
int l9_1059=0;
if ((int(sBoundaryHasSwappedViews_tmp)!=0))
{
int l9_1060=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1060=0;
}
else
{
l9_1060=in.varStereoViewID;
}
int l9_1061=l9_1060;
l9_1059=1-l9_1061;
}
else
{
int l9_1062=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1062=0;
}
else
{
l9_1062=in.varStereoViewID;
}
int l9_1063=l9_1062;
l9_1059=l9_1063;
}
int l9_1064=l9_1059;
int l9_1065=sBoundaryLayout_tmp;
int l9_1066=l9_1064;
float2 l9_1067=l9_1057;
bool l9_1068=(int(SC_USE_UV_TRANSFORM_sBoundary_tmp)!=0);
float3x3 l9_1069=(*sc_set0.UserUniforms).sBoundaryTransform;
int2 l9_1070=int2(SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp,SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp);
bool l9_1071=(int(SC_USE_UV_MIN_MAX_sBoundary_tmp)!=0);
float4 l9_1072=(*sc_set0.UserUniforms).sBoundaryUvMinMax;
bool l9_1073=(int(SC_USE_CLAMP_TO_BORDER_sBoundary_tmp)!=0);
float4 l9_1074=(*sc_set0.UserUniforms).sBoundaryBorderColor;
float l9_1075=0.0;
bool l9_1076=l9_1073&&(!l9_1071);
float l9_1077=1.0;
float l9_1078=l9_1067.x;
int l9_1079=l9_1070.x;
if (l9_1079==1)
{
l9_1078=fract(l9_1078);
}
else
{
if (l9_1079==2)
{
float l9_1080=fract(l9_1078);
float l9_1081=l9_1078-l9_1080;
float l9_1082=step(0.25,fract(l9_1081*0.5));
l9_1078=mix(l9_1080,1.0-l9_1080,fast::clamp(l9_1082,0.0,1.0));
}
}
l9_1067.x=l9_1078;
float l9_1083=l9_1067.y;
int l9_1084=l9_1070.y;
if (l9_1084==1)
{
l9_1083=fract(l9_1083);
}
else
{
if (l9_1084==2)
{
float l9_1085=fract(l9_1083);
float l9_1086=l9_1083-l9_1085;
float l9_1087=step(0.25,fract(l9_1086*0.5));
l9_1083=mix(l9_1085,1.0-l9_1085,fast::clamp(l9_1087,0.0,1.0));
}
}
l9_1067.y=l9_1083;
if (l9_1071)
{
bool l9_1088=l9_1073;
bool l9_1089;
if (l9_1088)
{
l9_1089=l9_1070.x==3;
}
else
{
l9_1089=l9_1088;
}
float l9_1090=l9_1067.x;
float l9_1091=l9_1072.x;
float l9_1092=l9_1072.z;
bool l9_1093=l9_1089;
float l9_1094=l9_1077;
float l9_1095=fast::clamp(l9_1090,l9_1091,l9_1092);
float l9_1096=step(abs(l9_1090-l9_1095),9.9999997e-06);
l9_1094*=(l9_1096+((1.0-float(l9_1093))*(1.0-l9_1096)));
l9_1090=l9_1095;
l9_1067.x=l9_1090;
l9_1077=l9_1094;
bool l9_1097=l9_1073;
bool l9_1098;
if (l9_1097)
{
l9_1098=l9_1070.y==3;
}
else
{
l9_1098=l9_1097;
}
float l9_1099=l9_1067.y;
float l9_1100=l9_1072.y;
float l9_1101=l9_1072.w;
bool l9_1102=l9_1098;
float l9_1103=l9_1077;
float l9_1104=fast::clamp(l9_1099,l9_1100,l9_1101);
float l9_1105=step(abs(l9_1099-l9_1104),9.9999997e-06);
l9_1103*=(l9_1105+((1.0-float(l9_1102))*(1.0-l9_1105)));
l9_1099=l9_1104;
l9_1067.y=l9_1099;
l9_1077=l9_1103;
}
float2 l9_1106=l9_1067;
bool l9_1107=l9_1068;
float3x3 l9_1108=l9_1069;
if (l9_1107)
{
l9_1106=float2((l9_1108*float3(l9_1106,1.0)).xy);
}
float2 l9_1109=l9_1106;
float2 l9_1110=l9_1109;
float2 l9_1111=l9_1110;
l9_1067=l9_1111;
float l9_1112=l9_1067.x;
int l9_1113=l9_1070.x;
bool l9_1114=l9_1076;
float l9_1115=l9_1077;
if ((l9_1113==0)||(l9_1113==3))
{
float l9_1116=l9_1112;
float l9_1117=0.0;
float l9_1118=1.0;
bool l9_1119=l9_1114;
float l9_1120=l9_1115;
float l9_1121=fast::clamp(l9_1116,l9_1117,l9_1118);
float l9_1122=step(abs(l9_1116-l9_1121),9.9999997e-06);
l9_1120*=(l9_1122+((1.0-float(l9_1119))*(1.0-l9_1122)));
l9_1116=l9_1121;
l9_1112=l9_1116;
l9_1115=l9_1120;
}
l9_1067.x=l9_1112;
l9_1077=l9_1115;
float l9_1123=l9_1067.y;
int l9_1124=l9_1070.y;
bool l9_1125=l9_1076;
float l9_1126=l9_1077;
if ((l9_1124==0)||(l9_1124==3))
{
float l9_1127=l9_1123;
float l9_1128=0.0;
float l9_1129=1.0;
bool l9_1130=l9_1125;
float l9_1131=l9_1126;
float l9_1132=fast::clamp(l9_1127,l9_1128,l9_1129);
float l9_1133=step(abs(l9_1127-l9_1132),9.9999997e-06);
l9_1131*=(l9_1133+((1.0-float(l9_1130))*(1.0-l9_1133)));
l9_1127=l9_1132;
l9_1123=l9_1127;
l9_1126=l9_1131;
}
l9_1067.y=l9_1123;
l9_1077=l9_1126;
float2 l9_1134=l9_1067;
int l9_1135=l9_1065;
int l9_1136=l9_1066;
float l9_1137=l9_1075;
float2 l9_1138=l9_1134;
int l9_1139=l9_1135;
int l9_1140=l9_1136;
float3 l9_1141=float3(0.0);
if (l9_1139==0)
{
l9_1141=float3(l9_1138,0.0);
}
else
{
if (l9_1139==1)
{
l9_1141=float3(l9_1138.x,(l9_1138.y*0.5)+(0.5-(float(l9_1140)*0.5)),0.0);
}
else
{
l9_1141=float3(l9_1138,float(l9_1140));
}
}
float3 l9_1142=l9_1141;
float3 l9_1143=l9_1142;
float2 l9_1144=l9_1143.xy;
float l9_1145=l9_1137;
float4 l9_1146=sc_set0.sBoundary.sample(sc_set0.sBoundarySmpSC,l9_1144,bias(l9_1145));
float4 l9_1147=l9_1146;
float4 l9_1148=l9_1147;
if (l9_1073)
{
l9_1148=mix(l9_1074,l9_1148,float4(l9_1077));
}
float4 l9_1149=l9_1148;
l9_1058=l9_1149;
float4 l9_1150=l9_1058;
float4 l9_1151=l9_1150;
float l9_1152=step(dot(l9_1151,float4(1.0)),2.5);
l9_692+=l9_691;
l9_136+=(l9_692*N50_impulseMult);
l9_136+=l9_1056;
l9_136*=l9_1152;
if (N50_reset>0)
{
l9_136=float2(0.0);
}
float l9_1153=l9_136.x;
float l9_1154=N50_velocityRange.x;
float l9_1155=N50_velocityRange.y;
float2 l9_1156=float2(0.0);
float l9_1157=l9_1153;
float l9_1158=l9_1154;
float l9_1159=l9_1155;
float l9_1160=0.99998999;
float l9_1161=fast::clamp(l9_1157,l9_1158,l9_1159);
float l9_1162=l9_1158;
float l9_1163=l9_1159;
float l9_1164=0.0;
float l9_1165=l9_1160;
float l9_1166=l9_1164+(((l9_1161-l9_1162)*(l9_1165-l9_1164))/(l9_1163-l9_1162));
float l9_1167=l9_1166;
float4 l9_1168=float4(1.0,255.0,65025.0,16581375.0)*l9_1167;
l9_1168=fract(l9_1168);
l9_1168-=(l9_1168.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_1169=l9_1168.xy;
float2 l9_1170=l9_1169;
l9_1156=l9_1170;
float2 l9_1171=l9_1156;
float l9_1172=l9_136.y;
float l9_1173=N50_velocityRange.x;
float l9_1174=N50_velocityRange.y;
float2 l9_1175=float2(0.0);
float l9_1176=l9_1172;
float l9_1177=l9_1173;
float l9_1178=l9_1174;
float l9_1179=0.99998999;
float l9_1180=fast::clamp(l9_1176,l9_1177,l9_1178);
float l9_1181=l9_1177;
float l9_1182=l9_1178;
float l9_1183=0.0;
float l9_1184=l9_1179;
float l9_1185=l9_1183+(((l9_1180-l9_1181)*(l9_1184-l9_1183))/(l9_1182-l9_1181));
float l9_1186=l9_1185;
float4 l9_1187=float4(1.0,255.0,65025.0,16581375.0)*l9_1186;
l9_1187=fract(l9_1187);
l9_1187-=(l9_1187.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_1188=l9_1187.xy;
float2 l9_1189=l9_1188;
l9_1175=l9_1189;
float2 l9_1190=l9_1175;
N50_velocityOut=float4(l9_1171,l9_1190);
param_24=N50_velocityOut;
velocityOut_N50=param_24;
FinalColor=velocityOut_N50;
float param_26=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_26<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1191=gl_FragCoord;
float2 l9_1192=floor(mod(l9_1191.xy,float2(4.0)));
float l9_1193=(mod(dot(l9_1192,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_26<l9_1193)
{
discard_fragment();
}
}
float4 param_27=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1194=param_27;
float4 l9_1195=l9_1194;
float l9_1196=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1196=l9_1195.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1196=fast::clamp(l9_1195.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1196=fast::clamp(dot(l9_1195.xyz,float3(l9_1195.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1196=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1196=(1.0-dot(l9_1195.xyz,float3(0.33333001)))*l9_1195.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1196=(1.0-fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0))*l9_1195.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1196=fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0)*l9_1195.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1196=fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1196=fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0)*l9_1195.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1196=dot(l9_1195.xyz,float3(0.33333001))*l9_1195.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1196=1.0-fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1196=fast::clamp(dot(l9_1195.xyz,float3(1.0)),0.0,1.0);
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
float l9_1197=l9_1196;
float l9_1198=l9_1197;
float l9_1199=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1198;
float3 l9_1200=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1194.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1201=float4(l9_1200.x,l9_1200.y,l9_1200.z,l9_1199);
param_27=l9_1201;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_27=float4(param_27.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1202=param_27;
float4 l9_1203=float4(0.0);
float4 l9_1204=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1205=out.FragColor0;
float4 l9_1206=l9_1205;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1206.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1207=l9_1206;
l9_1204=l9_1207;
}
else
{
float4 l9_1208=gl_FragCoord;
float2 l9_1209=l9_1208.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1210=l9_1209;
float2 l9_1211=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1212=1;
int l9_1213=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1213=0;
}
else
{
l9_1213=in.varStereoViewID;
}
int l9_1214=l9_1213;
int l9_1215=l9_1214;
float3 l9_1216=float3(l9_1210,0.0);
int l9_1217=l9_1212;
int l9_1218=l9_1215;
if (l9_1217==1)
{
l9_1216.y=((2.0*l9_1216.y)+float(l9_1218))-1.0;
}
float2 l9_1219=l9_1216.xy;
l9_1211=l9_1219;
}
else
{
l9_1211=l9_1210;
}
float2 l9_1220=l9_1211;
float2 l9_1221=l9_1220;
float2 l9_1222=l9_1221;
int l9_1223=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1224=0;
}
else
{
l9_1224=in.varStereoViewID;
}
int l9_1225=l9_1224;
l9_1223=1-l9_1225;
}
else
{
int l9_1226=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1226=0;
}
else
{
l9_1226=in.varStereoViewID;
}
int l9_1227=l9_1226;
l9_1223=l9_1227;
}
int l9_1228=l9_1223;
float2 l9_1229=l9_1222;
int l9_1230=l9_1228;
float2 l9_1231=l9_1229;
int l9_1232=l9_1230;
float l9_1233=0.0;
float4 l9_1234=float4(0.0);
float2 l9_1235=l9_1231;
int l9_1236=sc_ScreenTextureLayout_tmp;
int l9_1237=l9_1232;
float l9_1238=l9_1233;
float2 l9_1239=l9_1235;
int l9_1240=l9_1236;
int l9_1241=l9_1237;
float3 l9_1242=float3(0.0);
if (l9_1240==0)
{
l9_1242=float3(l9_1239,0.0);
}
else
{
if (l9_1240==1)
{
l9_1242=float3(l9_1239.x,(l9_1239.y*0.5)+(0.5-(float(l9_1241)*0.5)),0.0);
}
else
{
l9_1242=float3(l9_1239,float(l9_1241));
}
}
float3 l9_1243=l9_1242;
float3 l9_1244=l9_1243;
float2 l9_1245=l9_1244.xy;
float l9_1246=l9_1238;
float4 l9_1247=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1245,bias(l9_1246));
float4 l9_1248=l9_1247;
l9_1234=l9_1248;
float4 l9_1249=l9_1234;
float4 l9_1250=l9_1249;
float4 l9_1251=l9_1250;
l9_1204=l9_1251;
}
float4 l9_1252=l9_1204;
float4 l9_1253=l9_1252;
float3 l9_1254=l9_1253.xyz;
float3 l9_1255=l9_1254;
float3 l9_1256=l9_1202.xyz;
float3 l9_1257=definedBlend(l9_1255,l9_1256,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1203=float4(l9_1257.x,l9_1257.y,l9_1257.z,l9_1203.w);
float3 l9_1258=mix(l9_1254,l9_1203.xyz,float3(l9_1202.w));
l9_1203=float4(l9_1258.x,l9_1258.y,l9_1258.z,l9_1203.w);
l9_1203.w=1.0;
float4 l9_1259=l9_1203;
param_27=l9_1259;
}
else
{
float4 l9_1260=param_27;
float4 l9_1261=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1261=float4(mix(float3(1.0),l9_1260.xyz,float3(l9_1260.w)),l9_1260.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1262=l9_1260.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1262=fast::clamp(l9_1262,0.0,1.0);
}
l9_1261=float4(l9_1260.xyz*l9_1262,l9_1262);
}
else
{
l9_1261=l9_1260;
}
}
float4 l9_1263=l9_1261;
param_27=l9_1263;
}
}
}
float4 l9_1264=param_27;
FinalColor=l9_1264;
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
float4 l9_1265=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1265=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1265=float4(0.0);
}
float4 l9_1266=l9_1265;
float4 Cost=l9_1266;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_28=in.varPos;
float4 param_29=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_28,param_29,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_30=FinalColor;
float4 l9_1267=param_30;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1267.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1267;
return out;
}
} // FRAGMENT SHADER
