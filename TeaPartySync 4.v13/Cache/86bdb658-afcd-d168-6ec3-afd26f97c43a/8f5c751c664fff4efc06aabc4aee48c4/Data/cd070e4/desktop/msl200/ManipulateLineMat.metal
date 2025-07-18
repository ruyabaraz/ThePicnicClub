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
//attribute vec3 direction 19
//attribute vec3 prevSegment 20
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler intensityTextureSmpSC 0:16
//sampler sampler sc_ScreenTextureSmpSC 0:21
//texture texture2D intensityTexture 0:1:0:16
//texture texture2D sc_ScreenTexture 0:13:0:21
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:24:4448 {
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
//int PreviewNodeID 4120
//float alphaTestThreshold 4124
//float startWidth 4128
//float endWidth 4132
//int visualStyle 4136
//float4 startColor 4144
//float4 endColor 4160
//float maxAlpha 4176
//bool Port_Value_N008 4180
//float Port_Input1_N014 4236
//float Port_Value3_N040 4288
//float Port_Value3_N060 4320
//float Port_Position1_N073 4376
//float Port_Value2_N067 4380
//float Port_Position2_N073 4384
//float Port_Position1_N070 4388
//float Port_Position1_N066 4392
//float4 Port_Value0_N077 4400
//float Port_Position1_N077 4416
//float4 Port_Value2_N077 4432
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
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 32 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 33 0
//spec_const bool UseViewSpaceDepthVariant 34 1
//spec_const bool intensityTextureHasSwappedViews 35 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 36 0
//spec_const bool sc_BlendMode_Add 37 0
//spec_const bool sc_BlendMode_AlphaTest 38 0
//spec_const bool sc_BlendMode_AlphaToCoverage 39 0
//spec_const bool sc_BlendMode_ColoredGlass 40 0
//spec_const bool sc_BlendMode_Custom 41 0
//spec_const bool sc_BlendMode_Max 42 0
//spec_const bool sc_BlendMode_Min 43 0
//spec_const bool sc_BlendMode_MultiplyOriginal 44 0
//spec_const bool sc_BlendMode_Multiply 45 0
//spec_const bool sc_BlendMode_Normal 46 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 47 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 48 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 49 0
//spec_const bool sc_BlendMode_Screen 50 0
//spec_const bool sc_BlendMode_Software 51 0
//spec_const bool sc_DepthOnly 52 0
//spec_const bool sc_FramebufferFetch 53 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 54 0
//spec_const bool sc_IsEditor 55 0
//spec_const bool sc_MotionVectorsPass 56 0
//spec_const bool sc_OITCompositingPass 57 0
//spec_const bool sc_OITDepthBoundsPass 58 0
//spec_const bool sc_OITDepthGatherPass 59 0
//spec_const bool sc_ProjectiveShadowsCaster 60 0
//spec_const bool sc_ProjectiveShadowsReceiver 61 0
//spec_const bool sc_RenderAlphaToColor 62 0
//spec_const bool sc_ScreenTextureHasSwappedViews 63 0
//spec_const bool sc_ShaderComplexityAnalyzer 64 0
//spec_const bool sc_TAAEnabled 65 0
//spec_const bool sc_UseFramebufferFetchMarker 66 0
//spec_const bool sc_VertexBlendingUseNormals 67 0
//spec_const bool sc_VertexBlending 68 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 69 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 70 -1
//spec_const int intensityTextureLayout 71 0
//spec_const int sc_DepthBufferMode 72 0
//spec_const int sc_RenderingSpace 73 -1
//spec_const int sc_ScreenTextureLayout 74 0
//spec_const int sc_ShaderCacheConstant 75 0
//spec_const int sc_SkinBonesCount 76 0
//spec_const int sc_StereoRenderingMode 77 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 78 0
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
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(32)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(33)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(34)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(35)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(36)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(37)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(38)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(39)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(40)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(41)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(42)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(43)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(44)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(45)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(46)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(47)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(48)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(49)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(50)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_BlendMode_Software [[function_constant(51)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_DepthOnly [[function_constant(52)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(53)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(54)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_IsEditor [[function_constant(55)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_MotionVectorsPass [[function_constant(56)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(57)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(58)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(59)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(60)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(61)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(62)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(63)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(64)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(65)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(66)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(67)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(68)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(69)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(70)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int intensityTextureLayout [[function_constant(71)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(72)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(73)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(74)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(75)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(76)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(77)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(78)]];
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float3 SurfacePosition_WorldSpace;
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
float startWidth;
float endWidth;
int visualStyle;
float4 startColor;
float4 endColor;
float maxAlpha;
int Port_Value_N008;
float3 Port_Import_N042;
float3 Port_Import_N043;
float Port_Import_N020;
float Port_Import_N021;
float Port_Import_N019;
float Port_Input1_N014;
float Port_Import_N044;
float3 Port_Import_N052;
float3 Port_Import_N016;
float Port_Value3_N040;
float Port_Import_N064;
float3 Port_Import_N028;
float Port_Value3_N060;
float Port_Import_N074;
float4 Port_Import_N032;
float4 Port_Import_N033;
float Port_Import_N034;
float Port_Import_N076;
float Port_Position1_N073;
float Port_Value2_N067;
float Port_Position2_N073;
float Port_Position1_N070;
float Port_Position1_N066;
float4 Port_Value0_N077;
float Port_Position1_N077;
float4 Port_Value2_N077;
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
texture2d<float> sc_ScreenTexture [[id(13)]];
sampler intensityTextureSmpSC [[id(16)]];
sampler sc_ScreenTextureSmpSC [[id(21)]];
constant userUniformsObj* UserUniforms [[id(24)]];
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
float3 direction [[attribute(19)]];
float3 prevSegment [[attribute(20)]];
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
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=v.texture0;
Globals.SurfacePosition_WorldSpace=out.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 Result_N3=float3(0.0);
float param_1=0.0;
float3 param_2=float3(0.0);
float3 param_3=float3(1.0,0.0,0.0);
ssGlobals param_5=Globals;
float2 l9_119=float2(0.0);
l9_119=param_5.Surface_UVCoord0;
float l9_120=0.0;
float2 l9_121=l9_119;
float l9_122=l9_121.x;
l9_120=l9_122;
param_1=l9_120;
float3 param_4;
if ((param_1*1.0)!=0.0)
{
float3 l9_123=float3(0.0);
l9_123=param_5.SurfacePosition_WorldSpace;
float3 l9_124=float3(0.0);
float l9_125=0.0;
float3 l9_126=float3(0.0);
float3 l9_127=float3(0.0);
ssGlobals l9_128=param_5;
float l9_129=0.0;
bool l9_130=(*sc_set0.UserUniforms).Port_Value_N008!=0;
float l9_131=l9_130 ? 1.001 : 0.001;
l9_131-=0.001;
l9_129=l9_131;
l9_125=l9_129;
float3 l9_132;
if ((l9_125*1.0)!=0.0)
{
float3 l9_133=float3(0.0);
l9_133=l9_128.ViewDirWS;
float3 l9_134=float3(0.0);
l9_134=l9_133;
float3 l9_135=float3(0.0);
float3 l9_136=l9_134;
float l9_137=dot(l9_136,l9_136);
float l9_138;
if (l9_137>0.0)
{
l9_138=1.0/sqrt(l9_137);
}
else
{
l9_138=0.0;
}
float l9_139=l9_138;
float3 l9_140=l9_136*l9_139;
l9_135=l9_140;
float3 l9_141=float3(0.0);
float3 l9_142=float3(in.direction);
l9_141=l9_142;
float3 l9_143=float3(0.0);
l9_143=l9_141;
float3 l9_144=float3(0.0);
float3 l9_145=l9_143;
float l9_146=dot(l9_145,l9_145);
float l9_147;
if (l9_146>0.0)
{
l9_147=1.0/sqrt(l9_146);
}
else
{
l9_147=0.0;
}
float l9_148=l9_147;
float3 l9_149=l9_145*l9_148;
l9_144=l9_149;
float3 l9_150=float3(0.0);
l9_150=cross(l9_135,l9_144);
float3 l9_151=float3(0.0);
float3 l9_152=l9_150;
float l9_153=dot(l9_152,l9_152);
float l9_154;
if (l9_153>0.0)
{
l9_154=1.0/sqrt(l9_153);
}
else
{
l9_154=0.0;
}
float l9_155=l9_154;
float3 l9_156=l9_152*l9_155;
l9_151=l9_156;
float l9_157=0.0;
float l9_158=(*sc_set0.UserUniforms).startWidth;
l9_157=l9_158;
float l9_159=0.0;
l9_159=l9_157;
float2 l9_160=float2(0.0);
l9_160=l9_128.Surface_UVCoord0;
float l9_161=0.0;
float2 l9_162=l9_160;
float l9_163=l9_162.y;
l9_161=l9_163;
float l9_164=0.0;
l9_164=l9_161;
float l9_165=0.0;
l9_165=l9_159*l9_164;
float l9_166=0.0;
float l9_167=(*sc_set0.UserUniforms).endWidth;
l9_166=l9_167;
float l9_168=0.0;
l9_168=l9_166;
float l9_169=0.0;
l9_169=1.0-l9_164;
float l9_170=0.0;
l9_170=l9_168*l9_169;
float l9_171=0.0;
l9_171=l9_165+l9_170;
float l9_172=0.0;
l9_172=l9_171/(*sc_set0.UserUniforms).Port_Input1_N014;
float l9_173=0.0;
l9_173=l9_172;
float l9_174=0.0;
l9_174=l9_173;
float3 l9_175=float3(0.0);
float3 l9_176=float3(in.prevSegment);
l9_175=l9_176;
float3 l9_177=float3(0.0);
l9_177=l9_175;
float3 l9_178=float3(0.0);
float3 l9_179=l9_177;
float l9_180=dot(l9_179,l9_179);
float l9_181;
if (l9_180>0.0)
{
l9_181=1.0/sqrt(l9_180);
}
else
{
l9_181=0.0;
}
float l9_182=l9_181;
float3 l9_183=l9_179*l9_182;
l9_178=l9_183;
float3 l9_184=float3(0.0);
l9_184=cross(l9_134,l9_178);
float l9_185=0.0;
l9_185=dot(l9_151,l9_184);
float l9_186=0.0;
l9_186=l9_174/l9_185;
float3 l9_187=float3(0.0);
l9_187=l9_151*float3(l9_186);
float3 l9_188=float3(0.0);
l9_188=l9_187;
l9_126=l9_188;
l9_132=l9_126;
}
else
{
float3 l9_189=float3(0.0);
float3 l9_190=float3(in.direction);
l9_189=l9_190;
float3 l9_191=float3(0.0);
l9_191=l9_189;
float l9_192=0.0;
float l9_193=0.0;
float3 l9_194=l9_191;
float l9_195=l9_194.x;
float l9_196=l9_194.y;
l9_192=l9_195;
l9_193=l9_196;
float l9_197=0.0;
l9_197=-l9_193;
float3 l9_198=float3(0.0);
l9_198.x=l9_197;
l9_198.y=l9_192;
l9_198.z=(*sc_set0.UserUniforms).Port_Value3_N040;
float l9_199=0.0;
float l9_200=(*sc_set0.UserUniforms).startWidth;
l9_199=l9_200;
float l9_201=0.0;
l9_201=l9_199;
float2 l9_202=float2(0.0);
l9_202=l9_128.Surface_UVCoord0;
float l9_203=0.0;
float2 l9_204=l9_202;
float l9_205=l9_204.y;
l9_203=l9_205;
float l9_206=0.0;
l9_206=l9_203;
float l9_207=0.0;
l9_207=l9_201*l9_206;
float l9_208=0.0;
float l9_209=(*sc_set0.UserUniforms).endWidth;
l9_208=l9_209;
float l9_210=0.0;
l9_210=l9_208;
float l9_211=0.0;
l9_211=1.0-l9_206;
float l9_212=0.0;
l9_212=l9_210*l9_211;
float l9_213=0.0;
l9_213=l9_207+l9_212;
float l9_214=0.0;
l9_214=l9_213/(*sc_set0.UserUniforms).Port_Input1_N014;
float l9_215=0.0;
l9_215=l9_214;
float l9_216=0.0;
l9_216=l9_215;
float3 l9_217=float3(0.0);
float3 l9_218=float3(in.prevSegment);
l9_217=l9_218;
float3 l9_219=float3(0.0);
l9_219=l9_217;
float l9_220=0.0;
float l9_221=0.0;
float3 l9_222=l9_219;
float l9_223=l9_222.x;
float l9_224=l9_222.y;
l9_220=l9_223;
l9_221=l9_224;
float l9_225=0.0;
l9_225=-l9_221;
float3 l9_226=float3(0.0);
l9_226.x=l9_225;
l9_226.y=l9_220;
l9_226.z=(*sc_set0.UserUniforms).Port_Value3_N060;
float l9_227=0.0;
l9_227=dot(l9_198,l9_226);
float l9_228=0.0;
l9_228=l9_216/l9_227;
float3 l9_229=float3(0.0);
l9_229=l9_198*float3(l9_228);
float3 l9_230=float3(0.0);
l9_230=l9_229;
l9_127=l9_230;
l9_132=l9_127;
}
l9_124=l9_132;
float3 l9_231=float3(0.0);
l9_231=l9_123-l9_124;
param_2=l9_231;
param_4=param_2;
}
else
{
float3 l9_232=float3(0.0);
l9_232=param_5.SurfacePosition_WorldSpace;
float3 l9_233=float3(0.0);
float l9_234=0.0;
float3 l9_235=float3(0.0);
float3 l9_236=float3(0.0);
ssGlobals l9_237=param_5;
float l9_238=0.0;
bool l9_239=(*sc_set0.UserUniforms).Port_Value_N008!=0;
float l9_240=l9_239 ? 1.001 : 0.001;
l9_240-=0.001;
l9_238=l9_240;
l9_234=l9_238;
float3 l9_241;
if ((l9_234*1.0)!=0.0)
{
float3 l9_242=float3(0.0);
l9_242=l9_237.ViewDirWS;
float3 l9_243=float3(0.0);
l9_243=l9_242;
float3 l9_244=float3(0.0);
float3 l9_245=l9_243;
float l9_246=dot(l9_245,l9_245);
float l9_247;
if (l9_246>0.0)
{
l9_247=1.0/sqrt(l9_246);
}
else
{
l9_247=0.0;
}
float l9_248=l9_247;
float3 l9_249=l9_245*l9_248;
l9_244=l9_249;
float3 l9_250=float3(0.0);
float3 l9_251=float3(in.direction);
l9_250=l9_251;
float3 l9_252=float3(0.0);
l9_252=l9_250;
float3 l9_253=float3(0.0);
float3 l9_254=l9_252;
float l9_255=dot(l9_254,l9_254);
float l9_256;
if (l9_255>0.0)
{
l9_256=1.0/sqrt(l9_255);
}
else
{
l9_256=0.0;
}
float l9_257=l9_256;
float3 l9_258=l9_254*l9_257;
l9_253=l9_258;
float3 l9_259=float3(0.0);
l9_259=cross(l9_244,l9_253);
float3 l9_260=float3(0.0);
float3 l9_261=l9_259;
float l9_262=dot(l9_261,l9_261);
float l9_263;
if (l9_262>0.0)
{
l9_263=1.0/sqrt(l9_262);
}
else
{
l9_263=0.0;
}
float l9_264=l9_263;
float3 l9_265=l9_261*l9_264;
l9_260=l9_265;
float l9_266=0.0;
float l9_267=(*sc_set0.UserUniforms).startWidth;
l9_266=l9_267;
float l9_268=0.0;
l9_268=l9_266;
float2 l9_269=float2(0.0);
l9_269=l9_237.Surface_UVCoord0;
float l9_270=0.0;
float2 l9_271=l9_269;
float l9_272=l9_271.y;
l9_270=l9_272;
float l9_273=0.0;
l9_273=l9_270;
float l9_274=0.0;
l9_274=l9_268*l9_273;
float l9_275=0.0;
float l9_276=(*sc_set0.UserUniforms).endWidth;
l9_275=l9_276;
float l9_277=0.0;
l9_277=l9_275;
float l9_278=0.0;
l9_278=1.0-l9_273;
float l9_279=0.0;
l9_279=l9_277*l9_278;
float l9_280=0.0;
l9_280=l9_274+l9_279;
float l9_281=0.0;
l9_281=l9_280/(*sc_set0.UserUniforms).Port_Input1_N014;
float l9_282=0.0;
l9_282=l9_281;
float l9_283=0.0;
l9_283=l9_282;
float3 l9_284=float3(0.0);
float3 l9_285=float3(in.prevSegment);
l9_284=l9_285;
float3 l9_286=float3(0.0);
l9_286=l9_284;
float3 l9_287=float3(0.0);
float3 l9_288=l9_286;
float l9_289=dot(l9_288,l9_288);
float l9_290;
if (l9_289>0.0)
{
l9_290=1.0/sqrt(l9_289);
}
else
{
l9_290=0.0;
}
float l9_291=l9_290;
float3 l9_292=l9_288*l9_291;
l9_287=l9_292;
float3 l9_293=float3(0.0);
l9_293=cross(l9_243,l9_287);
float l9_294=0.0;
l9_294=dot(l9_260,l9_293);
float l9_295=0.0;
l9_295=l9_283/l9_294;
float3 l9_296=float3(0.0);
l9_296=l9_260*float3(l9_295);
float3 l9_297=float3(0.0);
l9_297=l9_296;
l9_235=l9_297;
l9_241=l9_235;
}
else
{
float3 l9_298=float3(0.0);
float3 l9_299=float3(in.direction);
l9_298=l9_299;
float3 l9_300=float3(0.0);
l9_300=l9_298;
float l9_301=0.0;
float l9_302=0.0;
float3 l9_303=l9_300;
float l9_304=l9_303.x;
float l9_305=l9_303.y;
l9_301=l9_304;
l9_302=l9_305;
float l9_306=0.0;
l9_306=-l9_302;
float3 l9_307=float3(0.0);
l9_307.x=l9_306;
l9_307.y=l9_301;
l9_307.z=(*sc_set0.UserUniforms).Port_Value3_N040;
float l9_308=0.0;
float l9_309=(*sc_set0.UserUniforms).startWidth;
l9_308=l9_309;
float l9_310=0.0;
l9_310=l9_308;
float2 l9_311=float2(0.0);
l9_311=l9_237.Surface_UVCoord0;
float l9_312=0.0;
float2 l9_313=l9_311;
float l9_314=l9_313.y;
l9_312=l9_314;
float l9_315=0.0;
l9_315=l9_312;
float l9_316=0.0;
l9_316=l9_310*l9_315;
float l9_317=0.0;
float l9_318=(*sc_set0.UserUniforms).endWidth;
l9_317=l9_318;
float l9_319=0.0;
l9_319=l9_317;
float l9_320=0.0;
l9_320=1.0-l9_315;
float l9_321=0.0;
l9_321=l9_319*l9_320;
float l9_322=0.0;
l9_322=l9_316+l9_321;
float l9_323=0.0;
l9_323=l9_322/(*sc_set0.UserUniforms).Port_Input1_N014;
float l9_324=0.0;
l9_324=l9_323;
float l9_325=0.0;
l9_325=l9_324;
float3 l9_326=float3(0.0);
float3 l9_327=float3(in.prevSegment);
l9_326=l9_327;
float3 l9_328=float3(0.0);
l9_328=l9_326;
float l9_329=0.0;
float l9_330=0.0;
float3 l9_331=l9_328;
float l9_332=l9_331.x;
float l9_333=l9_331.y;
l9_329=l9_332;
l9_330=l9_333;
float l9_334=0.0;
l9_334=-l9_330;
float3 l9_335=float3(0.0);
l9_335.x=l9_334;
l9_335.y=l9_329;
l9_335.z=(*sc_set0.UserUniforms).Port_Value3_N060;
float l9_336=0.0;
l9_336=dot(l9_307,l9_335);
float l9_337=0.0;
l9_337=l9_325/l9_336;
float3 l9_338=float3(0.0);
l9_338=l9_307*float3(l9_337);
float3 l9_339=float3(0.0);
l9_339=l9_338;
l9_236=l9_339;
l9_241=l9_236;
}
l9_233=l9_241;
float3 l9_340=float3(0.0);
l9_340=l9_232+l9_233;
param_3=l9_340;
param_4=param_3;
}
Result_N3=param_4;
WorldPosition=Result_N3;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_6=v;
float3 param_7=WorldPosition;
float3 param_8=WorldNormal;
float3 param_9=WorldTangent;
float4 param_10=v.position;
out.varPos=param_7;
out.varNormal=normalize(param_8);
float3 l9_341=normalize(param_9);
out.varTangent=float4(l9_341.x,l9_341.y,l9_341.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_342=param_6.position;
float4 l9_343=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_344=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_344=0;
}
else
{
l9_344=gl_InstanceIndex%2;
}
int l9_345=l9_344;
l9_343=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_345]*l9_342;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_346=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_346=0;
}
else
{
l9_346=gl_InstanceIndex%2;
}
int l9_347=l9_346;
l9_343=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_347]*l9_342;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_348=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_348=0;
}
else
{
l9_348=gl_InstanceIndex%2;
}
int l9_349=l9_348;
l9_343=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_349]*l9_342;
}
else
{
l9_343=l9_342;
}
}
}
float4 l9_350=l9_343;
out.varViewSpaceDepth=-l9_350.z;
}
float4 l9_351=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_351=param_10;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_352=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_352=0;
}
else
{
l9_352=gl_InstanceIndex%2;
}
int l9_353=l9_352;
l9_351=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_353]*param_6.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_354=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_354=0;
}
else
{
l9_354=gl_InstanceIndex%2;
}
int l9_355=l9_354;
l9_351=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_355]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_356=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_356=0;
}
else
{
l9_356=gl_InstanceIndex%2;
}
int l9_357=l9_356;
l9_351=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_357]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_6.texture0,param_6.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_358=param_6.position;
float4 l9_359=l9_358;
if (sc_RenderingSpace_tmp==1)
{
l9_359=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_358;
}
float4 l9_360=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_359;
float2 l9_361=((l9_360.xy/float2(l9_360.w))*0.5)+float2(0.5);
out.varShadowTex=l9_361;
}
float4 l9_362=l9_351;
if (sc_DepthBufferMode_tmp==1)
{
int l9_363=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_363=0;
}
else
{
l9_363=gl_InstanceIndex%2;
}
int l9_364=l9_363;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_364][2].w!=0.0)
{
float l9_365=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_362.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_362.w))*l9_365)-1.0)*l9_362.w;
}
}
float4 l9_366=l9_362;
l9_351=l9_366;
float4 l9_367=l9_351;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_368=l9_367.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_367.w);
l9_367=float4(l9_368.x,l9_368.y,l9_367.z,l9_367.w);
}
float4 l9_369=l9_367;
l9_351=l9_369;
float4 l9_370=l9_351;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_370.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_371=l9_370;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_372=dot(l9_371,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_373=l9_372;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_373;
}
}
float4 l9_374=float4(l9_370.x,-l9_370.y,(l9_370.z*0.5)+(l9_370.w*0.5),l9_370.w);
out.gl_Position=l9_374;
v=param_6;
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
float startWidth;
float endWidth;
int visualStyle;
float4 startColor;
float4 endColor;
float maxAlpha;
int Port_Value_N008;
float3 Port_Import_N042;
float3 Port_Import_N043;
float Port_Import_N020;
float Port_Import_N021;
float Port_Import_N019;
float Port_Input1_N014;
float Port_Import_N044;
float3 Port_Import_N052;
float3 Port_Import_N016;
float Port_Value3_N040;
float Port_Import_N064;
float3 Port_Import_N028;
float Port_Value3_N060;
float Port_Import_N074;
float4 Port_Import_N032;
float4 Port_Import_N033;
float Port_Import_N034;
float Port_Import_N076;
float Port_Position1_N073;
float Port_Value2_N067;
float Port_Position2_N073;
float Port_Position1_N070;
float Port_Position1_N066;
float4 Port_Value0_N077;
float Port_Position1_N077;
float4 Port_Value2_N077;
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
texture2d<float> sc_ScreenTexture [[id(13)]];
sampler intensityTextureSmpSC [[id(16)]];
sampler sc_ScreenTextureSmpSC [[id(21)]];
constant userUniformsObj* UserUniforms [[id(24)]];
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
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float4 Result_N37=float4(0.0);
float param=0.0;
float4 param_1=float4(0.0);
float4 param_2=float4(0.0);
float4 param_3=float4(0.0);
float4 param_4=float4(0.0);
float4 param_5=float4(0.0);
float4 param_6=float4(0.0);
ssGlobals param_8=Globals;
float l9_0=0.0;
float l9_1=float((*sc_set0.UserUniforms).visualStyle);
l9_0=l9_1;
float l9_2=0.0;
l9_2=l9_0;
param=l9_2;
param=floor(param);
float4 param_7;
if (param==0.0)
{
float4 l9_3=float4(0.0);
float4 l9_4=(*sc_set0.UserUniforms).startColor;
l9_3=l9_4;
float4 l9_5=float4(0.0);
l9_5=l9_3;
float4 l9_6=float4(0.0);
float4 l9_7=(*sc_set0.UserUniforms).endColor;
l9_6=l9_7;
float4 l9_8=float4(0.0);
l9_8=l9_6;
float2 l9_9=float2(0.0);
l9_9=param_8.Surface_UVCoord0;
float l9_10=0.0;
float2 l9_11=l9_9;
float l9_12=l9_11.y;
l9_10=l9_12;
float l9_13=0.0;
l9_13=l9_10;
float4 l9_14=float4(0.0);
l9_14=mix(l9_5,l9_8,float4(l9_13));
float l9_15=0.0;
float l9_16=(*sc_set0.UserUniforms).maxAlpha;
l9_15=l9_16;
float l9_17=0.0;
l9_17=fast::clamp(l9_15,0.0,1.0);
float4 l9_18=float4(0.0);
l9_18=float4(l9_14.xyz.x,l9_14.xyz.y,l9_14.xyz.z,l9_18.w);
l9_18.w=l9_17;
param_1=l9_18;
param_7=param_1;
}
else
{
if (param==1.0)
{
float2 l9_19=float2(0.0);
l9_19=param_8.Surface_UVCoord0;
float l9_20=0.0;
float2 l9_21=l9_19;
float l9_22=l9_21.y;
l9_20=l9_22;
float l9_23=0.0;
l9_23=l9_20;
float4 l9_24=float4(0.0);
float4 l9_25=(*sc_set0.UserUniforms).startColor;
l9_24=l9_25;
float4 l9_26=float4(0.0);
l9_26=l9_24;
float4 l9_27=float4(0.0);
float4 l9_28=(*sc_set0.UserUniforms).endColor;
l9_27=l9_28;
float4 l9_29=float4(0.0);
l9_29=l9_27;
float4 l9_30=float4(0.0);
l9_30=mix(l9_26,l9_29,float4(l9_23));
float l9_31=0.0;
float l9_32=(*sc_set0.UserUniforms).maxAlpha;
l9_31=l9_32;
float l9_33=0.0;
l9_33=fast::clamp(l9_31,0.0,1.0);
float4 l9_34=float4(0.0);
l9_34=float4(l9_30.xyz.x,l9_30.xyz.y,l9_30.xyz.z,l9_34.w);
l9_34.w=l9_33;
float4 l9_35=float4(0.0);
l9_35=float4(l9_30.xyz.x,l9_30.xyz.y,l9_30.xyz.z,l9_35.w);
l9_35.w=(*sc_set0.UserUniforms).Port_Value2_N067;
float4 l9_36=float4(0.0);
float l9_37=l9_23;
float4 l9_38=l9_34;
float l9_39=(*sc_set0.UserUniforms).Port_Position1_N073;
float4 l9_40=l9_35;
float l9_41=(*sc_set0.UserUniforms).Port_Position2_N073;
float4 l9_42=l9_35;
float4 l9_43=l9_34;
l9_37=fast::clamp(l9_37,0.0,1.0);
float4 l9_44;
if (l9_37<l9_39)
{
l9_44=mix(l9_38,l9_40,float4(fast::clamp(l9_37/l9_39,0.0,1.0)));
}
else
{
if (l9_37<l9_41)
{
l9_44=mix(l9_40,l9_42,float4(fast::clamp((l9_37-l9_39)/(l9_41-l9_39),0.0,1.0)));
}
else
{
l9_44=mix(l9_42,l9_43,float4(fast::clamp((l9_37-l9_41)/(1.0-l9_41),0.0,1.0)));
}
}
bool l9_45=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_46;
if (l9_45)
{
l9_46=!PreviewInfo.Saved;
}
else
{
l9_46=l9_45;
}
bool l9_47;
if (l9_46)
{
l9_47=73==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_47=l9_46;
}
if (l9_47)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_44;
}
l9_36=l9_44;
param_2=l9_36;
param_7=param_2;
}
else
{
if (param==2.0)
{
float2 l9_48=float2(0.0);
l9_48=param_8.Surface_UVCoord0;
float l9_49=0.0;
float2 l9_50=l9_48;
float l9_51=l9_50.y;
l9_49=l9_51;
float l9_52=0.0;
l9_52=l9_49;
float4 l9_53=float4(0.0);
float4 l9_54=(*sc_set0.UserUniforms).startColor;
l9_53=l9_54;
float4 l9_55=float4(0.0);
l9_55=l9_53;
float4 l9_56=float4(0.0);
float4 l9_57=(*sc_set0.UserUniforms).endColor;
l9_56=l9_57;
float4 l9_58=float4(0.0);
l9_58=l9_56;
float4 l9_59=float4(0.0);
l9_59=mix(l9_55,l9_58,float4(l9_52));
float l9_60=0.0;
float l9_61=(*sc_set0.UserUniforms).maxAlpha;
l9_60=l9_61;
float l9_62=0.0;
l9_62=fast::clamp(l9_60,0.0,1.0);
float4 l9_63=float4(0.0);
l9_63=float4(l9_59.xyz.x,l9_59.xyz.y,l9_59.xyz.z,l9_63.w);
l9_63.w=l9_62;
float4 l9_64=float4(0.0);
l9_64=float4(l9_59.xyz.x,l9_59.xyz.y,l9_59.xyz.z,l9_64.w);
l9_64.w=(*sc_set0.UserUniforms).Port_Value2_N067;
float4 l9_65=float4(0.0);
float l9_66=l9_52;
float4 l9_67=l9_63;
float l9_68=(*sc_set0.UserUniforms).Port_Position1_N070;
float4 l9_69=l9_64;
float4 l9_70=l9_64;
l9_66=fast::clamp(l9_66,0.0,1.0);
float4 l9_71;
if (l9_66<l9_68)
{
l9_71=mix(l9_67,l9_69,float4(fast::clamp(l9_66/l9_68,0.0,1.0)));
}
else
{
l9_71=mix(l9_69,l9_70,float4(fast::clamp((l9_66-l9_68)/(1.0-l9_68),0.0,1.0)));
}
bool l9_72=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_73;
if (l9_72)
{
l9_73=!PreviewInfo.Saved;
}
else
{
l9_73=l9_72;
}
bool l9_74;
if (l9_73)
{
l9_74=70==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_74=l9_73;
}
if (l9_74)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_71;
}
l9_65=l9_71;
param_3=l9_65;
param_7=param_3;
}
else
{
if (param==3.0)
{
float2 l9_75=float2(0.0);
l9_75=param_8.Surface_UVCoord0;
float l9_76=0.0;
float2 l9_77=l9_75;
float l9_78=l9_77.y;
l9_76=l9_78;
float l9_79=0.0;
l9_79=l9_76;
float4 l9_80=float4(0.0);
float4 l9_81=(*sc_set0.UserUniforms).startColor;
l9_80=l9_81;
float4 l9_82=float4(0.0);
l9_82=l9_80;
float4 l9_83=float4(0.0);
float4 l9_84=(*sc_set0.UserUniforms).endColor;
l9_83=l9_84;
float4 l9_85=float4(0.0);
l9_85=l9_83;
float4 l9_86=float4(0.0);
l9_86=mix(l9_82,l9_85,float4(l9_79));
float4 l9_87=float4(0.0);
l9_87=float4(l9_86.xyz.x,l9_86.xyz.y,l9_86.xyz.z,l9_87.w);
l9_87.w=(*sc_set0.UserUniforms).Port_Value2_N067;
float l9_88=0.0;
float l9_89=(*sc_set0.UserUniforms).maxAlpha;
l9_88=l9_89;
float l9_90=0.0;
l9_90=fast::clamp(l9_88,0.0,1.0);
float4 l9_91=float4(0.0);
l9_91=float4(l9_86.xyz.x,l9_86.xyz.y,l9_86.xyz.z,l9_91.w);
l9_91.w=l9_90;
float4 l9_92=float4(0.0);
float l9_93=l9_79;
float4 l9_94=l9_87;
float l9_95=(*sc_set0.UserUniforms).Port_Position1_N066;
float4 l9_96=l9_87;
float4 l9_97=l9_91;
l9_93=fast::clamp(l9_93,0.0,1.0);
float4 l9_98;
if (l9_93<l9_95)
{
l9_98=mix(l9_94,l9_96,float4(fast::clamp(l9_93/l9_95,0.0,1.0)));
}
else
{
l9_98=mix(l9_96,l9_97,float4(fast::clamp((l9_93-l9_95)/(1.0-l9_95),0.0,1.0)));
}
bool l9_99=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_100;
if (l9_99)
{
l9_100=!PreviewInfo.Saved;
}
else
{
l9_100=l9_99;
}
bool l9_101;
if (l9_100)
{
l9_101=66==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_101=l9_100;
}
if (l9_101)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_98;
}
l9_92=l9_98;
param_4=l9_92;
param_7=param_4;
}
else
{
if (param==4.0)
{
float2 l9_102=float2(0.0);
l9_102=param_8.Surface_UVCoord0;
float l9_103=0.0;
float2 l9_104=l9_102;
float l9_105=l9_104.y;
l9_103=l9_105;
float l9_106=0.0;
l9_106=l9_103;
float4 l9_107=float4(0.0);
float4 l9_108=(*sc_set0.UserUniforms).startColor;
l9_107=l9_108;
float4 l9_109=float4(0.0);
l9_109=l9_107;
float4 l9_110=float4(0.0);
float4 l9_111=(*sc_set0.UserUniforms).endColor;
l9_110=l9_111;
float4 l9_112=float4(0.0);
l9_112=l9_110;
float4 l9_113=float4(0.0);
l9_113=mix(l9_109,l9_112,float4(l9_106));
float l9_114=0.0;
float l9_115=(*sc_set0.UserUniforms).maxAlpha;
l9_114=l9_115;
float l9_116=0.0;
l9_116=fast::clamp(l9_114,0.0,1.0);
float4 l9_117=float4(0.0);
l9_117=float4(l9_113.xyz.x,l9_113.xyz.y,l9_113.xyz.z,l9_117.w);
l9_117.w=l9_116;
float4 l9_118=float4(0.0);
float l9_119=l9_106;
float4 l9_120=(*sc_set0.UserUniforms).Port_Value0_N077;
float l9_121=(*sc_set0.UserUniforms).Port_Position1_N077;
float4 l9_122=l9_117;
float4 l9_123=(*sc_set0.UserUniforms).Port_Value2_N077;
l9_119=fast::clamp(l9_119,0.0,1.0);
float4 l9_124;
if (l9_119<l9_121)
{
l9_124=mix(l9_120,l9_122,float4(fast::clamp(l9_119/l9_121,0.0,1.0)));
}
else
{
l9_124=mix(l9_122,l9_123,float4(fast::clamp((l9_119-l9_121)/(1.0-l9_121),0.0,1.0)));
}
bool l9_125=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_126;
if (l9_125)
{
l9_126=!PreviewInfo.Saved;
}
else
{
l9_126=l9_125;
}
bool l9_127;
if (l9_126)
{
l9_127=77==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_127=l9_126;
}
if (l9_127)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_124;
}
l9_118=l9_124;
param_5=l9_118;
param_7=param_5;
}
else
{
float2 l9_128=float2(0.0);
l9_128=param_8.Surface_UVCoord0;
float l9_129=0.0;
float2 l9_130=l9_128;
float l9_131=l9_130.y;
l9_129=l9_131;
float l9_132=0.0;
l9_132=l9_129;
float4 l9_133=float4(0.0);
float4 l9_134=(*sc_set0.UserUniforms).startColor;
l9_133=l9_134;
float4 l9_135=float4(0.0);
l9_135=l9_133;
float4 l9_136=float4(0.0);
float4 l9_137=(*sc_set0.UserUniforms).endColor;
l9_136=l9_137;
float4 l9_138=float4(0.0);
l9_138=l9_136;
float4 l9_139=float4(0.0);
l9_139=mix(l9_135,l9_138,float4(l9_132));
float l9_140=0.0;
float l9_141=(*sc_set0.UserUniforms).maxAlpha;
l9_140=l9_141;
float l9_142=0.0;
l9_142=fast::clamp(l9_140,0.0,1.0);
float4 l9_143=float4(0.0);
l9_143=float4(l9_139.xyz.x,l9_139.xyz.y,l9_139.xyz.z,l9_143.w);
l9_143.w=l9_142;
float4 l9_144=float4(0.0);
l9_144=float4(l9_139.xyz.x,l9_139.xyz.y,l9_139.xyz.z,l9_144.w);
l9_144.w=(*sc_set0.UserUniforms).Port_Value2_N067;
float4 l9_145=float4(0.0);
float l9_146=l9_132;
float4 l9_147=l9_143;
float l9_148=(*sc_set0.UserUniforms).Port_Position1_N070;
float4 l9_149=l9_144;
float4 l9_150=l9_144;
l9_146=fast::clamp(l9_146,0.0,1.0);
float4 l9_151;
if (l9_146<l9_148)
{
l9_151=mix(l9_147,l9_149,float4(fast::clamp(l9_146/l9_148,0.0,1.0)));
}
else
{
l9_151=mix(l9_149,l9_150,float4(fast::clamp((l9_146-l9_148)/(1.0-l9_148),0.0,1.0)));
}
bool l9_152=(*sc_set0.UserUniforms).PreviewEnabled==1;
bool l9_153;
if (l9_152)
{
l9_153=!PreviewInfo.Saved;
}
else
{
l9_153=l9_152;
}
bool l9_154;
if (l9_153)
{
l9_154=70==(*sc_set0.UserUniforms).PreviewNodeID;
}
else
{
l9_154=l9_153;
}
if (l9_154)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_151;
}
l9_145=l9_151;
param_6=l9_145;
param_7=param_6;
}
}
}
}
}
Result_N37=param_7;
float4 Export_N31=float4(0.0);
Export_N31=Result_N37;
FinalColor=Export_N31;
float param_9=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_9<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_155=gl_FragCoord;
float2 l9_156=floor(mod(l9_155.xy,float2(4.0)));
float l9_157=(mod(dot(l9_156,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_9<l9_157)
{
discard_fragment();
}
}
float4 param_10=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_158=param_10;
float4 l9_159=l9_158;
float l9_160=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_160=l9_159.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_160=fast::clamp(l9_159.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_160=fast::clamp(dot(l9_159.xyz,float3(l9_159.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_160=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_160=(1.0-dot(l9_159.xyz,float3(0.33333001)))*l9_159.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_160=(1.0-fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0))*l9_159.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_160=fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0)*l9_159.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_160=fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_160=fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0)*l9_159.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_160=dot(l9_159.xyz,float3(0.33333001))*l9_159.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_160=1.0-fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_160=fast::clamp(dot(l9_159.xyz,float3(1.0)),0.0,1.0);
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
float l9_161=l9_160;
float l9_162=l9_161;
float l9_163=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_162;
float3 l9_164=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_158.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_165=float4(l9_164.x,l9_164.y,l9_164.z,l9_163);
param_10=l9_165;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_10=float4(param_10.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_166=param_10;
float4 l9_167=float4(0.0);
float4 l9_168=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_169=out.FragColor0;
float4 l9_170=l9_169;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_170.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_171=l9_170;
l9_168=l9_171;
}
else
{
float4 l9_172=gl_FragCoord;
float2 l9_173=l9_172.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_174=l9_173;
float2 l9_175=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_176=1;
int l9_177=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_177=0;
}
else
{
l9_177=in.varStereoViewID;
}
int l9_178=l9_177;
int l9_179=l9_178;
float3 l9_180=float3(l9_174,0.0);
int l9_181=l9_176;
int l9_182=l9_179;
if (l9_181==1)
{
l9_180.y=((2.0*l9_180.y)+float(l9_182))-1.0;
}
float2 l9_183=l9_180.xy;
l9_175=l9_183;
}
else
{
l9_175=l9_174;
}
float2 l9_184=l9_175;
float2 l9_185=l9_184;
float2 l9_186=l9_185;
int l9_187=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_188=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_188=0;
}
else
{
l9_188=in.varStereoViewID;
}
int l9_189=l9_188;
l9_187=1-l9_189;
}
else
{
int l9_190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_190=0;
}
else
{
l9_190=in.varStereoViewID;
}
int l9_191=l9_190;
l9_187=l9_191;
}
int l9_192=l9_187;
float2 l9_193=l9_186;
int l9_194=l9_192;
float2 l9_195=l9_193;
int l9_196=l9_194;
float l9_197=0.0;
float4 l9_198=float4(0.0);
float2 l9_199=l9_195;
int l9_200=sc_ScreenTextureLayout_tmp;
int l9_201=l9_196;
float l9_202=l9_197;
float2 l9_203=l9_199;
int l9_204=l9_200;
int l9_205=l9_201;
float3 l9_206=float3(0.0);
if (l9_204==0)
{
l9_206=float3(l9_203,0.0);
}
else
{
if (l9_204==1)
{
l9_206=float3(l9_203.x,(l9_203.y*0.5)+(0.5-(float(l9_205)*0.5)),0.0);
}
else
{
l9_206=float3(l9_203,float(l9_205));
}
}
float3 l9_207=l9_206;
float3 l9_208=l9_207;
float2 l9_209=l9_208.xy;
float l9_210=l9_202;
float4 l9_211=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_209,bias(l9_210));
float4 l9_212=l9_211;
l9_198=l9_212;
float4 l9_213=l9_198;
float4 l9_214=l9_213;
float4 l9_215=l9_214;
l9_168=l9_215;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_168.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_216=l9_168;
float4 l9_217=l9_216;
float3 l9_218=l9_217.xyz;
float3 l9_219=l9_218;
float3 l9_220=l9_166.xyz;
float3 l9_221=definedBlend(l9_219,l9_220,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_167=float4(l9_221.x,l9_221.y,l9_221.z,l9_167.w);
float3 l9_222=mix(l9_218,l9_167.xyz,float3(l9_166.w));
l9_167=float4(l9_222.x,l9_222.y,l9_222.z,l9_167.w);
l9_167.w=1.0;
float4 l9_223=l9_167;
param_10=l9_223;
}
else
{
float4 l9_224=param_10;
float4 l9_225=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_225=float4(mix(float3(1.0),l9_224.xyz,float3(l9_224.w)),l9_224.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_226=l9_224.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_226=fast::clamp(l9_226,0.0,1.0);
}
l9_225=float4(l9_224.xyz*l9_226,l9_226);
}
else
{
l9_225=l9_224;
}
}
float4 l9_227=l9_225;
param_10=l9_227;
}
}
}
float4 l9_228=param_10;
FinalColor=l9_228;
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
float4 l9_229=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_229=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_229=float4(0.0);
}
float4 l9_230=l9_229;
float4 Cost=l9_230;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_11=in.varPos;
float4 param_12=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_11,param_12,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_13=FinalColor;
float4 l9_231=param_13;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_231.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_231;
return out;
}
} // FRAGMENT SHADER
