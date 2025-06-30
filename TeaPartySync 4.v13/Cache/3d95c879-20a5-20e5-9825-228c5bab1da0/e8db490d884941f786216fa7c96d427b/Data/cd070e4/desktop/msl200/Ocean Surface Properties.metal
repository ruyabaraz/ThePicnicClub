#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
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
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler fluidNormalSmpSC 0:17
//sampler sampler intensityTextureSmpSC 0:18
//sampler sampler sc_ScreenTextureSmpSC 0:23
//texture texture2D fluidNormal 0:1:0:17
//texture texture2D intensityTexture 0:2:0:18
//texture texture2D sc_ScreenTexture 0:14:0:23
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:26:4400 {
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
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
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
//float amplitude 4128
//float choppiness 4132
//float speed 4136
//float offset 4140
//float noiseSteps 4144
//float norSteps 4148
//float enableFluid 4152
//float3x3 fluidNormalTransform 4208
//float4 fluidNormalUvMinMax 4256
//float4 fluidNormalBorderColor 4272
//float Port_Frequency_N000 4288
//float Port_MarchSteps_N000 4292
//float4 Port_Input0_N102 4304
//float Port_Strength1_N003 4320
//float Port_Strength2_N003 4324
//float Port_Import_N092 4352
//float4 Port_Input1_N094 4368
//float Port_Import_N095 4384
//float Port_Import_N100 4388
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidNormal 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidNormal 33 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidNormal 35 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 36 0
//spec_const bool UseViewSpaceDepthVariant 37 1
//spec_const bool fluidNormalHasSwappedViews 38 0
//spec_const bool intensityTextureHasSwappedViews 39 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 40 0
//spec_const bool sc_BlendMode_Add 41 0
//spec_const bool sc_BlendMode_AlphaTest 42 0
//spec_const bool sc_BlendMode_AlphaToCoverage 43 0
//spec_const bool sc_BlendMode_ColoredGlass 44 0
//spec_const bool sc_BlendMode_Custom 45 0
//spec_const bool sc_BlendMode_Max 46 0
//spec_const bool sc_BlendMode_Min 47 0
//spec_const bool sc_BlendMode_MultiplyOriginal 48 0
//spec_const bool sc_BlendMode_Multiply 49 0
//spec_const bool sc_BlendMode_Normal 50 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 51 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 52 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 53 0
//spec_const bool sc_BlendMode_Screen 54 0
//spec_const bool sc_BlendMode_Software 55 0
//spec_const bool sc_DepthOnly 56 0
//spec_const bool sc_FramebufferFetch 57 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 58 0
//spec_const bool sc_IsEditor 59 0
//spec_const bool sc_MotionVectorsPass 60 0
//spec_const bool sc_OITCompositingPass 61 0
//spec_const bool sc_OITDepthBoundsPass 62 0
//spec_const bool sc_OITDepthGatherPass 63 0
//spec_const bool sc_ProjectiveShadowsCaster 64 0
//spec_const bool sc_ProjectiveShadowsReceiver 65 0
//spec_const bool sc_RenderAlphaToColor 66 0
//spec_const bool sc_ScreenTextureHasSwappedViews 67 0
//spec_const bool sc_ShaderComplexityAnalyzer 68 0
//spec_const bool sc_TAAEnabled 69 0
//spec_const bool sc_UseFramebufferFetchMarker 70 0
//spec_const bool sc_VertexBlendingUseNormals 71 0
//spec_const bool sc_VertexBlending 72 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidNormal 73 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidNormal 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 76 -1
//spec_const int fluidNormalLayout 77 0
//spec_const int intensityTextureLayout 78 0
//spec_const int sc_DepthBufferMode 79 0
//spec_const int sc_RenderingSpace 80 -1
//spec_const int sc_ScreenTextureLayout 81 0
//spec_const int sc_ShaderCacheConstant 82 0
//spec_const int sc_SkinBonesCount 83 0
//spec_const int sc_StereoRenderingMode 84 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 85 0
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
constant bool SC_USE_CLAMP_TO_BORDER_fluidNormal [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_fluidNormal_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_fluidNormal) ? SC_USE_CLAMP_TO_BORDER_fluidNormal : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_fluidNormal [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_fluidNormal_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_fluidNormal) ? SC_USE_UV_MIN_MAX_fluidNormal : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_fluidNormal [[function_constant(35)]];
constant bool SC_USE_UV_TRANSFORM_fluidNormal_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_fluidNormal) ? SC_USE_UV_TRANSFORM_fluidNormal : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(37)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool fluidNormalHasSwappedViews [[function_constant(38)]];
constant bool fluidNormalHasSwappedViews_tmp = is_function_constant_defined(fluidNormalHasSwappedViews) ? fluidNormalHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(39)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(40)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(41)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(42)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(43)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(44)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(45)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(46)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(47)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(48)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(49)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(50)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(51)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(52)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(53)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(54)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_BlendMode_Software [[function_constant(55)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_DepthOnly [[function_constant(56)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(57)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(58)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_IsEditor [[function_constant(59)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_MotionVectorsPass [[function_constant(60)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(61)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(62)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(63)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(64)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(65)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(66)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(67)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(68)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(69)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(70)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(71)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(72)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_fluidNormal [[function_constant(73)]];
constant int SC_SOFTWARE_WRAP_MODE_U_fluidNormal_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_fluidNormal) ? SC_SOFTWARE_WRAP_MODE_U_fluidNormal : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_fluidNormal [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_V_fluidNormal_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_fluidNormal) ? SC_SOFTWARE_WRAP_MODE_V_fluidNormal : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int fluidNormalLayout [[function_constant(77)]];
constant int fluidNormalLayout_tmp = is_function_constant_defined(fluidNormalLayout) ? fluidNormalLayout : 0;
constant int intensityTextureLayout [[function_constant(78)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(79)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(80)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(81)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(82)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(83)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(84)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(85)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

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
float amplitude;
float choppiness;
float speed;
float offset;
float noiseSteps;
float norSteps;
float enableFluid;
float4 fluidNormalSize;
float4 fluidNormalDims;
float4 fluidNormalView;
float3x3 fluidNormalTransform;
float4 fluidNormalUvMinMax;
float4 fluidNormalBorderColor;
float Port_Frequency_N000;
float Port_MarchSteps_N000;
float4 Port_Input0_N102;
float Port_Strength1_N003;
float Port_Strength2_N003;
float4 Port_Import_N091;
float Port_Import_N092;
float4 Port_Input1_N094;
float Port_Import_N095;
float Port_Import_N100;
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
texture2d<float> fluidNormal [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler fluidNormalSmpSC [[id(17)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
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
float amplitude;
float choppiness;
float speed;
float offset;
float noiseSteps;
float norSteps;
float enableFluid;
float4 fluidNormalSize;
float4 fluidNormalDims;
float4 fluidNormalView;
float3x3 fluidNormalTransform;
float4 fluidNormalUvMinMax;
float4 fluidNormalBorderColor;
float Port_Frequency_N000;
float Port_MarchSteps_N000;
float4 Port_Input0_N102;
float Port_Strength1_N003;
float Port_Strength2_N003;
float4 Port_Import_N091;
float Port_Import_N092;
float4 Port_Input1_N094;
float Port_Import_N095;
float Port_Import_N100;
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
texture2d<float> fluidNormal [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler fluidNormalSmpSC [[id(17)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
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
float N0_heightMapTracing(thread const float3& ori,thread const float3& dir,thread float3& p,thread int& N0_MarchSteps,thread int& N0_NoiseItter,thread float& N0_Amplitude,thread float& N0_Choppiness,thread float& N0_Frequency,thread float& N0_Speed,thread float& N0_Offset,thread ssGlobals& tempGlobals)
{
float tm=0.0;
float tx=100.0;
float3 param=ori+(dir*tx);
int param_1=N0_NoiseItter;
float l9_0=tempGlobals.gTimeElapsed;
float l9_1=(l9_0*N0_Speed)+N0_Offset;
float l9_2=N0_Frequency;
float l9_3=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_4=N0_Choppiness;
float2 l9_5=param.xz;
l9_5.x*=0.75;
float l9_6=0.0;
float l9_7=0.0;
float l9_8;
float l9_9;
float l9_10;
float l9_11;
int l9_12=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_12<param_1)
{
float2 l9_13=(l9_5+float2(l9_1))*l9_2;
float l9_14=l9_4;
float2 l9_15=l9_13;
float2 l9_16=floor(l9_15);
float2 l9_17=fract(l9_15);
float2 l9_18=(l9_17*l9_17)*(float2(3.0)-(l9_17*2.0));
float2 l9_19=l9_16+float2(0.0);
float3 l9_20=float3(0.067110561,0.0058371499,52.982918);
float l9_21=fract(l9_20.z*fract(dot(l9_19,l9_20.xy)));
float2 l9_22=l9_16+float2(1.0,0.0);
float3 l9_23=float3(0.067110561,0.0058371499,52.982918);
float l9_24=fract(l9_23.z*fract(dot(l9_22,l9_23.xy)));
float2 l9_25=l9_16+float2(0.0,1.0);
float3 l9_26=float3(0.067110561,0.0058371499,52.982918);
float l9_27=fract(l9_26.z*fract(dot(l9_25,l9_26.xy)));
float2 l9_28=l9_16+float2(1.0);
float3 l9_29=float3(0.067110561,0.0058371499,52.982918);
float l9_30=fract(l9_29.z*fract(dot(l9_28,l9_29.xy)));
float l9_31=(-1.0)+(2.0*mix(mix(l9_21,l9_24,l9_18.x),mix(l9_27,l9_30,l9_18.x),l9_18.y));
l9_13+=float2(l9_31);
float2 l9_32=float2(1.0)-abs(sin(l9_13));
float2 l9_33=abs(cos(l9_13));
l9_32=mix(l9_32,l9_33,l9_32);
float l9_34=l9_32.x*l9_32.y;
float l9_35=0.60000002;
if (l9_34<=0.0)
{
l9_8=0.0;
}
else
{
l9_8=pow(l9_34,l9_35);
}
float l9_36=l9_8;
float l9_37=1.0-l9_36;
float l9_38=l9_14;
if (l9_37<=0.0)
{
l9_9=0.0;
}
else
{
l9_9=pow(l9_37,l9_38);
}
float l9_39=l9_9;
float l9_40=l9_39;
l9_6=l9_40;
float2 l9_41=(l9_5-float2(l9_1))*l9_2;
float l9_42=l9_4;
float2 l9_43=l9_41;
float2 l9_44=floor(l9_43);
float2 l9_45=fract(l9_43);
float2 l9_46=(l9_45*l9_45)*(float2(3.0)-(l9_45*2.0));
float2 l9_47=l9_44+float2(0.0);
float3 l9_48=float3(0.067110561,0.0058371499,52.982918);
float l9_49=fract(l9_48.z*fract(dot(l9_47,l9_48.xy)));
float2 l9_50=l9_44+float2(1.0,0.0);
float3 l9_51=float3(0.067110561,0.0058371499,52.982918);
float l9_52=fract(l9_51.z*fract(dot(l9_50,l9_51.xy)));
float2 l9_53=l9_44+float2(0.0,1.0);
float3 l9_54=float3(0.067110561,0.0058371499,52.982918);
float l9_55=fract(l9_54.z*fract(dot(l9_53,l9_54.xy)));
float2 l9_56=l9_44+float2(1.0);
float3 l9_57=float3(0.067110561,0.0058371499,52.982918);
float l9_58=fract(l9_57.z*fract(dot(l9_56,l9_57.xy)));
float l9_59=(-1.0)+(2.0*mix(mix(l9_49,l9_52,l9_46.x),mix(l9_55,l9_58,l9_46.x),l9_46.y));
l9_41+=float2(l9_59);
float2 l9_60=float2(1.0)-abs(sin(l9_41));
float2 l9_61=abs(cos(l9_41));
l9_60=mix(l9_60,l9_61,l9_60);
float l9_62=l9_60.x*l9_60.y;
float l9_63=0.60000002;
if (l9_62<=0.0)
{
l9_10=0.0;
}
else
{
l9_10=pow(l9_62,l9_63);
}
float l9_64=l9_10;
float l9_65=1.0-l9_64;
float l9_66=l9_42;
if (l9_65<=0.0)
{
l9_11=0.0;
}
else
{
l9_11=pow(l9_65,l9_66);
}
float l9_67=l9_11;
float l9_68=l9_67;
l9_6+=l9_68;
l9_7+=(l9_6*l9_3);
l9_5*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_2*=1.9;
l9_3*=0.22;
l9_4=mix(l9_4,1.0,0.2);
l9_12++;
continue;
}
else
{
break;
}
}
float l9_69=param.y-l9_7;
float hx=l9_69;
if (hx>0.0)
{
p=ori+(dir*tx);
return tx;
}
float3 param_2=ori+(dir*tm);
int param_3=N0_NoiseItter;
float l9_70=tempGlobals.gTimeElapsed;
float l9_71=(l9_70*N0_Speed)+N0_Offset;
float l9_72=N0_Frequency;
float l9_73=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_74=N0_Choppiness;
float2 l9_75=param_2.xz;
l9_75.x*=0.75;
float l9_76=0.0;
float l9_77=0.0;
float l9_78;
float l9_79;
float l9_80;
float l9_81;
int l9_82=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_82<param_3)
{
float2 l9_83=(l9_75+float2(l9_71))*l9_72;
float l9_84=l9_74;
float2 l9_85=l9_83;
float2 l9_86=floor(l9_85);
float2 l9_87=fract(l9_85);
float2 l9_88=(l9_87*l9_87)*(float2(3.0)-(l9_87*2.0));
float2 l9_89=l9_86+float2(0.0);
float3 l9_90=float3(0.067110561,0.0058371499,52.982918);
float l9_91=fract(l9_90.z*fract(dot(l9_89,l9_90.xy)));
float2 l9_92=l9_86+float2(1.0,0.0);
float3 l9_93=float3(0.067110561,0.0058371499,52.982918);
float l9_94=fract(l9_93.z*fract(dot(l9_92,l9_93.xy)));
float2 l9_95=l9_86+float2(0.0,1.0);
float3 l9_96=float3(0.067110561,0.0058371499,52.982918);
float l9_97=fract(l9_96.z*fract(dot(l9_95,l9_96.xy)));
float2 l9_98=l9_86+float2(1.0);
float3 l9_99=float3(0.067110561,0.0058371499,52.982918);
float l9_100=fract(l9_99.z*fract(dot(l9_98,l9_99.xy)));
float l9_101=(-1.0)+(2.0*mix(mix(l9_91,l9_94,l9_88.x),mix(l9_97,l9_100,l9_88.x),l9_88.y));
l9_83+=float2(l9_101);
float2 l9_102=float2(1.0)-abs(sin(l9_83));
float2 l9_103=abs(cos(l9_83));
l9_102=mix(l9_102,l9_103,l9_102);
float l9_104=l9_102.x*l9_102.y;
float l9_105=0.60000002;
if (l9_104<=0.0)
{
l9_78=0.0;
}
else
{
l9_78=pow(l9_104,l9_105);
}
float l9_106=l9_78;
float l9_107=1.0-l9_106;
float l9_108=l9_84;
if (l9_107<=0.0)
{
l9_79=0.0;
}
else
{
l9_79=pow(l9_107,l9_108);
}
float l9_109=l9_79;
float l9_110=l9_109;
l9_76=l9_110;
float2 l9_111=(l9_75-float2(l9_71))*l9_72;
float l9_112=l9_74;
float2 l9_113=l9_111;
float2 l9_114=floor(l9_113);
float2 l9_115=fract(l9_113);
float2 l9_116=(l9_115*l9_115)*(float2(3.0)-(l9_115*2.0));
float2 l9_117=l9_114+float2(0.0);
float3 l9_118=float3(0.067110561,0.0058371499,52.982918);
float l9_119=fract(l9_118.z*fract(dot(l9_117,l9_118.xy)));
float2 l9_120=l9_114+float2(1.0,0.0);
float3 l9_121=float3(0.067110561,0.0058371499,52.982918);
float l9_122=fract(l9_121.z*fract(dot(l9_120,l9_121.xy)));
float2 l9_123=l9_114+float2(0.0,1.0);
float3 l9_124=float3(0.067110561,0.0058371499,52.982918);
float l9_125=fract(l9_124.z*fract(dot(l9_123,l9_124.xy)));
float2 l9_126=l9_114+float2(1.0);
float3 l9_127=float3(0.067110561,0.0058371499,52.982918);
float l9_128=fract(l9_127.z*fract(dot(l9_126,l9_127.xy)));
float l9_129=(-1.0)+(2.0*mix(mix(l9_119,l9_122,l9_116.x),mix(l9_125,l9_128,l9_116.x),l9_116.y));
l9_111+=float2(l9_129);
float2 l9_130=float2(1.0)-abs(sin(l9_111));
float2 l9_131=abs(cos(l9_111));
l9_130=mix(l9_130,l9_131,l9_130);
float l9_132=l9_130.x*l9_130.y;
float l9_133=0.60000002;
if (l9_132<=0.0)
{
l9_80=0.0;
}
else
{
l9_80=pow(l9_132,l9_133);
}
float l9_134=l9_80;
float l9_135=1.0-l9_134;
float l9_136=l9_112;
if (l9_135<=0.0)
{
l9_81=0.0;
}
else
{
l9_81=pow(l9_135,l9_136);
}
float l9_137=l9_81;
float l9_138=l9_137;
l9_76+=l9_138;
l9_77+=(l9_76*l9_73);
l9_75*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_72*=1.9;
l9_73*=0.22;
l9_74=mix(l9_74,1.0,0.2);
l9_82++;
continue;
}
else
{
break;
}
}
float l9_139=param_2.y-l9_77;
float hm=l9_139;
float stepLength=0.0;
float l9_140;
float l9_141;
float l9_142;
float l9_143;
int i=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (i<N0_MarchSteps)
{
stepLength=mix(tm,tx,hm/(hm-hx));
p=ori+(dir*stepLength);
float3 param_4=p;
int param_5=N0_NoiseItter;
float l9_144=tempGlobals.gTimeElapsed;
float l9_145=(l9_144*N0_Speed)+N0_Offset;
float l9_146=N0_Frequency;
float l9_147=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_148=N0_Choppiness;
float2 l9_149=param_4.xz;
l9_149.x*=0.75;
float l9_150=0.0;
float l9_151=0.0;
int l9_152=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_152<param_5)
{
float2 l9_153=(l9_149+float2(l9_145))*l9_146;
float l9_154=l9_148;
float2 l9_155=l9_153;
float2 l9_156=floor(l9_155);
float2 l9_157=fract(l9_155);
float2 l9_158=(l9_157*l9_157)*(float2(3.0)-(l9_157*2.0));
float2 l9_159=l9_156+float2(0.0);
float3 l9_160=float3(0.067110561,0.0058371499,52.982918);
float l9_161=fract(l9_160.z*fract(dot(l9_159,l9_160.xy)));
float2 l9_162=l9_156+float2(1.0,0.0);
float3 l9_163=float3(0.067110561,0.0058371499,52.982918);
float l9_164=fract(l9_163.z*fract(dot(l9_162,l9_163.xy)));
float2 l9_165=l9_156+float2(0.0,1.0);
float3 l9_166=float3(0.067110561,0.0058371499,52.982918);
float l9_167=fract(l9_166.z*fract(dot(l9_165,l9_166.xy)));
float2 l9_168=l9_156+float2(1.0);
float3 l9_169=float3(0.067110561,0.0058371499,52.982918);
float l9_170=fract(l9_169.z*fract(dot(l9_168,l9_169.xy)));
float l9_171=(-1.0)+(2.0*mix(mix(l9_161,l9_164,l9_158.x),mix(l9_167,l9_170,l9_158.x),l9_158.y));
l9_153+=float2(l9_171);
float2 l9_172=float2(1.0)-abs(sin(l9_153));
float2 l9_173=abs(cos(l9_153));
l9_172=mix(l9_172,l9_173,l9_172);
float l9_174=l9_172.x*l9_172.y;
float l9_175=0.60000002;
if (l9_174<=0.0)
{
l9_140=0.0;
}
else
{
l9_140=pow(l9_174,l9_175);
}
float l9_176=l9_140;
float l9_177=1.0-l9_176;
float l9_178=l9_154;
if (l9_177<=0.0)
{
l9_141=0.0;
}
else
{
l9_141=pow(l9_177,l9_178);
}
float l9_179=l9_141;
float l9_180=l9_179;
l9_150=l9_180;
float2 l9_181=(l9_149-float2(l9_145))*l9_146;
float l9_182=l9_148;
float2 l9_183=l9_181;
float2 l9_184=floor(l9_183);
float2 l9_185=fract(l9_183);
float2 l9_186=(l9_185*l9_185)*(float2(3.0)-(l9_185*2.0));
float2 l9_187=l9_184+float2(0.0);
float3 l9_188=float3(0.067110561,0.0058371499,52.982918);
float l9_189=fract(l9_188.z*fract(dot(l9_187,l9_188.xy)));
float2 l9_190=l9_184+float2(1.0,0.0);
float3 l9_191=float3(0.067110561,0.0058371499,52.982918);
float l9_192=fract(l9_191.z*fract(dot(l9_190,l9_191.xy)));
float2 l9_193=l9_184+float2(0.0,1.0);
float3 l9_194=float3(0.067110561,0.0058371499,52.982918);
float l9_195=fract(l9_194.z*fract(dot(l9_193,l9_194.xy)));
float2 l9_196=l9_184+float2(1.0);
float3 l9_197=float3(0.067110561,0.0058371499,52.982918);
float l9_198=fract(l9_197.z*fract(dot(l9_196,l9_197.xy)));
float l9_199=(-1.0)+(2.0*mix(mix(l9_189,l9_192,l9_186.x),mix(l9_195,l9_198,l9_186.x),l9_186.y));
l9_181+=float2(l9_199);
float2 l9_200=float2(1.0)-abs(sin(l9_181));
float2 l9_201=abs(cos(l9_181));
l9_200=mix(l9_200,l9_201,l9_200);
float l9_202=l9_200.x*l9_200.y;
float l9_203=0.60000002;
if (l9_202<=0.0)
{
l9_142=0.0;
}
else
{
l9_142=pow(l9_202,l9_203);
}
float l9_204=l9_142;
float l9_205=1.0-l9_204;
float l9_206=l9_182;
if (l9_205<=0.0)
{
l9_143=0.0;
}
else
{
l9_143=pow(l9_205,l9_206);
}
float l9_207=l9_143;
float l9_208=l9_207;
l9_150+=l9_208;
l9_151+=(l9_150*l9_147);
l9_149*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_146*=1.9;
l9_147*=0.22;
l9_148=mix(l9_148,1.0,0.2);
l9_152++;
continue;
}
else
{
break;
}
}
float l9_209=param_4.y-l9_151;
float hstepLength=l9_209;
if (hstepLength<0.0)
{
tx=stepLength;
hx=hstepLength;
}
else
{
tm=stepLength;
hm=hstepLength;
}
i++;
continue;
}
else
{
break;
}
}
return stepLength;
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
int N0_MarchSteps=0;
int N0_NoiseItter=0;
int N0_NorItter=0;
float N0_Amplitude=0.0;
float N0_Choppiness=0.0;
float N0_Frequency=0.0;
float N0_Speed=0.0;
float N0_Offset=0.0;
float2 N0_Displacement=float2(0.0);
float3 N0_Normal=float3(0.0);
ssGlobals tempGlobals;
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
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float Output_N1=0.0;
float param=(*sc_set0.UserUniforms).amplitude;
Output_N1=param;
float Output_N5=0.0;
float param_1=(*sc_set0.UserUniforms).choppiness;
Output_N5=param_1;
float Output_N9=0.0;
float param_2=(*sc_set0.UserUniforms).speed;
Output_N9=param_2;
float Output_N8=0.0;
float param_3=(*sc_set0.UserUniforms).offset;
Output_N8=param_3;
float Output_N7=0.0;
float param_4=(*sc_set0.UserUniforms).noiseSteps;
Output_N7=param_4;
float Output_N6=0.0;
float param_5=(*sc_set0.UserUniforms).norSteps;
Output_N6=param_5;
float2 Displacement_N0=float2(0.0);
float param_6=Output_N1;
float param_7=Output_N5;
float param_8=(*sc_set0.UserUniforms).Port_Frequency_N000;
float param_9=Output_N9;
float param_10=Output_N8;
float param_11=(*sc_set0.UserUniforms).Port_MarchSteps_N000;
float param_12=Output_N7;
float param_13=Output_N6;
ssGlobals param_15=Globals;
tempGlobals=param_15;
float2 param_14=float2(0.0);
N0_Amplitude=param_6;
N0_Choppiness=param_7;
N0_Frequency=param_8;
N0_Speed=param_9;
N0_Offset=param_10;
N0_MarchSteps=int(param_11);
N0_NoiseItter=int(param_12);
N0_NorItter=int(param_13);
float3 l9_0=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_1=l9_0;
float3 l9_2=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_3=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_4=normalize(l9_2-l9_3);
float3 l9_5=float3(0.0);
float3 l9_6=l9_1;
float3 l9_7=l9_4;
float3 l9_8;
float l9_9=N0_heightMapTracing(l9_6,l9_7,l9_8,N0_MarchSteps,N0_NoiseItter,N0_Amplitude,N0_Choppiness,N0_Frequency,N0_Speed,N0_Offset,tempGlobals);
l9_5=l9_8;
float3 l9_10=l9_5-l9_1;
float3 l9_11=l9_5;
float l9_12=(dot(l9_10,l9_10)*0.1)/720.0;
float3 l9_13=float3(0.0);
float3 l9_14=l9_11;
int l9_15=N0_NorItter;
float l9_16=tempGlobals.gTimeElapsed;
float l9_17=(l9_16*N0_Speed)+N0_Offset;
float l9_18=N0_Frequency;
float l9_19=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_20=N0_Choppiness;
float2 l9_21=l9_14.xz;
l9_21.x*=0.75;
float l9_22=0.0;
float l9_23=0.0;
float l9_24;
float l9_25;
float l9_26;
float l9_27;
int l9_28=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_28<l9_15)
{
float2 l9_29=(l9_21+float2(l9_17))*l9_18;
float l9_30=l9_20;
float2 l9_31=l9_29;
float2 l9_32=floor(l9_31);
float2 l9_33=fract(l9_31);
float2 l9_34=(l9_33*l9_33)*(float2(3.0)-(l9_33*2.0));
float2 l9_35=l9_32+float2(0.0);
float3 l9_36=float3(0.067110561,0.0058371499,52.982918);
float l9_37=fract(l9_36.z*fract(dot(l9_35,l9_36.xy)));
float2 l9_38=l9_32+float2(1.0,0.0);
float3 l9_39=float3(0.067110561,0.0058371499,52.982918);
float l9_40=fract(l9_39.z*fract(dot(l9_38,l9_39.xy)));
float2 l9_41=l9_32+float2(0.0,1.0);
float3 l9_42=float3(0.067110561,0.0058371499,52.982918);
float l9_43=fract(l9_42.z*fract(dot(l9_41,l9_42.xy)));
float2 l9_44=l9_32+float2(1.0);
float3 l9_45=float3(0.067110561,0.0058371499,52.982918);
float l9_46=fract(l9_45.z*fract(dot(l9_44,l9_45.xy)));
float l9_47=(-1.0)+(2.0*mix(mix(l9_37,l9_40,l9_34.x),mix(l9_43,l9_46,l9_34.x),l9_34.y));
l9_29+=float2(l9_47);
float2 l9_48=float2(1.0)-abs(sin(l9_29));
float2 l9_49=abs(cos(l9_29));
l9_48=mix(l9_48,l9_49,l9_48);
float l9_50=l9_48.x*l9_48.y;
float l9_51=0.60000002;
if (l9_50<=0.0)
{
l9_24=0.0;
}
else
{
l9_24=pow(l9_50,l9_51);
}
float l9_52=l9_24;
float l9_53=1.0-l9_52;
float l9_54=l9_30;
if (l9_53<=0.0)
{
l9_25=0.0;
}
else
{
l9_25=pow(l9_53,l9_54);
}
float l9_55=l9_25;
float l9_56=l9_55;
l9_22=l9_56;
float2 l9_57=(l9_21-float2(l9_17))*l9_18;
float l9_58=l9_20;
float2 l9_59=l9_57;
float2 l9_60=floor(l9_59);
float2 l9_61=fract(l9_59);
float2 l9_62=(l9_61*l9_61)*(float2(3.0)-(l9_61*2.0));
float2 l9_63=l9_60+float2(0.0);
float3 l9_64=float3(0.067110561,0.0058371499,52.982918);
float l9_65=fract(l9_64.z*fract(dot(l9_63,l9_64.xy)));
float2 l9_66=l9_60+float2(1.0,0.0);
float3 l9_67=float3(0.067110561,0.0058371499,52.982918);
float l9_68=fract(l9_67.z*fract(dot(l9_66,l9_67.xy)));
float2 l9_69=l9_60+float2(0.0,1.0);
float3 l9_70=float3(0.067110561,0.0058371499,52.982918);
float l9_71=fract(l9_70.z*fract(dot(l9_69,l9_70.xy)));
float2 l9_72=l9_60+float2(1.0);
float3 l9_73=float3(0.067110561,0.0058371499,52.982918);
float l9_74=fract(l9_73.z*fract(dot(l9_72,l9_73.xy)));
float l9_75=(-1.0)+(2.0*mix(mix(l9_65,l9_68,l9_62.x),mix(l9_71,l9_74,l9_62.x),l9_62.y));
l9_57+=float2(l9_75);
float2 l9_76=float2(1.0)-abs(sin(l9_57));
float2 l9_77=abs(cos(l9_57));
l9_76=mix(l9_76,l9_77,l9_76);
float l9_78=l9_76.x*l9_76.y;
float l9_79=0.60000002;
if (l9_78<=0.0)
{
l9_26=0.0;
}
else
{
l9_26=pow(l9_78,l9_79);
}
float l9_80=l9_26;
float l9_81=1.0-l9_80;
float l9_82=l9_58;
if (l9_81<=0.0)
{
l9_27=0.0;
}
else
{
l9_27=pow(l9_81,l9_82);
}
float l9_83=l9_27;
float l9_84=l9_83;
l9_22+=l9_84;
l9_23+=(l9_22*l9_19);
l9_21*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_18*=1.9;
l9_19*=0.22;
l9_20=mix(l9_20,1.0,0.2);
l9_28++;
continue;
}
else
{
break;
}
}
float l9_85=l9_14.y-l9_23;
l9_13.y=l9_85;
float3 l9_86=float3(l9_11.x+l9_12,l9_11.y,l9_11.z);
int l9_87=N0_NorItter;
float l9_88=tempGlobals.gTimeElapsed;
float l9_89=(l9_88*N0_Speed)+N0_Offset;
float l9_90=N0_Frequency;
float l9_91=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_92=N0_Choppiness;
float2 l9_93=l9_86.xz;
l9_93.x*=0.75;
float l9_94=0.0;
float l9_95=0.0;
float l9_96;
float l9_97;
float l9_98;
float l9_99;
int l9_100=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_100<l9_87)
{
float2 l9_101=(l9_93+float2(l9_89))*l9_90;
float l9_102=l9_92;
float2 l9_103=l9_101;
float2 l9_104=floor(l9_103);
float2 l9_105=fract(l9_103);
float2 l9_106=(l9_105*l9_105)*(float2(3.0)-(l9_105*2.0));
float2 l9_107=l9_104+float2(0.0);
float3 l9_108=float3(0.067110561,0.0058371499,52.982918);
float l9_109=fract(l9_108.z*fract(dot(l9_107,l9_108.xy)));
float2 l9_110=l9_104+float2(1.0,0.0);
float3 l9_111=float3(0.067110561,0.0058371499,52.982918);
float l9_112=fract(l9_111.z*fract(dot(l9_110,l9_111.xy)));
float2 l9_113=l9_104+float2(0.0,1.0);
float3 l9_114=float3(0.067110561,0.0058371499,52.982918);
float l9_115=fract(l9_114.z*fract(dot(l9_113,l9_114.xy)));
float2 l9_116=l9_104+float2(1.0);
float3 l9_117=float3(0.067110561,0.0058371499,52.982918);
float l9_118=fract(l9_117.z*fract(dot(l9_116,l9_117.xy)));
float l9_119=(-1.0)+(2.0*mix(mix(l9_109,l9_112,l9_106.x),mix(l9_115,l9_118,l9_106.x),l9_106.y));
l9_101+=float2(l9_119);
float2 l9_120=float2(1.0)-abs(sin(l9_101));
float2 l9_121=abs(cos(l9_101));
l9_120=mix(l9_120,l9_121,l9_120);
float l9_122=l9_120.x*l9_120.y;
float l9_123=0.60000002;
if (l9_122<=0.0)
{
l9_96=0.0;
}
else
{
l9_96=pow(l9_122,l9_123);
}
float l9_124=l9_96;
float l9_125=1.0-l9_124;
float l9_126=l9_102;
if (l9_125<=0.0)
{
l9_97=0.0;
}
else
{
l9_97=pow(l9_125,l9_126);
}
float l9_127=l9_97;
float l9_128=l9_127;
l9_94=l9_128;
float2 l9_129=(l9_93-float2(l9_89))*l9_90;
float l9_130=l9_92;
float2 l9_131=l9_129;
float2 l9_132=floor(l9_131);
float2 l9_133=fract(l9_131);
float2 l9_134=(l9_133*l9_133)*(float2(3.0)-(l9_133*2.0));
float2 l9_135=l9_132+float2(0.0);
float3 l9_136=float3(0.067110561,0.0058371499,52.982918);
float l9_137=fract(l9_136.z*fract(dot(l9_135,l9_136.xy)));
float2 l9_138=l9_132+float2(1.0,0.0);
float3 l9_139=float3(0.067110561,0.0058371499,52.982918);
float l9_140=fract(l9_139.z*fract(dot(l9_138,l9_139.xy)));
float2 l9_141=l9_132+float2(0.0,1.0);
float3 l9_142=float3(0.067110561,0.0058371499,52.982918);
float l9_143=fract(l9_142.z*fract(dot(l9_141,l9_142.xy)));
float2 l9_144=l9_132+float2(1.0);
float3 l9_145=float3(0.067110561,0.0058371499,52.982918);
float l9_146=fract(l9_145.z*fract(dot(l9_144,l9_145.xy)));
float l9_147=(-1.0)+(2.0*mix(mix(l9_137,l9_140,l9_134.x),mix(l9_143,l9_146,l9_134.x),l9_134.y));
l9_129+=float2(l9_147);
float2 l9_148=float2(1.0)-abs(sin(l9_129));
float2 l9_149=abs(cos(l9_129));
l9_148=mix(l9_148,l9_149,l9_148);
float l9_150=l9_148.x*l9_148.y;
float l9_151=0.60000002;
if (l9_150<=0.0)
{
l9_98=0.0;
}
else
{
l9_98=pow(l9_150,l9_151);
}
float l9_152=l9_98;
float l9_153=1.0-l9_152;
float l9_154=l9_130;
if (l9_153<=0.0)
{
l9_99=0.0;
}
else
{
l9_99=pow(l9_153,l9_154);
}
float l9_155=l9_99;
float l9_156=l9_155;
l9_94+=l9_156;
l9_95+=(l9_94*l9_91);
l9_93*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_90*=1.9;
l9_91*=0.22;
l9_92=mix(l9_92,1.0,0.2);
l9_100++;
continue;
}
else
{
break;
}
}
float l9_157=l9_86.y-l9_95;
l9_13.x=l9_157-l9_13.y;
float3 l9_158=float3(l9_11.x,l9_11.y,l9_11.z+l9_12);
int l9_159=N0_NorItter;
float l9_160=tempGlobals.gTimeElapsed;
float l9_161=(l9_160*N0_Speed)+N0_Offset;
float l9_162=N0_Frequency;
float l9_163=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_164=N0_Choppiness;
float2 l9_165=l9_158.xz;
l9_165.x*=0.75;
float l9_166=0.0;
float l9_167=0.0;
float l9_168;
float l9_169;
float l9_170;
float l9_171;
int l9_172=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_172<l9_159)
{
float2 l9_173=(l9_165+float2(l9_161))*l9_162;
float l9_174=l9_164;
float2 l9_175=l9_173;
float2 l9_176=floor(l9_175);
float2 l9_177=fract(l9_175);
float2 l9_178=(l9_177*l9_177)*(float2(3.0)-(l9_177*2.0));
float2 l9_179=l9_176+float2(0.0);
float3 l9_180=float3(0.067110561,0.0058371499,52.982918);
float l9_181=fract(l9_180.z*fract(dot(l9_179,l9_180.xy)));
float2 l9_182=l9_176+float2(1.0,0.0);
float3 l9_183=float3(0.067110561,0.0058371499,52.982918);
float l9_184=fract(l9_183.z*fract(dot(l9_182,l9_183.xy)));
float2 l9_185=l9_176+float2(0.0,1.0);
float3 l9_186=float3(0.067110561,0.0058371499,52.982918);
float l9_187=fract(l9_186.z*fract(dot(l9_185,l9_186.xy)));
float2 l9_188=l9_176+float2(1.0);
float3 l9_189=float3(0.067110561,0.0058371499,52.982918);
float l9_190=fract(l9_189.z*fract(dot(l9_188,l9_189.xy)));
float l9_191=(-1.0)+(2.0*mix(mix(l9_181,l9_184,l9_178.x),mix(l9_187,l9_190,l9_178.x),l9_178.y));
l9_173+=float2(l9_191);
float2 l9_192=float2(1.0)-abs(sin(l9_173));
float2 l9_193=abs(cos(l9_173));
l9_192=mix(l9_192,l9_193,l9_192);
float l9_194=l9_192.x*l9_192.y;
float l9_195=0.60000002;
if (l9_194<=0.0)
{
l9_168=0.0;
}
else
{
l9_168=pow(l9_194,l9_195);
}
float l9_196=l9_168;
float l9_197=1.0-l9_196;
float l9_198=l9_174;
if (l9_197<=0.0)
{
l9_169=0.0;
}
else
{
l9_169=pow(l9_197,l9_198);
}
float l9_199=l9_169;
float l9_200=l9_199;
l9_166=l9_200;
float2 l9_201=(l9_165-float2(l9_161))*l9_162;
float l9_202=l9_164;
float2 l9_203=l9_201;
float2 l9_204=floor(l9_203);
float2 l9_205=fract(l9_203);
float2 l9_206=(l9_205*l9_205)*(float2(3.0)-(l9_205*2.0));
float2 l9_207=l9_204+float2(0.0);
float3 l9_208=float3(0.067110561,0.0058371499,52.982918);
float l9_209=fract(l9_208.z*fract(dot(l9_207,l9_208.xy)));
float2 l9_210=l9_204+float2(1.0,0.0);
float3 l9_211=float3(0.067110561,0.0058371499,52.982918);
float l9_212=fract(l9_211.z*fract(dot(l9_210,l9_211.xy)));
float2 l9_213=l9_204+float2(0.0,1.0);
float3 l9_214=float3(0.067110561,0.0058371499,52.982918);
float l9_215=fract(l9_214.z*fract(dot(l9_213,l9_214.xy)));
float2 l9_216=l9_204+float2(1.0);
float3 l9_217=float3(0.067110561,0.0058371499,52.982918);
float l9_218=fract(l9_217.z*fract(dot(l9_216,l9_217.xy)));
float l9_219=(-1.0)+(2.0*mix(mix(l9_209,l9_212,l9_206.x),mix(l9_215,l9_218,l9_206.x),l9_206.y));
l9_201+=float2(l9_219);
float2 l9_220=float2(1.0)-abs(sin(l9_201));
float2 l9_221=abs(cos(l9_201));
l9_220=mix(l9_220,l9_221,l9_220);
float l9_222=l9_220.x*l9_220.y;
float l9_223=0.60000002;
if (l9_222<=0.0)
{
l9_170=0.0;
}
else
{
l9_170=pow(l9_222,l9_223);
}
float l9_224=l9_170;
float l9_225=1.0-l9_224;
float l9_226=l9_202;
if (l9_225<=0.0)
{
l9_171=0.0;
}
else
{
l9_171=pow(l9_225,l9_226);
}
float l9_227=l9_171;
float l9_228=l9_227;
l9_166+=l9_228;
l9_167+=(l9_166*l9_163);
l9_165*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_162*=1.9;
l9_163*=0.22;
l9_164=mix(l9_164,1.0,0.2);
l9_172++;
continue;
}
else
{
break;
}
}
float l9_229=l9_158.y-l9_167;
l9_13.z=l9_229-l9_13.y;
l9_13.y=l9_12;
float3 l9_230=normalize(l9_13);
N0_Normal=l9_230;
N0_Normal=(float3(N0_Normal.x,-N0_Normal.z,N0_Normal.y)+float3(1.0))/float3(2.0);
float l9_231=l9_5.y*0.44999999;
float l9_232=1.2;
float l9_233;
if (l9_231<=0.0)
{
l9_233=0.0;
}
else
{
l9_233=pow(l9_231,l9_232);
}
float l9_234=l9_233;
float l9_235=fast::clamp(l9_234,0.0,1.0);
float l9_236=l9_235*N0_Amplitude;
float l9_237=l9_236;
float l9_238=0.0;
float l9_239=N0_Amplitude;
float2 l9_240=float2(0.0);
float l9_241=l9_237;
float l9_242=l9_238;
float l9_243=l9_239;
float l9_244=0.99998999;
float l9_245=fast::clamp(l9_241,l9_242,l9_243);
float l9_246=l9_242;
float l9_247=l9_243;
float l9_248=0.0;
float l9_249=l9_244;
float l9_250=l9_248+(((l9_245-l9_246)*(l9_249-l9_248))/(l9_247-l9_246));
float l9_251=l9_250;
float4 l9_252=float4(1.0,255.0,65025.0,16581375.0)*l9_251;
l9_252=fract(l9_252);
l9_252-=(l9_252.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_253=l9_252.xy;
float2 l9_254=l9_253;
l9_240=l9_254;
float2 l9_255=l9_240;
float2 l9_256=l9_255;
N0_Displacement=l9_256;
param_14=N0_Displacement;
Displacement_N0=param_14;
FinalColor=float4(Displacement_N0,0.0,0.0);
float param_16=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_16<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_257=gl_FragCoord;
float2 l9_258=floor(mod(l9_257.xy,float2(4.0)));
float l9_259=(mod(dot(l9_258,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_16<l9_259)
{
discard_fragment();
}
}
float3 Output_N16=float3(0.0);
float param_17=1.0;
float3 param_18=float3(1.0);
float3 param_19=float3(0.0);
ssGlobals param_21=Globals;
float l9_260=0.0;
float l9_261=(*sc_set0.UserUniforms).enableFluid;
l9_260=l9_261;
param_17=l9_260;
float3 param_20;
if ((param_17*1.0)!=0.0)
{
float l9_262=0.0;
float l9_263=(*sc_set0.UserUniforms).amplitude;
l9_262=l9_263;
float l9_264=0.0;
float l9_265=(*sc_set0.UserUniforms).choppiness;
l9_264=l9_265;
float l9_266=0.0;
float l9_267=(*sc_set0.UserUniforms).speed;
l9_266=l9_267;
float l9_268=0.0;
float l9_269=(*sc_set0.UserUniforms).offset;
l9_268=l9_269;
float l9_270=0.0;
float l9_271=(*sc_set0.UserUniforms).noiseSteps;
l9_270=l9_271;
float l9_272=0.0;
float l9_273=(*sc_set0.UserUniforms).norSteps;
l9_272=l9_273;
float3 l9_274=float3(0.0);
float l9_275=l9_262;
float l9_276=l9_264;
float l9_277=(*sc_set0.UserUniforms).Port_Frequency_N000;
float l9_278=l9_266;
float l9_279=l9_268;
float l9_280=(*sc_set0.UserUniforms).Port_MarchSteps_N000;
float l9_281=l9_270;
float l9_282=l9_272;
ssGlobals l9_283=param_21;
tempGlobals=l9_283;
float3 l9_284=float3(0.0);
N0_Amplitude=l9_275;
N0_Choppiness=l9_276;
N0_Frequency=l9_277;
N0_Speed=l9_278;
N0_Offset=l9_279;
N0_MarchSteps=int(l9_280);
N0_NoiseItter=int(l9_281);
N0_NorItter=int(l9_282);
float3 l9_285=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_286=l9_285;
float3 l9_287=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_288=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_289=normalize(l9_287-l9_288);
float3 l9_290=float3(0.0);
float3 l9_291=l9_286;
float3 l9_292=l9_289;
float3 l9_293;
float l9_294=N0_heightMapTracing(l9_291,l9_292,l9_293,N0_MarchSteps,N0_NoiseItter,N0_Amplitude,N0_Choppiness,N0_Frequency,N0_Speed,N0_Offset,tempGlobals);
l9_290=l9_293;
float3 l9_295=l9_290-l9_286;
float3 l9_296=l9_290;
float l9_297=(dot(l9_295,l9_295)*0.1)/720.0;
float3 l9_298=float3(0.0);
float3 l9_299=l9_296;
int l9_300=N0_NorItter;
float l9_301=tempGlobals.gTimeElapsed;
float l9_302=(l9_301*N0_Speed)+N0_Offset;
float l9_303=N0_Frequency;
float l9_304=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_305=N0_Choppiness;
float2 l9_306=l9_299.xz;
l9_306.x*=0.75;
float l9_307=0.0;
float l9_308=0.0;
float l9_309;
float l9_310;
float l9_311;
float l9_312;
int l9_313=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_313<l9_300)
{
float2 l9_314=(l9_306+float2(l9_302))*l9_303;
float l9_315=l9_305;
float2 l9_316=l9_314;
float2 l9_317=floor(l9_316);
float2 l9_318=fract(l9_316);
float2 l9_319=(l9_318*l9_318)*(float2(3.0)-(l9_318*2.0));
float2 l9_320=l9_317+float2(0.0);
float3 l9_321=float3(0.067110561,0.0058371499,52.982918);
float l9_322=fract(l9_321.z*fract(dot(l9_320,l9_321.xy)));
float2 l9_323=l9_317+float2(1.0,0.0);
float3 l9_324=float3(0.067110561,0.0058371499,52.982918);
float l9_325=fract(l9_324.z*fract(dot(l9_323,l9_324.xy)));
float2 l9_326=l9_317+float2(0.0,1.0);
float3 l9_327=float3(0.067110561,0.0058371499,52.982918);
float l9_328=fract(l9_327.z*fract(dot(l9_326,l9_327.xy)));
float2 l9_329=l9_317+float2(1.0);
float3 l9_330=float3(0.067110561,0.0058371499,52.982918);
float l9_331=fract(l9_330.z*fract(dot(l9_329,l9_330.xy)));
float l9_332=(-1.0)+(2.0*mix(mix(l9_322,l9_325,l9_319.x),mix(l9_328,l9_331,l9_319.x),l9_319.y));
l9_314+=float2(l9_332);
float2 l9_333=float2(1.0)-abs(sin(l9_314));
float2 l9_334=abs(cos(l9_314));
l9_333=mix(l9_333,l9_334,l9_333);
float l9_335=l9_333.x*l9_333.y;
float l9_336=0.60000002;
if (l9_335<=0.0)
{
l9_309=0.0;
}
else
{
l9_309=pow(l9_335,l9_336);
}
float l9_337=l9_309;
float l9_338=1.0-l9_337;
float l9_339=l9_315;
if (l9_338<=0.0)
{
l9_310=0.0;
}
else
{
l9_310=pow(l9_338,l9_339);
}
float l9_340=l9_310;
float l9_341=l9_340;
l9_307=l9_341;
float2 l9_342=(l9_306-float2(l9_302))*l9_303;
float l9_343=l9_305;
float2 l9_344=l9_342;
float2 l9_345=floor(l9_344);
float2 l9_346=fract(l9_344);
float2 l9_347=(l9_346*l9_346)*(float2(3.0)-(l9_346*2.0));
float2 l9_348=l9_345+float2(0.0);
float3 l9_349=float3(0.067110561,0.0058371499,52.982918);
float l9_350=fract(l9_349.z*fract(dot(l9_348,l9_349.xy)));
float2 l9_351=l9_345+float2(1.0,0.0);
float3 l9_352=float3(0.067110561,0.0058371499,52.982918);
float l9_353=fract(l9_352.z*fract(dot(l9_351,l9_352.xy)));
float2 l9_354=l9_345+float2(0.0,1.0);
float3 l9_355=float3(0.067110561,0.0058371499,52.982918);
float l9_356=fract(l9_355.z*fract(dot(l9_354,l9_355.xy)));
float2 l9_357=l9_345+float2(1.0);
float3 l9_358=float3(0.067110561,0.0058371499,52.982918);
float l9_359=fract(l9_358.z*fract(dot(l9_357,l9_358.xy)));
float l9_360=(-1.0)+(2.0*mix(mix(l9_350,l9_353,l9_347.x),mix(l9_356,l9_359,l9_347.x),l9_347.y));
l9_342+=float2(l9_360);
float2 l9_361=float2(1.0)-abs(sin(l9_342));
float2 l9_362=abs(cos(l9_342));
l9_361=mix(l9_361,l9_362,l9_361);
float l9_363=l9_361.x*l9_361.y;
float l9_364=0.60000002;
if (l9_363<=0.0)
{
l9_311=0.0;
}
else
{
l9_311=pow(l9_363,l9_364);
}
float l9_365=l9_311;
float l9_366=1.0-l9_365;
float l9_367=l9_343;
if (l9_366<=0.0)
{
l9_312=0.0;
}
else
{
l9_312=pow(l9_366,l9_367);
}
float l9_368=l9_312;
float l9_369=l9_368;
l9_307+=l9_369;
l9_308+=(l9_307*l9_304);
l9_306*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_303*=1.9;
l9_304*=0.22;
l9_305=mix(l9_305,1.0,0.2);
l9_313++;
continue;
}
else
{
break;
}
}
float l9_370=l9_299.y-l9_308;
l9_298.y=l9_370;
float3 l9_371=float3(l9_296.x+l9_297,l9_296.y,l9_296.z);
int l9_372=N0_NorItter;
float l9_373=tempGlobals.gTimeElapsed;
float l9_374=(l9_373*N0_Speed)+N0_Offset;
float l9_375=N0_Frequency;
float l9_376=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_377=N0_Choppiness;
float2 l9_378=l9_371.xz;
l9_378.x*=0.75;
float l9_379=0.0;
float l9_380=0.0;
float l9_381;
float l9_382;
float l9_383;
float l9_384;
int l9_385=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_385<l9_372)
{
float2 l9_386=(l9_378+float2(l9_374))*l9_375;
float l9_387=l9_377;
float2 l9_388=l9_386;
float2 l9_389=floor(l9_388);
float2 l9_390=fract(l9_388);
float2 l9_391=(l9_390*l9_390)*(float2(3.0)-(l9_390*2.0));
float2 l9_392=l9_389+float2(0.0);
float3 l9_393=float3(0.067110561,0.0058371499,52.982918);
float l9_394=fract(l9_393.z*fract(dot(l9_392,l9_393.xy)));
float2 l9_395=l9_389+float2(1.0,0.0);
float3 l9_396=float3(0.067110561,0.0058371499,52.982918);
float l9_397=fract(l9_396.z*fract(dot(l9_395,l9_396.xy)));
float2 l9_398=l9_389+float2(0.0,1.0);
float3 l9_399=float3(0.067110561,0.0058371499,52.982918);
float l9_400=fract(l9_399.z*fract(dot(l9_398,l9_399.xy)));
float2 l9_401=l9_389+float2(1.0);
float3 l9_402=float3(0.067110561,0.0058371499,52.982918);
float l9_403=fract(l9_402.z*fract(dot(l9_401,l9_402.xy)));
float l9_404=(-1.0)+(2.0*mix(mix(l9_394,l9_397,l9_391.x),mix(l9_400,l9_403,l9_391.x),l9_391.y));
l9_386+=float2(l9_404);
float2 l9_405=float2(1.0)-abs(sin(l9_386));
float2 l9_406=abs(cos(l9_386));
l9_405=mix(l9_405,l9_406,l9_405);
float l9_407=l9_405.x*l9_405.y;
float l9_408=0.60000002;
if (l9_407<=0.0)
{
l9_381=0.0;
}
else
{
l9_381=pow(l9_407,l9_408);
}
float l9_409=l9_381;
float l9_410=1.0-l9_409;
float l9_411=l9_387;
if (l9_410<=0.0)
{
l9_382=0.0;
}
else
{
l9_382=pow(l9_410,l9_411);
}
float l9_412=l9_382;
float l9_413=l9_412;
l9_379=l9_413;
float2 l9_414=(l9_378-float2(l9_374))*l9_375;
float l9_415=l9_377;
float2 l9_416=l9_414;
float2 l9_417=floor(l9_416);
float2 l9_418=fract(l9_416);
float2 l9_419=(l9_418*l9_418)*(float2(3.0)-(l9_418*2.0));
float2 l9_420=l9_417+float2(0.0);
float3 l9_421=float3(0.067110561,0.0058371499,52.982918);
float l9_422=fract(l9_421.z*fract(dot(l9_420,l9_421.xy)));
float2 l9_423=l9_417+float2(1.0,0.0);
float3 l9_424=float3(0.067110561,0.0058371499,52.982918);
float l9_425=fract(l9_424.z*fract(dot(l9_423,l9_424.xy)));
float2 l9_426=l9_417+float2(0.0,1.0);
float3 l9_427=float3(0.067110561,0.0058371499,52.982918);
float l9_428=fract(l9_427.z*fract(dot(l9_426,l9_427.xy)));
float2 l9_429=l9_417+float2(1.0);
float3 l9_430=float3(0.067110561,0.0058371499,52.982918);
float l9_431=fract(l9_430.z*fract(dot(l9_429,l9_430.xy)));
float l9_432=(-1.0)+(2.0*mix(mix(l9_422,l9_425,l9_419.x),mix(l9_428,l9_431,l9_419.x),l9_419.y));
l9_414+=float2(l9_432);
float2 l9_433=float2(1.0)-abs(sin(l9_414));
float2 l9_434=abs(cos(l9_414));
l9_433=mix(l9_433,l9_434,l9_433);
float l9_435=l9_433.x*l9_433.y;
float l9_436=0.60000002;
if (l9_435<=0.0)
{
l9_383=0.0;
}
else
{
l9_383=pow(l9_435,l9_436);
}
float l9_437=l9_383;
float l9_438=1.0-l9_437;
float l9_439=l9_415;
if (l9_438<=0.0)
{
l9_384=0.0;
}
else
{
l9_384=pow(l9_438,l9_439);
}
float l9_440=l9_384;
float l9_441=l9_440;
l9_379+=l9_441;
l9_380+=(l9_379*l9_376);
l9_378*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_375*=1.9;
l9_376*=0.22;
l9_377=mix(l9_377,1.0,0.2);
l9_385++;
continue;
}
else
{
break;
}
}
float l9_442=l9_371.y-l9_380;
l9_298.x=l9_442-l9_298.y;
float3 l9_443=float3(l9_296.x,l9_296.y,l9_296.z+l9_297);
int l9_444=N0_NorItter;
float l9_445=tempGlobals.gTimeElapsed;
float l9_446=(l9_445*N0_Speed)+N0_Offset;
float l9_447=N0_Frequency;
float l9_448=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_449=N0_Choppiness;
float2 l9_450=l9_443.xz;
l9_450.x*=0.75;
float l9_451=0.0;
float l9_452=0.0;
float l9_453;
float l9_454;
float l9_455;
float l9_456;
int l9_457=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_457<l9_444)
{
float2 l9_458=(l9_450+float2(l9_446))*l9_447;
float l9_459=l9_449;
float2 l9_460=l9_458;
float2 l9_461=floor(l9_460);
float2 l9_462=fract(l9_460);
float2 l9_463=(l9_462*l9_462)*(float2(3.0)-(l9_462*2.0));
float2 l9_464=l9_461+float2(0.0);
float3 l9_465=float3(0.067110561,0.0058371499,52.982918);
float l9_466=fract(l9_465.z*fract(dot(l9_464,l9_465.xy)));
float2 l9_467=l9_461+float2(1.0,0.0);
float3 l9_468=float3(0.067110561,0.0058371499,52.982918);
float l9_469=fract(l9_468.z*fract(dot(l9_467,l9_468.xy)));
float2 l9_470=l9_461+float2(0.0,1.0);
float3 l9_471=float3(0.067110561,0.0058371499,52.982918);
float l9_472=fract(l9_471.z*fract(dot(l9_470,l9_471.xy)));
float2 l9_473=l9_461+float2(1.0);
float3 l9_474=float3(0.067110561,0.0058371499,52.982918);
float l9_475=fract(l9_474.z*fract(dot(l9_473,l9_474.xy)));
float l9_476=(-1.0)+(2.0*mix(mix(l9_466,l9_469,l9_463.x),mix(l9_472,l9_475,l9_463.x),l9_463.y));
l9_458+=float2(l9_476);
float2 l9_477=float2(1.0)-abs(sin(l9_458));
float2 l9_478=abs(cos(l9_458));
l9_477=mix(l9_477,l9_478,l9_477);
float l9_479=l9_477.x*l9_477.y;
float l9_480=0.60000002;
if (l9_479<=0.0)
{
l9_453=0.0;
}
else
{
l9_453=pow(l9_479,l9_480);
}
float l9_481=l9_453;
float l9_482=1.0-l9_481;
float l9_483=l9_459;
if (l9_482<=0.0)
{
l9_454=0.0;
}
else
{
l9_454=pow(l9_482,l9_483);
}
float l9_484=l9_454;
float l9_485=l9_484;
l9_451=l9_485;
float2 l9_486=(l9_450-float2(l9_446))*l9_447;
float l9_487=l9_449;
float2 l9_488=l9_486;
float2 l9_489=floor(l9_488);
float2 l9_490=fract(l9_488);
float2 l9_491=(l9_490*l9_490)*(float2(3.0)-(l9_490*2.0));
float2 l9_492=l9_489+float2(0.0);
float3 l9_493=float3(0.067110561,0.0058371499,52.982918);
float l9_494=fract(l9_493.z*fract(dot(l9_492,l9_493.xy)));
float2 l9_495=l9_489+float2(1.0,0.0);
float3 l9_496=float3(0.067110561,0.0058371499,52.982918);
float l9_497=fract(l9_496.z*fract(dot(l9_495,l9_496.xy)));
float2 l9_498=l9_489+float2(0.0,1.0);
float3 l9_499=float3(0.067110561,0.0058371499,52.982918);
float l9_500=fract(l9_499.z*fract(dot(l9_498,l9_499.xy)));
float2 l9_501=l9_489+float2(1.0);
float3 l9_502=float3(0.067110561,0.0058371499,52.982918);
float l9_503=fract(l9_502.z*fract(dot(l9_501,l9_502.xy)));
float l9_504=(-1.0)+(2.0*mix(mix(l9_494,l9_497,l9_491.x),mix(l9_500,l9_503,l9_491.x),l9_491.y));
l9_486+=float2(l9_504);
float2 l9_505=float2(1.0)-abs(sin(l9_486));
float2 l9_506=abs(cos(l9_486));
l9_505=mix(l9_505,l9_506,l9_505);
float l9_507=l9_505.x*l9_505.y;
float l9_508=0.60000002;
if (l9_507<=0.0)
{
l9_455=0.0;
}
else
{
l9_455=pow(l9_507,l9_508);
}
float l9_509=l9_455;
float l9_510=1.0-l9_509;
float l9_511=l9_487;
if (l9_510<=0.0)
{
l9_456=0.0;
}
else
{
l9_456=pow(l9_510,l9_511);
}
float l9_512=l9_456;
float l9_513=l9_512;
l9_451+=l9_513;
l9_452+=(l9_451*l9_448);
l9_450*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_447*=1.9;
l9_448*=0.22;
l9_449=mix(l9_449,1.0,0.2);
l9_457++;
continue;
}
else
{
break;
}
}
float l9_514=l9_443.y-l9_452;
l9_298.z=l9_514-l9_298.y;
l9_298.y=l9_297;
float3 l9_515=normalize(l9_298);
N0_Normal=l9_515;
N0_Normal=(float3(N0_Normal.x,-N0_Normal.z,N0_Normal.y)+float3(1.0))/float3(2.0);
float l9_516=l9_290.y*0.44999999;
float l9_517=1.2;
float l9_518;
if (l9_516<=0.0)
{
l9_518=0.0;
}
else
{
l9_518=pow(l9_516,l9_517);
}
float l9_519=l9_518;
float l9_520=fast::clamp(l9_519,0.0,1.0);
float l9_521=l9_520*N0_Amplitude;
float l9_522=l9_521;
float l9_523=0.0;
float l9_524=N0_Amplitude;
float2 l9_525=float2(0.0);
float l9_526=l9_522;
float l9_527=l9_523;
float l9_528=l9_524;
float l9_529=0.99998999;
float l9_530=fast::clamp(l9_526,l9_527,l9_528);
float l9_531=l9_527;
float l9_532=l9_528;
float l9_533=0.0;
float l9_534=l9_529;
float l9_535=l9_533+(((l9_530-l9_531)*(l9_534-l9_533))/(l9_532-l9_531));
float l9_536=l9_535;
float4 l9_537=float4(1.0,255.0,65025.0,16581375.0)*l9_536;
l9_537=fract(l9_537);
l9_537-=(l9_537.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_538=l9_537.xy;
float2 l9_539=l9_538;
l9_525=l9_539;
float2 l9_540=l9_525;
float2 l9_541=l9_540;
N0_Displacement=l9_541;
l9_284=N0_Normal;
l9_274=l9_284;
float4 l9_542=float4(0.0);
int l9_543=0;
if ((int(fluidNormalHasSwappedViews_tmp)!=0))
{
int l9_544=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_544=0;
}
else
{
l9_544=in.varStereoViewID;
}
int l9_545=l9_544;
l9_543=1-l9_545;
}
else
{
int l9_546=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_546=0;
}
else
{
l9_546=in.varStereoViewID;
}
int l9_547=l9_546;
l9_543=l9_547;
}
int l9_548=l9_543;
int l9_549=fluidNormalLayout_tmp;
int l9_550=l9_548;
float2 l9_551=param_21.Surface_UVCoord0;
bool l9_552=(int(SC_USE_UV_TRANSFORM_fluidNormal_tmp)!=0);
float3x3 l9_553=(*sc_set0.UserUniforms).fluidNormalTransform;
int2 l9_554=int2(SC_SOFTWARE_WRAP_MODE_U_fluidNormal_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidNormal_tmp);
bool l9_555=(int(SC_USE_UV_MIN_MAX_fluidNormal_tmp)!=0);
float4 l9_556=(*sc_set0.UserUniforms).fluidNormalUvMinMax;
bool l9_557=(int(SC_USE_CLAMP_TO_BORDER_fluidNormal_tmp)!=0);
float4 l9_558=(*sc_set0.UserUniforms).fluidNormalBorderColor;
float l9_559=0.0;
bool l9_560=l9_557&&(!l9_555);
float l9_561=1.0;
float l9_562=l9_551.x;
int l9_563=l9_554.x;
if (l9_563==1)
{
l9_562=fract(l9_562);
}
else
{
if (l9_563==2)
{
float l9_564=fract(l9_562);
float l9_565=l9_562-l9_564;
float l9_566=step(0.25,fract(l9_565*0.5));
l9_562=mix(l9_564,1.0-l9_564,fast::clamp(l9_566,0.0,1.0));
}
}
l9_551.x=l9_562;
float l9_567=l9_551.y;
int l9_568=l9_554.y;
if (l9_568==1)
{
l9_567=fract(l9_567);
}
else
{
if (l9_568==2)
{
float l9_569=fract(l9_567);
float l9_570=l9_567-l9_569;
float l9_571=step(0.25,fract(l9_570*0.5));
l9_567=mix(l9_569,1.0-l9_569,fast::clamp(l9_571,0.0,1.0));
}
}
l9_551.y=l9_567;
if (l9_555)
{
bool l9_572=l9_557;
bool l9_573;
if (l9_572)
{
l9_573=l9_554.x==3;
}
else
{
l9_573=l9_572;
}
float l9_574=l9_551.x;
float l9_575=l9_556.x;
float l9_576=l9_556.z;
bool l9_577=l9_573;
float l9_578=l9_561;
float l9_579=fast::clamp(l9_574,l9_575,l9_576);
float l9_580=step(abs(l9_574-l9_579),9.9999997e-06);
l9_578*=(l9_580+((1.0-float(l9_577))*(1.0-l9_580)));
l9_574=l9_579;
l9_551.x=l9_574;
l9_561=l9_578;
bool l9_581=l9_557;
bool l9_582;
if (l9_581)
{
l9_582=l9_554.y==3;
}
else
{
l9_582=l9_581;
}
float l9_583=l9_551.y;
float l9_584=l9_556.y;
float l9_585=l9_556.w;
bool l9_586=l9_582;
float l9_587=l9_561;
float l9_588=fast::clamp(l9_583,l9_584,l9_585);
float l9_589=step(abs(l9_583-l9_588),9.9999997e-06);
l9_587*=(l9_589+((1.0-float(l9_586))*(1.0-l9_589)));
l9_583=l9_588;
l9_551.y=l9_583;
l9_561=l9_587;
}
float2 l9_590=l9_551;
bool l9_591=l9_552;
float3x3 l9_592=l9_553;
if (l9_591)
{
l9_590=float2((l9_592*float3(l9_590,1.0)).xy);
}
float2 l9_593=l9_590;
float2 l9_594=l9_593;
float2 l9_595=l9_594;
l9_551=l9_595;
float l9_596=l9_551.x;
int l9_597=l9_554.x;
bool l9_598=l9_560;
float l9_599=l9_561;
if ((l9_597==0)||(l9_597==3))
{
float l9_600=l9_596;
float l9_601=0.0;
float l9_602=1.0;
bool l9_603=l9_598;
float l9_604=l9_599;
float l9_605=fast::clamp(l9_600,l9_601,l9_602);
float l9_606=step(abs(l9_600-l9_605),9.9999997e-06);
l9_604*=(l9_606+((1.0-float(l9_603))*(1.0-l9_606)));
l9_600=l9_605;
l9_596=l9_600;
l9_599=l9_604;
}
l9_551.x=l9_596;
l9_561=l9_599;
float l9_607=l9_551.y;
int l9_608=l9_554.y;
bool l9_609=l9_560;
float l9_610=l9_561;
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
l9_551.y=l9_607;
l9_561=l9_610;
float2 l9_618=l9_551;
int l9_619=l9_549;
int l9_620=l9_550;
float l9_621=l9_559;
float2 l9_622=l9_618;
int l9_623=l9_619;
int l9_624=l9_620;
float3 l9_625=float3(0.0);
if (l9_623==0)
{
l9_625=float3(l9_622,0.0);
}
else
{
if (l9_623==1)
{
l9_625=float3(l9_622.x,(l9_622.y*0.5)+(0.5-(float(l9_624)*0.5)),0.0);
}
else
{
l9_625=float3(l9_622,float(l9_624));
}
}
float3 l9_626=l9_625;
float3 l9_627=l9_626;
float2 l9_628=l9_627.xy;
float l9_629=l9_621;
float4 l9_630=sc_set0.fluidNormal.sample(sc_set0.fluidNormalSmpSC,l9_628,bias(l9_629));
float4 l9_631=l9_630;
float4 l9_632=l9_631;
if (l9_557)
{
l9_632=mix(l9_558,l9_632,float4(l9_561));
}
float4 l9_633=l9_632;
l9_542=l9_633;
float3 l9_634=float3(0.0);
float3 l9_635=l9_274;
float l9_636=(*sc_set0.UserUniforms).Port_Strength1_N003;
float3 l9_637=l9_542.xyz;
float l9_638=(*sc_set0.UserUniforms).Port_Strength2_N003;
float3 l9_639=l9_635;
float l9_640=l9_636;
float3 l9_641=l9_637;
float l9_642=l9_638;
float3 l9_643=mix(float3(0.0,0.0,1.0),l9_639,float3(l9_640))+float3(0.0,0.0,1.0);
float3 l9_644=mix(float3(0.0,0.0,1.0),l9_641,float3(l9_642))*float3(-1.0,-1.0,1.0);
float3 l9_645=normalize((l9_643*dot(l9_643,l9_644))-(l9_644*l9_643.z));
l9_637=l9_645;
float3 l9_646=l9_637;
l9_634=l9_646;
float4 l9_647=float4(0.0);
l9_647=float4(l9_634,0.0);
float l9_648=0.0;
l9_648=fast::clamp((*sc_set0.UserUniforms).Port_Import_N092,0.0,5.0);
float4 l9_649=float4(0.0);
l9_649=l9_647*float4(l9_648);
float l9_650=0.0;
l9_650=dot(l9_649,(*sc_set0.UserUniforms).Port_Input1_N094);
float l9_651=0.0;
l9_651=fast::clamp((*sc_set0.UserUniforms).Port_Import_N095,0.0,2.0);
float4 l9_652=float4(0.0);
l9_652=mix(float4(l9_650),l9_649,float4(l9_651));
float l9_653=0.0;
l9_653=fast::clamp((*sc_set0.UserUniforms).Port_Import_N100,0.0,2.0);
float4 l9_654=float4(0.0);
l9_654=mix((*sc_set0.UserUniforms).Port_Input0_N102,l9_652,float4(l9_653));
float4 l9_655=float4(0.0);
l9_655=l9_654;
param_18=l9_655.xyz;
param_20=param_18;
}
else
{
float l9_656=0.0;
float l9_657=(*sc_set0.UserUniforms).amplitude;
l9_656=l9_657;
float l9_658=0.0;
float l9_659=(*sc_set0.UserUniforms).choppiness;
l9_658=l9_659;
float l9_660=0.0;
float l9_661=(*sc_set0.UserUniforms).speed;
l9_660=l9_661;
float l9_662=0.0;
float l9_663=(*sc_set0.UserUniforms).offset;
l9_662=l9_663;
float l9_664=0.0;
float l9_665=(*sc_set0.UserUniforms).noiseSteps;
l9_664=l9_665;
float l9_666=0.0;
float l9_667=(*sc_set0.UserUniforms).norSteps;
l9_666=l9_667;
float3 l9_668=float3(0.0);
float l9_669=l9_656;
float l9_670=l9_658;
float l9_671=(*sc_set0.UserUniforms).Port_Frequency_N000;
float l9_672=l9_660;
float l9_673=l9_662;
float l9_674=(*sc_set0.UserUniforms).Port_MarchSteps_N000;
float l9_675=l9_664;
float l9_676=l9_666;
ssGlobals l9_677=param_21;
tempGlobals=l9_677;
float3 l9_678=float3(0.0);
N0_Amplitude=l9_669;
N0_Choppiness=l9_670;
N0_Frequency=l9_671;
N0_Speed=l9_672;
N0_Offset=l9_673;
N0_MarchSteps=int(l9_674);
N0_NoiseItter=int(l9_675);
N0_NorItter=int(l9_676);
float3 l9_679=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_680=l9_679;
float3 l9_681=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_682=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_683=normalize(l9_681-l9_682);
float3 l9_684=float3(0.0);
float3 l9_685=l9_680;
float3 l9_686=l9_683;
float3 l9_687;
float l9_688=N0_heightMapTracing(l9_685,l9_686,l9_687,N0_MarchSteps,N0_NoiseItter,N0_Amplitude,N0_Choppiness,N0_Frequency,N0_Speed,N0_Offset,tempGlobals);
l9_684=l9_687;
float3 l9_689=l9_684-l9_680;
float3 l9_690=l9_684;
float l9_691=(dot(l9_689,l9_689)*0.1)/720.0;
float3 l9_692=float3(0.0);
float3 l9_693=l9_690;
int l9_694=N0_NorItter;
float l9_695=tempGlobals.gTimeElapsed;
float l9_696=(l9_695*N0_Speed)+N0_Offset;
float l9_697=N0_Frequency;
float l9_698=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_699=N0_Choppiness;
float2 l9_700=l9_693.xz;
l9_700.x*=0.75;
float l9_701=0.0;
float l9_702=0.0;
float l9_703;
float l9_704;
float l9_705;
float l9_706;
int l9_707=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_707<l9_694)
{
float2 l9_708=(l9_700+float2(l9_696))*l9_697;
float l9_709=l9_699;
float2 l9_710=l9_708;
float2 l9_711=floor(l9_710);
float2 l9_712=fract(l9_710);
float2 l9_713=(l9_712*l9_712)*(float2(3.0)-(l9_712*2.0));
float2 l9_714=l9_711+float2(0.0);
float3 l9_715=float3(0.067110561,0.0058371499,52.982918);
float l9_716=fract(l9_715.z*fract(dot(l9_714,l9_715.xy)));
float2 l9_717=l9_711+float2(1.0,0.0);
float3 l9_718=float3(0.067110561,0.0058371499,52.982918);
float l9_719=fract(l9_718.z*fract(dot(l9_717,l9_718.xy)));
float2 l9_720=l9_711+float2(0.0,1.0);
float3 l9_721=float3(0.067110561,0.0058371499,52.982918);
float l9_722=fract(l9_721.z*fract(dot(l9_720,l9_721.xy)));
float2 l9_723=l9_711+float2(1.0);
float3 l9_724=float3(0.067110561,0.0058371499,52.982918);
float l9_725=fract(l9_724.z*fract(dot(l9_723,l9_724.xy)));
float l9_726=(-1.0)+(2.0*mix(mix(l9_716,l9_719,l9_713.x),mix(l9_722,l9_725,l9_713.x),l9_713.y));
l9_708+=float2(l9_726);
float2 l9_727=float2(1.0)-abs(sin(l9_708));
float2 l9_728=abs(cos(l9_708));
l9_727=mix(l9_727,l9_728,l9_727);
float l9_729=l9_727.x*l9_727.y;
float l9_730=0.60000002;
if (l9_729<=0.0)
{
l9_703=0.0;
}
else
{
l9_703=pow(l9_729,l9_730);
}
float l9_731=l9_703;
float l9_732=1.0-l9_731;
float l9_733=l9_709;
if (l9_732<=0.0)
{
l9_704=0.0;
}
else
{
l9_704=pow(l9_732,l9_733);
}
float l9_734=l9_704;
float l9_735=l9_734;
l9_701=l9_735;
float2 l9_736=(l9_700-float2(l9_696))*l9_697;
float l9_737=l9_699;
float2 l9_738=l9_736;
float2 l9_739=floor(l9_738);
float2 l9_740=fract(l9_738);
float2 l9_741=(l9_740*l9_740)*(float2(3.0)-(l9_740*2.0));
float2 l9_742=l9_739+float2(0.0);
float3 l9_743=float3(0.067110561,0.0058371499,52.982918);
float l9_744=fract(l9_743.z*fract(dot(l9_742,l9_743.xy)));
float2 l9_745=l9_739+float2(1.0,0.0);
float3 l9_746=float3(0.067110561,0.0058371499,52.982918);
float l9_747=fract(l9_746.z*fract(dot(l9_745,l9_746.xy)));
float2 l9_748=l9_739+float2(0.0,1.0);
float3 l9_749=float3(0.067110561,0.0058371499,52.982918);
float l9_750=fract(l9_749.z*fract(dot(l9_748,l9_749.xy)));
float2 l9_751=l9_739+float2(1.0);
float3 l9_752=float3(0.067110561,0.0058371499,52.982918);
float l9_753=fract(l9_752.z*fract(dot(l9_751,l9_752.xy)));
float l9_754=(-1.0)+(2.0*mix(mix(l9_744,l9_747,l9_741.x),mix(l9_750,l9_753,l9_741.x),l9_741.y));
l9_736+=float2(l9_754);
float2 l9_755=float2(1.0)-abs(sin(l9_736));
float2 l9_756=abs(cos(l9_736));
l9_755=mix(l9_755,l9_756,l9_755);
float l9_757=l9_755.x*l9_755.y;
float l9_758=0.60000002;
if (l9_757<=0.0)
{
l9_705=0.0;
}
else
{
l9_705=pow(l9_757,l9_758);
}
float l9_759=l9_705;
float l9_760=1.0-l9_759;
float l9_761=l9_737;
if (l9_760<=0.0)
{
l9_706=0.0;
}
else
{
l9_706=pow(l9_760,l9_761);
}
float l9_762=l9_706;
float l9_763=l9_762;
l9_701+=l9_763;
l9_702+=(l9_701*l9_698);
l9_700*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_697*=1.9;
l9_698*=0.22;
l9_699=mix(l9_699,1.0,0.2);
l9_707++;
continue;
}
else
{
break;
}
}
float l9_764=l9_693.y-l9_702;
l9_692.y=l9_764;
float3 l9_765=float3(l9_690.x+l9_691,l9_690.y,l9_690.z);
int l9_766=N0_NorItter;
float l9_767=tempGlobals.gTimeElapsed;
float l9_768=(l9_767*N0_Speed)+N0_Offset;
float l9_769=N0_Frequency;
float l9_770=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_771=N0_Choppiness;
float2 l9_772=l9_765.xz;
l9_772.x*=0.75;
float l9_773=0.0;
float l9_774=0.0;
float l9_775;
float l9_776;
float l9_777;
float l9_778;
int l9_779=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_779<l9_766)
{
float2 l9_780=(l9_772+float2(l9_768))*l9_769;
float l9_781=l9_771;
float2 l9_782=l9_780;
float2 l9_783=floor(l9_782);
float2 l9_784=fract(l9_782);
float2 l9_785=(l9_784*l9_784)*(float2(3.0)-(l9_784*2.0));
float2 l9_786=l9_783+float2(0.0);
float3 l9_787=float3(0.067110561,0.0058371499,52.982918);
float l9_788=fract(l9_787.z*fract(dot(l9_786,l9_787.xy)));
float2 l9_789=l9_783+float2(1.0,0.0);
float3 l9_790=float3(0.067110561,0.0058371499,52.982918);
float l9_791=fract(l9_790.z*fract(dot(l9_789,l9_790.xy)));
float2 l9_792=l9_783+float2(0.0,1.0);
float3 l9_793=float3(0.067110561,0.0058371499,52.982918);
float l9_794=fract(l9_793.z*fract(dot(l9_792,l9_793.xy)));
float2 l9_795=l9_783+float2(1.0);
float3 l9_796=float3(0.067110561,0.0058371499,52.982918);
float l9_797=fract(l9_796.z*fract(dot(l9_795,l9_796.xy)));
float l9_798=(-1.0)+(2.0*mix(mix(l9_788,l9_791,l9_785.x),mix(l9_794,l9_797,l9_785.x),l9_785.y));
l9_780+=float2(l9_798);
float2 l9_799=float2(1.0)-abs(sin(l9_780));
float2 l9_800=abs(cos(l9_780));
l9_799=mix(l9_799,l9_800,l9_799);
float l9_801=l9_799.x*l9_799.y;
float l9_802=0.60000002;
if (l9_801<=0.0)
{
l9_775=0.0;
}
else
{
l9_775=pow(l9_801,l9_802);
}
float l9_803=l9_775;
float l9_804=1.0-l9_803;
float l9_805=l9_781;
if (l9_804<=0.0)
{
l9_776=0.0;
}
else
{
l9_776=pow(l9_804,l9_805);
}
float l9_806=l9_776;
float l9_807=l9_806;
l9_773=l9_807;
float2 l9_808=(l9_772-float2(l9_768))*l9_769;
float l9_809=l9_771;
float2 l9_810=l9_808;
float2 l9_811=floor(l9_810);
float2 l9_812=fract(l9_810);
float2 l9_813=(l9_812*l9_812)*(float2(3.0)-(l9_812*2.0));
float2 l9_814=l9_811+float2(0.0);
float3 l9_815=float3(0.067110561,0.0058371499,52.982918);
float l9_816=fract(l9_815.z*fract(dot(l9_814,l9_815.xy)));
float2 l9_817=l9_811+float2(1.0,0.0);
float3 l9_818=float3(0.067110561,0.0058371499,52.982918);
float l9_819=fract(l9_818.z*fract(dot(l9_817,l9_818.xy)));
float2 l9_820=l9_811+float2(0.0,1.0);
float3 l9_821=float3(0.067110561,0.0058371499,52.982918);
float l9_822=fract(l9_821.z*fract(dot(l9_820,l9_821.xy)));
float2 l9_823=l9_811+float2(1.0);
float3 l9_824=float3(0.067110561,0.0058371499,52.982918);
float l9_825=fract(l9_824.z*fract(dot(l9_823,l9_824.xy)));
float l9_826=(-1.0)+(2.0*mix(mix(l9_816,l9_819,l9_813.x),mix(l9_822,l9_825,l9_813.x),l9_813.y));
l9_808+=float2(l9_826);
float2 l9_827=float2(1.0)-abs(sin(l9_808));
float2 l9_828=abs(cos(l9_808));
l9_827=mix(l9_827,l9_828,l9_827);
float l9_829=l9_827.x*l9_827.y;
float l9_830=0.60000002;
if (l9_829<=0.0)
{
l9_777=0.0;
}
else
{
l9_777=pow(l9_829,l9_830);
}
float l9_831=l9_777;
float l9_832=1.0-l9_831;
float l9_833=l9_809;
if (l9_832<=0.0)
{
l9_778=0.0;
}
else
{
l9_778=pow(l9_832,l9_833);
}
float l9_834=l9_778;
float l9_835=l9_834;
l9_773+=l9_835;
l9_774+=(l9_773*l9_770);
l9_772*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_769*=1.9;
l9_770*=0.22;
l9_771=mix(l9_771,1.0,0.2);
l9_779++;
continue;
}
else
{
break;
}
}
float l9_836=l9_765.y-l9_774;
l9_692.x=l9_836-l9_692.y;
float3 l9_837=float3(l9_690.x,l9_690.y,l9_690.z+l9_691);
int l9_838=N0_NorItter;
float l9_839=tempGlobals.gTimeElapsed;
float l9_840=(l9_839*N0_Speed)+N0_Offset;
float l9_841=N0_Frequency;
float l9_842=fast::clamp(N0_Amplitude*0.5,0.0,1.0);
float l9_843=N0_Choppiness;
float2 l9_844=l9_837.xz;
l9_844.x*=0.75;
float l9_845=0.0;
float l9_846=0.0;
float l9_847;
float l9_848;
float l9_849;
float l9_850;
int l9_851=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_851<l9_838)
{
float2 l9_852=(l9_844+float2(l9_840))*l9_841;
float l9_853=l9_843;
float2 l9_854=l9_852;
float2 l9_855=floor(l9_854);
float2 l9_856=fract(l9_854);
float2 l9_857=(l9_856*l9_856)*(float2(3.0)-(l9_856*2.0));
float2 l9_858=l9_855+float2(0.0);
float3 l9_859=float3(0.067110561,0.0058371499,52.982918);
float l9_860=fract(l9_859.z*fract(dot(l9_858,l9_859.xy)));
float2 l9_861=l9_855+float2(1.0,0.0);
float3 l9_862=float3(0.067110561,0.0058371499,52.982918);
float l9_863=fract(l9_862.z*fract(dot(l9_861,l9_862.xy)));
float2 l9_864=l9_855+float2(0.0,1.0);
float3 l9_865=float3(0.067110561,0.0058371499,52.982918);
float l9_866=fract(l9_865.z*fract(dot(l9_864,l9_865.xy)));
float2 l9_867=l9_855+float2(1.0);
float3 l9_868=float3(0.067110561,0.0058371499,52.982918);
float l9_869=fract(l9_868.z*fract(dot(l9_867,l9_868.xy)));
float l9_870=(-1.0)+(2.0*mix(mix(l9_860,l9_863,l9_857.x),mix(l9_866,l9_869,l9_857.x),l9_857.y));
l9_852+=float2(l9_870);
float2 l9_871=float2(1.0)-abs(sin(l9_852));
float2 l9_872=abs(cos(l9_852));
l9_871=mix(l9_871,l9_872,l9_871);
float l9_873=l9_871.x*l9_871.y;
float l9_874=0.60000002;
if (l9_873<=0.0)
{
l9_847=0.0;
}
else
{
l9_847=pow(l9_873,l9_874);
}
float l9_875=l9_847;
float l9_876=1.0-l9_875;
float l9_877=l9_853;
if (l9_876<=0.0)
{
l9_848=0.0;
}
else
{
l9_848=pow(l9_876,l9_877);
}
float l9_878=l9_848;
float l9_879=l9_878;
l9_845=l9_879;
float2 l9_880=(l9_844-float2(l9_840))*l9_841;
float l9_881=l9_843;
float2 l9_882=l9_880;
float2 l9_883=floor(l9_882);
float2 l9_884=fract(l9_882);
float2 l9_885=(l9_884*l9_884)*(float2(3.0)-(l9_884*2.0));
float2 l9_886=l9_883+float2(0.0);
float3 l9_887=float3(0.067110561,0.0058371499,52.982918);
float l9_888=fract(l9_887.z*fract(dot(l9_886,l9_887.xy)));
float2 l9_889=l9_883+float2(1.0,0.0);
float3 l9_890=float3(0.067110561,0.0058371499,52.982918);
float l9_891=fract(l9_890.z*fract(dot(l9_889,l9_890.xy)));
float2 l9_892=l9_883+float2(0.0,1.0);
float3 l9_893=float3(0.067110561,0.0058371499,52.982918);
float l9_894=fract(l9_893.z*fract(dot(l9_892,l9_893.xy)));
float2 l9_895=l9_883+float2(1.0);
float3 l9_896=float3(0.067110561,0.0058371499,52.982918);
float l9_897=fract(l9_896.z*fract(dot(l9_895,l9_896.xy)));
float l9_898=(-1.0)+(2.0*mix(mix(l9_888,l9_891,l9_885.x),mix(l9_894,l9_897,l9_885.x),l9_885.y));
l9_880+=float2(l9_898);
float2 l9_899=float2(1.0)-abs(sin(l9_880));
float2 l9_900=abs(cos(l9_880));
l9_899=mix(l9_899,l9_900,l9_899);
float l9_901=l9_899.x*l9_899.y;
float l9_902=0.60000002;
if (l9_901<=0.0)
{
l9_849=0.0;
}
else
{
l9_849=pow(l9_901,l9_902);
}
float l9_903=l9_849;
float l9_904=1.0-l9_903;
float l9_905=l9_881;
if (l9_904<=0.0)
{
l9_850=0.0;
}
else
{
l9_850=pow(l9_904,l9_905);
}
float l9_906=l9_850;
float l9_907=l9_906;
l9_845+=l9_907;
l9_846+=(l9_845*l9_842);
l9_844*=float2x2(float2(1.5,1.0),float2(-1.0,1.5));
l9_841*=1.9;
l9_842*=0.22;
l9_843=mix(l9_843,1.0,0.2);
l9_851++;
continue;
}
else
{
break;
}
}
float l9_908=l9_837.y-l9_846;
l9_692.z=l9_908-l9_692.y;
l9_692.y=l9_691;
float3 l9_909=normalize(l9_692);
N0_Normal=l9_909;
N0_Normal=(float3(N0_Normal.x,-N0_Normal.z,N0_Normal.y)+float3(1.0))/float3(2.0);
float l9_910=l9_684.y*0.44999999;
float l9_911=1.2;
float l9_912;
if (l9_910<=0.0)
{
l9_912=0.0;
}
else
{
l9_912=pow(l9_910,l9_911);
}
float l9_913=l9_912;
float l9_914=fast::clamp(l9_913,0.0,1.0);
float l9_915=l9_914*N0_Amplitude;
float l9_916=l9_915;
float l9_917=0.0;
float l9_918=N0_Amplitude;
float2 l9_919=float2(0.0);
float l9_920=l9_916;
float l9_921=l9_917;
float l9_922=l9_918;
float l9_923=0.99998999;
float l9_924=fast::clamp(l9_920,l9_921,l9_922);
float l9_925=l9_921;
float l9_926=l9_922;
float l9_927=0.0;
float l9_928=l9_923;
float l9_929=l9_927+(((l9_924-l9_925)*(l9_928-l9_927))/(l9_926-l9_925));
float l9_930=l9_929;
float4 l9_931=float4(1.0,255.0,65025.0,16581375.0)*l9_930;
l9_931=fract(l9_931);
l9_931-=(l9_931.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_932=l9_931.xy;
float2 l9_933=l9_932;
l9_919=l9_933;
float2 l9_934=l9_919;
float2 l9_935=l9_934;
N0_Displacement=l9_935;
l9_678=N0_Normal;
l9_668=l9_678;
param_19=l9_668;
param_20=param_19;
}
Output_N16=param_20;
FinalColor1=float4(Output_N16,0.0);
float4 param_22=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_936=param_22;
float4 l9_937=l9_936;
float l9_938=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_938=l9_937.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_938=fast::clamp(l9_937.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_938=fast::clamp(dot(l9_937.xyz,float3(l9_937.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_938=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_938=(1.0-dot(l9_937.xyz,float3(0.33333001)))*l9_937.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_938=(1.0-fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0))*l9_937.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_938=fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0)*l9_937.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_938=fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_938=fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0)*l9_937.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_938=dot(l9_937.xyz,float3(0.33333001))*l9_937.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_938=1.0-fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_938=fast::clamp(dot(l9_937.xyz,float3(1.0)),0.0,1.0);
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
float l9_939=l9_938;
float l9_940=l9_939;
float l9_941=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_940;
float3 l9_942=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_936.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_943=float4(l9_942.x,l9_942.y,l9_942.z,l9_941);
param_22=l9_943;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_22=float4(param_22.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_944=param_22;
float4 l9_945=float4(0.0);
float4 l9_946=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_947=out.FragColor0;
float4 l9_948=l9_947;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_948.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_949=l9_948;
l9_946=l9_949;
}
else
{
float4 l9_950=gl_FragCoord;
float2 l9_951=l9_950.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_952=l9_951;
float2 l9_953=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_954=1;
int l9_955=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_955=0;
}
else
{
l9_955=in.varStereoViewID;
}
int l9_956=l9_955;
int l9_957=l9_956;
float3 l9_958=float3(l9_952,0.0);
int l9_959=l9_954;
int l9_960=l9_957;
if (l9_959==1)
{
l9_958.y=((2.0*l9_958.y)+float(l9_960))-1.0;
}
float2 l9_961=l9_958.xy;
l9_953=l9_961;
}
else
{
l9_953=l9_952;
}
float2 l9_962=l9_953;
float2 l9_963=l9_962;
float2 l9_964=l9_963;
int l9_965=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_966=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_966=0;
}
else
{
l9_966=in.varStereoViewID;
}
int l9_967=l9_966;
l9_965=1-l9_967;
}
else
{
int l9_968=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_968=0;
}
else
{
l9_968=in.varStereoViewID;
}
int l9_969=l9_968;
l9_965=l9_969;
}
int l9_970=l9_965;
float2 l9_971=l9_964;
int l9_972=l9_970;
float2 l9_973=l9_971;
int l9_974=l9_972;
float l9_975=0.0;
float4 l9_976=float4(0.0);
float2 l9_977=l9_973;
int l9_978=sc_ScreenTextureLayout_tmp;
int l9_979=l9_974;
float l9_980=l9_975;
float2 l9_981=l9_977;
int l9_982=l9_978;
int l9_983=l9_979;
float3 l9_984=float3(0.0);
if (l9_982==0)
{
l9_984=float3(l9_981,0.0);
}
else
{
if (l9_982==1)
{
l9_984=float3(l9_981.x,(l9_981.y*0.5)+(0.5-(float(l9_983)*0.5)),0.0);
}
else
{
l9_984=float3(l9_981,float(l9_983));
}
}
float3 l9_985=l9_984;
float3 l9_986=l9_985;
float2 l9_987=l9_986.xy;
float l9_988=l9_980;
float4 l9_989=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_987,bias(l9_988));
float4 l9_990=l9_989;
l9_976=l9_990;
float4 l9_991=l9_976;
float4 l9_992=l9_991;
float4 l9_993=l9_992;
l9_946=l9_993;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_946.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_994=l9_946;
float4 l9_995=l9_994;
float3 l9_996=l9_995.xyz;
float3 l9_997=l9_996;
float3 l9_998=l9_944.xyz;
float3 l9_999=definedBlend(l9_997,l9_998,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_945=float4(l9_999.x,l9_999.y,l9_999.z,l9_945.w);
float3 l9_1000=mix(l9_996,l9_945.xyz,float3(l9_944.w));
l9_945=float4(l9_1000.x,l9_1000.y,l9_1000.z,l9_945.w);
l9_945.w=1.0;
float4 l9_1001=l9_945;
param_22=l9_1001;
}
else
{
float4 l9_1002=param_22;
float4 l9_1003=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1003=float4(mix(float3(1.0),l9_1002.xyz,float3(l9_1002.w)),l9_1002.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1004=l9_1002.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1004=fast::clamp(l9_1004,0.0,1.0);
}
l9_1003=float4(l9_1002.xyz*l9_1004,l9_1004);
}
else
{
l9_1003=l9_1002;
}
}
float4 l9_1005=l9_1003;
param_22=l9_1005;
}
}
}
float4 l9_1006=param_22;
FinalColor=l9_1006;
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
float4 l9_1007=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1007=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1007=float4(0.0);
}
float4 l9_1008=l9_1007;
float4 Cost=l9_1008;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor+=(FinalColor1*1e-06);
float4 param_23=FinalColor1;
out.FragColor1=param_23;
float3 param_24=in.varPos;
float4 param_25=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_24,param_25,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_26=FinalColor;
float4 l9_1009=param_26;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1009.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1009;
return out;
}
} // FRAGMENT SHADER
