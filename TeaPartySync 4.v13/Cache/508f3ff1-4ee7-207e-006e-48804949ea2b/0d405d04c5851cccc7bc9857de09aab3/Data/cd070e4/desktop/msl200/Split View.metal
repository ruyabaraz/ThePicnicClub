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
//sampler sampler depthTargetSmpSC 0:20
//sampler sampler fluidPressureSmpSC 0:21
//sampler sampler intensityTextureSmpSC 0:22
//sampler sampler oceanHeightmapSmpSC 0:23
//sampler sampler sc_ScreenTextureSmpSC 0:28
//sampler sampler screenTexSmpSC 0:31
//texture texture2D depthTarget 0:1:0:20
//texture texture2D fluidPressure 0:2:0:21
//texture texture2D intensityTexture 0:3:0:22
//texture texture2D oceanHeightmap 0:4:0:23
//texture texture2D sc_ScreenTexture 0:16:0:28
//texture texture2D screenTex 0:19:0:31
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:32:4960 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
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
//float3x3 depthTargetTransform 4176
//float4 depthTargetUvMinMax 4224
//float4 depthTargetBorderColor 4240
//float4 depthTargetProjectionMatrixTerms 4256
//float3 oceanPos 4272
//float3 oceanMin 4288
//float3 oceanMax 4304
//float3x3 oceanHeightmapTransform 4368
//float4 oceanHeightmapUvMinMax 4416
//float4 oceanHeightmapBorderColor 4432
//float2 unpackVal 4448
//float enableFluid 4456
//float2 pressureRange 4464
//float3x3 fluidPressureTransform 4528
//float4 fluidPressureUvMinMax 4576
//float4 fluidPressureBorderColor 4592
//float fluidMul 4608
//float4 screenTexSize 4624
//float3x3 screenTexTransform 4672
//float4 screenTexUvMinMax 4720
//float4 screenTexBorderColor 4736
//float blurFactor 4752
//float3 underwaterTint 4768
//float enableLine 4784
//float3 lineTint 4800
//float meniscusThickness 4816
//float2 Port_Input0_N228 4824
//float Port_Input1_N233 4840
//float Port_Input1_N235 4844
//float Port_Value3_N237 4852
//float Port_Input1_N050 4868
//float2 Port_Item0_N064 4880
//float2 Port_Item1_N064 4888
//float2 Port_Item2_N064 4896
//float2 Port_Item3_N064 4904
//float2 Port_Item4_N064 4912
//float2 Port_Item5_N064 4920
//float2 Port_Item6_N064 4928
//float2 Port_Item7_N064 4936
//float Port_Input2_N069 4944
//float Port_Depth_N004 4948
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_depthTarget 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 35 0
//spec_const bool SC_USE_UV_MIN_MAX_depthTarget 36 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 37 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 38 0
//spec_const bool SC_USE_UV_MIN_MAX_oceanHeightmap 39 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 40 0
//spec_const bool SC_USE_UV_TRANSFORM_depthTarget 41 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 42 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 43 0
//spec_const bool SC_USE_UV_TRANSFORM_oceanHeightmap 44 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
//spec_const bool depthTargetHasSwappedViews 47 0
//spec_const bool fluidPressureHasSwappedViews 48 0
//spec_const bool intensityTextureHasSwappedViews 49 0
//spec_const bool oceanHeightmapHasSwappedViews 50 0
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
//spec_const bool sc_BlendMode_Software 66 0
//spec_const bool sc_DepthOnly 67 0
//spec_const bool sc_FramebufferFetch 68 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 69 0
//spec_const bool sc_IsEditor 70 0
//spec_const bool sc_MotionVectorsPass 71 0
//spec_const bool sc_OITCompositingPass 72 0
//spec_const bool sc_OITDepthBoundsPass 73 0
//spec_const bool sc_OITDepthGatherPass 74 0
//spec_const bool sc_ProjectiveShadowsCaster 75 0
//spec_const bool sc_ProjectiveShadowsReceiver 76 0
//spec_const bool sc_RenderAlphaToColor 77 0
//spec_const bool sc_ScreenTextureHasSwappedViews 78 0
//spec_const bool sc_ShaderComplexityAnalyzer 79 0
//spec_const bool sc_TAAEnabled 80 0
//spec_const bool sc_UseFramebufferFetchMarker 81 0
//spec_const bool sc_VertexBlendingUseNormals 82 0
//spec_const bool sc_VertexBlending 83 0
//spec_const bool screenTexHasSwappedViews 84 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_depthTarget 85 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 86 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 87 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap 88 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_depthTarget 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 92 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 94 -1
//spec_const int depthTargetLayout 95 0
//spec_const int fluidPressureLayout 96 0
//spec_const int intensityTextureLayout 97 0
//spec_const int oceanHeightmapLayout 98 0
//spec_const int sc_DepthBufferMode 99 0
//spec_const int sc_RenderingSpace 100 -1
//spec_const int sc_ScreenTextureLayout 101 0
//spec_const int sc_ShaderCacheConstant 102 0
//spec_const int sc_SkinBonesCount 103 0
//spec_const int sc_StereoRenderingMode 104 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 105 0
//spec_const int screenTexLayout 106 0
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
constant bool SC_USE_CLAMP_TO_BORDER_depthTarget [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_depthTarget_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_depthTarget) ? SC_USE_CLAMP_TO_BORDER_depthTarget : false;
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_fluidPressure) ? SC_USE_CLAMP_TO_BORDER_fluidPressure : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_oceanHeightmap) ? SC_USE_CLAMP_TO_BORDER_oceanHeightmap : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTex [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTex) ? SC_USE_CLAMP_TO_BORDER_screenTex : false;
constant bool SC_USE_UV_MIN_MAX_depthTarget [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_depthTarget_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_depthTarget) ? SC_USE_UV_MIN_MAX_depthTarget : false;
constant bool SC_USE_UV_MIN_MAX_fluidPressure [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_fluidPressure) ? SC_USE_UV_MIN_MAX_fluidPressure : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_oceanHeightmap [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_oceanHeightmap) ? SC_USE_UV_MIN_MAX_oceanHeightmap : false;
constant bool SC_USE_UV_MIN_MAX_screenTex [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_screenTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTex) ? SC_USE_UV_MIN_MAX_screenTex : false;
constant bool SC_USE_UV_TRANSFORM_depthTarget [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_depthTarget_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_depthTarget) ? SC_USE_UV_TRANSFORM_depthTarget : false;
constant bool SC_USE_UV_TRANSFORM_fluidPressure [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_fluidPressure) ? SC_USE_UV_TRANSFORM_fluidPressure : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_oceanHeightmap [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_oceanHeightmap_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_oceanHeightmap) ? SC_USE_UV_TRANSFORM_oceanHeightmap : false;
constant bool SC_USE_UV_TRANSFORM_screenTex [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_screenTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTex) ? SC_USE_UV_TRANSFORM_screenTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(46)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool depthTargetHasSwappedViews [[function_constant(47)]];
constant bool depthTargetHasSwappedViews_tmp = is_function_constant_defined(depthTargetHasSwappedViews) ? depthTargetHasSwappedViews : false;
constant bool fluidPressureHasSwappedViews [[function_constant(48)]];
constant bool fluidPressureHasSwappedViews_tmp = is_function_constant_defined(fluidPressureHasSwappedViews) ? fluidPressureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(49)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool oceanHeightmapHasSwappedViews [[function_constant(50)]];
constant bool oceanHeightmapHasSwappedViews_tmp = is_function_constant_defined(oceanHeightmapHasSwappedViews) ? oceanHeightmapHasSwappedViews : false;
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
constant bool sc_BlendMode_Software [[function_constant(66)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_DepthOnly [[function_constant(67)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(68)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(69)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_IsEditor [[function_constant(70)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_MotionVectorsPass [[function_constant(71)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(72)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(73)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(74)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(75)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(76)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(77)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(78)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(79)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(80)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(81)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(82)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(83)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool screenTexHasSwappedViews [[function_constant(84)]];
constant bool screenTexHasSwappedViews_tmp = is_function_constant_defined(screenTexHasSwappedViews) ? screenTexHasSwappedViews : false;
constant int SC_SOFTWARE_WRAP_MODE_U_depthTarget [[function_constant(85)]];
constant int SC_SOFTWARE_WRAP_MODE_U_depthTarget_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_depthTarget) ? SC_SOFTWARE_WRAP_MODE_U_depthTarget : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure [[function_constant(86)]];
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_U_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(87)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap [[function_constant(88)]];
constant int SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap) ? SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex [[function_constant(89)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTex) ? SC_SOFTWARE_WRAP_MODE_U_screenTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_depthTarget [[function_constant(90)]];
constant int SC_SOFTWARE_WRAP_MODE_V_depthTarget_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_depthTarget) ? SC_SOFTWARE_WRAP_MODE_V_depthTarget : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure [[function_constant(91)]];
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_V_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(92)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap [[function_constant(93)]];
constant int SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap) ? SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex [[function_constant(94)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTex) ? SC_SOFTWARE_WRAP_MODE_V_screenTex : -1;
constant int depthTargetLayout [[function_constant(95)]];
constant int depthTargetLayout_tmp = is_function_constant_defined(depthTargetLayout) ? depthTargetLayout : 0;
constant int fluidPressureLayout [[function_constant(96)]];
constant int fluidPressureLayout_tmp = is_function_constant_defined(fluidPressureLayout) ? fluidPressureLayout : 0;
constant int intensityTextureLayout [[function_constant(97)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int oceanHeightmapLayout [[function_constant(98)]];
constant int oceanHeightmapLayout_tmp = is_function_constant_defined(oceanHeightmapLayout) ? oceanHeightmapLayout : 0;
constant int sc_DepthBufferMode [[function_constant(99)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(100)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(101)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(102)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(103)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(104)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(105)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTexLayout [[function_constant(106)]];
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
float4 depthTargetSize;
float4 depthTargetDims;
float4 depthTargetView;
float3x3 depthTargetTransform;
float4 depthTargetUvMinMax;
float4 depthTargetBorderColor;
float4 depthTargetProjectionMatrixTerms;
float3 oceanPos;
float3 oceanMin;
float3 oceanMax;
float4 oceanHeightmapSize;
float4 oceanHeightmapDims;
float4 oceanHeightmapView;
float3x3 oceanHeightmapTransform;
float4 oceanHeightmapUvMinMax;
float4 oceanHeightmapBorderColor;
float2 unpackVal;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float blurFactor;
float3 underwaterTint;
float enableLine;
float3 lineTint;
float meniscusThickness;
float2 Port_Input0_N228;
float2 Port_Import_N227;
float Port_Input1_N233;
float Port_Input1_N235;
float Port_Import_N225;
float Port_Value3_N237;
float2 Port_Import_N039;
float Port_Import_N040;
float Port_Input1_N050;
float2 Port_Import_N055;
float2 Port_Item0_N064;
float2 Port_Item1_N064;
float2 Port_Item2_N064;
float2 Port_Item3_N064;
float2 Port_Item4_N064;
float2 Port_Item5_N064;
float2 Port_Item6_N064;
float2 Port_Item7_N064;
float Port_Input2_N069;
float Port_Depth_N004;
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
texture2d<float> depthTarget [[id(1)]];
texture2d<float> fluidPressure [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> oceanHeightmap [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> screenTex [[id(19)]];
sampler depthTargetSmpSC [[id(20)]];
sampler fluidPressureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler oceanHeightmapSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler screenTexSmpSC [[id(31)]];
constant userUniformsObj* UserUniforms [[id(32)]];
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
float2 gScreenCoord;
float CameraFOV;
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
float4 depthTargetSize;
float4 depthTargetDims;
float4 depthTargetView;
float3x3 depthTargetTransform;
float4 depthTargetUvMinMax;
float4 depthTargetBorderColor;
float4 depthTargetProjectionMatrixTerms;
float3 oceanPos;
float3 oceanMin;
float3 oceanMax;
float4 oceanHeightmapSize;
float4 oceanHeightmapDims;
float4 oceanHeightmapView;
float3x3 oceanHeightmapTransform;
float4 oceanHeightmapUvMinMax;
float4 oceanHeightmapBorderColor;
float2 unpackVal;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float blurFactor;
float3 underwaterTint;
float enableLine;
float3 lineTint;
float meniscusThickness;
float2 Port_Input0_N228;
float2 Port_Import_N227;
float Port_Input1_N233;
float Port_Input1_N235;
float Port_Import_N225;
float Port_Value3_N237;
float2 Port_Import_N039;
float Port_Import_N040;
float Port_Input1_N050;
float2 Port_Import_N055;
float2 Port_Item0_N064;
float2 Port_Item1_N064;
float2 Port_Item2_N064;
float2 Port_Item3_N064;
float2 Port_Item4_N064;
float2 Port_Item5_N064;
float2 Port_Item6_N064;
float2 Port_Item7_N064;
float Port_Input2_N069;
float Port_Depth_N004;
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
texture2d<float> depthTarget [[id(1)]];
texture2d<float> fluidPressure [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> oceanHeightmap [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> screenTex [[id(19)]];
sampler depthTargetSmpSC [[id(20)]];
sampler fluidPressureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler oceanHeightmapSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler screenTexSmpSC [[id(31)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
float gl_FragDepth [[depth(any)]];
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
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
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
bool N5_EnableLine=false;
float3 N5_OceanSurfacePos=float3(0.0);
float3 N5_OceanWorldTransform=float3(0.0);
float3 N5_OceanAabbMin=float3(0.0);
float3 N5_OceanAabbMax=float3(0.0);
float2 N5_unpackVal=float2(0.0);
float N5_EnableFluid=0.0;
float2 N5_pressureRange=float2(0.0);
float N5_FluidMul=0.0;
float3 N5_Underwater=float3(0.0);
float3 N5_LineColor=float3(0.0);
float N5_Thickness=0.0;
float4 N5_Result=float4(0.0);
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
float Depth=(*sc_set0.UserUniforms).Port_Depth_N004;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
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
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=in.varStereoViewID;
}
int l9_15=l9_14;
Globals.CameraFOV=(atan(1.0/(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_15][1].y)*2.0)*57.29578;
Globals.Loop_Index_ID0=0.0;
Globals.Loop_Ratio_ID0=0.0;
Globals.Loop_Count_ID0=0.0;
float4x4 Matrix_N224=float4x4(float4(0.0),float4(0.0),float4(0.0),float4(0.0));
int l9_16=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_16=0;
}
else
{
l9_16=in.varStereoViewID;
}
int l9_17=l9_16;
Matrix_N224=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_17];
float2 ScreenCoord_N14=float2(0.0);
ScreenCoord_N14=Globals.gScreenCoord;
float2 Value_N227=float2(0.0);
Value_N227=ScreenCoord_N14;
float2 Output_N228=float2(0.0);
Output_N228=(*sc_set0.UserUniforms).Port_Input0_N228-Value_N227;
float Camera_Aspect_N229=0.0;
Camera_Aspect_N229=(*sc_set0.UserUniforms).sc_Camera.aspect;
float2 Output_N230=float2(0.0);
Output_N230=float2(Camera_Aspect_N229,1.0);
float Camera_FOV_N231=0.0;
Camera_FOV_N231=Globals.CameraFOV;
float Output_N232=0.0;
Output_N232=radians(Camera_FOV_N231);
float Output_N233=0.0;
Output_N233=Output_N232*(*sc_set0.UserUniforms).Port_Input1_N233;
float Output_N234=0.0;
Output_N234=tan(Output_N233);
float Output_N235=0.0;
Output_N235=Output_N234*(*sc_set0.UserUniforms).Port_Input1_N235;
float Depth_N10=0.0;
int l9_18=0;
if ((int(depthTargetHasSwappedViews_tmp)!=0))
{
int l9_19=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_19=0;
}
else
{
l9_19=in.varStereoViewID;
}
int l9_20=l9_19;
l9_18=1-l9_20;
}
else
{
int l9_21=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_21=0;
}
else
{
l9_21=in.varStereoViewID;
}
int l9_22=l9_21;
l9_18=l9_22;
}
int l9_23=l9_18;
int param=depthTargetLayout_tmp;
int param_1=l9_23;
float2 param_2=Globals.Surface_UVCoord0;
bool param_3=(int(SC_USE_UV_TRANSFORM_depthTarget_tmp)!=0);
float3x3 param_4=(*sc_set0.UserUniforms).depthTargetTransform;
int2 param_5=int2(SC_SOFTWARE_WRAP_MODE_U_depthTarget_tmp,SC_SOFTWARE_WRAP_MODE_V_depthTarget_tmp);
bool param_6=(int(SC_USE_UV_MIN_MAX_depthTarget_tmp)!=0);
float4 param_7=(*sc_set0.UserUniforms).depthTargetUvMinMax;
bool param_8=(int(SC_USE_CLAMP_TO_BORDER_depthTarget_tmp)!=0);
float4 param_9=(*sc_set0.UserUniforms).depthTargetBorderColor;
float param_10=0.0;
bool l9_24=param_8&&(!param_6);
float l9_25=1.0;
float l9_26=param_2.x;
int l9_27=param_5.x;
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
param_2.x=l9_26;
float l9_31=param_2.y;
int l9_32=param_5.y;
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
param_2.y=l9_31;
if (param_6)
{
bool l9_36=param_8;
bool l9_37;
if (l9_36)
{
l9_37=param_5.x==3;
}
else
{
l9_37=l9_36;
}
float l9_38=param_2.x;
float l9_39=param_7.x;
float l9_40=param_7.z;
bool l9_41=l9_37;
float l9_42=l9_25;
float l9_43=fast::clamp(l9_38,l9_39,l9_40);
float l9_44=step(abs(l9_38-l9_43),9.9999997e-06);
l9_42*=(l9_44+((1.0-float(l9_41))*(1.0-l9_44)));
l9_38=l9_43;
param_2.x=l9_38;
l9_25=l9_42;
bool l9_45=param_8;
bool l9_46;
if (l9_45)
{
l9_46=param_5.y==3;
}
else
{
l9_46=l9_45;
}
float l9_47=param_2.y;
float l9_48=param_7.y;
float l9_49=param_7.w;
bool l9_50=l9_46;
float l9_51=l9_25;
float l9_52=fast::clamp(l9_47,l9_48,l9_49);
float l9_53=step(abs(l9_47-l9_52),9.9999997e-06);
l9_51*=(l9_53+((1.0-float(l9_50))*(1.0-l9_53)));
l9_47=l9_52;
param_2.y=l9_47;
l9_25=l9_51;
}
float2 l9_54=param_2;
bool l9_55=param_3;
float3x3 l9_56=param_4;
if (l9_55)
{
l9_54=float2((l9_56*float3(l9_54,1.0)).xy);
}
float2 l9_57=l9_54;
float2 l9_58=l9_57;
float2 l9_59=l9_58;
param_2=l9_59;
float l9_60=param_2.x;
int l9_61=param_5.x;
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
param_2.x=l9_60;
l9_25=l9_63;
float l9_71=param_2.y;
int l9_72=param_5.y;
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
param_2.y=l9_71;
l9_25=l9_74;
float2 l9_82=param_2;
int l9_83=param;
int l9_84=param_1;
float l9_85=param_10;
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
float4 l9_94=sc_set0.depthTarget.sample(sc_set0.depthTargetSmpSC,l9_92,bias(l9_93));
float4 l9_95=l9_94;
float4 l9_96=l9_95;
if (param_8)
{
l9_96=mix(param_9,l9_96,float4(l9_25));
}
float4 l9_97=l9_96;
float param_11=l9_97.x;
float4 param_12=(*sc_set0.UserUniforms).depthTargetProjectionMatrixTerms;
float l9_98=param_12.x;
float l9_99=param_12.y;
bool l9_100=param_12.z==0.0;
param_11=(param_11*2.0)-1.0;
float l9_101;
if (l9_100)
{
l9_101=(param_11-l9_99)/l9_98;
}
else
{
l9_101=l9_99/((-param_11)-l9_98);
}
float l9_102=l9_101;
Depth_N10=l9_102;
float Value_N225=0.0;
Value_N225=Depth_N10;
float2 Output_N236=float2(0.0);
Output_N236=((Output_N228*Output_N230)*float2(Output_N235))*float2(Value_N225);
float4 Value_N237=float4(0.0);
Value_N237=float4(Output_N236.x,Output_N236.y,Value_N237.z,Value_N237.w);
Value_N237.z=Value_N225;
Value_N237.w=(*sc_set0.UserUniforms).Port_Value3_N237;
float4 Output_N238=float4(0.0);
Output_N238=Matrix_N224*Value_N237;
float3 Export_N239=float3(0.0);
Export_N239=Output_N238.xyz;
float3 Output_N1=float3(0.0);
float3 param_13=(*sc_set0.UserUniforms).oceanPos;
Output_N1=param_13;
float3 Output_N6=float3(0.0);
float3 param_14=(*sc_set0.UserUniforms).oceanMin;
Output_N6=param_14;
float3 Output_N9=float3(0.0);
float3 param_15=(*sc_set0.UserUniforms).oceanMax;
Output_N9=param_15;
float2 Output_N7=float2(0.0);
float2 param_16=(*sc_set0.UserUniforms).unpackVal;
Output_N7=param_16;
float Output_N18=0.0;
float param_17=(*sc_set0.UserUniforms).enableFluid;
Output_N18=param_17;
float2 Output_N32=float2(0.0);
float2 param_18=(*sc_set0.UserUniforms).pressureRange;
Output_N32=param_18;
float Output_N22=0.0;
float param_19=(*sc_set0.UserUniforms).fluidMul;
Output_N22=param_19;
float2 ScreenCoord_N0=float2(0.0);
ScreenCoord_N0=Globals.gScreenCoord;
float2 Value_N39=float2(0.0);
Value_N39=ScreenCoord_N0;
float Output_N48=0.0;
float param_20=(*sc_set0.UserUniforms).blurFactor;
Output_N48=param_20;
float Value_N40=0.0;
Value_N40=Output_N48;
float Output_N50=0.0;
Output_N50=Value_N40+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 Color_N54=float4(0.0);
int l9_103=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_104=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_104=0;
}
else
{
l9_104=in.varStereoViewID;
}
int l9_105=l9_104;
l9_103=1-l9_105;
}
else
{
int l9_106=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_106=0;
}
else
{
l9_106=in.varStereoViewID;
}
int l9_107=l9_106;
l9_103=l9_107;
}
int l9_108=l9_103;
int param_21=screenTexLayout_tmp;
int param_22=l9_108;
float2 param_23=Value_N39;
bool param_24=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 param_25=(*sc_set0.UserUniforms).screenTexTransform;
int2 param_26=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool param_27=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 param_28=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool param_29=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 param_30=(*sc_set0.UserUniforms).screenTexBorderColor;
float param_31=Output_N50;
bool l9_109=param_29&&(!param_27);
float l9_110=1.0;
float l9_111=param_23.x;
int l9_112=param_26.x;
if (l9_112==1)
{
l9_111=fract(l9_111);
}
else
{
if (l9_112==2)
{
float l9_113=fract(l9_111);
float l9_114=l9_111-l9_113;
float l9_115=step(0.25,fract(l9_114*0.5));
l9_111=mix(l9_113,1.0-l9_113,fast::clamp(l9_115,0.0,1.0));
}
}
param_23.x=l9_111;
float l9_116=param_23.y;
int l9_117=param_26.y;
if (l9_117==1)
{
l9_116=fract(l9_116);
}
else
{
if (l9_117==2)
{
float l9_118=fract(l9_116);
float l9_119=l9_116-l9_118;
float l9_120=step(0.25,fract(l9_119*0.5));
l9_116=mix(l9_118,1.0-l9_118,fast::clamp(l9_120,0.0,1.0));
}
}
param_23.y=l9_116;
if (param_27)
{
bool l9_121=param_29;
bool l9_122;
if (l9_121)
{
l9_122=param_26.x==3;
}
else
{
l9_122=l9_121;
}
float l9_123=param_23.x;
float l9_124=param_28.x;
float l9_125=param_28.z;
bool l9_126=l9_122;
float l9_127=l9_110;
float l9_128=fast::clamp(l9_123,l9_124,l9_125);
float l9_129=step(abs(l9_123-l9_128),9.9999997e-06);
l9_127*=(l9_129+((1.0-float(l9_126))*(1.0-l9_129)));
l9_123=l9_128;
param_23.x=l9_123;
l9_110=l9_127;
bool l9_130=param_29;
bool l9_131;
if (l9_130)
{
l9_131=param_26.y==3;
}
else
{
l9_131=l9_130;
}
float l9_132=param_23.y;
float l9_133=param_28.y;
float l9_134=param_28.w;
bool l9_135=l9_131;
float l9_136=l9_110;
float l9_137=fast::clamp(l9_132,l9_133,l9_134);
float l9_138=step(abs(l9_132-l9_137),9.9999997e-06);
l9_136*=(l9_138+((1.0-float(l9_135))*(1.0-l9_138)));
l9_132=l9_137;
param_23.y=l9_132;
l9_110=l9_136;
}
float2 l9_139=param_23;
bool l9_140=param_24;
float3x3 l9_141=param_25;
if (l9_140)
{
l9_139=float2((l9_141*float3(l9_139,1.0)).xy);
}
float2 l9_142=l9_139;
float2 l9_143=l9_142;
float2 l9_144=l9_143;
param_23=l9_144;
float l9_145=param_23.x;
int l9_146=param_26.x;
bool l9_147=l9_109;
float l9_148=l9_110;
if ((l9_146==0)||(l9_146==3))
{
float l9_149=l9_145;
float l9_150=0.0;
float l9_151=1.0;
bool l9_152=l9_147;
float l9_153=l9_148;
float l9_154=fast::clamp(l9_149,l9_150,l9_151);
float l9_155=step(abs(l9_149-l9_154),9.9999997e-06);
l9_153*=(l9_155+((1.0-float(l9_152))*(1.0-l9_155)));
l9_149=l9_154;
l9_145=l9_149;
l9_148=l9_153;
}
param_23.x=l9_145;
l9_110=l9_148;
float l9_156=param_23.y;
int l9_157=param_26.y;
bool l9_158=l9_109;
float l9_159=l9_110;
if ((l9_157==0)||(l9_157==3))
{
float l9_160=l9_156;
float l9_161=0.0;
float l9_162=1.0;
bool l9_163=l9_158;
float l9_164=l9_159;
float l9_165=fast::clamp(l9_160,l9_161,l9_162);
float l9_166=step(abs(l9_160-l9_165),9.9999997e-06);
l9_164*=(l9_166+((1.0-float(l9_163))*(1.0-l9_166)));
l9_160=l9_165;
l9_156=l9_160;
l9_159=l9_164;
}
param_23.y=l9_156;
l9_110=l9_159;
float2 l9_167=param_23;
int l9_168=param_21;
int l9_169=param_22;
float l9_170=param_31;
float2 l9_171=l9_167;
int l9_172=l9_168;
int l9_173=l9_169;
float3 l9_174=float3(0.0);
if (l9_172==0)
{
l9_174=float3(l9_171,0.0);
}
else
{
if (l9_172==1)
{
l9_174=float3(l9_171.x,(l9_171.y*0.5)+(0.5-(float(l9_173)*0.5)),0.0);
}
else
{
l9_174=float3(l9_171,float(l9_173));
}
}
float3 l9_175=l9_174;
float3 l9_176=l9_175;
float2 l9_177=l9_176.xy;
float l9_178=l9_170;
float4 l9_179=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_177,level(l9_178));
float4 l9_180=l9_179;
float4 l9_181=l9_180;
if (param_29)
{
l9_181=mix(param_30,l9_181,float4(l9_110));
}
float4 l9_182=l9_181;
Color_N54=l9_182;
float4 Output_N68=float4(0.0);
ssGlobals param_33=Globals;
float4 param_32=float4(0.0);
param_33.Loop_Count_ID0=8.0;
float4 l9_183=param_32;
ssGlobals l9_184=param_33;
float4 l9_185=float4(0.0);
l9_184.Loop_Index_ID0=0.0;
l9_184.Loop_Ratio_ID0=0.0;
float2 l9_186=float2(0.0);
float2 l9_187=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_186=l9_187;
float2 l9_188=float2(0.0);
l9_188=l9_184.gScreenCoord;
float2 l9_189=float2(0.0);
l9_189=l9_188;
float2 l9_190=float2(0.0);
l9_190=l9_186;
float l9_191=0.0;
float l9_192=(*sc_set0.UserUniforms).blurFactor;
l9_191=l9_192;
float l9_193=0.0;
l9_193=l9_191;
float l9_194=0.0;
l9_194=exp2(l9_193);
float l9_195=0.0;
l9_195=l9_184.Loop_Index_ID0;
float2 l9_196=float2(0.0);
float l9_197=l9_195;
float2 l9_198=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_199=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_200=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_201=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_202=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_203=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_204=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_205=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_206[8];
l9_206[0]=l9_198;
l9_206[1]=l9_199;
l9_206[2]=l9_200;
l9_206[3]=l9_201;
l9_206[4]=l9_202;
l9_206[5]=l9_203;
l9_206[6]=l9_204;
l9_206[7]=l9_205;
int l9_207=int(fast::clamp(l9_197+9.9999997e-05,0.0,7.0));
float2 l9_208=l9_206[l9_207];
l9_196=l9_208;
float2 l9_209=float2(0.0);
l9_209=(l9_190*float2(l9_194))*l9_196;
float2 l9_210=float2(0.0);
l9_210=l9_189+l9_209;
float l9_211=0.0;
l9_211=l9_193+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_212=float4(0.0);
int l9_213=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=in.varStereoViewID;
}
int l9_215=l9_214;
l9_213=1-l9_215;
}
else
{
int l9_216=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_216=0;
}
else
{
l9_216=in.varStereoViewID;
}
int l9_217=l9_216;
l9_213=l9_217;
}
int l9_218=l9_213;
int l9_219=screenTexLayout_tmp;
int l9_220=l9_218;
float2 l9_221=l9_210;
bool l9_222=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_223=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_224=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_225=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_226=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_227=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_228=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_229=l9_211;
bool l9_230=l9_227&&(!l9_225);
float l9_231=1.0;
float l9_232=l9_221.x;
int l9_233=l9_224.x;
if (l9_233==1)
{
l9_232=fract(l9_232);
}
else
{
if (l9_233==2)
{
float l9_234=fract(l9_232);
float l9_235=l9_232-l9_234;
float l9_236=step(0.25,fract(l9_235*0.5));
l9_232=mix(l9_234,1.0-l9_234,fast::clamp(l9_236,0.0,1.0));
}
}
l9_221.x=l9_232;
float l9_237=l9_221.y;
int l9_238=l9_224.y;
if (l9_238==1)
{
l9_237=fract(l9_237);
}
else
{
if (l9_238==2)
{
float l9_239=fract(l9_237);
float l9_240=l9_237-l9_239;
float l9_241=step(0.25,fract(l9_240*0.5));
l9_237=mix(l9_239,1.0-l9_239,fast::clamp(l9_241,0.0,1.0));
}
}
l9_221.y=l9_237;
if (l9_225)
{
bool l9_242=l9_227;
bool l9_243;
if (l9_242)
{
l9_243=l9_224.x==3;
}
else
{
l9_243=l9_242;
}
float l9_244=l9_221.x;
float l9_245=l9_226.x;
float l9_246=l9_226.z;
bool l9_247=l9_243;
float l9_248=l9_231;
float l9_249=fast::clamp(l9_244,l9_245,l9_246);
float l9_250=step(abs(l9_244-l9_249),9.9999997e-06);
l9_248*=(l9_250+((1.0-float(l9_247))*(1.0-l9_250)));
l9_244=l9_249;
l9_221.x=l9_244;
l9_231=l9_248;
bool l9_251=l9_227;
bool l9_252;
if (l9_251)
{
l9_252=l9_224.y==3;
}
else
{
l9_252=l9_251;
}
float l9_253=l9_221.y;
float l9_254=l9_226.y;
float l9_255=l9_226.w;
bool l9_256=l9_252;
float l9_257=l9_231;
float l9_258=fast::clamp(l9_253,l9_254,l9_255);
float l9_259=step(abs(l9_253-l9_258),9.9999997e-06);
l9_257*=(l9_259+((1.0-float(l9_256))*(1.0-l9_259)));
l9_253=l9_258;
l9_221.y=l9_253;
l9_231=l9_257;
}
float2 l9_260=l9_221;
bool l9_261=l9_222;
float3x3 l9_262=l9_223;
if (l9_261)
{
l9_260=float2((l9_262*float3(l9_260,1.0)).xy);
}
float2 l9_263=l9_260;
float2 l9_264=l9_263;
float2 l9_265=l9_264;
l9_221=l9_265;
float l9_266=l9_221.x;
int l9_267=l9_224.x;
bool l9_268=l9_230;
float l9_269=l9_231;
if ((l9_267==0)||(l9_267==3))
{
float l9_270=l9_266;
float l9_271=0.0;
float l9_272=1.0;
bool l9_273=l9_268;
float l9_274=l9_269;
float l9_275=fast::clamp(l9_270,l9_271,l9_272);
float l9_276=step(abs(l9_270-l9_275),9.9999997e-06);
l9_274*=(l9_276+((1.0-float(l9_273))*(1.0-l9_276)));
l9_270=l9_275;
l9_266=l9_270;
l9_269=l9_274;
}
l9_221.x=l9_266;
l9_231=l9_269;
float l9_277=l9_221.y;
int l9_278=l9_224.y;
bool l9_279=l9_230;
float l9_280=l9_231;
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
l9_221.y=l9_277;
l9_231=l9_280;
float2 l9_288=l9_221;
int l9_289=l9_219;
int l9_290=l9_220;
float l9_291=l9_229;
float2 l9_292=l9_288;
int l9_293=l9_289;
int l9_294=l9_290;
float3 l9_295=float3(0.0);
if (l9_293==0)
{
l9_295=float3(l9_292,0.0);
}
else
{
if (l9_293==1)
{
l9_295=float3(l9_292.x,(l9_292.y*0.5)+(0.5-(float(l9_294)*0.5)),0.0);
}
else
{
l9_295=float3(l9_292,float(l9_294));
}
}
float3 l9_296=l9_295;
float3 l9_297=l9_296;
float2 l9_298=l9_297.xy;
float l9_299=l9_291;
float4 l9_300=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_298,level(l9_299));
float4 l9_301=l9_300;
float4 l9_302=l9_301;
if (l9_227)
{
l9_302=mix(l9_228,l9_302,float4(l9_231));
}
float4 l9_303=l9_302;
l9_212=l9_303;
l9_185=l9_212;
l9_183+=l9_185;
param_32=l9_183;
float4 l9_304=param_32;
ssGlobals l9_305=param_33;
float4 l9_306=float4(0.0);
l9_305.Loop_Index_ID0=1.0;
l9_305.Loop_Ratio_ID0=0.142857;
float2 l9_307=float2(0.0);
float2 l9_308=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_307=l9_308;
float2 l9_309=float2(0.0);
l9_309=l9_305.gScreenCoord;
float2 l9_310=float2(0.0);
l9_310=l9_309;
float2 l9_311=float2(0.0);
l9_311=l9_307;
float l9_312=0.0;
float l9_313=(*sc_set0.UserUniforms).blurFactor;
l9_312=l9_313;
float l9_314=0.0;
l9_314=l9_312;
float l9_315=0.0;
l9_315=exp2(l9_314);
float l9_316=0.0;
l9_316=l9_305.Loop_Index_ID0;
float2 l9_317=float2(0.0);
float l9_318=l9_316;
float2 l9_319=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_320=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_321=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_322=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_323=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_324=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_325=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_326=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_327[8];
l9_327[0]=l9_319;
l9_327[1]=l9_320;
l9_327[2]=l9_321;
l9_327[3]=l9_322;
l9_327[4]=l9_323;
l9_327[5]=l9_324;
l9_327[6]=l9_325;
l9_327[7]=l9_326;
int l9_328=int(fast::clamp(l9_318+9.9999997e-05,0.0,7.0));
float2 l9_329=l9_327[l9_328];
l9_317=l9_329;
float2 l9_330=float2(0.0);
l9_330=(l9_311*float2(l9_315))*l9_317;
float2 l9_331=float2(0.0);
l9_331=l9_310+l9_330;
float l9_332=0.0;
l9_332=l9_314+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_333=float4(0.0);
int l9_334=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_335=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_335=0;
}
else
{
l9_335=in.varStereoViewID;
}
int l9_336=l9_335;
l9_334=1-l9_336;
}
else
{
int l9_337=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_337=0;
}
else
{
l9_337=in.varStereoViewID;
}
int l9_338=l9_337;
l9_334=l9_338;
}
int l9_339=l9_334;
int l9_340=screenTexLayout_tmp;
int l9_341=l9_339;
float2 l9_342=l9_331;
bool l9_343=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_344=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_345=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_346=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_347=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_348=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_349=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_350=l9_332;
bool l9_351=l9_348&&(!l9_346);
float l9_352=1.0;
float l9_353=l9_342.x;
int l9_354=l9_345.x;
if (l9_354==1)
{
l9_353=fract(l9_353);
}
else
{
if (l9_354==2)
{
float l9_355=fract(l9_353);
float l9_356=l9_353-l9_355;
float l9_357=step(0.25,fract(l9_356*0.5));
l9_353=mix(l9_355,1.0-l9_355,fast::clamp(l9_357,0.0,1.0));
}
}
l9_342.x=l9_353;
float l9_358=l9_342.y;
int l9_359=l9_345.y;
if (l9_359==1)
{
l9_358=fract(l9_358);
}
else
{
if (l9_359==2)
{
float l9_360=fract(l9_358);
float l9_361=l9_358-l9_360;
float l9_362=step(0.25,fract(l9_361*0.5));
l9_358=mix(l9_360,1.0-l9_360,fast::clamp(l9_362,0.0,1.0));
}
}
l9_342.y=l9_358;
if (l9_346)
{
bool l9_363=l9_348;
bool l9_364;
if (l9_363)
{
l9_364=l9_345.x==3;
}
else
{
l9_364=l9_363;
}
float l9_365=l9_342.x;
float l9_366=l9_347.x;
float l9_367=l9_347.z;
bool l9_368=l9_364;
float l9_369=l9_352;
float l9_370=fast::clamp(l9_365,l9_366,l9_367);
float l9_371=step(abs(l9_365-l9_370),9.9999997e-06);
l9_369*=(l9_371+((1.0-float(l9_368))*(1.0-l9_371)));
l9_365=l9_370;
l9_342.x=l9_365;
l9_352=l9_369;
bool l9_372=l9_348;
bool l9_373;
if (l9_372)
{
l9_373=l9_345.y==3;
}
else
{
l9_373=l9_372;
}
float l9_374=l9_342.y;
float l9_375=l9_347.y;
float l9_376=l9_347.w;
bool l9_377=l9_373;
float l9_378=l9_352;
float l9_379=fast::clamp(l9_374,l9_375,l9_376);
float l9_380=step(abs(l9_374-l9_379),9.9999997e-06);
l9_378*=(l9_380+((1.0-float(l9_377))*(1.0-l9_380)));
l9_374=l9_379;
l9_342.y=l9_374;
l9_352=l9_378;
}
float2 l9_381=l9_342;
bool l9_382=l9_343;
float3x3 l9_383=l9_344;
if (l9_382)
{
l9_381=float2((l9_383*float3(l9_381,1.0)).xy);
}
float2 l9_384=l9_381;
float2 l9_385=l9_384;
float2 l9_386=l9_385;
l9_342=l9_386;
float l9_387=l9_342.x;
int l9_388=l9_345.x;
bool l9_389=l9_351;
float l9_390=l9_352;
if ((l9_388==0)||(l9_388==3))
{
float l9_391=l9_387;
float l9_392=0.0;
float l9_393=1.0;
bool l9_394=l9_389;
float l9_395=l9_390;
float l9_396=fast::clamp(l9_391,l9_392,l9_393);
float l9_397=step(abs(l9_391-l9_396),9.9999997e-06);
l9_395*=(l9_397+((1.0-float(l9_394))*(1.0-l9_397)));
l9_391=l9_396;
l9_387=l9_391;
l9_390=l9_395;
}
l9_342.x=l9_387;
l9_352=l9_390;
float l9_398=l9_342.y;
int l9_399=l9_345.y;
bool l9_400=l9_351;
float l9_401=l9_352;
if ((l9_399==0)||(l9_399==3))
{
float l9_402=l9_398;
float l9_403=0.0;
float l9_404=1.0;
bool l9_405=l9_400;
float l9_406=l9_401;
float l9_407=fast::clamp(l9_402,l9_403,l9_404);
float l9_408=step(abs(l9_402-l9_407),9.9999997e-06);
l9_406*=(l9_408+((1.0-float(l9_405))*(1.0-l9_408)));
l9_402=l9_407;
l9_398=l9_402;
l9_401=l9_406;
}
l9_342.y=l9_398;
l9_352=l9_401;
float2 l9_409=l9_342;
int l9_410=l9_340;
int l9_411=l9_341;
float l9_412=l9_350;
float2 l9_413=l9_409;
int l9_414=l9_410;
int l9_415=l9_411;
float3 l9_416=float3(0.0);
if (l9_414==0)
{
l9_416=float3(l9_413,0.0);
}
else
{
if (l9_414==1)
{
l9_416=float3(l9_413.x,(l9_413.y*0.5)+(0.5-(float(l9_415)*0.5)),0.0);
}
else
{
l9_416=float3(l9_413,float(l9_415));
}
}
float3 l9_417=l9_416;
float3 l9_418=l9_417;
float2 l9_419=l9_418.xy;
float l9_420=l9_412;
float4 l9_421=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_419,level(l9_420));
float4 l9_422=l9_421;
float4 l9_423=l9_422;
if (l9_348)
{
l9_423=mix(l9_349,l9_423,float4(l9_352));
}
float4 l9_424=l9_423;
l9_333=l9_424;
l9_306=l9_333;
l9_304+=l9_306;
param_32=l9_304;
float4 l9_425=param_32;
ssGlobals l9_426=param_33;
float4 l9_427=float4(0.0);
l9_426.Loop_Index_ID0=2.0;
l9_426.Loop_Ratio_ID0=0.285714;
float2 l9_428=float2(0.0);
float2 l9_429=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_428=l9_429;
float2 l9_430=float2(0.0);
l9_430=l9_426.gScreenCoord;
float2 l9_431=float2(0.0);
l9_431=l9_430;
float2 l9_432=float2(0.0);
l9_432=l9_428;
float l9_433=0.0;
float l9_434=(*sc_set0.UserUniforms).blurFactor;
l9_433=l9_434;
float l9_435=0.0;
l9_435=l9_433;
float l9_436=0.0;
l9_436=exp2(l9_435);
float l9_437=0.0;
l9_437=l9_426.Loop_Index_ID0;
float2 l9_438=float2(0.0);
float l9_439=l9_437;
float2 l9_440=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_441=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_442=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_443=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_444=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_445=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_446=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_447=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_448[8];
l9_448[0]=l9_440;
l9_448[1]=l9_441;
l9_448[2]=l9_442;
l9_448[3]=l9_443;
l9_448[4]=l9_444;
l9_448[5]=l9_445;
l9_448[6]=l9_446;
l9_448[7]=l9_447;
int l9_449=int(fast::clamp(l9_439+9.9999997e-05,0.0,7.0));
float2 l9_450=l9_448[l9_449];
l9_438=l9_450;
float2 l9_451=float2(0.0);
l9_451=(l9_432*float2(l9_436))*l9_438;
float2 l9_452=float2(0.0);
l9_452=l9_431+l9_451;
float l9_453=0.0;
l9_453=l9_435+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_454=float4(0.0);
int l9_455=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_456=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_456=0;
}
else
{
l9_456=in.varStereoViewID;
}
int l9_457=l9_456;
l9_455=1-l9_457;
}
else
{
int l9_458=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_458=0;
}
else
{
l9_458=in.varStereoViewID;
}
int l9_459=l9_458;
l9_455=l9_459;
}
int l9_460=l9_455;
int l9_461=screenTexLayout_tmp;
int l9_462=l9_460;
float2 l9_463=l9_452;
bool l9_464=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_465=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_466=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_467=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_468=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_469=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_470=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_471=l9_453;
bool l9_472=l9_469&&(!l9_467);
float l9_473=1.0;
float l9_474=l9_463.x;
int l9_475=l9_466.x;
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
l9_463.x=l9_474;
float l9_479=l9_463.y;
int l9_480=l9_466.y;
if (l9_480==1)
{
l9_479=fract(l9_479);
}
else
{
if (l9_480==2)
{
float l9_481=fract(l9_479);
float l9_482=l9_479-l9_481;
float l9_483=step(0.25,fract(l9_482*0.5));
l9_479=mix(l9_481,1.0-l9_481,fast::clamp(l9_483,0.0,1.0));
}
}
l9_463.y=l9_479;
if (l9_467)
{
bool l9_484=l9_469;
bool l9_485;
if (l9_484)
{
l9_485=l9_466.x==3;
}
else
{
l9_485=l9_484;
}
float l9_486=l9_463.x;
float l9_487=l9_468.x;
float l9_488=l9_468.z;
bool l9_489=l9_485;
float l9_490=l9_473;
float l9_491=fast::clamp(l9_486,l9_487,l9_488);
float l9_492=step(abs(l9_486-l9_491),9.9999997e-06);
l9_490*=(l9_492+((1.0-float(l9_489))*(1.0-l9_492)));
l9_486=l9_491;
l9_463.x=l9_486;
l9_473=l9_490;
bool l9_493=l9_469;
bool l9_494;
if (l9_493)
{
l9_494=l9_466.y==3;
}
else
{
l9_494=l9_493;
}
float l9_495=l9_463.y;
float l9_496=l9_468.y;
float l9_497=l9_468.w;
bool l9_498=l9_494;
float l9_499=l9_473;
float l9_500=fast::clamp(l9_495,l9_496,l9_497);
float l9_501=step(abs(l9_495-l9_500),9.9999997e-06);
l9_499*=(l9_501+((1.0-float(l9_498))*(1.0-l9_501)));
l9_495=l9_500;
l9_463.y=l9_495;
l9_473=l9_499;
}
float2 l9_502=l9_463;
bool l9_503=l9_464;
float3x3 l9_504=l9_465;
if (l9_503)
{
l9_502=float2((l9_504*float3(l9_502,1.0)).xy);
}
float2 l9_505=l9_502;
float2 l9_506=l9_505;
float2 l9_507=l9_506;
l9_463=l9_507;
float l9_508=l9_463.x;
int l9_509=l9_466.x;
bool l9_510=l9_472;
float l9_511=l9_473;
if ((l9_509==0)||(l9_509==3))
{
float l9_512=l9_508;
float l9_513=0.0;
float l9_514=1.0;
bool l9_515=l9_510;
float l9_516=l9_511;
float l9_517=fast::clamp(l9_512,l9_513,l9_514);
float l9_518=step(abs(l9_512-l9_517),9.9999997e-06);
l9_516*=(l9_518+((1.0-float(l9_515))*(1.0-l9_518)));
l9_512=l9_517;
l9_508=l9_512;
l9_511=l9_516;
}
l9_463.x=l9_508;
l9_473=l9_511;
float l9_519=l9_463.y;
int l9_520=l9_466.y;
bool l9_521=l9_472;
float l9_522=l9_473;
if ((l9_520==0)||(l9_520==3))
{
float l9_523=l9_519;
float l9_524=0.0;
float l9_525=1.0;
bool l9_526=l9_521;
float l9_527=l9_522;
float l9_528=fast::clamp(l9_523,l9_524,l9_525);
float l9_529=step(abs(l9_523-l9_528),9.9999997e-06);
l9_527*=(l9_529+((1.0-float(l9_526))*(1.0-l9_529)));
l9_523=l9_528;
l9_519=l9_523;
l9_522=l9_527;
}
l9_463.y=l9_519;
l9_473=l9_522;
float2 l9_530=l9_463;
int l9_531=l9_461;
int l9_532=l9_462;
float l9_533=l9_471;
float2 l9_534=l9_530;
int l9_535=l9_531;
int l9_536=l9_532;
float3 l9_537=float3(0.0);
if (l9_535==0)
{
l9_537=float3(l9_534,0.0);
}
else
{
if (l9_535==1)
{
l9_537=float3(l9_534.x,(l9_534.y*0.5)+(0.5-(float(l9_536)*0.5)),0.0);
}
else
{
l9_537=float3(l9_534,float(l9_536));
}
}
float3 l9_538=l9_537;
float3 l9_539=l9_538;
float2 l9_540=l9_539.xy;
float l9_541=l9_533;
float4 l9_542=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_540,level(l9_541));
float4 l9_543=l9_542;
float4 l9_544=l9_543;
if (l9_469)
{
l9_544=mix(l9_470,l9_544,float4(l9_473));
}
float4 l9_545=l9_544;
l9_454=l9_545;
l9_427=l9_454;
l9_425+=l9_427;
param_32=l9_425;
float4 l9_546=param_32;
ssGlobals l9_547=param_33;
float4 l9_548=float4(0.0);
l9_547.Loop_Index_ID0=3.0;
l9_547.Loop_Ratio_ID0=0.42857099;
float2 l9_549=float2(0.0);
float2 l9_550=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_549=l9_550;
float2 l9_551=float2(0.0);
l9_551=l9_547.gScreenCoord;
float2 l9_552=float2(0.0);
l9_552=l9_551;
float2 l9_553=float2(0.0);
l9_553=l9_549;
float l9_554=0.0;
float l9_555=(*sc_set0.UserUniforms).blurFactor;
l9_554=l9_555;
float l9_556=0.0;
l9_556=l9_554;
float l9_557=0.0;
l9_557=exp2(l9_556);
float l9_558=0.0;
l9_558=l9_547.Loop_Index_ID0;
float2 l9_559=float2(0.0);
float l9_560=l9_558;
float2 l9_561=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_562=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_563=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_564=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_565=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_566=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_567=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_568=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_569[8];
l9_569[0]=l9_561;
l9_569[1]=l9_562;
l9_569[2]=l9_563;
l9_569[3]=l9_564;
l9_569[4]=l9_565;
l9_569[5]=l9_566;
l9_569[6]=l9_567;
l9_569[7]=l9_568;
int l9_570=int(fast::clamp(l9_560+9.9999997e-05,0.0,7.0));
float2 l9_571=l9_569[l9_570];
l9_559=l9_571;
float2 l9_572=float2(0.0);
l9_572=(l9_553*float2(l9_557))*l9_559;
float2 l9_573=float2(0.0);
l9_573=l9_552+l9_572;
float l9_574=0.0;
l9_574=l9_556+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_575=float4(0.0);
int l9_576=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_577=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_577=0;
}
else
{
l9_577=in.varStereoViewID;
}
int l9_578=l9_577;
l9_576=1-l9_578;
}
else
{
int l9_579=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_579=0;
}
else
{
l9_579=in.varStereoViewID;
}
int l9_580=l9_579;
l9_576=l9_580;
}
int l9_581=l9_576;
int l9_582=screenTexLayout_tmp;
int l9_583=l9_581;
float2 l9_584=l9_573;
bool l9_585=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_586=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_587=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_588=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_589=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_590=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_591=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_592=l9_574;
bool l9_593=l9_590&&(!l9_588);
float l9_594=1.0;
float l9_595=l9_584.x;
int l9_596=l9_587.x;
if (l9_596==1)
{
l9_595=fract(l9_595);
}
else
{
if (l9_596==2)
{
float l9_597=fract(l9_595);
float l9_598=l9_595-l9_597;
float l9_599=step(0.25,fract(l9_598*0.5));
l9_595=mix(l9_597,1.0-l9_597,fast::clamp(l9_599,0.0,1.0));
}
}
l9_584.x=l9_595;
float l9_600=l9_584.y;
int l9_601=l9_587.y;
if (l9_601==1)
{
l9_600=fract(l9_600);
}
else
{
if (l9_601==2)
{
float l9_602=fract(l9_600);
float l9_603=l9_600-l9_602;
float l9_604=step(0.25,fract(l9_603*0.5));
l9_600=mix(l9_602,1.0-l9_602,fast::clamp(l9_604,0.0,1.0));
}
}
l9_584.y=l9_600;
if (l9_588)
{
bool l9_605=l9_590;
bool l9_606;
if (l9_605)
{
l9_606=l9_587.x==3;
}
else
{
l9_606=l9_605;
}
float l9_607=l9_584.x;
float l9_608=l9_589.x;
float l9_609=l9_589.z;
bool l9_610=l9_606;
float l9_611=l9_594;
float l9_612=fast::clamp(l9_607,l9_608,l9_609);
float l9_613=step(abs(l9_607-l9_612),9.9999997e-06);
l9_611*=(l9_613+((1.0-float(l9_610))*(1.0-l9_613)));
l9_607=l9_612;
l9_584.x=l9_607;
l9_594=l9_611;
bool l9_614=l9_590;
bool l9_615;
if (l9_614)
{
l9_615=l9_587.y==3;
}
else
{
l9_615=l9_614;
}
float l9_616=l9_584.y;
float l9_617=l9_589.y;
float l9_618=l9_589.w;
bool l9_619=l9_615;
float l9_620=l9_594;
float l9_621=fast::clamp(l9_616,l9_617,l9_618);
float l9_622=step(abs(l9_616-l9_621),9.9999997e-06);
l9_620*=(l9_622+((1.0-float(l9_619))*(1.0-l9_622)));
l9_616=l9_621;
l9_584.y=l9_616;
l9_594=l9_620;
}
float2 l9_623=l9_584;
bool l9_624=l9_585;
float3x3 l9_625=l9_586;
if (l9_624)
{
l9_623=float2((l9_625*float3(l9_623,1.0)).xy);
}
float2 l9_626=l9_623;
float2 l9_627=l9_626;
float2 l9_628=l9_627;
l9_584=l9_628;
float l9_629=l9_584.x;
int l9_630=l9_587.x;
bool l9_631=l9_593;
float l9_632=l9_594;
if ((l9_630==0)||(l9_630==3))
{
float l9_633=l9_629;
float l9_634=0.0;
float l9_635=1.0;
bool l9_636=l9_631;
float l9_637=l9_632;
float l9_638=fast::clamp(l9_633,l9_634,l9_635);
float l9_639=step(abs(l9_633-l9_638),9.9999997e-06);
l9_637*=(l9_639+((1.0-float(l9_636))*(1.0-l9_639)));
l9_633=l9_638;
l9_629=l9_633;
l9_632=l9_637;
}
l9_584.x=l9_629;
l9_594=l9_632;
float l9_640=l9_584.y;
int l9_641=l9_587.y;
bool l9_642=l9_593;
float l9_643=l9_594;
if ((l9_641==0)||(l9_641==3))
{
float l9_644=l9_640;
float l9_645=0.0;
float l9_646=1.0;
bool l9_647=l9_642;
float l9_648=l9_643;
float l9_649=fast::clamp(l9_644,l9_645,l9_646);
float l9_650=step(abs(l9_644-l9_649),9.9999997e-06);
l9_648*=(l9_650+((1.0-float(l9_647))*(1.0-l9_650)));
l9_644=l9_649;
l9_640=l9_644;
l9_643=l9_648;
}
l9_584.y=l9_640;
l9_594=l9_643;
float2 l9_651=l9_584;
int l9_652=l9_582;
int l9_653=l9_583;
float l9_654=l9_592;
float2 l9_655=l9_651;
int l9_656=l9_652;
int l9_657=l9_653;
float3 l9_658=float3(0.0);
if (l9_656==0)
{
l9_658=float3(l9_655,0.0);
}
else
{
if (l9_656==1)
{
l9_658=float3(l9_655.x,(l9_655.y*0.5)+(0.5-(float(l9_657)*0.5)),0.0);
}
else
{
l9_658=float3(l9_655,float(l9_657));
}
}
float3 l9_659=l9_658;
float3 l9_660=l9_659;
float2 l9_661=l9_660.xy;
float l9_662=l9_654;
float4 l9_663=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_661,level(l9_662));
float4 l9_664=l9_663;
float4 l9_665=l9_664;
if (l9_590)
{
l9_665=mix(l9_591,l9_665,float4(l9_594));
}
float4 l9_666=l9_665;
l9_575=l9_666;
l9_548=l9_575;
l9_546+=l9_548;
param_32=l9_546;
float4 l9_667=param_32;
ssGlobals l9_668=param_33;
float4 l9_669=float4(0.0);
l9_668.Loop_Index_ID0=4.0;
l9_668.Loop_Ratio_ID0=0.57142901;
float2 l9_670=float2(0.0);
float2 l9_671=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_670=l9_671;
float2 l9_672=float2(0.0);
l9_672=l9_668.gScreenCoord;
float2 l9_673=float2(0.0);
l9_673=l9_672;
float2 l9_674=float2(0.0);
l9_674=l9_670;
float l9_675=0.0;
float l9_676=(*sc_set0.UserUniforms).blurFactor;
l9_675=l9_676;
float l9_677=0.0;
l9_677=l9_675;
float l9_678=0.0;
l9_678=exp2(l9_677);
float l9_679=0.0;
l9_679=l9_668.Loop_Index_ID0;
float2 l9_680=float2(0.0);
float l9_681=l9_679;
float2 l9_682=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_683=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_684=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_685=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_686=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_687=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_688=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_689=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_690[8];
l9_690[0]=l9_682;
l9_690[1]=l9_683;
l9_690[2]=l9_684;
l9_690[3]=l9_685;
l9_690[4]=l9_686;
l9_690[5]=l9_687;
l9_690[6]=l9_688;
l9_690[7]=l9_689;
int l9_691=int(fast::clamp(l9_681+9.9999997e-05,0.0,7.0));
float2 l9_692=l9_690[l9_691];
l9_680=l9_692;
float2 l9_693=float2(0.0);
l9_693=(l9_674*float2(l9_678))*l9_680;
float2 l9_694=float2(0.0);
l9_694=l9_673+l9_693;
float l9_695=0.0;
l9_695=l9_677+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_696=float4(0.0);
int l9_697=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
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
l9_697=1-l9_699;
}
else
{
int l9_700=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_700=0;
}
else
{
l9_700=in.varStereoViewID;
}
int l9_701=l9_700;
l9_697=l9_701;
}
int l9_702=l9_697;
int l9_703=screenTexLayout_tmp;
int l9_704=l9_702;
float2 l9_705=l9_694;
bool l9_706=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_707=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_708=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_709=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_710=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_711=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_712=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_713=l9_695;
bool l9_714=l9_711&&(!l9_709);
float l9_715=1.0;
float l9_716=l9_705.x;
int l9_717=l9_708.x;
if (l9_717==1)
{
l9_716=fract(l9_716);
}
else
{
if (l9_717==2)
{
float l9_718=fract(l9_716);
float l9_719=l9_716-l9_718;
float l9_720=step(0.25,fract(l9_719*0.5));
l9_716=mix(l9_718,1.0-l9_718,fast::clamp(l9_720,0.0,1.0));
}
}
l9_705.x=l9_716;
float l9_721=l9_705.y;
int l9_722=l9_708.y;
if (l9_722==1)
{
l9_721=fract(l9_721);
}
else
{
if (l9_722==2)
{
float l9_723=fract(l9_721);
float l9_724=l9_721-l9_723;
float l9_725=step(0.25,fract(l9_724*0.5));
l9_721=mix(l9_723,1.0-l9_723,fast::clamp(l9_725,0.0,1.0));
}
}
l9_705.y=l9_721;
if (l9_709)
{
bool l9_726=l9_711;
bool l9_727;
if (l9_726)
{
l9_727=l9_708.x==3;
}
else
{
l9_727=l9_726;
}
float l9_728=l9_705.x;
float l9_729=l9_710.x;
float l9_730=l9_710.z;
bool l9_731=l9_727;
float l9_732=l9_715;
float l9_733=fast::clamp(l9_728,l9_729,l9_730);
float l9_734=step(abs(l9_728-l9_733),9.9999997e-06);
l9_732*=(l9_734+((1.0-float(l9_731))*(1.0-l9_734)));
l9_728=l9_733;
l9_705.x=l9_728;
l9_715=l9_732;
bool l9_735=l9_711;
bool l9_736;
if (l9_735)
{
l9_736=l9_708.y==3;
}
else
{
l9_736=l9_735;
}
float l9_737=l9_705.y;
float l9_738=l9_710.y;
float l9_739=l9_710.w;
bool l9_740=l9_736;
float l9_741=l9_715;
float l9_742=fast::clamp(l9_737,l9_738,l9_739);
float l9_743=step(abs(l9_737-l9_742),9.9999997e-06);
l9_741*=(l9_743+((1.0-float(l9_740))*(1.0-l9_743)));
l9_737=l9_742;
l9_705.y=l9_737;
l9_715=l9_741;
}
float2 l9_744=l9_705;
bool l9_745=l9_706;
float3x3 l9_746=l9_707;
if (l9_745)
{
l9_744=float2((l9_746*float3(l9_744,1.0)).xy);
}
float2 l9_747=l9_744;
float2 l9_748=l9_747;
float2 l9_749=l9_748;
l9_705=l9_749;
float l9_750=l9_705.x;
int l9_751=l9_708.x;
bool l9_752=l9_714;
float l9_753=l9_715;
if ((l9_751==0)||(l9_751==3))
{
float l9_754=l9_750;
float l9_755=0.0;
float l9_756=1.0;
bool l9_757=l9_752;
float l9_758=l9_753;
float l9_759=fast::clamp(l9_754,l9_755,l9_756);
float l9_760=step(abs(l9_754-l9_759),9.9999997e-06);
l9_758*=(l9_760+((1.0-float(l9_757))*(1.0-l9_760)));
l9_754=l9_759;
l9_750=l9_754;
l9_753=l9_758;
}
l9_705.x=l9_750;
l9_715=l9_753;
float l9_761=l9_705.y;
int l9_762=l9_708.y;
bool l9_763=l9_714;
float l9_764=l9_715;
if ((l9_762==0)||(l9_762==3))
{
float l9_765=l9_761;
float l9_766=0.0;
float l9_767=1.0;
bool l9_768=l9_763;
float l9_769=l9_764;
float l9_770=fast::clamp(l9_765,l9_766,l9_767);
float l9_771=step(abs(l9_765-l9_770),9.9999997e-06);
l9_769*=(l9_771+((1.0-float(l9_768))*(1.0-l9_771)));
l9_765=l9_770;
l9_761=l9_765;
l9_764=l9_769;
}
l9_705.y=l9_761;
l9_715=l9_764;
float2 l9_772=l9_705;
int l9_773=l9_703;
int l9_774=l9_704;
float l9_775=l9_713;
float2 l9_776=l9_772;
int l9_777=l9_773;
int l9_778=l9_774;
float3 l9_779=float3(0.0);
if (l9_777==0)
{
l9_779=float3(l9_776,0.0);
}
else
{
if (l9_777==1)
{
l9_779=float3(l9_776.x,(l9_776.y*0.5)+(0.5-(float(l9_778)*0.5)),0.0);
}
else
{
l9_779=float3(l9_776,float(l9_778));
}
}
float3 l9_780=l9_779;
float3 l9_781=l9_780;
float2 l9_782=l9_781.xy;
float l9_783=l9_775;
float4 l9_784=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_782,level(l9_783));
float4 l9_785=l9_784;
float4 l9_786=l9_785;
if (l9_711)
{
l9_786=mix(l9_712,l9_786,float4(l9_715));
}
float4 l9_787=l9_786;
l9_696=l9_787;
l9_669=l9_696;
l9_667+=l9_669;
param_32=l9_667;
float4 l9_788=param_32;
ssGlobals l9_789=param_33;
float4 l9_790=float4(0.0);
l9_789.Loop_Index_ID0=5.0;
l9_789.Loop_Ratio_ID0=0.71428603;
float2 l9_791=float2(0.0);
float2 l9_792=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_791=l9_792;
float2 l9_793=float2(0.0);
l9_793=l9_789.gScreenCoord;
float2 l9_794=float2(0.0);
l9_794=l9_793;
float2 l9_795=float2(0.0);
l9_795=l9_791;
float l9_796=0.0;
float l9_797=(*sc_set0.UserUniforms).blurFactor;
l9_796=l9_797;
float l9_798=0.0;
l9_798=l9_796;
float l9_799=0.0;
l9_799=exp2(l9_798);
float l9_800=0.0;
l9_800=l9_789.Loop_Index_ID0;
float2 l9_801=float2(0.0);
float l9_802=l9_800;
float2 l9_803=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_804=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_805=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_806=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_807=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_808=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_809=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_810=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_811[8];
l9_811[0]=l9_803;
l9_811[1]=l9_804;
l9_811[2]=l9_805;
l9_811[3]=l9_806;
l9_811[4]=l9_807;
l9_811[5]=l9_808;
l9_811[6]=l9_809;
l9_811[7]=l9_810;
int l9_812=int(fast::clamp(l9_802+9.9999997e-05,0.0,7.0));
float2 l9_813=l9_811[l9_812];
l9_801=l9_813;
float2 l9_814=float2(0.0);
l9_814=(l9_795*float2(l9_799))*l9_801;
float2 l9_815=float2(0.0);
l9_815=l9_794+l9_814;
float l9_816=0.0;
l9_816=l9_798+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_817=float4(0.0);
int l9_818=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_819=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_819=0;
}
else
{
l9_819=in.varStereoViewID;
}
int l9_820=l9_819;
l9_818=1-l9_820;
}
else
{
int l9_821=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_821=0;
}
else
{
l9_821=in.varStereoViewID;
}
int l9_822=l9_821;
l9_818=l9_822;
}
int l9_823=l9_818;
int l9_824=screenTexLayout_tmp;
int l9_825=l9_823;
float2 l9_826=l9_815;
bool l9_827=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_828=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_829=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_830=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_831=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_832=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_833=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_834=l9_816;
bool l9_835=l9_832&&(!l9_830);
float l9_836=1.0;
float l9_837=l9_826.x;
int l9_838=l9_829.x;
if (l9_838==1)
{
l9_837=fract(l9_837);
}
else
{
if (l9_838==2)
{
float l9_839=fract(l9_837);
float l9_840=l9_837-l9_839;
float l9_841=step(0.25,fract(l9_840*0.5));
l9_837=mix(l9_839,1.0-l9_839,fast::clamp(l9_841,0.0,1.0));
}
}
l9_826.x=l9_837;
float l9_842=l9_826.y;
int l9_843=l9_829.y;
if (l9_843==1)
{
l9_842=fract(l9_842);
}
else
{
if (l9_843==2)
{
float l9_844=fract(l9_842);
float l9_845=l9_842-l9_844;
float l9_846=step(0.25,fract(l9_845*0.5));
l9_842=mix(l9_844,1.0-l9_844,fast::clamp(l9_846,0.0,1.0));
}
}
l9_826.y=l9_842;
if (l9_830)
{
bool l9_847=l9_832;
bool l9_848;
if (l9_847)
{
l9_848=l9_829.x==3;
}
else
{
l9_848=l9_847;
}
float l9_849=l9_826.x;
float l9_850=l9_831.x;
float l9_851=l9_831.z;
bool l9_852=l9_848;
float l9_853=l9_836;
float l9_854=fast::clamp(l9_849,l9_850,l9_851);
float l9_855=step(abs(l9_849-l9_854),9.9999997e-06);
l9_853*=(l9_855+((1.0-float(l9_852))*(1.0-l9_855)));
l9_849=l9_854;
l9_826.x=l9_849;
l9_836=l9_853;
bool l9_856=l9_832;
bool l9_857;
if (l9_856)
{
l9_857=l9_829.y==3;
}
else
{
l9_857=l9_856;
}
float l9_858=l9_826.y;
float l9_859=l9_831.y;
float l9_860=l9_831.w;
bool l9_861=l9_857;
float l9_862=l9_836;
float l9_863=fast::clamp(l9_858,l9_859,l9_860);
float l9_864=step(abs(l9_858-l9_863),9.9999997e-06);
l9_862*=(l9_864+((1.0-float(l9_861))*(1.0-l9_864)));
l9_858=l9_863;
l9_826.y=l9_858;
l9_836=l9_862;
}
float2 l9_865=l9_826;
bool l9_866=l9_827;
float3x3 l9_867=l9_828;
if (l9_866)
{
l9_865=float2((l9_867*float3(l9_865,1.0)).xy);
}
float2 l9_868=l9_865;
float2 l9_869=l9_868;
float2 l9_870=l9_869;
l9_826=l9_870;
float l9_871=l9_826.x;
int l9_872=l9_829.x;
bool l9_873=l9_835;
float l9_874=l9_836;
if ((l9_872==0)||(l9_872==3))
{
float l9_875=l9_871;
float l9_876=0.0;
float l9_877=1.0;
bool l9_878=l9_873;
float l9_879=l9_874;
float l9_880=fast::clamp(l9_875,l9_876,l9_877);
float l9_881=step(abs(l9_875-l9_880),9.9999997e-06);
l9_879*=(l9_881+((1.0-float(l9_878))*(1.0-l9_881)));
l9_875=l9_880;
l9_871=l9_875;
l9_874=l9_879;
}
l9_826.x=l9_871;
l9_836=l9_874;
float l9_882=l9_826.y;
int l9_883=l9_829.y;
bool l9_884=l9_835;
float l9_885=l9_836;
if ((l9_883==0)||(l9_883==3))
{
float l9_886=l9_882;
float l9_887=0.0;
float l9_888=1.0;
bool l9_889=l9_884;
float l9_890=l9_885;
float l9_891=fast::clamp(l9_886,l9_887,l9_888);
float l9_892=step(abs(l9_886-l9_891),9.9999997e-06);
l9_890*=(l9_892+((1.0-float(l9_889))*(1.0-l9_892)));
l9_886=l9_891;
l9_882=l9_886;
l9_885=l9_890;
}
l9_826.y=l9_882;
l9_836=l9_885;
float2 l9_893=l9_826;
int l9_894=l9_824;
int l9_895=l9_825;
float l9_896=l9_834;
float2 l9_897=l9_893;
int l9_898=l9_894;
int l9_899=l9_895;
float3 l9_900=float3(0.0);
if (l9_898==0)
{
l9_900=float3(l9_897,0.0);
}
else
{
if (l9_898==1)
{
l9_900=float3(l9_897.x,(l9_897.y*0.5)+(0.5-(float(l9_899)*0.5)),0.0);
}
else
{
l9_900=float3(l9_897,float(l9_899));
}
}
float3 l9_901=l9_900;
float3 l9_902=l9_901;
float2 l9_903=l9_902.xy;
float l9_904=l9_896;
float4 l9_905=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_903,level(l9_904));
float4 l9_906=l9_905;
float4 l9_907=l9_906;
if (l9_832)
{
l9_907=mix(l9_833,l9_907,float4(l9_836));
}
float4 l9_908=l9_907;
l9_817=l9_908;
l9_790=l9_817;
l9_788+=l9_790;
param_32=l9_788;
float4 l9_909=param_32;
ssGlobals l9_910=param_33;
float4 l9_911=float4(0.0);
l9_910.Loop_Index_ID0=6.0;
l9_910.Loop_Ratio_ID0=0.85714298;
float2 l9_912=float2(0.0);
float2 l9_913=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_912=l9_913;
float2 l9_914=float2(0.0);
l9_914=l9_910.gScreenCoord;
float2 l9_915=float2(0.0);
l9_915=l9_914;
float2 l9_916=float2(0.0);
l9_916=l9_912;
float l9_917=0.0;
float l9_918=(*sc_set0.UserUniforms).blurFactor;
l9_917=l9_918;
float l9_919=0.0;
l9_919=l9_917;
float l9_920=0.0;
l9_920=exp2(l9_919);
float l9_921=0.0;
l9_921=l9_910.Loop_Index_ID0;
float2 l9_922=float2(0.0);
float l9_923=l9_921;
float2 l9_924=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_925=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_926=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_927=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_928=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_929=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_930=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_931=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_932[8];
l9_932[0]=l9_924;
l9_932[1]=l9_925;
l9_932[2]=l9_926;
l9_932[3]=l9_927;
l9_932[4]=l9_928;
l9_932[5]=l9_929;
l9_932[6]=l9_930;
l9_932[7]=l9_931;
int l9_933=int(fast::clamp(l9_923+9.9999997e-05,0.0,7.0));
float2 l9_934=l9_932[l9_933];
l9_922=l9_934;
float2 l9_935=float2(0.0);
l9_935=(l9_916*float2(l9_920))*l9_922;
float2 l9_936=float2(0.0);
l9_936=l9_915+l9_935;
float l9_937=0.0;
l9_937=l9_919+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_938=float4(0.0);
int l9_939=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_940=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_940=0;
}
else
{
l9_940=in.varStereoViewID;
}
int l9_941=l9_940;
l9_939=1-l9_941;
}
else
{
int l9_942=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_942=0;
}
else
{
l9_942=in.varStereoViewID;
}
int l9_943=l9_942;
l9_939=l9_943;
}
int l9_944=l9_939;
int l9_945=screenTexLayout_tmp;
int l9_946=l9_944;
float2 l9_947=l9_936;
bool l9_948=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_949=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_950=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_951=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_952=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_953=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_954=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_955=l9_937;
bool l9_956=l9_953&&(!l9_951);
float l9_957=1.0;
float l9_958=l9_947.x;
int l9_959=l9_950.x;
if (l9_959==1)
{
l9_958=fract(l9_958);
}
else
{
if (l9_959==2)
{
float l9_960=fract(l9_958);
float l9_961=l9_958-l9_960;
float l9_962=step(0.25,fract(l9_961*0.5));
l9_958=mix(l9_960,1.0-l9_960,fast::clamp(l9_962,0.0,1.0));
}
}
l9_947.x=l9_958;
float l9_963=l9_947.y;
int l9_964=l9_950.y;
if (l9_964==1)
{
l9_963=fract(l9_963);
}
else
{
if (l9_964==2)
{
float l9_965=fract(l9_963);
float l9_966=l9_963-l9_965;
float l9_967=step(0.25,fract(l9_966*0.5));
l9_963=mix(l9_965,1.0-l9_965,fast::clamp(l9_967,0.0,1.0));
}
}
l9_947.y=l9_963;
if (l9_951)
{
bool l9_968=l9_953;
bool l9_969;
if (l9_968)
{
l9_969=l9_950.x==3;
}
else
{
l9_969=l9_968;
}
float l9_970=l9_947.x;
float l9_971=l9_952.x;
float l9_972=l9_952.z;
bool l9_973=l9_969;
float l9_974=l9_957;
float l9_975=fast::clamp(l9_970,l9_971,l9_972);
float l9_976=step(abs(l9_970-l9_975),9.9999997e-06);
l9_974*=(l9_976+((1.0-float(l9_973))*(1.0-l9_976)));
l9_970=l9_975;
l9_947.x=l9_970;
l9_957=l9_974;
bool l9_977=l9_953;
bool l9_978;
if (l9_977)
{
l9_978=l9_950.y==3;
}
else
{
l9_978=l9_977;
}
float l9_979=l9_947.y;
float l9_980=l9_952.y;
float l9_981=l9_952.w;
bool l9_982=l9_978;
float l9_983=l9_957;
float l9_984=fast::clamp(l9_979,l9_980,l9_981);
float l9_985=step(abs(l9_979-l9_984),9.9999997e-06);
l9_983*=(l9_985+((1.0-float(l9_982))*(1.0-l9_985)));
l9_979=l9_984;
l9_947.y=l9_979;
l9_957=l9_983;
}
float2 l9_986=l9_947;
bool l9_987=l9_948;
float3x3 l9_988=l9_949;
if (l9_987)
{
l9_986=float2((l9_988*float3(l9_986,1.0)).xy);
}
float2 l9_989=l9_986;
float2 l9_990=l9_989;
float2 l9_991=l9_990;
l9_947=l9_991;
float l9_992=l9_947.x;
int l9_993=l9_950.x;
bool l9_994=l9_956;
float l9_995=l9_957;
if ((l9_993==0)||(l9_993==3))
{
float l9_996=l9_992;
float l9_997=0.0;
float l9_998=1.0;
bool l9_999=l9_994;
float l9_1000=l9_995;
float l9_1001=fast::clamp(l9_996,l9_997,l9_998);
float l9_1002=step(abs(l9_996-l9_1001),9.9999997e-06);
l9_1000*=(l9_1002+((1.0-float(l9_999))*(1.0-l9_1002)));
l9_996=l9_1001;
l9_992=l9_996;
l9_995=l9_1000;
}
l9_947.x=l9_992;
l9_957=l9_995;
float l9_1003=l9_947.y;
int l9_1004=l9_950.y;
bool l9_1005=l9_956;
float l9_1006=l9_957;
if ((l9_1004==0)||(l9_1004==3))
{
float l9_1007=l9_1003;
float l9_1008=0.0;
float l9_1009=1.0;
bool l9_1010=l9_1005;
float l9_1011=l9_1006;
float l9_1012=fast::clamp(l9_1007,l9_1008,l9_1009);
float l9_1013=step(abs(l9_1007-l9_1012),9.9999997e-06);
l9_1011*=(l9_1013+((1.0-float(l9_1010))*(1.0-l9_1013)));
l9_1007=l9_1012;
l9_1003=l9_1007;
l9_1006=l9_1011;
}
l9_947.y=l9_1003;
l9_957=l9_1006;
float2 l9_1014=l9_947;
int l9_1015=l9_945;
int l9_1016=l9_946;
float l9_1017=l9_955;
float2 l9_1018=l9_1014;
int l9_1019=l9_1015;
int l9_1020=l9_1016;
float3 l9_1021=float3(0.0);
if (l9_1019==0)
{
l9_1021=float3(l9_1018,0.0);
}
else
{
if (l9_1019==1)
{
l9_1021=float3(l9_1018.x,(l9_1018.y*0.5)+(0.5-(float(l9_1020)*0.5)),0.0);
}
else
{
l9_1021=float3(l9_1018,float(l9_1020));
}
}
float3 l9_1022=l9_1021;
float3 l9_1023=l9_1022;
float2 l9_1024=l9_1023.xy;
float l9_1025=l9_1017;
float4 l9_1026=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1024,level(l9_1025));
float4 l9_1027=l9_1026;
float4 l9_1028=l9_1027;
if (l9_953)
{
l9_1028=mix(l9_954,l9_1028,float4(l9_957));
}
float4 l9_1029=l9_1028;
l9_938=l9_1029;
l9_911=l9_938;
l9_909+=l9_911;
param_32=l9_909;
float4 l9_1030=param_32;
ssGlobals l9_1031=param_33;
float4 l9_1032=float4(0.0);
l9_1031.Loop_Index_ID0=7.0;
l9_1031.Loop_Ratio_ID0=1.0;
float2 l9_1033=float2(0.0);
float2 l9_1034=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_1033=l9_1034;
float2 l9_1035=float2(0.0);
l9_1035=l9_1031.gScreenCoord;
float2 l9_1036=float2(0.0);
l9_1036=l9_1035;
float2 l9_1037=float2(0.0);
l9_1037=l9_1033;
float l9_1038=0.0;
float l9_1039=(*sc_set0.UserUniforms).blurFactor;
l9_1038=l9_1039;
float l9_1040=0.0;
l9_1040=l9_1038;
float l9_1041=0.0;
l9_1041=exp2(l9_1040);
float l9_1042=0.0;
l9_1042=l9_1031.Loop_Index_ID0;
float2 l9_1043=float2(0.0);
float l9_1044=l9_1042;
float2 l9_1045=(*sc_set0.UserUniforms).Port_Item0_N064;
float2 l9_1046=(*sc_set0.UserUniforms).Port_Item1_N064;
float2 l9_1047=(*sc_set0.UserUniforms).Port_Item2_N064;
float2 l9_1048=(*sc_set0.UserUniforms).Port_Item3_N064;
float2 l9_1049=(*sc_set0.UserUniforms).Port_Item4_N064;
float2 l9_1050=(*sc_set0.UserUniforms).Port_Item5_N064;
float2 l9_1051=(*sc_set0.UserUniforms).Port_Item6_N064;
float2 l9_1052=(*sc_set0.UserUniforms).Port_Item7_N064;
float2 l9_1053[8];
l9_1053[0]=l9_1045;
l9_1053[1]=l9_1046;
l9_1053[2]=l9_1047;
l9_1053[3]=l9_1048;
l9_1053[4]=l9_1049;
l9_1053[5]=l9_1050;
l9_1053[6]=l9_1051;
l9_1053[7]=l9_1052;
int l9_1054=int(fast::clamp(l9_1044+9.9999997e-05,0.0,7.0));
float2 l9_1055=l9_1053[l9_1054];
l9_1043=l9_1055;
float2 l9_1056=float2(0.0);
l9_1056=(l9_1037*float2(l9_1041))*l9_1043;
float2 l9_1057=float2(0.0);
l9_1057=l9_1036+l9_1056;
float l9_1058=0.0;
l9_1058=l9_1040+(*sc_set0.UserUniforms).Port_Input1_N050;
float4 l9_1059=float4(0.0);
int l9_1060=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1061=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1061=0;
}
else
{
l9_1061=in.varStereoViewID;
}
int l9_1062=l9_1061;
l9_1060=1-l9_1062;
}
else
{
int l9_1063=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1063=0;
}
else
{
l9_1063=in.varStereoViewID;
}
int l9_1064=l9_1063;
l9_1060=l9_1064;
}
int l9_1065=l9_1060;
int l9_1066=screenTexLayout_tmp;
int l9_1067=l9_1065;
float2 l9_1068=l9_1057;
bool l9_1069=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1070=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1071=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1072=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1073=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1074=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1075=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1076=l9_1058;
bool l9_1077=l9_1074&&(!l9_1072);
float l9_1078=1.0;
float l9_1079=l9_1068.x;
int l9_1080=l9_1071.x;
if (l9_1080==1)
{
l9_1079=fract(l9_1079);
}
else
{
if (l9_1080==2)
{
float l9_1081=fract(l9_1079);
float l9_1082=l9_1079-l9_1081;
float l9_1083=step(0.25,fract(l9_1082*0.5));
l9_1079=mix(l9_1081,1.0-l9_1081,fast::clamp(l9_1083,0.0,1.0));
}
}
l9_1068.x=l9_1079;
float l9_1084=l9_1068.y;
int l9_1085=l9_1071.y;
if (l9_1085==1)
{
l9_1084=fract(l9_1084);
}
else
{
if (l9_1085==2)
{
float l9_1086=fract(l9_1084);
float l9_1087=l9_1084-l9_1086;
float l9_1088=step(0.25,fract(l9_1087*0.5));
l9_1084=mix(l9_1086,1.0-l9_1086,fast::clamp(l9_1088,0.0,1.0));
}
}
l9_1068.y=l9_1084;
if (l9_1072)
{
bool l9_1089=l9_1074;
bool l9_1090;
if (l9_1089)
{
l9_1090=l9_1071.x==3;
}
else
{
l9_1090=l9_1089;
}
float l9_1091=l9_1068.x;
float l9_1092=l9_1073.x;
float l9_1093=l9_1073.z;
bool l9_1094=l9_1090;
float l9_1095=l9_1078;
float l9_1096=fast::clamp(l9_1091,l9_1092,l9_1093);
float l9_1097=step(abs(l9_1091-l9_1096),9.9999997e-06);
l9_1095*=(l9_1097+((1.0-float(l9_1094))*(1.0-l9_1097)));
l9_1091=l9_1096;
l9_1068.x=l9_1091;
l9_1078=l9_1095;
bool l9_1098=l9_1074;
bool l9_1099;
if (l9_1098)
{
l9_1099=l9_1071.y==3;
}
else
{
l9_1099=l9_1098;
}
float l9_1100=l9_1068.y;
float l9_1101=l9_1073.y;
float l9_1102=l9_1073.w;
bool l9_1103=l9_1099;
float l9_1104=l9_1078;
float l9_1105=fast::clamp(l9_1100,l9_1101,l9_1102);
float l9_1106=step(abs(l9_1100-l9_1105),9.9999997e-06);
l9_1104*=(l9_1106+((1.0-float(l9_1103))*(1.0-l9_1106)));
l9_1100=l9_1105;
l9_1068.y=l9_1100;
l9_1078=l9_1104;
}
float2 l9_1107=l9_1068;
bool l9_1108=l9_1069;
float3x3 l9_1109=l9_1070;
if (l9_1108)
{
l9_1107=float2((l9_1109*float3(l9_1107,1.0)).xy);
}
float2 l9_1110=l9_1107;
float2 l9_1111=l9_1110;
float2 l9_1112=l9_1111;
l9_1068=l9_1112;
float l9_1113=l9_1068.x;
int l9_1114=l9_1071.x;
bool l9_1115=l9_1077;
float l9_1116=l9_1078;
if ((l9_1114==0)||(l9_1114==3))
{
float l9_1117=l9_1113;
float l9_1118=0.0;
float l9_1119=1.0;
bool l9_1120=l9_1115;
float l9_1121=l9_1116;
float l9_1122=fast::clamp(l9_1117,l9_1118,l9_1119);
float l9_1123=step(abs(l9_1117-l9_1122),9.9999997e-06);
l9_1121*=(l9_1123+((1.0-float(l9_1120))*(1.0-l9_1123)));
l9_1117=l9_1122;
l9_1113=l9_1117;
l9_1116=l9_1121;
}
l9_1068.x=l9_1113;
l9_1078=l9_1116;
float l9_1124=l9_1068.y;
int l9_1125=l9_1071.y;
bool l9_1126=l9_1077;
float l9_1127=l9_1078;
if ((l9_1125==0)||(l9_1125==3))
{
float l9_1128=l9_1124;
float l9_1129=0.0;
float l9_1130=1.0;
bool l9_1131=l9_1126;
float l9_1132=l9_1127;
float l9_1133=fast::clamp(l9_1128,l9_1129,l9_1130);
float l9_1134=step(abs(l9_1128-l9_1133),9.9999997e-06);
l9_1132*=(l9_1134+((1.0-float(l9_1131))*(1.0-l9_1134)));
l9_1128=l9_1133;
l9_1124=l9_1128;
l9_1127=l9_1132;
}
l9_1068.y=l9_1124;
l9_1078=l9_1127;
float2 l9_1135=l9_1068;
int l9_1136=l9_1066;
int l9_1137=l9_1067;
float l9_1138=l9_1076;
float2 l9_1139=l9_1135;
int l9_1140=l9_1136;
int l9_1141=l9_1137;
float3 l9_1142=float3(0.0);
if (l9_1140==0)
{
l9_1142=float3(l9_1139,0.0);
}
else
{
if (l9_1140==1)
{
l9_1142=float3(l9_1139.x,(l9_1139.y*0.5)+(0.5-(float(l9_1141)*0.5)),0.0);
}
else
{
l9_1142=float3(l9_1139,float(l9_1141));
}
}
float3 l9_1143=l9_1142;
float3 l9_1144=l9_1143;
float2 l9_1145=l9_1144.xy;
float l9_1146=l9_1138;
float4 l9_1147=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1145,level(l9_1146));
float4 l9_1148=l9_1147;
float4 l9_1149=l9_1148;
if (l9_1074)
{
l9_1149=mix(l9_1075,l9_1149,float4(l9_1078));
}
float4 l9_1150=l9_1149;
l9_1059=l9_1150;
l9_1032=l9_1059;
l9_1030+=l9_1032;
param_32=l9_1030;
param_32/=float4(8.0);
Output_N68=param_32;
float4 Output_N69=float4(0.0);
Output_N69=mix(Color_N54,Output_N68,float4((*sc_set0.UserUniforms).Port_Input2_N069));
float4 Export_N70=float4(0.0);
Export_N70=Output_N69;
float3 Output_N11=float3(0.0);
float3 param_34=(*sc_set0.UserUniforms).underwaterTint;
Output_N11=param_34;
float3 Output_N143=float3(0.0);
Output_N143=Export_N70.xyz*Output_N11;
float Output_N12=0.0;
float param_35=(*sc_set0.UserUniforms).enableLine;
Output_N12=param_35;
float3 Output_N21=float3(0.0);
float3 param_36=(*sc_set0.UserUniforms).lineTint;
Output_N21=param_36;
float Output_N17=0.0;
float param_37=(*sc_set0.UserUniforms).meniscusThickness;
Output_N17=param_37;
float4 Result_N5=float4(0.0);
float3 param_38=Export_N239;
float3 param_39=Output_N1;
float3 param_40=Output_N6;
float3 param_41=Output_N9;
float2 param_42=Output_N7;
float param_43=Output_N18;
float2 param_44=Output_N32;
float param_45=Output_N22;
float3 param_46=Output_N143;
float param_47=Output_N12;
float3 param_48=Output_N21;
float param_49=Output_N17;
ssGlobals param_51=Globals;
ssGlobals tempGlobals=param_51;
float4 param_50=float4(0.0);
N5_OceanSurfacePos=param_38;
N5_OceanWorldTransform=param_39;
N5_OceanAabbMin=param_40;
N5_OceanAabbMax=param_41;
N5_unpackVal=param_42;
N5_EnableFluid=param_43;
N5_pressureRange=param_44;
N5_FluidMul=param_45;
N5_Underwater=param_46;
N5_EnableLine=param_47!=0.0;
N5_LineColor=param_48;
N5_Thickness=param_49;
int l9_1151=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1151=0;
}
else
{
l9_1151=in.varStereoViewID;
}
int l9_1152=l9_1151;
float4x4 l9_1153=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1152];
float3 l9_1154=l9_1153[3].xyz;
float3 l9_1155=N5_OceanSurfacePos-l9_1154;
int l9_1156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1156=0;
}
else
{
l9_1156=in.varStereoViewID;
}
int l9_1157=l9_1156;
float3 l9_1158=-(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1157][2].xyz;
float3 l9_1159=l9_1158;
float l9_1160=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.x;
float l9_1161=l9_1160;
float3 l9_1162=l9_1154+(l9_1155*(l9_1161/dot(l9_1155,l9_1159)));
float2 l9_1163=float2(N5_OceanAabbMin.x,N5_OceanAabbMin.z);
float2 l9_1164=float2(N5_OceanAabbMax.x,N5_OceanAabbMax.z);
float2 l9_1165=float2(0.0)+(((l9_1162.xz-l9_1163)*1.0)/((l9_1164-l9_1163)+float2(1e-06)));
l9_1165.y=1.0-l9_1165.y;
float2 l9_1166=l9_1165;
float4 l9_1167=float4(0.0);
int l9_1168=0;
if ((int(oceanHeightmapHasSwappedViews_tmp)!=0))
{
int l9_1169=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1169=0;
}
else
{
l9_1169=in.varStereoViewID;
}
int l9_1170=l9_1169;
l9_1168=1-l9_1170;
}
else
{
int l9_1171=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1171=0;
}
else
{
l9_1171=in.varStereoViewID;
}
int l9_1172=l9_1171;
l9_1168=l9_1172;
}
int l9_1173=l9_1168;
int l9_1174=oceanHeightmapLayout_tmp;
int l9_1175=l9_1173;
float2 l9_1176=l9_1166;
bool l9_1177=(int(SC_USE_UV_TRANSFORM_oceanHeightmap_tmp)!=0);
float3x3 l9_1178=(*sc_set0.UserUniforms).oceanHeightmapTransform;
int2 l9_1179=int2(SC_SOFTWARE_WRAP_MODE_U_oceanHeightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_oceanHeightmap_tmp);
bool l9_1180=(int(SC_USE_UV_MIN_MAX_oceanHeightmap_tmp)!=0);
float4 l9_1181=(*sc_set0.UserUniforms).oceanHeightmapUvMinMax;
bool l9_1182=(int(SC_USE_CLAMP_TO_BORDER_oceanHeightmap_tmp)!=0);
float4 l9_1183=(*sc_set0.UserUniforms).oceanHeightmapBorderColor;
float l9_1184=0.0;
bool l9_1185=l9_1182&&(!l9_1180);
float l9_1186=1.0;
float l9_1187=l9_1176.x;
int l9_1188=l9_1179.x;
if (l9_1188==1)
{
l9_1187=fract(l9_1187);
}
else
{
if (l9_1188==2)
{
float l9_1189=fract(l9_1187);
float l9_1190=l9_1187-l9_1189;
float l9_1191=step(0.25,fract(l9_1190*0.5));
l9_1187=mix(l9_1189,1.0-l9_1189,fast::clamp(l9_1191,0.0,1.0));
}
}
l9_1176.x=l9_1187;
float l9_1192=l9_1176.y;
int l9_1193=l9_1179.y;
if (l9_1193==1)
{
l9_1192=fract(l9_1192);
}
else
{
if (l9_1193==2)
{
float l9_1194=fract(l9_1192);
float l9_1195=l9_1192-l9_1194;
float l9_1196=step(0.25,fract(l9_1195*0.5));
l9_1192=mix(l9_1194,1.0-l9_1194,fast::clamp(l9_1196,0.0,1.0));
}
}
l9_1176.y=l9_1192;
if (l9_1180)
{
bool l9_1197=l9_1182;
bool l9_1198;
if (l9_1197)
{
l9_1198=l9_1179.x==3;
}
else
{
l9_1198=l9_1197;
}
float l9_1199=l9_1176.x;
float l9_1200=l9_1181.x;
float l9_1201=l9_1181.z;
bool l9_1202=l9_1198;
float l9_1203=l9_1186;
float l9_1204=fast::clamp(l9_1199,l9_1200,l9_1201);
float l9_1205=step(abs(l9_1199-l9_1204),9.9999997e-06);
l9_1203*=(l9_1205+((1.0-float(l9_1202))*(1.0-l9_1205)));
l9_1199=l9_1204;
l9_1176.x=l9_1199;
l9_1186=l9_1203;
bool l9_1206=l9_1182;
bool l9_1207;
if (l9_1206)
{
l9_1207=l9_1179.y==3;
}
else
{
l9_1207=l9_1206;
}
float l9_1208=l9_1176.y;
float l9_1209=l9_1181.y;
float l9_1210=l9_1181.w;
bool l9_1211=l9_1207;
float l9_1212=l9_1186;
float l9_1213=fast::clamp(l9_1208,l9_1209,l9_1210);
float l9_1214=step(abs(l9_1208-l9_1213),9.9999997e-06);
l9_1212*=(l9_1214+((1.0-float(l9_1211))*(1.0-l9_1214)));
l9_1208=l9_1213;
l9_1176.y=l9_1208;
l9_1186=l9_1212;
}
float2 l9_1215=l9_1176;
bool l9_1216=l9_1177;
float3x3 l9_1217=l9_1178;
if (l9_1216)
{
l9_1215=float2((l9_1217*float3(l9_1215,1.0)).xy);
}
float2 l9_1218=l9_1215;
float2 l9_1219=l9_1218;
float2 l9_1220=l9_1219;
l9_1176=l9_1220;
float l9_1221=l9_1176.x;
int l9_1222=l9_1179.x;
bool l9_1223=l9_1185;
float l9_1224=l9_1186;
if ((l9_1222==0)||(l9_1222==3))
{
float l9_1225=l9_1221;
float l9_1226=0.0;
float l9_1227=1.0;
bool l9_1228=l9_1223;
float l9_1229=l9_1224;
float l9_1230=fast::clamp(l9_1225,l9_1226,l9_1227);
float l9_1231=step(abs(l9_1225-l9_1230),9.9999997e-06);
l9_1229*=(l9_1231+((1.0-float(l9_1228))*(1.0-l9_1231)));
l9_1225=l9_1230;
l9_1221=l9_1225;
l9_1224=l9_1229;
}
l9_1176.x=l9_1221;
l9_1186=l9_1224;
float l9_1232=l9_1176.y;
int l9_1233=l9_1179.y;
bool l9_1234=l9_1185;
float l9_1235=l9_1186;
if ((l9_1233==0)||(l9_1233==3))
{
float l9_1236=l9_1232;
float l9_1237=0.0;
float l9_1238=1.0;
bool l9_1239=l9_1234;
float l9_1240=l9_1235;
float l9_1241=fast::clamp(l9_1236,l9_1237,l9_1238);
float l9_1242=step(abs(l9_1236-l9_1241),9.9999997e-06);
l9_1240*=(l9_1242+((1.0-float(l9_1239))*(1.0-l9_1242)));
l9_1236=l9_1241;
l9_1232=l9_1236;
l9_1235=l9_1240;
}
l9_1176.y=l9_1232;
l9_1186=l9_1235;
float2 l9_1243=l9_1176;
int l9_1244=l9_1174;
int l9_1245=l9_1175;
float l9_1246=l9_1184;
float2 l9_1247=l9_1243;
int l9_1248=l9_1244;
int l9_1249=l9_1245;
float3 l9_1250=float3(0.0);
if (l9_1248==0)
{
l9_1250=float3(l9_1247,0.0);
}
else
{
if (l9_1248==1)
{
l9_1250=float3(l9_1247.x,(l9_1247.y*0.5)+(0.5-(float(l9_1249)*0.5)),0.0);
}
else
{
l9_1250=float3(l9_1247,float(l9_1249));
}
}
float3 l9_1251=l9_1250;
float3 l9_1252=l9_1251;
float2 l9_1253=l9_1252.xy;
float l9_1254=l9_1246;
float4 l9_1255=sc_set0.oceanHeightmap.sample(sc_set0.oceanHeightmapSmpSC,l9_1253,bias(l9_1254));
float4 l9_1256=l9_1255;
float4 l9_1257=l9_1256;
if (l9_1182)
{
l9_1257=mix(l9_1183,l9_1257,float4(l9_1186));
}
float4 l9_1258=l9_1257;
l9_1167=l9_1258;
float4 l9_1259=l9_1167;
float l9_1260=l9_1259.x;
l9_1260=0.0+(((l9_1260-0.0)*(N5_unpackVal.y-0.0))/1.000001);
float l9_1261=l9_1260+N5_OceanWorldTransform.y;
if (N5_EnableFluid==1.0)
{
float l9_1262=N5_pressureRange.x;
float2 l9_1263=l9_1165;
float4 l9_1264=float4(0.0);
int l9_1265=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_1266=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1266=0;
}
else
{
l9_1266=in.varStereoViewID;
}
int l9_1267=l9_1266;
l9_1265=1-l9_1267;
}
else
{
int l9_1268=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1268=0;
}
else
{
l9_1268=in.varStereoViewID;
}
int l9_1269=l9_1268;
l9_1265=l9_1269;
}
int l9_1270=l9_1265;
int l9_1271=fluidPressureLayout_tmp;
int l9_1272=l9_1270;
float2 l9_1273=l9_1263;
bool l9_1274=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_1275=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_1276=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_1277=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_1278=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_1279=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_1280=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_1281=0.0;
bool l9_1282=l9_1279&&(!l9_1277);
float l9_1283=1.0;
float l9_1284=l9_1273.x;
int l9_1285=l9_1276.x;
if (l9_1285==1)
{
l9_1284=fract(l9_1284);
}
else
{
if (l9_1285==2)
{
float l9_1286=fract(l9_1284);
float l9_1287=l9_1284-l9_1286;
float l9_1288=step(0.25,fract(l9_1287*0.5));
l9_1284=mix(l9_1286,1.0-l9_1286,fast::clamp(l9_1288,0.0,1.0));
}
}
l9_1273.x=l9_1284;
float l9_1289=l9_1273.y;
int l9_1290=l9_1276.y;
if (l9_1290==1)
{
l9_1289=fract(l9_1289);
}
else
{
if (l9_1290==2)
{
float l9_1291=fract(l9_1289);
float l9_1292=l9_1289-l9_1291;
float l9_1293=step(0.25,fract(l9_1292*0.5));
l9_1289=mix(l9_1291,1.0-l9_1291,fast::clamp(l9_1293,0.0,1.0));
}
}
l9_1273.y=l9_1289;
if (l9_1277)
{
bool l9_1294=l9_1279;
bool l9_1295;
if (l9_1294)
{
l9_1295=l9_1276.x==3;
}
else
{
l9_1295=l9_1294;
}
float l9_1296=l9_1273.x;
float l9_1297=l9_1278.x;
float l9_1298=l9_1278.z;
bool l9_1299=l9_1295;
float l9_1300=l9_1283;
float l9_1301=fast::clamp(l9_1296,l9_1297,l9_1298);
float l9_1302=step(abs(l9_1296-l9_1301),9.9999997e-06);
l9_1300*=(l9_1302+((1.0-float(l9_1299))*(1.0-l9_1302)));
l9_1296=l9_1301;
l9_1273.x=l9_1296;
l9_1283=l9_1300;
bool l9_1303=l9_1279;
bool l9_1304;
if (l9_1303)
{
l9_1304=l9_1276.y==3;
}
else
{
l9_1304=l9_1303;
}
float l9_1305=l9_1273.y;
float l9_1306=l9_1278.y;
float l9_1307=l9_1278.w;
bool l9_1308=l9_1304;
float l9_1309=l9_1283;
float l9_1310=fast::clamp(l9_1305,l9_1306,l9_1307);
float l9_1311=step(abs(l9_1305-l9_1310),9.9999997e-06);
l9_1309*=(l9_1311+((1.0-float(l9_1308))*(1.0-l9_1311)));
l9_1305=l9_1310;
l9_1273.y=l9_1305;
l9_1283=l9_1309;
}
float2 l9_1312=l9_1273;
bool l9_1313=l9_1274;
float3x3 l9_1314=l9_1275;
if (l9_1313)
{
l9_1312=float2((l9_1314*float3(l9_1312,1.0)).xy);
}
float2 l9_1315=l9_1312;
float2 l9_1316=l9_1315;
float2 l9_1317=l9_1316;
l9_1273=l9_1317;
float l9_1318=l9_1273.x;
int l9_1319=l9_1276.x;
bool l9_1320=l9_1282;
float l9_1321=l9_1283;
if ((l9_1319==0)||(l9_1319==3))
{
float l9_1322=l9_1318;
float l9_1323=0.0;
float l9_1324=1.0;
bool l9_1325=l9_1320;
float l9_1326=l9_1321;
float l9_1327=fast::clamp(l9_1322,l9_1323,l9_1324);
float l9_1328=step(abs(l9_1322-l9_1327),9.9999997e-06);
l9_1326*=(l9_1328+((1.0-float(l9_1325))*(1.0-l9_1328)));
l9_1322=l9_1327;
l9_1318=l9_1322;
l9_1321=l9_1326;
}
l9_1273.x=l9_1318;
l9_1283=l9_1321;
float l9_1329=l9_1273.y;
int l9_1330=l9_1276.y;
bool l9_1331=l9_1282;
float l9_1332=l9_1283;
if ((l9_1330==0)||(l9_1330==3))
{
float l9_1333=l9_1329;
float l9_1334=0.0;
float l9_1335=1.0;
bool l9_1336=l9_1331;
float l9_1337=l9_1332;
float l9_1338=fast::clamp(l9_1333,l9_1334,l9_1335);
float l9_1339=step(abs(l9_1333-l9_1338),9.9999997e-06);
l9_1337*=(l9_1339+((1.0-float(l9_1336))*(1.0-l9_1339)));
l9_1333=l9_1338;
l9_1329=l9_1333;
l9_1332=l9_1337;
}
l9_1273.y=l9_1329;
l9_1283=l9_1332;
float2 l9_1340=l9_1273;
int l9_1341=l9_1271;
int l9_1342=l9_1272;
float l9_1343=l9_1281;
float2 l9_1344=l9_1340;
int l9_1345=l9_1341;
int l9_1346=l9_1342;
float3 l9_1347=float3(0.0);
if (l9_1345==0)
{
l9_1347=float3(l9_1344,0.0);
}
else
{
if (l9_1345==1)
{
l9_1347=float3(l9_1344.x,(l9_1344.y*0.5)+(0.5-(float(l9_1346)*0.5)),0.0);
}
else
{
l9_1347=float3(l9_1344,float(l9_1346));
}
}
float3 l9_1348=l9_1347;
float3 l9_1349=l9_1348;
float2 l9_1350=l9_1349.xy;
float l9_1351=l9_1343;
float4 l9_1352=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_1350,bias(l9_1351));
float4 l9_1353=l9_1352;
float4 l9_1354=l9_1353;
if (l9_1279)
{
l9_1354=mix(l9_1280,l9_1354,float4(l9_1283));
}
float4 l9_1355=l9_1354;
l9_1264=l9_1355;
float4 l9_1356=l9_1264;
float l9_1357=l9_1262+(((l9_1356.x-0.0)*(N5_pressureRange.y-N5_pressureRange.x))/1.000001);
l9_1261+=(l9_1357*N5_FluidMul);
}
float2 l9_1358=tempGlobals.gScreenCoord;
float2 l9_1359=l9_1358;
float4 l9_1360=float4(0.0);
int l9_1361=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1362=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1362=0;
}
else
{
l9_1362=in.varStereoViewID;
}
int l9_1363=l9_1362;
l9_1361=1-l9_1363;
}
else
{
int l9_1364=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1364=0;
}
else
{
l9_1364=in.varStereoViewID;
}
int l9_1365=l9_1364;
l9_1361=l9_1365;
}
int l9_1366=l9_1361;
int l9_1367=screenTexLayout_tmp;
int l9_1368=l9_1366;
float2 l9_1369=l9_1359;
bool l9_1370=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1371=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1372=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1373=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1374=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1375=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1376=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1377=0.0;
bool l9_1378=l9_1375&&(!l9_1373);
float l9_1379=1.0;
float l9_1380=l9_1369.x;
int l9_1381=l9_1372.x;
if (l9_1381==1)
{
l9_1380=fract(l9_1380);
}
else
{
if (l9_1381==2)
{
float l9_1382=fract(l9_1380);
float l9_1383=l9_1380-l9_1382;
float l9_1384=step(0.25,fract(l9_1383*0.5));
l9_1380=mix(l9_1382,1.0-l9_1382,fast::clamp(l9_1384,0.0,1.0));
}
}
l9_1369.x=l9_1380;
float l9_1385=l9_1369.y;
int l9_1386=l9_1372.y;
if (l9_1386==1)
{
l9_1385=fract(l9_1385);
}
else
{
if (l9_1386==2)
{
float l9_1387=fract(l9_1385);
float l9_1388=l9_1385-l9_1387;
float l9_1389=step(0.25,fract(l9_1388*0.5));
l9_1385=mix(l9_1387,1.0-l9_1387,fast::clamp(l9_1389,0.0,1.0));
}
}
l9_1369.y=l9_1385;
if (l9_1373)
{
bool l9_1390=l9_1375;
bool l9_1391;
if (l9_1390)
{
l9_1391=l9_1372.x==3;
}
else
{
l9_1391=l9_1390;
}
float l9_1392=l9_1369.x;
float l9_1393=l9_1374.x;
float l9_1394=l9_1374.z;
bool l9_1395=l9_1391;
float l9_1396=l9_1379;
float l9_1397=fast::clamp(l9_1392,l9_1393,l9_1394);
float l9_1398=step(abs(l9_1392-l9_1397),9.9999997e-06);
l9_1396*=(l9_1398+((1.0-float(l9_1395))*(1.0-l9_1398)));
l9_1392=l9_1397;
l9_1369.x=l9_1392;
l9_1379=l9_1396;
bool l9_1399=l9_1375;
bool l9_1400;
if (l9_1399)
{
l9_1400=l9_1372.y==3;
}
else
{
l9_1400=l9_1399;
}
float l9_1401=l9_1369.y;
float l9_1402=l9_1374.y;
float l9_1403=l9_1374.w;
bool l9_1404=l9_1400;
float l9_1405=l9_1379;
float l9_1406=fast::clamp(l9_1401,l9_1402,l9_1403);
float l9_1407=step(abs(l9_1401-l9_1406),9.9999997e-06);
l9_1405*=(l9_1407+((1.0-float(l9_1404))*(1.0-l9_1407)));
l9_1401=l9_1406;
l9_1369.y=l9_1401;
l9_1379=l9_1405;
}
float2 l9_1408=l9_1369;
bool l9_1409=l9_1370;
float3x3 l9_1410=l9_1371;
if (l9_1409)
{
l9_1408=float2((l9_1410*float3(l9_1408,1.0)).xy);
}
float2 l9_1411=l9_1408;
float2 l9_1412=l9_1411;
float2 l9_1413=l9_1412;
l9_1369=l9_1413;
float l9_1414=l9_1369.x;
int l9_1415=l9_1372.x;
bool l9_1416=l9_1378;
float l9_1417=l9_1379;
if ((l9_1415==0)||(l9_1415==3))
{
float l9_1418=l9_1414;
float l9_1419=0.0;
float l9_1420=1.0;
bool l9_1421=l9_1416;
float l9_1422=l9_1417;
float l9_1423=fast::clamp(l9_1418,l9_1419,l9_1420);
float l9_1424=step(abs(l9_1418-l9_1423),9.9999997e-06);
l9_1422*=(l9_1424+((1.0-float(l9_1421))*(1.0-l9_1424)));
l9_1418=l9_1423;
l9_1414=l9_1418;
l9_1417=l9_1422;
}
l9_1369.x=l9_1414;
l9_1379=l9_1417;
float l9_1425=l9_1369.y;
int l9_1426=l9_1372.y;
bool l9_1427=l9_1378;
float l9_1428=l9_1379;
if ((l9_1426==0)||(l9_1426==3))
{
float l9_1429=l9_1425;
float l9_1430=0.0;
float l9_1431=1.0;
bool l9_1432=l9_1427;
float l9_1433=l9_1428;
float l9_1434=fast::clamp(l9_1429,l9_1430,l9_1431);
float l9_1435=step(abs(l9_1429-l9_1434),9.9999997e-06);
l9_1433*=(l9_1435+((1.0-float(l9_1432))*(1.0-l9_1435)));
l9_1429=l9_1434;
l9_1425=l9_1429;
l9_1428=l9_1433;
}
l9_1369.y=l9_1425;
l9_1379=l9_1428;
float2 l9_1436=l9_1369;
int l9_1437=l9_1367;
int l9_1438=l9_1368;
float l9_1439=l9_1377;
float2 l9_1440=l9_1436;
int l9_1441=l9_1437;
int l9_1442=l9_1438;
float3 l9_1443=float3(0.0);
if (l9_1441==0)
{
l9_1443=float3(l9_1440,0.0);
}
else
{
if (l9_1441==1)
{
l9_1443=float3(l9_1440.x,(l9_1440.y*0.5)+(0.5-(float(l9_1442)*0.5)),0.0);
}
else
{
l9_1443=float3(l9_1440,float(l9_1442));
}
}
float3 l9_1444=l9_1443;
float3 l9_1445=l9_1444;
float2 l9_1446=l9_1445.xy;
float l9_1447=l9_1439;
float4 l9_1448=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1446,bias(l9_1447));
float4 l9_1449=l9_1448;
float4 l9_1450=l9_1449;
if (l9_1375)
{
l9_1450=mix(l9_1376,l9_1450,float4(l9_1379));
}
float4 l9_1451=l9_1450;
l9_1360=l9_1451;
float4 l9_1452=l9_1360;
float4 l9_1453=l9_1452;
float l9_1454=0.050000001;
float l9_1455=((l9_1162.y-l9_1261)>l9_1454) ? 0.0 : 1.0;
N5_Result=mix(l9_1453,float4(N5_Underwater,1.0),float4(l9_1455));
if (N5_EnableLine)
{
float l9_1456=1.0-smoothstep(N5_Thickness*0.0099999998,N5_Thickness,abs((l9_1162.y-l9_1261)-l9_1454));
float l9_1457=0.30000001;
float l9_1458=1.0;
float2 l9_1459=tempGlobals.Surface_UVCoord0;
float l9_1460=1.0-((l9_1459.x-0.5)*2.0);
float l9_1461=l9_1460;
float l9_1462=l9_1457;
float l9_1463;
if (l9_1461<=0.0)
{
l9_1463=0.0;
}
else
{
l9_1463=pow(l9_1461,l9_1462);
}
float l9_1464=l9_1463;
l9_1460=fast::clamp(l9_1464*l9_1458,0.0,1.0);
float l9_1465=l9_1460;
float2 l9_1466=tempGlobals.gScreenCoord;
float2 l9_1467=l9_1466*l9_1465;
float2 l9_1468=l9_1467;
float l9_1469=5.0;
float4 l9_1470=float4(0.0);
int l9_1471=0;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1472=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1472=0;
}
else
{
l9_1472=in.varStereoViewID;
}
int l9_1473=l9_1472;
l9_1471=1-l9_1473;
}
else
{
int l9_1474=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1474=0;
}
else
{
l9_1474=in.varStereoViewID;
}
int l9_1475=l9_1474;
l9_1471=l9_1475;
}
int l9_1476=l9_1471;
int l9_1477=screenTexLayout_tmp;
int l9_1478=l9_1476;
float2 l9_1479=l9_1468;
bool l9_1480=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1481=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1482=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1483=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1484=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1485=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1486=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1487=l9_1469;
bool l9_1488=l9_1485&&(!l9_1483);
float l9_1489=1.0;
float l9_1490=l9_1479.x;
int l9_1491=l9_1482.x;
if (l9_1491==1)
{
l9_1490=fract(l9_1490);
}
else
{
if (l9_1491==2)
{
float l9_1492=fract(l9_1490);
float l9_1493=l9_1490-l9_1492;
float l9_1494=step(0.25,fract(l9_1493*0.5));
l9_1490=mix(l9_1492,1.0-l9_1492,fast::clamp(l9_1494,0.0,1.0));
}
}
l9_1479.x=l9_1490;
float l9_1495=l9_1479.y;
int l9_1496=l9_1482.y;
if (l9_1496==1)
{
l9_1495=fract(l9_1495);
}
else
{
if (l9_1496==2)
{
float l9_1497=fract(l9_1495);
float l9_1498=l9_1495-l9_1497;
float l9_1499=step(0.25,fract(l9_1498*0.5));
l9_1495=mix(l9_1497,1.0-l9_1497,fast::clamp(l9_1499,0.0,1.0));
}
}
l9_1479.y=l9_1495;
if (l9_1483)
{
bool l9_1500=l9_1485;
bool l9_1501;
if (l9_1500)
{
l9_1501=l9_1482.x==3;
}
else
{
l9_1501=l9_1500;
}
float l9_1502=l9_1479.x;
float l9_1503=l9_1484.x;
float l9_1504=l9_1484.z;
bool l9_1505=l9_1501;
float l9_1506=l9_1489;
float l9_1507=fast::clamp(l9_1502,l9_1503,l9_1504);
float l9_1508=step(abs(l9_1502-l9_1507),9.9999997e-06);
l9_1506*=(l9_1508+((1.0-float(l9_1505))*(1.0-l9_1508)));
l9_1502=l9_1507;
l9_1479.x=l9_1502;
l9_1489=l9_1506;
bool l9_1509=l9_1485;
bool l9_1510;
if (l9_1509)
{
l9_1510=l9_1482.y==3;
}
else
{
l9_1510=l9_1509;
}
float l9_1511=l9_1479.y;
float l9_1512=l9_1484.y;
float l9_1513=l9_1484.w;
bool l9_1514=l9_1510;
float l9_1515=l9_1489;
float l9_1516=fast::clamp(l9_1511,l9_1512,l9_1513);
float l9_1517=step(abs(l9_1511-l9_1516),9.9999997e-06);
l9_1515*=(l9_1517+((1.0-float(l9_1514))*(1.0-l9_1517)));
l9_1511=l9_1516;
l9_1479.y=l9_1511;
l9_1489=l9_1515;
}
float2 l9_1518=l9_1479;
bool l9_1519=l9_1480;
float3x3 l9_1520=l9_1481;
if (l9_1519)
{
l9_1518=float2((l9_1520*float3(l9_1518,1.0)).xy);
}
float2 l9_1521=l9_1518;
float2 l9_1522=l9_1521;
float2 l9_1523=l9_1522;
l9_1479=l9_1523;
float l9_1524=l9_1479.x;
int l9_1525=l9_1482.x;
bool l9_1526=l9_1488;
float l9_1527=l9_1489;
if ((l9_1525==0)||(l9_1525==3))
{
float l9_1528=l9_1524;
float l9_1529=0.0;
float l9_1530=1.0;
bool l9_1531=l9_1526;
float l9_1532=l9_1527;
float l9_1533=fast::clamp(l9_1528,l9_1529,l9_1530);
float l9_1534=step(abs(l9_1528-l9_1533),9.9999997e-06);
l9_1532*=(l9_1534+((1.0-float(l9_1531))*(1.0-l9_1534)));
l9_1528=l9_1533;
l9_1524=l9_1528;
l9_1527=l9_1532;
}
l9_1479.x=l9_1524;
l9_1489=l9_1527;
float l9_1535=l9_1479.y;
int l9_1536=l9_1482.y;
bool l9_1537=l9_1488;
float l9_1538=l9_1489;
if ((l9_1536==0)||(l9_1536==3))
{
float l9_1539=l9_1535;
float l9_1540=0.0;
float l9_1541=1.0;
bool l9_1542=l9_1537;
float l9_1543=l9_1538;
float l9_1544=fast::clamp(l9_1539,l9_1540,l9_1541);
float l9_1545=step(abs(l9_1539-l9_1544),9.9999997e-06);
l9_1543*=(l9_1545+((1.0-float(l9_1542))*(1.0-l9_1545)));
l9_1539=l9_1544;
l9_1535=l9_1539;
l9_1538=l9_1543;
}
l9_1479.y=l9_1535;
l9_1489=l9_1538;
float2 l9_1546=l9_1479;
int l9_1547=l9_1477;
int l9_1548=l9_1478;
float l9_1549=l9_1487;
float2 l9_1550=l9_1546;
int l9_1551=l9_1547;
int l9_1552=l9_1548;
float3 l9_1553=float3(0.0);
if (l9_1551==0)
{
l9_1553=float3(l9_1550,0.0);
}
else
{
if (l9_1551==1)
{
l9_1553=float3(l9_1550.x,(l9_1550.y*0.5)+(0.5-(float(l9_1552)*0.5)),0.0);
}
else
{
l9_1553=float3(l9_1550,float(l9_1552));
}
}
float3 l9_1554=l9_1553;
float3 l9_1555=l9_1554;
float2 l9_1556=l9_1555.xy;
float l9_1557=l9_1549;
float4 l9_1558=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1556,level(l9_1557));
float4 l9_1559=l9_1558;
float4 l9_1560=l9_1559;
if (l9_1485)
{
l9_1560=mix(l9_1486,l9_1560,float4(l9_1489));
}
float4 l9_1561=l9_1560;
l9_1470=l9_1561;
float4 l9_1562=l9_1470;
float3 l9_1563=l9_1562.xyz*N5_LineColor;
N5_Result=mix(N5_Result,float4(l9_1563,1.0),float4(l9_1456));
}
param_50=N5_Result;
Result_N5=param_50;
FinalColor=Result_N5;
float param_52=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_52<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1564=gl_FragCoord;
float2 l9_1565=floor(mod(l9_1564.xy,float2(4.0)));
float l9_1566=(mod(dot(l9_1565,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_52<l9_1566)
{
discard_fragment();
}
}
float4 param_53=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1567=param_53;
float4 l9_1568=l9_1567;
float l9_1569=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1569=l9_1568.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1569=fast::clamp(l9_1568.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1569=fast::clamp(dot(l9_1568.xyz,float3(l9_1568.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1569=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1569=(1.0-dot(l9_1568.xyz,float3(0.33333001)))*l9_1568.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1569=(1.0-fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0))*l9_1568.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1569=fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0)*l9_1568.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1569=fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1569=fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0)*l9_1568.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1569=dot(l9_1568.xyz,float3(0.33333001))*l9_1568.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1569=1.0-fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1569=fast::clamp(dot(l9_1568.xyz,float3(1.0)),0.0,1.0);
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
float l9_1570=l9_1569;
float l9_1571=l9_1570;
float l9_1572=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1571;
float3 l9_1573=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1567.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1574=float4(l9_1573.x,l9_1573.y,l9_1573.z,l9_1572);
param_53=l9_1574;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_53=float4(param_53.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1575=param_53;
float4 l9_1576=float4(0.0);
float4 l9_1577=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1578=out.FragColor0;
float4 l9_1579=l9_1578;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1579.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1580=l9_1579;
l9_1577=l9_1580;
}
else
{
float4 l9_1581=gl_FragCoord;
float2 l9_1582=l9_1581.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1583=l9_1582;
float2 l9_1584=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1585=1;
int l9_1586=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1586=0;
}
else
{
l9_1586=in.varStereoViewID;
}
int l9_1587=l9_1586;
int l9_1588=l9_1587;
float3 l9_1589=float3(l9_1583,0.0);
int l9_1590=l9_1585;
int l9_1591=l9_1588;
if (l9_1590==1)
{
l9_1589.y=((2.0*l9_1589.y)+float(l9_1591))-1.0;
}
float2 l9_1592=l9_1589.xy;
l9_1584=l9_1592;
}
else
{
l9_1584=l9_1583;
}
float2 l9_1593=l9_1584;
float2 l9_1594=l9_1593;
float2 l9_1595=l9_1594;
int l9_1596=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1597=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1597=0;
}
else
{
l9_1597=in.varStereoViewID;
}
int l9_1598=l9_1597;
l9_1596=1-l9_1598;
}
else
{
int l9_1599=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1599=0;
}
else
{
l9_1599=in.varStereoViewID;
}
int l9_1600=l9_1599;
l9_1596=l9_1600;
}
int l9_1601=l9_1596;
float2 l9_1602=l9_1595;
int l9_1603=l9_1601;
float2 l9_1604=l9_1602;
int l9_1605=l9_1603;
float l9_1606=0.0;
float4 l9_1607=float4(0.0);
float2 l9_1608=l9_1604;
int l9_1609=sc_ScreenTextureLayout_tmp;
int l9_1610=l9_1605;
float l9_1611=l9_1606;
float2 l9_1612=l9_1608;
int l9_1613=l9_1609;
int l9_1614=l9_1610;
float3 l9_1615=float3(0.0);
if (l9_1613==0)
{
l9_1615=float3(l9_1612,0.0);
}
else
{
if (l9_1613==1)
{
l9_1615=float3(l9_1612.x,(l9_1612.y*0.5)+(0.5-(float(l9_1614)*0.5)),0.0);
}
else
{
l9_1615=float3(l9_1612,float(l9_1614));
}
}
float3 l9_1616=l9_1615;
float3 l9_1617=l9_1616;
float2 l9_1618=l9_1617.xy;
float l9_1619=l9_1611;
float4 l9_1620=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1618,bias(l9_1619));
float4 l9_1621=l9_1620;
l9_1607=l9_1621;
float4 l9_1622=l9_1607;
float4 l9_1623=l9_1622;
float4 l9_1624=l9_1623;
l9_1577=l9_1624;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_1577.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_1625=l9_1577;
float4 l9_1626=l9_1625;
float3 l9_1627=l9_1626.xyz;
float3 l9_1628=l9_1627;
float3 l9_1629=l9_1575.xyz;
float3 l9_1630=definedBlend(l9_1628,l9_1629,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1576=float4(l9_1630.x,l9_1630.y,l9_1630.z,l9_1576.w);
float3 l9_1631=mix(l9_1627,l9_1576.xyz,float3(l9_1575.w));
l9_1576=float4(l9_1631.x,l9_1631.y,l9_1631.z,l9_1576.w);
l9_1576.w=1.0;
float4 l9_1632=l9_1576;
param_53=l9_1632;
}
else
{
float4 l9_1633=param_53;
float4 l9_1634=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1634=float4(mix(float3(1.0),l9_1633.xyz,float3(l9_1633.w)),l9_1633.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1635=l9_1633.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1635=fast::clamp(l9_1635,0.0,1.0);
}
l9_1634=float4(l9_1633.xyz*l9_1635,l9_1635);
}
else
{
l9_1634=l9_1633;
}
}
float4 l9_1636=l9_1634;
param_53=l9_1636;
}
}
}
float4 l9_1637=param_53;
FinalColor=l9_1637;
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
float4 l9_1638=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1638=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1638=float4(0.0);
}
float4 l9_1639=l9_1638;
float4 Cost=l9_1639;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
out.gl_FragDepth=Depth;
float3 param_54=in.varPos;
float4 param_55=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_54,param_55,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_56=FinalColor;
float4 l9_1640=param_56;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1640.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1640;
return out;
}
} // FRAGMENT SHADER
