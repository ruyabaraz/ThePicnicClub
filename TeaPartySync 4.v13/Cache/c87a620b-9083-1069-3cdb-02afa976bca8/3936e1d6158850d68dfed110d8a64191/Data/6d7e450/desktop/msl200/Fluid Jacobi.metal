#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
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
//sampler sampler intensityTextureSmpSC 0:19
//sampler sampler sBoundarySmpSC 0:20
//sampler sampler sDivergenceSmpSC 0:21
//sampler sampler sPressureSmpSC 0:22
//sampler sampler sc_ScreenTextureSmpSC 0:27
//texture texture2D intensityTexture 0:1:0:19
//texture texture2D sBoundary 0:2:0:20
//texture texture2D sDivergence 0:3:0:21
//texture texture2D sPressure 0:4:0:22
//texture texture2D sc_ScreenTexture 0:16:0:27
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:30:4544 {
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
//float4 sPressureSize 4128
//float3x3 sPressureTransform 4176
//float4 sPressureUvMinMax 4224
//float4 sPressureBorderColor 4240
//float3x3 sDivergenceTransform 4304
//float4 sDivergenceUvMinMax 4352
//float4 sDivergenceBorderColor 4368
//float3x3 sBoundaryTransform 4432
//float4 sBoundaryUvMinMax 4480
//float4 sBoundaryBorderColor 4496
//float2 pressureRange 4512
//float2 divergenceRange 4520
//float alpha 4528
//int reset 4536
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_sDivergence 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sPressure 34 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 35 0
//spec_const bool SC_USE_UV_MIN_MAX_sBoundary 36 0
//spec_const bool SC_USE_UV_MIN_MAX_sDivergence 37 0
//spec_const bool SC_USE_UV_MIN_MAX_sPressure 38 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 39 0
//spec_const bool SC_USE_UV_TRANSFORM_sBoundary 40 0
//spec_const bool SC_USE_UV_TRANSFORM_sDivergence 41 0
//spec_const bool SC_USE_UV_TRANSFORM_sPressure 42 0
//spec_const bool UseViewSpaceDepthVariant 43 1
//spec_const bool intensityTextureHasSwappedViews 44 0
//spec_const bool sBoundaryHasSwappedViews 45 0
//spec_const bool sDivergenceHasSwappedViews 46 0
//spec_const bool sPressureHasSwappedViews 47 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 48 0
//spec_const bool sc_BlendMode_Add 49 0
//spec_const bool sc_BlendMode_AlphaTest 50 0
//spec_const bool sc_BlendMode_AlphaToCoverage 51 0
//spec_const bool sc_BlendMode_ColoredGlass 52 0
//spec_const bool sc_BlendMode_Custom 53 0
//spec_const bool sc_BlendMode_Max 54 0
//spec_const bool sc_BlendMode_Min 55 0
//spec_const bool sc_BlendMode_MultiplyOriginal 56 0
//spec_const bool sc_BlendMode_Multiply 57 0
//spec_const bool sc_BlendMode_Normal 58 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 59 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 60 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 61 0
//spec_const bool sc_BlendMode_Screen 62 0
//spec_const bool sc_DepthOnly 63 0
//spec_const bool sc_FramebufferFetch 64 0
//spec_const bool sc_MotionVectorsPass 65 0
//spec_const bool sc_OITCompositingPass 66 0
//spec_const bool sc_OITDepthBoundsPass 67 0
//spec_const bool sc_OITDepthGatherPass 68 0
//spec_const bool sc_ProjectiveShadowsCaster 69 0
//spec_const bool sc_ProjectiveShadowsReceiver 70 0
//spec_const bool sc_RenderAlphaToColor 71 0
//spec_const bool sc_ScreenTextureHasSwappedViews 72 0
//spec_const bool sc_ShaderComplexityAnalyzer 73 0
//spec_const bool sc_TAAEnabled 74 0
//spec_const bool sc_UseFramebufferFetchMarker 75 0
//spec_const bool sc_VertexBlendingUseNormals 76 0
//spec_const bool sc_VertexBlending 77 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sBoundary 79 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sDivergence 80 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sPressure 81 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 82 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sBoundary 83 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sDivergence 84 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sPressure 85 -1
//spec_const int intensityTextureLayout 86 0
//spec_const int sBoundaryLayout 87 0
//spec_const int sDivergenceLayout 88 0
//spec_const int sPressureLayout 89 0
//spec_const int sc_DepthBufferMode 90 0
//spec_const int sc_RenderingSpace 91 -1
//spec_const int sc_ScreenTextureLayout 92 0
//spec_const int sc_ShaderCacheConstant 93 0
//spec_const int sc_SkinBonesCount 94 0
//spec_const int sc_StereoRenderingMode 95 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 96 0
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
constant bool SC_USE_CLAMP_TO_BORDER_sDivergence [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_sDivergence_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sDivergence) ? SC_USE_CLAMP_TO_BORDER_sDivergence : false;
constant bool SC_USE_CLAMP_TO_BORDER_sPressure [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_sPressure_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sPressure) ? SC_USE_CLAMP_TO_BORDER_sPressure : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_sBoundary [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sBoundary) ? SC_USE_UV_MIN_MAX_sBoundary : false;
constant bool SC_USE_UV_MIN_MAX_sDivergence [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_sDivergence_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sDivergence) ? SC_USE_UV_MIN_MAX_sDivergence : false;
constant bool SC_USE_UV_MIN_MAX_sPressure [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_sPressure_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sPressure) ? SC_USE_UV_MIN_MAX_sPressure : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(39)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_sBoundary [[function_constant(40)]];
constant bool SC_USE_UV_TRANSFORM_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sBoundary) ? SC_USE_UV_TRANSFORM_sBoundary : false;
constant bool SC_USE_UV_TRANSFORM_sDivergence [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_sDivergence_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sDivergence) ? SC_USE_UV_TRANSFORM_sDivergence : false;
constant bool SC_USE_UV_TRANSFORM_sPressure [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_sPressure_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sPressure) ? SC_USE_UV_TRANSFORM_sPressure : false;
constant bool UseViewSpaceDepthVariant [[function_constant(43)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(44)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sBoundaryHasSwappedViews [[function_constant(45)]];
constant bool sBoundaryHasSwappedViews_tmp = is_function_constant_defined(sBoundaryHasSwappedViews) ? sBoundaryHasSwappedViews : false;
constant bool sDivergenceHasSwappedViews [[function_constant(46)]];
constant bool sDivergenceHasSwappedViews_tmp = is_function_constant_defined(sDivergenceHasSwappedViews) ? sDivergenceHasSwappedViews : false;
constant bool sPressureHasSwappedViews [[function_constant(47)]];
constant bool sPressureHasSwappedViews_tmp = is_function_constant_defined(sPressureHasSwappedViews) ? sPressureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(48)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(49)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(50)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(51)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(52)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(53)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(54)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(55)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(56)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(57)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(58)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(59)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(60)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(61)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(62)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(63)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(64)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(65)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(66)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(67)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(68)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(69)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(70)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(71)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(72)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(73)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(74)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(75)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(76)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(77)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(78)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary [[function_constant(79)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sBoundary) ? SC_SOFTWARE_WRAP_MODE_U_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sDivergence [[function_constant(80)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sDivergence_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sDivergence) ? SC_SOFTWARE_WRAP_MODE_U_sDivergence : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sPressure [[function_constant(81)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sPressure) ? SC_SOFTWARE_WRAP_MODE_U_sPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(82)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary [[function_constant(83)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sBoundary) ? SC_SOFTWARE_WRAP_MODE_V_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sDivergence [[function_constant(84)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sDivergence_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sDivergence) ? SC_SOFTWARE_WRAP_MODE_V_sDivergence : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sPressure [[function_constant(85)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sPressure) ? SC_SOFTWARE_WRAP_MODE_V_sPressure : -1;
constant int intensityTextureLayout [[function_constant(86)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sBoundaryLayout [[function_constant(87)]];
constant int sBoundaryLayout_tmp = is_function_constant_defined(sBoundaryLayout) ? sBoundaryLayout : 0;
constant int sDivergenceLayout [[function_constant(88)]];
constant int sDivergenceLayout_tmp = is_function_constant_defined(sDivergenceLayout) ? sDivergenceLayout : 0;
constant int sPressureLayout [[function_constant(89)]];
constant int sPressureLayout_tmp = is_function_constant_defined(sPressureLayout) ? sPressureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(90)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(91)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(92)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(93)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(94)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(95)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(96)]];
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
float4 sPressureSize;
float4 sPressureDims;
float4 sPressureView;
float3x3 sPressureTransform;
float4 sPressureUvMinMax;
float4 sPressureBorderColor;
float4 sDivergenceSize;
float4 sDivergenceDims;
float4 sDivergenceView;
float3x3 sDivergenceTransform;
float4 sDivergenceUvMinMax;
float4 sDivergenceBorderColor;
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float2 pressureRange;
float2 divergenceRange;
float alpha;
int wrapMode;
int reset;
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
texture2d<float> sDivergence [[id(3)]];
texture2d<float> sPressure [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sBoundarySmpSC [[id(20)]];
sampler sDivergenceSmpSC [[id(21)]];
sampler sPressureSmpSC [[id(22)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
constant userUniformsObj* UserUniforms [[id(30)]];
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
float4 sPressureSize;
float4 sPressureDims;
float4 sPressureView;
float3x3 sPressureTransform;
float4 sPressureUvMinMax;
float4 sPressureBorderColor;
float4 sDivergenceSize;
float4 sDivergenceDims;
float4 sDivergenceView;
float3x3 sDivergenceTransform;
float4 sDivergenceUvMinMax;
float4 sDivergenceBorderColor;
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float2 pressureRange;
float2 divergenceRange;
float alpha;
int wrapMode;
int reset;
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
texture2d<float> sDivergence [[id(3)]];
texture2d<float> sPressure [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sBoundarySmpSC [[id(20)]];
sampler sDivergenceSmpSC [[id(21)]];
sampler sPressureSmpSC [[id(22)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
constant userUniformsObj* UserUniforms [[id(30)]];
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
int N2_reset=0;
float2 N2_pressureRange=float2(0.0);
float2 N2_divergenceRange=float2(0.0);
float N2_alpha=0.0;
float4 N2_pressureOut=float4(0.0);
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
float2 param=(*sc_set0.UserUniforms).pressureRange;
Output_N5=param;
float2 Output_N18=float2(0.0);
float2 param_1=(*sc_set0.UserUniforms).divergenceRange;
Output_N18=param_1;
float Output_N26=0.0;
float param_2=(*sc_set0.UserUniforms).alpha;
Output_N26=param_2;
float Output_N9=0.0;
float param_3=float((*sc_set0.UserUniforms).reset);
Output_N9=param_3;
float4 pressureOut_N2=float4(0.0);
float2 param_4=Output_N5;
float2 param_5=Output_N18;
float param_6=Output_N26;
float param_7=Output_N9;
ssGlobals param_9=Globals;
ssGlobals tempGlobals=param_9;
float4 param_8=float4(0.0);
N2_pressureRange=param_4;
N2_divergenceRange=param_5;
N2_alpha=param_6;
N2_reset=int(param_7);
float2 l9_0=tempGlobals.Surface_UVCoord0;
float2 l9_1=l9_0;
float2 l9_2=l9_1;
float4 l9_3=float4(0.0);
int l9_4=0;
if ((int(sBoundaryHasSwappedViews_tmp)!=0))
{
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
l9_4=1-l9_6;
}
else
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
l9_4=l9_8;
}
int l9_9=l9_4;
int l9_10=sBoundaryLayout_tmp;
int l9_11=l9_9;
float2 l9_12=l9_2;
bool l9_13=(int(SC_USE_UV_TRANSFORM_sBoundary_tmp)!=0);
float3x3 l9_14=(*sc_set0.UserUniforms).sBoundaryTransform;
int2 l9_15=int2(SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp,SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp);
bool l9_16=(int(SC_USE_UV_MIN_MAX_sBoundary_tmp)!=0);
float4 l9_17=(*sc_set0.UserUniforms).sBoundaryUvMinMax;
bool l9_18=(int(SC_USE_CLAMP_TO_BORDER_sBoundary_tmp)!=0);
float4 l9_19=(*sc_set0.UserUniforms).sBoundaryBorderColor;
float l9_20=0.0;
bool l9_21=l9_18&&(!l9_16);
float l9_22=1.0;
float l9_23=l9_12.x;
int l9_24=l9_15.x;
if (l9_24==1)
{
l9_23=fract(l9_23);
}
else
{
if (l9_24==2)
{
float l9_25=fract(l9_23);
float l9_26=l9_23-l9_25;
float l9_27=step(0.25,fract(l9_26*0.5));
l9_23=mix(l9_25,1.0-l9_25,fast::clamp(l9_27,0.0,1.0));
}
}
l9_12.x=l9_23;
float l9_28=l9_12.y;
int l9_29=l9_15.y;
if (l9_29==1)
{
l9_28=fract(l9_28);
}
else
{
if (l9_29==2)
{
float l9_30=fract(l9_28);
float l9_31=l9_28-l9_30;
float l9_32=step(0.25,fract(l9_31*0.5));
l9_28=mix(l9_30,1.0-l9_30,fast::clamp(l9_32,0.0,1.0));
}
}
l9_12.y=l9_28;
if (l9_16)
{
bool l9_33=l9_18;
bool l9_34;
if (l9_33)
{
l9_34=l9_15.x==3;
}
else
{
l9_34=l9_33;
}
float l9_35=l9_12.x;
float l9_36=l9_17.x;
float l9_37=l9_17.z;
bool l9_38=l9_34;
float l9_39=l9_22;
float l9_40=fast::clamp(l9_35,l9_36,l9_37);
float l9_41=step(abs(l9_35-l9_40),9.9999997e-06);
l9_39*=(l9_41+((1.0-float(l9_38))*(1.0-l9_41)));
l9_35=l9_40;
l9_12.x=l9_35;
l9_22=l9_39;
bool l9_42=l9_18;
bool l9_43;
if (l9_42)
{
l9_43=l9_15.y==3;
}
else
{
l9_43=l9_42;
}
float l9_44=l9_12.y;
float l9_45=l9_17.y;
float l9_46=l9_17.w;
bool l9_47=l9_43;
float l9_48=l9_22;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
l9_12.y=l9_44;
l9_22=l9_48;
}
float2 l9_51=l9_12;
bool l9_52=l9_13;
float3x3 l9_53=l9_14;
if (l9_52)
{
l9_51=float2((l9_53*float3(l9_51,1.0)).xy);
}
float2 l9_54=l9_51;
float2 l9_55=l9_54;
float2 l9_56=l9_55;
l9_12=l9_56;
float l9_57=l9_12.x;
int l9_58=l9_15.x;
bool l9_59=l9_21;
float l9_60=l9_22;
if ((l9_58==0)||(l9_58==3))
{
float l9_61=l9_57;
float l9_62=0.0;
float l9_63=1.0;
bool l9_64=l9_59;
float l9_65=l9_60;
float l9_66=fast::clamp(l9_61,l9_62,l9_63);
float l9_67=step(abs(l9_61-l9_66),9.9999997e-06);
l9_65*=(l9_67+((1.0-float(l9_64))*(1.0-l9_67)));
l9_61=l9_66;
l9_57=l9_61;
l9_60=l9_65;
}
l9_12.x=l9_57;
l9_22=l9_60;
float l9_68=l9_12.y;
int l9_69=l9_15.y;
bool l9_70=l9_21;
float l9_71=l9_22;
if ((l9_69==0)||(l9_69==3))
{
float l9_72=l9_68;
float l9_73=0.0;
float l9_74=1.0;
bool l9_75=l9_70;
float l9_76=l9_71;
float l9_77=fast::clamp(l9_72,l9_73,l9_74);
float l9_78=step(abs(l9_72-l9_77),9.9999997e-06);
l9_76*=(l9_78+((1.0-float(l9_75))*(1.0-l9_78)));
l9_72=l9_77;
l9_68=l9_72;
l9_71=l9_76;
}
l9_12.y=l9_68;
l9_22=l9_71;
float2 l9_79=l9_12;
int l9_80=l9_10;
int l9_81=l9_11;
float l9_82=l9_20;
float2 l9_83=l9_79;
int l9_84=l9_80;
int l9_85=l9_81;
float3 l9_86=float3(0.0);
if (l9_84==0)
{
l9_86=float3(l9_83,0.0);
}
else
{
if (l9_84==1)
{
l9_86=float3(l9_83.x,(l9_83.y*0.5)+(0.5-(float(l9_85)*0.5)),0.0);
}
else
{
l9_86=float3(l9_83,float(l9_85));
}
}
float3 l9_87=l9_86;
float3 l9_88=l9_87;
float2 l9_89=l9_88.xy;
float l9_90=l9_82;
float4 l9_91=sc_set0.sBoundary.sample(sc_set0.sBoundarySmpSC,l9_89,bias(l9_90));
float4 l9_92=l9_91;
float4 l9_93=l9_92;
if (l9_18)
{
l9_93=mix(l9_19,l9_93,float4(l9_22));
}
float4 l9_94=l9_93;
l9_3=l9_94;
float4 l9_95=l9_3;
float4 l9_96=l9_95;
float2 l9_97=float2(0.0);
l9_97=(*sc_set0.UserUniforms).sPressureSize.zw;
float2 l9_98=l9_97;
float2 l9_99=l9_1+(l9_98*float2(0.0,1.0));
float2 l9_100=float2(0.0);
l9_100=(*sc_set0.UserUniforms).sPressureSize.zw;
float2 l9_101=l9_100;
float2 l9_102=l9_1+(l9_101*float2(0.0,-1.0));
float2 l9_103=float2(0.0);
l9_103=(*sc_set0.UserUniforms).sPressureSize.zw;
float2 l9_104=l9_103;
float2 l9_105=l9_1+(l9_104*float2(1.0,0.0));
float2 l9_106=float2(0.0);
l9_106=(*sc_set0.UserUniforms).sPressureSize.zw;
float2 l9_107=l9_106;
float2 l9_108=l9_1+(l9_107*float2(-1.0,0.0));
float2 l9_109=l9_99;
float4 l9_110=float4(0.0);
int l9_111=0;
if ((int(sPressureHasSwappedViews_tmp)!=0))
{
int l9_112=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_112=0;
}
else
{
l9_112=in.varStereoViewID;
}
int l9_113=l9_112;
l9_111=1-l9_113;
}
else
{
int l9_114=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_114=0;
}
else
{
l9_114=in.varStereoViewID;
}
int l9_115=l9_114;
l9_111=l9_115;
}
int l9_116=l9_111;
int l9_117=sPressureLayout_tmp;
int l9_118=l9_116;
float2 l9_119=l9_109;
bool l9_120=(int(SC_USE_UV_TRANSFORM_sPressure_tmp)!=0);
float3x3 l9_121=(*sc_set0.UserUniforms).sPressureTransform;
int2 l9_122=int2(SC_SOFTWARE_WRAP_MODE_U_sPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_sPressure_tmp);
bool l9_123=(int(SC_USE_UV_MIN_MAX_sPressure_tmp)!=0);
float4 l9_124=(*sc_set0.UserUniforms).sPressureUvMinMax;
bool l9_125=(int(SC_USE_CLAMP_TO_BORDER_sPressure_tmp)!=0);
float4 l9_126=(*sc_set0.UserUniforms).sPressureBorderColor;
float l9_127=0.0;
bool l9_128=l9_125&&(!l9_123);
float l9_129=1.0;
float l9_130=l9_119.x;
int l9_131=l9_122.x;
if (l9_131==1)
{
l9_130=fract(l9_130);
}
else
{
if (l9_131==2)
{
float l9_132=fract(l9_130);
float l9_133=l9_130-l9_132;
float l9_134=step(0.25,fract(l9_133*0.5));
l9_130=mix(l9_132,1.0-l9_132,fast::clamp(l9_134,0.0,1.0));
}
}
l9_119.x=l9_130;
float l9_135=l9_119.y;
int l9_136=l9_122.y;
if (l9_136==1)
{
l9_135=fract(l9_135);
}
else
{
if (l9_136==2)
{
float l9_137=fract(l9_135);
float l9_138=l9_135-l9_137;
float l9_139=step(0.25,fract(l9_138*0.5));
l9_135=mix(l9_137,1.0-l9_137,fast::clamp(l9_139,0.0,1.0));
}
}
l9_119.y=l9_135;
if (l9_123)
{
bool l9_140=l9_125;
bool l9_141;
if (l9_140)
{
l9_141=l9_122.x==3;
}
else
{
l9_141=l9_140;
}
float l9_142=l9_119.x;
float l9_143=l9_124.x;
float l9_144=l9_124.z;
bool l9_145=l9_141;
float l9_146=l9_129;
float l9_147=fast::clamp(l9_142,l9_143,l9_144);
float l9_148=step(abs(l9_142-l9_147),9.9999997e-06);
l9_146*=(l9_148+((1.0-float(l9_145))*(1.0-l9_148)));
l9_142=l9_147;
l9_119.x=l9_142;
l9_129=l9_146;
bool l9_149=l9_125;
bool l9_150;
if (l9_149)
{
l9_150=l9_122.y==3;
}
else
{
l9_150=l9_149;
}
float l9_151=l9_119.y;
float l9_152=l9_124.y;
float l9_153=l9_124.w;
bool l9_154=l9_150;
float l9_155=l9_129;
float l9_156=fast::clamp(l9_151,l9_152,l9_153);
float l9_157=step(abs(l9_151-l9_156),9.9999997e-06);
l9_155*=(l9_157+((1.0-float(l9_154))*(1.0-l9_157)));
l9_151=l9_156;
l9_119.y=l9_151;
l9_129=l9_155;
}
float2 l9_158=l9_119;
bool l9_159=l9_120;
float3x3 l9_160=l9_121;
if (l9_159)
{
l9_158=float2((l9_160*float3(l9_158,1.0)).xy);
}
float2 l9_161=l9_158;
float2 l9_162=l9_161;
float2 l9_163=l9_162;
l9_119=l9_163;
float l9_164=l9_119.x;
int l9_165=l9_122.x;
bool l9_166=l9_128;
float l9_167=l9_129;
if ((l9_165==0)||(l9_165==3))
{
float l9_168=l9_164;
float l9_169=0.0;
float l9_170=1.0;
bool l9_171=l9_166;
float l9_172=l9_167;
float l9_173=fast::clamp(l9_168,l9_169,l9_170);
float l9_174=step(abs(l9_168-l9_173),9.9999997e-06);
l9_172*=(l9_174+((1.0-float(l9_171))*(1.0-l9_174)));
l9_168=l9_173;
l9_164=l9_168;
l9_167=l9_172;
}
l9_119.x=l9_164;
l9_129=l9_167;
float l9_175=l9_119.y;
int l9_176=l9_122.y;
bool l9_177=l9_128;
float l9_178=l9_129;
if ((l9_176==0)||(l9_176==3))
{
float l9_179=l9_175;
float l9_180=0.0;
float l9_181=1.0;
bool l9_182=l9_177;
float l9_183=l9_178;
float l9_184=fast::clamp(l9_179,l9_180,l9_181);
float l9_185=step(abs(l9_179-l9_184),9.9999997e-06);
l9_183*=(l9_185+((1.0-float(l9_182))*(1.0-l9_185)));
l9_179=l9_184;
l9_175=l9_179;
l9_178=l9_183;
}
l9_119.y=l9_175;
l9_129=l9_178;
float2 l9_186=l9_119;
int l9_187=l9_117;
int l9_188=l9_118;
float l9_189=l9_127;
float2 l9_190=l9_186;
int l9_191=l9_187;
int l9_192=l9_188;
float3 l9_193=float3(0.0);
if (l9_191==0)
{
l9_193=float3(l9_190,0.0);
}
else
{
if (l9_191==1)
{
l9_193=float3(l9_190.x,(l9_190.y*0.5)+(0.5-(float(l9_192)*0.5)),0.0);
}
else
{
l9_193=float3(l9_190,float(l9_192));
}
}
float3 l9_194=l9_193;
float3 l9_195=l9_194;
float2 l9_196=l9_195.xy;
float l9_197=l9_189;
float4 l9_198=sc_set0.sPressure.sample(sc_set0.sPressureSmpSC,l9_196,bias(l9_197));
float4 l9_199=l9_198;
float4 l9_200=l9_199;
if (l9_125)
{
l9_200=mix(l9_126,l9_200,float4(l9_129));
}
float4 l9_201=l9_200;
l9_110=l9_201;
float4 l9_202=l9_110;
float4 l9_203=l9_202;
float l9_204=N2_pressureRange.x;
float l9_205=N2_pressureRange.y;
float l9_206=0.0;
float4 l9_207=l9_203;
float l9_208=l9_204;
float l9_209=l9_205;
float l9_210=0.99998999;
float4 l9_211=l9_207;
#if (1)
{
l9_211=floor((l9_211*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_212=dot(l9_211,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_213=l9_212;
float l9_214=0.0;
float l9_215=l9_210;
float l9_216=l9_208;
float l9_217=l9_209;
float l9_218=l9_216+(((l9_213-l9_214)*(l9_217-l9_216))/(l9_215-l9_214));
float l9_219=l9_218;
l9_206=l9_219;
float l9_220=l9_206;
float l9_221=l9_220;
float2 l9_222=l9_102;
float4 l9_223=float4(0.0);
int l9_224=0;
if ((int(sPressureHasSwappedViews_tmp)!=0))
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
l9_224=1-l9_226;
}
else
{
int l9_227=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_227=0;
}
else
{
l9_227=in.varStereoViewID;
}
int l9_228=l9_227;
l9_224=l9_228;
}
int l9_229=l9_224;
int l9_230=sPressureLayout_tmp;
int l9_231=l9_229;
float2 l9_232=l9_222;
bool l9_233=(int(SC_USE_UV_TRANSFORM_sPressure_tmp)!=0);
float3x3 l9_234=(*sc_set0.UserUniforms).sPressureTransform;
int2 l9_235=int2(SC_SOFTWARE_WRAP_MODE_U_sPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_sPressure_tmp);
bool l9_236=(int(SC_USE_UV_MIN_MAX_sPressure_tmp)!=0);
float4 l9_237=(*sc_set0.UserUniforms).sPressureUvMinMax;
bool l9_238=(int(SC_USE_CLAMP_TO_BORDER_sPressure_tmp)!=0);
float4 l9_239=(*sc_set0.UserUniforms).sPressureBorderColor;
float l9_240=0.0;
bool l9_241=l9_238&&(!l9_236);
float l9_242=1.0;
float l9_243=l9_232.x;
int l9_244=l9_235.x;
if (l9_244==1)
{
l9_243=fract(l9_243);
}
else
{
if (l9_244==2)
{
float l9_245=fract(l9_243);
float l9_246=l9_243-l9_245;
float l9_247=step(0.25,fract(l9_246*0.5));
l9_243=mix(l9_245,1.0-l9_245,fast::clamp(l9_247,0.0,1.0));
}
}
l9_232.x=l9_243;
float l9_248=l9_232.y;
int l9_249=l9_235.y;
if (l9_249==1)
{
l9_248=fract(l9_248);
}
else
{
if (l9_249==2)
{
float l9_250=fract(l9_248);
float l9_251=l9_248-l9_250;
float l9_252=step(0.25,fract(l9_251*0.5));
l9_248=mix(l9_250,1.0-l9_250,fast::clamp(l9_252,0.0,1.0));
}
}
l9_232.y=l9_248;
if (l9_236)
{
bool l9_253=l9_238;
bool l9_254;
if (l9_253)
{
l9_254=l9_235.x==3;
}
else
{
l9_254=l9_253;
}
float l9_255=l9_232.x;
float l9_256=l9_237.x;
float l9_257=l9_237.z;
bool l9_258=l9_254;
float l9_259=l9_242;
float l9_260=fast::clamp(l9_255,l9_256,l9_257);
float l9_261=step(abs(l9_255-l9_260),9.9999997e-06);
l9_259*=(l9_261+((1.0-float(l9_258))*(1.0-l9_261)));
l9_255=l9_260;
l9_232.x=l9_255;
l9_242=l9_259;
bool l9_262=l9_238;
bool l9_263;
if (l9_262)
{
l9_263=l9_235.y==3;
}
else
{
l9_263=l9_262;
}
float l9_264=l9_232.y;
float l9_265=l9_237.y;
float l9_266=l9_237.w;
bool l9_267=l9_263;
float l9_268=l9_242;
float l9_269=fast::clamp(l9_264,l9_265,l9_266);
float l9_270=step(abs(l9_264-l9_269),9.9999997e-06);
l9_268*=(l9_270+((1.0-float(l9_267))*(1.0-l9_270)));
l9_264=l9_269;
l9_232.y=l9_264;
l9_242=l9_268;
}
float2 l9_271=l9_232;
bool l9_272=l9_233;
float3x3 l9_273=l9_234;
if (l9_272)
{
l9_271=float2((l9_273*float3(l9_271,1.0)).xy);
}
float2 l9_274=l9_271;
float2 l9_275=l9_274;
float2 l9_276=l9_275;
l9_232=l9_276;
float l9_277=l9_232.x;
int l9_278=l9_235.x;
bool l9_279=l9_241;
float l9_280=l9_242;
if ((l9_278==0)||(l9_278==3))
{
float l9_281=l9_277;
float l9_282=0.0;
float l9_283=1.0;
bool l9_284=l9_279;
float l9_285=l9_280;
float l9_286=fast::clamp(l9_281,l9_282,l9_283);
float l9_287=step(abs(l9_281-l9_286),9.9999997e-06);
l9_285*=(l9_287+((1.0-float(l9_284))*(1.0-l9_287)));
l9_281=l9_286;
l9_277=l9_281;
l9_280=l9_285;
}
l9_232.x=l9_277;
l9_242=l9_280;
float l9_288=l9_232.y;
int l9_289=l9_235.y;
bool l9_290=l9_241;
float l9_291=l9_242;
if ((l9_289==0)||(l9_289==3))
{
float l9_292=l9_288;
float l9_293=0.0;
float l9_294=1.0;
bool l9_295=l9_290;
float l9_296=l9_291;
float l9_297=fast::clamp(l9_292,l9_293,l9_294);
float l9_298=step(abs(l9_292-l9_297),9.9999997e-06);
l9_296*=(l9_298+((1.0-float(l9_295))*(1.0-l9_298)));
l9_292=l9_297;
l9_288=l9_292;
l9_291=l9_296;
}
l9_232.y=l9_288;
l9_242=l9_291;
float2 l9_299=l9_232;
int l9_300=l9_230;
int l9_301=l9_231;
float l9_302=l9_240;
float2 l9_303=l9_299;
int l9_304=l9_300;
int l9_305=l9_301;
float3 l9_306=float3(0.0);
if (l9_304==0)
{
l9_306=float3(l9_303,0.0);
}
else
{
if (l9_304==1)
{
l9_306=float3(l9_303.x,(l9_303.y*0.5)+(0.5-(float(l9_305)*0.5)),0.0);
}
else
{
l9_306=float3(l9_303,float(l9_305));
}
}
float3 l9_307=l9_306;
float3 l9_308=l9_307;
float2 l9_309=l9_308.xy;
float l9_310=l9_302;
float4 l9_311=sc_set0.sPressure.sample(sc_set0.sPressureSmpSC,l9_309,bias(l9_310));
float4 l9_312=l9_311;
float4 l9_313=l9_312;
if (l9_238)
{
l9_313=mix(l9_239,l9_313,float4(l9_242));
}
float4 l9_314=l9_313;
l9_223=l9_314;
float4 l9_315=l9_223;
float4 l9_316=l9_315;
float l9_317=N2_pressureRange.x;
float l9_318=N2_pressureRange.y;
float l9_319=0.0;
float4 l9_320=l9_316;
float l9_321=l9_317;
float l9_322=l9_318;
float l9_323=0.99998999;
float4 l9_324=l9_320;
#if (1)
{
l9_324=floor((l9_324*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_325=dot(l9_324,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_326=l9_325;
float l9_327=0.0;
float l9_328=l9_323;
float l9_329=l9_321;
float l9_330=l9_322;
float l9_331=l9_329+(((l9_326-l9_327)*(l9_330-l9_329))/(l9_328-l9_327));
float l9_332=l9_331;
l9_319=l9_332;
float l9_333=l9_319;
float l9_334=l9_333;
float2 l9_335=l9_105;
float4 l9_336=float4(0.0);
int l9_337=0;
if ((int(sPressureHasSwappedViews_tmp)!=0))
{
int l9_338=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_338=0;
}
else
{
l9_338=in.varStereoViewID;
}
int l9_339=l9_338;
l9_337=1-l9_339;
}
else
{
int l9_340=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_340=0;
}
else
{
l9_340=in.varStereoViewID;
}
int l9_341=l9_340;
l9_337=l9_341;
}
int l9_342=l9_337;
int l9_343=sPressureLayout_tmp;
int l9_344=l9_342;
float2 l9_345=l9_335;
bool l9_346=(int(SC_USE_UV_TRANSFORM_sPressure_tmp)!=0);
float3x3 l9_347=(*sc_set0.UserUniforms).sPressureTransform;
int2 l9_348=int2(SC_SOFTWARE_WRAP_MODE_U_sPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_sPressure_tmp);
bool l9_349=(int(SC_USE_UV_MIN_MAX_sPressure_tmp)!=0);
float4 l9_350=(*sc_set0.UserUniforms).sPressureUvMinMax;
bool l9_351=(int(SC_USE_CLAMP_TO_BORDER_sPressure_tmp)!=0);
float4 l9_352=(*sc_set0.UserUniforms).sPressureBorderColor;
float l9_353=0.0;
bool l9_354=l9_351&&(!l9_349);
float l9_355=1.0;
float l9_356=l9_345.x;
int l9_357=l9_348.x;
if (l9_357==1)
{
l9_356=fract(l9_356);
}
else
{
if (l9_357==2)
{
float l9_358=fract(l9_356);
float l9_359=l9_356-l9_358;
float l9_360=step(0.25,fract(l9_359*0.5));
l9_356=mix(l9_358,1.0-l9_358,fast::clamp(l9_360,0.0,1.0));
}
}
l9_345.x=l9_356;
float l9_361=l9_345.y;
int l9_362=l9_348.y;
if (l9_362==1)
{
l9_361=fract(l9_361);
}
else
{
if (l9_362==2)
{
float l9_363=fract(l9_361);
float l9_364=l9_361-l9_363;
float l9_365=step(0.25,fract(l9_364*0.5));
l9_361=mix(l9_363,1.0-l9_363,fast::clamp(l9_365,0.0,1.0));
}
}
l9_345.y=l9_361;
if (l9_349)
{
bool l9_366=l9_351;
bool l9_367;
if (l9_366)
{
l9_367=l9_348.x==3;
}
else
{
l9_367=l9_366;
}
float l9_368=l9_345.x;
float l9_369=l9_350.x;
float l9_370=l9_350.z;
bool l9_371=l9_367;
float l9_372=l9_355;
float l9_373=fast::clamp(l9_368,l9_369,l9_370);
float l9_374=step(abs(l9_368-l9_373),9.9999997e-06);
l9_372*=(l9_374+((1.0-float(l9_371))*(1.0-l9_374)));
l9_368=l9_373;
l9_345.x=l9_368;
l9_355=l9_372;
bool l9_375=l9_351;
bool l9_376;
if (l9_375)
{
l9_376=l9_348.y==3;
}
else
{
l9_376=l9_375;
}
float l9_377=l9_345.y;
float l9_378=l9_350.y;
float l9_379=l9_350.w;
bool l9_380=l9_376;
float l9_381=l9_355;
float l9_382=fast::clamp(l9_377,l9_378,l9_379);
float l9_383=step(abs(l9_377-l9_382),9.9999997e-06);
l9_381*=(l9_383+((1.0-float(l9_380))*(1.0-l9_383)));
l9_377=l9_382;
l9_345.y=l9_377;
l9_355=l9_381;
}
float2 l9_384=l9_345;
bool l9_385=l9_346;
float3x3 l9_386=l9_347;
if (l9_385)
{
l9_384=float2((l9_386*float3(l9_384,1.0)).xy);
}
float2 l9_387=l9_384;
float2 l9_388=l9_387;
float2 l9_389=l9_388;
l9_345=l9_389;
float l9_390=l9_345.x;
int l9_391=l9_348.x;
bool l9_392=l9_354;
float l9_393=l9_355;
if ((l9_391==0)||(l9_391==3))
{
float l9_394=l9_390;
float l9_395=0.0;
float l9_396=1.0;
bool l9_397=l9_392;
float l9_398=l9_393;
float l9_399=fast::clamp(l9_394,l9_395,l9_396);
float l9_400=step(abs(l9_394-l9_399),9.9999997e-06);
l9_398*=(l9_400+((1.0-float(l9_397))*(1.0-l9_400)));
l9_394=l9_399;
l9_390=l9_394;
l9_393=l9_398;
}
l9_345.x=l9_390;
l9_355=l9_393;
float l9_401=l9_345.y;
int l9_402=l9_348.y;
bool l9_403=l9_354;
float l9_404=l9_355;
if ((l9_402==0)||(l9_402==3))
{
float l9_405=l9_401;
float l9_406=0.0;
float l9_407=1.0;
bool l9_408=l9_403;
float l9_409=l9_404;
float l9_410=fast::clamp(l9_405,l9_406,l9_407);
float l9_411=step(abs(l9_405-l9_410),9.9999997e-06);
l9_409*=(l9_411+((1.0-float(l9_408))*(1.0-l9_411)));
l9_405=l9_410;
l9_401=l9_405;
l9_404=l9_409;
}
l9_345.y=l9_401;
l9_355=l9_404;
float2 l9_412=l9_345;
int l9_413=l9_343;
int l9_414=l9_344;
float l9_415=l9_353;
float2 l9_416=l9_412;
int l9_417=l9_413;
int l9_418=l9_414;
float3 l9_419=float3(0.0);
if (l9_417==0)
{
l9_419=float3(l9_416,0.0);
}
else
{
if (l9_417==1)
{
l9_419=float3(l9_416.x,(l9_416.y*0.5)+(0.5-(float(l9_418)*0.5)),0.0);
}
else
{
l9_419=float3(l9_416,float(l9_418));
}
}
float3 l9_420=l9_419;
float3 l9_421=l9_420;
float2 l9_422=l9_421.xy;
float l9_423=l9_415;
float4 l9_424=sc_set0.sPressure.sample(sc_set0.sPressureSmpSC,l9_422,bias(l9_423));
float4 l9_425=l9_424;
float4 l9_426=l9_425;
if (l9_351)
{
l9_426=mix(l9_352,l9_426,float4(l9_355));
}
float4 l9_427=l9_426;
l9_336=l9_427;
float4 l9_428=l9_336;
float4 l9_429=l9_428;
float l9_430=N2_pressureRange.x;
float l9_431=N2_pressureRange.y;
float l9_432=0.0;
float4 l9_433=l9_429;
float l9_434=l9_430;
float l9_435=l9_431;
float l9_436=0.99998999;
float4 l9_437=l9_433;
#if (1)
{
l9_437=floor((l9_437*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_438=dot(l9_437,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_439=l9_438;
float l9_440=0.0;
float l9_441=l9_436;
float l9_442=l9_434;
float l9_443=l9_435;
float l9_444=l9_442+(((l9_439-l9_440)*(l9_443-l9_442))/(l9_441-l9_440));
float l9_445=l9_444;
l9_432=l9_445;
float l9_446=l9_432;
float l9_447=l9_446;
float2 l9_448=l9_108;
float4 l9_449=float4(0.0);
int l9_450=0;
if ((int(sPressureHasSwappedViews_tmp)!=0))
{
int l9_451=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_451=0;
}
else
{
l9_451=in.varStereoViewID;
}
int l9_452=l9_451;
l9_450=1-l9_452;
}
else
{
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
l9_450=l9_454;
}
int l9_455=l9_450;
int l9_456=sPressureLayout_tmp;
int l9_457=l9_455;
float2 l9_458=l9_448;
bool l9_459=(int(SC_USE_UV_TRANSFORM_sPressure_tmp)!=0);
float3x3 l9_460=(*sc_set0.UserUniforms).sPressureTransform;
int2 l9_461=int2(SC_SOFTWARE_WRAP_MODE_U_sPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_sPressure_tmp);
bool l9_462=(int(SC_USE_UV_MIN_MAX_sPressure_tmp)!=0);
float4 l9_463=(*sc_set0.UserUniforms).sPressureUvMinMax;
bool l9_464=(int(SC_USE_CLAMP_TO_BORDER_sPressure_tmp)!=0);
float4 l9_465=(*sc_set0.UserUniforms).sPressureBorderColor;
float l9_466=0.0;
bool l9_467=l9_464&&(!l9_462);
float l9_468=1.0;
float l9_469=l9_458.x;
int l9_470=l9_461.x;
if (l9_470==1)
{
l9_469=fract(l9_469);
}
else
{
if (l9_470==2)
{
float l9_471=fract(l9_469);
float l9_472=l9_469-l9_471;
float l9_473=step(0.25,fract(l9_472*0.5));
l9_469=mix(l9_471,1.0-l9_471,fast::clamp(l9_473,0.0,1.0));
}
}
l9_458.x=l9_469;
float l9_474=l9_458.y;
int l9_475=l9_461.y;
if (l9_475==1)
{
l9_474=fract(l9_474);
}
else
{
if (l9_475==2)
{
float l9_476=fract(l9_474);
float l9_477=l9_474-l9_476;
float l9_478=step(0.25,fract(l9_477*0.5));
l9_474=mix(l9_476,1.0-l9_476,fast::clamp(l9_478,0.0,1.0));
}
}
l9_458.y=l9_474;
if (l9_462)
{
bool l9_479=l9_464;
bool l9_480;
if (l9_479)
{
l9_480=l9_461.x==3;
}
else
{
l9_480=l9_479;
}
float l9_481=l9_458.x;
float l9_482=l9_463.x;
float l9_483=l9_463.z;
bool l9_484=l9_480;
float l9_485=l9_468;
float l9_486=fast::clamp(l9_481,l9_482,l9_483);
float l9_487=step(abs(l9_481-l9_486),9.9999997e-06);
l9_485*=(l9_487+((1.0-float(l9_484))*(1.0-l9_487)));
l9_481=l9_486;
l9_458.x=l9_481;
l9_468=l9_485;
bool l9_488=l9_464;
bool l9_489;
if (l9_488)
{
l9_489=l9_461.y==3;
}
else
{
l9_489=l9_488;
}
float l9_490=l9_458.y;
float l9_491=l9_463.y;
float l9_492=l9_463.w;
bool l9_493=l9_489;
float l9_494=l9_468;
float l9_495=fast::clamp(l9_490,l9_491,l9_492);
float l9_496=step(abs(l9_490-l9_495),9.9999997e-06);
l9_494*=(l9_496+((1.0-float(l9_493))*(1.0-l9_496)));
l9_490=l9_495;
l9_458.y=l9_490;
l9_468=l9_494;
}
float2 l9_497=l9_458;
bool l9_498=l9_459;
float3x3 l9_499=l9_460;
if (l9_498)
{
l9_497=float2((l9_499*float3(l9_497,1.0)).xy);
}
float2 l9_500=l9_497;
float2 l9_501=l9_500;
float2 l9_502=l9_501;
l9_458=l9_502;
float l9_503=l9_458.x;
int l9_504=l9_461.x;
bool l9_505=l9_467;
float l9_506=l9_468;
if ((l9_504==0)||(l9_504==3))
{
float l9_507=l9_503;
float l9_508=0.0;
float l9_509=1.0;
bool l9_510=l9_505;
float l9_511=l9_506;
float l9_512=fast::clamp(l9_507,l9_508,l9_509);
float l9_513=step(abs(l9_507-l9_512),9.9999997e-06);
l9_511*=(l9_513+((1.0-float(l9_510))*(1.0-l9_513)));
l9_507=l9_512;
l9_503=l9_507;
l9_506=l9_511;
}
l9_458.x=l9_503;
l9_468=l9_506;
float l9_514=l9_458.y;
int l9_515=l9_461.y;
bool l9_516=l9_467;
float l9_517=l9_468;
if ((l9_515==0)||(l9_515==3))
{
float l9_518=l9_514;
float l9_519=0.0;
float l9_520=1.0;
bool l9_521=l9_516;
float l9_522=l9_517;
float l9_523=fast::clamp(l9_518,l9_519,l9_520);
float l9_524=step(abs(l9_518-l9_523),9.9999997e-06);
l9_522*=(l9_524+((1.0-float(l9_521))*(1.0-l9_524)));
l9_518=l9_523;
l9_514=l9_518;
l9_517=l9_522;
}
l9_458.y=l9_514;
l9_468=l9_517;
float2 l9_525=l9_458;
int l9_526=l9_456;
int l9_527=l9_457;
float l9_528=l9_466;
float2 l9_529=l9_525;
int l9_530=l9_526;
int l9_531=l9_527;
float3 l9_532=float3(0.0);
if (l9_530==0)
{
l9_532=float3(l9_529,0.0);
}
else
{
if (l9_530==1)
{
l9_532=float3(l9_529.x,(l9_529.y*0.5)+(0.5-(float(l9_531)*0.5)),0.0);
}
else
{
l9_532=float3(l9_529,float(l9_531));
}
}
float3 l9_533=l9_532;
float3 l9_534=l9_533;
float2 l9_535=l9_534.xy;
float l9_536=l9_528;
float4 l9_537=sc_set0.sPressure.sample(sc_set0.sPressureSmpSC,l9_535,bias(l9_536));
float4 l9_538=l9_537;
float4 l9_539=l9_538;
if (l9_464)
{
l9_539=mix(l9_465,l9_539,float4(l9_468));
}
float4 l9_540=l9_539;
l9_449=l9_540;
float4 l9_541=l9_449;
float4 l9_542=l9_541;
float l9_543=N2_pressureRange.x;
float l9_544=N2_pressureRange.y;
float l9_545=0.0;
float4 l9_546=l9_542;
float l9_547=l9_543;
float l9_548=l9_544;
float l9_549=0.99998999;
float4 l9_550=l9_546;
#if (1)
{
l9_550=floor((l9_550*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_551=dot(l9_550,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_552=l9_551;
float l9_553=0.0;
float l9_554=l9_549;
float l9_555=l9_547;
float l9_556=l9_548;
float l9_557=l9_555+(((l9_552-l9_553)*(l9_556-l9_555))/(l9_554-l9_553));
float l9_558=l9_557;
l9_545=l9_558;
float l9_559=l9_545;
float l9_560=l9_559;
float l9_561=mix(l9_221,l9_334,l9_96.x);
float l9_562=mix(l9_334,l9_221,l9_96.y);
float l9_563=mix(l9_447,l9_560,l9_96.z);
float l9_564=mix(l9_560,l9_447,l9_96.w);
float2 l9_565=l9_1;
float4 l9_566=float4(0.0);
int l9_567=0;
if ((int(sDivergenceHasSwappedViews_tmp)!=0))
{
int l9_568=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_568=0;
}
else
{
l9_568=in.varStereoViewID;
}
int l9_569=l9_568;
l9_567=1-l9_569;
}
else
{
int l9_570=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_570=0;
}
else
{
l9_570=in.varStereoViewID;
}
int l9_571=l9_570;
l9_567=l9_571;
}
int l9_572=l9_567;
int l9_573=sDivergenceLayout_tmp;
int l9_574=l9_572;
float2 l9_575=l9_565;
bool l9_576=(int(SC_USE_UV_TRANSFORM_sDivergence_tmp)!=0);
float3x3 l9_577=(*sc_set0.UserUniforms).sDivergenceTransform;
int2 l9_578=int2(SC_SOFTWARE_WRAP_MODE_U_sDivergence_tmp,SC_SOFTWARE_WRAP_MODE_V_sDivergence_tmp);
bool l9_579=(int(SC_USE_UV_MIN_MAX_sDivergence_tmp)!=0);
float4 l9_580=(*sc_set0.UserUniforms).sDivergenceUvMinMax;
bool l9_581=(int(SC_USE_CLAMP_TO_BORDER_sDivergence_tmp)!=0);
float4 l9_582=(*sc_set0.UserUniforms).sDivergenceBorderColor;
float l9_583=0.0;
bool l9_584=l9_581&&(!l9_579);
float l9_585=1.0;
float l9_586=l9_575.x;
int l9_587=l9_578.x;
if (l9_587==1)
{
l9_586=fract(l9_586);
}
else
{
if (l9_587==2)
{
float l9_588=fract(l9_586);
float l9_589=l9_586-l9_588;
float l9_590=step(0.25,fract(l9_589*0.5));
l9_586=mix(l9_588,1.0-l9_588,fast::clamp(l9_590,0.0,1.0));
}
}
l9_575.x=l9_586;
float l9_591=l9_575.y;
int l9_592=l9_578.y;
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
l9_575.y=l9_591;
if (l9_579)
{
bool l9_596=l9_581;
bool l9_597;
if (l9_596)
{
l9_597=l9_578.x==3;
}
else
{
l9_597=l9_596;
}
float l9_598=l9_575.x;
float l9_599=l9_580.x;
float l9_600=l9_580.z;
bool l9_601=l9_597;
float l9_602=l9_585;
float l9_603=fast::clamp(l9_598,l9_599,l9_600);
float l9_604=step(abs(l9_598-l9_603),9.9999997e-06);
l9_602*=(l9_604+((1.0-float(l9_601))*(1.0-l9_604)));
l9_598=l9_603;
l9_575.x=l9_598;
l9_585=l9_602;
bool l9_605=l9_581;
bool l9_606;
if (l9_605)
{
l9_606=l9_578.y==3;
}
else
{
l9_606=l9_605;
}
float l9_607=l9_575.y;
float l9_608=l9_580.y;
float l9_609=l9_580.w;
bool l9_610=l9_606;
float l9_611=l9_585;
float l9_612=fast::clamp(l9_607,l9_608,l9_609);
float l9_613=step(abs(l9_607-l9_612),9.9999997e-06);
l9_611*=(l9_613+((1.0-float(l9_610))*(1.0-l9_613)));
l9_607=l9_612;
l9_575.y=l9_607;
l9_585=l9_611;
}
float2 l9_614=l9_575;
bool l9_615=l9_576;
float3x3 l9_616=l9_577;
if (l9_615)
{
l9_614=float2((l9_616*float3(l9_614,1.0)).xy);
}
float2 l9_617=l9_614;
float2 l9_618=l9_617;
float2 l9_619=l9_618;
l9_575=l9_619;
float l9_620=l9_575.x;
int l9_621=l9_578.x;
bool l9_622=l9_584;
float l9_623=l9_585;
if ((l9_621==0)||(l9_621==3))
{
float l9_624=l9_620;
float l9_625=0.0;
float l9_626=1.0;
bool l9_627=l9_622;
float l9_628=l9_623;
float l9_629=fast::clamp(l9_624,l9_625,l9_626);
float l9_630=step(abs(l9_624-l9_629),9.9999997e-06);
l9_628*=(l9_630+((1.0-float(l9_627))*(1.0-l9_630)));
l9_624=l9_629;
l9_620=l9_624;
l9_623=l9_628;
}
l9_575.x=l9_620;
l9_585=l9_623;
float l9_631=l9_575.y;
int l9_632=l9_578.y;
bool l9_633=l9_584;
float l9_634=l9_585;
if ((l9_632==0)||(l9_632==3))
{
float l9_635=l9_631;
float l9_636=0.0;
float l9_637=1.0;
bool l9_638=l9_633;
float l9_639=l9_634;
float l9_640=fast::clamp(l9_635,l9_636,l9_637);
float l9_641=step(abs(l9_635-l9_640),9.9999997e-06);
l9_639*=(l9_641+((1.0-float(l9_638))*(1.0-l9_641)));
l9_635=l9_640;
l9_631=l9_635;
l9_634=l9_639;
}
l9_575.y=l9_631;
l9_585=l9_634;
float2 l9_642=l9_575;
int l9_643=l9_573;
int l9_644=l9_574;
float l9_645=l9_583;
float2 l9_646=l9_642;
int l9_647=l9_643;
int l9_648=l9_644;
float3 l9_649=float3(0.0);
if (l9_647==0)
{
l9_649=float3(l9_646,0.0);
}
else
{
if (l9_647==1)
{
l9_649=float3(l9_646.x,(l9_646.y*0.5)+(0.5-(float(l9_648)*0.5)),0.0);
}
else
{
l9_649=float3(l9_646,float(l9_648));
}
}
float3 l9_650=l9_649;
float3 l9_651=l9_650;
float2 l9_652=l9_651.xy;
float l9_653=l9_645;
float4 l9_654=sc_set0.sDivergence.sample(sc_set0.sDivergenceSmpSC,l9_652,bias(l9_653));
float4 l9_655=l9_654;
float4 l9_656=l9_655;
if (l9_581)
{
l9_656=mix(l9_582,l9_656,float4(l9_585));
}
float4 l9_657=l9_656;
l9_566=l9_657;
float4 l9_658=l9_566;
float4 l9_659=l9_658;
float l9_660=N2_divergenceRange.x;
float l9_661=N2_divergenceRange.y;
float l9_662=0.0;
float4 l9_663=l9_659;
float l9_664=l9_660;
float l9_665=l9_661;
float l9_666=0.99998999;
float4 l9_667=l9_663;
#if (1)
{
l9_667=floor((l9_667*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_668=dot(l9_667,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_669=l9_668;
float l9_670=0.0;
float l9_671=l9_666;
float l9_672=l9_664;
float l9_673=l9_665;
float l9_674=l9_672+(((l9_669-l9_670)*(l9_673-l9_672))/(l9_671-l9_670));
float l9_675=l9_674;
l9_662=l9_675;
float l9_676=l9_662;
float l9_677=l9_676*N2_alpha;
float l9_678=(((l9_561+l9_562)+l9_563)+l9_564)+l9_677;
l9_678*=0.25;
if (N2_reset>0)
{
l9_678=0.0;
}
float l9_679=l9_678;
float l9_680=N2_pressureRange.x;
float l9_681=N2_pressureRange.y;
float4 l9_682=float4(0.0);
float l9_683=l9_679;
float l9_684=l9_680;
float l9_685=l9_681;
float l9_686=0.99998999;
float l9_687=fast::clamp(l9_683,l9_684,l9_685);
float l9_688=l9_684;
float l9_689=l9_685;
float l9_690=0.0;
float l9_691=l9_686;
float l9_692=l9_690+(((l9_687-l9_688)*(l9_691-l9_690))/(l9_689-l9_688));
float l9_693=l9_692;
float4 l9_694=float4(1.0,255.0,65025.0,16581375.0)*l9_693;
l9_694=fract(l9_694);
l9_694-=(l9_694.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_695=l9_694;
float4 l9_696=l9_695;
l9_682=l9_696;
float4 l9_697=l9_682;
N2_pressureOut=l9_697;
param_8=N2_pressureOut;
pressureOut_N2=param_8;
FinalColor=pressureOut_N2;
float param_10=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_10<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_698=gl_FragCoord;
float2 l9_699=floor(mod(l9_698.xy,float2(4.0)));
float l9_700=(mod(dot(l9_699,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_10<l9_700)
{
discard_fragment();
}
}
float4 param_11=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_701=param_11;
float4 l9_702=l9_701;
float l9_703=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_703=l9_702.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_703=fast::clamp(l9_702.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_703=fast::clamp(dot(l9_702.xyz,float3(l9_702.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_703=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_703=(1.0-dot(l9_702.xyz,float3(0.33333001)))*l9_702.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_703=(1.0-fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0))*l9_702.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_703=fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0)*l9_702.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_703=fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_703=fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0)*l9_702.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_703=dot(l9_702.xyz,float3(0.33333001))*l9_702.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_703=1.0-fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_703=fast::clamp(dot(l9_702.xyz,float3(1.0)),0.0,1.0);
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
float l9_704=l9_703;
float l9_705=l9_704;
float l9_706=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_705;
float3 l9_707=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_701.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_708=float4(l9_707.x,l9_707.y,l9_707.z,l9_706);
param_11=l9_708;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_11=float4(param_11.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_709=param_11;
float4 l9_710=float4(0.0);
float4 l9_711=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_712=out.FragColor0;
float4 l9_713=l9_712;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_713.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_714=l9_713;
l9_711=l9_714;
}
else
{
float4 l9_715=gl_FragCoord;
float2 l9_716=l9_715.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_717=l9_716;
float2 l9_718=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_719=1;
int l9_720=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_720=0;
}
else
{
l9_720=in.varStereoViewID;
}
int l9_721=l9_720;
int l9_722=l9_721;
float3 l9_723=float3(l9_717,0.0);
int l9_724=l9_719;
int l9_725=l9_722;
if (l9_724==1)
{
l9_723.y=((2.0*l9_723.y)+float(l9_725))-1.0;
}
float2 l9_726=l9_723.xy;
l9_718=l9_726;
}
else
{
l9_718=l9_717;
}
float2 l9_727=l9_718;
float2 l9_728=l9_727;
float2 l9_729=l9_728;
int l9_730=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_731=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_731=0;
}
else
{
l9_731=in.varStereoViewID;
}
int l9_732=l9_731;
l9_730=1-l9_732;
}
else
{
int l9_733=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_733=0;
}
else
{
l9_733=in.varStereoViewID;
}
int l9_734=l9_733;
l9_730=l9_734;
}
int l9_735=l9_730;
float2 l9_736=l9_729;
int l9_737=l9_735;
float2 l9_738=l9_736;
int l9_739=l9_737;
float l9_740=0.0;
float4 l9_741=float4(0.0);
float2 l9_742=l9_738;
int l9_743=sc_ScreenTextureLayout_tmp;
int l9_744=l9_739;
float l9_745=l9_740;
float2 l9_746=l9_742;
int l9_747=l9_743;
int l9_748=l9_744;
float3 l9_749=float3(0.0);
if (l9_747==0)
{
l9_749=float3(l9_746,0.0);
}
else
{
if (l9_747==1)
{
l9_749=float3(l9_746.x,(l9_746.y*0.5)+(0.5-(float(l9_748)*0.5)),0.0);
}
else
{
l9_749=float3(l9_746,float(l9_748));
}
}
float3 l9_750=l9_749;
float3 l9_751=l9_750;
float2 l9_752=l9_751.xy;
float l9_753=l9_745;
float4 l9_754=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_752,bias(l9_753));
float4 l9_755=l9_754;
l9_741=l9_755;
float4 l9_756=l9_741;
float4 l9_757=l9_756;
float4 l9_758=l9_757;
l9_711=l9_758;
}
float4 l9_759=l9_711;
float4 l9_760=l9_759;
float3 l9_761=l9_760.xyz;
float3 l9_762=l9_761;
float3 l9_763=l9_709.xyz;
float3 l9_764=definedBlend(l9_762,l9_763,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_710=float4(l9_764.x,l9_764.y,l9_764.z,l9_710.w);
float3 l9_765=mix(l9_761,l9_710.xyz,float3(l9_709.w));
l9_710=float4(l9_765.x,l9_765.y,l9_765.z,l9_710.w);
l9_710.w=1.0;
float4 l9_766=l9_710;
param_11=l9_766;
}
else
{
float4 l9_767=param_11;
float4 l9_768=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_768=float4(mix(float3(1.0),l9_767.xyz,float3(l9_767.w)),l9_767.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_769=l9_767.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_769=fast::clamp(l9_769,0.0,1.0);
}
l9_768=float4(l9_767.xyz*l9_769,l9_769);
}
else
{
l9_768=l9_767;
}
}
float4 l9_770=l9_768;
param_11=l9_770;
}
}
}
float4 l9_771=param_11;
FinalColor=l9_771;
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
float4 l9_772=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_772=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_772=float4(0.0);
}
float4 l9_773=l9_772;
float4 Cost=l9_773;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_12=in.varPos;
float4 param_13=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_12,param_13,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_14=FinalColor;
float4 l9_774=param_14;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_774.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_774;
return out;
}
} // FRAGMENT SHADER
