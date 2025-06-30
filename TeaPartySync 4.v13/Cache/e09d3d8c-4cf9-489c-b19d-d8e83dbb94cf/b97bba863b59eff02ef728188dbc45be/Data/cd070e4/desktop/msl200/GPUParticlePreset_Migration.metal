#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#ifdef ALIGNTOX
#undef ALIGNTOX
#endif
#ifdef ALIGNTOY
#undef ALIGNTOY
#endif
#ifdef ALIGNTOZ
#undef ALIGNTOZ
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
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler colorRampTextureSmpSC 0:21
//sampler sampler intensityTextureSmpSC 0:22
//sampler sampler mainTextureSmpSC 0:23
//sampler sampler sc_ScreenTextureSmpSC 0:28
//sampler sampler sizeRampTextureSmpSC 0:31
//sampler sampler vectorTextureSmpSC 0:32
//sampler sampler velRampTextureSmpSC 0:33
//texture texture2D colorRampTexture 0:1:0:21
//texture texture2D intensityTexture 0:2:0:22
//texture texture2D mainTexture 0:3:0:23
//texture texture2D sc_ScreenTexture 0:15:0:28
//texture texture2D sizeRampTexture 0:18:0:31
//texture texture2D vectorTexture 0:19:0:32
//texture texture2D velRampTexture 0:20:0:33
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:34:5312 {
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
//float timeGlobal 4128
//float externalTimeInput 4132
//float externalSeed 4136
//float lifeTimeConstant 4140
//float2 lifeTimeMinMax 4144
//float spawnDuration 4152
//float spawnMaxParticles 4156
//float2 sizeStart 4160
//float2 sizeEnd 4168
//float2 sizeStartMin 4176
//float2 sizeStartMax 4184
//float2 sizeEndMin 4192
//float2 sizeEndMax 4200
//float sizeSpeed 4208
//float3x3 sizeRampTextureTransform 4272
//float4 sizeRampTextureUvMinMax 4320
//float4 sizeRampTextureBorderColor 4336
//float3 spawnLocation 4352
//float3 spawnBox 4368
//float3 spawnSphere 4384
//float3 velocityMin 4400
//float3 velocityMax 4416
//float3 velocityDrag 4432
//float3x3 velRampTextureTransform 4496
//float4 velRampTextureUvMinMax 4544
//float4 velRampTextureBorderColor 4560
//float3 noiseMult 4576
//float3 noiseFrequency 4592
//float3 sNoiseMult 4608
//float3 sNoiseFrequency 4624
//float gravity 4640
//float3 localForce 4656
//float sizeVelScale 4672
//bool ALIGNTOX 4676
//bool ALIGNTOY 4680
//bool ALIGNTOZ 4684
//float2 rotationRandom 4688
//float2 rotationRate 4696
//float rotationDrag 4704
//float3x3 mainTextureTransform 4768
//float4 mainTextureUvMinMax 4816
//float4 mainTextureBorderColor 4832
//float numValidFrames 4848
//float2 gridSize 4856
//float flipBookSpeedMult 4864
//float flipBookRandomStart 4868
//float3x3 vectorTextureTransform 4928
//float4 vectorTextureUvMinMax 4976
//float4 vectorTextureBorderColor 4992
//float flowStrength 5008
//float flowSpeed 5012
//float3 colorStart 5024
//float3 colorEnd 5040
//float3 colorMinStart 5056
//float3 colorMinEnd 5072
//float3 colorMaxStart 5088
//float3 colorMaxEnd 5104
//float alphaStart 5120
//float alphaEnd 5124
//float alphaMinStart 5128
//float alphaMinEnd 5132
//float alphaMaxStart 5136
//float alphaMaxEnd 5140
//float4 colorRampTextureSize 5152
//float3x3 colorRampTextureTransform 5200
//float4 colorRampTextureUvMinMax 5248
//float4 colorRampTextureBorderColor 5264
//float4 colorRampMult 5280
//float alphaDissolveMult 5296
//}
//spec_const bool ALPHADISSOLVE 0 0
//spec_const bool ALPHAMINMAX 1 0
//spec_const bool BASETEXTURE 2 0
//spec_const bool BLACKASALPHA 3 0
//spec_const bool BLEND_MODE_AVERAGE 4 0
//spec_const bool BLEND_MODE_BRIGHT 5 0
//spec_const bool BLEND_MODE_COLOR_BURN 6 0
//spec_const bool BLEND_MODE_COLOR_DODGE 7 0
//spec_const bool BLEND_MODE_COLOR 8 0
//spec_const bool BLEND_MODE_DARKEN 9 0
//spec_const bool BLEND_MODE_DIFFERENCE 10 0
//spec_const bool BLEND_MODE_DIVIDE 11 0
//spec_const bool BLEND_MODE_DIVISION 12 0
//spec_const bool BLEND_MODE_EXCLUSION 13 0
//spec_const bool BLEND_MODE_FORGRAY 14 0
//spec_const bool BLEND_MODE_HARD_GLOW 15 0
//spec_const bool BLEND_MODE_HARD_LIGHT 16 0
//spec_const bool BLEND_MODE_HARD_MIX 17 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 18 0
//spec_const bool BLEND_MODE_HARD_REFLECT 19 0
//spec_const bool BLEND_MODE_HUE 20 0
//spec_const bool BLEND_MODE_INTENSE 21 0
//spec_const bool BLEND_MODE_LIGHTEN 22 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 23 0
//spec_const bool BLEND_MODE_LUMINOSITY 24 0
//spec_const bool BLEND_MODE_NEGATION 25 0
//spec_const bool BLEND_MODE_NOTBRIGHT 26 0
//spec_const bool BLEND_MODE_OVERLAY 27 0
//spec_const bool BLEND_MODE_PIN_LIGHT 28 0
//spec_const bool BLEND_MODE_REALISTIC 29 0
//spec_const bool BLEND_MODE_SATURATION 30 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 31 0
//spec_const bool BLEND_MODE_SUBTRACT 32 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 33 0
//spec_const bool BOXSPAWN 34 0
//spec_const bool COLORMINMAX 35 0
//spec_const bool COLORMONOMIN 36 0
//spec_const bool COLORRAMP 37 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 38 0
//spec_const bool EXTERNALTIME 39 0
//spec_const bool FLIPBOOKBLEND 40 0
//spec_const bool FLIPBOOKBYLIFE 41 0
//spec_const bool FLIPBOOK 42 0
//spec_const bool FORCE 43 0
//spec_const bool IGNOREVEL 44 0
//spec_const bool INILOCATION 45 0
//spec_const bool INSTANTSPAWN 46 0
//spec_const bool LIFETIMEMINMAX 47 0
//spec_const bool MAXPARTICLECOUNT 48 0
//spec_const bool NOISE 49 0
//spec_const bool NORANDOFFSET 50 0
//spec_const bool PREMULTIPLIEDCOLOR 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_colorRampTexture 52 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 53 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_mainTexture 54 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture 55 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_vectorTexture 56 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_velRampTexture 57 0
//spec_const bool SC_USE_UV_MIN_MAX_colorRampTexture 58 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 59 0
//spec_const bool SC_USE_UV_MIN_MAX_mainTexture 60 0
//spec_const bool SC_USE_UV_MIN_MAX_sizeRampTexture 61 0
//spec_const bool SC_USE_UV_MIN_MAX_vectorTexture 62 0
//spec_const bool SC_USE_UV_MIN_MAX_velRampTexture 63 0
//spec_const bool SC_USE_UV_TRANSFORM_colorRampTexture 64 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 65 0
//spec_const bool SC_USE_UV_TRANSFORM_mainTexture 66 0
//spec_const bool SC_USE_UV_TRANSFORM_sizeRampTexture 67 0
//spec_const bool SC_USE_UV_TRANSFORM_vectorTexture 68 0
//spec_const bool SC_USE_UV_TRANSFORM_velRampTexture 69 0
//spec_const bool SIZEMINMAX 70 0
//spec_const bool SIZERAMP 71 0
//spec_const bool SNOISE 72 0
//spec_const bool SPHERESPAWN 73 0
//spec_const bool UseViewSpaceDepthVariant 74 1
//spec_const bool VECTORFIELD 75 0
//spec_const bool VELOCITYDIR 76 0
//spec_const bool VELRAMP 77 0
//spec_const bool WORLDPOSSEED 78 0
//spec_const bool colorRampTextureHasSwappedViews 79 0
//spec_const bool intensityTextureHasSwappedViews 80 0
//spec_const bool mainTextureHasSwappedViews 81 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 82 0
//spec_const bool sc_BlendMode_Add 83 0
//spec_const bool sc_BlendMode_AlphaTest 84 0
//spec_const bool sc_BlendMode_AlphaToCoverage 85 0
//spec_const bool sc_BlendMode_ColoredGlass 86 0
//spec_const bool sc_BlendMode_Custom 87 0
//spec_const bool sc_BlendMode_Max 88 0
//spec_const bool sc_BlendMode_Min 89 0
//spec_const bool sc_BlendMode_MultiplyOriginal 90 0
//spec_const bool sc_BlendMode_Multiply 91 0
//spec_const bool sc_BlendMode_Normal 92 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 93 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 94 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 95 0
//spec_const bool sc_BlendMode_Screen 96 0
//spec_const bool sc_BlendMode_Software 97 0
//spec_const bool sc_DepthOnly 98 0
//spec_const bool sc_FramebufferFetch 99 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 100 0
//spec_const bool sc_IsEditor 101 0
//spec_const bool sc_MotionVectorsPass 102 0
//spec_const bool sc_OITCompositingPass 103 0
//spec_const bool sc_OITDepthBoundsPass 104 0
//spec_const bool sc_OITDepthGatherPass 105 0
//spec_const bool sc_ProjectiveShadowsCaster 106 0
//spec_const bool sc_ProjectiveShadowsReceiver 107 0
//spec_const bool sc_RenderAlphaToColor 108 0
//spec_const bool sc_ScreenTextureHasSwappedViews 109 0
//spec_const bool sc_ShaderComplexityAnalyzer 110 0
//spec_const bool sc_TAAEnabled 111 0
//spec_const bool sc_UseFramebufferFetchMarker 112 0
//spec_const bool sc_VertexBlendingUseNormals 113 0
//spec_const bool sc_VertexBlending 114 0
//spec_const bool sizeRampTextureHasSwappedViews 115 0
//spec_const bool vectorTextureHasSwappedViews 116 0
//spec_const bool velRampTextureHasSwappedViews 117 0
//spec_const int NODE_67_DROPLIST_ITEM 118 0
//spec_const int SC_DEVICE_CLASS 119 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture 120 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 121 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_mainTexture 122 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture 123 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_vectorTexture 124 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_velRampTexture 125 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture 126 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 127 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_mainTexture 128 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture 129 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_vectorTexture 130 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_velRampTexture 131 -1
//spec_const int colorRampTextureLayout 132 0
//spec_const int intensityTextureLayout 133 0
//spec_const int mainTextureLayout 134 0
//spec_const int sc_DepthBufferMode 135 0
//spec_const int sc_RenderingSpace 136 -1
//spec_const int sc_ScreenTextureLayout 137 0
//spec_const int sc_ShaderCacheConstant 138 0
//spec_const int sc_SkinBonesCount 139 0
//spec_const int sc_StereoRenderingMode 140 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 141 0
//spec_const int sizeRampTextureLayout 142 0
//spec_const int vectorTextureLayout 143 0
//spec_const int velRampTextureLayout 144 0
//SG_REFLECTION_END
constant bool ALPHADISSOLVE [[function_constant(0)]];
constant bool ALPHADISSOLVE_tmp = is_function_constant_defined(ALPHADISSOLVE) ? ALPHADISSOLVE : false;
constant bool ALPHAMINMAX [[function_constant(1)]];
constant bool ALPHAMINMAX_tmp = is_function_constant_defined(ALPHAMINMAX) ? ALPHAMINMAX : false;
constant bool BASETEXTURE [[function_constant(2)]];
constant bool BASETEXTURE_tmp = is_function_constant_defined(BASETEXTURE) ? BASETEXTURE : false;
constant bool BLACKASALPHA [[function_constant(3)]];
constant bool BLACKASALPHA_tmp = is_function_constant_defined(BLACKASALPHA) ? BLACKASALPHA : false;
constant bool BLEND_MODE_AVERAGE [[function_constant(4)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(5)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(6)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(7)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(8)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(9)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(10)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(11)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(12)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(13)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(14)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(15)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(16)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(17)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(18)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(19)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(20)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(21)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(22)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(23)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(24)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(25)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(26)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(27)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(28)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(29)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(30)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(31)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(32)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(33)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool BOXSPAWN [[function_constant(34)]];
constant bool BOXSPAWN_tmp = is_function_constant_defined(BOXSPAWN) ? BOXSPAWN : false;
constant bool COLORMINMAX [[function_constant(35)]];
constant bool COLORMINMAX_tmp = is_function_constant_defined(COLORMINMAX) ? COLORMINMAX : false;
constant bool COLORMONOMIN [[function_constant(36)]];
constant bool COLORMONOMIN_tmp = is_function_constant_defined(COLORMONOMIN) ? COLORMONOMIN : false;
constant bool COLORRAMP [[function_constant(37)]];
constant bool COLORRAMP_tmp = is_function_constant_defined(COLORRAMP) ? COLORRAMP : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(38)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool EXTERNALTIME [[function_constant(39)]];
constant bool EXTERNALTIME_tmp = is_function_constant_defined(EXTERNALTIME) ? EXTERNALTIME : false;
constant bool FLIPBOOKBLEND [[function_constant(40)]];
constant bool FLIPBOOKBLEND_tmp = is_function_constant_defined(FLIPBOOKBLEND) ? FLIPBOOKBLEND : false;
constant bool FLIPBOOKBYLIFE [[function_constant(41)]];
constant bool FLIPBOOKBYLIFE_tmp = is_function_constant_defined(FLIPBOOKBYLIFE) ? FLIPBOOKBYLIFE : false;
constant bool FLIPBOOK [[function_constant(42)]];
constant bool FLIPBOOK_tmp = is_function_constant_defined(FLIPBOOK) ? FLIPBOOK : false;
constant bool FORCE [[function_constant(43)]];
constant bool FORCE_tmp = is_function_constant_defined(FORCE) ? FORCE : false;
constant bool IGNOREVEL [[function_constant(44)]];
constant bool IGNOREVEL_tmp = is_function_constant_defined(IGNOREVEL) ? IGNOREVEL : false;
constant bool INILOCATION [[function_constant(45)]];
constant bool INILOCATION_tmp = is_function_constant_defined(INILOCATION) ? INILOCATION : false;
constant bool INSTANTSPAWN [[function_constant(46)]];
constant bool INSTANTSPAWN_tmp = is_function_constant_defined(INSTANTSPAWN) ? INSTANTSPAWN : false;
constant bool LIFETIMEMINMAX [[function_constant(47)]];
constant bool LIFETIMEMINMAX_tmp = is_function_constant_defined(LIFETIMEMINMAX) ? LIFETIMEMINMAX : false;
constant bool MAXPARTICLECOUNT [[function_constant(48)]];
constant bool MAXPARTICLECOUNT_tmp = is_function_constant_defined(MAXPARTICLECOUNT) ? MAXPARTICLECOUNT : false;
constant bool NOISE [[function_constant(49)]];
constant bool NOISE_tmp = is_function_constant_defined(NOISE) ? NOISE : false;
constant bool NORANDOFFSET [[function_constant(50)]];
constant bool NORANDOFFSET_tmp = is_function_constant_defined(NORANDOFFSET) ? NORANDOFFSET : false;
constant bool PREMULTIPLIEDCOLOR [[function_constant(51)]];
constant bool PREMULTIPLIEDCOLOR_tmp = is_function_constant_defined(PREMULTIPLIEDCOLOR) ? PREMULTIPLIEDCOLOR : false;
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture [[function_constant(52)]];
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_colorRampTexture) ? SC_USE_CLAMP_TO_BORDER_colorRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(53)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture [[function_constant(54)]];
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_mainTexture) ? SC_USE_CLAMP_TO_BORDER_mainTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture [[function_constant(55)]];
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sizeRampTexture) ? SC_USE_CLAMP_TO_BORDER_sizeRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_vectorTexture [[function_constant(56)]];
constant bool SC_USE_CLAMP_TO_BORDER_vectorTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_vectorTexture) ? SC_USE_CLAMP_TO_BORDER_vectorTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture [[function_constant(57)]];
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_velRampTexture) ? SC_USE_CLAMP_TO_BORDER_velRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_colorRampTexture [[function_constant(58)]];
constant bool SC_USE_UV_MIN_MAX_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_colorRampTexture) ? SC_USE_UV_MIN_MAX_colorRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(59)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_mainTexture [[function_constant(60)]];
constant bool SC_USE_UV_MIN_MAX_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_mainTexture) ? SC_USE_UV_MIN_MAX_mainTexture : false;
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture [[function_constant(61)]];
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sizeRampTexture) ? SC_USE_UV_MIN_MAX_sizeRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_vectorTexture [[function_constant(62)]];
constant bool SC_USE_UV_MIN_MAX_vectorTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_vectorTexture) ? SC_USE_UV_MIN_MAX_vectorTexture : false;
constant bool SC_USE_UV_MIN_MAX_velRampTexture [[function_constant(63)]];
constant bool SC_USE_UV_MIN_MAX_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_velRampTexture) ? SC_USE_UV_MIN_MAX_velRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_colorRampTexture [[function_constant(64)]];
constant bool SC_USE_UV_TRANSFORM_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_colorRampTexture) ? SC_USE_UV_TRANSFORM_colorRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(65)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_mainTexture [[function_constant(66)]];
constant bool SC_USE_UV_TRANSFORM_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_mainTexture) ? SC_USE_UV_TRANSFORM_mainTexture : false;
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture [[function_constant(67)]];
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sizeRampTexture) ? SC_USE_UV_TRANSFORM_sizeRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_vectorTexture [[function_constant(68)]];
constant bool SC_USE_UV_TRANSFORM_vectorTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_vectorTexture) ? SC_USE_UV_TRANSFORM_vectorTexture : false;
constant bool SC_USE_UV_TRANSFORM_velRampTexture [[function_constant(69)]];
constant bool SC_USE_UV_TRANSFORM_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_velRampTexture) ? SC_USE_UV_TRANSFORM_velRampTexture : false;
constant bool SIZEMINMAX [[function_constant(70)]];
constant bool SIZEMINMAX_tmp = is_function_constant_defined(SIZEMINMAX) ? SIZEMINMAX : false;
constant bool SIZERAMP [[function_constant(71)]];
constant bool SIZERAMP_tmp = is_function_constant_defined(SIZERAMP) ? SIZERAMP : false;
constant bool SNOISE [[function_constant(72)]];
constant bool SNOISE_tmp = is_function_constant_defined(SNOISE) ? SNOISE : false;
constant bool SPHERESPAWN [[function_constant(73)]];
constant bool SPHERESPAWN_tmp = is_function_constant_defined(SPHERESPAWN) ? SPHERESPAWN : false;
constant bool UseViewSpaceDepthVariant [[function_constant(74)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool VECTORFIELD [[function_constant(75)]];
constant bool VECTORFIELD_tmp = is_function_constant_defined(VECTORFIELD) ? VECTORFIELD : false;
constant bool VELOCITYDIR [[function_constant(76)]];
constant bool VELOCITYDIR_tmp = is_function_constant_defined(VELOCITYDIR) ? VELOCITYDIR : false;
constant bool VELRAMP [[function_constant(77)]];
constant bool VELRAMP_tmp = is_function_constant_defined(VELRAMP) ? VELRAMP : false;
constant bool WORLDPOSSEED [[function_constant(78)]];
constant bool WORLDPOSSEED_tmp = is_function_constant_defined(WORLDPOSSEED) ? WORLDPOSSEED : false;
constant bool colorRampTextureHasSwappedViews [[function_constant(79)]];
constant bool colorRampTextureHasSwappedViews_tmp = is_function_constant_defined(colorRampTextureHasSwappedViews) ? colorRampTextureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(80)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool mainTextureHasSwappedViews [[function_constant(81)]];
constant bool mainTextureHasSwappedViews_tmp = is_function_constant_defined(mainTextureHasSwappedViews) ? mainTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(82)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(83)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(84)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(85)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(86)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(87)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(88)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(89)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(90)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(91)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(92)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(93)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(94)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(95)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(96)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_BlendMode_Software [[function_constant(97)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_DepthOnly [[function_constant(98)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(99)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(100)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_IsEditor [[function_constant(101)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_MotionVectorsPass [[function_constant(102)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(103)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(104)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(105)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(106)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(107)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(108)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(109)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(110)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(111)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(112)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(113)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(114)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sizeRampTextureHasSwappedViews [[function_constant(115)]];
constant bool sizeRampTextureHasSwappedViews_tmp = is_function_constant_defined(sizeRampTextureHasSwappedViews) ? sizeRampTextureHasSwappedViews : false;
constant bool vectorTextureHasSwappedViews [[function_constant(116)]];
constant bool vectorTextureHasSwappedViews_tmp = is_function_constant_defined(vectorTextureHasSwappedViews) ? vectorTextureHasSwappedViews : false;
constant bool velRampTextureHasSwappedViews [[function_constant(117)]];
constant bool velRampTextureHasSwappedViews_tmp = is_function_constant_defined(velRampTextureHasSwappedViews) ? velRampTextureHasSwappedViews : false;
constant int NODE_67_DROPLIST_ITEM [[function_constant(118)]];
constant int NODE_67_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_67_DROPLIST_ITEM) ? NODE_67_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(119)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture [[function_constant(120)]];
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(121)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture [[function_constant(122)]];
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_mainTexture) ? SC_SOFTWARE_WRAP_MODE_U_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture [[function_constant(123)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_vectorTexture [[function_constant(124)]];
constant int SC_SOFTWARE_WRAP_MODE_U_vectorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_vectorTexture) ? SC_SOFTWARE_WRAP_MODE_U_vectorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture [[function_constant(125)]];
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_velRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture [[function_constant(126)]];
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(127)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture [[function_constant(128)]];
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_mainTexture) ? SC_SOFTWARE_WRAP_MODE_V_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture [[function_constant(129)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_vectorTexture [[function_constant(130)]];
constant int SC_SOFTWARE_WRAP_MODE_V_vectorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_vectorTexture) ? SC_SOFTWARE_WRAP_MODE_V_vectorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture [[function_constant(131)]];
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_velRampTexture : -1;
constant int colorRampTextureLayout [[function_constant(132)]];
constant int colorRampTextureLayout_tmp = is_function_constant_defined(colorRampTextureLayout) ? colorRampTextureLayout : 0;
constant int intensityTextureLayout [[function_constant(133)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int mainTextureLayout [[function_constant(134)]];
constant int mainTextureLayout_tmp = is_function_constant_defined(mainTextureLayout) ? mainTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(135)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(136)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(137)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(138)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(139)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(140)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(141)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int sizeRampTextureLayout [[function_constant(142)]];
constant int sizeRampTextureLayout_tmp = is_function_constant_defined(sizeRampTextureLayout) ? sizeRampTextureLayout : 0;
constant int vectorTextureLayout [[function_constant(143)]];
constant int vectorTextureLayout_tmp = is_function_constant_defined(vectorTextureLayout) ? vectorTextureLayout : 0;
constant int velRampTextureLayout [[function_constant(144)]];
constant int velRampTextureLayout_tmp = is_function_constant_defined(velRampTextureLayout) ? velRampTextureLayout : 0;

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
float4 VertexColor;
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
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float spawnMaxParticles;
float2 sizeStart;
float2 sizeEnd;
float2 sizeStartMin;
float2 sizeStartMax;
float2 sizeEndMin;
float2 sizeEndMax;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandom;
float2 rotationRate;
float rotationDrag;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 vectorTextureSize;
float4 vectorTextureDims;
float4 vectorTextureView;
float3x3 vectorTextureTransform;
float4 vectorTextureUvMinMax;
float4 vectorTextureBorderColor;
float flowStrength;
float flowSpeed;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float alphaDissolveMult;
float Port_Input1_N069;
float Port_Input1_N068;
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
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> sizeRampTexture [[id(18)]];
texture2d<float> vectorTexture [[id(19)]];
texture2d<float> velRampTexture [[id(20)]];
sampler colorRampTextureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler mainTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler sizeRampTextureSmpSC [[id(31)]];
sampler vectorTextureSmpSC [[id(32)]];
sampler velRampTextureSmpSC [[id(33)]];
constant userUniformsObj* UserUniforms [[id(34)]];
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
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool N2_ALIGNTOX=false;
bool N2_ALIGNTOY=false;
bool N2_ALIGNTOZ=false;
float N2_normTime=0.0;
float N2_localTime=0.0;
float N2_seedVal=0.0;
float N2_dieController=0.0;
bool N2_MAXPARTICLECOUNT=false;
float N2_spawnMaxParticles=0.0;
float2 N2_sizeLife=float2(0.0);
float3 N2_spawnLoc=float3(0.0);
float3 N2_velocityXYZ=float3(0.0);
float N2_gravity=0.0;
bool N2_FORCE=false;
float3 N2_localForce=float3(0.0);
bool N2_ALIGNTOVEL=false;
float N2_sizeVelScale=0.0;
bool N2_IGNOREVEL=false;
float2 N2_rotationRandom=float2(0.0);
float2 N2_rotationRate=float2(0.0);
float N2_rotationDrag=0.0;
bool N2_WORLDSPACE=false;
bool N2_WORLDFORCE=false;
float3 N2_position=float3(0.0);
float N2_EPSILON=1e-06;
float N2_PI=3.1415927;
float N25_timeGlobal=0.0;
bool N25_EXTERNALTIME=false;
float N25_externalTime=0.0;
bool N25_WORLDPOSSEED=false;
float N25_externalSeed=0.0;
bool N25_LIFETIMEMINMAX=false;
float N25_lifeTimeConstant=0.0;
float2 N25_lifeTimeMinMax=float2(0.0);
bool N25_INSTANTSPAWN=false;
float N25_spawnDuration=0.0;
float N25_normTime=0.0;
float N25_localTime=0.0;
float N25_seedVal=0.0;
float N25_dieController=0.0;
float2 N25_realLifeTimeMinMax=float2(0.0);
float2 N23_sizeStart=float2(0.0);
float2 N23_sizeEnd=float2(0.0);
bool N23_SIZEMINMAX=false;
float2 N23_sizeStartMin=float2(0.0);
float2 N23_sizeStartMax=float2(0.0);
float2 N23_sizeEndMin=float2(0.0);
float2 N23_sizeEndMax=float2(0.0);
float N23_sizeSpeed=0.0;
bool N23_SIZERAMP=false;
float N23_seedVal=0.0;
float N23_normTime=0.0;
float2 N23_sizeParticle=float2(0.0);
bool N1_INILOCATION=false;
float3 N1_spawnLocation=float3(0.0);
bool N1_BOXSPAWN=false;
float3 N1_spawnBox=float3(0.0);
bool N1_SPHERESPAWN=false;
float3 N1_spawnSphere=float3(0.0);
float N1_seedVal=0.0;
float3 N1_spawnLoc=float3(0.0);
bool N31_VELRAMP=false;
float3 N31_velocityMin=float3(0.0);
float3 N31_velocityMax=float3(0.0);
float3 N31_velocityDrag=float3(0.0);
float3 N31_noiseXYZ=float3(0.0);
float N31_seedVal=0.0;
float N31_localTime=0.0;
float N31_normTime=0.0;
float3 N31_velocityXYZ=float3(0.0);
bool N32_NOISE=false;
float3 N32_noiseMult=float3(0.0);
float3 N32_noiseFrequency=float3(0.0);
bool N32_SNOISE=false;
float3 N32_sNoiseMult=float3(0.0);
float3 N32_sNoiseFrequency=float3(0.0);
float N32_seedVal=0.0;
float N32_localTime=0.0;
float N32_normTime=0.0;
float3 N32_noiseXYZ=float3(0.0);
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
Globals.VertexColor=out.varColor;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float Output_N3=0.0;
float param_1=(*sc_set0.UserUniforms).timeGlobal;
Output_N3=param_1;
float Output_N6=0.0;
float param_2;
if ((int(EXTERNALTIME_tmp)!=0))
{
param_2=1.001;
}
else
{
param_2=0.001;
}
param_2-=0.001;
Output_N6=param_2;
float Output_N5=0.0;
float param_3=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5=param_3;
float Output_N8=0.0;
float param_4;
if ((int(WORLDPOSSEED_tmp)!=0))
{
param_4=1.001;
}
else
{
param_4=0.001;
}
param_4-=0.001;
Output_N8=param_4;
float Output_N7=0.0;
float param_5=(*sc_set0.UserUniforms).externalSeed;
Output_N7=param_5;
float Output_N0=0.0;
float param_6;
if ((int(LIFETIMEMINMAX_tmp)!=0))
{
param_6=1.001;
}
else
{
param_6=0.001;
}
param_6-=0.001;
Output_N0=param_6;
float Output_N9=0.0;
float param_7=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9=param_7;
float2 Output_N10=float2(0.0);
float2 param_8=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10=param_8;
float Output_N11=0.0;
float param_9;
if ((int(INSTANTSPAWN_tmp)!=0))
{
param_9=1.001;
}
else
{
param_9=0.001;
}
param_9-=0.001;
Output_N11=param_9;
float Output_N12=0.0;
float param_10=(*sc_set0.UserUniforms).spawnDuration;
Output_N12=param_10;
float normTime_N25=0.0;
float localTime_N25=0.0;
float seedVal_N25=0.0;
float dieController_N25=0.0;
float param_11=Output_N3;
float param_12=Output_N6;
float param_13=Output_N5;
float param_14=Output_N8;
float param_15=Output_N7;
float param_16=Output_N0;
float param_17=Output_N9;
float2 param_18=Output_N10;
float param_19=Output_N11;
float param_20=Output_N12;
ssGlobals param_25=Globals;
ssGlobals tempGlobals=param_25;
float param_21=0.0;
float param_22=0.0;
float param_23=0.0;
float param_24=0.0;
N25_timeGlobal=param_11;
N25_EXTERNALTIME=param_12!=0.0;
N25_externalTime=param_13;
N25_WORLDPOSSEED=param_14!=0.0;
N25_externalSeed=param_15;
N25_LIFETIMEMINMAX=param_16!=0.0;
N25_lifeTimeConstant=param_17;
N25_lifeTimeMinMax=param_18;
N25_INSTANTSPAWN=param_19!=0.0;
N25_spawnDuration=param_20;
float l9_119=0.0;
if (N25_WORLDPOSSEED)
{
float4x4 l9_120=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_119=length(float4(1.0)*l9_120);
}
N25_realLifeTimeMinMax=float2(N25_lifeTimeConstant);
if (N25_LIFETIMEMINMAX)
{
N25_realLifeTimeMinMax=N25_lifeTimeMinMax;
}
float l9_121=fast::max(N25_realLifeTimeMinMax.x,0.0099999998);
float l9_122=fast::max(N25_realLifeTimeMinMax.y,0.0099999998);
N25_seedVal=N25_externalSeed+l9_119;
float4 l9_123=tempGlobals.VertexColor;
float4 l9_124=tempGlobals.VertexColor;
float4 l9_125=tempGlobals.VertexColor;
float l9_126=l9_123.x+(l9_124.y*l9_125.z);
float l9_127=fract((l9_126*12.12358)+N25_seedVal);
float l9_128=fract((l9_126*3.5358)+N25_seedVal);
float l9_129=tempGlobals.gTimeElapsed;
float l9_130=l9_129;
if (N25_EXTERNALTIME)
{
l9_130=N25_externalTime;
}
if (!N25_INSTANTSPAWN)
{
float l9_131=fract(((l9_130*N25_timeGlobal)*(1.0/N25_realLifeTimeMinMax.y))+l9_127);
N25_localTime=l9_131*N25_realLifeTimeMinMax.y;
}
else
{
N25_localTime=N25_timeGlobal*l9_130;
}
float l9_132=mix(N25_localTime/l9_121,N25_localTime/l9_122,l9_128);
N25_normTime=fast::clamp(l9_132,0.0,1.0);
float l9_133=0.0;
if (!N25_INSTANTSPAWN)
{
if (N25_spawnDuration!=0.0)
{
if ((l9_130-N25_spawnDuration)>=N25_localTime)
{
l9_133=1.0;
}
}
}
N25_dieController=l9_132+l9_133;
param_21=N25_normTime;
param_22=N25_localTime;
param_23=N25_seedVal;
param_24=N25_dieController;
normTime_N25=param_21;
localTime_N25=param_22;
seedVal_N25=param_23;
dieController_N25=param_24;
float Output_N13=0.0;
float param_26;
if ((int(MAXPARTICLECOUNT_tmp)!=0))
{
param_26=1.001;
}
else
{
param_26=0.001;
}
param_26-=0.001;
Output_N13=param_26;
float Output_N14=0.0;
float param_27=(*sc_set0.UserUniforms).spawnMaxParticles;
Output_N14=param_27;
float2 Output_N24=float2(0.0);
float2 param_28=(*sc_set0.UserUniforms).sizeStart;
Output_N24=param_28;
float2 Output_N26=float2(0.0);
float2 param_29=(*sc_set0.UserUniforms).sizeEnd;
Output_N26=param_29;
float Output_N99=0.0;
float param_30;
if ((int(SIZEMINMAX_tmp)!=0))
{
param_30=1.001;
}
else
{
param_30=0.001;
}
param_30-=0.001;
Output_N99=param_30;
float2 Output_N98=float2(0.0);
float2 param_31=(*sc_set0.UserUniforms).sizeStartMin;
Output_N98=param_31;
float2 Output_N101=float2(0.0);
float2 param_32=(*sc_set0.UserUniforms).sizeStartMax;
Output_N101=param_32;
float2 Output_N100=float2(0.0);
float2 param_33=(*sc_set0.UserUniforms).sizeEndMin;
Output_N100=param_33;
float2 Output_N103=float2(0.0);
float2 param_34=(*sc_set0.UserUniforms).sizeEndMax;
Output_N103=param_34;
float Output_N27=0.0;
float param_35=(*sc_set0.UserUniforms).sizeSpeed;
Output_N27=param_35;
float Output_N102=0.0;
float param_36;
if ((int(SIZERAMP_tmp)!=0))
{
param_36=1.001;
}
else
{
param_36=0.001;
}
param_36-=0.001;
Output_N102=param_36;
float2 sizeParticle_N23=float2(0.0);
float2 param_37=Output_N24;
float2 param_38=Output_N26;
float param_39=Output_N99;
float2 param_40=Output_N98;
float2 param_41=Output_N101;
float2 param_42=Output_N100;
float2 param_43=Output_N103;
float param_44=Output_N27;
float param_45=Output_N102;
float param_46=seedVal_N25;
float param_47=normTime_N25;
ssGlobals param_49=Globals;
tempGlobals=param_49;
float2 param_48=float2(0.0);
N23_sizeStart=param_37;
N23_sizeEnd=param_38;
N23_SIZEMINMAX=param_39!=0.0;
N23_sizeStartMin=param_40;
N23_sizeStartMax=param_41;
N23_sizeEndMin=param_42;
N23_sizeEndMax=param_43;
N23_sizeSpeed=param_44;
N23_SIZERAMP=param_45!=0.0;
N23_seedVal=param_46;
N23_normTime=param_47;
float4 l9_134=tempGlobals.VertexColor;
float4 l9_135=tempGlobals.VertexColor;
float4 l9_136=tempGlobals.VertexColor;
float l9_137=l9_134.x+(l9_135.y*l9_136.z);
float l9_138=fract((l9_137*334.59122)+N23_seedVal)-0.5;
float l9_139=fract((l9_137*41.231232)+N23_seedVal)-0.5;
float l9_140=l9_138;
float l9_141=l9_139;
float l9_142=N23_normTime;
float l9_143=N23_sizeSpeed;
float2 l9_144=N23_sizeStart;
float2 l9_145=N23_sizeEnd;
float l9_146=l9_142;
float l9_147=l9_143;
float l9_148;
if (l9_146<=0.0)
{
l9_148=0.0;
}
else
{
l9_148=pow(l9_146,l9_147);
}
float l9_149=l9_148;
float l9_150=l9_149;
if (N23_SIZEMINMAX)
{
l9_144=mix(N23_sizeStartMin,N23_sizeStartMax,float2(l9_140));
l9_145=mix(N23_sizeEndMin,N23_sizeEndMax,float2(l9_141));
}
float2 l9_151=mix(l9_144,l9_145,float2(l9_150));
if (N23_SIZERAMP)
{
float l9_152=ceil(l9_142*10000.0)/10000.0;
float2 l9_153=tempGlobals.Surface_UVCoord0;
float2 l9_154=(l9_153/float2(10000.0,1.0))+float2(l9_152,0.0);
float2 l9_155=l9_154;
float4 l9_156=float4(0.0);
int l9_157=0;
if ((int(sizeRampTextureHasSwappedViews_tmp)!=0))
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=gl_InstanceIndex%2;
}
int l9_159=l9_158;
l9_157=1-l9_159;
}
else
{
int l9_160=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_160=0;
}
else
{
l9_160=gl_InstanceIndex%2;
}
int l9_161=l9_160;
l9_157=l9_161;
}
int l9_162=l9_157;
int l9_163=sizeRampTextureLayout_tmp;
int l9_164=l9_162;
float2 l9_165=l9_155;
bool l9_166=(int(SC_USE_UV_TRANSFORM_sizeRampTexture_tmp)!=0);
float3x3 l9_167=(*sc_set0.UserUniforms).sizeRampTextureTransform;
int2 l9_168=int2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp);
bool l9_169=(int(SC_USE_UV_MIN_MAX_sizeRampTexture_tmp)!=0);
float4 l9_170=(*sc_set0.UserUniforms).sizeRampTextureUvMinMax;
bool l9_171=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp)!=0);
float4 l9_172=(*sc_set0.UserUniforms).sizeRampTextureBorderColor;
float l9_173=0.0;
bool l9_174=l9_171&&(!l9_169);
float l9_175=1.0;
float l9_176=l9_165.x;
int l9_177=l9_168.x;
if (l9_177==1)
{
l9_176=fract(l9_176);
}
else
{
if (l9_177==2)
{
float l9_178=fract(l9_176);
float l9_179=l9_176-l9_178;
float l9_180=step(0.25,fract(l9_179*0.5));
l9_176=mix(l9_178,1.0-l9_178,fast::clamp(l9_180,0.0,1.0));
}
}
l9_165.x=l9_176;
float l9_181=l9_165.y;
int l9_182=l9_168.y;
if (l9_182==1)
{
l9_181=fract(l9_181);
}
else
{
if (l9_182==2)
{
float l9_183=fract(l9_181);
float l9_184=l9_181-l9_183;
float l9_185=step(0.25,fract(l9_184*0.5));
l9_181=mix(l9_183,1.0-l9_183,fast::clamp(l9_185,0.0,1.0));
}
}
l9_165.y=l9_181;
if (l9_169)
{
bool l9_186=l9_171;
bool l9_187;
if (l9_186)
{
l9_187=l9_168.x==3;
}
else
{
l9_187=l9_186;
}
float l9_188=l9_165.x;
float l9_189=l9_170.x;
float l9_190=l9_170.z;
bool l9_191=l9_187;
float l9_192=l9_175;
float l9_193=fast::clamp(l9_188,l9_189,l9_190);
float l9_194=step(abs(l9_188-l9_193),9.9999997e-06);
l9_192*=(l9_194+((1.0-float(l9_191))*(1.0-l9_194)));
l9_188=l9_193;
l9_165.x=l9_188;
l9_175=l9_192;
bool l9_195=l9_171;
bool l9_196;
if (l9_195)
{
l9_196=l9_168.y==3;
}
else
{
l9_196=l9_195;
}
float l9_197=l9_165.y;
float l9_198=l9_170.y;
float l9_199=l9_170.w;
bool l9_200=l9_196;
float l9_201=l9_175;
float l9_202=fast::clamp(l9_197,l9_198,l9_199);
float l9_203=step(abs(l9_197-l9_202),9.9999997e-06);
l9_201*=(l9_203+((1.0-float(l9_200))*(1.0-l9_203)));
l9_197=l9_202;
l9_165.y=l9_197;
l9_175=l9_201;
}
float2 l9_204=l9_165;
bool l9_205=l9_166;
float3x3 l9_206=l9_167;
if (l9_205)
{
l9_204=float2((l9_206*float3(l9_204,1.0)).xy);
}
float2 l9_207=l9_204;
float2 l9_208=l9_207;
float2 l9_209=l9_208;
l9_165=l9_209;
float l9_210=l9_165.x;
int l9_211=l9_168.x;
bool l9_212=l9_174;
float l9_213=l9_175;
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
l9_165.x=l9_210;
l9_175=l9_213;
float l9_221=l9_165.y;
int l9_222=l9_168.y;
bool l9_223=l9_174;
float l9_224=l9_175;
if ((l9_222==0)||(l9_222==3))
{
float l9_225=l9_221;
float l9_226=0.0;
float l9_227=1.0;
bool l9_228=l9_223;
float l9_229=l9_224;
float l9_230=fast::clamp(l9_225,l9_226,l9_227);
float l9_231=step(abs(l9_225-l9_230),9.9999997e-06);
l9_229*=(l9_231+((1.0-float(l9_228))*(1.0-l9_231)));
l9_225=l9_230;
l9_221=l9_225;
l9_224=l9_229;
}
l9_165.y=l9_221;
l9_175=l9_224;
float2 l9_232=l9_165;
int l9_233=l9_163;
int l9_234=l9_164;
float l9_235=l9_173;
float2 l9_236=l9_232;
int l9_237=l9_233;
int l9_238=l9_234;
float3 l9_239=float3(0.0);
if (l9_237==0)
{
l9_239=float3(l9_236,0.0);
}
else
{
if (l9_237==1)
{
l9_239=float3(l9_236.x,(l9_236.y*0.5)+(0.5-(float(l9_238)*0.5)),0.0);
}
else
{
l9_239=float3(l9_236,float(l9_238));
}
}
float3 l9_240=l9_239;
float3 l9_241=l9_240;
float2 l9_242=l9_241.xy;
float l9_243=l9_235;
float4 l9_244=sc_set0.sizeRampTexture.sample(sc_set0.sizeRampTextureSmpSC,l9_242,level(l9_243));
float4 l9_245=l9_244;
float4 l9_246=l9_245;
if (l9_171)
{
l9_246=mix(l9_172,l9_246,float4(l9_175));
}
float4 l9_247=l9_246;
l9_156=l9_247;
float4 l9_248=l9_156;
float2 l9_249=l9_248.xy;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_249=float2(1.0);
}
l9_151=l9_249*l9_144;
}
float2 l9_250=l9_151;
N23_sizeParticle=l9_250;
param_48=N23_sizeParticle;
sizeParticle_N23=param_48;
float Output_N15=0.0;
float param_50;
if ((int(INILOCATION_tmp)!=0))
{
param_50=1.001;
}
else
{
param_50=0.001;
}
param_50-=0.001;
Output_N15=param_50;
float3 Output_N16=float3(0.0);
float3 param_51=(*sc_set0.UserUniforms).spawnLocation;
Output_N16=param_51;
float Output_N17=0.0;
float param_52;
if ((int(BOXSPAWN_tmp)!=0))
{
param_52=1.001;
}
else
{
param_52=0.001;
}
param_52-=0.001;
Output_N17=param_52;
float3 Output_N18=float3(0.0);
float3 param_53=(*sc_set0.UserUniforms).spawnBox;
Output_N18=param_53;
float Output_N19=0.0;
float param_54;
if ((int(SPHERESPAWN_tmp)!=0))
{
param_54=1.001;
}
else
{
param_54=0.001;
}
param_54-=0.001;
Output_N19=param_54;
float3 Output_N20=float3(0.0);
float3 param_55=(*sc_set0.UserUniforms).spawnSphere;
Output_N20=param_55;
float3 spawnLoc_N1=float3(0.0);
float param_56=Output_N15;
float3 param_57=Output_N16;
float param_58=Output_N17;
float3 param_59=Output_N18;
float param_60=Output_N19;
float3 param_61=Output_N20;
float param_62=seedVal_N25;
ssGlobals param_64=Globals;
tempGlobals=param_64;
float3 param_63=float3(0.0);
N1_INILOCATION=param_56!=0.0;
N1_spawnLocation=param_57;
N1_BOXSPAWN=param_58!=0.0;
N1_spawnBox=param_59;
N1_SPHERESPAWN=param_60!=0.0;
N1_spawnSphere=param_61;
N1_seedVal=param_62;
float3 l9_251=float3(0.0);
float4 l9_252=tempGlobals.VertexColor;
float4 l9_253=l9_252;
float l9_254=l9_253.x+(l9_253.y*l9_253.z);
float l9_255=fract((l9_254*82.124229)+N1_seedVal);
float l9_256=fract((l9_254*9115.2148)+N1_seedVal);
float l9_257=fract((l9_254*654.15588)+N1_seedVal);
float3 l9_258=fract((float3(l9_255,l9_256,l9_257)*313.13324)+float3(N1_seedVal))-float3(0.5);
float3 l9_259=float3(l9_253.x,l9_253.y,l9_253.z)-float3(0.5);
float3 l9_260=l9_251;
float3 l9_261=l9_251;
float3 l9_262=l9_251;
if (N1_INILOCATION)
{
l9_262=N1_spawnLocation;
}
if (N1_BOXSPAWN)
{
l9_260=N1_spawnBox*l9_258;
}
if (N1_SPHERESPAWN)
{
l9_261=N1_spawnSphere*l9_259;
}
N1_spawnLoc=(l9_262+l9_261)+l9_260;
param_63=N1_spawnLoc;
spawnLoc_N1=param_63;
float Output_N38=0.0;
float param_65;
if ((int(VELRAMP_tmp)!=0))
{
param_65=1.001;
}
else
{
param_65=0.001;
}
param_65-=0.001;
Output_N38=param_65;
float3 Output_N34=float3(0.0);
float3 param_66=(*sc_set0.UserUniforms).velocityMin;
Output_N34=param_66;
float3 Output_N35=float3(0.0);
float3 param_67=(*sc_set0.UserUniforms).velocityMax;
Output_N35=param_67;
float3 Output_N36=float3(0.0);
float3 param_68=(*sc_set0.UserUniforms).velocityDrag;
Output_N36=param_68;
float Output_N43=0.0;
float param_69;
if ((int(NOISE_tmp)!=0))
{
param_69=1.001;
}
else
{
param_69=0.001;
}
param_69-=0.001;
Output_N43=param_69;
float3 Output_N39=float3(0.0);
float3 param_70=(*sc_set0.UserUniforms).noiseMult;
Output_N39=param_70;
float3 Output_N40=float3(0.0);
float3 param_71=(*sc_set0.UserUniforms).noiseFrequency;
Output_N40=param_71;
float Output_N44=0.0;
float param_72;
if ((int(SNOISE_tmp)!=0))
{
param_72=1.001;
}
else
{
param_72=0.001;
}
param_72-=0.001;
Output_N44=param_72;
float3 Output_N41=float3(0.0);
float3 param_73=(*sc_set0.UserUniforms).sNoiseMult;
Output_N41=param_73;
float3 Output_N42=float3(0.0);
float3 param_74=(*sc_set0.UserUniforms).sNoiseFrequency;
Output_N42=param_74;
float3 noiseXYZ_N32=float3(0.0);
float param_75=Output_N43;
float3 param_76=Output_N39;
float3 param_77=Output_N40;
float param_78=Output_N44;
float3 param_79=Output_N41;
float3 param_80=Output_N42;
float param_81=seedVal_N25;
float param_82=localTime_N25;
float param_83=normTime_N25;
ssGlobals param_85=Globals;
tempGlobals=param_85;
float3 param_84=float3(0.0);
N32_NOISE=param_75!=0.0;
N32_noiseMult=param_76;
N32_noiseFrequency=param_77;
N32_SNOISE=param_78!=0.0;
N32_sNoiseMult=param_79;
N32_sNoiseFrequency=param_80;
N32_seedVal=param_81;
N32_localTime=param_82;
N32_normTime=param_83;
float3 l9_263=float3(0.0);
float4 l9_264=tempGlobals.VertexColor;
float4 l9_265=tempGlobals.VertexColor;
float4 l9_266=tempGlobals.VertexColor;
float l9_267=l9_264.x+(l9_265.y*l9_266.z);
float l9_268=fract((l9_267*18.984529)+N32_seedVal);
float l9_269=fract((l9_267*654.15588)+N32_seedVal);
float l9_270=fract((l9_267*45.722408)+N32_seedVal);
float3 l9_271=(float3(l9_269,l9_270,l9_268)-float3(0.5))*2.0;
N32_noiseXYZ=l9_263;
if (N32_NOISE)
{
float3 l9_272=N32_noiseFrequency;
float3 l9_273=N32_noiseMult;
float3 l9_274=l9_271;
float l9_275=N32_normTime;
float l9_276=sin(l9_275*l9_272.x);
float l9_277=sin(l9_275*l9_272.y);
float l9_278=sin(l9_275*l9_272.z);
float3 l9_279=(float3(l9_276,l9_277,l9_278)*l9_273)*l9_274;
float3 l9_280=l9_279;
N32_noiseXYZ+=l9_280;
}
if (N32_SNOISE)
{
float l9_281=l9_268;
float l9_282=l9_269;
float l9_283=l9_270;
float3 l9_284=N32_sNoiseFrequency;
float3 l9_285=N32_sNoiseMult;
float3 l9_286=l9_271;
float l9_287=N32_localTime;
float2 l9_288=float2(l9_281*l9_287,l9_284.x);
float2 l9_289=floor(l9_288+float2(dot(l9_288,float2(0.36602542))));
float2 l9_290=(l9_288-l9_289)+float2(dot(l9_289,float2(0.21132487)));
float2 l9_291=float2(0.0);
bool2 l9_292=bool2(l9_290.x>l9_290.y);
l9_291=float2(l9_292.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_292.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_293=l9_290.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_294=l9_293.xy-l9_291;
l9_293=float4(l9_294.x,l9_294.y,l9_293.z,l9_293.w);
l9_289=mod(l9_289,float2(289.0));
float3 l9_295=float3(l9_289.y)+float3(0.0,l9_291.y,1.0);
float3 l9_296=mod(((l9_295*34.0)+float3(1.0))*l9_295,float3(289.0));
float3 l9_297=(l9_296+float3(l9_289.x))+float3(0.0,l9_291.x,1.0);
float3 l9_298=mod(((l9_297*34.0)+float3(1.0))*l9_297,float3(289.0));
float3 l9_299=l9_298;
float3 l9_300=fast::max(float3(0.5)-float3(dot(l9_290,l9_290),dot(l9_293.xy,l9_293.xy),dot(l9_293.zw,l9_293.zw)),float3(0.0));
l9_300*=l9_300;
l9_300*=l9_300;
float3 l9_301=(fract(l9_299*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_302=abs(l9_301)-float3(0.5);
float3 l9_303=floor(l9_301+float3(0.5));
float3 l9_304=l9_301-l9_303;
l9_300*=(float3(1.7928429)-(((l9_304*l9_304)+(l9_302*l9_302))*0.85373473));
float3 l9_305=float3(0.0);
l9_305.x=(l9_304.x*l9_290.x)+(l9_302.x*l9_290.y);
float2 l9_306=(l9_304.yz*l9_293.xz)+(l9_302.yz*l9_293.yw);
l9_305=float3(l9_305.x,l9_306.x,l9_306.y);
float l9_307=130.0*dot(l9_300,l9_305);
float l9_308=l9_307;
float2 l9_309=float2(l9_282*l9_287,l9_284.y);
float2 l9_310=floor(l9_309+float2(dot(l9_309,float2(0.36602542))));
float2 l9_311=(l9_309-l9_310)+float2(dot(l9_310,float2(0.21132487)));
float2 l9_312=float2(0.0);
bool2 l9_313=bool2(l9_311.x>l9_311.y);
l9_312=float2(l9_313.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_313.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_314=l9_311.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_315=l9_314.xy-l9_312;
l9_314=float4(l9_315.x,l9_315.y,l9_314.z,l9_314.w);
l9_310=mod(l9_310,float2(289.0));
float3 l9_316=float3(l9_310.y)+float3(0.0,l9_312.y,1.0);
float3 l9_317=mod(((l9_316*34.0)+float3(1.0))*l9_316,float3(289.0));
float3 l9_318=(l9_317+float3(l9_310.x))+float3(0.0,l9_312.x,1.0);
float3 l9_319=mod(((l9_318*34.0)+float3(1.0))*l9_318,float3(289.0));
float3 l9_320=l9_319;
float3 l9_321=fast::max(float3(0.5)-float3(dot(l9_311,l9_311),dot(l9_314.xy,l9_314.xy),dot(l9_314.zw,l9_314.zw)),float3(0.0));
l9_321*=l9_321;
l9_321*=l9_321;
float3 l9_322=(fract(l9_320*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_323=abs(l9_322)-float3(0.5);
float3 l9_324=floor(l9_322+float3(0.5));
float3 l9_325=l9_322-l9_324;
l9_321*=(float3(1.7928429)-(((l9_325*l9_325)+(l9_323*l9_323))*0.85373473));
float3 l9_326=float3(0.0);
l9_326.x=(l9_325.x*l9_311.x)+(l9_323.x*l9_311.y);
float2 l9_327=(l9_325.yz*l9_314.xz)+(l9_323.yz*l9_314.yw);
l9_326=float3(l9_326.x,l9_327.x,l9_327.y);
float l9_328=130.0*dot(l9_321,l9_326);
float l9_329=l9_328;
float2 l9_330=float2(l9_283*l9_287,l9_284.z);
float2 l9_331=floor(l9_330+float2(dot(l9_330,float2(0.36602542))));
float2 l9_332=(l9_330-l9_331)+float2(dot(l9_331,float2(0.21132487)));
float2 l9_333=float2(0.0);
bool2 l9_334=bool2(l9_332.x>l9_332.y);
l9_333=float2(l9_334.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_334.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_335=l9_332.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_336=l9_335.xy-l9_333;
l9_335=float4(l9_336.x,l9_336.y,l9_335.z,l9_335.w);
l9_331=mod(l9_331,float2(289.0));
float3 l9_337=float3(l9_331.y)+float3(0.0,l9_333.y,1.0);
float3 l9_338=mod(((l9_337*34.0)+float3(1.0))*l9_337,float3(289.0));
float3 l9_339=(l9_338+float3(l9_331.x))+float3(0.0,l9_333.x,1.0);
float3 l9_340=mod(((l9_339*34.0)+float3(1.0))*l9_339,float3(289.0));
float3 l9_341=l9_340;
float3 l9_342=fast::max(float3(0.5)-float3(dot(l9_332,l9_332),dot(l9_335.xy,l9_335.xy),dot(l9_335.zw,l9_335.zw)),float3(0.0));
l9_342*=l9_342;
l9_342*=l9_342;
float3 l9_343=(fract(l9_341*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_344=abs(l9_343)-float3(0.5);
float3 l9_345=floor(l9_343+float3(0.5));
float3 l9_346=l9_343-l9_345;
l9_342*=(float3(1.7928429)-(((l9_346*l9_346)+(l9_344*l9_344))*0.85373473));
float3 l9_347=float3(0.0);
l9_347.x=(l9_346.x*l9_332.x)+(l9_344.x*l9_332.y);
float2 l9_348=(l9_346.yz*l9_335.xz)+(l9_344.yz*l9_335.yw);
l9_347=float3(l9_347.x,l9_348.x,l9_348.y);
float l9_349=130.0*dot(l9_342,l9_347);
float l9_350=l9_349;
float3 l9_351=(float3(l9_308,l9_329,l9_350)*l9_285)*l9_286;
N32_noiseXYZ+=l9_351;
}
param_84=N32_noiseXYZ;
noiseXYZ_N32=param_84;
float3 velocityXYZ_N31=float3(0.0);
float param_86=Output_N38;
float3 param_87=Output_N34;
float3 param_88=Output_N35;
float3 param_89=Output_N36;
float3 param_90=noiseXYZ_N32;
float param_91=seedVal_N25;
float param_92=localTime_N25;
float param_93=normTime_N25;
ssGlobals param_95=Globals;
tempGlobals=param_95;
float3 param_94=float3(0.0);
N31_VELRAMP=param_86!=0.0;
N31_velocityMin=param_87;
N31_velocityMax=param_88;
N31_velocityDrag=param_89;
N31_noiseXYZ=param_90;
N31_seedVal=param_91;
N31_localTime=param_92;
N31_normTime=param_93;
float3 l9_352=float3(0.0);
float4 l9_353=tempGlobals.VertexColor;
float4 l9_354=l9_353;
float l9_355=l9_354.x+(l9_354.y*l9_354.z);
N31_velocityXYZ=l9_352;
float l9_356=fract((l9_355*18.984529)+N31_seedVal);
float l9_357=fract((l9_355*654.15588)+N31_seedVal);
float l9_358=fract((l9_355*45.722408)+N31_seedVal);
float3 l9_359=(float3(l9_357,l9_358,l9_356)-float3(0.5))*2.0;
float3 l9_360=float3(l9_357,l9_358,l9_356);
float3 l9_361=N31_velocityMin+(((l9_359+float3(1.0))/float3(2.0))*(N31_velocityMax-N31_velocityMin));
if (N31_VELRAMP)
{
l9_361=mix(N31_velocityMin,N31_velocityMax,l9_360);
}
float3 l9_362=l9_361;
float l9_363=N31_localTime;
float3 l9_364=N31_velocityDrag;
float3 l9_365=N31_noiseXYZ;
float l9_366=N31_normTime;
float3 l9_367=float3(l9_363,l9_363,l9_363);
float3 l9_368=l9_364;
float l9_369;
if (l9_367.x<=0.0)
{
l9_369=0.0;
}
else
{
l9_369=pow(l9_367.x,l9_368.x);
}
float l9_370=l9_369;
float l9_371;
if (l9_367.y<=0.0)
{
l9_371=0.0;
}
else
{
l9_371=pow(l9_367.y,l9_368.y);
}
float l9_372=l9_371;
float l9_373;
if (l9_367.z<=0.0)
{
l9_373=0.0;
}
else
{
l9_373=pow(l9_367.z,l9_368.z);
}
float3 l9_374=float3(l9_370,l9_372,l9_373);
float3 l9_375=l9_374;
float3 l9_376=(l9_362+l9_365)*l9_375;
if (N31_VELRAMP)
{
float l9_377=floor(l9_366*10000.0)/10000.0;
float2 l9_378=tempGlobals.Surface_UVCoord0;
float2 l9_379=(l9_378/float2(10000.0,1.0))+float2(l9_377,0.0);
float2 l9_380=l9_379;
float4 l9_381=float4(0.0);
int l9_382=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_383=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_383=0;
}
else
{
l9_383=gl_InstanceIndex%2;
}
int l9_384=l9_383;
l9_382=1-l9_384;
}
else
{
int l9_385=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_385=0;
}
else
{
l9_385=gl_InstanceIndex%2;
}
int l9_386=l9_385;
l9_382=l9_386;
}
int l9_387=l9_382;
int l9_388=velRampTextureLayout_tmp;
int l9_389=l9_387;
float2 l9_390=l9_380;
bool l9_391=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_392=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_393=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_394=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_395=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_396=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_397=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_398=0.0;
bool l9_399=l9_396&&(!l9_394);
float l9_400=1.0;
float l9_401=l9_390.x;
int l9_402=l9_393.x;
if (l9_402==1)
{
l9_401=fract(l9_401);
}
else
{
if (l9_402==2)
{
float l9_403=fract(l9_401);
float l9_404=l9_401-l9_403;
float l9_405=step(0.25,fract(l9_404*0.5));
l9_401=mix(l9_403,1.0-l9_403,fast::clamp(l9_405,0.0,1.0));
}
}
l9_390.x=l9_401;
float l9_406=l9_390.y;
int l9_407=l9_393.y;
if (l9_407==1)
{
l9_406=fract(l9_406);
}
else
{
if (l9_407==2)
{
float l9_408=fract(l9_406);
float l9_409=l9_406-l9_408;
float l9_410=step(0.25,fract(l9_409*0.5));
l9_406=mix(l9_408,1.0-l9_408,fast::clamp(l9_410,0.0,1.0));
}
}
l9_390.y=l9_406;
if (l9_394)
{
bool l9_411=l9_396;
bool l9_412;
if (l9_411)
{
l9_412=l9_393.x==3;
}
else
{
l9_412=l9_411;
}
float l9_413=l9_390.x;
float l9_414=l9_395.x;
float l9_415=l9_395.z;
bool l9_416=l9_412;
float l9_417=l9_400;
float l9_418=fast::clamp(l9_413,l9_414,l9_415);
float l9_419=step(abs(l9_413-l9_418),9.9999997e-06);
l9_417*=(l9_419+((1.0-float(l9_416))*(1.0-l9_419)));
l9_413=l9_418;
l9_390.x=l9_413;
l9_400=l9_417;
bool l9_420=l9_396;
bool l9_421;
if (l9_420)
{
l9_421=l9_393.y==3;
}
else
{
l9_421=l9_420;
}
float l9_422=l9_390.y;
float l9_423=l9_395.y;
float l9_424=l9_395.w;
bool l9_425=l9_421;
float l9_426=l9_400;
float l9_427=fast::clamp(l9_422,l9_423,l9_424);
float l9_428=step(abs(l9_422-l9_427),9.9999997e-06);
l9_426*=(l9_428+((1.0-float(l9_425))*(1.0-l9_428)));
l9_422=l9_427;
l9_390.y=l9_422;
l9_400=l9_426;
}
float2 l9_429=l9_390;
bool l9_430=l9_391;
float3x3 l9_431=l9_392;
if (l9_430)
{
l9_429=float2((l9_431*float3(l9_429,1.0)).xy);
}
float2 l9_432=l9_429;
float2 l9_433=l9_432;
float2 l9_434=l9_433;
l9_390=l9_434;
float l9_435=l9_390.x;
int l9_436=l9_393.x;
bool l9_437=l9_399;
float l9_438=l9_400;
if ((l9_436==0)||(l9_436==3))
{
float l9_439=l9_435;
float l9_440=0.0;
float l9_441=1.0;
bool l9_442=l9_437;
float l9_443=l9_438;
float l9_444=fast::clamp(l9_439,l9_440,l9_441);
float l9_445=step(abs(l9_439-l9_444),9.9999997e-06);
l9_443*=(l9_445+((1.0-float(l9_442))*(1.0-l9_445)));
l9_439=l9_444;
l9_435=l9_439;
l9_438=l9_443;
}
l9_390.x=l9_435;
l9_400=l9_438;
float l9_446=l9_390.y;
int l9_447=l9_393.y;
bool l9_448=l9_399;
float l9_449=l9_400;
if ((l9_447==0)||(l9_447==3))
{
float l9_450=l9_446;
float l9_451=0.0;
float l9_452=1.0;
bool l9_453=l9_448;
float l9_454=l9_449;
float l9_455=fast::clamp(l9_450,l9_451,l9_452);
float l9_456=step(abs(l9_450-l9_455),9.9999997e-06);
l9_454*=(l9_456+((1.0-float(l9_453))*(1.0-l9_456)));
l9_450=l9_455;
l9_446=l9_450;
l9_449=l9_454;
}
l9_390.y=l9_446;
l9_400=l9_449;
float2 l9_457=l9_390;
int l9_458=l9_388;
int l9_459=l9_389;
float l9_460=l9_398;
float2 l9_461=l9_457;
int l9_462=l9_458;
int l9_463=l9_459;
float3 l9_464=float3(0.0);
if (l9_462==0)
{
l9_464=float3(l9_461,0.0);
}
else
{
if (l9_462==1)
{
l9_464=float3(l9_461.x,(l9_461.y*0.5)+(0.5-(float(l9_463)*0.5)),0.0);
}
else
{
l9_464=float3(l9_461,float(l9_463));
}
}
float3 l9_465=l9_464;
float3 l9_466=l9_465;
float2 l9_467=l9_466.xy;
float l9_468=l9_460;
float4 l9_469=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_467,level(l9_468));
float4 l9_470=l9_469;
float4 l9_471=l9_470;
if (l9_396)
{
l9_471=mix(l9_397,l9_471,float4(l9_400));
}
float4 l9_472=l9_471;
l9_381=l9_472;
float4 l9_473=l9_381;
float3 l9_474=l9_473.xyz;
l9_376=(l9_362+l9_365)*l9_474;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_376=l9_362*l9_375;
}
}
float3 l9_475=l9_376;
N31_velocityXYZ=l9_475;
param_94=N31_velocityXYZ;
velocityXYZ_N31=param_94;
float Output_N55=0.0;
float param_96=(*sc_set0.UserUniforms).gravity;
Output_N55=param_96;
float Output_N108=0.0;
float param_97;
if ((int(FORCE_tmp)!=0))
{
param_97=1.001;
}
else
{
param_97=0.001;
}
param_97-=0.001;
Output_N108=param_97;
float3 Output_N46=float3(0.0);
float3 param_98=(*sc_set0.UserUniforms).localForce;
Output_N46=param_98;
float Output_N51=0.0;
float param_99=(*sc_set0.UserUniforms).sizeVelScale;
Output_N51=param_99;
float Output_N109=0.0;
float param_100;
if ((int(IGNOREVEL_tmp)!=0))
{
param_100=1.001;
}
else
{
param_100=0.001;
}
param_100-=0.001;
Output_N109=param_100;
float Output_N48=0.0;
float param_101=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
Output_N48=param_101;
float Output_N49=0.0;
float param_102=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
Output_N49=param_102;
float Output_N50=0.0;
float param_103=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
Output_N50=param_103;
float2 Output_N52=float2(0.0);
float2 param_104=(*sc_set0.UserUniforms).rotationRandom;
Output_N52=param_104;
float2 Output_N53=float2(0.0);
float2 param_105=(*sc_set0.UserUniforms).rotationRate;
Output_N53=param_105;
float Output_N54=0.0;
float param_106=(*sc_set0.UserUniforms).rotationDrag;
Output_N54=param_106;
float3 position_N2=float3(0.0);
float param_107=normTime_N25;
float param_108=localTime_N25;
float param_109=seedVal_N25;
float param_110=dieController_N25;
float param_111=Output_N13;
float param_112=Output_N14;
float2 param_113=sizeParticle_N23;
float3 param_114=spawnLoc_N1;
float3 param_115=velocityXYZ_N31;
float param_116=Output_N55;
float param_117=Output_N108;
float3 param_118=Output_N46;
float param_119=Output_N51;
float param_120=Output_N109;
float param_121=Output_N48;
float param_122=Output_N49;
float param_123=Output_N50;
float2 param_124=Output_N52;
float2 param_125=Output_N53;
float param_126=Output_N54;
ssGlobals param_128=Globals;
tempGlobals=param_128;
float3 param_127=float3(0.0);
N2_normTime=param_107;
N2_localTime=param_108;
N2_seedVal=param_109;
N2_dieController=param_110;
N2_MAXPARTICLECOUNT=param_111!=0.0;
N2_spawnMaxParticles=param_112;
N2_sizeLife=param_113;
N2_spawnLoc=param_114;
N2_velocityXYZ=param_115;
N2_gravity=param_116;
N2_FORCE=param_117!=0.0;
N2_localForce=param_118;
N2_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N2_sizeVelScale=param_119;
N2_IGNOREVEL=param_120!=0.0;
N2_ALIGNTOX=param_121!=0.0;
N2_ALIGNTOY=param_122!=0.0;
N2_ALIGNTOZ=param_123!=0.0;
N2_rotationRandom=param_124;
N2_rotationRate=param_125;
N2_rotationDrag=param_126;
N2_WORLDSPACE=NODE_67_DROPLIST_ITEM_tmp==1;
N2_WORLDFORCE=NODE_67_DROPLIST_ITEM_tmp==2;
float3 l9_476=float3(0.0);
float4 l9_477=tempGlobals.VertexColor;
float4 l9_478=tempGlobals.VertexColor;
float4 l9_479=tempGlobals.VertexColor;
float l9_480=l9_477.x+(l9_478.y*l9_479.z);
float l9_481=(fract((l9_480*1231.1232)+N2_seedVal)*1000.0)+1.0;
float l9_482=1.0;
float l9_483=fract((l9_480*15.32451)+N2_seedVal);
if (N2_MAXPARTICLECOUNT)
{
if ((N2_dieController>=0.99000001)||(l9_481>=N2_spawnMaxParticles))
{
l9_482=0.0;
}
else
{
if (N2_dieController>=0.99000001)
{
l9_482=0.0;
}
}
}
float3 l9_484=float3(0.0,((N2_gravity/2.0)*N2_localTime)*N2_localTime,0.0);
float3 l9_485=l9_476;
if (N2_FORCE)
{
l9_485=((N2_localForce/float3(2.0))*N2_localTime)*N2_localTime;
}
float4x4 l9_486=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_487=length(l9_486[0].xyz);
float2 l9_488=tempGlobals.Surface_UVCoord0;
float2 l9_489=l9_488;
float2 l9_490=(((l9_489-float2(0.5))*l9_482)*N2_sizeLife)*l9_487;
int l9_491=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_491=0;
}
else
{
l9_491=gl_InstanceIndex%2;
}
int l9_492=l9_491;
float4x4 l9_493=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_492];
int l9_494=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_494=0;
}
else
{
l9_494=gl_InstanceIndex%2;
}
int l9_495=l9_494;
float4x4 l9_496=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_495];
int l9_497=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_497=0;
}
else
{
l9_497=gl_InstanceIndex%2;
}
int l9_498=l9_497;
float4x4 l9_499=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_498];
float3 l9_500=normalize(float3(l9_493[0].z,l9_496[1].z,l9_499[2].z+N2_EPSILON));
float3 l9_501=normalize(cross(l9_500,float3(0.0,-1.0,0.0)));
float3 l9_502=normalize(cross(l9_501,l9_500));
float l9_503=N2_PI;
float l9_504=1.0;
if (N2_ALIGNTOX)
{
l9_501=float3(0.0,0.0,1.0);
l9_502=float3(0.0,1.0,0.0);
}
if (N2_ALIGNTOY)
{
l9_501=float3(1.0,0.0,0.0);
l9_502=float3(0.0,0.0,1.0);
}
if (N2_ALIGNTOZ)
{
l9_501=float3(1.0,0.0,0.0);
l9_502=float3(0.0,1.0,0.0);
}
float l9_505=mix(N2_rotationRandom.x,N2_rotationRandom.y,l9_483);
float l9_506=1.0-N2_normTime;
float l9_507=N2_rotationDrag;
float l9_508;
if (l9_506<=0.0)
{
l9_508=0.0;
}
else
{
l9_508=pow(l9_506,l9_507);
}
float l9_509=l9_508;
float l9_510=l9_509;
float l9_511=mix(N2_rotationRate.x,N2_rotationRate.y,l9_483);
float l9_512=((l9_511*l9_510)*N2_normTime)*2.0;
l9_503=N2_PI*((l9_512+l9_505)-0.5);
float2 l9_513=float2(cos(l9_503),sin(l9_503));
float2 l9_514=float2(-sin(l9_503),cos(l9_503));
float3 l9_515=float3((l9_501*l9_513.x)+(l9_502*l9_513.y));
float3 l9_516=float3((l9_501*l9_514.x)+(l9_502*l9_514.y));
float4x4 l9_517=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_518=length(l9_517[0].xyz);
float4x4 l9_519=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_520=length(l9_519[1].xyz);
float4x4 l9_521=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_522=length(l9_521[2].xyz);
float3 l9_523=float3(l9_518,l9_520,l9_522);
float4x4 l9_524=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_525=l9_524;
float4 l9_526=l9_525[0];
float4 l9_527=l9_525[1];
float4 l9_528=l9_525[2];
float3x3 l9_529=float3x3(float3(float3(l9_526.x,l9_527.x,l9_528.x)),float3(float3(l9_526.y,l9_527.y,l9_528.y)),float3(float3(l9_526.z,l9_527.z,l9_528.z)));
float3x3 l9_530=l9_529;
float3 l9_531=((N2_velocityXYZ+l9_484)+l9_485)*l9_530;
if (N2_WORLDFORCE)
{
float4x4 l9_532=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_533=l9_532;
float4 l9_534=l9_533[0];
float4 l9_535=l9_533[1];
float4 l9_536=l9_533[2];
float3x3 l9_537=float3x3(float3(float3(l9_534.x,l9_535.x,l9_536.x)),float3(float3(l9_534.y,l9_535.y,l9_536.y)),float3(float3(l9_534.z,l9_535.z,l9_536.z)));
float3x3 l9_538=l9_537;
l9_531=((N2_velocityXYZ*l9_538)+l9_484)+l9_485;
}
if (N2_WORLDSPACE)
{
l9_531=((N2_velocityXYZ*l9_523)+l9_484)+l9_485;
}
if (N2_ALIGNTOVEL)
{
float3 l9_539=normalize(((l9_531+l9_484)+l9_485)+float3(N2_EPSILON));
float3 l9_540=l9_531*(N2_localTime-0.0099999998);
float3 l9_541=l9_531*(N2_localTime+0.0099999998);
if (N2_IGNOREVEL)
{
l9_504=fast::max(N2_sizeVelScale,0.1);
l9_504=N2_sizeVelScale;
}
else
{
l9_504=length(l9_541-l9_540)*N2_sizeVelScale;
}
l9_515=l9_539;
l9_516=normalize(cross(l9_515,l9_500));
}
float4x4 l9_542=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_543=(l9_542*float4(N2_spawnLoc,1.0)).xyz+l9_531;
float3 l9_544=(l9_543+(l9_516*l9_490.x))+(l9_515*(l9_490.y*l9_504));
N2_position=l9_544;
param_127=N2_position;
position_N2=param_127;
WorldPosition=position_N2;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_129=v;
float3 param_130=WorldPosition;
float3 param_131=WorldNormal;
float3 param_132=WorldTangent;
float4 param_133=v.position;
out.varPos=param_130;
out.varNormal=normalize(param_131);
float3 l9_545=normalize(param_132);
out.varTangent=float4(l9_545.x,l9_545.y,l9_545.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_546=param_129.position;
float4 l9_547=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_548=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_548=0;
}
else
{
l9_548=gl_InstanceIndex%2;
}
int l9_549=l9_548;
l9_547=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_549]*l9_546;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_550=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_550=0;
}
else
{
l9_550=gl_InstanceIndex%2;
}
int l9_551=l9_550;
l9_547=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_551]*l9_546;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_552=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_552=0;
}
else
{
l9_552=gl_InstanceIndex%2;
}
int l9_553=l9_552;
l9_547=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_553]*l9_546;
}
else
{
l9_547=l9_546;
}
}
}
float4 l9_554=l9_547;
out.varViewSpaceDepth=-l9_554.z;
}
float4 l9_555=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_555=param_133;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_556=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_556=0;
}
else
{
l9_556=gl_InstanceIndex%2;
}
int l9_557=l9_556;
l9_555=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_557]*param_129.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_558=0;
}
else
{
l9_558=gl_InstanceIndex%2;
}
int l9_559=l9_558;
l9_555=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_559]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_560=0;
}
else
{
l9_560=gl_InstanceIndex%2;
}
int l9_561=l9_560;
l9_555=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_561]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_129.texture0,param_129.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_562=param_129.position;
float4 l9_563=l9_562;
if (sc_RenderingSpace_tmp==1)
{
l9_563=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_562;
}
float4 l9_564=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_563;
float2 l9_565=((l9_564.xy/float2(l9_564.w))*0.5)+float2(0.5);
out.varShadowTex=l9_565;
}
float4 l9_566=l9_555;
if (sc_DepthBufferMode_tmp==1)
{
int l9_567=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_567=0;
}
else
{
l9_567=gl_InstanceIndex%2;
}
int l9_568=l9_567;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_568][2].w!=0.0)
{
float l9_569=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_566.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_566.w))*l9_569)-1.0)*l9_566.w;
}
}
float4 l9_570=l9_566;
l9_555=l9_570;
float4 l9_571=l9_555;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_572=l9_571.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_571.w);
l9_571=float4(l9_572.x,l9_572.y,l9_571.z,l9_571.w);
}
float4 l9_573=l9_571;
l9_555=l9_573;
float4 l9_574=l9_555;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_574.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_575=l9_574;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_576=dot(l9_575,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_577=l9_576;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_577;
}
}
float4 l9_578=float4(l9_574.x,-l9_574.y,(l9_574.z*0.5)+(l9_574.w*0.5),l9_574.w);
out.gl_Position=l9_578;
v=param_129;
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
float4 VertexColor;
float2 Surface_UVCoord1;
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
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float spawnMaxParticles;
float2 sizeStart;
float2 sizeEnd;
float2 sizeStartMin;
float2 sizeStartMax;
float2 sizeEndMin;
float2 sizeEndMax;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandom;
float2 rotationRate;
float rotationDrag;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 vectorTextureSize;
float4 vectorTextureDims;
float4 vectorTextureView;
float3x3 vectorTextureTransform;
float4 vectorTextureUvMinMax;
float4 vectorTextureBorderColor;
float flowStrength;
float flowSpeed;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float alphaDissolveMult;
float Port_Input1_N069;
float Port_Input1_N068;
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
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> sizeRampTexture [[id(18)]];
texture2d<float> vectorTexture [[id(19)]];
texture2d<float> velRampTexture [[id(20)]];
sampler colorRampTextureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler mainTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler sizeRampTextureSmpSC [[id(31)]];
sampler vectorTextureSmpSC [[id(32)]];
sampler velRampTextureSmpSC [[id(33)]];
constant userUniformsObj* UserUniforms [[id(34)]];
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
bool N58_BASETEXTURE=false;
bool N58_FLIPBOOK=false;
float4 N58_flipbookTex=float4(0.0);
bool N58_VECTORFIELD=false;
float4 N58_vectorFieldTex=float4(0.0);
float4 N58_colorLife=float4(0.0);
bool N58_COLORRAMP=false;
float4 N58_colorRampTex=float4(0.0);
bool N58_ALPHADISSOLVE=false;
float N58_alphaDissolveMult=0.0;
bool N58_BLACKASALPHA=false;
bool N58_PREMULTIPLIEDCOLOR=false;
float N58_normTime=0.0;
float4 N58_result=float4(0.0);
float N76_numValidFrames=0.0;
float2 N76_gridSize=float2(0.0);
float N76_flipBookSpeedMult=0.0;
float N76_flipBookRandomStart=0.0;
float2 N76_realLifeTimeMinMax=float2(0.0);
bool N76_FLIPBOOKBLEND=false;
bool N76_FLIPBOOKBYLIFE=false;
float N76_seedVal=0.0;
float N76_localTime=0.0;
float N76_flowStrength=0.0;
float N76_flowSpeed=0.0;
float4 N76_flipbookTex=float4(0.0);
float4 N76_vectorTex=float4(0.0);
float N25_timeGlobal=0.0;
bool N25_EXTERNALTIME=false;
float N25_externalTime=0.0;
bool N25_WORLDPOSSEED=false;
float N25_externalSeed=0.0;
bool N25_LIFETIMEMINMAX=false;
float N25_lifeTimeConstant=0.0;
float2 N25_lifeTimeMinMax=float2(0.0);
bool N25_INSTANTSPAWN=false;
float N25_normTime=0.0;
float N25_localTime=0.0;
float N25_seedVal=0.0;
float2 N25_realLifeTimeMinMax=float2(0.0);
float3 N70_colorStart=float3(0.0);
float3 N70_colorEnd=float3(0.0);
bool N70_COLORMINMAX=false;
float3 N70_colorMinStart=float3(0.0);
float3 N70_colorMinEnd=float3(0.0);
float3 N70_colorMaxStart=float3(0.0);
float3 N70_colorMaxEnd=float3(0.0);
bool N70_COLORMONOMIN=false;
float N70_alphaStart=0.0;
float N70_alphaEnd=0.0;
bool N70_ALPHAMINMAX=false;
float N70_alphaMinStart=0.0;
float N70_alphaMinEnd=0.0;
float N70_alphaMaxStart=0.0;
float N70_alphaMaxEnd=0.0;
float N70_seedVal=0.0;
float N70_normTime=0.0;
float4 N70_colorLife=float4(0.0);
float2 N71_texSize=float2(0.0);
float4 N71_colorRampMult=float4(0.0);
bool N71_NORANDOFFSET=false;
float N71_normTime=0.0;
float4 N71_colorRampTex=float4(0.0);
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
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float Output_N28=0.0;
float param;
if ((int(BASETEXTURE_tmp)!=0))
{
param=1.001;
}
else
{
param=0.001;
}
param-=0.001;
Output_N28=param;
float Output_N62=0.0;
float param_1;
if ((int(FLIPBOOK_tmp)!=0))
{
param_1=1.001;
}
else
{
param_1=0.001;
}
param_1-=0.001;
Output_N62=param_1;
float Output_N63=0.0;
float param_2=(*sc_set0.UserUniforms).numValidFrames;
Output_N63=param_2;
float2 Output_N64=float2(0.0);
float2 param_3=(*sc_set0.UserUniforms).gridSize;
Output_N64=param_3;
float Output_N65=0.0;
float param_4=(*sc_set0.UserUniforms).flipBookSpeedMult;
Output_N65=param_4;
float Output_N66=0.0;
float param_5=(*sc_set0.UserUniforms).flipBookRandomStart;
Output_N66=param_5;
float Output_N3=0.0;
float param_6=(*sc_set0.UserUniforms).timeGlobal;
Output_N3=param_6;
float Output_N6=0.0;
float param_7;
if ((int(EXTERNALTIME_tmp)!=0))
{
param_7=1.001;
}
else
{
param_7=0.001;
}
param_7-=0.001;
Output_N6=param_7;
float Output_N5=0.0;
float param_8=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5=param_8;
float Output_N8=0.0;
float param_9;
if ((int(WORLDPOSSEED_tmp)!=0))
{
param_9=1.001;
}
else
{
param_9=0.001;
}
param_9-=0.001;
Output_N8=param_9;
float Output_N7=0.0;
float param_10=(*sc_set0.UserUniforms).externalSeed;
Output_N7=param_10;
float Output_N0=0.0;
float param_11;
if ((int(LIFETIMEMINMAX_tmp)!=0))
{
param_11=1.001;
}
else
{
param_11=0.001;
}
param_11-=0.001;
Output_N0=param_11;
float Output_N9=0.0;
float param_12=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9=param_12;
float2 Output_N10=float2(0.0);
float2 param_13=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10=param_13;
float Output_N11=0.0;
float param_14;
if ((int(INSTANTSPAWN_tmp)!=0))
{
param_14=1.001;
}
else
{
param_14=0.001;
}
param_14-=0.001;
Output_N11=param_14;
float normTime_N25=0.0;
float localTime_N25=0.0;
float seedVal_N25=0.0;
float2 realLifeTimeMinMax_N25=float2(0.0);
float param_15=Output_N3;
float param_16=Output_N6;
float param_17=Output_N5;
float param_18=Output_N8;
float param_19=Output_N7;
float param_20=Output_N0;
float param_21=Output_N9;
float2 param_22=Output_N10;
float param_23=Output_N11;
ssGlobals param_28=Globals;
ssGlobals tempGlobals=param_28;
float param_24=0.0;
float param_25=0.0;
float param_26=0.0;
float2 param_27=float2(0.0);
N25_timeGlobal=param_15;
N25_EXTERNALTIME=param_16!=0.0;
N25_externalTime=param_17;
N25_WORLDPOSSEED=param_18!=0.0;
N25_externalSeed=param_19;
N25_LIFETIMEMINMAX=param_20!=0.0;
N25_lifeTimeConstant=param_21;
N25_lifeTimeMinMax=param_22;
N25_INSTANTSPAWN=param_23!=0.0;
float l9_0=0.0;
if (N25_WORLDPOSSEED)
{
float4x4 l9_1=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_0=length(float4(1.0)*l9_1);
}
N25_realLifeTimeMinMax=float2(N25_lifeTimeConstant);
if (N25_LIFETIMEMINMAX)
{
N25_realLifeTimeMinMax=N25_lifeTimeMinMax;
}
float l9_2=fast::max(N25_realLifeTimeMinMax.x,0.0099999998);
float l9_3=fast::max(N25_realLifeTimeMinMax.y,0.0099999998);
N25_seedVal=N25_externalSeed+l9_0;
float4 l9_4=tempGlobals.VertexColor;
float4 l9_5=tempGlobals.VertexColor;
float4 l9_6=tempGlobals.VertexColor;
float l9_7=l9_4.x+(l9_5.y*l9_6.z);
float l9_8=fract((l9_7*12.12358)+N25_seedVal);
float l9_9=fract((l9_7*3.5358)+N25_seedVal);
float l9_10=tempGlobals.gTimeElapsed;
float l9_11=l9_10;
if (N25_EXTERNALTIME)
{
l9_11=N25_externalTime;
}
if (!N25_INSTANTSPAWN)
{
float l9_12=fract(((l9_11*N25_timeGlobal)*(1.0/N25_realLifeTimeMinMax.y))+l9_8);
N25_localTime=l9_12*N25_realLifeTimeMinMax.y;
}
else
{
N25_localTime=N25_timeGlobal*l9_11;
}
float l9_13=mix(N25_localTime/l9_2,N25_localTime/l9_3,l9_9);
N25_normTime=fast::clamp(l9_13,0.0,1.0);
param_24=N25_normTime;
param_25=N25_localTime;
param_26=N25_seedVal;
param_27=N25_realLifeTimeMinMax;
normTime_N25=param_24;
localTime_N25=param_25;
seedVal_N25=param_26;
realLifeTimeMinMax_N25=param_27;
float Output_N92=0.0;
float param_29;
if ((int(FLIPBOOKBLEND_tmp)!=0))
{
param_29=1.001;
}
else
{
param_29=0.001;
}
param_29-=0.001;
Output_N92=param_29;
float Output_N91=0.0;
float param_30;
if ((int(FLIPBOOKBYLIFE_tmp)!=0))
{
param_30=1.001;
}
else
{
param_30=0.001;
}
param_30-=0.001;
Output_N91=param_30;
float Output_N112=0.0;
float param_31=(*sc_set0.UserUniforms).flowStrength;
Output_N112=param_31;
float Output_N113=0.0;
float param_32=(*sc_set0.UserUniforms).flowSpeed;
Output_N113=param_32;
float4 flipbookTex_N76=float4(0.0);
float4 vectorTex_N76=float4(0.0);
float param_33=Output_N63;
float2 param_34=Output_N64;
float param_35=Output_N65;
float param_36=Output_N66;
float2 param_37=realLifeTimeMinMax_N25;
float param_38=Output_N92;
float param_39=Output_N91;
float param_40=seedVal_N25;
float param_41=localTime_N25;
float param_42=Output_N112;
float param_43=Output_N113;
ssGlobals param_46=Globals;
tempGlobals=param_46;
float4 param_44=float4(0.0);
float4 param_45=float4(0.0);
N76_numValidFrames=param_33;
N76_gridSize=param_34;
N76_flipBookSpeedMult=param_35;
N76_flipBookRandomStart=param_36;
N76_realLifeTimeMinMax=param_37;
N76_FLIPBOOKBLEND=param_38!=0.0;
N76_FLIPBOOKBYLIFE=param_39!=0.0;
N76_seedVal=param_40;
N76_localTime=param_41;
N76_flowStrength=param_42;
N76_flowSpeed=param_43;
float2 l9_14=tempGlobals.Surface_UVCoord0;
float2 l9_15=l9_14;
float2 l9_16=tempGlobals.Surface_UVCoord1;
float2 l9_17=l9_16;
float4 l9_18=tempGlobals.VertexColor;
float4 l9_19=tempGlobals.VertexColor;
float4 l9_20=tempGlobals.VertexColor;
float l9_21=l9_18.x+(l9_19.y*l9_20.z);
float l9_22=fract((l9_21*43.2234)+N76_seedVal);
float l9_23=fract((l9_21*3.5358)+N76_seedVal);
float l9_24=fast::max(N76_realLifeTimeMinMax.x,0.0099999998);
float l9_25=fast::max(N76_realLifeTimeMinMax.y,0.0099999998);
float l9_26=N76_localTime;
if (N76_FLIPBOOKBYLIFE)
{
float l9_27=mix(l9_24,l9_25,l9_23);
l9_26=N76_localTime/l9_27;
}
float l9_28=mix(0.0,N76_flipBookRandomStart,l9_22);
float2 l9_29=l9_15/N76_gridSize;
float l9_30=(l9_26*N76_flipBookSpeedMult)+l9_28;
l9_30=mod(l9_30,N76_numValidFrames);
float l9_31=floor(l9_30)*(1.0/N76_gridSize.x);
float l9_32=mod(floor((-l9_30)/N76_gridSize.x),N76_gridSize.y)*(1.0/N76_gridSize.y);
float l9_33=l9_30+1.0;
l9_33=mod(l9_33,N76_numValidFrames);
float l9_34=floor(l9_33)*(1.0/N76_gridSize.x);
float l9_35=floor((-l9_33)*(1.0/N76_gridSize.x))*(1.0/N76_gridSize.y);
float l9_36=fract(l9_30);
l9_15=l9_29+float2(l9_31,l9_32);
l9_17=l9_29+float2(l9_34,l9_35);
if (N76_FLIPBOOKBLEND)
{
float2 l9_37=l9_15;
float4 l9_38=float4(0.0);
int l9_39=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_40=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_40=0;
}
else
{
l9_40=in.varStereoViewID;
}
int l9_41=l9_40;
l9_39=1-l9_41;
}
else
{
int l9_42=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_42=0;
}
else
{
l9_42=in.varStereoViewID;
}
int l9_43=l9_42;
l9_39=l9_43;
}
int l9_44=l9_39;
int l9_45=mainTextureLayout_tmp;
int l9_46=l9_44;
float2 l9_47=l9_37;
bool l9_48=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_49=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_50=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_51=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_52=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_53=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_54=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_55=0.0;
bool l9_56=l9_53&&(!l9_51);
float l9_57=1.0;
float l9_58=l9_47.x;
int l9_59=l9_50.x;
if (l9_59==1)
{
l9_58=fract(l9_58);
}
else
{
if (l9_59==2)
{
float l9_60=fract(l9_58);
float l9_61=l9_58-l9_60;
float l9_62=step(0.25,fract(l9_61*0.5));
l9_58=mix(l9_60,1.0-l9_60,fast::clamp(l9_62,0.0,1.0));
}
}
l9_47.x=l9_58;
float l9_63=l9_47.y;
int l9_64=l9_50.y;
if (l9_64==1)
{
l9_63=fract(l9_63);
}
else
{
if (l9_64==2)
{
float l9_65=fract(l9_63);
float l9_66=l9_63-l9_65;
float l9_67=step(0.25,fract(l9_66*0.5));
l9_63=mix(l9_65,1.0-l9_65,fast::clamp(l9_67,0.0,1.0));
}
}
l9_47.y=l9_63;
if (l9_51)
{
bool l9_68=l9_53;
bool l9_69;
if (l9_68)
{
l9_69=l9_50.x==3;
}
else
{
l9_69=l9_68;
}
float l9_70=l9_47.x;
float l9_71=l9_52.x;
float l9_72=l9_52.z;
bool l9_73=l9_69;
float l9_74=l9_57;
float l9_75=fast::clamp(l9_70,l9_71,l9_72);
float l9_76=step(abs(l9_70-l9_75),9.9999997e-06);
l9_74*=(l9_76+((1.0-float(l9_73))*(1.0-l9_76)));
l9_70=l9_75;
l9_47.x=l9_70;
l9_57=l9_74;
bool l9_77=l9_53;
bool l9_78;
if (l9_77)
{
l9_78=l9_50.y==3;
}
else
{
l9_78=l9_77;
}
float l9_79=l9_47.y;
float l9_80=l9_52.y;
float l9_81=l9_52.w;
bool l9_82=l9_78;
float l9_83=l9_57;
float l9_84=fast::clamp(l9_79,l9_80,l9_81);
float l9_85=step(abs(l9_79-l9_84),9.9999997e-06);
l9_83*=(l9_85+((1.0-float(l9_82))*(1.0-l9_85)));
l9_79=l9_84;
l9_47.y=l9_79;
l9_57=l9_83;
}
float2 l9_86=l9_47;
bool l9_87=l9_48;
float3x3 l9_88=l9_49;
if (l9_87)
{
l9_86=float2((l9_88*float3(l9_86,1.0)).xy);
}
float2 l9_89=l9_86;
float2 l9_90=l9_89;
float2 l9_91=l9_90;
l9_47=l9_91;
float l9_92=l9_47.x;
int l9_93=l9_50.x;
bool l9_94=l9_56;
float l9_95=l9_57;
if ((l9_93==0)||(l9_93==3))
{
float l9_96=l9_92;
float l9_97=0.0;
float l9_98=1.0;
bool l9_99=l9_94;
float l9_100=l9_95;
float l9_101=fast::clamp(l9_96,l9_97,l9_98);
float l9_102=step(abs(l9_96-l9_101),9.9999997e-06);
l9_100*=(l9_102+((1.0-float(l9_99))*(1.0-l9_102)));
l9_96=l9_101;
l9_92=l9_96;
l9_95=l9_100;
}
l9_47.x=l9_92;
l9_57=l9_95;
float l9_103=l9_47.y;
int l9_104=l9_50.y;
bool l9_105=l9_56;
float l9_106=l9_57;
if ((l9_104==0)||(l9_104==3))
{
float l9_107=l9_103;
float l9_108=0.0;
float l9_109=1.0;
bool l9_110=l9_105;
float l9_111=l9_106;
float l9_112=fast::clamp(l9_107,l9_108,l9_109);
float l9_113=step(abs(l9_107-l9_112),9.9999997e-06);
l9_111*=(l9_113+((1.0-float(l9_110))*(1.0-l9_113)));
l9_107=l9_112;
l9_103=l9_107;
l9_106=l9_111;
}
l9_47.y=l9_103;
l9_57=l9_106;
float2 l9_114=l9_47;
int l9_115=l9_45;
int l9_116=l9_46;
float l9_117=l9_55;
float2 l9_118=l9_114;
int l9_119=l9_115;
int l9_120=l9_116;
float3 l9_121=float3(0.0);
if (l9_119==0)
{
l9_121=float3(l9_118,0.0);
}
else
{
if (l9_119==1)
{
l9_121=float3(l9_118.x,(l9_118.y*0.5)+(0.5-(float(l9_120)*0.5)),0.0);
}
else
{
l9_121=float3(l9_118,float(l9_120));
}
}
float3 l9_122=l9_121;
float3 l9_123=l9_122;
float2 l9_124=l9_123.xy;
float l9_125=l9_117;
float4 l9_126=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_124,bias(l9_125));
float4 l9_127=l9_126;
float4 l9_128=l9_127;
if (l9_53)
{
l9_128=mix(l9_54,l9_128,float4(l9_57));
}
float4 l9_129=l9_128;
l9_38=l9_129;
float4 l9_130=l9_38;
float4 l9_131=l9_130;
float2 l9_132=l9_17;
float4 l9_133=float4(0.0);
int l9_134=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=in.varStereoViewID;
}
int l9_136=l9_135;
l9_134=1-l9_136;
}
else
{
int l9_137=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_137=0;
}
else
{
l9_137=in.varStereoViewID;
}
int l9_138=l9_137;
l9_134=l9_138;
}
int l9_139=l9_134;
int l9_140=mainTextureLayout_tmp;
int l9_141=l9_139;
float2 l9_142=l9_132;
bool l9_143=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_144=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_145=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_146=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_147=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_148=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_149=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_150=0.0;
bool l9_151=l9_148&&(!l9_146);
float l9_152=1.0;
float l9_153=l9_142.x;
int l9_154=l9_145.x;
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
l9_142.x=l9_153;
float l9_158=l9_142.y;
int l9_159=l9_145.y;
if (l9_159==1)
{
l9_158=fract(l9_158);
}
else
{
if (l9_159==2)
{
float l9_160=fract(l9_158);
float l9_161=l9_158-l9_160;
float l9_162=step(0.25,fract(l9_161*0.5));
l9_158=mix(l9_160,1.0-l9_160,fast::clamp(l9_162,0.0,1.0));
}
}
l9_142.y=l9_158;
if (l9_146)
{
bool l9_163=l9_148;
bool l9_164;
if (l9_163)
{
l9_164=l9_145.x==3;
}
else
{
l9_164=l9_163;
}
float l9_165=l9_142.x;
float l9_166=l9_147.x;
float l9_167=l9_147.z;
bool l9_168=l9_164;
float l9_169=l9_152;
float l9_170=fast::clamp(l9_165,l9_166,l9_167);
float l9_171=step(abs(l9_165-l9_170),9.9999997e-06);
l9_169*=(l9_171+((1.0-float(l9_168))*(1.0-l9_171)));
l9_165=l9_170;
l9_142.x=l9_165;
l9_152=l9_169;
bool l9_172=l9_148;
bool l9_173;
if (l9_172)
{
l9_173=l9_145.y==3;
}
else
{
l9_173=l9_172;
}
float l9_174=l9_142.y;
float l9_175=l9_147.y;
float l9_176=l9_147.w;
bool l9_177=l9_173;
float l9_178=l9_152;
float l9_179=fast::clamp(l9_174,l9_175,l9_176);
float l9_180=step(abs(l9_174-l9_179),9.9999997e-06);
l9_178*=(l9_180+((1.0-float(l9_177))*(1.0-l9_180)));
l9_174=l9_179;
l9_142.y=l9_174;
l9_152=l9_178;
}
float2 l9_181=l9_142;
bool l9_182=l9_143;
float3x3 l9_183=l9_144;
if (l9_182)
{
l9_181=float2((l9_183*float3(l9_181,1.0)).xy);
}
float2 l9_184=l9_181;
float2 l9_185=l9_184;
float2 l9_186=l9_185;
l9_142=l9_186;
float l9_187=l9_142.x;
int l9_188=l9_145.x;
bool l9_189=l9_151;
float l9_190=l9_152;
if ((l9_188==0)||(l9_188==3))
{
float l9_191=l9_187;
float l9_192=0.0;
float l9_193=1.0;
bool l9_194=l9_189;
float l9_195=l9_190;
float l9_196=fast::clamp(l9_191,l9_192,l9_193);
float l9_197=step(abs(l9_191-l9_196),9.9999997e-06);
l9_195*=(l9_197+((1.0-float(l9_194))*(1.0-l9_197)));
l9_191=l9_196;
l9_187=l9_191;
l9_190=l9_195;
}
l9_142.x=l9_187;
l9_152=l9_190;
float l9_198=l9_142.y;
int l9_199=l9_145.y;
bool l9_200=l9_151;
float l9_201=l9_152;
if ((l9_199==0)||(l9_199==3))
{
float l9_202=l9_198;
float l9_203=0.0;
float l9_204=1.0;
bool l9_205=l9_200;
float l9_206=l9_201;
float l9_207=fast::clamp(l9_202,l9_203,l9_204);
float l9_208=step(abs(l9_202-l9_207),9.9999997e-06);
l9_206*=(l9_208+((1.0-float(l9_205))*(1.0-l9_208)));
l9_202=l9_207;
l9_198=l9_202;
l9_201=l9_206;
}
l9_142.y=l9_198;
l9_152=l9_201;
float2 l9_209=l9_142;
int l9_210=l9_140;
int l9_211=l9_141;
float l9_212=l9_150;
float2 l9_213=l9_209;
int l9_214=l9_210;
int l9_215=l9_211;
float3 l9_216=float3(0.0);
if (l9_214==0)
{
l9_216=float3(l9_213,0.0);
}
else
{
if (l9_214==1)
{
l9_216=float3(l9_213.x,(l9_213.y*0.5)+(0.5-(float(l9_215)*0.5)),0.0);
}
else
{
l9_216=float3(l9_213,float(l9_215));
}
}
float3 l9_217=l9_216;
float3 l9_218=l9_217;
float2 l9_219=l9_218.xy;
float l9_220=l9_212;
float4 l9_221=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_219,bias(l9_220));
float4 l9_222=l9_221;
float4 l9_223=l9_222;
if (l9_148)
{
l9_223=mix(l9_149,l9_223,float4(l9_152));
}
float4 l9_224=l9_223;
l9_133=l9_224;
float4 l9_225=l9_133;
N76_flipbookTex=mix(l9_131,l9_225,float4(l9_36));
}
else
{
float2 l9_226=l9_15;
float4 l9_227=float4(0.0);
int l9_228=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=in.varStereoViewID;
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
l9_231=in.varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=mainTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=l9_226;
bool l9_237=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_238=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_241=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_243=(*sc_set0.UserUniforms).mainTextureBorderColor;
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
float4 l9_315=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
l9_227=l9_318;
float4 l9_319=l9_227;
N76_flipbookTex=l9_319;
}
if (!(SC_DEVICE_CLASS_tmp>=2))
{
float2 l9_320=tempGlobals.Surface_UVCoord0;
float2 l9_321=l9_320;
float4 l9_322=float4(0.0);
int l9_323=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_324=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_324=0;
}
else
{
l9_324=in.varStereoViewID;
}
int l9_325=l9_324;
l9_323=1-l9_325;
}
else
{
int l9_326=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_326=0;
}
else
{
l9_326=in.varStereoViewID;
}
int l9_327=l9_326;
l9_323=l9_327;
}
int l9_328=l9_323;
int l9_329=mainTextureLayout_tmp;
int l9_330=l9_328;
float2 l9_331=l9_321;
bool l9_332=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_333=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_334=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_335=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_336=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_337=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_338=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_339=0.0;
bool l9_340=l9_337&&(!l9_335);
float l9_341=1.0;
float l9_342=l9_331.x;
int l9_343=l9_334.x;
if (l9_343==1)
{
l9_342=fract(l9_342);
}
else
{
if (l9_343==2)
{
float l9_344=fract(l9_342);
float l9_345=l9_342-l9_344;
float l9_346=step(0.25,fract(l9_345*0.5));
l9_342=mix(l9_344,1.0-l9_344,fast::clamp(l9_346,0.0,1.0));
}
}
l9_331.x=l9_342;
float l9_347=l9_331.y;
int l9_348=l9_334.y;
if (l9_348==1)
{
l9_347=fract(l9_347);
}
else
{
if (l9_348==2)
{
float l9_349=fract(l9_347);
float l9_350=l9_347-l9_349;
float l9_351=step(0.25,fract(l9_350*0.5));
l9_347=mix(l9_349,1.0-l9_349,fast::clamp(l9_351,0.0,1.0));
}
}
l9_331.y=l9_347;
if (l9_335)
{
bool l9_352=l9_337;
bool l9_353;
if (l9_352)
{
l9_353=l9_334.x==3;
}
else
{
l9_353=l9_352;
}
float l9_354=l9_331.x;
float l9_355=l9_336.x;
float l9_356=l9_336.z;
bool l9_357=l9_353;
float l9_358=l9_341;
float l9_359=fast::clamp(l9_354,l9_355,l9_356);
float l9_360=step(abs(l9_354-l9_359),9.9999997e-06);
l9_358*=(l9_360+((1.0-float(l9_357))*(1.0-l9_360)));
l9_354=l9_359;
l9_331.x=l9_354;
l9_341=l9_358;
bool l9_361=l9_337;
bool l9_362;
if (l9_361)
{
l9_362=l9_334.y==3;
}
else
{
l9_362=l9_361;
}
float l9_363=l9_331.y;
float l9_364=l9_336.y;
float l9_365=l9_336.w;
bool l9_366=l9_362;
float l9_367=l9_341;
float l9_368=fast::clamp(l9_363,l9_364,l9_365);
float l9_369=step(abs(l9_363-l9_368),9.9999997e-06);
l9_367*=(l9_369+((1.0-float(l9_366))*(1.0-l9_369)));
l9_363=l9_368;
l9_331.y=l9_363;
l9_341=l9_367;
}
float2 l9_370=l9_331;
bool l9_371=l9_332;
float3x3 l9_372=l9_333;
if (l9_371)
{
l9_370=float2((l9_372*float3(l9_370,1.0)).xy);
}
float2 l9_373=l9_370;
float2 l9_374=l9_373;
float2 l9_375=l9_374;
l9_331=l9_375;
float l9_376=l9_331.x;
int l9_377=l9_334.x;
bool l9_378=l9_340;
float l9_379=l9_341;
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
l9_331.x=l9_376;
l9_341=l9_379;
float l9_387=l9_331.y;
int l9_388=l9_334.y;
bool l9_389=l9_340;
float l9_390=l9_341;
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
l9_331.y=l9_387;
l9_341=l9_390;
float2 l9_398=l9_331;
int l9_399=l9_329;
int l9_400=l9_330;
float l9_401=l9_339;
float2 l9_402=l9_398;
int l9_403=l9_399;
int l9_404=l9_400;
float3 l9_405=float3(0.0);
if (l9_403==0)
{
l9_405=float3(l9_402,0.0);
}
else
{
if (l9_403==1)
{
l9_405=float3(l9_402.x,(l9_402.y*0.5)+(0.5-(float(l9_404)*0.5)),0.0);
}
else
{
l9_405=float3(l9_402,float(l9_404));
}
}
float3 l9_406=l9_405;
float3 l9_407=l9_406;
float2 l9_408=l9_407.xy;
float l9_409=l9_401;
float4 l9_410=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_408,bias(l9_409));
float4 l9_411=l9_410;
float4 l9_412=l9_411;
if (l9_337)
{
l9_412=mix(l9_338,l9_412,float4(l9_341));
}
float4 l9_413=l9_412;
l9_322=l9_413;
float4 l9_414=l9_322;
float4 l9_415=l9_414;
float4 l9_416=l9_415;
N76_vectorTex=l9_416;
}
else
{
float l9_417=N76_flowStrength;
float l9_418=N76_flowSpeed;
float2 l9_419=tempGlobals.Surface_UVCoord0;
float2 l9_420=l9_419;
float4 l9_421=float4(0.0);
int l9_422=0;
if ((int(vectorTextureHasSwappedViews_tmp)!=0))
{
int l9_423=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_423=0;
}
else
{
l9_423=in.varStereoViewID;
}
int l9_424=l9_423;
l9_422=1-l9_424;
}
else
{
int l9_425=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_425=0;
}
else
{
l9_425=in.varStereoViewID;
}
int l9_426=l9_425;
l9_422=l9_426;
}
int l9_427=l9_422;
int l9_428=vectorTextureLayout_tmp;
int l9_429=l9_427;
float2 l9_430=l9_420;
bool l9_431=(int(SC_USE_UV_TRANSFORM_vectorTexture_tmp)!=0);
float3x3 l9_432=(*sc_set0.UserUniforms).vectorTextureTransform;
int2 l9_433=int2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_vectorTexture_tmp);
bool l9_434=(int(SC_USE_UV_MIN_MAX_vectorTexture_tmp)!=0);
float4 l9_435=(*sc_set0.UserUniforms).vectorTextureUvMinMax;
bool l9_436=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture_tmp)!=0);
float4 l9_437=(*sc_set0.UserUniforms).vectorTextureBorderColor;
float l9_438=0.0;
bool l9_439=l9_436&&(!l9_434);
float l9_440=1.0;
float l9_441=l9_430.x;
int l9_442=l9_433.x;
if (l9_442==1)
{
l9_441=fract(l9_441);
}
else
{
if (l9_442==2)
{
float l9_443=fract(l9_441);
float l9_444=l9_441-l9_443;
float l9_445=step(0.25,fract(l9_444*0.5));
l9_441=mix(l9_443,1.0-l9_443,fast::clamp(l9_445,0.0,1.0));
}
}
l9_430.x=l9_441;
float l9_446=l9_430.y;
int l9_447=l9_433.y;
if (l9_447==1)
{
l9_446=fract(l9_446);
}
else
{
if (l9_447==2)
{
float l9_448=fract(l9_446);
float l9_449=l9_446-l9_448;
float l9_450=step(0.25,fract(l9_449*0.5));
l9_446=mix(l9_448,1.0-l9_448,fast::clamp(l9_450,0.0,1.0));
}
}
l9_430.y=l9_446;
if (l9_434)
{
bool l9_451=l9_436;
bool l9_452;
if (l9_451)
{
l9_452=l9_433.x==3;
}
else
{
l9_452=l9_451;
}
float l9_453=l9_430.x;
float l9_454=l9_435.x;
float l9_455=l9_435.z;
bool l9_456=l9_452;
float l9_457=l9_440;
float l9_458=fast::clamp(l9_453,l9_454,l9_455);
float l9_459=step(abs(l9_453-l9_458),9.9999997e-06);
l9_457*=(l9_459+((1.0-float(l9_456))*(1.0-l9_459)));
l9_453=l9_458;
l9_430.x=l9_453;
l9_440=l9_457;
bool l9_460=l9_436;
bool l9_461;
if (l9_460)
{
l9_461=l9_433.y==3;
}
else
{
l9_461=l9_460;
}
float l9_462=l9_430.y;
float l9_463=l9_435.y;
float l9_464=l9_435.w;
bool l9_465=l9_461;
float l9_466=l9_440;
float l9_467=fast::clamp(l9_462,l9_463,l9_464);
float l9_468=step(abs(l9_462-l9_467),9.9999997e-06);
l9_466*=(l9_468+((1.0-float(l9_465))*(1.0-l9_468)));
l9_462=l9_467;
l9_430.y=l9_462;
l9_440=l9_466;
}
float2 l9_469=l9_430;
bool l9_470=l9_431;
float3x3 l9_471=l9_432;
if (l9_470)
{
l9_469=float2((l9_471*float3(l9_469,1.0)).xy);
}
float2 l9_472=l9_469;
float2 l9_473=l9_472;
float2 l9_474=l9_473;
l9_430=l9_474;
float l9_475=l9_430.x;
int l9_476=l9_433.x;
bool l9_477=l9_439;
float l9_478=l9_440;
if ((l9_476==0)||(l9_476==3))
{
float l9_479=l9_475;
float l9_480=0.0;
float l9_481=1.0;
bool l9_482=l9_477;
float l9_483=l9_478;
float l9_484=fast::clamp(l9_479,l9_480,l9_481);
float l9_485=step(abs(l9_479-l9_484),9.9999997e-06);
l9_483*=(l9_485+((1.0-float(l9_482))*(1.0-l9_485)));
l9_479=l9_484;
l9_475=l9_479;
l9_478=l9_483;
}
l9_430.x=l9_475;
l9_440=l9_478;
float l9_486=l9_430.y;
int l9_487=l9_433.y;
bool l9_488=l9_439;
float l9_489=l9_440;
if ((l9_487==0)||(l9_487==3))
{
float l9_490=l9_486;
float l9_491=0.0;
float l9_492=1.0;
bool l9_493=l9_488;
float l9_494=l9_489;
float l9_495=fast::clamp(l9_490,l9_491,l9_492);
float l9_496=step(abs(l9_490-l9_495),9.9999997e-06);
l9_494*=(l9_496+((1.0-float(l9_493))*(1.0-l9_496)));
l9_490=l9_495;
l9_486=l9_490;
l9_489=l9_494;
}
l9_430.y=l9_486;
l9_440=l9_489;
float2 l9_497=l9_430;
int l9_498=l9_428;
int l9_499=l9_429;
float l9_500=l9_438;
float2 l9_501=l9_497;
int l9_502=l9_498;
int l9_503=l9_499;
float3 l9_504=float3(0.0);
if (l9_502==0)
{
l9_504=float3(l9_501,0.0);
}
else
{
if (l9_502==1)
{
l9_504=float3(l9_501.x,(l9_501.y*0.5)+(0.5-(float(l9_503)*0.5)),0.0);
}
else
{
l9_504=float3(l9_501,float(l9_503));
}
}
float3 l9_505=l9_504;
float3 l9_506=l9_505;
float2 l9_507=l9_506.xy;
float l9_508=l9_500;
float4 l9_509=sc_set0.vectorTexture.sample(sc_set0.vectorTextureSmpSC,l9_507,bias(l9_508));
float4 l9_510=l9_509;
float4 l9_511=l9_510;
if (l9_436)
{
l9_511=mix(l9_437,l9_511,float4(l9_440));
}
float4 l9_512=l9_511;
l9_421=l9_512;
float4 l9_513=l9_421;
float4 l9_514=l9_513;
l9_514=(l9_514-float4(0.5))*2.0;
float l9_515=tempGlobals.gTimeElapsed;
float l9_516=l9_515*l9_418;
float l9_517=fract(l9_516+0.5);
float l9_518=fract(l9_516+1.0);
float2 l9_519=(l9_514.xy*l9_517)*l9_417;
float2 l9_520=(l9_514.xy*l9_518)*l9_417;
float2 l9_521=tempGlobals.Surface_UVCoord0;
float2 l9_522=l9_521+l9_519;
float4 l9_523=float4(0.0);
int l9_524=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_525=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_525=0;
}
else
{
l9_525=in.varStereoViewID;
}
int l9_526=l9_525;
l9_524=1-l9_526;
}
else
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
l9_524=l9_528;
}
int l9_529=l9_524;
int l9_530=mainTextureLayout_tmp;
int l9_531=l9_529;
float2 l9_532=l9_522;
bool l9_533=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_534=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_535=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_536=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_537=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_538=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_539=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_540=0.0;
bool l9_541=l9_538&&(!l9_536);
float l9_542=1.0;
float l9_543=l9_532.x;
int l9_544=l9_535.x;
if (l9_544==1)
{
l9_543=fract(l9_543);
}
else
{
if (l9_544==2)
{
float l9_545=fract(l9_543);
float l9_546=l9_543-l9_545;
float l9_547=step(0.25,fract(l9_546*0.5));
l9_543=mix(l9_545,1.0-l9_545,fast::clamp(l9_547,0.0,1.0));
}
}
l9_532.x=l9_543;
float l9_548=l9_532.y;
int l9_549=l9_535.y;
if (l9_549==1)
{
l9_548=fract(l9_548);
}
else
{
if (l9_549==2)
{
float l9_550=fract(l9_548);
float l9_551=l9_548-l9_550;
float l9_552=step(0.25,fract(l9_551*0.5));
l9_548=mix(l9_550,1.0-l9_550,fast::clamp(l9_552,0.0,1.0));
}
}
l9_532.y=l9_548;
if (l9_536)
{
bool l9_553=l9_538;
bool l9_554;
if (l9_553)
{
l9_554=l9_535.x==3;
}
else
{
l9_554=l9_553;
}
float l9_555=l9_532.x;
float l9_556=l9_537.x;
float l9_557=l9_537.z;
bool l9_558=l9_554;
float l9_559=l9_542;
float l9_560=fast::clamp(l9_555,l9_556,l9_557);
float l9_561=step(abs(l9_555-l9_560),9.9999997e-06);
l9_559*=(l9_561+((1.0-float(l9_558))*(1.0-l9_561)));
l9_555=l9_560;
l9_532.x=l9_555;
l9_542=l9_559;
bool l9_562=l9_538;
bool l9_563;
if (l9_562)
{
l9_563=l9_535.y==3;
}
else
{
l9_563=l9_562;
}
float l9_564=l9_532.y;
float l9_565=l9_537.y;
float l9_566=l9_537.w;
bool l9_567=l9_563;
float l9_568=l9_542;
float l9_569=fast::clamp(l9_564,l9_565,l9_566);
float l9_570=step(abs(l9_564-l9_569),9.9999997e-06);
l9_568*=(l9_570+((1.0-float(l9_567))*(1.0-l9_570)));
l9_564=l9_569;
l9_532.y=l9_564;
l9_542=l9_568;
}
float2 l9_571=l9_532;
bool l9_572=l9_533;
float3x3 l9_573=l9_534;
if (l9_572)
{
l9_571=float2((l9_573*float3(l9_571,1.0)).xy);
}
float2 l9_574=l9_571;
float2 l9_575=l9_574;
float2 l9_576=l9_575;
l9_532=l9_576;
float l9_577=l9_532.x;
int l9_578=l9_535.x;
bool l9_579=l9_541;
float l9_580=l9_542;
if ((l9_578==0)||(l9_578==3))
{
float l9_581=l9_577;
float l9_582=0.0;
float l9_583=1.0;
bool l9_584=l9_579;
float l9_585=l9_580;
float l9_586=fast::clamp(l9_581,l9_582,l9_583);
float l9_587=step(abs(l9_581-l9_586),9.9999997e-06);
l9_585*=(l9_587+((1.0-float(l9_584))*(1.0-l9_587)));
l9_581=l9_586;
l9_577=l9_581;
l9_580=l9_585;
}
l9_532.x=l9_577;
l9_542=l9_580;
float l9_588=l9_532.y;
int l9_589=l9_535.y;
bool l9_590=l9_541;
float l9_591=l9_542;
if ((l9_589==0)||(l9_589==3))
{
float l9_592=l9_588;
float l9_593=0.0;
float l9_594=1.0;
bool l9_595=l9_590;
float l9_596=l9_591;
float l9_597=fast::clamp(l9_592,l9_593,l9_594);
float l9_598=step(abs(l9_592-l9_597),9.9999997e-06);
l9_596*=(l9_598+((1.0-float(l9_595))*(1.0-l9_598)));
l9_592=l9_597;
l9_588=l9_592;
l9_591=l9_596;
}
l9_532.y=l9_588;
l9_542=l9_591;
float2 l9_599=l9_532;
int l9_600=l9_530;
int l9_601=l9_531;
float l9_602=l9_540;
float2 l9_603=l9_599;
int l9_604=l9_600;
int l9_605=l9_601;
float3 l9_606=float3(0.0);
if (l9_604==0)
{
l9_606=float3(l9_603,0.0);
}
else
{
if (l9_604==1)
{
l9_606=float3(l9_603.x,(l9_603.y*0.5)+(0.5-(float(l9_605)*0.5)),0.0);
}
else
{
l9_606=float3(l9_603,float(l9_605));
}
}
float3 l9_607=l9_606;
float3 l9_608=l9_607;
float2 l9_609=l9_608.xy;
float l9_610=l9_602;
float4 l9_611=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_609,bias(l9_610));
float4 l9_612=l9_611;
float4 l9_613=l9_612;
if (l9_538)
{
l9_613=mix(l9_539,l9_613,float4(l9_542));
}
float4 l9_614=l9_613;
l9_523=l9_614;
float4 l9_615=l9_523;
float4 l9_616=l9_615;
float2 l9_617=tempGlobals.Surface_UVCoord0;
float2 l9_618=l9_617+l9_520;
float4 l9_619=float4(0.0);
int l9_620=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_621=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_621=0;
}
else
{
l9_621=in.varStereoViewID;
}
int l9_622=l9_621;
l9_620=1-l9_622;
}
else
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
l9_620=l9_624;
}
int l9_625=l9_620;
int l9_626=mainTextureLayout_tmp;
int l9_627=l9_625;
float2 l9_628=l9_618;
bool l9_629=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_630=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_631=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_632=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_633=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_634=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_635=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_636=0.0;
bool l9_637=l9_634&&(!l9_632);
float l9_638=1.0;
float l9_639=l9_628.x;
int l9_640=l9_631.x;
if (l9_640==1)
{
l9_639=fract(l9_639);
}
else
{
if (l9_640==2)
{
float l9_641=fract(l9_639);
float l9_642=l9_639-l9_641;
float l9_643=step(0.25,fract(l9_642*0.5));
l9_639=mix(l9_641,1.0-l9_641,fast::clamp(l9_643,0.0,1.0));
}
}
l9_628.x=l9_639;
float l9_644=l9_628.y;
int l9_645=l9_631.y;
if (l9_645==1)
{
l9_644=fract(l9_644);
}
else
{
if (l9_645==2)
{
float l9_646=fract(l9_644);
float l9_647=l9_644-l9_646;
float l9_648=step(0.25,fract(l9_647*0.5));
l9_644=mix(l9_646,1.0-l9_646,fast::clamp(l9_648,0.0,1.0));
}
}
l9_628.y=l9_644;
if (l9_632)
{
bool l9_649=l9_634;
bool l9_650;
if (l9_649)
{
l9_650=l9_631.x==3;
}
else
{
l9_650=l9_649;
}
float l9_651=l9_628.x;
float l9_652=l9_633.x;
float l9_653=l9_633.z;
bool l9_654=l9_650;
float l9_655=l9_638;
float l9_656=fast::clamp(l9_651,l9_652,l9_653);
float l9_657=step(abs(l9_651-l9_656),9.9999997e-06);
l9_655*=(l9_657+((1.0-float(l9_654))*(1.0-l9_657)));
l9_651=l9_656;
l9_628.x=l9_651;
l9_638=l9_655;
bool l9_658=l9_634;
bool l9_659;
if (l9_658)
{
l9_659=l9_631.y==3;
}
else
{
l9_659=l9_658;
}
float l9_660=l9_628.y;
float l9_661=l9_633.y;
float l9_662=l9_633.w;
bool l9_663=l9_659;
float l9_664=l9_638;
float l9_665=fast::clamp(l9_660,l9_661,l9_662);
float l9_666=step(abs(l9_660-l9_665),9.9999997e-06);
l9_664*=(l9_666+((1.0-float(l9_663))*(1.0-l9_666)));
l9_660=l9_665;
l9_628.y=l9_660;
l9_638=l9_664;
}
float2 l9_667=l9_628;
bool l9_668=l9_629;
float3x3 l9_669=l9_630;
if (l9_668)
{
l9_667=float2((l9_669*float3(l9_667,1.0)).xy);
}
float2 l9_670=l9_667;
float2 l9_671=l9_670;
float2 l9_672=l9_671;
l9_628=l9_672;
float l9_673=l9_628.x;
int l9_674=l9_631.x;
bool l9_675=l9_637;
float l9_676=l9_638;
if ((l9_674==0)||(l9_674==3))
{
float l9_677=l9_673;
float l9_678=0.0;
float l9_679=1.0;
bool l9_680=l9_675;
float l9_681=l9_676;
float l9_682=fast::clamp(l9_677,l9_678,l9_679);
float l9_683=step(abs(l9_677-l9_682),9.9999997e-06);
l9_681*=(l9_683+((1.0-float(l9_680))*(1.0-l9_683)));
l9_677=l9_682;
l9_673=l9_677;
l9_676=l9_681;
}
l9_628.x=l9_673;
l9_638=l9_676;
float l9_684=l9_628.y;
int l9_685=l9_631.y;
bool l9_686=l9_637;
float l9_687=l9_638;
if ((l9_685==0)||(l9_685==3))
{
float l9_688=l9_684;
float l9_689=0.0;
float l9_690=1.0;
bool l9_691=l9_686;
float l9_692=l9_687;
float l9_693=fast::clamp(l9_688,l9_689,l9_690);
float l9_694=step(abs(l9_688-l9_693),9.9999997e-06);
l9_692*=(l9_694+((1.0-float(l9_691))*(1.0-l9_694)));
l9_688=l9_693;
l9_684=l9_688;
l9_687=l9_692;
}
l9_628.y=l9_684;
l9_638=l9_687;
float2 l9_695=l9_628;
int l9_696=l9_626;
int l9_697=l9_627;
float l9_698=l9_636;
float2 l9_699=l9_695;
int l9_700=l9_696;
int l9_701=l9_697;
float3 l9_702=float3(0.0);
if (l9_700==0)
{
l9_702=float3(l9_699,0.0);
}
else
{
if (l9_700==1)
{
l9_702=float3(l9_699.x,(l9_699.y*0.5)+(0.5-(float(l9_701)*0.5)),0.0);
}
else
{
l9_702=float3(l9_699,float(l9_701));
}
}
float3 l9_703=l9_702;
float3 l9_704=l9_703;
float2 l9_705=l9_704.xy;
float l9_706=l9_698;
float4 l9_707=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_705,bias(l9_706));
float4 l9_708=l9_707;
float4 l9_709=l9_708;
if (l9_634)
{
l9_709=mix(l9_635,l9_709,float4(l9_638));
}
float4 l9_710=l9_709;
l9_619=l9_710;
float4 l9_711=l9_619;
float4 l9_712=l9_711;
float l9_713=abs((0.5-l9_517)/0.5);
float4 l9_714=mix(l9_616,l9_712,float4(l9_713));
float4 l9_715=l9_714;
N76_vectorTex=l9_715;
}
param_44=N76_flipbookTex;
param_45=N76_vectorTex;
flipbookTex_N76=param_44;
vectorTex_N76=param_45;
float Output_N114=0.0;
float param_47;
if ((int(VECTORFIELD_tmp)!=0))
{
param_47=1.001;
}
else
{
param_47=0.001;
}
param_47-=0.001;
Output_N114=param_47;
float3 Output_N82=float3(0.0);
float3 param_48=(*sc_set0.UserUniforms).colorStart;
Output_N82=param_48;
float3 Output_N83=float3(0.0);
float3 param_49=(*sc_set0.UserUniforms).colorEnd;
Output_N83=param_49;
float Output_N77=0.0;
float param_50;
if ((int(COLORMINMAX_tmp)!=0))
{
param_50=1.001;
}
else
{
param_50=0.001;
}
param_50-=0.001;
Output_N77=param_50;
float3 Output_N78=float3(0.0);
float3 param_51=(*sc_set0.UserUniforms).colorMinStart;
Output_N78=param_51;
float3 Output_N80=float3(0.0);
float3 param_52=(*sc_set0.UserUniforms).colorMinEnd;
Output_N80=param_52;
float3 Output_N79=float3(0.0);
float3 param_53=(*sc_set0.UserUniforms).colorMaxStart;
Output_N79=param_53;
float3 Output_N81=float3(0.0);
float3 param_54=(*sc_set0.UserUniforms).colorMaxEnd;
Output_N81=param_54;
float Output_N106=0.0;
float param_55;
if ((int(COLORMONOMIN_tmp)!=0))
{
param_55=1.001;
}
else
{
param_55=0.001;
}
param_55-=0.001;
Output_N106=param_55;
float Output_N89=0.0;
float param_56=(*sc_set0.UserUniforms).alphaStart;
Output_N89=param_56;
float Output_N90=0.0;
float param_57=(*sc_set0.UserUniforms).alphaEnd;
Output_N90=param_57;
float Output_N84=0.0;
float param_58;
if ((int(ALPHAMINMAX_tmp)!=0))
{
param_58=1.001;
}
else
{
param_58=0.001;
}
param_58-=0.001;
Output_N84=param_58;
float Output_N85=0.0;
float param_59=(*sc_set0.UserUniforms).alphaMinStart;
Output_N85=param_59;
float Output_N86=0.0;
float param_60=(*sc_set0.UserUniforms).alphaMinEnd;
Output_N86=param_60;
float Output_N87=0.0;
float param_61=(*sc_set0.UserUniforms).alphaMaxStart;
Output_N87=param_61;
float Output_N88=0.0;
float param_62=(*sc_set0.UserUniforms).alphaMaxEnd;
Output_N88=param_62;
float4 colorLife_N70=float4(0.0);
float3 param_63=Output_N82;
float3 param_64=Output_N83;
float param_65=Output_N77;
float3 param_66=Output_N78;
float3 param_67=Output_N80;
float3 param_68=Output_N79;
float3 param_69=Output_N81;
float param_70=Output_N106;
float param_71=Output_N89;
float param_72=Output_N90;
float param_73=Output_N84;
float param_74=Output_N85;
float param_75=Output_N86;
float param_76=Output_N87;
float param_77=Output_N88;
float param_78=seedVal_N25;
float param_79=normTime_N25;
ssGlobals param_81=Globals;
tempGlobals=param_81;
float4 param_80=float4(0.0);
N70_colorStart=param_63;
N70_colorEnd=param_64;
N70_COLORMINMAX=param_65!=0.0;
N70_colorMinStart=param_66;
N70_colorMinEnd=param_67;
N70_colorMaxStart=param_68;
N70_colorMaxEnd=param_69;
N70_COLORMONOMIN=param_70!=0.0;
N70_alphaStart=param_71;
N70_alphaEnd=param_72;
N70_ALPHAMINMAX=param_73!=0.0;
N70_alphaMinStart=param_74;
N70_alphaMinEnd=param_75;
N70_alphaMaxStart=param_76;
N70_alphaMaxEnd=param_77;
N70_seedVal=param_78;
N70_normTime=param_79;
float3 l9_716=float3(0.0);
float3 l9_717=float3(0.0);
float l9_718=0.0;
float l9_719=0.0;
float4 l9_720=tempGlobals.VertexColor;
float4 l9_721=tempGlobals.VertexColor;
float4 l9_722=tempGlobals.VertexColor;
float l9_723=l9_720.x+(l9_721.y*l9_722.z);
if (N70_COLORMINMAX)
{
float l9_724=fract((l9_723*82.124229)+N70_seedVal);
float l9_725=fract((l9_723*9115.2148)+N70_seedVal);
float l9_726=fract((l9_723*654.15588)+N70_seedVal);
float3 l9_727=fract((float3(l9_724,l9_725,l9_726)*27.21883)+float3(N70_seedVal));
if (N70_COLORMONOMIN)
{
l9_727=fract((float3(l9_724,l9_724,l9_724)*27.21883)+float3(N70_seedVal));
}
l9_716=mix(N70_colorMinStart,N70_colorMaxStart,l9_727);
l9_717=mix(N70_colorMinEnd,N70_colorMaxEnd,l9_727);
}
else
{
l9_716=N70_colorStart;
l9_717=N70_colorEnd;
}
if (N70_ALPHAMINMAX)
{
float l9_728=fract((l9_723*3.3331299)+N70_seedVal);
l9_718=mix(N70_alphaMinStart,N70_alphaMaxStart,l9_728);
l9_719=mix(N70_alphaMinEnd,N70_alphaMaxEnd,l9_728);
}
else
{
l9_718=N70_alphaStart;
l9_719=N70_alphaEnd;
}
l9_716=mix(l9_716,l9_717,float3(N70_normTime));
l9_718=mix(l9_718,l9_719,N70_normTime);
N70_colorLife=float4(l9_716,l9_718);
param_80=N70_colorLife;
colorLife_N70=param_80;
float Output_N29=0.0;
float param_82;
if ((int(COLORRAMP_tmp)!=0))
{
param_82=1.001;
}
else
{
param_82=0.001;
}
param_82-=0.001;
Output_N29=param_82;
float2 TextureSize_N21=float2(0.0);
float2 param_83=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
TextureSize_N21=param_83;
float4 Output_N30=float4(0.0);
float4 param_84=(*sc_set0.UserUniforms).colorRampMult;
Output_N30=param_84;
float Output_N60=0.0;
float param_85;
if ((int(NORANDOFFSET_tmp)!=0))
{
param_85=1.001;
}
else
{
param_85=0.001;
}
param_85-=0.001;
Output_N60=param_85;
float4 colorRampTex_N71=float4(0.0);
float2 param_86=TextureSize_N21;
float4 param_87=Output_N30;
float param_88=Output_N60;
float param_89=normTime_N25;
ssGlobals param_91=Globals;
tempGlobals=param_91;
float4 param_90=float4(0.0);
N71_texSize=param_86;
N71_colorRampMult=param_87;
N71_NORANDOFFSET=param_88!=0.0;
N71_normTime=param_89;
float2 l9_729=tempGlobals.Surface_UVCoord0;
float2 l9_730=l9_729;
float l9_731=ceil(N71_normTime*N71_texSize.x)/N71_texSize.x;
float l9_732=l9_731;
if (N71_NORANDOFFSET)
{
l9_732+=(l9_730.x/N71_texSize.x);
}
float2 l9_733=float2(l9_732,0.5);
float4 l9_734=float4(0.0);
int l9_735=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_736=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_736=0;
}
else
{
l9_736=in.varStereoViewID;
}
int l9_737=l9_736;
l9_735=1-l9_737;
}
else
{
int l9_738=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_738=0;
}
else
{
l9_738=in.varStereoViewID;
}
int l9_739=l9_738;
l9_735=l9_739;
}
int l9_740=l9_735;
int l9_741=colorRampTextureLayout_tmp;
int l9_742=l9_740;
float2 l9_743=l9_733;
bool l9_744=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_745=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_746=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_747=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_748=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_749=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_750=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_751=0.0;
bool l9_752=l9_749&&(!l9_747);
float l9_753=1.0;
float l9_754=l9_743.x;
int l9_755=l9_746.x;
if (l9_755==1)
{
l9_754=fract(l9_754);
}
else
{
if (l9_755==2)
{
float l9_756=fract(l9_754);
float l9_757=l9_754-l9_756;
float l9_758=step(0.25,fract(l9_757*0.5));
l9_754=mix(l9_756,1.0-l9_756,fast::clamp(l9_758,0.0,1.0));
}
}
l9_743.x=l9_754;
float l9_759=l9_743.y;
int l9_760=l9_746.y;
if (l9_760==1)
{
l9_759=fract(l9_759);
}
else
{
if (l9_760==2)
{
float l9_761=fract(l9_759);
float l9_762=l9_759-l9_761;
float l9_763=step(0.25,fract(l9_762*0.5));
l9_759=mix(l9_761,1.0-l9_761,fast::clamp(l9_763,0.0,1.0));
}
}
l9_743.y=l9_759;
if (l9_747)
{
bool l9_764=l9_749;
bool l9_765;
if (l9_764)
{
l9_765=l9_746.x==3;
}
else
{
l9_765=l9_764;
}
float l9_766=l9_743.x;
float l9_767=l9_748.x;
float l9_768=l9_748.z;
bool l9_769=l9_765;
float l9_770=l9_753;
float l9_771=fast::clamp(l9_766,l9_767,l9_768);
float l9_772=step(abs(l9_766-l9_771),9.9999997e-06);
l9_770*=(l9_772+((1.0-float(l9_769))*(1.0-l9_772)));
l9_766=l9_771;
l9_743.x=l9_766;
l9_753=l9_770;
bool l9_773=l9_749;
bool l9_774;
if (l9_773)
{
l9_774=l9_746.y==3;
}
else
{
l9_774=l9_773;
}
float l9_775=l9_743.y;
float l9_776=l9_748.y;
float l9_777=l9_748.w;
bool l9_778=l9_774;
float l9_779=l9_753;
float l9_780=fast::clamp(l9_775,l9_776,l9_777);
float l9_781=step(abs(l9_775-l9_780),9.9999997e-06);
l9_779*=(l9_781+((1.0-float(l9_778))*(1.0-l9_781)));
l9_775=l9_780;
l9_743.y=l9_775;
l9_753=l9_779;
}
float2 l9_782=l9_743;
bool l9_783=l9_744;
float3x3 l9_784=l9_745;
if (l9_783)
{
l9_782=float2((l9_784*float3(l9_782,1.0)).xy);
}
float2 l9_785=l9_782;
float2 l9_786=l9_785;
float2 l9_787=l9_786;
l9_743=l9_787;
float l9_788=l9_743.x;
int l9_789=l9_746.x;
bool l9_790=l9_752;
float l9_791=l9_753;
if ((l9_789==0)||(l9_789==3))
{
float l9_792=l9_788;
float l9_793=0.0;
float l9_794=1.0;
bool l9_795=l9_790;
float l9_796=l9_791;
float l9_797=fast::clamp(l9_792,l9_793,l9_794);
float l9_798=step(abs(l9_792-l9_797),9.9999997e-06);
l9_796*=(l9_798+((1.0-float(l9_795))*(1.0-l9_798)));
l9_792=l9_797;
l9_788=l9_792;
l9_791=l9_796;
}
l9_743.x=l9_788;
l9_753=l9_791;
float l9_799=l9_743.y;
int l9_800=l9_746.y;
bool l9_801=l9_752;
float l9_802=l9_753;
if ((l9_800==0)||(l9_800==3))
{
float l9_803=l9_799;
float l9_804=0.0;
float l9_805=1.0;
bool l9_806=l9_801;
float l9_807=l9_802;
float l9_808=fast::clamp(l9_803,l9_804,l9_805);
float l9_809=step(abs(l9_803-l9_808),9.9999997e-06);
l9_807*=(l9_809+((1.0-float(l9_806))*(1.0-l9_809)));
l9_803=l9_808;
l9_799=l9_803;
l9_802=l9_807;
}
l9_743.y=l9_799;
l9_753=l9_802;
float2 l9_810=l9_743;
int l9_811=l9_741;
int l9_812=l9_742;
float l9_813=l9_751;
float2 l9_814=l9_810;
int l9_815=l9_811;
int l9_816=l9_812;
float3 l9_817=float3(0.0);
if (l9_815==0)
{
l9_817=float3(l9_814,0.0);
}
else
{
if (l9_815==1)
{
l9_817=float3(l9_814.x,(l9_814.y*0.5)+(0.5-(float(l9_816)*0.5)),0.0);
}
else
{
l9_817=float3(l9_814,float(l9_816));
}
}
float3 l9_818=l9_817;
float3 l9_819=l9_818;
float2 l9_820=l9_819.xy;
float l9_821=l9_813;
float4 l9_822=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_820,bias(l9_821));
float4 l9_823=l9_822;
float4 l9_824=l9_823;
if (l9_749)
{
l9_824=mix(l9_750,l9_824,float4(l9_753));
}
float4 l9_825=l9_824;
l9_734=l9_825;
float4 l9_826=l9_734;
N71_colorRampTex=l9_826*N71_colorRampMult;
param_90=N71_colorRampTex;
colorRampTex_N71=param_90;
float Output_N72=0.0;
float param_92;
if ((int(ALPHADISSOLVE_tmp)!=0))
{
param_92=1.001;
}
else
{
param_92=0.001;
}
param_92-=0.001;
Output_N72=param_92;
float Output_N73=0.0;
float param_93=(*sc_set0.UserUniforms).alphaDissolveMult;
Output_N73=param_93;
float Output_N74=0.0;
float param_94;
if ((int(BLACKASALPHA_tmp)!=0))
{
param_94=1.001;
}
else
{
param_94=0.001;
}
param_94-=0.001;
Output_N74=param_94;
float Output_N75=0.0;
float param_95;
if ((int(PREMULTIPLIEDCOLOR_tmp)!=0))
{
param_95=1.001;
}
else
{
param_95=0.001;
}
param_95-=0.001;
Output_N75=param_95;
float4 result_N58=float4(0.0);
float param_96=Output_N28;
float param_97=Output_N62;
float4 param_98=flipbookTex_N76;
float param_99=Output_N114;
float4 param_100=vectorTex_N76;
float4 param_101=colorLife_N70;
float param_102=Output_N29;
float4 param_103=colorRampTex_N71;
float param_104=Output_N72;
float param_105=Output_N73;
float param_106=Output_N74;
float param_107=Output_N75;
float param_108=normTime_N25;
ssGlobals param_110=Globals;
tempGlobals=param_110;
float4 param_109=float4(0.0);
N58_BASETEXTURE=param_96!=0.0;
N58_FLIPBOOK=param_97!=0.0;
N58_flipbookTex=param_98;
N58_VECTORFIELD=param_99!=0.0;
N58_vectorFieldTex=param_100;
N58_colorLife=param_101;
N58_COLORRAMP=param_102!=0.0;
N58_colorRampTex=param_103;
N58_ALPHADISSOLVE=param_104!=0.0;
N58_alphaDissolveMult=param_105;
N58_BLACKASALPHA=param_106!=0.0;
N58_PREMULTIPLIEDCOLOR=param_107!=0.0;
N58_normTime=param_108;
float3 l9_827=float3(0.0);
float4 l9_828=float4(1.0);
float4 l9_829=float4(1.0);
float2 l9_830=tempGlobals.Surface_UVCoord0;
float2 l9_831=l9_830;
float l9_832=l9_827.x;
if (N58_BASETEXTURE)
{
float2 l9_833=l9_831;
float4 l9_834=float4(0.0);
int l9_835=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_836=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_836=0;
}
else
{
l9_836=in.varStereoViewID;
}
int l9_837=l9_836;
l9_835=1-l9_837;
}
else
{
int l9_838=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_838=0;
}
else
{
l9_838=in.varStereoViewID;
}
int l9_839=l9_838;
l9_835=l9_839;
}
int l9_840=l9_835;
int l9_841=mainTextureLayout_tmp;
int l9_842=l9_840;
float2 l9_843=l9_833;
bool l9_844=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_845=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_846=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_847=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_848=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_849=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_850=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_851=0.0;
bool l9_852=l9_849&&(!l9_847);
float l9_853=1.0;
float l9_854=l9_843.x;
int l9_855=l9_846.x;
if (l9_855==1)
{
l9_854=fract(l9_854);
}
else
{
if (l9_855==2)
{
float l9_856=fract(l9_854);
float l9_857=l9_854-l9_856;
float l9_858=step(0.25,fract(l9_857*0.5));
l9_854=mix(l9_856,1.0-l9_856,fast::clamp(l9_858,0.0,1.0));
}
}
l9_843.x=l9_854;
float l9_859=l9_843.y;
int l9_860=l9_846.y;
if (l9_860==1)
{
l9_859=fract(l9_859);
}
else
{
if (l9_860==2)
{
float l9_861=fract(l9_859);
float l9_862=l9_859-l9_861;
float l9_863=step(0.25,fract(l9_862*0.5));
l9_859=mix(l9_861,1.0-l9_861,fast::clamp(l9_863,0.0,1.0));
}
}
l9_843.y=l9_859;
if (l9_847)
{
bool l9_864=l9_849;
bool l9_865;
if (l9_864)
{
l9_865=l9_846.x==3;
}
else
{
l9_865=l9_864;
}
float l9_866=l9_843.x;
float l9_867=l9_848.x;
float l9_868=l9_848.z;
bool l9_869=l9_865;
float l9_870=l9_853;
float l9_871=fast::clamp(l9_866,l9_867,l9_868);
float l9_872=step(abs(l9_866-l9_871),9.9999997e-06);
l9_870*=(l9_872+((1.0-float(l9_869))*(1.0-l9_872)));
l9_866=l9_871;
l9_843.x=l9_866;
l9_853=l9_870;
bool l9_873=l9_849;
bool l9_874;
if (l9_873)
{
l9_874=l9_846.y==3;
}
else
{
l9_874=l9_873;
}
float l9_875=l9_843.y;
float l9_876=l9_848.y;
float l9_877=l9_848.w;
bool l9_878=l9_874;
float l9_879=l9_853;
float l9_880=fast::clamp(l9_875,l9_876,l9_877);
float l9_881=step(abs(l9_875-l9_880),9.9999997e-06);
l9_879*=(l9_881+((1.0-float(l9_878))*(1.0-l9_881)));
l9_875=l9_880;
l9_843.y=l9_875;
l9_853=l9_879;
}
float2 l9_882=l9_843;
bool l9_883=l9_844;
float3x3 l9_884=l9_845;
if (l9_883)
{
l9_882=float2((l9_884*float3(l9_882,1.0)).xy);
}
float2 l9_885=l9_882;
float2 l9_886=l9_885;
float2 l9_887=l9_886;
l9_843=l9_887;
float l9_888=l9_843.x;
int l9_889=l9_846.x;
bool l9_890=l9_852;
float l9_891=l9_853;
if ((l9_889==0)||(l9_889==3))
{
float l9_892=l9_888;
float l9_893=0.0;
float l9_894=1.0;
bool l9_895=l9_890;
float l9_896=l9_891;
float l9_897=fast::clamp(l9_892,l9_893,l9_894);
float l9_898=step(abs(l9_892-l9_897),9.9999997e-06);
l9_896*=(l9_898+((1.0-float(l9_895))*(1.0-l9_898)));
l9_892=l9_897;
l9_888=l9_892;
l9_891=l9_896;
}
l9_843.x=l9_888;
l9_853=l9_891;
float l9_899=l9_843.y;
int l9_900=l9_846.y;
bool l9_901=l9_852;
float l9_902=l9_853;
if ((l9_900==0)||(l9_900==3))
{
float l9_903=l9_899;
float l9_904=0.0;
float l9_905=1.0;
bool l9_906=l9_901;
float l9_907=l9_902;
float l9_908=fast::clamp(l9_903,l9_904,l9_905);
float l9_909=step(abs(l9_903-l9_908),9.9999997e-06);
l9_907*=(l9_909+((1.0-float(l9_906))*(1.0-l9_909)));
l9_903=l9_908;
l9_899=l9_903;
l9_902=l9_907;
}
l9_843.y=l9_899;
l9_853=l9_902;
float2 l9_910=l9_843;
int l9_911=l9_841;
int l9_912=l9_842;
float l9_913=l9_851;
float2 l9_914=l9_910;
int l9_915=l9_911;
int l9_916=l9_912;
float3 l9_917=float3(0.0);
if (l9_915==0)
{
l9_917=float3(l9_914,0.0);
}
else
{
if (l9_915==1)
{
l9_917=float3(l9_914.x,(l9_914.y*0.5)+(0.5-(float(l9_916)*0.5)),0.0);
}
else
{
l9_917=float3(l9_914,float(l9_916));
}
}
float3 l9_918=l9_917;
float3 l9_919=l9_918;
float2 l9_920=l9_919.xy;
float l9_921=l9_913;
float4 l9_922=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_920,bias(l9_921));
float4 l9_923=l9_922;
float4 l9_924=l9_923;
if (l9_849)
{
l9_924=mix(l9_850,l9_924,float4(l9_853));
}
float4 l9_925=l9_924;
l9_834=l9_925;
float4 l9_926=l9_834;
l9_828=l9_926;
if (N58_FLIPBOOK)
{
l9_828=N58_flipbookTex;
if (N58_VECTORFIELD)
{
l9_828=N58_vectorFieldTex;
}
}
}
if (N58_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_829=N58_colorRampTex;
}
}
N58_result=(l9_828*N58_colorLife)*l9_829;
if (N58_ALPHADISSOLVE)
{
l9_832=N58_normTime*N58_alphaDissolveMult;
N58_result.w=fast::clamp(N58_result.w-l9_832,0.0,1.0);
}
if (N58_BLACKASALPHA)
{
float l9_927=length(N58_result.xyz);
N58_result.w=l9_927;
}
if (N58_PREMULTIPLIEDCOLOR)
{
float3 l9_928=N58_result.xyz*N58_result.w;
N58_result=float4(l9_928.x,l9_928.y,l9_928.z,N58_result.w);
}
param_109=N58_result;
result_N58=param_109;
FinalColor=result_N58;
float param_111=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_111<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_929=gl_FragCoord;
float2 l9_930=floor(mod(l9_929.xy,float2(4.0)));
float l9_931=(mod(dot(l9_930,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_111<l9_931)
{
discard_fragment();
}
}
float4 param_112=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_932=param_112;
float4 l9_933=l9_932;
float l9_934=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_934=l9_933.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_934=fast::clamp(l9_933.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_934=fast::clamp(dot(l9_933.xyz,float3(l9_933.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_934=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_934=(1.0-dot(l9_933.xyz,float3(0.33333001)))*l9_933.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_934=(1.0-fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0))*l9_933.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_934=fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0)*l9_933.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_934=fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_934=fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0)*l9_933.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_934=dot(l9_933.xyz,float3(0.33333001))*l9_933.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_934=1.0-fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_934=fast::clamp(dot(l9_933.xyz,float3(1.0)),0.0,1.0);
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
float l9_935=l9_934;
float l9_936=l9_935;
float l9_937=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_936;
float3 l9_938=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_932.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_939=float4(l9_938.x,l9_938.y,l9_938.z,l9_937);
param_112=l9_939;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_112=float4(param_112.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_940=param_112;
float4 l9_941=float4(0.0);
float4 l9_942=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_943=out.FragColor0;
float4 l9_944=l9_943;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_944.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_945=l9_944;
l9_942=l9_945;
}
else
{
float4 l9_946=gl_FragCoord;
float2 l9_947=l9_946.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_948=l9_947;
float2 l9_949=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_950=1;
int l9_951=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_951=0;
}
else
{
l9_951=in.varStereoViewID;
}
int l9_952=l9_951;
int l9_953=l9_952;
float3 l9_954=float3(l9_948,0.0);
int l9_955=l9_950;
int l9_956=l9_953;
if (l9_955==1)
{
l9_954.y=((2.0*l9_954.y)+float(l9_956))-1.0;
}
float2 l9_957=l9_954.xy;
l9_949=l9_957;
}
else
{
l9_949=l9_948;
}
float2 l9_958=l9_949;
float2 l9_959=l9_958;
float2 l9_960=l9_959;
int l9_961=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
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
l9_961=1-l9_963;
}
else
{
int l9_964=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_964=0;
}
else
{
l9_964=in.varStereoViewID;
}
int l9_965=l9_964;
l9_961=l9_965;
}
int l9_966=l9_961;
float2 l9_967=l9_960;
int l9_968=l9_966;
float2 l9_969=l9_967;
int l9_970=l9_968;
float l9_971=0.0;
float4 l9_972=float4(0.0);
float2 l9_973=l9_969;
int l9_974=sc_ScreenTextureLayout_tmp;
int l9_975=l9_970;
float l9_976=l9_971;
float2 l9_977=l9_973;
int l9_978=l9_974;
int l9_979=l9_975;
float3 l9_980=float3(0.0);
if (l9_978==0)
{
l9_980=float3(l9_977,0.0);
}
else
{
if (l9_978==1)
{
l9_980=float3(l9_977.x,(l9_977.y*0.5)+(0.5-(float(l9_979)*0.5)),0.0);
}
else
{
l9_980=float3(l9_977,float(l9_979));
}
}
float3 l9_981=l9_980;
float3 l9_982=l9_981;
float2 l9_983=l9_982.xy;
float l9_984=l9_976;
float4 l9_985=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_983,bias(l9_984));
float4 l9_986=l9_985;
l9_972=l9_986;
float4 l9_987=l9_972;
float4 l9_988=l9_987;
float4 l9_989=l9_988;
l9_942=l9_989;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_942.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_990=l9_942;
float4 l9_991=l9_990;
float3 l9_992=l9_991.xyz;
float3 l9_993=l9_992;
float3 l9_994=l9_940.xyz;
float3 l9_995=definedBlend(l9_993,l9_994,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_941=float4(l9_995.x,l9_995.y,l9_995.z,l9_941.w);
float3 l9_996=mix(l9_992,l9_941.xyz,float3(l9_940.w));
l9_941=float4(l9_996.x,l9_996.y,l9_996.z,l9_941.w);
l9_941.w=1.0;
float4 l9_997=l9_941;
param_112=l9_997;
}
else
{
float4 l9_998=param_112;
float4 l9_999=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_999=float4(mix(float3(1.0),l9_998.xyz,float3(l9_998.w)),l9_998.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1000=l9_998.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1000=fast::clamp(l9_1000,0.0,1.0);
}
l9_999=float4(l9_998.xyz*l9_1000,l9_1000);
}
else
{
l9_999=l9_998;
}
}
float4 l9_1001=l9_999;
param_112=l9_1001;
}
}
}
float4 l9_1002=param_112;
FinalColor=l9_1002;
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
float4 l9_1003=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1003=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1003=float4(0.0);
}
float4 l9_1004=l9_1003;
float4 Cost=l9_1004;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_113=in.varPos;
float4 param_114=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_113,param_114,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_115=FinalColor;
float4 l9_1005=param_115;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1005.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1005;
return out;
}
} // FRAGMENT SHADER
