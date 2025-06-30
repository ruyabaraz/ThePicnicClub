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
//sampler sampler intensityTextureSmpSC 0:17
//sampler sampler normTexSmpSC 0:18
//sampler sampler sc_ScreenTextureSmpSC 0:23
//texture texture2D intensityTexture 0:1:0:17
//texture texture2D normTex 0:2:0:18
//texture texture2D sc_ScreenTexture 0:14:0:23
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:26:4384 {
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
//float4 normTexSize 4128
//float3x3 normTexTransform 4176
//float4 normTexUvMinMax 4224
//float4 normTexBorderColor 4240
//float2 blurDirection 4256
//float Port_Input1_N047 4264
//float Port_Value2_N048 4268
//float Port_Item0_N009 4272
//float Port_Item1_N009 4276
//float Port_Item2_N009 4280
//float Port_Item3_N009 4284
//float Port_Item4_N009 4288
//float Port_Item5_N009 4292
//float Port_Item6_N009 4296
//float Port_Item7_N009 4300
//float Port_Item8_N009 4304
//float Port_Item9_N009 4308
//float Port_Item10_N009 4312
//float Port_Item11_N009 4316
//float Port_Item12_N009 4320
//float Port_Item13_N009 4324
//float Port_Input0_N187 4332
//float Port_Item0_N114 4336
//float Port_Item1_N114 4340
//float Port_Item2_N114 4344
//float Port_Item3_N114 4348
//float Port_Item4_N114 4352
//float Port_Item5_N114 4356
//float Port_Item6_N114 4360
//float Port_Item7_N114 4364
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_normTex 32 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 33 0
//spec_const bool SC_USE_UV_MIN_MAX_normTex 34 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 35 0
//spec_const bool SC_USE_UV_TRANSFORM_normTex 36 0
//spec_const bool UseViewSpaceDepthVariant 37 1
//spec_const bool intensityTextureHasSwappedViews 38 0
//spec_const bool normTexHasSwappedViews 39 0
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
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 73 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normTex 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normTex 76 -1
//spec_const int intensityTextureLayout 77 0
//spec_const int normTexLayout 78 0
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
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_normTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normTex) ? SC_USE_CLAMP_TO_BORDER_normTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_normTex [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_normTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normTex) ? SC_USE_UV_MIN_MAX_normTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(35)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_normTex [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_normTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normTex) ? SC_USE_UV_TRANSFORM_normTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(37)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(38)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool normTexHasSwappedViews [[function_constant(39)]];
constant bool normTexHasSwappedViews_tmp = is_function_constant_defined(normTexHasSwappedViews) ? normTexHasSwappedViews : false;
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
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(73)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normTex [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normTex) ? SC_SOFTWARE_WRAP_MODE_U_normTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normTex [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normTex) ? SC_SOFTWARE_WRAP_MODE_V_normTex : -1;
constant int intensityTextureLayout [[function_constant(77)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int normTexLayout [[function_constant(78)]];
constant int normTexLayout_tmp = is_function_constant_defined(normTexLayout) ? normTexLayout : 0;
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
float4 normTexSize;
float4 normTexDims;
float4 normTexView;
float3x3 normTexTransform;
float4 normTexUvMinMax;
float4 normTexBorderColor;
float2 blurDirection;
float Port_Input1_N047;
float Port_Value2_N048;
float Port_Item0_N009;
float Port_Item1_N009;
float Port_Item2_N009;
float Port_Item3_N009;
float Port_Item4_N009;
float Port_Item5_N009;
float Port_Item6_N009;
float Port_Item7_N009;
float Port_Item8_N009;
float Port_Item9_N009;
float Port_Item10_N009;
float Port_Item11_N009;
float Port_Item12_N009;
float Port_Item13_N009;
float Port_Import_N003;
float Port_Input0_N187;
float Port_Item0_N114;
float Port_Item1_N114;
float Port_Item2_N114;
float Port_Item3_N114;
float Port_Item4_N114;
float Port_Item5_N114;
float Port_Item6_N114;
float Port_Item7_N114;
float2 Port_Import_N005;
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
texture2d<float> normTex [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler normTexSmpSC [[id(18)]];
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
float2 gScreenCoord;
float Loop_Index_ID0;
float Loop_Ratio_ID0;
float Loop_Count_ID0;
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
float4 normTexSize;
float4 normTexDims;
float4 normTexView;
float3x3 normTexTransform;
float4 normTexUvMinMax;
float4 normTexBorderColor;
float2 blurDirection;
float Port_Input1_N047;
float Port_Value2_N048;
float Port_Item0_N009;
float Port_Item1_N009;
float Port_Item2_N009;
float Port_Item3_N009;
float Port_Item4_N009;
float Port_Item5_N009;
float Port_Item6_N009;
float Port_Item7_N009;
float Port_Item8_N009;
float Port_Item9_N009;
float Port_Item10_N009;
float Port_Item11_N009;
float Port_Item12_N009;
float Port_Item13_N009;
float Port_Import_N003;
float Port_Input0_N187;
float Port_Item0_N114;
float Port_Item1_N114;
float Port_Item2_N114;
float Port_Item3_N114;
float Port_Item4_N114;
float Port_Item5_N114;
float Port_Item6_N114;
float Port_Item7_N114;
float2 Port_Import_N005;
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
texture2d<float> normTex [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler normTexSmpSC [[id(18)]];
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
Globals.Loop_Index_ID0=0.0;
Globals.Loop_Ratio_ID0=0.0;
Globals.Loop_Count_ID0=0.0;
float2 ScreenCoord_N19=float2(0.0);
ScreenCoord_N19=Globals.gScreenCoord;
float4 Color_N46=float4(0.0);
int l9_14=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_15=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_15=0;
}
else
{
l9_15=in.varStereoViewID;
}
int l9_16=l9_15;
l9_14=1-l9_16;
}
else
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=in.varStereoViewID;
}
int l9_18=l9_17;
l9_14=l9_18;
}
int l9_19=l9_14;
int param=normTexLayout_tmp;
int param_1=l9_19;
float2 param_2=ScreenCoord_N19;
bool param_3=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 param_4=(*sc_set0.UserUniforms).normTexTransform;
int2 param_5=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool param_6=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 param_7=(*sc_set0.UserUniforms).normTexUvMinMax;
bool param_8=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 param_9=(*sc_set0.UserUniforms).normTexBorderColor;
float param_10=0.0;
bool l9_20=param_8&&(!param_6);
float l9_21=1.0;
float l9_22=param_2.x;
int l9_23=param_5.x;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
param_2.x=l9_22;
float l9_27=param_2.y;
int l9_28=param_5.y;
if (l9_28==1)
{
l9_27=fract(l9_27);
}
else
{
if (l9_28==2)
{
float l9_29=fract(l9_27);
float l9_30=l9_27-l9_29;
float l9_31=step(0.25,fract(l9_30*0.5));
l9_27=mix(l9_29,1.0-l9_29,fast::clamp(l9_31,0.0,1.0));
}
}
param_2.y=l9_27;
if (param_6)
{
bool l9_32=param_8;
bool l9_33;
if (l9_32)
{
l9_33=param_5.x==3;
}
else
{
l9_33=l9_32;
}
float l9_34=param_2.x;
float l9_35=param_7.x;
float l9_36=param_7.z;
bool l9_37=l9_33;
float l9_38=l9_21;
float l9_39=fast::clamp(l9_34,l9_35,l9_36);
float l9_40=step(abs(l9_34-l9_39),9.9999997e-06);
l9_38*=(l9_40+((1.0-float(l9_37))*(1.0-l9_40)));
l9_34=l9_39;
param_2.x=l9_34;
l9_21=l9_38;
bool l9_41=param_8;
bool l9_42;
if (l9_41)
{
l9_42=param_5.y==3;
}
else
{
l9_42=l9_41;
}
float l9_43=param_2.y;
float l9_44=param_7.y;
float l9_45=param_7.w;
bool l9_46=l9_42;
float l9_47=l9_21;
float l9_48=fast::clamp(l9_43,l9_44,l9_45);
float l9_49=step(abs(l9_43-l9_48),9.9999997e-06);
l9_47*=(l9_49+((1.0-float(l9_46))*(1.0-l9_49)));
l9_43=l9_48;
param_2.y=l9_43;
l9_21=l9_47;
}
float2 l9_50=param_2;
bool l9_51=param_3;
float3x3 l9_52=param_4;
if (l9_51)
{
l9_50=float2((l9_52*float3(l9_50,1.0)).xy);
}
float2 l9_53=l9_50;
float2 l9_54=l9_53;
float2 l9_55=l9_54;
param_2=l9_55;
float l9_56=param_2.x;
int l9_57=param_5.x;
bool l9_58=l9_20;
float l9_59=l9_21;
if ((l9_57==0)||(l9_57==3))
{
float l9_60=l9_56;
float l9_61=0.0;
float l9_62=1.0;
bool l9_63=l9_58;
float l9_64=l9_59;
float l9_65=fast::clamp(l9_60,l9_61,l9_62);
float l9_66=step(abs(l9_60-l9_65),9.9999997e-06);
l9_64*=(l9_66+((1.0-float(l9_63))*(1.0-l9_66)));
l9_60=l9_65;
l9_56=l9_60;
l9_59=l9_64;
}
param_2.x=l9_56;
l9_21=l9_59;
float l9_67=param_2.y;
int l9_68=param_5.y;
bool l9_69=l9_20;
float l9_70=l9_21;
if ((l9_68==0)||(l9_68==3))
{
float l9_71=l9_67;
float l9_72=0.0;
float l9_73=1.0;
bool l9_74=l9_69;
float l9_75=l9_70;
float l9_76=fast::clamp(l9_71,l9_72,l9_73);
float l9_77=step(abs(l9_71-l9_76),9.9999997e-06);
l9_75*=(l9_77+((1.0-float(l9_74))*(1.0-l9_77)));
l9_71=l9_76;
l9_67=l9_71;
l9_70=l9_75;
}
param_2.y=l9_67;
l9_21=l9_70;
float2 l9_78=param_2;
int l9_79=param;
int l9_80=param_1;
float l9_81=param_10;
float2 l9_82=l9_78;
int l9_83=l9_79;
int l9_84=l9_80;
float3 l9_85=float3(0.0);
if (l9_83==0)
{
l9_85=float3(l9_82,0.0);
}
else
{
if (l9_83==1)
{
l9_85=float3(l9_82.x,(l9_82.y*0.5)+(0.5-(float(l9_84)*0.5)),0.0);
}
else
{
l9_85=float3(l9_82,float(l9_84));
}
}
float3 l9_86=l9_85;
float3 l9_87=l9_86;
float2 l9_88=l9_87.xy;
float l9_89=l9_81;
float4 l9_90=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_88,bias(l9_89));
float4 l9_91=l9_90;
float4 l9_92=l9_91;
if (param_8)
{
l9_92=mix(param_9,l9_92,float4(l9_21));
}
float4 l9_93=l9_92;
Color_N46=l9_93;
float4 Output_N47=float4(0.0);
Output_N47=Color_N46*float4((*sc_set0.UserUniforms).Port_Input1_N047);
float4 Value_N48=float4(0.0);
Value_N48=float4(Output_N47.xyz.x,Output_N47.xyz.y,Output_N47.xyz.z,Value_N48.w);
Value_N48.w=(*sc_set0.UserUniforms).Port_Value2_N048;
float4 Output_N134=float4(0.0);
ssGlobals param_12=Globals;
float4 param_11=float4(0.0);
param_12.Loop_Count_ID0=8.0;
float4 l9_94=param_11;
ssGlobals l9_95=param_12;
float4 l9_96=float4(0.0);
l9_95.Loop_Index_ID0=0.0;
l9_95.Loop_Ratio_ID0=0.0;
float l9_97=0.0;
l9_97=l9_95.Loop_Index_ID0;
float l9_98=0.0;
float l9_99=l9_97;
float l9_100=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_101=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_102=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_103=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_104=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_105=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_106=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_107=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_108=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_109=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_110=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_111=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_112=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_113=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_114[14];
l9_114[0]=l9_100;
l9_114[1]=l9_101;
l9_114[2]=l9_102;
l9_114[3]=l9_103;
l9_114[4]=l9_104;
l9_114[5]=l9_105;
l9_114[6]=l9_106;
l9_114[7]=l9_107;
l9_114[8]=l9_108;
l9_114[9]=l9_109;
l9_114[10]=l9_110;
l9_114[11]=l9_111;
l9_114[12]=l9_112;
l9_114[13]=l9_113;
int l9_115=int(fast::clamp(l9_99+9.9999997e-05,0.0,13.0));
float l9_116=l9_114[l9_115];
l9_98=l9_116;
float l9_117=0.0;
l9_117=l9_98;
float l9_118=0.0;
l9_118=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_119=0.0;
l9_119=l9_117*l9_118;
float2 l9_120=float2(0.0);
float2 l9_121=(*sc_set0.UserUniforms).normTexSize.zw;
l9_120=l9_121;
float2 l9_122=float2(0.0);
l9_122=l9_95.gScreenCoord;
float2 l9_123=float2(0.0);
float2 l9_124=(*sc_set0.UserUniforms).blurDirection;
l9_123=l9_124;
float2 l9_125=float2(0.0);
l9_125=l9_123*l9_120;
float l9_126=0.0;
float l9_127=l9_97;
float l9_128=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_129=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_130=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_131=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_132=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_133=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_134=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_135=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_136[8];
l9_136[0]=l9_128;
l9_136[1]=l9_129;
l9_136[2]=l9_130;
l9_136[3]=l9_131;
l9_136[4]=l9_132;
l9_136[5]=l9_133;
l9_136[6]=l9_134;
l9_136[7]=l9_135;
int l9_137=int(fast::clamp(l9_127+9.9999997e-05,0.0,7.0));
float l9_138=l9_136[l9_137];
l9_126=l9_138;
float2 l9_139=float2(0.0);
l9_139=l9_125*float2(l9_126);
float2 l9_140=float2(0.0);
l9_140=l9_122+l9_139;
float2 l9_141=float2(0.0);
l9_141=l9_140;
float4 l9_142=float4(0.0);
int l9_143=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_144=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=in.varStereoViewID;
}
int l9_145=l9_144;
l9_143=1-l9_145;
}
else
{
int l9_146=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=in.varStereoViewID;
}
int l9_147=l9_146;
l9_143=l9_147;
}
int l9_148=l9_143;
int l9_149=normTexLayout_tmp;
int l9_150=l9_148;
float2 l9_151=l9_141;
bool l9_152=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_153=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_154=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_155=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_156=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_157=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_158=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_159=0.0;
bool l9_160=l9_157&&(!l9_155);
float l9_161=1.0;
float l9_162=l9_151.x;
int l9_163=l9_154.x;
if (l9_163==1)
{
l9_162=fract(l9_162);
}
else
{
if (l9_163==2)
{
float l9_164=fract(l9_162);
float l9_165=l9_162-l9_164;
float l9_166=step(0.25,fract(l9_165*0.5));
l9_162=mix(l9_164,1.0-l9_164,fast::clamp(l9_166,0.0,1.0));
}
}
l9_151.x=l9_162;
float l9_167=l9_151.y;
int l9_168=l9_154.y;
if (l9_168==1)
{
l9_167=fract(l9_167);
}
else
{
if (l9_168==2)
{
float l9_169=fract(l9_167);
float l9_170=l9_167-l9_169;
float l9_171=step(0.25,fract(l9_170*0.5));
l9_167=mix(l9_169,1.0-l9_169,fast::clamp(l9_171,0.0,1.0));
}
}
l9_151.y=l9_167;
if (l9_155)
{
bool l9_172=l9_157;
bool l9_173;
if (l9_172)
{
l9_173=l9_154.x==3;
}
else
{
l9_173=l9_172;
}
float l9_174=l9_151.x;
float l9_175=l9_156.x;
float l9_176=l9_156.z;
bool l9_177=l9_173;
float l9_178=l9_161;
float l9_179=fast::clamp(l9_174,l9_175,l9_176);
float l9_180=step(abs(l9_174-l9_179),9.9999997e-06);
l9_178*=(l9_180+((1.0-float(l9_177))*(1.0-l9_180)));
l9_174=l9_179;
l9_151.x=l9_174;
l9_161=l9_178;
bool l9_181=l9_157;
bool l9_182;
if (l9_181)
{
l9_182=l9_154.y==3;
}
else
{
l9_182=l9_181;
}
float l9_183=l9_151.y;
float l9_184=l9_156.y;
float l9_185=l9_156.w;
bool l9_186=l9_182;
float l9_187=l9_161;
float l9_188=fast::clamp(l9_183,l9_184,l9_185);
float l9_189=step(abs(l9_183-l9_188),9.9999997e-06);
l9_187*=(l9_189+((1.0-float(l9_186))*(1.0-l9_189)));
l9_183=l9_188;
l9_151.y=l9_183;
l9_161=l9_187;
}
float2 l9_190=l9_151;
bool l9_191=l9_152;
float3x3 l9_192=l9_153;
if (l9_191)
{
l9_190=float2((l9_192*float3(l9_190,1.0)).xy);
}
float2 l9_193=l9_190;
float2 l9_194=l9_193;
float2 l9_195=l9_194;
l9_151=l9_195;
float l9_196=l9_151.x;
int l9_197=l9_154.x;
bool l9_198=l9_160;
float l9_199=l9_161;
if ((l9_197==0)||(l9_197==3))
{
float l9_200=l9_196;
float l9_201=0.0;
float l9_202=1.0;
bool l9_203=l9_198;
float l9_204=l9_199;
float l9_205=fast::clamp(l9_200,l9_201,l9_202);
float l9_206=step(abs(l9_200-l9_205),9.9999997e-06);
l9_204*=(l9_206+((1.0-float(l9_203))*(1.0-l9_206)));
l9_200=l9_205;
l9_196=l9_200;
l9_199=l9_204;
}
l9_151.x=l9_196;
l9_161=l9_199;
float l9_207=l9_151.y;
int l9_208=l9_154.y;
bool l9_209=l9_160;
float l9_210=l9_161;
if ((l9_208==0)||(l9_208==3))
{
float l9_211=l9_207;
float l9_212=0.0;
float l9_213=1.0;
bool l9_214=l9_209;
float l9_215=l9_210;
float l9_216=fast::clamp(l9_211,l9_212,l9_213);
float l9_217=step(abs(l9_211-l9_216),9.9999997e-06);
l9_215*=(l9_217+((1.0-float(l9_214))*(1.0-l9_217)));
l9_211=l9_216;
l9_207=l9_211;
l9_210=l9_215;
}
l9_151.y=l9_207;
l9_161=l9_210;
float2 l9_218=l9_151;
int l9_219=l9_149;
int l9_220=l9_150;
float l9_221=l9_159;
float2 l9_222=l9_218;
int l9_223=l9_219;
int l9_224=l9_220;
float3 l9_225=float3(0.0);
if (l9_223==0)
{
l9_225=float3(l9_222,0.0);
}
else
{
if (l9_223==1)
{
l9_225=float3(l9_222.x,(l9_222.y*0.5)+(0.5-(float(l9_224)*0.5)),0.0);
}
else
{
l9_225=float3(l9_222,float(l9_224));
}
}
float3 l9_226=l9_225;
float3 l9_227=l9_226;
float2 l9_228=l9_227.xy;
float l9_229=l9_221;
float4 l9_230=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_228,bias(l9_229));
float4 l9_231=l9_230;
float4 l9_232=l9_231;
if (l9_157)
{
l9_232=mix(l9_158,l9_232,float4(l9_161));
}
float4 l9_233=l9_232;
l9_142=l9_233;
float4 l9_234=float4(0.0);
l9_234=float4(l9_119)*l9_142;
float4 l9_235=float4(0.0);
l9_235=float4(l9_234.xyz.x,l9_234.xyz.y,l9_234.xyz.z,l9_235.w);
l9_235.w=l9_119;
float4 l9_236=float4(0.0);
l9_236=l9_235;
l9_96=l9_236;
l9_94+=l9_96;
param_11=l9_94;
float4 l9_237=param_11;
ssGlobals l9_238=param_12;
float4 l9_239=float4(0.0);
l9_238.Loop_Index_ID0=1.0;
l9_238.Loop_Ratio_ID0=0.142857;
float l9_240=0.0;
l9_240=l9_238.Loop_Index_ID0;
float l9_241=0.0;
float l9_242=l9_240;
float l9_243=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_244=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_245=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_246=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_247=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_248=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_249=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_250=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_251=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_252=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_253=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_254=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_255=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_256=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_257[14];
l9_257[0]=l9_243;
l9_257[1]=l9_244;
l9_257[2]=l9_245;
l9_257[3]=l9_246;
l9_257[4]=l9_247;
l9_257[5]=l9_248;
l9_257[6]=l9_249;
l9_257[7]=l9_250;
l9_257[8]=l9_251;
l9_257[9]=l9_252;
l9_257[10]=l9_253;
l9_257[11]=l9_254;
l9_257[12]=l9_255;
l9_257[13]=l9_256;
int l9_258=int(fast::clamp(l9_242+9.9999997e-05,0.0,13.0));
float l9_259=l9_257[l9_258];
l9_241=l9_259;
float l9_260=0.0;
l9_260=l9_241;
float l9_261=0.0;
l9_261=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_262=0.0;
l9_262=l9_260*l9_261;
float2 l9_263=float2(0.0);
float2 l9_264=(*sc_set0.UserUniforms).normTexSize.zw;
l9_263=l9_264;
float2 l9_265=float2(0.0);
l9_265=l9_238.gScreenCoord;
float2 l9_266=float2(0.0);
float2 l9_267=(*sc_set0.UserUniforms).blurDirection;
l9_266=l9_267;
float2 l9_268=float2(0.0);
l9_268=l9_266*l9_263;
float l9_269=0.0;
float l9_270=l9_240;
float l9_271=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_272=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_273=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_274=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_275=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_276=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_277=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_278=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_279[8];
l9_279[0]=l9_271;
l9_279[1]=l9_272;
l9_279[2]=l9_273;
l9_279[3]=l9_274;
l9_279[4]=l9_275;
l9_279[5]=l9_276;
l9_279[6]=l9_277;
l9_279[7]=l9_278;
int l9_280=int(fast::clamp(l9_270+9.9999997e-05,0.0,7.0));
float l9_281=l9_279[l9_280];
l9_269=l9_281;
float2 l9_282=float2(0.0);
l9_282=l9_268*float2(l9_269);
float2 l9_283=float2(0.0);
l9_283=l9_265+l9_282;
float2 l9_284=float2(0.0);
l9_284=l9_283;
float4 l9_285=float4(0.0);
int l9_286=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_287=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_287=0;
}
else
{
l9_287=in.varStereoViewID;
}
int l9_288=l9_287;
l9_286=1-l9_288;
}
else
{
int l9_289=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_289=0;
}
else
{
l9_289=in.varStereoViewID;
}
int l9_290=l9_289;
l9_286=l9_290;
}
int l9_291=l9_286;
int l9_292=normTexLayout_tmp;
int l9_293=l9_291;
float2 l9_294=l9_284;
bool l9_295=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_296=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_297=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_298=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_299=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_300=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_301=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_302=0.0;
bool l9_303=l9_300&&(!l9_298);
float l9_304=1.0;
float l9_305=l9_294.x;
int l9_306=l9_297.x;
if (l9_306==1)
{
l9_305=fract(l9_305);
}
else
{
if (l9_306==2)
{
float l9_307=fract(l9_305);
float l9_308=l9_305-l9_307;
float l9_309=step(0.25,fract(l9_308*0.5));
l9_305=mix(l9_307,1.0-l9_307,fast::clamp(l9_309,0.0,1.0));
}
}
l9_294.x=l9_305;
float l9_310=l9_294.y;
int l9_311=l9_297.y;
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
l9_294.y=l9_310;
if (l9_298)
{
bool l9_315=l9_300;
bool l9_316;
if (l9_315)
{
l9_316=l9_297.x==3;
}
else
{
l9_316=l9_315;
}
float l9_317=l9_294.x;
float l9_318=l9_299.x;
float l9_319=l9_299.z;
bool l9_320=l9_316;
float l9_321=l9_304;
float l9_322=fast::clamp(l9_317,l9_318,l9_319);
float l9_323=step(abs(l9_317-l9_322),9.9999997e-06);
l9_321*=(l9_323+((1.0-float(l9_320))*(1.0-l9_323)));
l9_317=l9_322;
l9_294.x=l9_317;
l9_304=l9_321;
bool l9_324=l9_300;
bool l9_325;
if (l9_324)
{
l9_325=l9_297.y==3;
}
else
{
l9_325=l9_324;
}
float l9_326=l9_294.y;
float l9_327=l9_299.y;
float l9_328=l9_299.w;
bool l9_329=l9_325;
float l9_330=l9_304;
float l9_331=fast::clamp(l9_326,l9_327,l9_328);
float l9_332=step(abs(l9_326-l9_331),9.9999997e-06);
l9_330*=(l9_332+((1.0-float(l9_329))*(1.0-l9_332)));
l9_326=l9_331;
l9_294.y=l9_326;
l9_304=l9_330;
}
float2 l9_333=l9_294;
bool l9_334=l9_295;
float3x3 l9_335=l9_296;
if (l9_334)
{
l9_333=float2((l9_335*float3(l9_333,1.0)).xy);
}
float2 l9_336=l9_333;
float2 l9_337=l9_336;
float2 l9_338=l9_337;
l9_294=l9_338;
float l9_339=l9_294.x;
int l9_340=l9_297.x;
bool l9_341=l9_303;
float l9_342=l9_304;
if ((l9_340==0)||(l9_340==3))
{
float l9_343=l9_339;
float l9_344=0.0;
float l9_345=1.0;
bool l9_346=l9_341;
float l9_347=l9_342;
float l9_348=fast::clamp(l9_343,l9_344,l9_345);
float l9_349=step(abs(l9_343-l9_348),9.9999997e-06);
l9_347*=(l9_349+((1.0-float(l9_346))*(1.0-l9_349)));
l9_343=l9_348;
l9_339=l9_343;
l9_342=l9_347;
}
l9_294.x=l9_339;
l9_304=l9_342;
float l9_350=l9_294.y;
int l9_351=l9_297.y;
bool l9_352=l9_303;
float l9_353=l9_304;
if ((l9_351==0)||(l9_351==3))
{
float l9_354=l9_350;
float l9_355=0.0;
float l9_356=1.0;
bool l9_357=l9_352;
float l9_358=l9_353;
float l9_359=fast::clamp(l9_354,l9_355,l9_356);
float l9_360=step(abs(l9_354-l9_359),9.9999997e-06);
l9_358*=(l9_360+((1.0-float(l9_357))*(1.0-l9_360)));
l9_354=l9_359;
l9_350=l9_354;
l9_353=l9_358;
}
l9_294.y=l9_350;
l9_304=l9_353;
float2 l9_361=l9_294;
int l9_362=l9_292;
int l9_363=l9_293;
float l9_364=l9_302;
float2 l9_365=l9_361;
int l9_366=l9_362;
int l9_367=l9_363;
float3 l9_368=float3(0.0);
if (l9_366==0)
{
l9_368=float3(l9_365,0.0);
}
else
{
if (l9_366==1)
{
l9_368=float3(l9_365.x,(l9_365.y*0.5)+(0.5-(float(l9_367)*0.5)),0.0);
}
else
{
l9_368=float3(l9_365,float(l9_367));
}
}
float3 l9_369=l9_368;
float3 l9_370=l9_369;
float2 l9_371=l9_370.xy;
float l9_372=l9_364;
float4 l9_373=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_371,bias(l9_372));
float4 l9_374=l9_373;
float4 l9_375=l9_374;
if (l9_300)
{
l9_375=mix(l9_301,l9_375,float4(l9_304));
}
float4 l9_376=l9_375;
l9_285=l9_376;
float4 l9_377=float4(0.0);
l9_377=float4(l9_262)*l9_285;
float4 l9_378=float4(0.0);
l9_378=float4(l9_377.xyz.x,l9_377.xyz.y,l9_377.xyz.z,l9_378.w);
l9_378.w=l9_262;
float4 l9_379=float4(0.0);
l9_379=l9_378;
l9_239=l9_379;
l9_237+=l9_239;
param_11=l9_237;
float4 l9_380=param_11;
ssGlobals l9_381=param_12;
float4 l9_382=float4(0.0);
l9_381.Loop_Index_ID0=2.0;
l9_381.Loop_Ratio_ID0=0.285714;
float l9_383=0.0;
l9_383=l9_381.Loop_Index_ID0;
float l9_384=0.0;
float l9_385=l9_383;
float l9_386=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_387=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_388=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_389=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_390=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_391=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_392=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_393=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_394=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_395=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_396=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_397=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_398=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_399=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_400[14];
l9_400[0]=l9_386;
l9_400[1]=l9_387;
l9_400[2]=l9_388;
l9_400[3]=l9_389;
l9_400[4]=l9_390;
l9_400[5]=l9_391;
l9_400[6]=l9_392;
l9_400[7]=l9_393;
l9_400[8]=l9_394;
l9_400[9]=l9_395;
l9_400[10]=l9_396;
l9_400[11]=l9_397;
l9_400[12]=l9_398;
l9_400[13]=l9_399;
int l9_401=int(fast::clamp(l9_385+9.9999997e-05,0.0,13.0));
float l9_402=l9_400[l9_401];
l9_384=l9_402;
float l9_403=0.0;
l9_403=l9_384;
float l9_404=0.0;
l9_404=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_405=0.0;
l9_405=l9_403*l9_404;
float2 l9_406=float2(0.0);
float2 l9_407=(*sc_set0.UserUniforms).normTexSize.zw;
l9_406=l9_407;
float2 l9_408=float2(0.0);
l9_408=l9_381.gScreenCoord;
float2 l9_409=float2(0.0);
float2 l9_410=(*sc_set0.UserUniforms).blurDirection;
l9_409=l9_410;
float2 l9_411=float2(0.0);
l9_411=l9_409*l9_406;
float l9_412=0.0;
float l9_413=l9_383;
float l9_414=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_415=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_416=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_417=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_418=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_419=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_420=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_421=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_422[8];
l9_422[0]=l9_414;
l9_422[1]=l9_415;
l9_422[2]=l9_416;
l9_422[3]=l9_417;
l9_422[4]=l9_418;
l9_422[5]=l9_419;
l9_422[6]=l9_420;
l9_422[7]=l9_421;
int l9_423=int(fast::clamp(l9_413+9.9999997e-05,0.0,7.0));
float l9_424=l9_422[l9_423];
l9_412=l9_424;
float2 l9_425=float2(0.0);
l9_425=l9_411*float2(l9_412);
float2 l9_426=float2(0.0);
l9_426=l9_408+l9_425;
float2 l9_427=float2(0.0);
l9_427=l9_426;
float4 l9_428=float4(0.0);
int l9_429=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_430=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_430=0;
}
else
{
l9_430=in.varStereoViewID;
}
int l9_431=l9_430;
l9_429=1-l9_431;
}
else
{
int l9_432=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_432=0;
}
else
{
l9_432=in.varStereoViewID;
}
int l9_433=l9_432;
l9_429=l9_433;
}
int l9_434=l9_429;
int l9_435=normTexLayout_tmp;
int l9_436=l9_434;
float2 l9_437=l9_427;
bool l9_438=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_439=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_440=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_441=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_442=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_443=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_444=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_445=0.0;
bool l9_446=l9_443&&(!l9_441);
float l9_447=1.0;
float l9_448=l9_437.x;
int l9_449=l9_440.x;
if (l9_449==1)
{
l9_448=fract(l9_448);
}
else
{
if (l9_449==2)
{
float l9_450=fract(l9_448);
float l9_451=l9_448-l9_450;
float l9_452=step(0.25,fract(l9_451*0.5));
l9_448=mix(l9_450,1.0-l9_450,fast::clamp(l9_452,0.0,1.0));
}
}
l9_437.x=l9_448;
float l9_453=l9_437.y;
int l9_454=l9_440.y;
if (l9_454==1)
{
l9_453=fract(l9_453);
}
else
{
if (l9_454==2)
{
float l9_455=fract(l9_453);
float l9_456=l9_453-l9_455;
float l9_457=step(0.25,fract(l9_456*0.5));
l9_453=mix(l9_455,1.0-l9_455,fast::clamp(l9_457,0.0,1.0));
}
}
l9_437.y=l9_453;
if (l9_441)
{
bool l9_458=l9_443;
bool l9_459;
if (l9_458)
{
l9_459=l9_440.x==3;
}
else
{
l9_459=l9_458;
}
float l9_460=l9_437.x;
float l9_461=l9_442.x;
float l9_462=l9_442.z;
bool l9_463=l9_459;
float l9_464=l9_447;
float l9_465=fast::clamp(l9_460,l9_461,l9_462);
float l9_466=step(abs(l9_460-l9_465),9.9999997e-06);
l9_464*=(l9_466+((1.0-float(l9_463))*(1.0-l9_466)));
l9_460=l9_465;
l9_437.x=l9_460;
l9_447=l9_464;
bool l9_467=l9_443;
bool l9_468;
if (l9_467)
{
l9_468=l9_440.y==3;
}
else
{
l9_468=l9_467;
}
float l9_469=l9_437.y;
float l9_470=l9_442.y;
float l9_471=l9_442.w;
bool l9_472=l9_468;
float l9_473=l9_447;
float l9_474=fast::clamp(l9_469,l9_470,l9_471);
float l9_475=step(abs(l9_469-l9_474),9.9999997e-06);
l9_473*=(l9_475+((1.0-float(l9_472))*(1.0-l9_475)));
l9_469=l9_474;
l9_437.y=l9_469;
l9_447=l9_473;
}
float2 l9_476=l9_437;
bool l9_477=l9_438;
float3x3 l9_478=l9_439;
if (l9_477)
{
l9_476=float2((l9_478*float3(l9_476,1.0)).xy);
}
float2 l9_479=l9_476;
float2 l9_480=l9_479;
float2 l9_481=l9_480;
l9_437=l9_481;
float l9_482=l9_437.x;
int l9_483=l9_440.x;
bool l9_484=l9_446;
float l9_485=l9_447;
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
l9_437.x=l9_482;
l9_447=l9_485;
float l9_493=l9_437.y;
int l9_494=l9_440.y;
bool l9_495=l9_446;
float l9_496=l9_447;
if ((l9_494==0)||(l9_494==3))
{
float l9_497=l9_493;
float l9_498=0.0;
float l9_499=1.0;
bool l9_500=l9_495;
float l9_501=l9_496;
float l9_502=fast::clamp(l9_497,l9_498,l9_499);
float l9_503=step(abs(l9_497-l9_502),9.9999997e-06);
l9_501*=(l9_503+((1.0-float(l9_500))*(1.0-l9_503)));
l9_497=l9_502;
l9_493=l9_497;
l9_496=l9_501;
}
l9_437.y=l9_493;
l9_447=l9_496;
float2 l9_504=l9_437;
int l9_505=l9_435;
int l9_506=l9_436;
float l9_507=l9_445;
float2 l9_508=l9_504;
int l9_509=l9_505;
int l9_510=l9_506;
float3 l9_511=float3(0.0);
if (l9_509==0)
{
l9_511=float3(l9_508,0.0);
}
else
{
if (l9_509==1)
{
l9_511=float3(l9_508.x,(l9_508.y*0.5)+(0.5-(float(l9_510)*0.5)),0.0);
}
else
{
l9_511=float3(l9_508,float(l9_510));
}
}
float3 l9_512=l9_511;
float3 l9_513=l9_512;
float2 l9_514=l9_513.xy;
float l9_515=l9_507;
float4 l9_516=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_514,bias(l9_515));
float4 l9_517=l9_516;
float4 l9_518=l9_517;
if (l9_443)
{
l9_518=mix(l9_444,l9_518,float4(l9_447));
}
float4 l9_519=l9_518;
l9_428=l9_519;
float4 l9_520=float4(0.0);
l9_520=float4(l9_405)*l9_428;
float4 l9_521=float4(0.0);
l9_521=float4(l9_520.xyz.x,l9_520.xyz.y,l9_520.xyz.z,l9_521.w);
l9_521.w=l9_405;
float4 l9_522=float4(0.0);
l9_522=l9_521;
l9_382=l9_522;
l9_380+=l9_382;
param_11=l9_380;
float4 l9_523=param_11;
ssGlobals l9_524=param_12;
float4 l9_525=float4(0.0);
l9_524.Loop_Index_ID0=3.0;
l9_524.Loop_Ratio_ID0=0.42857099;
float l9_526=0.0;
l9_526=l9_524.Loop_Index_ID0;
float l9_527=0.0;
float l9_528=l9_526;
float l9_529=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_530=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_531=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_532=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_533=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_534=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_535=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_536=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_537=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_538=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_539=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_540=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_541=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_542=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_543[14];
l9_543[0]=l9_529;
l9_543[1]=l9_530;
l9_543[2]=l9_531;
l9_543[3]=l9_532;
l9_543[4]=l9_533;
l9_543[5]=l9_534;
l9_543[6]=l9_535;
l9_543[7]=l9_536;
l9_543[8]=l9_537;
l9_543[9]=l9_538;
l9_543[10]=l9_539;
l9_543[11]=l9_540;
l9_543[12]=l9_541;
l9_543[13]=l9_542;
int l9_544=int(fast::clamp(l9_528+9.9999997e-05,0.0,13.0));
float l9_545=l9_543[l9_544];
l9_527=l9_545;
float l9_546=0.0;
l9_546=l9_527;
float l9_547=0.0;
l9_547=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_548=0.0;
l9_548=l9_546*l9_547;
float2 l9_549=float2(0.0);
float2 l9_550=(*sc_set0.UserUniforms).normTexSize.zw;
l9_549=l9_550;
float2 l9_551=float2(0.0);
l9_551=l9_524.gScreenCoord;
float2 l9_552=float2(0.0);
float2 l9_553=(*sc_set0.UserUniforms).blurDirection;
l9_552=l9_553;
float2 l9_554=float2(0.0);
l9_554=l9_552*l9_549;
float l9_555=0.0;
float l9_556=l9_526;
float l9_557=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_558=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_559=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_560=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_561=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_562=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_563=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_564=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_565[8];
l9_565[0]=l9_557;
l9_565[1]=l9_558;
l9_565[2]=l9_559;
l9_565[3]=l9_560;
l9_565[4]=l9_561;
l9_565[5]=l9_562;
l9_565[6]=l9_563;
l9_565[7]=l9_564;
int l9_566=int(fast::clamp(l9_556+9.9999997e-05,0.0,7.0));
float l9_567=l9_565[l9_566];
l9_555=l9_567;
float2 l9_568=float2(0.0);
l9_568=l9_554*float2(l9_555);
float2 l9_569=float2(0.0);
l9_569=l9_551+l9_568;
float2 l9_570=float2(0.0);
l9_570=l9_569;
float4 l9_571=float4(0.0);
int l9_572=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_573=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_573=0;
}
else
{
l9_573=in.varStereoViewID;
}
int l9_574=l9_573;
l9_572=1-l9_574;
}
else
{
int l9_575=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_575=0;
}
else
{
l9_575=in.varStereoViewID;
}
int l9_576=l9_575;
l9_572=l9_576;
}
int l9_577=l9_572;
int l9_578=normTexLayout_tmp;
int l9_579=l9_577;
float2 l9_580=l9_570;
bool l9_581=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_582=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_583=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_584=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_585=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_586=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_587=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_588=0.0;
bool l9_589=l9_586&&(!l9_584);
float l9_590=1.0;
float l9_591=l9_580.x;
int l9_592=l9_583.x;
if (l9_592==1)
{
l9_591=fract(l9_591);
}
else
{
if (l9_592==2)
{
float l9_593=fract(l9_591);
float l9_594=l9_591-l9_593;
float l9_595=step(0.25,fract(l9_594*0.5));
l9_591=mix(l9_593,1.0-l9_593,fast::clamp(l9_595,0.0,1.0));
}
}
l9_580.x=l9_591;
float l9_596=l9_580.y;
int l9_597=l9_583.y;
if (l9_597==1)
{
l9_596=fract(l9_596);
}
else
{
if (l9_597==2)
{
float l9_598=fract(l9_596);
float l9_599=l9_596-l9_598;
float l9_600=step(0.25,fract(l9_599*0.5));
l9_596=mix(l9_598,1.0-l9_598,fast::clamp(l9_600,0.0,1.0));
}
}
l9_580.y=l9_596;
if (l9_584)
{
bool l9_601=l9_586;
bool l9_602;
if (l9_601)
{
l9_602=l9_583.x==3;
}
else
{
l9_602=l9_601;
}
float l9_603=l9_580.x;
float l9_604=l9_585.x;
float l9_605=l9_585.z;
bool l9_606=l9_602;
float l9_607=l9_590;
float l9_608=fast::clamp(l9_603,l9_604,l9_605);
float l9_609=step(abs(l9_603-l9_608),9.9999997e-06);
l9_607*=(l9_609+((1.0-float(l9_606))*(1.0-l9_609)));
l9_603=l9_608;
l9_580.x=l9_603;
l9_590=l9_607;
bool l9_610=l9_586;
bool l9_611;
if (l9_610)
{
l9_611=l9_583.y==3;
}
else
{
l9_611=l9_610;
}
float l9_612=l9_580.y;
float l9_613=l9_585.y;
float l9_614=l9_585.w;
bool l9_615=l9_611;
float l9_616=l9_590;
float l9_617=fast::clamp(l9_612,l9_613,l9_614);
float l9_618=step(abs(l9_612-l9_617),9.9999997e-06);
l9_616*=(l9_618+((1.0-float(l9_615))*(1.0-l9_618)));
l9_612=l9_617;
l9_580.y=l9_612;
l9_590=l9_616;
}
float2 l9_619=l9_580;
bool l9_620=l9_581;
float3x3 l9_621=l9_582;
if (l9_620)
{
l9_619=float2((l9_621*float3(l9_619,1.0)).xy);
}
float2 l9_622=l9_619;
float2 l9_623=l9_622;
float2 l9_624=l9_623;
l9_580=l9_624;
float l9_625=l9_580.x;
int l9_626=l9_583.x;
bool l9_627=l9_589;
float l9_628=l9_590;
if ((l9_626==0)||(l9_626==3))
{
float l9_629=l9_625;
float l9_630=0.0;
float l9_631=1.0;
bool l9_632=l9_627;
float l9_633=l9_628;
float l9_634=fast::clamp(l9_629,l9_630,l9_631);
float l9_635=step(abs(l9_629-l9_634),9.9999997e-06);
l9_633*=(l9_635+((1.0-float(l9_632))*(1.0-l9_635)));
l9_629=l9_634;
l9_625=l9_629;
l9_628=l9_633;
}
l9_580.x=l9_625;
l9_590=l9_628;
float l9_636=l9_580.y;
int l9_637=l9_583.y;
bool l9_638=l9_589;
float l9_639=l9_590;
if ((l9_637==0)||(l9_637==3))
{
float l9_640=l9_636;
float l9_641=0.0;
float l9_642=1.0;
bool l9_643=l9_638;
float l9_644=l9_639;
float l9_645=fast::clamp(l9_640,l9_641,l9_642);
float l9_646=step(abs(l9_640-l9_645),9.9999997e-06);
l9_644*=(l9_646+((1.0-float(l9_643))*(1.0-l9_646)));
l9_640=l9_645;
l9_636=l9_640;
l9_639=l9_644;
}
l9_580.y=l9_636;
l9_590=l9_639;
float2 l9_647=l9_580;
int l9_648=l9_578;
int l9_649=l9_579;
float l9_650=l9_588;
float2 l9_651=l9_647;
int l9_652=l9_648;
int l9_653=l9_649;
float3 l9_654=float3(0.0);
if (l9_652==0)
{
l9_654=float3(l9_651,0.0);
}
else
{
if (l9_652==1)
{
l9_654=float3(l9_651.x,(l9_651.y*0.5)+(0.5-(float(l9_653)*0.5)),0.0);
}
else
{
l9_654=float3(l9_651,float(l9_653));
}
}
float3 l9_655=l9_654;
float3 l9_656=l9_655;
float2 l9_657=l9_656.xy;
float l9_658=l9_650;
float4 l9_659=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_657,bias(l9_658));
float4 l9_660=l9_659;
float4 l9_661=l9_660;
if (l9_586)
{
l9_661=mix(l9_587,l9_661,float4(l9_590));
}
float4 l9_662=l9_661;
l9_571=l9_662;
float4 l9_663=float4(0.0);
l9_663=float4(l9_548)*l9_571;
float4 l9_664=float4(0.0);
l9_664=float4(l9_663.xyz.x,l9_663.xyz.y,l9_663.xyz.z,l9_664.w);
l9_664.w=l9_548;
float4 l9_665=float4(0.0);
l9_665=l9_664;
l9_525=l9_665;
l9_523+=l9_525;
param_11=l9_523;
float4 l9_666=param_11;
ssGlobals l9_667=param_12;
float4 l9_668=float4(0.0);
l9_667.Loop_Index_ID0=4.0;
l9_667.Loop_Ratio_ID0=0.57142901;
float l9_669=0.0;
l9_669=l9_667.Loop_Index_ID0;
float l9_670=0.0;
float l9_671=l9_669;
float l9_672=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_673=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_674=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_675=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_676=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_677=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_678=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_679=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_680=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_681=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_682=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_683=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_684=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_685=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_686[14];
l9_686[0]=l9_672;
l9_686[1]=l9_673;
l9_686[2]=l9_674;
l9_686[3]=l9_675;
l9_686[4]=l9_676;
l9_686[5]=l9_677;
l9_686[6]=l9_678;
l9_686[7]=l9_679;
l9_686[8]=l9_680;
l9_686[9]=l9_681;
l9_686[10]=l9_682;
l9_686[11]=l9_683;
l9_686[12]=l9_684;
l9_686[13]=l9_685;
int l9_687=int(fast::clamp(l9_671+9.9999997e-05,0.0,13.0));
float l9_688=l9_686[l9_687];
l9_670=l9_688;
float l9_689=0.0;
l9_689=l9_670;
float l9_690=0.0;
l9_690=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_691=0.0;
l9_691=l9_689*l9_690;
float2 l9_692=float2(0.0);
float2 l9_693=(*sc_set0.UserUniforms).normTexSize.zw;
l9_692=l9_693;
float2 l9_694=float2(0.0);
l9_694=l9_667.gScreenCoord;
float2 l9_695=float2(0.0);
float2 l9_696=(*sc_set0.UserUniforms).blurDirection;
l9_695=l9_696;
float2 l9_697=float2(0.0);
l9_697=l9_695*l9_692;
float l9_698=0.0;
float l9_699=l9_669;
float l9_700=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_701=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_702=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_703=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_704=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_705=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_706=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_707=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_708[8];
l9_708[0]=l9_700;
l9_708[1]=l9_701;
l9_708[2]=l9_702;
l9_708[3]=l9_703;
l9_708[4]=l9_704;
l9_708[5]=l9_705;
l9_708[6]=l9_706;
l9_708[7]=l9_707;
int l9_709=int(fast::clamp(l9_699+9.9999997e-05,0.0,7.0));
float l9_710=l9_708[l9_709];
l9_698=l9_710;
float2 l9_711=float2(0.0);
l9_711=l9_697*float2(l9_698);
float2 l9_712=float2(0.0);
l9_712=l9_694+l9_711;
float2 l9_713=float2(0.0);
l9_713=l9_712;
float4 l9_714=float4(0.0);
int l9_715=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_716=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_716=0;
}
else
{
l9_716=in.varStereoViewID;
}
int l9_717=l9_716;
l9_715=1-l9_717;
}
else
{
int l9_718=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_718=0;
}
else
{
l9_718=in.varStereoViewID;
}
int l9_719=l9_718;
l9_715=l9_719;
}
int l9_720=l9_715;
int l9_721=normTexLayout_tmp;
int l9_722=l9_720;
float2 l9_723=l9_713;
bool l9_724=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_725=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_726=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_727=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_728=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_729=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_730=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_731=0.0;
bool l9_732=l9_729&&(!l9_727);
float l9_733=1.0;
float l9_734=l9_723.x;
int l9_735=l9_726.x;
if (l9_735==1)
{
l9_734=fract(l9_734);
}
else
{
if (l9_735==2)
{
float l9_736=fract(l9_734);
float l9_737=l9_734-l9_736;
float l9_738=step(0.25,fract(l9_737*0.5));
l9_734=mix(l9_736,1.0-l9_736,fast::clamp(l9_738,0.0,1.0));
}
}
l9_723.x=l9_734;
float l9_739=l9_723.y;
int l9_740=l9_726.y;
if (l9_740==1)
{
l9_739=fract(l9_739);
}
else
{
if (l9_740==2)
{
float l9_741=fract(l9_739);
float l9_742=l9_739-l9_741;
float l9_743=step(0.25,fract(l9_742*0.5));
l9_739=mix(l9_741,1.0-l9_741,fast::clamp(l9_743,0.0,1.0));
}
}
l9_723.y=l9_739;
if (l9_727)
{
bool l9_744=l9_729;
bool l9_745;
if (l9_744)
{
l9_745=l9_726.x==3;
}
else
{
l9_745=l9_744;
}
float l9_746=l9_723.x;
float l9_747=l9_728.x;
float l9_748=l9_728.z;
bool l9_749=l9_745;
float l9_750=l9_733;
float l9_751=fast::clamp(l9_746,l9_747,l9_748);
float l9_752=step(abs(l9_746-l9_751),9.9999997e-06);
l9_750*=(l9_752+((1.0-float(l9_749))*(1.0-l9_752)));
l9_746=l9_751;
l9_723.x=l9_746;
l9_733=l9_750;
bool l9_753=l9_729;
bool l9_754;
if (l9_753)
{
l9_754=l9_726.y==3;
}
else
{
l9_754=l9_753;
}
float l9_755=l9_723.y;
float l9_756=l9_728.y;
float l9_757=l9_728.w;
bool l9_758=l9_754;
float l9_759=l9_733;
float l9_760=fast::clamp(l9_755,l9_756,l9_757);
float l9_761=step(abs(l9_755-l9_760),9.9999997e-06);
l9_759*=(l9_761+((1.0-float(l9_758))*(1.0-l9_761)));
l9_755=l9_760;
l9_723.y=l9_755;
l9_733=l9_759;
}
float2 l9_762=l9_723;
bool l9_763=l9_724;
float3x3 l9_764=l9_725;
if (l9_763)
{
l9_762=float2((l9_764*float3(l9_762,1.0)).xy);
}
float2 l9_765=l9_762;
float2 l9_766=l9_765;
float2 l9_767=l9_766;
l9_723=l9_767;
float l9_768=l9_723.x;
int l9_769=l9_726.x;
bool l9_770=l9_732;
float l9_771=l9_733;
if ((l9_769==0)||(l9_769==3))
{
float l9_772=l9_768;
float l9_773=0.0;
float l9_774=1.0;
bool l9_775=l9_770;
float l9_776=l9_771;
float l9_777=fast::clamp(l9_772,l9_773,l9_774);
float l9_778=step(abs(l9_772-l9_777),9.9999997e-06);
l9_776*=(l9_778+((1.0-float(l9_775))*(1.0-l9_778)));
l9_772=l9_777;
l9_768=l9_772;
l9_771=l9_776;
}
l9_723.x=l9_768;
l9_733=l9_771;
float l9_779=l9_723.y;
int l9_780=l9_726.y;
bool l9_781=l9_732;
float l9_782=l9_733;
if ((l9_780==0)||(l9_780==3))
{
float l9_783=l9_779;
float l9_784=0.0;
float l9_785=1.0;
bool l9_786=l9_781;
float l9_787=l9_782;
float l9_788=fast::clamp(l9_783,l9_784,l9_785);
float l9_789=step(abs(l9_783-l9_788),9.9999997e-06);
l9_787*=(l9_789+((1.0-float(l9_786))*(1.0-l9_789)));
l9_783=l9_788;
l9_779=l9_783;
l9_782=l9_787;
}
l9_723.y=l9_779;
l9_733=l9_782;
float2 l9_790=l9_723;
int l9_791=l9_721;
int l9_792=l9_722;
float l9_793=l9_731;
float2 l9_794=l9_790;
int l9_795=l9_791;
int l9_796=l9_792;
float3 l9_797=float3(0.0);
if (l9_795==0)
{
l9_797=float3(l9_794,0.0);
}
else
{
if (l9_795==1)
{
l9_797=float3(l9_794.x,(l9_794.y*0.5)+(0.5-(float(l9_796)*0.5)),0.0);
}
else
{
l9_797=float3(l9_794,float(l9_796));
}
}
float3 l9_798=l9_797;
float3 l9_799=l9_798;
float2 l9_800=l9_799.xy;
float l9_801=l9_793;
float4 l9_802=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_800,bias(l9_801));
float4 l9_803=l9_802;
float4 l9_804=l9_803;
if (l9_729)
{
l9_804=mix(l9_730,l9_804,float4(l9_733));
}
float4 l9_805=l9_804;
l9_714=l9_805;
float4 l9_806=float4(0.0);
l9_806=float4(l9_691)*l9_714;
float4 l9_807=float4(0.0);
l9_807=float4(l9_806.xyz.x,l9_806.xyz.y,l9_806.xyz.z,l9_807.w);
l9_807.w=l9_691;
float4 l9_808=float4(0.0);
l9_808=l9_807;
l9_668=l9_808;
l9_666+=l9_668;
param_11=l9_666;
float4 l9_809=param_11;
ssGlobals l9_810=param_12;
float4 l9_811=float4(0.0);
l9_810.Loop_Index_ID0=5.0;
l9_810.Loop_Ratio_ID0=0.71428603;
float l9_812=0.0;
l9_812=l9_810.Loop_Index_ID0;
float l9_813=0.0;
float l9_814=l9_812;
float l9_815=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_816=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_817=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_818=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_819=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_820=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_821=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_822=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_823=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_824=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_825=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_826=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_827=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_828=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_829[14];
l9_829[0]=l9_815;
l9_829[1]=l9_816;
l9_829[2]=l9_817;
l9_829[3]=l9_818;
l9_829[4]=l9_819;
l9_829[5]=l9_820;
l9_829[6]=l9_821;
l9_829[7]=l9_822;
l9_829[8]=l9_823;
l9_829[9]=l9_824;
l9_829[10]=l9_825;
l9_829[11]=l9_826;
l9_829[12]=l9_827;
l9_829[13]=l9_828;
int l9_830=int(fast::clamp(l9_814+9.9999997e-05,0.0,13.0));
float l9_831=l9_829[l9_830];
l9_813=l9_831;
float l9_832=0.0;
l9_832=l9_813;
float l9_833=0.0;
l9_833=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_834=0.0;
l9_834=l9_832*l9_833;
float2 l9_835=float2(0.0);
float2 l9_836=(*sc_set0.UserUniforms).normTexSize.zw;
l9_835=l9_836;
float2 l9_837=float2(0.0);
l9_837=l9_810.gScreenCoord;
float2 l9_838=float2(0.0);
float2 l9_839=(*sc_set0.UserUniforms).blurDirection;
l9_838=l9_839;
float2 l9_840=float2(0.0);
l9_840=l9_838*l9_835;
float l9_841=0.0;
float l9_842=l9_812;
float l9_843=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_844=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_845=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_846=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_847=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_848=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_849=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_850=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_851[8];
l9_851[0]=l9_843;
l9_851[1]=l9_844;
l9_851[2]=l9_845;
l9_851[3]=l9_846;
l9_851[4]=l9_847;
l9_851[5]=l9_848;
l9_851[6]=l9_849;
l9_851[7]=l9_850;
int l9_852=int(fast::clamp(l9_842+9.9999997e-05,0.0,7.0));
float l9_853=l9_851[l9_852];
l9_841=l9_853;
float2 l9_854=float2(0.0);
l9_854=l9_840*float2(l9_841);
float2 l9_855=float2(0.0);
l9_855=l9_837+l9_854;
float2 l9_856=float2(0.0);
l9_856=l9_855;
float4 l9_857=float4(0.0);
int l9_858=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_859=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_859=0;
}
else
{
l9_859=in.varStereoViewID;
}
int l9_860=l9_859;
l9_858=1-l9_860;
}
else
{
int l9_861=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_861=0;
}
else
{
l9_861=in.varStereoViewID;
}
int l9_862=l9_861;
l9_858=l9_862;
}
int l9_863=l9_858;
int l9_864=normTexLayout_tmp;
int l9_865=l9_863;
float2 l9_866=l9_856;
bool l9_867=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_868=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_869=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_870=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_871=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_872=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_873=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_874=0.0;
bool l9_875=l9_872&&(!l9_870);
float l9_876=1.0;
float l9_877=l9_866.x;
int l9_878=l9_869.x;
if (l9_878==1)
{
l9_877=fract(l9_877);
}
else
{
if (l9_878==2)
{
float l9_879=fract(l9_877);
float l9_880=l9_877-l9_879;
float l9_881=step(0.25,fract(l9_880*0.5));
l9_877=mix(l9_879,1.0-l9_879,fast::clamp(l9_881,0.0,1.0));
}
}
l9_866.x=l9_877;
float l9_882=l9_866.y;
int l9_883=l9_869.y;
if (l9_883==1)
{
l9_882=fract(l9_882);
}
else
{
if (l9_883==2)
{
float l9_884=fract(l9_882);
float l9_885=l9_882-l9_884;
float l9_886=step(0.25,fract(l9_885*0.5));
l9_882=mix(l9_884,1.0-l9_884,fast::clamp(l9_886,0.0,1.0));
}
}
l9_866.y=l9_882;
if (l9_870)
{
bool l9_887=l9_872;
bool l9_888;
if (l9_887)
{
l9_888=l9_869.x==3;
}
else
{
l9_888=l9_887;
}
float l9_889=l9_866.x;
float l9_890=l9_871.x;
float l9_891=l9_871.z;
bool l9_892=l9_888;
float l9_893=l9_876;
float l9_894=fast::clamp(l9_889,l9_890,l9_891);
float l9_895=step(abs(l9_889-l9_894),9.9999997e-06);
l9_893*=(l9_895+((1.0-float(l9_892))*(1.0-l9_895)));
l9_889=l9_894;
l9_866.x=l9_889;
l9_876=l9_893;
bool l9_896=l9_872;
bool l9_897;
if (l9_896)
{
l9_897=l9_869.y==3;
}
else
{
l9_897=l9_896;
}
float l9_898=l9_866.y;
float l9_899=l9_871.y;
float l9_900=l9_871.w;
bool l9_901=l9_897;
float l9_902=l9_876;
float l9_903=fast::clamp(l9_898,l9_899,l9_900);
float l9_904=step(abs(l9_898-l9_903),9.9999997e-06);
l9_902*=(l9_904+((1.0-float(l9_901))*(1.0-l9_904)));
l9_898=l9_903;
l9_866.y=l9_898;
l9_876=l9_902;
}
float2 l9_905=l9_866;
bool l9_906=l9_867;
float3x3 l9_907=l9_868;
if (l9_906)
{
l9_905=float2((l9_907*float3(l9_905,1.0)).xy);
}
float2 l9_908=l9_905;
float2 l9_909=l9_908;
float2 l9_910=l9_909;
l9_866=l9_910;
float l9_911=l9_866.x;
int l9_912=l9_869.x;
bool l9_913=l9_875;
float l9_914=l9_876;
if ((l9_912==0)||(l9_912==3))
{
float l9_915=l9_911;
float l9_916=0.0;
float l9_917=1.0;
bool l9_918=l9_913;
float l9_919=l9_914;
float l9_920=fast::clamp(l9_915,l9_916,l9_917);
float l9_921=step(abs(l9_915-l9_920),9.9999997e-06);
l9_919*=(l9_921+((1.0-float(l9_918))*(1.0-l9_921)));
l9_915=l9_920;
l9_911=l9_915;
l9_914=l9_919;
}
l9_866.x=l9_911;
l9_876=l9_914;
float l9_922=l9_866.y;
int l9_923=l9_869.y;
bool l9_924=l9_875;
float l9_925=l9_876;
if ((l9_923==0)||(l9_923==3))
{
float l9_926=l9_922;
float l9_927=0.0;
float l9_928=1.0;
bool l9_929=l9_924;
float l9_930=l9_925;
float l9_931=fast::clamp(l9_926,l9_927,l9_928);
float l9_932=step(abs(l9_926-l9_931),9.9999997e-06);
l9_930*=(l9_932+((1.0-float(l9_929))*(1.0-l9_932)));
l9_926=l9_931;
l9_922=l9_926;
l9_925=l9_930;
}
l9_866.y=l9_922;
l9_876=l9_925;
float2 l9_933=l9_866;
int l9_934=l9_864;
int l9_935=l9_865;
float l9_936=l9_874;
float2 l9_937=l9_933;
int l9_938=l9_934;
int l9_939=l9_935;
float3 l9_940=float3(0.0);
if (l9_938==0)
{
l9_940=float3(l9_937,0.0);
}
else
{
if (l9_938==1)
{
l9_940=float3(l9_937.x,(l9_937.y*0.5)+(0.5-(float(l9_939)*0.5)),0.0);
}
else
{
l9_940=float3(l9_937,float(l9_939));
}
}
float3 l9_941=l9_940;
float3 l9_942=l9_941;
float2 l9_943=l9_942.xy;
float l9_944=l9_936;
float4 l9_945=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_943,bias(l9_944));
float4 l9_946=l9_945;
float4 l9_947=l9_946;
if (l9_872)
{
l9_947=mix(l9_873,l9_947,float4(l9_876));
}
float4 l9_948=l9_947;
l9_857=l9_948;
float4 l9_949=float4(0.0);
l9_949=float4(l9_834)*l9_857;
float4 l9_950=float4(0.0);
l9_950=float4(l9_949.xyz.x,l9_949.xyz.y,l9_949.xyz.z,l9_950.w);
l9_950.w=l9_834;
float4 l9_951=float4(0.0);
l9_951=l9_950;
l9_811=l9_951;
l9_809+=l9_811;
param_11=l9_809;
float4 l9_952=param_11;
ssGlobals l9_953=param_12;
float4 l9_954=float4(0.0);
l9_953.Loop_Index_ID0=6.0;
l9_953.Loop_Ratio_ID0=0.85714298;
float l9_955=0.0;
l9_955=l9_953.Loop_Index_ID0;
float l9_956=0.0;
float l9_957=l9_955;
float l9_958=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_959=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_960=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_961=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_962=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_963=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_964=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_965=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_966=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_967=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_968=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_969=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_970=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_971=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_972[14];
l9_972[0]=l9_958;
l9_972[1]=l9_959;
l9_972[2]=l9_960;
l9_972[3]=l9_961;
l9_972[4]=l9_962;
l9_972[5]=l9_963;
l9_972[6]=l9_964;
l9_972[7]=l9_965;
l9_972[8]=l9_966;
l9_972[9]=l9_967;
l9_972[10]=l9_968;
l9_972[11]=l9_969;
l9_972[12]=l9_970;
l9_972[13]=l9_971;
int l9_973=int(fast::clamp(l9_957+9.9999997e-05,0.0,13.0));
float l9_974=l9_972[l9_973];
l9_956=l9_974;
float l9_975=0.0;
l9_975=l9_956;
float l9_976=0.0;
l9_976=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_977=0.0;
l9_977=l9_975*l9_976;
float2 l9_978=float2(0.0);
float2 l9_979=(*sc_set0.UserUniforms).normTexSize.zw;
l9_978=l9_979;
float2 l9_980=float2(0.0);
l9_980=l9_953.gScreenCoord;
float2 l9_981=float2(0.0);
float2 l9_982=(*sc_set0.UserUniforms).blurDirection;
l9_981=l9_982;
float2 l9_983=float2(0.0);
l9_983=l9_981*l9_978;
float l9_984=0.0;
float l9_985=l9_955;
float l9_986=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_987=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_988=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_989=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_990=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_991=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_992=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_993=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_994[8];
l9_994[0]=l9_986;
l9_994[1]=l9_987;
l9_994[2]=l9_988;
l9_994[3]=l9_989;
l9_994[4]=l9_990;
l9_994[5]=l9_991;
l9_994[6]=l9_992;
l9_994[7]=l9_993;
int l9_995=int(fast::clamp(l9_985+9.9999997e-05,0.0,7.0));
float l9_996=l9_994[l9_995];
l9_984=l9_996;
float2 l9_997=float2(0.0);
l9_997=l9_983*float2(l9_984);
float2 l9_998=float2(0.0);
l9_998=l9_980+l9_997;
float2 l9_999=float2(0.0);
l9_999=l9_998;
float4 l9_1000=float4(0.0);
int l9_1001=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_1002=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1002=0;
}
else
{
l9_1002=in.varStereoViewID;
}
int l9_1003=l9_1002;
l9_1001=1-l9_1003;
}
else
{
int l9_1004=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1004=0;
}
else
{
l9_1004=in.varStereoViewID;
}
int l9_1005=l9_1004;
l9_1001=l9_1005;
}
int l9_1006=l9_1001;
int l9_1007=normTexLayout_tmp;
int l9_1008=l9_1006;
float2 l9_1009=l9_999;
bool l9_1010=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_1011=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_1012=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_1013=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_1014=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_1015=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_1016=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_1017=0.0;
bool l9_1018=l9_1015&&(!l9_1013);
float l9_1019=1.0;
float l9_1020=l9_1009.x;
int l9_1021=l9_1012.x;
if (l9_1021==1)
{
l9_1020=fract(l9_1020);
}
else
{
if (l9_1021==2)
{
float l9_1022=fract(l9_1020);
float l9_1023=l9_1020-l9_1022;
float l9_1024=step(0.25,fract(l9_1023*0.5));
l9_1020=mix(l9_1022,1.0-l9_1022,fast::clamp(l9_1024,0.0,1.0));
}
}
l9_1009.x=l9_1020;
float l9_1025=l9_1009.y;
int l9_1026=l9_1012.y;
if (l9_1026==1)
{
l9_1025=fract(l9_1025);
}
else
{
if (l9_1026==2)
{
float l9_1027=fract(l9_1025);
float l9_1028=l9_1025-l9_1027;
float l9_1029=step(0.25,fract(l9_1028*0.5));
l9_1025=mix(l9_1027,1.0-l9_1027,fast::clamp(l9_1029,0.0,1.0));
}
}
l9_1009.y=l9_1025;
if (l9_1013)
{
bool l9_1030=l9_1015;
bool l9_1031;
if (l9_1030)
{
l9_1031=l9_1012.x==3;
}
else
{
l9_1031=l9_1030;
}
float l9_1032=l9_1009.x;
float l9_1033=l9_1014.x;
float l9_1034=l9_1014.z;
bool l9_1035=l9_1031;
float l9_1036=l9_1019;
float l9_1037=fast::clamp(l9_1032,l9_1033,l9_1034);
float l9_1038=step(abs(l9_1032-l9_1037),9.9999997e-06);
l9_1036*=(l9_1038+((1.0-float(l9_1035))*(1.0-l9_1038)));
l9_1032=l9_1037;
l9_1009.x=l9_1032;
l9_1019=l9_1036;
bool l9_1039=l9_1015;
bool l9_1040;
if (l9_1039)
{
l9_1040=l9_1012.y==3;
}
else
{
l9_1040=l9_1039;
}
float l9_1041=l9_1009.y;
float l9_1042=l9_1014.y;
float l9_1043=l9_1014.w;
bool l9_1044=l9_1040;
float l9_1045=l9_1019;
float l9_1046=fast::clamp(l9_1041,l9_1042,l9_1043);
float l9_1047=step(abs(l9_1041-l9_1046),9.9999997e-06);
l9_1045*=(l9_1047+((1.0-float(l9_1044))*(1.0-l9_1047)));
l9_1041=l9_1046;
l9_1009.y=l9_1041;
l9_1019=l9_1045;
}
float2 l9_1048=l9_1009;
bool l9_1049=l9_1010;
float3x3 l9_1050=l9_1011;
if (l9_1049)
{
l9_1048=float2((l9_1050*float3(l9_1048,1.0)).xy);
}
float2 l9_1051=l9_1048;
float2 l9_1052=l9_1051;
float2 l9_1053=l9_1052;
l9_1009=l9_1053;
float l9_1054=l9_1009.x;
int l9_1055=l9_1012.x;
bool l9_1056=l9_1018;
float l9_1057=l9_1019;
if ((l9_1055==0)||(l9_1055==3))
{
float l9_1058=l9_1054;
float l9_1059=0.0;
float l9_1060=1.0;
bool l9_1061=l9_1056;
float l9_1062=l9_1057;
float l9_1063=fast::clamp(l9_1058,l9_1059,l9_1060);
float l9_1064=step(abs(l9_1058-l9_1063),9.9999997e-06);
l9_1062*=(l9_1064+((1.0-float(l9_1061))*(1.0-l9_1064)));
l9_1058=l9_1063;
l9_1054=l9_1058;
l9_1057=l9_1062;
}
l9_1009.x=l9_1054;
l9_1019=l9_1057;
float l9_1065=l9_1009.y;
int l9_1066=l9_1012.y;
bool l9_1067=l9_1018;
float l9_1068=l9_1019;
if ((l9_1066==0)||(l9_1066==3))
{
float l9_1069=l9_1065;
float l9_1070=0.0;
float l9_1071=1.0;
bool l9_1072=l9_1067;
float l9_1073=l9_1068;
float l9_1074=fast::clamp(l9_1069,l9_1070,l9_1071);
float l9_1075=step(abs(l9_1069-l9_1074),9.9999997e-06);
l9_1073*=(l9_1075+((1.0-float(l9_1072))*(1.0-l9_1075)));
l9_1069=l9_1074;
l9_1065=l9_1069;
l9_1068=l9_1073;
}
l9_1009.y=l9_1065;
l9_1019=l9_1068;
float2 l9_1076=l9_1009;
int l9_1077=l9_1007;
int l9_1078=l9_1008;
float l9_1079=l9_1017;
float2 l9_1080=l9_1076;
int l9_1081=l9_1077;
int l9_1082=l9_1078;
float3 l9_1083=float3(0.0);
if (l9_1081==0)
{
l9_1083=float3(l9_1080,0.0);
}
else
{
if (l9_1081==1)
{
l9_1083=float3(l9_1080.x,(l9_1080.y*0.5)+(0.5-(float(l9_1082)*0.5)),0.0);
}
else
{
l9_1083=float3(l9_1080,float(l9_1082));
}
}
float3 l9_1084=l9_1083;
float3 l9_1085=l9_1084;
float2 l9_1086=l9_1085.xy;
float l9_1087=l9_1079;
float4 l9_1088=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_1086,bias(l9_1087));
float4 l9_1089=l9_1088;
float4 l9_1090=l9_1089;
if (l9_1015)
{
l9_1090=mix(l9_1016,l9_1090,float4(l9_1019));
}
float4 l9_1091=l9_1090;
l9_1000=l9_1091;
float4 l9_1092=float4(0.0);
l9_1092=float4(l9_977)*l9_1000;
float4 l9_1093=float4(0.0);
l9_1093=float4(l9_1092.xyz.x,l9_1092.xyz.y,l9_1092.xyz.z,l9_1093.w);
l9_1093.w=l9_977;
float4 l9_1094=float4(0.0);
l9_1094=l9_1093;
l9_954=l9_1094;
l9_952+=l9_954;
param_11=l9_952;
float4 l9_1095=param_11;
ssGlobals l9_1096=param_12;
float4 l9_1097=float4(0.0);
l9_1096.Loop_Index_ID0=7.0;
l9_1096.Loop_Ratio_ID0=1.0;
float l9_1098=0.0;
l9_1098=l9_1096.Loop_Index_ID0;
float l9_1099=0.0;
float l9_1100=l9_1098;
float l9_1101=(*sc_set0.UserUniforms).Port_Item0_N009;
float l9_1102=(*sc_set0.UserUniforms).Port_Item1_N009;
float l9_1103=(*sc_set0.UserUniforms).Port_Item2_N009;
float l9_1104=(*sc_set0.UserUniforms).Port_Item3_N009;
float l9_1105=(*sc_set0.UserUniforms).Port_Item4_N009;
float l9_1106=(*sc_set0.UserUniforms).Port_Item5_N009;
float l9_1107=(*sc_set0.UserUniforms).Port_Item6_N009;
float l9_1108=(*sc_set0.UserUniforms).Port_Item7_N009;
float l9_1109=(*sc_set0.UserUniforms).Port_Item8_N009;
float l9_1110=(*sc_set0.UserUniforms).Port_Item9_N009;
float l9_1111=(*sc_set0.UserUniforms).Port_Item10_N009;
float l9_1112=(*sc_set0.UserUniforms).Port_Item11_N009;
float l9_1113=(*sc_set0.UserUniforms).Port_Item12_N009;
float l9_1114=(*sc_set0.UserUniforms).Port_Item13_N009;
float l9_1115[14];
l9_1115[0]=l9_1101;
l9_1115[1]=l9_1102;
l9_1115[2]=l9_1103;
l9_1115[3]=l9_1104;
l9_1115[4]=l9_1105;
l9_1115[5]=l9_1106;
l9_1115[6]=l9_1107;
l9_1115[7]=l9_1108;
l9_1115[8]=l9_1109;
l9_1115[9]=l9_1110;
l9_1115[10]=l9_1111;
l9_1115[11]=l9_1112;
l9_1115[12]=l9_1113;
l9_1115[13]=l9_1114;
int l9_1116=int(fast::clamp(l9_1100+9.9999997e-05,0.0,13.0));
float l9_1117=l9_1115[l9_1116];
l9_1099=l9_1117;
float l9_1118=0.0;
l9_1118=l9_1099;
float l9_1119=0.0;
l9_1119=exp((*sc_set0.UserUniforms).Port_Input0_N187);
float l9_1120=0.0;
l9_1120=l9_1118*l9_1119;
float2 l9_1121=float2(0.0);
float2 l9_1122=(*sc_set0.UserUniforms).normTexSize.zw;
l9_1121=l9_1122;
float2 l9_1123=float2(0.0);
l9_1123=l9_1096.gScreenCoord;
float2 l9_1124=float2(0.0);
float2 l9_1125=(*sc_set0.UserUniforms).blurDirection;
l9_1124=l9_1125;
float2 l9_1126=float2(0.0);
l9_1126=l9_1124*l9_1121;
float l9_1127=0.0;
float l9_1128=l9_1098;
float l9_1129=(*sc_set0.UserUniforms).Port_Item0_N114;
float l9_1130=(*sc_set0.UserUniforms).Port_Item1_N114;
float l9_1131=(*sc_set0.UserUniforms).Port_Item2_N114;
float l9_1132=(*sc_set0.UserUniforms).Port_Item3_N114;
float l9_1133=(*sc_set0.UserUniforms).Port_Item4_N114;
float l9_1134=(*sc_set0.UserUniforms).Port_Item5_N114;
float l9_1135=(*sc_set0.UserUniforms).Port_Item6_N114;
float l9_1136=(*sc_set0.UserUniforms).Port_Item7_N114;
float l9_1137[8];
l9_1137[0]=l9_1129;
l9_1137[1]=l9_1130;
l9_1137[2]=l9_1131;
l9_1137[3]=l9_1132;
l9_1137[4]=l9_1133;
l9_1137[5]=l9_1134;
l9_1137[6]=l9_1135;
l9_1137[7]=l9_1136;
int l9_1138=int(fast::clamp(l9_1128+9.9999997e-05,0.0,7.0));
float l9_1139=l9_1137[l9_1138];
l9_1127=l9_1139;
float2 l9_1140=float2(0.0);
l9_1140=l9_1126*float2(l9_1127);
float2 l9_1141=float2(0.0);
l9_1141=l9_1123+l9_1140;
float2 l9_1142=float2(0.0);
l9_1142=l9_1141;
float4 l9_1143=float4(0.0);
int l9_1144=0;
if ((int(normTexHasSwappedViews_tmp)!=0))
{
int l9_1145=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1145=0;
}
else
{
l9_1145=in.varStereoViewID;
}
int l9_1146=l9_1145;
l9_1144=1-l9_1146;
}
else
{
int l9_1147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1147=0;
}
else
{
l9_1147=in.varStereoViewID;
}
int l9_1148=l9_1147;
l9_1144=l9_1148;
}
int l9_1149=l9_1144;
int l9_1150=normTexLayout_tmp;
int l9_1151=l9_1149;
float2 l9_1152=l9_1142;
bool l9_1153=(int(SC_USE_UV_TRANSFORM_normTex_tmp)!=0);
float3x3 l9_1154=(*sc_set0.UserUniforms).normTexTransform;
int2 l9_1155=int2(SC_SOFTWARE_WRAP_MODE_U_normTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normTex_tmp);
bool l9_1156=(int(SC_USE_UV_MIN_MAX_normTex_tmp)!=0);
float4 l9_1157=(*sc_set0.UserUniforms).normTexUvMinMax;
bool l9_1158=(int(SC_USE_CLAMP_TO_BORDER_normTex_tmp)!=0);
float4 l9_1159=(*sc_set0.UserUniforms).normTexBorderColor;
float l9_1160=0.0;
bool l9_1161=l9_1158&&(!l9_1156);
float l9_1162=1.0;
float l9_1163=l9_1152.x;
int l9_1164=l9_1155.x;
if (l9_1164==1)
{
l9_1163=fract(l9_1163);
}
else
{
if (l9_1164==2)
{
float l9_1165=fract(l9_1163);
float l9_1166=l9_1163-l9_1165;
float l9_1167=step(0.25,fract(l9_1166*0.5));
l9_1163=mix(l9_1165,1.0-l9_1165,fast::clamp(l9_1167,0.0,1.0));
}
}
l9_1152.x=l9_1163;
float l9_1168=l9_1152.y;
int l9_1169=l9_1155.y;
if (l9_1169==1)
{
l9_1168=fract(l9_1168);
}
else
{
if (l9_1169==2)
{
float l9_1170=fract(l9_1168);
float l9_1171=l9_1168-l9_1170;
float l9_1172=step(0.25,fract(l9_1171*0.5));
l9_1168=mix(l9_1170,1.0-l9_1170,fast::clamp(l9_1172,0.0,1.0));
}
}
l9_1152.y=l9_1168;
if (l9_1156)
{
bool l9_1173=l9_1158;
bool l9_1174;
if (l9_1173)
{
l9_1174=l9_1155.x==3;
}
else
{
l9_1174=l9_1173;
}
float l9_1175=l9_1152.x;
float l9_1176=l9_1157.x;
float l9_1177=l9_1157.z;
bool l9_1178=l9_1174;
float l9_1179=l9_1162;
float l9_1180=fast::clamp(l9_1175,l9_1176,l9_1177);
float l9_1181=step(abs(l9_1175-l9_1180),9.9999997e-06);
l9_1179*=(l9_1181+((1.0-float(l9_1178))*(1.0-l9_1181)));
l9_1175=l9_1180;
l9_1152.x=l9_1175;
l9_1162=l9_1179;
bool l9_1182=l9_1158;
bool l9_1183;
if (l9_1182)
{
l9_1183=l9_1155.y==3;
}
else
{
l9_1183=l9_1182;
}
float l9_1184=l9_1152.y;
float l9_1185=l9_1157.y;
float l9_1186=l9_1157.w;
bool l9_1187=l9_1183;
float l9_1188=l9_1162;
float l9_1189=fast::clamp(l9_1184,l9_1185,l9_1186);
float l9_1190=step(abs(l9_1184-l9_1189),9.9999997e-06);
l9_1188*=(l9_1190+((1.0-float(l9_1187))*(1.0-l9_1190)));
l9_1184=l9_1189;
l9_1152.y=l9_1184;
l9_1162=l9_1188;
}
float2 l9_1191=l9_1152;
bool l9_1192=l9_1153;
float3x3 l9_1193=l9_1154;
if (l9_1192)
{
l9_1191=float2((l9_1193*float3(l9_1191,1.0)).xy);
}
float2 l9_1194=l9_1191;
float2 l9_1195=l9_1194;
float2 l9_1196=l9_1195;
l9_1152=l9_1196;
float l9_1197=l9_1152.x;
int l9_1198=l9_1155.x;
bool l9_1199=l9_1161;
float l9_1200=l9_1162;
if ((l9_1198==0)||(l9_1198==3))
{
float l9_1201=l9_1197;
float l9_1202=0.0;
float l9_1203=1.0;
bool l9_1204=l9_1199;
float l9_1205=l9_1200;
float l9_1206=fast::clamp(l9_1201,l9_1202,l9_1203);
float l9_1207=step(abs(l9_1201-l9_1206),9.9999997e-06);
l9_1205*=(l9_1207+((1.0-float(l9_1204))*(1.0-l9_1207)));
l9_1201=l9_1206;
l9_1197=l9_1201;
l9_1200=l9_1205;
}
l9_1152.x=l9_1197;
l9_1162=l9_1200;
float l9_1208=l9_1152.y;
int l9_1209=l9_1155.y;
bool l9_1210=l9_1161;
float l9_1211=l9_1162;
if ((l9_1209==0)||(l9_1209==3))
{
float l9_1212=l9_1208;
float l9_1213=0.0;
float l9_1214=1.0;
bool l9_1215=l9_1210;
float l9_1216=l9_1211;
float l9_1217=fast::clamp(l9_1212,l9_1213,l9_1214);
float l9_1218=step(abs(l9_1212-l9_1217),9.9999997e-06);
l9_1216*=(l9_1218+((1.0-float(l9_1215))*(1.0-l9_1218)));
l9_1212=l9_1217;
l9_1208=l9_1212;
l9_1211=l9_1216;
}
l9_1152.y=l9_1208;
l9_1162=l9_1211;
float2 l9_1219=l9_1152;
int l9_1220=l9_1150;
int l9_1221=l9_1151;
float l9_1222=l9_1160;
float2 l9_1223=l9_1219;
int l9_1224=l9_1220;
int l9_1225=l9_1221;
float3 l9_1226=float3(0.0);
if (l9_1224==0)
{
l9_1226=float3(l9_1223,0.0);
}
else
{
if (l9_1224==1)
{
l9_1226=float3(l9_1223.x,(l9_1223.y*0.5)+(0.5-(float(l9_1225)*0.5)),0.0);
}
else
{
l9_1226=float3(l9_1223,float(l9_1225));
}
}
float3 l9_1227=l9_1226;
float3 l9_1228=l9_1227;
float2 l9_1229=l9_1228.xy;
float l9_1230=l9_1222;
float4 l9_1231=sc_set0.normTex.sample(sc_set0.normTexSmpSC,l9_1229,bias(l9_1230));
float4 l9_1232=l9_1231;
float4 l9_1233=l9_1232;
if (l9_1158)
{
l9_1233=mix(l9_1159,l9_1233,float4(l9_1162));
}
float4 l9_1234=l9_1233;
l9_1143=l9_1234;
float4 l9_1235=float4(0.0);
l9_1235=float4(l9_1120)*l9_1143;
float4 l9_1236=float4(0.0);
l9_1236=float4(l9_1235.xyz.x,l9_1235.xyz.y,l9_1235.xyz.z,l9_1236.w);
l9_1236.w=l9_1120;
float4 l9_1237=float4(0.0);
l9_1237=l9_1236;
l9_1097=l9_1237;
l9_1095+=l9_1097;
param_11=l9_1095;
Output_N134=param_11;
float4 Output_N2=float4(0.0);
Output_N2=Value_N48+Output_N134;
float3 Value1_N140=float3(0.0);
float Value2_N140=0.0;
float4 param_13=Output_N2;
float3 param_14=param_13.xyz;
float param_15=param_13.w;
Value1_N140=param_14;
Value2_N140=param_15;
float3 Output_N141=float3(0.0);
Output_N141=Value1_N140/(float3(Value2_N140)+float3(1.234e-06));
FinalColor=float4(Output_N141,0.0);
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
float4 l9_1238=gl_FragCoord;
float2 l9_1239=floor(mod(l9_1238.xy,float2(4.0)));
float l9_1240=(mod(dot(l9_1239,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_16<l9_1240)
{
discard_fragment();
}
}
float4 param_17=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1241=param_17;
float4 l9_1242=l9_1241;
float l9_1243=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1243=l9_1242.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1243=fast::clamp(l9_1242.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1243=fast::clamp(dot(l9_1242.xyz,float3(l9_1242.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1243=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1243=(1.0-dot(l9_1242.xyz,float3(0.33333001)))*l9_1242.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1243=(1.0-fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0))*l9_1242.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1243=fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0)*l9_1242.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1243=fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1243=fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0)*l9_1242.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1243=dot(l9_1242.xyz,float3(0.33333001))*l9_1242.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1243=1.0-fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1243=fast::clamp(dot(l9_1242.xyz,float3(1.0)),0.0,1.0);
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
float l9_1244=l9_1243;
float l9_1245=l9_1244;
float l9_1246=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1245;
float3 l9_1247=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1241.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1248=float4(l9_1247.x,l9_1247.y,l9_1247.z,l9_1246);
param_17=l9_1248;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_17=float4(param_17.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1249=param_17;
float4 l9_1250=float4(0.0);
float4 l9_1251=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1252=out.FragColor0;
float4 l9_1253=l9_1252;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1253.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1254=l9_1253;
l9_1251=l9_1254;
}
else
{
float4 l9_1255=gl_FragCoord;
float2 l9_1256=l9_1255.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1257=l9_1256;
float2 l9_1258=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1259=1;
int l9_1260=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1260=0;
}
else
{
l9_1260=in.varStereoViewID;
}
int l9_1261=l9_1260;
int l9_1262=l9_1261;
float3 l9_1263=float3(l9_1257,0.0);
int l9_1264=l9_1259;
int l9_1265=l9_1262;
if (l9_1264==1)
{
l9_1263.y=((2.0*l9_1263.y)+float(l9_1265))-1.0;
}
float2 l9_1266=l9_1263.xy;
l9_1258=l9_1266;
}
else
{
l9_1258=l9_1257;
}
float2 l9_1267=l9_1258;
float2 l9_1268=l9_1267;
float2 l9_1269=l9_1268;
int l9_1270=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1271=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1271=0;
}
else
{
l9_1271=in.varStereoViewID;
}
int l9_1272=l9_1271;
l9_1270=1-l9_1272;
}
else
{
int l9_1273=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1273=0;
}
else
{
l9_1273=in.varStereoViewID;
}
int l9_1274=l9_1273;
l9_1270=l9_1274;
}
int l9_1275=l9_1270;
float2 l9_1276=l9_1269;
int l9_1277=l9_1275;
float2 l9_1278=l9_1276;
int l9_1279=l9_1277;
float l9_1280=0.0;
float4 l9_1281=float4(0.0);
float2 l9_1282=l9_1278;
int l9_1283=sc_ScreenTextureLayout_tmp;
int l9_1284=l9_1279;
float l9_1285=l9_1280;
float2 l9_1286=l9_1282;
int l9_1287=l9_1283;
int l9_1288=l9_1284;
float3 l9_1289=float3(0.0);
if (l9_1287==0)
{
l9_1289=float3(l9_1286,0.0);
}
else
{
if (l9_1287==1)
{
l9_1289=float3(l9_1286.x,(l9_1286.y*0.5)+(0.5-(float(l9_1288)*0.5)),0.0);
}
else
{
l9_1289=float3(l9_1286,float(l9_1288));
}
}
float3 l9_1290=l9_1289;
float3 l9_1291=l9_1290;
float2 l9_1292=l9_1291.xy;
float l9_1293=l9_1285;
float4 l9_1294=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1292,bias(l9_1293));
float4 l9_1295=l9_1294;
l9_1281=l9_1295;
float4 l9_1296=l9_1281;
float4 l9_1297=l9_1296;
float4 l9_1298=l9_1297;
l9_1251=l9_1298;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_1251.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_1299=l9_1251;
float4 l9_1300=l9_1299;
float3 l9_1301=l9_1300.xyz;
float3 l9_1302=l9_1301;
float3 l9_1303=l9_1249.xyz;
float3 l9_1304=definedBlend(l9_1302,l9_1303,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1250=float4(l9_1304.x,l9_1304.y,l9_1304.z,l9_1250.w);
float3 l9_1305=mix(l9_1301,l9_1250.xyz,float3(l9_1249.w));
l9_1250=float4(l9_1305.x,l9_1305.y,l9_1305.z,l9_1250.w);
l9_1250.w=1.0;
float4 l9_1306=l9_1250;
param_17=l9_1306;
}
else
{
float4 l9_1307=param_17;
float4 l9_1308=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1308=float4(mix(float3(1.0),l9_1307.xyz,float3(l9_1307.w)),l9_1307.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1309=l9_1307.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1309=fast::clamp(l9_1309,0.0,1.0);
}
l9_1308=float4(l9_1307.xyz*l9_1309,l9_1309);
}
else
{
l9_1308=l9_1307;
}
}
float4 l9_1310=l9_1308;
param_17=l9_1310;
}
}
}
float4 l9_1311=param_17;
FinalColor=l9_1311;
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
float4 l9_1312=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1312=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1312=float4(0.0);
}
float4 l9_1313=l9_1312;
float4 Cost=l9_1313;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_18=in.varPos;
float4 param_19=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_18,param_19,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_20=FinalColor;
float4 l9_1314=param_20;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1314.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1314;
return out;
}
} // FRAGMENT SHADER
