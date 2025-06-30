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
//sampler sampler intensityTextureSmpSC 0:18
//sampler sampler sBoundarySmpSC 0:19
//sampler sampler sVelocitySmpSC 0:20
//sampler sampler sc_ScreenTextureSmpSC 0:25
//texture texture2D intensityTexture 0:1:0:18
//texture texture2D sBoundary 0:2:0:19
//texture texture2D sVelocity 0:3:0:20
//texture texture2D sc_ScreenTexture 0:15:0:25
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:28:4416 {
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
//float4 sVelocitySize 4128
//float3x3 sVelocityTransform 4176
//float4 sVelocityUvMinMax 4224
//float4 sVelocityBorderColor 4240
//float3x3 sBoundaryTransform 4304
//float4 sBoundaryUvMinMax 4352
//float4 sBoundaryBorderColor 4368
//float2 velocityRange 4384
//float halfInverseCell 4392
//float2 divergenceRange 4400
//int reset 4408
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_sVelocity 33 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_sBoundary 35 0
//spec_const bool SC_USE_UV_MIN_MAX_sVelocity 36 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 37 0
//spec_const bool SC_USE_UV_TRANSFORM_sBoundary 38 0
//spec_const bool SC_USE_UV_TRANSFORM_sVelocity 39 0
//spec_const bool UseViewSpaceDepthVariant 40 1
//spec_const bool intensityTextureHasSwappedViews 41 0
//spec_const bool sBoundaryHasSwappedViews 42 0
//spec_const bool sVelocityHasSwappedViews 43 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 44 0
//spec_const bool sc_BlendMode_Add 45 0
//spec_const bool sc_BlendMode_AlphaTest 46 0
//spec_const bool sc_BlendMode_AlphaToCoverage 47 0
//spec_const bool sc_BlendMode_ColoredGlass 48 0
//spec_const bool sc_BlendMode_Custom 49 0
//spec_const bool sc_BlendMode_Max 50 0
//spec_const bool sc_BlendMode_Min 51 0
//spec_const bool sc_BlendMode_MultiplyOriginal 52 0
//spec_const bool sc_BlendMode_Multiply 53 0
//spec_const bool sc_BlendMode_Normal 54 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 55 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 56 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 57 0
//spec_const bool sc_BlendMode_Screen 58 0
//spec_const bool sc_DepthOnly 59 0
//spec_const bool sc_FramebufferFetch 60 0
//spec_const bool sc_MotionVectorsPass 61 0
//spec_const bool sc_OITCompositingPass 62 0
//spec_const bool sc_OITDepthBoundsPass 63 0
//spec_const bool sc_OITDepthGatherPass 64 0
//spec_const bool sc_ProjectiveShadowsCaster 65 0
//spec_const bool sc_ProjectiveShadowsReceiver 66 0
//spec_const bool sc_RenderAlphaToColor 67 0
//spec_const bool sc_ScreenTextureHasSwappedViews 68 0
//spec_const bool sc_ShaderComplexityAnalyzer 69 0
//spec_const bool sc_TAAEnabled 70 0
//spec_const bool sc_UseFramebufferFetchMarker 71 0
//spec_const bool sc_VertexBlendingUseNormals 72 0
//spec_const bool sc_VertexBlending 73 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sBoundary 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sVelocity 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sBoundary 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sVelocity 79 -1
//spec_const int intensityTextureLayout 80 0
//spec_const int sBoundaryLayout 81 0
//spec_const int sVelocityLayout 82 0
//spec_const int sc_DepthBufferMode 83 0
//spec_const int sc_RenderingSpace 84 -1
//spec_const int sc_ScreenTextureLayout 85 0
//spec_const int sc_ShaderCacheConstant 86 0
//spec_const int sc_SkinBonesCount 87 0
//spec_const int sc_StereoRenderingMode 88 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 89 0
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
constant bool SC_USE_CLAMP_TO_BORDER_sVelocity [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_sVelocity_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sVelocity) ? SC_USE_CLAMP_TO_BORDER_sVelocity : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_sBoundary [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sBoundary) ? SC_USE_UV_MIN_MAX_sBoundary : false;
constant bool SC_USE_UV_MIN_MAX_sVelocity [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_sVelocity_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sVelocity) ? SC_USE_UV_MIN_MAX_sVelocity : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(37)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_sBoundary [[function_constant(38)]];
constant bool SC_USE_UV_TRANSFORM_sBoundary_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sBoundary) ? SC_USE_UV_TRANSFORM_sBoundary : false;
constant bool SC_USE_UV_TRANSFORM_sVelocity [[function_constant(39)]];
constant bool SC_USE_UV_TRANSFORM_sVelocity_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sVelocity) ? SC_USE_UV_TRANSFORM_sVelocity : false;
constant bool UseViewSpaceDepthVariant [[function_constant(40)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(41)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sBoundaryHasSwappedViews [[function_constant(42)]];
constant bool sBoundaryHasSwappedViews_tmp = is_function_constant_defined(sBoundaryHasSwappedViews) ? sBoundaryHasSwappedViews : false;
constant bool sVelocityHasSwappedViews [[function_constant(43)]];
constant bool sVelocityHasSwappedViews_tmp = is_function_constant_defined(sVelocityHasSwappedViews) ? sVelocityHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(44)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(45)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(46)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(47)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(48)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(49)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(50)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(51)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(52)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(53)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(54)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(55)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(56)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(57)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(58)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(59)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(60)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(61)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(62)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(63)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(64)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(65)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(66)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(67)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(68)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(69)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(70)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(71)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(72)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(73)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sBoundary) ? SC_SOFTWARE_WRAP_MODE_U_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sVelocity [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sVelocity) ? SC_SOFTWARE_WRAP_MODE_U_sVelocity : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(77)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary [[function_constant(78)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sBoundary) ? SC_SOFTWARE_WRAP_MODE_V_sBoundary : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sVelocity [[function_constant(79)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sVelocity) ? SC_SOFTWARE_WRAP_MODE_V_sVelocity : -1;
constant int intensityTextureLayout [[function_constant(80)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sBoundaryLayout [[function_constant(81)]];
constant int sBoundaryLayout_tmp = is_function_constant_defined(sBoundaryLayout) ? sBoundaryLayout : 0;
constant int sVelocityLayout [[function_constant(82)]];
constant int sVelocityLayout_tmp = is_function_constant_defined(sVelocityLayout) ? sVelocityLayout : 0;
constant int sc_DepthBufferMode [[function_constant(83)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(84)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(85)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(86)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(87)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(88)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(89)]];
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
float4 sVelocitySize;
float4 sVelocityDims;
float4 sVelocityView;
float3x3 sVelocityTransform;
float4 sVelocityUvMinMax;
float4 sVelocityBorderColor;
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float2 velocityRange;
float halfInverseCell;
float2 divergenceRange;
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
texture2d<float> sVelocity [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sBoundarySmpSC [[id(19)]];
sampler sVelocitySmpSC [[id(20)]];
sampler sc_ScreenTextureSmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(28)]];
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
float4 sBoundarySize;
float4 sBoundaryDims;
float4 sBoundaryView;
float3x3 sBoundaryTransform;
float4 sBoundaryUvMinMax;
float4 sBoundaryBorderColor;
float2 velocityRange;
float halfInverseCell;
float2 divergenceRange;
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
texture2d<float> sVelocity [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sBoundarySmpSC [[id(19)]];
sampler sVelocitySmpSC [[id(20)]];
sampler sc_ScreenTextureSmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(28)]];
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
int N8_reset=0;
float2 N8_velocityRange=float2(0.0);
float N8_halfInverseCell=0.0;
float2 N8_divergenceRange=float2(0.0);
float4 N8_divergenceOut=float4(0.0);
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
float Output_N3=0.0;
float param_1=(*sc_set0.UserUniforms).halfInverseCell;
Output_N3=param_1;
float2 Output_N7=float2(0.0);
float2 param_2=(*sc_set0.UserUniforms).divergenceRange;
Output_N7=param_2;
float Output_N9=0.0;
float param_3=float((*sc_set0.UserUniforms).reset);
Output_N9=param_3;
float4 divergenceOut_N8=float4(0.0);
float2 param_4=Output_N5;
float param_5=Output_N3;
float2 param_6=Output_N7;
float param_7=Output_N9;
ssGlobals param_9=Globals;
ssGlobals tempGlobals=param_9;
float4 param_8=float4(0.0);
N8_velocityRange=param_4;
N8_halfInverseCell=param_5;
N8_divergenceRange=param_6;
N8_reset=int(param_7);
float2 l9_0=tempGlobals.Surface_UVCoord0;
float2 l9_1=l9_0;
float2 l9_2=float2(0.0);
l9_2=(*sc_set0.UserUniforms).sVelocitySize.zw;
float2 l9_3=l9_2;
float2 l9_4=l9_3;
float2 l9_5=l9_1;
float4 l9_6=float4(0.0);
int l9_7=0;
if ((int(sBoundaryHasSwappedViews_tmp)!=0))
{
int l9_8=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8=0;
}
else
{
l9_8=in.varStereoViewID;
}
int l9_9=l9_8;
l9_7=1-l9_9;
}
else
{
int l9_10=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10=0;
}
else
{
l9_10=in.varStereoViewID;
}
int l9_11=l9_10;
l9_7=l9_11;
}
int l9_12=l9_7;
int l9_13=sBoundaryLayout_tmp;
int l9_14=l9_12;
float2 l9_15=l9_5;
bool l9_16=(int(SC_USE_UV_TRANSFORM_sBoundary_tmp)!=0);
float3x3 l9_17=(*sc_set0.UserUniforms).sBoundaryTransform;
int2 l9_18=int2(SC_SOFTWARE_WRAP_MODE_U_sBoundary_tmp,SC_SOFTWARE_WRAP_MODE_V_sBoundary_tmp);
bool l9_19=(int(SC_USE_UV_MIN_MAX_sBoundary_tmp)!=0);
float4 l9_20=(*sc_set0.UserUniforms).sBoundaryUvMinMax;
bool l9_21=(int(SC_USE_CLAMP_TO_BORDER_sBoundary_tmp)!=0);
float4 l9_22=(*sc_set0.UserUniforms).sBoundaryBorderColor;
float l9_23=0.0;
bool l9_24=l9_21&&(!l9_19);
float l9_25=1.0;
float l9_26=l9_15.x;
int l9_27=l9_18.x;
if (l9_27==1)
{
l9_26=fract(l9_26);
}
else
{
if (l9_27==2)
{
float l9_28=fract(l9_26);
float l9_29=l9_26-l9_28;
float l9_30=step(0.25,fract(l9_29*0.5));
l9_26=mix(l9_28,1.0-l9_28,fast::clamp(l9_30,0.0,1.0));
}
}
l9_15.x=l9_26;
float l9_31=l9_15.y;
int l9_32=l9_18.y;
if (l9_32==1)
{
l9_31=fract(l9_31);
}
else
{
if (l9_32==2)
{
float l9_33=fract(l9_31);
float l9_34=l9_31-l9_33;
float l9_35=step(0.25,fract(l9_34*0.5));
l9_31=mix(l9_33,1.0-l9_33,fast::clamp(l9_35,0.0,1.0));
}
}
l9_15.y=l9_31;
if (l9_19)
{
bool l9_36=l9_21;
bool l9_37;
if (l9_36)
{
l9_37=l9_18.x==3;
}
else
{
l9_37=l9_36;
}
float l9_38=l9_15.x;
float l9_39=l9_20.x;
float l9_40=l9_20.z;
bool l9_41=l9_37;
float l9_42=l9_25;
float l9_43=fast::clamp(l9_38,l9_39,l9_40);
float l9_44=step(abs(l9_38-l9_43),9.9999997e-06);
l9_42*=(l9_44+((1.0-float(l9_41))*(1.0-l9_44)));
l9_38=l9_43;
l9_15.x=l9_38;
l9_25=l9_42;
bool l9_45=l9_21;
bool l9_46;
if (l9_45)
{
l9_46=l9_18.y==3;
}
else
{
l9_46=l9_45;
}
float l9_47=l9_15.y;
float l9_48=l9_20.y;
float l9_49=l9_20.w;
bool l9_50=l9_46;
float l9_51=l9_25;
float l9_52=fast::clamp(l9_47,l9_48,l9_49);
float l9_53=step(abs(l9_47-l9_52),9.9999997e-06);
l9_51*=(l9_53+((1.0-float(l9_50))*(1.0-l9_53)));
l9_47=l9_52;
l9_15.y=l9_47;
l9_25=l9_51;
}
float2 l9_54=l9_15;
bool l9_55=l9_16;
float3x3 l9_56=l9_17;
if (l9_55)
{
l9_54=float2((l9_56*float3(l9_54,1.0)).xy);
}
float2 l9_57=l9_54;
float2 l9_58=l9_57;
float2 l9_59=l9_58;
l9_15=l9_59;
float l9_60=l9_15.x;
int l9_61=l9_18.x;
bool l9_62=l9_24;
float l9_63=l9_25;
if ((l9_61==0)||(l9_61==3))
{
float l9_64=l9_60;
float l9_65=0.0;
float l9_66=1.0;
bool l9_67=l9_62;
float l9_68=l9_63;
float l9_69=fast::clamp(l9_64,l9_65,l9_66);
float l9_70=step(abs(l9_64-l9_69),9.9999997e-06);
l9_68*=(l9_70+((1.0-float(l9_67))*(1.0-l9_70)));
l9_64=l9_69;
l9_60=l9_64;
l9_63=l9_68;
}
l9_15.x=l9_60;
l9_25=l9_63;
float l9_71=l9_15.y;
int l9_72=l9_18.y;
bool l9_73=l9_24;
float l9_74=l9_25;
if ((l9_72==0)||(l9_72==3))
{
float l9_75=l9_71;
float l9_76=0.0;
float l9_77=1.0;
bool l9_78=l9_73;
float l9_79=l9_74;
float l9_80=fast::clamp(l9_75,l9_76,l9_77);
float l9_81=step(abs(l9_75-l9_80),9.9999997e-06);
l9_79*=(l9_81+((1.0-float(l9_78))*(1.0-l9_81)));
l9_75=l9_80;
l9_71=l9_75;
l9_74=l9_79;
}
l9_15.y=l9_71;
l9_25=l9_74;
float2 l9_82=l9_15;
int l9_83=l9_13;
int l9_84=l9_14;
float l9_85=l9_23;
float2 l9_86=l9_82;
int l9_87=l9_83;
int l9_88=l9_84;
float3 l9_89=float3(0.0);
if (l9_87==0)
{
l9_89=float3(l9_86,0.0);
}
else
{
if (l9_87==1)
{
l9_89=float3(l9_86.x,(l9_86.y*0.5)+(0.5-(float(l9_88)*0.5)),0.0);
}
else
{
l9_89=float3(l9_86,float(l9_88));
}
}
float3 l9_90=l9_89;
float3 l9_91=l9_90;
float2 l9_92=l9_91.xy;
float l9_93=l9_85;
float4 l9_94=sc_set0.sBoundary.sample(sc_set0.sBoundarySmpSC,l9_92,bias(l9_93));
float4 l9_95=l9_94;
float4 l9_96=l9_95;
if (l9_21)
{
l9_96=mix(l9_22,l9_96,float4(l9_25));
}
float4 l9_97=l9_96;
l9_6=l9_97;
float4 l9_98=l9_6;
float4 l9_99=l9_98;
float2 l9_100=float2(0.0,1.0);
float2 l9_101=float2(0.0,-1.0);
float2 l9_102=float2(1.0,0.0);
float2 l9_103=float2(-1.0,0.0);
float2 l9_104=float2(1.0);
float2 l9_105=float2(1.0);
float2 l9_106=float2(1.0);
float2 l9_107=float2(1.0);
if (l9_99.x>0.0)
{
l9_100.y=-1.0;
l9_104.y=-1.0;
}
else
{
if (l9_99.y>0.0)
{
l9_101.y=1.0;
l9_105.y=-1.0;
}
}
if (l9_99.z>0.0)
{
l9_102.x=-1.0;
l9_106.x=-1.0;
}
else
{
if (l9_99.w>0.0)
{
l9_103.x=1.0;
l9_107.x=-1.0;
}
}
float2 l9_108=l9_1+(l9_4*l9_100);
float4 l9_109=float4(0.0);
int l9_110=0;
if ((int(sVelocityHasSwappedViews_tmp)!=0))
{
int l9_111=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_111=0;
}
else
{
l9_111=in.varStereoViewID;
}
int l9_112=l9_111;
l9_110=1-l9_112;
}
else
{
int l9_113=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_113=0;
}
else
{
l9_113=in.varStereoViewID;
}
int l9_114=l9_113;
l9_110=l9_114;
}
int l9_115=l9_110;
int l9_116=sVelocityLayout_tmp;
int l9_117=l9_115;
float2 l9_118=l9_108;
bool l9_119=(int(SC_USE_UV_TRANSFORM_sVelocity_tmp)!=0);
float3x3 l9_120=(*sc_set0.UserUniforms).sVelocityTransform;
int2 l9_121=int2(SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp,SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp);
bool l9_122=(int(SC_USE_UV_MIN_MAX_sVelocity_tmp)!=0);
float4 l9_123=(*sc_set0.UserUniforms).sVelocityUvMinMax;
bool l9_124=(int(SC_USE_CLAMP_TO_BORDER_sVelocity_tmp)!=0);
float4 l9_125=(*sc_set0.UserUniforms).sVelocityBorderColor;
float l9_126=0.0;
bool l9_127=l9_124&&(!l9_122);
float l9_128=1.0;
float l9_129=l9_118.x;
int l9_130=l9_121.x;
if (l9_130==1)
{
l9_129=fract(l9_129);
}
else
{
if (l9_130==2)
{
float l9_131=fract(l9_129);
float l9_132=l9_129-l9_131;
float l9_133=step(0.25,fract(l9_132*0.5));
l9_129=mix(l9_131,1.0-l9_131,fast::clamp(l9_133,0.0,1.0));
}
}
l9_118.x=l9_129;
float l9_134=l9_118.y;
int l9_135=l9_121.y;
if (l9_135==1)
{
l9_134=fract(l9_134);
}
else
{
if (l9_135==2)
{
float l9_136=fract(l9_134);
float l9_137=l9_134-l9_136;
float l9_138=step(0.25,fract(l9_137*0.5));
l9_134=mix(l9_136,1.0-l9_136,fast::clamp(l9_138,0.0,1.0));
}
}
l9_118.y=l9_134;
if (l9_122)
{
bool l9_139=l9_124;
bool l9_140;
if (l9_139)
{
l9_140=l9_121.x==3;
}
else
{
l9_140=l9_139;
}
float l9_141=l9_118.x;
float l9_142=l9_123.x;
float l9_143=l9_123.z;
bool l9_144=l9_140;
float l9_145=l9_128;
float l9_146=fast::clamp(l9_141,l9_142,l9_143);
float l9_147=step(abs(l9_141-l9_146),9.9999997e-06);
l9_145*=(l9_147+((1.0-float(l9_144))*(1.0-l9_147)));
l9_141=l9_146;
l9_118.x=l9_141;
l9_128=l9_145;
bool l9_148=l9_124;
bool l9_149;
if (l9_148)
{
l9_149=l9_121.y==3;
}
else
{
l9_149=l9_148;
}
float l9_150=l9_118.y;
float l9_151=l9_123.y;
float l9_152=l9_123.w;
bool l9_153=l9_149;
float l9_154=l9_128;
float l9_155=fast::clamp(l9_150,l9_151,l9_152);
float l9_156=step(abs(l9_150-l9_155),9.9999997e-06);
l9_154*=(l9_156+((1.0-float(l9_153))*(1.0-l9_156)));
l9_150=l9_155;
l9_118.y=l9_150;
l9_128=l9_154;
}
float2 l9_157=l9_118;
bool l9_158=l9_119;
float3x3 l9_159=l9_120;
if (l9_158)
{
l9_157=float2((l9_159*float3(l9_157,1.0)).xy);
}
float2 l9_160=l9_157;
float2 l9_161=l9_160;
float2 l9_162=l9_161;
l9_118=l9_162;
float l9_163=l9_118.x;
int l9_164=l9_121.x;
bool l9_165=l9_127;
float l9_166=l9_128;
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
l9_118.x=l9_163;
l9_128=l9_166;
float l9_174=l9_118.y;
int l9_175=l9_121.y;
bool l9_176=l9_127;
float l9_177=l9_128;
if ((l9_175==0)||(l9_175==3))
{
float l9_178=l9_174;
float l9_179=0.0;
float l9_180=1.0;
bool l9_181=l9_176;
float l9_182=l9_177;
float l9_183=fast::clamp(l9_178,l9_179,l9_180);
float l9_184=step(abs(l9_178-l9_183),9.9999997e-06);
l9_182*=(l9_184+((1.0-float(l9_181))*(1.0-l9_184)));
l9_178=l9_183;
l9_174=l9_178;
l9_177=l9_182;
}
l9_118.y=l9_174;
l9_128=l9_177;
float2 l9_185=l9_118;
int l9_186=l9_116;
int l9_187=l9_117;
float l9_188=l9_126;
float2 l9_189=l9_185;
int l9_190=l9_186;
int l9_191=l9_187;
float3 l9_192=float3(0.0);
if (l9_190==0)
{
l9_192=float3(l9_189,0.0);
}
else
{
if (l9_190==1)
{
l9_192=float3(l9_189.x,(l9_189.y*0.5)+(0.5-(float(l9_191)*0.5)),0.0);
}
else
{
l9_192=float3(l9_189,float(l9_191));
}
}
float3 l9_193=l9_192;
float3 l9_194=l9_193;
float2 l9_195=l9_194.xy;
float l9_196=l9_188;
float4 l9_197=sc_set0.sVelocity.sample(sc_set0.sVelocitySmpSC,l9_195,bias(l9_196));
float4 l9_198=l9_197;
float4 l9_199=l9_198;
if (l9_124)
{
l9_199=mix(l9_125,l9_199,float4(l9_128));
}
float4 l9_200=l9_199;
l9_109=l9_200;
float4 l9_201=l9_109;
float4 l9_202=l9_201;
float2 l9_203=l9_1+(l9_4*l9_101);
float4 l9_204=float4(0.0);
int l9_205=0;
if ((int(sVelocityHasSwappedViews_tmp)!=0))
{
int l9_206=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_206=0;
}
else
{
l9_206=in.varStereoViewID;
}
int l9_207=l9_206;
l9_205=1-l9_207;
}
else
{
int l9_208=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_208=0;
}
else
{
l9_208=in.varStereoViewID;
}
int l9_209=l9_208;
l9_205=l9_209;
}
int l9_210=l9_205;
int l9_211=sVelocityLayout_tmp;
int l9_212=l9_210;
float2 l9_213=l9_203;
bool l9_214=(int(SC_USE_UV_TRANSFORM_sVelocity_tmp)!=0);
float3x3 l9_215=(*sc_set0.UserUniforms).sVelocityTransform;
int2 l9_216=int2(SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp,SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp);
bool l9_217=(int(SC_USE_UV_MIN_MAX_sVelocity_tmp)!=0);
float4 l9_218=(*sc_set0.UserUniforms).sVelocityUvMinMax;
bool l9_219=(int(SC_USE_CLAMP_TO_BORDER_sVelocity_tmp)!=0);
float4 l9_220=(*sc_set0.UserUniforms).sVelocityBorderColor;
float l9_221=0.0;
bool l9_222=l9_219&&(!l9_217);
float l9_223=1.0;
float l9_224=l9_213.x;
int l9_225=l9_216.x;
if (l9_225==1)
{
l9_224=fract(l9_224);
}
else
{
if (l9_225==2)
{
float l9_226=fract(l9_224);
float l9_227=l9_224-l9_226;
float l9_228=step(0.25,fract(l9_227*0.5));
l9_224=mix(l9_226,1.0-l9_226,fast::clamp(l9_228,0.0,1.0));
}
}
l9_213.x=l9_224;
float l9_229=l9_213.y;
int l9_230=l9_216.y;
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
l9_213.y=l9_229;
if (l9_217)
{
bool l9_234=l9_219;
bool l9_235;
if (l9_234)
{
l9_235=l9_216.x==3;
}
else
{
l9_235=l9_234;
}
float l9_236=l9_213.x;
float l9_237=l9_218.x;
float l9_238=l9_218.z;
bool l9_239=l9_235;
float l9_240=l9_223;
float l9_241=fast::clamp(l9_236,l9_237,l9_238);
float l9_242=step(abs(l9_236-l9_241),9.9999997e-06);
l9_240*=(l9_242+((1.0-float(l9_239))*(1.0-l9_242)));
l9_236=l9_241;
l9_213.x=l9_236;
l9_223=l9_240;
bool l9_243=l9_219;
bool l9_244;
if (l9_243)
{
l9_244=l9_216.y==3;
}
else
{
l9_244=l9_243;
}
float l9_245=l9_213.y;
float l9_246=l9_218.y;
float l9_247=l9_218.w;
bool l9_248=l9_244;
float l9_249=l9_223;
float l9_250=fast::clamp(l9_245,l9_246,l9_247);
float l9_251=step(abs(l9_245-l9_250),9.9999997e-06);
l9_249*=(l9_251+((1.0-float(l9_248))*(1.0-l9_251)));
l9_245=l9_250;
l9_213.y=l9_245;
l9_223=l9_249;
}
float2 l9_252=l9_213;
bool l9_253=l9_214;
float3x3 l9_254=l9_215;
if (l9_253)
{
l9_252=float2((l9_254*float3(l9_252,1.0)).xy);
}
float2 l9_255=l9_252;
float2 l9_256=l9_255;
float2 l9_257=l9_256;
l9_213=l9_257;
float l9_258=l9_213.x;
int l9_259=l9_216.x;
bool l9_260=l9_222;
float l9_261=l9_223;
if ((l9_259==0)||(l9_259==3))
{
float l9_262=l9_258;
float l9_263=0.0;
float l9_264=1.0;
bool l9_265=l9_260;
float l9_266=l9_261;
float l9_267=fast::clamp(l9_262,l9_263,l9_264);
float l9_268=step(abs(l9_262-l9_267),9.9999997e-06);
l9_266*=(l9_268+((1.0-float(l9_265))*(1.0-l9_268)));
l9_262=l9_267;
l9_258=l9_262;
l9_261=l9_266;
}
l9_213.x=l9_258;
l9_223=l9_261;
float l9_269=l9_213.y;
int l9_270=l9_216.y;
bool l9_271=l9_222;
float l9_272=l9_223;
if ((l9_270==0)||(l9_270==3))
{
float l9_273=l9_269;
float l9_274=0.0;
float l9_275=1.0;
bool l9_276=l9_271;
float l9_277=l9_272;
float l9_278=fast::clamp(l9_273,l9_274,l9_275);
float l9_279=step(abs(l9_273-l9_278),9.9999997e-06);
l9_277*=(l9_279+((1.0-float(l9_276))*(1.0-l9_279)));
l9_273=l9_278;
l9_269=l9_273;
l9_272=l9_277;
}
l9_213.y=l9_269;
l9_223=l9_272;
float2 l9_280=l9_213;
int l9_281=l9_211;
int l9_282=l9_212;
float l9_283=l9_221;
float2 l9_284=l9_280;
int l9_285=l9_281;
int l9_286=l9_282;
float3 l9_287=float3(0.0);
if (l9_285==0)
{
l9_287=float3(l9_284,0.0);
}
else
{
if (l9_285==1)
{
l9_287=float3(l9_284.x,(l9_284.y*0.5)+(0.5-(float(l9_286)*0.5)),0.0);
}
else
{
l9_287=float3(l9_284,float(l9_286));
}
}
float3 l9_288=l9_287;
float3 l9_289=l9_288;
float2 l9_290=l9_289.xy;
float l9_291=l9_283;
float4 l9_292=sc_set0.sVelocity.sample(sc_set0.sVelocitySmpSC,l9_290,bias(l9_291));
float4 l9_293=l9_292;
float4 l9_294=l9_293;
if (l9_219)
{
l9_294=mix(l9_220,l9_294,float4(l9_223));
}
float4 l9_295=l9_294;
l9_204=l9_295;
float4 l9_296=l9_204;
float4 l9_297=l9_296;
float2 l9_298=l9_1+(l9_4*l9_102);
float4 l9_299=float4(0.0);
int l9_300=0;
if ((int(sVelocityHasSwappedViews_tmp)!=0))
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
l9_300=1-l9_302;
}
else
{
int l9_303=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_303=0;
}
else
{
l9_303=in.varStereoViewID;
}
int l9_304=l9_303;
l9_300=l9_304;
}
int l9_305=l9_300;
int l9_306=sVelocityLayout_tmp;
int l9_307=l9_305;
float2 l9_308=l9_298;
bool l9_309=(int(SC_USE_UV_TRANSFORM_sVelocity_tmp)!=0);
float3x3 l9_310=(*sc_set0.UserUniforms).sVelocityTransform;
int2 l9_311=int2(SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp,SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp);
bool l9_312=(int(SC_USE_UV_MIN_MAX_sVelocity_tmp)!=0);
float4 l9_313=(*sc_set0.UserUniforms).sVelocityUvMinMax;
bool l9_314=(int(SC_USE_CLAMP_TO_BORDER_sVelocity_tmp)!=0);
float4 l9_315=(*sc_set0.UserUniforms).sVelocityBorderColor;
float l9_316=0.0;
bool l9_317=l9_314&&(!l9_312);
float l9_318=1.0;
float l9_319=l9_308.x;
int l9_320=l9_311.x;
if (l9_320==1)
{
l9_319=fract(l9_319);
}
else
{
if (l9_320==2)
{
float l9_321=fract(l9_319);
float l9_322=l9_319-l9_321;
float l9_323=step(0.25,fract(l9_322*0.5));
l9_319=mix(l9_321,1.0-l9_321,fast::clamp(l9_323,0.0,1.0));
}
}
l9_308.x=l9_319;
float l9_324=l9_308.y;
int l9_325=l9_311.y;
if (l9_325==1)
{
l9_324=fract(l9_324);
}
else
{
if (l9_325==2)
{
float l9_326=fract(l9_324);
float l9_327=l9_324-l9_326;
float l9_328=step(0.25,fract(l9_327*0.5));
l9_324=mix(l9_326,1.0-l9_326,fast::clamp(l9_328,0.0,1.0));
}
}
l9_308.y=l9_324;
if (l9_312)
{
bool l9_329=l9_314;
bool l9_330;
if (l9_329)
{
l9_330=l9_311.x==3;
}
else
{
l9_330=l9_329;
}
float l9_331=l9_308.x;
float l9_332=l9_313.x;
float l9_333=l9_313.z;
bool l9_334=l9_330;
float l9_335=l9_318;
float l9_336=fast::clamp(l9_331,l9_332,l9_333);
float l9_337=step(abs(l9_331-l9_336),9.9999997e-06);
l9_335*=(l9_337+((1.0-float(l9_334))*(1.0-l9_337)));
l9_331=l9_336;
l9_308.x=l9_331;
l9_318=l9_335;
bool l9_338=l9_314;
bool l9_339;
if (l9_338)
{
l9_339=l9_311.y==3;
}
else
{
l9_339=l9_338;
}
float l9_340=l9_308.y;
float l9_341=l9_313.y;
float l9_342=l9_313.w;
bool l9_343=l9_339;
float l9_344=l9_318;
float l9_345=fast::clamp(l9_340,l9_341,l9_342);
float l9_346=step(abs(l9_340-l9_345),9.9999997e-06);
l9_344*=(l9_346+((1.0-float(l9_343))*(1.0-l9_346)));
l9_340=l9_345;
l9_308.y=l9_340;
l9_318=l9_344;
}
float2 l9_347=l9_308;
bool l9_348=l9_309;
float3x3 l9_349=l9_310;
if (l9_348)
{
l9_347=float2((l9_349*float3(l9_347,1.0)).xy);
}
float2 l9_350=l9_347;
float2 l9_351=l9_350;
float2 l9_352=l9_351;
l9_308=l9_352;
float l9_353=l9_308.x;
int l9_354=l9_311.x;
bool l9_355=l9_317;
float l9_356=l9_318;
if ((l9_354==0)||(l9_354==3))
{
float l9_357=l9_353;
float l9_358=0.0;
float l9_359=1.0;
bool l9_360=l9_355;
float l9_361=l9_356;
float l9_362=fast::clamp(l9_357,l9_358,l9_359);
float l9_363=step(abs(l9_357-l9_362),9.9999997e-06);
l9_361*=(l9_363+((1.0-float(l9_360))*(1.0-l9_363)));
l9_357=l9_362;
l9_353=l9_357;
l9_356=l9_361;
}
l9_308.x=l9_353;
l9_318=l9_356;
float l9_364=l9_308.y;
int l9_365=l9_311.y;
bool l9_366=l9_317;
float l9_367=l9_318;
if ((l9_365==0)||(l9_365==3))
{
float l9_368=l9_364;
float l9_369=0.0;
float l9_370=1.0;
bool l9_371=l9_366;
float l9_372=l9_367;
float l9_373=fast::clamp(l9_368,l9_369,l9_370);
float l9_374=step(abs(l9_368-l9_373),9.9999997e-06);
l9_372*=(l9_374+((1.0-float(l9_371))*(1.0-l9_374)));
l9_368=l9_373;
l9_364=l9_368;
l9_367=l9_372;
}
l9_308.y=l9_364;
l9_318=l9_367;
float2 l9_375=l9_308;
int l9_376=l9_306;
int l9_377=l9_307;
float l9_378=l9_316;
float2 l9_379=l9_375;
int l9_380=l9_376;
int l9_381=l9_377;
float3 l9_382=float3(0.0);
if (l9_380==0)
{
l9_382=float3(l9_379,0.0);
}
else
{
if (l9_380==1)
{
l9_382=float3(l9_379.x,(l9_379.y*0.5)+(0.5-(float(l9_381)*0.5)),0.0);
}
else
{
l9_382=float3(l9_379,float(l9_381));
}
}
float3 l9_383=l9_382;
float3 l9_384=l9_383;
float2 l9_385=l9_384.xy;
float l9_386=l9_378;
float4 l9_387=sc_set0.sVelocity.sample(sc_set0.sVelocitySmpSC,l9_385,bias(l9_386));
float4 l9_388=l9_387;
float4 l9_389=l9_388;
if (l9_314)
{
l9_389=mix(l9_315,l9_389,float4(l9_318));
}
float4 l9_390=l9_389;
l9_299=l9_390;
float4 l9_391=l9_299;
float4 l9_392=l9_391;
float2 l9_393=l9_1+(l9_4*l9_103);
float4 l9_394=float4(0.0);
int l9_395=0;
if ((int(sVelocityHasSwappedViews_tmp)!=0))
{
int l9_396=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_396=0;
}
else
{
l9_396=in.varStereoViewID;
}
int l9_397=l9_396;
l9_395=1-l9_397;
}
else
{
int l9_398=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_398=0;
}
else
{
l9_398=in.varStereoViewID;
}
int l9_399=l9_398;
l9_395=l9_399;
}
int l9_400=l9_395;
int l9_401=sVelocityLayout_tmp;
int l9_402=l9_400;
float2 l9_403=l9_393;
bool l9_404=(int(SC_USE_UV_TRANSFORM_sVelocity_tmp)!=0);
float3x3 l9_405=(*sc_set0.UserUniforms).sVelocityTransform;
int2 l9_406=int2(SC_SOFTWARE_WRAP_MODE_U_sVelocity_tmp,SC_SOFTWARE_WRAP_MODE_V_sVelocity_tmp);
bool l9_407=(int(SC_USE_UV_MIN_MAX_sVelocity_tmp)!=0);
float4 l9_408=(*sc_set0.UserUniforms).sVelocityUvMinMax;
bool l9_409=(int(SC_USE_CLAMP_TO_BORDER_sVelocity_tmp)!=0);
float4 l9_410=(*sc_set0.UserUniforms).sVelocityBorderColor;
float l9_411=0.0;
bool l9_412=l9_409&&(!l9_407);
float l9_413=1.0;
float l9_414=l9_403.x;
int l9_415=l9_406.x;
if (l9_415==1)
{
l9_414=fract(l9_414);
}
else
{
if (l9_415==2)
{
float l9_416=fract(l9_414);
float l9_417=l9_414-l9_416;
float l9_418=step(0.25,fract(l9_417*0.5));
l9_414=mix(l9_416,1.0-l9_416,fast::clamp(l9_418,0.0,1.0));
}
}
l9_403.x=l9_414;
float l9_419=l9_403.y;
int l9_420=l9_406.y;
if (l9_420==1)
{
l9_419=fract(l9_419);
}
else
{
if (l9_420==2)
{
float l9_421=fract(l9_419);
float l9_422=l9_419-l9_421;
float l9_423=step(0.25,fract(l9_422*0.5));
l9_419=mix(l9_421,1.0-l9_421,fast::clamp(l9_423,0.0,1.0));
}
}
l9_403.y=l9_419;
if (l9_407)
{
bool l9_424=l9_409;
bool l9_425;
if (l9_424)
{
l9_425=l9_406.x==3;
}
else
{
l9_425=l9_424;
}
float l9_426=l9_403.x;
float l9_427=l9_408.x;
float l9_428=l9_408.z;
bool l9_429=l9_425;
float l9_430=l9_413;
float l9_431=fast::clamp(l9_426,l9_427,l9_428);
float l9_432=step(abs(l9_426-l9_431),9.9999997e-06);
l9_430*=(l9_432+((1.0-float(l9_429))*(1.0-l9_432)));
l9_426=l9_431;
l9_403.x=l9_426;
l9_413=l9_430;
bool l9_433=l9_409;
bool l9_434;
if (l9_433)
{
l9_434=l9_406.y==3;
}
else
{
l9_434=l9_433;
}
float l9_435=l9_403.y;
float l9_436=l9_408.y;
float l9_437=l9_408.w;
bool l9_438=l9_434;
float l9_439=l9_413;
float l9_440=fast::clamp(l9_435,l9_436,l9_437);
float l9_441=step(abs(l9_435-l9_440),9.9999997e-06);
l9_439*=(l9_441+((1.0-float(l9_438))*(1.0-l9_441)));
l9_435=l9_440;
l9_403.y=l9_435;
l9_413=l9_439;
}
float2 l9_442=l9_403;
bool l9_443=l9_404;
float3x3 l9_444=l9_405;
if (l9_443)
{
l9_442=float2((l9_444*float3(l9_442,1.0)).xy);
}
float2 l9_445=l9_442;
float2 l9_446=l9_445;
float2 l9_447=l9_446;
l9_403=l9_447;
float l9_448=l9_403.x;
int l9_449=l9_406.x;
bool l9_450=l9_412;
float l9_451=l9_413;
if ((l9_449==0)||(l9_449==3))
{
float l9_452=l9_448;
float l9_453=0.0;
float l9_454=1.0;
bool l9_455=l9_450;
float l9_456=l9_451;
float l9_457=fast::clamp(l9_452,l9_453,l9_454);
float l9_458=step(abs(l9_452-l9_457),9.9999997e-06);
l9_456*=(l9_458+((1.0-float(l9_455))*(1.0-l9_458)));
l9_452=l9_457;
l9_448=l9_452;
l9_451=l9_456;
}
l9_403.x=l9_448;
l9_413=l9_451;
float l9_459=l9_403.y;
int l9_460=l9_406.y;
bool l9_461=l9_412;
float l9_462=l9_413;
if ((l9_460==0)||(l9_460==3))
{
float l9_463=l9_459;
float l9_464=0.0;
float l9_465=1.0;
bool l9_466=l9_461;
float l9_467=l9_462;
float l9_468=fast::clamp(l9_463,l9_464,l9_465);
float l9_469=step(abs(l9_463-l9_468),9.9999997e-06);
l9_467*=(l9_469+((1.0-float(l9_466))*(1.0-l9_469)));
l9_463=l9_468;
l9_459=l9_463;
l9_462=l9_467;
}
l9_403.y=l9_459;
l9_413=l9_462;
float2 l9_470=l9_403;
int l9_471=l9_401;
int l9_472=l9_402;
float l9_473=l9_411;
float2 l9_474=l9_470;
int l9_475=l9_471;
int l9_476=l9_472;
float3 l9_477=float3(0.0);
if (l9_475==0)
{
l9_477=float3(l9_474,0.0);
}
else
{
if (l9_475==1)
{
l9_477=float3(l9_474.x,(l9_474.y*0.5)+(0.5-(float(l9_476)*0.5)),0.0);
}
else
{
l9_477=float3(l9_474,float(l9_476));
}
}
float3 l9_478=l9_477;
float3 l9_479=l9_478;
float2 l9_480=l9_479.xy;
float l9_481=l9_473;
float4 l9_482=sc_set0.sVelocity.sample(sc_set0.sVelocitySmpSC,l9_480,bias(l9_481));
float4 l9_483=l9_482;
float4 l9_484=l9_483;
if (l9_409)
{
l9_484=mix(l9_410,l9_484,float4(l9_413));
}
float4 l9_485=l9_484;
l9_394=l9_485;
float4 l9_486=l9_394;
float4 l9_487=l9_486;
float2 l9_488=l9_202.xy;
float l9_489=N8_velocityRange.x;
float l9_490=N8_velocityRange.y;
float l9_491=0.0;
float2 l9_492=l9_488;
float l9_493=l9_489;
float l9_494=l9_490;
float l9_495=0.99998999;
float2 l9_496=l9_492;
#if (1)
{
l9_496=floor((l9_496*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_497=dot(l9_496,float2(1.0,0.0039215689));
float l9_498=l9_497;
float l9_499=0.0;
float l9_500=l9_495;
float l9_501=l9_493;
float l9_502=l9_494;
float l9_503=l9_501+(((l9_498-l9_499)*(l9_502-l9_501))/(l9_500-l9_499));
float l9_504=l9_503;
l9_491=l9_504;
float l9_505=l9_491;
float l9_506=l9_505;
float2 l9_507=l9_202.zw;
float l9_508=N8_velocityRange.x;
float l9_509=N8_velocityRange.y;
float l9_510=0.0;
float2 l9_511=l9_507;
float l9_512=l9_508;
float l9_513=l9_509;
float l9_514=0.99998999;
float2 l9_515=l9_511;
#if (1)
{
l9_515=floor((l9_515*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_516=dot(l9_515,float2(1.0,0.0039215689));
float l9_517=l9_516;
float l9_518=0.0;
float l9_519=l9_514;
float l9_520=l9_512;
float l9_521=l9_513;
float l9_522=l9_520+(((l9_517-l9_518)*(l9_521-l9_520))/(l9_519-l9_518));
float l9_523=l9_522;
l9_510=l9_523;
float l9_524=l9_510;
float2 l9_525=float2(l9_506,l9_524)*l9_104;
float2 l9_526=l9_297.xy;
float l9_527=N8_velocityRange.x;
float l9_528=N8_velocityRange.y;
float l9_529=0.0;
float2 l9_530=l9_526;
float l9_531=l9_527;
float l9_532=l9_528;
float l9_533=0.99998999;
float2 l9_534=l9_530;
#if (1)
{
l9_534=floor((l9_534*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_535=dot(l9_534,float2(1.0,0.0039215689));
float l9_536=l9_535;
float l9_537=0.0;
float l9_538=l9_533;
float l9_539=l9_531;
float l9_540=l9_532;
float l9_541=l9_539+(((l9_536-l9_537)*(l9_540-l9_539))/(l9_538-l9_537));
float l9_542=l9_541;
l9_529=l9_542;
float l9_543=l9_529;
float l9_544=l9_543;
float2 l9_545=l9_297.zw;
float l9_546=N8_velocityRange.x;
float l9_547=N8_velocityRange.y;
float l9_548=0.0;
float2 l9_549=l9_545;
float l9_550=l9_546;
float l9_551=l9_547;
float l9_552=0.99998999;
float2 l9_553=l9_549;
#if (1)
{
l9_553=floor((l9_553*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_554=dot(l9_553,float2(1.0,0.0039215689));
float l9_555=l9_554;
float l9_556=0.0;
float l9_557=l9_552;
float l9_558=l9_550;
float l9_559=l9_551;
float l9_560=l9_558+(((l9_555-l9_556)*(l9_559-l9_558))/(l9_557-l9_556));
float l9_561=l9_560;
l9_548=l9_561;
float l9_562=l9_548;
float2 l9_563=float2(l9_544,l9_562)*l9_105;
float2 l9_564=l9_392.xy;
float l9_565=N8_velocityRange.x;
float l9_566=N8_velocityRange.y;
float l9_567=0.0;
float2 l9_568=l9_564;
float l9_569=l9_565;
float l9_570=l9_566;
float l9_571=0.99998999;
float2 l9_572=l9_568;
#if (1)
{
l9_572=floor((l9_572*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_573=dot(l9_572,float2(1.0,0.0039215689));
float l9_574=l9_573;
float l9_575=0.0;
float l9_576=l9_571;
float l9_577=l9_569;
float l9_578=l9_570;
float l9_579=l9_577+(((l9_574-l9_575)*(l9_578-l9_577))/(l9_576-l9_575));
float l9_580=l9_579;
l9_567=l9_580;
float l9_581=l9_567;
float l9_582=l9_581;
float2 l9_583=l9_392.zw;
float l9_584=N8_velocityRange.x;
float l9_585=N8_velocityRange.y;
float l9_586=0.0;
float2 l9_587=l9_583;
float l9_588=l9_584;
float l9_589=l9_585;
float l9_590=0.99998999;
float2 l9_591=l9_587;
#if (1)
{
l9_591=floor((l9_591*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_592=dot(l9_591,float2(1.0,0.0039215689));
float l9_593=l9_592;
float l9_594=0.0;
float l9_595=l9_590;
float l9_596=l9_588;
float l9_597=l9_589;
float l9_598=l9_596+(((l9_593-l9_594)*(l9_597-l9_596))/(l9_595-l9_594));
float l9_599=l9_598;
l9_586=l9_599;
float l9_600=l9_586;
float2 l9_601=float2(l9_582,l9_600)*l9_106;
float2 l9_602=l9_487.xy;
float l9_603=N8_velocityRange.x;
float l9_604=N8_velocityRange.y;
float l9_605=0.0;
float2 l9_606=l9_602;
float l9_607=l9_603;
float l9_608=l9_604;
float l9_609=0.99998999;
float2 l9_610=l9_606;
#if (1)
{
l9_610=floor((l9_610*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_611=dot(l9_610,float2(1.0,0.0039215689));
float l9_612=l9_611;
float l9_613=0.0;
float l9_614=l9_609;
float l9_615=l9_607;
float l9_616=l9_608;
float l9_617=l9_615+(((l9_612-l9_613)*(l9_616-l9_615))/(l9_614-l9_613));
float l9_618=l9_617;
l9_605=l9_618;
float l9_619=l9_605;
float l9_620=l9_619;
float2 l9_621=l9_487.zw;
float l9_622=N8_velocityRange.x;
float l9_623=N8_velocityRange.y;
float l9_624=0.0;
float2 l9_625=l9_621;
float l9_626=l9_622;
float l9_627=l9_623;
float l9_628=0.99998999;
float2 l9_629=l9_625;
#if (1)
{
l9_629=floor((l9_629*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_630=dot(l9_629,float2(1.0,0.0039215689));
float l9_631=l9_630;
float l9_632=0.0;
float l9_633=l9_628;
float l9_634=l9_626;
float l9_635=l9_627;
float l9_636=l9_634+(((l9_631-l9_632)*(l9_635-l9_634))/(l9_633-l9_632));
float l9_637=l9_636;
l9_624=l9_637;
float l9_638=l9_624;
float2 l9_639=float2(l9_620,l9_638)*l9_107;
float l9_640=(l9_525-l9_563).y+(l9_601-l9_639).x;
l9_640*=N8_halfInverseCell;
if (N8_reset>0)
{
l9_640=0.0;
}
float l9_641=l9_640;
float l9_642=N8_divergenceRange.x;
float l9_643=N8_divergenceRange.y;
float4 l9_644=float4(0.0);
float l9_645=l9_641;
float l9_646=l9_642;
float l9_647=l9_643;
float l9_648=0.99998999;
float l9_649=fast::clamp(l9_645,l9_646,l9_647);
float l9_650=l9_646;
float l9_651=l9_647;
float l9_652=0.0;
float l9_653=l9_648;
float l9_654=l9_652+(((l9_649-l9_650)*(l9_653-l9_652))/(l9_651-l9_650));
float l9_655=l9_654;
float4 l9_656=float4(1.0,255.0,65025.0,16581375.0)*l9_655;
l9_656=fract(l9_656);
l9_656-=(l9_656.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_657=l9_656;
float4 l9_658=l9_657;
l9_644=l9_658;
float4 l9_659=l9_644;
N8_divergenceOut=l9_659;
param_8=N8_divergenceOut;
divergenceOut_N8=param_8;
FinalColor=divergenceOut_N8;
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
float4 l9_660=gl_FragCoord;
float2 l9_661=floor(mod(l9_660.xy,float2(4.0)));
float l9_662=(mod(dot(l9_661,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_10<l9_662)
{
discard_fragment();
}
}
float4 param_11=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_663=param_11;
float4 l9_664=l9_663;
float l9_665=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_665=l9_664.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_665=fast::clamp(l9_664.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_665=fast::clamp(dot(l9_664.xyz,float3(l9_664.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_665=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_665=(1.0-dot(l9_664.xyz,float3(0.33333001)))*l9_664.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_665=(1.0-fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0))*l9_664.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_665=fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0)*l9_664.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_665=fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_665=fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0)*l9_664.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_665=dot(l9_664.xyz,float3(0.33333001))*l9_664.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_665=1.0-fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_665=fast::clamp(dot(l9_664.xyz,float3(1.0)),0.0,1.0);
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
float l9_666=l9_665;
float l9_667=l9_666;
float l9_668=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_667;
float3 l9_669=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_663.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_670=float4(l9_669.x,l9_669.y,l9_669.z,l9_668);
param_11=l9_670;
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
float4 l9_671=param_11;
float4 l9_672=float4(0.0);
float4 l9_673=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_674=out.FragColor0;
float4 l9_675=l9_674;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_675.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_676=l9_675;
l9_673=l9_676;
}
else
{
float4 l9_677=gl_FragCoord;
float2 l9_678=l9_677.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_679=l9_678;
float2 l9_680=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_681=1;
int l9_682=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_682=0;
}
else
{
l9_682=in.varStereoViewID;
}
int l9_683=l9_682;
int l9_684=l9_683;
float3 l9_685=float3(l9_679,0.0);
int l9_686=l9_681;
int l9_687=l9_684;
if (l9_686==1)
{
l9_685.y=((2.0*l9_685.y)+float(l9_687))-1.0;
}
float2 l9_688=l9_685.xy;
l9_680=l9_688;
}
else
{
l9_680=l9_679;
}
float2 l9_689=l9_680;
float2 l9_690=l9_689;
float2 l9_691=l9_690;
int l9_692=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_693=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_693=0;
}
else
{
l9_693=in.varStereoViewID;
}
int l9_694=l9_693;
l9_692=1-l9_694;
}
else
{
int l9_695=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_695=0;
}
else
{
l9_695=in.varStereoViewID;
}
int l9_696=l9_695;
l9_692=l9_696;
}
int l9_697=l9_692;
float2 l9_698=l9_691;
int l9_699=l9_697;
float2 l9_700=l9_698;
int l9_701=l9_699;
float l9_702=0.0;
float4 l9_703=float4(0.0);
float2 l9_704=l9_700;
int l9_705=sc_ScreenTextureLayout_tmp;
int l9_706=l9_701;
float l9_707=l9_702;
float2 l9_708=l9_704;
int l9_709=l9_705;
int l9_710=l9_706;
float3 l9_711=float3(0.0);
if (l9_709==0)
{
l9_711=float3(l9_708,0.0);
}
else
{
if (l9_709==1)
{
l9_711=float3(l9_708.x,(l9_708.y*0.5)+(0.5-(float(l9_710)*0.5)),0.0);
}
else
{
l9_711=float3(l9_708,float(l9_710));
}
}
float3 l9_712=l9_711;
float3 l9_713=l9_712;
float2 l9_714=l9_713.xy;
float l9_715=l9_707;
float4 l9_716=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_714,bias(l9_715));
float4 l9_717=l9_716;
l9_703=l9_717;
float4 l9_718=l9_703;
float4 l9_719=l9_718;
float4 l9_720=l9_719;
l9_673=l9_720;
}
float4 l9_721=l9_673;
float4 l9_722=l9_721;
float3 l9_723=l9_722.xyz;
float3 l9_724=l9_723;
float3 l9_725=l9_671.xyz;
float3 l9_726=definedBlend(l9_724,l9_725,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_672=float4(l9_726.x,l9_726.y,l9_726.z,l9_672.w);
float3 l9_727=mix(l9_723,l9_672.xyz,float3(l9_671.w));
l9_672=float4(l9_727.x,l9_727.y,l9_727.z,l9_672.w);
l9_672.w=1.0;
float4 l9_728=l9_672;
param_11=l9_728;
}
else
{
float4 l9_729=param_11;
float4 l9_730=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_730=float4(mix(float3(1.0),l9_729.xyz,float3(l9_729.w)),l9_729.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_731=l9_729.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_731=fast::clamp(l9_731,0.0,1.0);
}
l9_730=float4(l9_729.xyz*l9_731,l9_731);
}
else
{
l9_730=l9_729;
}
}
float4 l9_732=l9_730;
param_11=l9_732;
}
}
}
float4 l9_733=param_11;
FinalColor=l9_733;
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
float4 l9_734=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_734=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_734=float4(0.0);
}
float4 l9_735=l9_734;
float4 Cost=l9_735;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_12=in.varPos;
float4 param_13=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_12,param_13,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_14=FinalColor;
float4 l9_736=param_14;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_736.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_736;
return out;
}
} // FRAGMENT SHADER
