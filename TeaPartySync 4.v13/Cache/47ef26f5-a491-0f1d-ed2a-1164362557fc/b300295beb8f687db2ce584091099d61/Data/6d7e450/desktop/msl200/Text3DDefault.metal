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
//sampler sampler InnerEdgeTexSmpSC 0:29
//sampler sampler backCapTexSmpSC 0:30
//sampler sampler frontCapTexSmpSC 0:31
//sampler sampler intensityTextureSmpSC 0:32
//sampler sampler outerEdgeTexSmpSC 0:33
//sampler sampler sc_EnvmapDiffuseSmpSC 0:34
//sampler sampler sc_EnvmapSpecularSmpSC 0:35
//sampler sampler sc_RayTracedAoTextureSmpSC 0:37
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:38
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:39
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:40
//sampler sampler sc_SSAOTextureSmpSC 0:41
//sampler sampler sc_ScreenTextureSmpSC 0:42
//sampler sampler sc_ShadowTextureSmpSC 0:43
//sampler sampler z_hitIdAndBarycentricSmp 0:45
//sampler sampler z_rayDirectionsSmpSC 0:46
//texture texture2D InnerEdgeTex 0:4:0:29
//texture texture2D backCapTex 0:5:0:30
//texture texture2D frontCapTex 0:6:0:31
//texture texture2D intensityTexture 0:7:0:32
//texture texture2D outerEdgeTex 0:8:0:33
//texture texture2D sc_EnvmapDiffuse 0:9:0:34
//texture texture2D sc_EnvmapSpecular 0:10:0:35
//texture texture2D sc_RayTracedAoTexture 0:19:0:37
//texture texture2D sc_RayTracedDiffIndTexture 0:20:0:38
//texture texture2D sc_RayTracedReflectionTexture 0:21:0:39
//texture texture2D sc_RayTracedShadowTexture 0:22:0:40
//texture texture2D sc_SSAOTexture 0:23:0:41
//texture texture2D sc_ScreenTexture 0:24:0:42
//texture texture2D sc_ShadowTexture 0:25:0:43
//texture utexture2D z_hitIdAndBarycentric 0:27:0:45
//texture texture2D z_rayDirections 0:28:0:46
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:47:6192 {
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
//float3x3 backCapTexTransform 4608
//float4 backCapTexUvMinMax 4656
//float4 backCapTexBorderColor 4672
//float2 backCapTexScale 4688
//float2 backCapTexOffset 4696
//float4 backCapStartingColor 4704
//float4 backCapEndingColor 4720
//float backCapGradientRamp 4736
//float backCapMetallic 4740
//float backCapRoughness 4744
//float3x3 frontCapTexTransform 4800
//float4 frontCapTexUvMinMax 4848
//float4 frontCapTexBorderColor 4864
//float2 frontCapTexScale 4880
//float2 frontCapTexOffset 4888
//float4 frontCapStartingColor 4896
//float4 frontCapEndingColor 4912
//float frontCapGradientRamp 4928
//float frontCapMetallic 4932
//float frontCapRoughness 4936
//float3x3 outerEdgeTexTransform 4992
//float4 outerEdgeTexUvMinMax 5040
//float4 outerEdgeTexBorderColor 5056
//float2 outerEdgeTexScale 5072
//float2 outerEdgeTexOffset 5080
//float4 outerEdgeStartingColor 5088
//float4 outerEdgeEndingColor 5104
//float outerEdgeGradientRamp 5120
//float outerEdgeMetallic 5124
//float outerRoughness 5128
//float3x3 InnerEdgeTexTransform 5184
//float4 InnerEdgeTexUvMinMax 5232
//float4 InnerEdgeTexBorderColor 5248
//float2 InnerEdgeTexScale 5264
//float2 InnerEdgeTexOffset 5272
//float4 InnerEdgeStartingColor 5280
//float4 InnerEdgeEndingColor 5296
//float InnerEdgeGradientRamp 5312
//float InnerEdgeMetallic 5316
//float InnerEdgeRoughness 5320
//float Port_Input0_N143 5360
//float Port_Input1_N143 5364
//float Port_RangeMinA_N132 5368
//float Port_RangeMaxA_N132 5372
//float Port_RangeMinB_N132 5376
//float Port_RangeMaxB_N132 5380
//float2 Port_Import_N133 5384
//float2 Port_Center_N134 5392
//float2 Port_Import_N135 5400
//float Port_RangeMinA_N164 5408
//float Port_RangeMaxA_N164 5412
//float Port_RangeMinB_N164 5416
//float Port_RangeMaxB_N164 5420
//float Port_Input1_N142 5432
//float Port_Input2_N142 5436
//float4 Port_Default_N146 5440
//float Port_Opacity_N149 5456
//float3 Port_Emissive_N149 5488
//float3 Port_AO_N149 5504
//float3 Port_SpecularAO_N149 5520
//float Port_Input0_N112 5568
//float Port_Input1_N112 5572
//float Port_RangeMinA_N101 5576
//float Port_RangeMaxA_N101 5580
//float Port_RangeMinB_N101 5584
//float Port_RangeMaxB_N101 5588
//float2 Port_Import_N102 5592
//float2 Port_Center_N103 5600
//float2 Port_Import_N104 5608
//float Port_RangeMinA_N160 5616
//float Port_RangeMaxA_N160 5620
//float Port_RangeMinB_N160 5624
//float Port_RangeMaxB_N160 5628
//float Port_Input1_N111 5640
//float Port_Input2_N111 5644
//float4 Port_Default_N010 5648
//float Port_Opacity_N118 5664
//float3 Port_Emissive_N118 5696
//float3 Port_AO_N118 5712
//float3 Port_SpecularAO_N118 5728
//float Port_Input1_N054 5744
//float Port_Input0_N066 5792
//float Port_Input1_N066 5796
//float Port_RangeMinA_N033 5800
//float Port_RangeMaxA_N033 5804
//float Port_RangeMinB_N033 5808
//float Port_RangeMaxB_N033 5812
//float2 Port_Import_N017 5816
//float2 Port_Center_N047 5824
//float2 Port_Import_N058 5832
//float Port_RangeMinA_N153 5840
//float Port_RangeMaxA_N153 5844
//float Port_RangeMinB_N153 5848
//float Port_RangeMaxB_N153 5852
//float Port_Input1_N065 5864
//float Port_Input2_N065 5868
//float4 Port_Default_N046 5872
//float Port_Opacity_N057 5888
//float3 Port_Emissive_N057 5920
//float3 Port_AO_N057 5936
//float3 Port_SpecularAO_N057 5952
//float Port_Input0_N035 6000
//float Port_Input1_N035 6004
//float Port_RangeMinA_N023 6008
//float Port_RangeMaxA_N023 6012
//float Port_RangeMinB_N023 6016
//float Port_RangeMaxB_N023 6020
//float2 Port_Import_N024 6024
//float2 Port_Center_N025 6032
//float2 Port_Import_N026 6040
//float Port_RangeMinA_N155 6048
//float Port_RangeMaxA_N155 6052
//float Port_RangeMinB_N155 6056
//float Port_RangeMaxB_N155 6060
//float Port_Input1_N034 6072
//float Port_Input2_N034 6076
//float4 Port_Default_N077 6080
//float Port_Opacity_N080 6096
//float3 Port_Emissive_N080 6128
//float3 Port_AO_N080 6144
//float3 Port_SpecularAO_N080 6160
//float Port_Input1_N043 6176
//float Port_Input1_N014 6180
//float depthRef 6184
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
//spec_const bool InnerEdgeTexHasSwappedViews 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_InnerEdgeTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_backCapTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_frontCapTex 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_outerEdgeTex 36 0
//spec_const bool SC_USE_UV_MIN_MAX_InnerEdgeTex 37 0
//spec_const bool SC_USE_UV_MIN_MAX_backCapTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_frontCapTex 39 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 40 0
//spec_const bool SC_USE_UV_MIN_MAX_outerEdgeTex 41 0
//spec_const bool SC_USE_UV_TRANSFORM_InnerEdgeTex 42 0
//spec_const bool SC_USE_UV_TRANSFORM_backCapTex 43 0
//spec_const bool SC_USE_UV_TRANSFORM_frontCapTex 44 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 45 0
//spec_const bool SC_USE_UV_TRANSFORM_outerEdgeTex 46 0
//spec_const bool UseViewSpaceDepthVariant 47 1
//spec_const bool backCapPBR 48 0
//spec_const bool backCapTexHasSwappedViews 49 0
//spec_const bool frontCapPBR 50 0
//spec_const bool frontCapTexHasSwappedViews 51 0
//spec_const bool innerEdgePBR 52 0
//spec_const bool intensityTextureHasSwappedViews 53 0
//spec_const bool outerEdgePBR 54 0
//spec_const bool outerEdgeTexHasSwappedViews 55 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 56 0
//spec_const bool sc_BlendMode_Add 57 0
//spec_const bool sc_BlendMode_AlphaTest 58 0
//spec_const bool sc_BlendMode_AlphaToCoverage 59 0
//spec_const bool sc_BlendMode_ColoredGlass 60 0
//spec_const bool sc_BlendMode_Custom 61 0
//spec_const bool sc_BlendMode_Max 62 0
//spec_const bool sc_BlendMode_Min 63 0
//spec_const bool sc_BlendMode_MultiplyOriginal 64 0
//spec_const bool sc_BlendMode_Multiply 65 0
//spec_const bool sc_BlendMode_Normal 66 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 67 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 68 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 69 0
//spec_const bool sc_BlendMode_Screen 70 0
//spec_const bool sc_DepthOnly 71 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 72 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 73 0
//spec_const bool sc_FramebufferFetch 74 0
//spec_const bool sc_HasDiffuseEnvmap 75 0
//spec_const bool sc_LightEstimation 76 0
//spec_const bool sc_MotionVectorsPass 77 0
//spec_const bool sc_OITCompositingPass 78 0
//spec_const bool sc_OITDepthBoundsPass 79 0
//spec_const bool sc_OITDepthGatherPass 80 0
//spec_const bool sc_ProjectiveShadowsCaster 81 0
//spec_const bool sc_ProjectiveShadowsReceiver 82 0
//spec_const bool sc_ProxyAlphaOne 83 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 84 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 85 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 86 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 87 0
//spec_const bool sc_RenderAlphaToColor 88 0
//spec_const bool sc_SSAOEnabled 89 0
//spec_const bool sc_ScreenTextureHasSwappedViews 90 0
//spec_const bool sc_ShaderComplexityAnalyzer 91 0
//spec_const bool sc_TAAEnabled 92 0
//spec_const bool sc_UseFramebufferFetchMarker 93 0
//spec_const bool sc_VertexBlendingUseNormals 94 0
//spec_const bool sc_VertexBlending 95 0
//spec_const int DROPLIST_BACK_CAP_MODE 96 0
//spec_const int DROPLIST_FRONT_CAP_MODE 97 0
//spec_const int DROPLIST_INNER_EDGE_MODE 98 0
//spec_const int DROPLIST_OUTER_EDGE_MODE 99 0
//spec_const int InnerEdgeTexLayout 100 0
//spec_const int SC_DEVICE_CLASS 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_backCapTex 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_frontCapTex 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_backCapTex 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_frontCapTex 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex 111 -1
//spec_const int backCapTexLayout 112 0
//spec_const int frontCapTexLayout 113 0
//spec_const int intensityTextureLayout 114 0
//spec_const int outerEdgeTexLayout 115 0
//spec_const int sc_AmbientLightMode0 116 0
//spec_const int sc_AmbientLightMode1 117 0
//spec_const int sc_AmbientLightMode2 118 0
//spec_const int sc_AmbientLightMode_Constant 119 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 120 0
//spec_const int sc_AmbientLightMode_FromCamera 121 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 122 0
//spec_const int sc_AmbientLightsCount 123 0
//spec_const int sc_DepthBufferMode 124 0
//spec_const int sc_DirectionalLightsCount 125 0
//spec_const int sc_EnvLightMode 126 0
//spec_const int sc_EnvmapDiffuseLayout 127 0
//spec_const int sc_EnvmapSpecularLayout 128 0
//spec_const int sc_LightEstimationSGCount 129 0
//spec_const int sc_MaxTextureImageUnits 130 0
//spec_const int sc_PointLightsCount 131 0
//spec_const int sc_RayTracedAoTextureLayout 132 0
//spec_const int sc_RayTracedDiffIndTextureLayout 133 0
//spec_const int sc_RayTracedReflectionTextureLayout 134 0
//spec_const int sc_RayTracedShadowTextureLayout 135 0
//spec_const int sc_RenderingSpace 136 -1
//spec_const int sc_ScreenTextureLayout 137 0
//spec_const int sc_ShaderCacheConstant 138 0
//spec_const int sc_SkinBonesCount 139 0
//spec_const int sc_StereoRenderingMode 140 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 141 0
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
constant bool InnerEdgeTexHasSwappedViews [[function_constant(31)]];
constant bool InnerEdgeTexHasSwappedViews_tmp = is_function_constant_defined(InnerEdgeTexHasSwappedViews) ? InnerEdgeTexHasSwappedViews : false;
constant bool SC_USE_CLAMP_TO_BORDER_InnerEdgeTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_InnerEdgeTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex) ? SC_USE_CLAMP_TO_BORDER_InnerEdgeTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_backCapTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_backCapTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_backCapTex) ? SC_USE_CLAMP_TO_BORDER_backCapTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_frontCapTex [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_frontCapTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_frontCapTex) ? SC_USE_CLAMP_TO_BORDER_frontCapTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_outerEdgeTex [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_outerEdgeTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_outerEdgeTex) ? SC_USE_CLAMP_TO_BORDER_outerEdgeTex : false;
constant bool SC_USE_UV_MIN_MAX_InnerEdgeTex [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_InnerEdgeTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_InnerEdgeTex) ? SC_USE_UV_MIN_MAX_InnerEdgeTex : false;
constant bool SC_USE_UV_MIN_MAX_backCapTex [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_backCapTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_backCapTex) ? SC_USE_UV_MIN_MAX_backCapTex : false;
constant bool SC_USE_UV_MIN_MAX_frontCapTex [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_frontCapTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_frontCapTex) ? SC_USE_UV_MIN_MAX_frontCapTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_outerEdgeTex [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_outerEdgeTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_outerEdgeTex) ? SC_USE_UV_MIN_MAX_outerEdgeTex : false;
constant bool SC_USE_UV_TRANSFORM_InnerEdgeTex [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_InnerEdgeTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_InnerEdgeTex) ? SC_USE_UV_TRANSFORM_InnerEdgeTex : false;
constant bool SC_USE_UV_TRANSFORM_backCapTex [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_backCapTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_backCapTex) ? SC_USE_UV_TRANSFORM_backCapTex : false;
constant bool SC_USE_UV_TRANSFORM_frontCapTex [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_frontCapTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_frontCapTex) ? SC_USE_UV_TRANSFORM_frontCapTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_outerEdgeTex [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_outerEdgeTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_outerEdgeTex) ? SC_USE_UV_TRANSFORM_outerEdgeTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(47)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool backCapPBR [[function_constant(48)]];
constant bool backCapPBR_tmp = is_function_constant_defined(backCapPBR) ? backCapPBR : false;
constant bool backCapTexHasSwappedViews [[function_constant(49)]];
constant bool backCapTexHasSwappedViews_tmp = is_function_constant_defined(backCapTexHasSwappedViews) ? backCapTexHasSwappedViews : false;
constant bool frontCapPBR [[function_constant(50)]];
constant bool frontCapPBR_tmp = is_function_constant_defined(frontCapPBR) ? frontCapPBR : false;
constant bool frontCapTexHasSwappedViews [[function_constant(51)]];
constant bool frontCapTexHasSwappedViews_tmp = is_function_constant_defined(frontCapTexHasSwappedViews) ? frontCapTexHasSwappedViews : false;
constant bool innerEdgePBR [[function_constant(52)]];
constant bool innerEdgePBR_tmp = is_function_constant_defined(innerEdgePBR) ? innerEdgePBR : false;
constant bool intensityTextureHasSwappedViews [[function_constant(53)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool outerEdgePBR [[function_constant(54)]];
constant bool outerEdgePBR_tmp = is_function_constant_defined(outerEdgePBR) ? outerEdgePBR : false;
constant bool outerEdgeTexHasSwappedViews [[function_constant(55)]];
constant bool outerEdgeTexHasSwappedViews_tmp = is_function_constant_defined(outerEdgeTexHasSwappedViews) ? outerEdgeTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(56)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(57)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(58)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(59)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(60)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(61)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(62)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(63)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(64)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(65)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(66)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(67)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(68)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(69)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(70)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(71)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(72)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(73)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(74)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(75)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(76)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(77)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(78)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(79)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(80)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(81)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(82)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(83)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(84)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(85)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(86)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(87)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(88)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(89)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(90)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(91)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(92)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(93)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(94)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(95)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int DROPLIST_BACK_CAP_MODE [[function_constant(96)]];
constant int DROPLIST_BACK_CAP_MODE_tmp = is_function_constant_defined(DROPLIST_BACK_CAP_MODE) ? DROPLIST_BACK_CAP_MODE : 0;
constant int DROPLIST_FRONT_CAP_MODE [[function_constant(97)]];
constant int DROPLIST_FRONT_CAP_MODE_tmp = is_function_constant_defined(DROPLIST_FRONT_CAP_MODE) ? DROPLIST_FRONT_CAP_MODE : 0;
constant int DROPLIST_INNER_EDGE_MODE [[function_constant(98)]];
constant int DROPLIST_INNER_EDGE_MODE_tmp = is_function_constant_defined(DROPLIST_INNER_EDGE_MODE) ? DROPLIST_INNER_EDGE_MODE : 0;
constant int DROPLIST_OUTER_EDGE_MODE [[function_constant(99)]];
constant int DROPLIST_OUTER_EDGE_MODE_tmp = is_function_constant_defined(DROPLIST_OUTER_EDGE_MODE) ? DROPLIST_OUTER_EDGE_MODE : 0;
constant int InnerEdgeTexLayout [[function_constant(100)]];
constant int InnerEdgeTexLayout_tmp = is_function_constant_defined(InnerEdgeTexLayout) ? InnerEdgeTexLayout : 0;
constant int SC_DEVICE_CLASS [[function_constant(101)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex) ? SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_backCapTex [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_U_backCapTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_backCapTex) ? SC_SOFTWARE_WRAP_MODE_U_backCapTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_frontCapTex [[function_constant(104)]];
constant int SC_SOFTWARE_WRAP_MODE_U_frontCapTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_frontCapTex) ? SC_SOFTWARE_WRAP_MODE_U_frontCapTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(105)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex [[function_constant(106)]];
constant int SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex) ? SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex [[function_constant(107)]];
constant int SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex) ? SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_backCapTex [[function_constant(108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_backCapTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_backCapTex) ? SC_SOFTWARE_WRAP_MODE_V_backCapTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_frontCapTex [[function_constant(109)]];
constant int SC_SOFTWARE_WRAP_MODE_V_frontCapTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_frontCapTex) ? SC_SOFTWARE_WRAP_MODE_V_frontCapTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(110)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex [[function_constant(111)]];
constant int SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex) ? SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex : -1;
constant int backCapTexLayout [[function_constant(112)]];
constant int backCapTexLayout_tmp = is_function_constant_defined(backCapTexLayout) ? backCapTexLayout : 0;
constant int frontCapTexLayout [[function_constant(113)]];
constant int frontCapTexLayout_tmp = is_function_constant_defined(frontCapTexLayout) ? frontCapTexLayout : 0;
constant int intensityTextureLayout [[function_constant(114)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int outerEdgeTexLayout [[function_constant(115)]];
constant int outerEdgeTexLayout_tmp = is_function_constant_defined(outerEdgeTexLayout) ? outerEdgeTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(116)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(117)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(118)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(119)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(120)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(121)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(122)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(123)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(124)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(125)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(126)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(127)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(128)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(129)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(130)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(131)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(132)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(133)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(134)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(135)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
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
float4 backCapTexSize;
float4 backCapTexDims;
float4 backCapTexView;
float3x3 backCapTexTransform;
float4 backCapTexUvMinMax;
float4 backCapTexBorderColor;
float2 backCapTexScale;
float2 backCapTexOffset;
float4 backCapStartingColor;
float4 backCapEndingColor;
float backCapGradientRamp;
float backCapMetallic;
float backCapRoughness;
float4 frontCapTexSize;
float4 frontCapTexDims;
float4 frontCapTexView;
float3x3 frontCapTexTransform;
float4 frontCapTexUvMinMax;
float4 frontCapTexBorderColor;
float2 frontCapTexScale;
float2 frontCapTexOffset;
float4 frontCapStartingColor;
float4 frontCapEndingColor;
float frontCapGradientRamp;
float frontCapMetallic;
float frontCapRoughness;
float4 outerEdgeTexSize;
float4 outerEdgeTexDims;
float4 outerEdgeTexView;
float3x3 outerEdgeTexTransform;
float4 outerEdgeTexUvMinMax;
float4 outerEdgeTexBorderColor;
float2 outerEdgeTexScale;
float2 outerEdgeTexOffset;
float4 outerEdgeStartingColor;
float4 outerEdgeEndingColor;
float outerEdgeGradientRamp;
float outerEdgeMetallic;
float outerRoughness;
float4 InnerEdgeTexSize;
float4 InnerEdgeTexDims;
float4 InnerEdgeTexView;
float3x3 InnerEdgeTexTransform;
float4 InnerEdgeTexUvMinMax;
float4 InnerEdgeTexBorderColor;
float2 InnerEdgeTexScale;
float2 InnerEdgeTexOffset;
float4 InnerEdgeStartingColor;
float4 InnerEdgeEndingColor;
float InnerEdgeGradientRamp;
float InnerEdgeMetallic;
float InnerEdgeRoughness;
float4 Port_Import_N129;
float4 Port_Import_N130;
float Port_Input0_N143;
float Port_Input1_N143;
float Port_RangeMinA_N132;
float Port_RangeMaxA_N132;
float Port_RangeMinB_N132;
float Port_RangeMaxB_N132;
float2 Port_Import_N133;
float2 Port_Center_N134;
float2 Port_Import_N135;
float Port_RangeMinA_N164;
float Port_RangeMaxA_N164;
float Port_RangeMinB_N164;
float Port_RangeMaxB_N164;
float2 Port_Import_N137;
float Port_Input1_N142;
float Port_Input2_N142;
float4 Port_Default_N146;
float Port_Opacity_N149;
float3 Port_Normal_N149;
float3 Port_Emissive_N149;
float3 Port_AO_N149;
float3 Port_SpecularAO_N149;
float4 Port_Import_N098;
float4 Port_Import_N099;
float Port_Input0_N112;
float Port_Input1_N112;
float Port_RangeMinA_N101;
float Port_RangeMaxA_N101;
float Port_RangeMinB_N101;
float Port_RangeMaxB_N101;
float2 Port_Import_N102;
float2 Port_Center_N103;
float2 Port_Import_N104;
float Port_RangeMinA_N160;
float Port_RangeMaxA_N160;
float Port_RangeMinB_N160;
float Port_RangeMaxB_N160;
float2 Port_Import_N106;
float Port_Input1_N111;
float Port_Input2_N111;
float4 Port_Default_N010;
float Port_Opacity_N118;
float3 Port_Normal_N118;
float3 Port_Emissive_N118;
float3 Port_AO_N118;
float3 Port_SpecularAO_N118;
float Port_Input1_N054;
float4 Port_Import_N038;
float4 Port_Import_N039;
float Port_Input0_N066;
float Port_Input1_N066;
float Port_RangeMinA_N033;
float Port_RangeMaxA_N033;
float Port_RangeMinB_N033;
float Port_RangeMaxB_N033;
float2 Port_Import_N017;
float2 Port_Center_N047;
float2 Port_Import_N058;
float Port_RangeMinA_N153;
float Port_RangeMaxA_N153;
float Port_RangeMinB_N153;
float Port_RangeMaxB_N153;
float2 Port_Import_N060;
float Port_Input1_N065;
float Port_Input2_N065;
float4 Port_Default_N046;
float Port_Opacity_N057;
float3 Port_Normal_N057;
float3 Port_Emissive_N057;
float3 Port_AO_N057;
float3 Port_SpecularAO_N057;
float4 Port_Import_N020;
float4 Port_Import_N021;
float Port_Input0_N035;
float Port_Input1_N035;
float Port_RangeMinA_N023;
float Port_RangeMaxA_N023;
float Port_RangeMinB_N023;
float Port_RangeMaxB_N023;
float2 Port_Import_N024;
float2 Port_Center_N025;
float2 Port_Import_N026;
float Port_RangeMinA_N155;
float Port_RangeMaxA_N155;
float Port_RangeMinB_N155;
float Port_RangeMaxB_N155;
float2 Port_Import_N028;
float Port_Input1_N034;
float Port_Input2_N034;
float4 Port_Default_N077;
float Port_Opacity_N080;
float3 Port_Normal_N080;
float3 Port_Emissive_N080;
float3 Port_AO_N080;
float3 Port_SpecularAO_N080;
float Port_Input1_N043;
float Port_Input1_N014;
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
texture2d<float> InnerEdgeTex [[id(4)]];
texture2d<float> backCapTex [[id(5)]];
texture2d<float> frontCapTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> outerEdgeTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(21)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler InnerEdgeTexSmpSC [[id(29)]];
sampler backCapTexSmpSC [[id(30)]];
sampler frontCapTexSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler outerEdgeTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
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
float4 backCapTexSize;
float4 backCapTexDims;
float4 backCapTexView;
float3x3 backCapTexTransform;
float4 backCapTexUvMinMax;
float4 backCapTexBorderColor;
float2 backCapTexScale;
float2 backCapTexOffset;
float4 backCapStartingColor;
float4 backCapEndingColor;
float backCapGradientRamp;
float backCapMetallic;
float backCapRoughness;
float4 frontCapTexSize;
float4 frontCapTexDims;
float4 frontCapTexView;
float3x3 frontCapTexTransform;
float4 frontCapTexUvMinMax;
float4 frontCapTexBorderColor;
float2 frontCapTexScale;
float2 frontCapTexOffset;
float4 frontCapStartingColor;
float4 frontCapEndingColor;
float frontCapGradientRamp;
float frontCapMetallic;
float frontCapRoughness;
float4 outerEdgeTexSize;
float4 outerEdgeTexDims;
float4 outerEdgeTexView;
float3x3 outerEdgeTexTransform;
float4 outerEdgeTexUvMinMax;
float4 outerEdgeTexBorderColor;
float2 outerEdgeTexScale;
float2 outerEdgeTexOffset;
float4 outerEdgeStartingColor;
float4 outerEdgeEndingColor;
float outerEdgeGradientRamp;
float outerEdgeMetallic;
float outerRoughness;
float4 InnerEdgeTexSize;
float4 InnerEdgeTexDims;
float4 InnerEdgeTexView;
float3x3 InnerEdgeTexTransform;
float4 InnerEdgeTexUvMinMax;
float4 InnerEdgeTexBorderColor;
float2 InnerEdgeTexScale;
float2 InnerEdgeTexOffset;
float4 InnerEdgeStartingColor;
float4 InnerEdgeEndingColor;
float InnerEdgeGradientRamp;
float InnerEdgeMetallic;
float InnerEdgeRoughness;
float4 Port_Import_N129;
float4 Port_Import_N130;
float Port_Input0_N143;
float Port_Input1_N143;
float Port_RangeMinA_N132;
float Port_RangeMaxA_N132;
float Port_RangeMinB_N132;
float Port_RangeMaxB_N132;
float2 Port_Import_N133;
float2 Port_Center_N134;
float2 Port_Import_N135;
float Port_RangeMinA_N164;
float Port_RangeMaxA_N164;
float Port_RangeMinB_N164;
float Port_RangeMaxB_N164;
float2 Port_Import_N137;
float Port_Input1_N142;
float Port_Input2_N142;
float4 Port_Default_N146;
float Port_Opacity_N149;
float3 Port_Normal_N149;
float3 Port_Emissive_N149;
float3 Port_AO_N149;
float3 Port_SpecularAO_N149;
float4 Port_Import_N098;
float4 Port_Import_N099;
float Port_Input0_N112;
float Port_Input1_N112;
float Port_RangeMinA_N101;
float Port_RangeMaxA_N101;
float Port_RangeMinB_N101;
float Port_RangeMaxB_N101;
float2 Port_Import_N102;
float2 Port_Center_N103;
float2 Port_Import_N104;
float Port_RangeMinA_N160;
float Port_RangeMaxA_N160;
float Port_RangeMinB_N160;
float Port_RangeMaxB_N160;
float2 Port_Import_N106;
float Port_Input1_N111;
float Port_Input2_N111;
float4 Port_Default_N010;
float Port_Opacity_N118;
float3 Port_Normal_N118;
float3 Port_Emissive_N118;
float3 Port_AO_N118;
float3 Port_SpecularAO_N118;
float Port_Input1_N054;
float4 Port_Import_N038;
float4 Port_Import_N039;
float Port_Input0_N066;
float Port_Input1_N066;
float Port_RangeMinA_N033;
float Port_RangeMaxA_N033;
float Port_RangeMinB_N033;
float Port_RangeMaxB_N033;
float2 Port_Import_N017;
float2 Port_Center_N047;
float2 Port_Import_N058;
float Port_RangeMinA_N153;
float Port_RangeMaxA_N153;
float Port_RangeMinB_N153;
float Port_RangeMaxB_N153;
float2 Port_Import_N060;
float Port_Input1_N065;
float Port_Input2_N065;
float4 Port_Default_N046;
float Port_Opacity_N057;
float3 Port_Normal_N057;
float3 Port_Emissive_N057;
float3 Port_AO_N057;
float3 Port_SpecularAO_N057;
float4 Port_Import_N020;
float4 Port_Import_N021;
float Port_Input0_N035;
float Port_Input1_N035;
float Port_RangeMinA_N023;
float Port_RangeMaxA_N023;
float Port_RangeMinB_N023;
float Port_RangeMaxB_N023;
float2 Port_Import_N024;
float2 Port_Center_N025;
float2 Port_Import_N026;
float Port_RangeMinA_N155;
float Port_RangeMaxA_N155;
float Port_RangeMinB_N155;
float Port_RangeMaxB_N155;
float2 Port_Import_N028;
float Port_Input1_N034;
float Port_Input2_N034;
float4 Port_Default_N077;
float Port_Opacity_N080;
float3 Port_Normal_N080;
float3 Port_Emissive_N080;
float3 Port_AO_N080;
float3 Port_SpecularAO_N080;
float Port_Input1_N043;
float Port_Input1_N014;
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
texture2d<float> InnerEdgeTex [[id(4)]];
texture2d<float> backCapTex [[id(5)]];
texture2d<float> frontCapTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> outerEdgeTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(21)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler InnerEdgeTexSmpSC [[id(29)]];
sampler backCapTexSmpSC [[id(30)]];
sampler frontCapTexSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler outerEdgeTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
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
Globals.Surface_UVCoord0=rhp.uv0;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.Surface_UVCoord0=in.varPackedTex.xy;
}
float4 Output_N150=float4(0.0);
float4 param=float4(1.0);
float4 param_1=float4(1.0,0.0,0.0,0.0);
ssGlobals param_3=Globals;
float4 param_2;
if ((int(backCapPBR_tmp)!=0))
{
float4 l9_5=float4(0.0);
float4 l9_6=float4(0.0);
float4 l9_7=float4(0.0);
float4 l9_8=float4(0.0);
float4 l9_9=(*sc_set0.UserUniforms).Port_Default_N146;
ssGlobals l9_10=param_3;
float4 l9_11;
if (DROPLIST_BACK_CAP_MODE_tmp==0)
{
float2 l9_12=float2(0.0);
l9_12=l9_10.Surface_UVCoord0;
float2 l9_13=float2(0.0);
float2 l9_14=(*sc_set0.UserUniforms).backCapTexScale;
l9_13=l9_14;
float2 l9_15=float2(0.0);
float2 l9_16=(*sc_set0.UserUniforms).backCapTexOffset;
l9_15=l9_16;
float2 l9_17=float2(0.0);
l9_17=(l9_12*l9_13)+l9_15;
float4 l9_18=float4(0.0);
int l9_19=0;
if ((int(backCapTexHasSwappedViews_tmp)!=0))
{
int l9_20=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_20=0;
}
else
{
l9_20=in.varStereoViewID;
}
int l9_21=l9_20;
l9_19=1-l9_21;
}
else
{
int l9_22=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_22=0;
}
else
{
l9_22=in.varStereoViewID;
}
int l9_23=l9_22;
l9_19=l9_23;
}
int l9_24=l9_19;
int l9_25=backCapTexLayout_tmp;
int l9_26=l9_24;
float2 l9_27=l9_17;
bool l9_28=(int(SC_USE_UV_TRANSFORM_backCapTex_tmp)!=0);
float3x3 l9_29=(*sc_set0.UserUniforms).backCapTexTransform;
int2 l9_30=int2(SC_SOFTWARE_WRAP_MODE_U_backCapTex_tmp,SC_SOFTWARE_WRAP_MODE_V_backCapTex_tmp);
bool l9_31=(int(SC_USE_UV_MIN_MAX_backCapTex_tmp)!=0);
float4 l9_32=(*sc_set0.UserUniforms).backCapTexUvMinMax;
bool l9_33=(int(SC_USE_CLAMP_TO_BORDER_backCapTex_tmp)!=0);
float4 l9_34=(*sc_set0.UserUniforms).backCapTexBorderColor;
float l9_35=0.0;
bool l9_36=l9_33&&(!l9_31);
float l9_37=1.0;
float l9_38=l9_27.x;
int l9_39=l9_30.x;
if (l9_39==1)
{
l9_38=fract(l9_38);
}
else
{
if (l9_39==2)
{
float l9_40=fract(l9_38);
float l9_41=l9_38-l9_40;
float l9_42=step(0.25,fract(l9_41*0.5));
l9_38=mix(l9_40,1.0-l9_40,fast::clamp(l9_42,0.0,1.0));
}
}
l9_27.x=l9_38;
float l9_43=l9_27.y;
int l9_44=l9_30.y;
if (l9_44==1)
{
l9_43=fract(l9_43);
}
else
{
if (l9_44==2)
{
float l9_45=fract(l9_43);
float l9_46=l9_43-l9_45;
float l9_47=step(0.25,fract(l9_46*0.5));
l9_43=mix(l9_45,1.0-l9_45,fast::clamp(l9_47,0.0,1.0));
}
}
l9_27.y=l9_43;
if (l9_31)
{
bool l9_48=l9_33;
bool l9_49;
if (l9_48)
{
l9_49=l9_30.x==3;
}
else
{
l9_49=l9_48;
}
float l9_50=l9_27.x;
float l9_51=l9_32.x;
float l9_52=l9_32.z;
bool l9_53=l9_49;
float l9_54=l9_37;
float l9_55=fast::clamp(l9_50,l9_51,l9_52);
float l9_56=step(abs(l9_50-l9_55),9.9999997e-06);
l9_54*=(l9_56+((1.0-float(l9_53))*(1.0-l9_56)));
l9_50=l9_55;
l9_27.x=l9_50;
l9_37=l9_54;
bool l9_57=l9_33;
bool l9_58;
if (l9_57)
{
l9_58=l9_30.y==3;
}
else
{
l9_58=l9_57;
}
float l9_59=l9_27.y;
float l9_60=l9_32.y;
float l9_61=l9_32.w;
bool l9_62=l9_58;
float l9_63=l9_37;
float l9_64=fast::clamp(l9_59,l9_60,l9_61);
float l9_65=step(abs(l9_59-l9_64),9.9999997e-06);
l9_63*=(l9_65+((1.0-float(l9_62))*(1.0-l9_65)));
l9_59=l9_64;
l9_27.y=l9_59;
l9_37=l9_63;
}
float2 l9_66=l9_27;
bool l9_67=l9_28;
float3x3 l9_68=l9_29;
if (l9_67)
{
l9_66=float2((l9_68*float3(l9_66,1.0)).xy);
}
float2 l9_69=l9_66;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
l9_27=l9_71;
float l9_72=l9_27.x;
int l9_73=l9_30.x;
bool l9_74=l9_36;
float l9_75=l9_37;
if ((l9_73==0)||(l9_73==3))
{
float l9_76=l9_72;
float l9_77=0.0;
float l9_78=1.0;
bool l9_79=l9_74;
float l9_80=l9_75;
float l9_81=fast::clamp(l9_76,l9_77,l9_78);
float l9_82=step(abs(l9_76-l9_81),9.9999997e-06);
l9_80*=(l9_82+((1.0-float(l9_79))*(1.0-l9_82)));
l9_76=l9_81;
l9_72=l9_76;
l9_75=l9_80;
}
l9_27.x=l9_72;
l9_37=l9_75;
float l9_83=l9_27.y;
int l9_84=l9_30.y;
bool l9_85=l9_36;
float l9_86=l9_37;
if ((l9_84==0)||(l9_84==3))
{
float l9_87=l9_83;
float l9_88=0.0;
float l9_89=1.0;
bool l9_90=l9_85;
float l9_91=l9_86;
float l9_92=fast::clamp(l9_87,l9_88,l9_89);
float l9_93=step(abs(l9_87-l9_92),9.9999997e-06);
l9_91*=(l9_93+((1.0-float(l9_90))*(1.0-l9_93)));
l9_87=l9_92;
l9_83=l9_87;
l9_86=l9_91;
}
l9_27.y=l9_83;
l9_37=l9_86;
float2 l9_94=l9_27;
int l9_95=l9_25;
int l9_96=l9_26;
float l9_97=l9_35;
float2 l9_98=l9_94;
int l9_99=l9_95;
int l9_100=l9_96;
float3 l9_101=float3(0.0);
if (l9_99==0)
{
l9_101=float3(l9_98,0.0);
}
else
{
if (l9_99==1)
{
l9_101=float3(l9_98.x,(l9_98.y*0.5)+(0.5-(float(l9_100)*0.5)),0.0);
}
else
{
l9_101=float3(l9_98,float(l9_100));
}
}
float3 l9_102=l9_101;
float3 l9_103=l9_102;
float2 l9_104=l9_103.xy;
float l9_105=l9_97;
float4 l9_106=sc_set0.backCapTex.sample(sc_set0.backCapTexSmpSC,l9_104,bias(l9_105));
float4 l9_107=l9_106;
float4 l9_108=l9_107;
if (l9_33)
{
l9_108=mix(l9_34,l9_108,float4(l9_37));
}
float4 l9_109=l9_108;
l9_18=l9_109;
l9_6=l9_18;
l9_11=l9_6;
}
else
{
if (DROPLIST_BACK_CAP_MODE_tmp==1)
{
float4 l9_110=float4(0.0);
float4 l9_111=(*sc_set0.UserUniforms).backCapStartingColor;
l9_110=l9_111;
float4 l9_112=float4(0.0);
l9_112=l9_110;
float4 l9_113=float4(0.0);
float4 l9_114=(*sc_set0.UserUniforms).backCapEndingColor;
l9_113=l9_114;
float4 l9_115=float4(0.0);
l9_115=l9_113;
float2 l9_116=float2(0.0);
l9_116=l9_10.Surface_UVCoord0;
float2 l9_117=float2(0.0);
l9_117=(((l9_116-float2((*sc_set0.UserUniforms).Port_RangeMinA_N132))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N132-(*sc_set0.UserUniforms).Port_RangeMinA_N132)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N132-(*sc_set0.UserUniforms).Port_RangeMinB_N132))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N132);
float2 l9_118=float2(0.0);
l9_118=(*sc_set0.UserUniforms).Port_Import_N133;
float2 l9_119=float2(0.0);
l9_119=((l9_117-(*sc_set0.UserUniforms).Port_Center_N134)*l9_118)+(*sc_set0.UserUniforms).Port_Center_N134;
float2 l9_120=float2(0.0);
l9_120=(*sc_set0.UserUniforms).Port_Import_N135;
float2 l9_121=float2(0.0);
l9_121=l9_119-l9_120;
float l9_122=0.0;
float l9_123=(*sc_set0.UserUniforms).backCapGradientRamp;
l9_122=l9_123;
float l9_124=0.0;
l9_124=(((l9_122-(*sc_set0.UserUniforms).Port_RangeMinA_N164)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N164-(*sc_set0.UserUniforms).Port_RangeMinA_N164)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N164-(*sc_set0.UserUniforms).Port_RangeMinB_N164))+(*sc_set0.UserUniforms).Port_RangeMinB_N164;
float2 l9_125=float2(0.0);
l9_125=float2(0.0,float2(l9_124).y);
float2 l9_126=float2(0.0);
l9_126=l9_125;
float2 l9_127=float2(0.0);
l9_127=l9_126-l9_120;
float l9_128=0.0;
l9_128=dot(l9_121,l9_127);
float l9_129=0.0;
l9_129=dot(l9_127,l9_127);
float l9_130=0.0;
l9_130=l9_128/(l9_129+1.234e-06);
float l9_131=0.0;
l9_131=fast::clamp(l9_130+0.001,(*sc_set0.UserUniforms).Port_Input1_N142+0.001,(*sc_set0.UserUniforms).Port_Input2_N142+0.001)-0.001;
float l9_132=0.0;
l9_132=smoothstep((*sc_set0.UserUniforms).Port_Input0_N143,(*sc_set0.UserUniforms).Port_Input1_N143,l9_131);
float4 l9_133=float4(0.0);
l9_133=mix(l9_112,l9_115,float4(l9_132));
float4 l9_134=float4(0.0);
l9_134=l9_133;
l9_7=l9_134;
l9_11=l9_7;
}
else
{
if (DROPLIST_BACK_CAP_MODE_tmp==2)
{
float4 l9_135=float4(0.0);
float4 l9_136=(*sc_set0.UserUniforms).backCapStartingColor;
l9_135=l9_136;
l9_8=l9_135;
l9_11=l9_8;
}
else
{
l9_11=l9_9;
}
}
}
l9_5=l9_11;
float l9_137=0.0;
float l9_138=(*sc_set0.UserUniforms).backCapMetallic;
l9_137=l9_138;
float l9_139=0.0;
float l9_140=(*sc_set0.UserUniforms).backCapRoughness;
l9_139=l9_140;
float4 l9_141=float4(0.0);
float3 l9_142=l9_5.xyz;
float l9_143=(*sc_set0.UserUniforms).Port_Opacity_N149;
float3 l9_144=(*sc_set0.UserUniforms).Port_Emissive_N149;
float l9_145=l9_137;
float l9_146=l9_139;
float3 l9_147=(*sc_set0.UserUniforms).Port_AO_N149;
float3 l9_148=(*sc_set0.UserUniforms).Port_SpecularAO_N149;
ssGlobals l9_149=param_3;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_149.BumpedNormal=l9_149.VertexNormal_WorldSpace;
}
float l9_150=l9_143;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_150<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_151=gl_FragCoord;
float2 l9_152=floor(mod(l9_151.xy,float2(4.0)));
float l9_153=(mod(dot(l9_152,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_150<l9_153)
{
discard_fragment();
}
}
l9_142=fast::max(l9_142,float3(0.0));
float4 l9_154;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_154=float4(l9_142,l9_143);
}
else
{
l9_145=fast::clamp(l9_145,0.0,1.0);
l9_146=fast::clamp(l9_146,0.0,1.0);
float3 l9_155=l9_142;
float l9_156=l9_143;
float3 l9_157=l9_149.BumpedNormal;
float3 l9_158=l9_149.PositionWS;
float3 l9_159=l9_149.ViewDirWS;
float3 l9_160=l9_144;
float l9_161=l9_145;
float l9_162=l9_146;
float3 l9_163=l9_147;
float3 l9_164=l9_148;
l9_154=ngsCalculateLighting(l9_155,l9_156,l9_157,l9_158,l9_159,l9_160,l9_161,l9_162,l9_163,l9_164,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
l9_154=fast::max(l9_154,float4(0.0));
l9_141=l9_154;
param=l9_141;
param_2=param;
}
else
{
float4 l9_165=float4(0.0);
float4 l9_166=float4(0.0);
float4 l9_167=float4(0.0);
float4 l9_168=float4(0.0);
float4 l9_169=(*sc_set0.UserUniforms).Port_Default_N146;
ssGlobals l9_170=param_3;
float4 l9_171;
if (DROPLIST_BACK_CAP_MODE_tmp==0)
{
float2 l9_172=float2(0.0);
l9_172=l9_170.Surface_UVCoord0;
float2 l9_173=float2(0.0);
float2 l9_174=(*sc_set0.UserUniforms).backCapTexScale;
l9_173=l9_174;
float2 l9_175=float2(0.0);
float2 l9_176=(*sc_set0.UserUniforms).backCapTexOffset;
l9_175=l9_176;
float2 l9_177=float2(0.0);
l9_177=(l9_172*l9_173)+l9_175;
float4 l9_178=float4(0.0);
int l9_179=0;
if ((int(backCapTexHasSwappedViews_tmp)!=0))
{
int l9_180=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_180=0;
}
else
{
l9_180=in.varStereoViewID;
}
int l9_181=l9_180;
l9_179=1-l9_181;
}
else
{
int l9_182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_182=0;
}
else
{
l9_182=in.varStereoViewID;
}
int l9_183=l9_182;
l9_179=l9_183;
}
int l9_184=l9_179;
int l9_185=backCapTexLayout_tmp;
int l9_186=l9_184;
float2 l9_187=l9_177;
bool l9_188=(int(SC_USE_UV_TRANSFORM_backCapTex_tmp)!=0);
float3x3 l9_189=(*sc_set0.UserUniforms).backCapTexTransform;
int2 l9_190=int2(SC_SOFTWARE_WRAP_MODE_U_backCapTex_tmp,SC_SOFTWARE_WRAP_MODE_V_backCapTex_tmp);
bool l9_191=(int(SC_USE_UV_MIN_MAX_backCapTex_tmp)!=0);
float4 l9_192=(*sc_set0.UserUniforms).backCapTexUvMinMax;
bool l9_193=(int(SC_USE_CLAMP_TO_BORDER_backCapTex_tmp)!=0);
float4 l9_194=(*sc_set0.UserUniforms).backCapTexBorderColor;
float l9_195=0.0;
bool l9_196=l9_193&&(!l9_191);
float l9_197=1.0;
float l9_198=l9_187.x;
int l9_199=l9_190.x;
if (l9_199==1)
{
l9_198=fract(l9_198);
}
else
{
if (l9_199==2)
{
float l9_200=fract(l9_198);
float l9_201=l9_198-l9_200;
float l9_202=step(0.25,fract(l9_201*0.5));
l9_198=mix(l9_200,1.0-l9_200,fast::clamp(l9_202,0.0,1.0));
}
}
l9_187.x=l9_198;
float l9_203=l9_187.y;
int l9_204=l9_190.y;
if (l9_204==1)
{
l9_203=fract(l9_203);
}
else
{
if (l9_204==2)
{
float l9_205=fract(l9_203);
float l9_206=l9_203-l9_205;
float l9_207=step(0.25,fract(l9_206*0.5));
l9_203=mix(l9_205,1.0-l9_205,fast::clamp(l9_207,0.0,1.0));
}
}
l9_187.y=l9_203;
if (l9_191)
{
bool l9_208=l9_193;
bool l9_209;
if (l9_208)
{
l9_209=l9_190.x==3;
}
else
{
l9_209=l9_208;
}
float l9_210=l9_187.x;
float l9_211=l9_192.x;
float l9_212=l9_192.z;
bool l9_213=l9_209;
float l9_214=l9_197;
float l9_215=fast::clamp(l9_210,l9_211,l9_212);
float l9_216=step(abs(l9_210-l9_215),9.9999997e-06);
l9_214*=(l9_216+((1.0-float(l9_213))*(1.0-l9_216)));
l9_210=l9_215;
l9_187.x=l9_210;
l9_197=l9_214;
bool l9_217=l9_193;
bool l9_218;
if (l9_217)
{
l9_218=l9_190.y==3;
}
else
{
l9_218=l9_217;
}
float l9_219=l9_187.y;
float l9_220=l9_192.y;
float l9_221=l9_192.w;
bool l9_222=l9_218;
float l9_223=l9_197;
float l9_224=fast::clamp(l9_219,l9_220,l9_221);
float l9_225=step(abs(l9_219-l9_224),9.9999997e-06);
l9_223*=(l9_225+((1.0-float(l9_222))*(1.0-l9_225)));
l9_219=l9_224;
l9_187.y=l9_219;
l9_197=l9_223;
}
float2 l9_226=l9_187;
bool l9_227=l9_188;
float3x3 l9_228=l9_189;
if (l9_227)
{
l9_226=float2((l9_228*float3(l9_226,1.0)).xy);
}
float2 l9_229=l9_226;
float2 l9_230=l9_229;
float2 l9_231=l9_230;
l9_187=l9_231;
float l9_232=l9_187.x;
int l9_233=l9_190.x;
bool l9_234=l9_196;
float l9_235=l9_197;
if ((l9_233==0)||(l9_233==3))
{
float l9_236=l9_232;
float l9_237=0.0;
float l9_238=1.0;
bool l9_239=l9_234;
float l9_240=l9_235;
float l9_241=fast::clamp(l9_236,l9_237,l9_238);
float l9_242=step(abs(l9_236-l9_241),9.9999997e-06);
l9_240*=(l9_242+((1.0-float(l9_239))*(1.0-l9_242)));
l9_236=l9_241;
l9_232=l9_236;
l9_235=l9_240;
}
l9_187.x=l9_232;
l9_197=l9_235;
float l9_243=l9_187.y;
int l9_244=l9_190.y;
bool l9_245=l9_196;
float l9_246=l9_197;
if ((l9_244==0)||(l9_244==3))
{
float l9_247=l9_243;
float l9_248=0.0;
float l9_249=1.0;
bool l9_250=l9_245;
float l9_251=l9_246;
float l9_252=fast::clamp(l9_247,l9_248,l9_249);
float l9_253=step(abs(l9_247-l9_252),9.9999997e-06);
l9_251*=(l9_253+((1.0-float(l9_250))*(1.0-l9_253)));
l9_247=l9_252;
l9_243=l9_247;
l9_246=l9_251;
}
l9_187.y=l9_243;
l9_197=l9_246;
float2 l9_254=l9_187;
int l9_255=l9_185;
int l9_256=l9_186;
float l9_257=l9_195;
float2 l9_258=l9_254;
int l9_259=l9_255;
int l9_260=l9_256;
float3 l9_261=float3(0.0);
if (l9_259==0)
{
l9_261=float3(l9_258,0.0);
}
else
{
if (l9_259==1)
{
l9_261=float3(l9_258.x,(l9_258.y*0.5)+(0.5-(float(l9_260)*0.5)),0.0);
}
else
{
l9_261=float3(l9_258,float(l9_260));
}
}
float3 l9_262=l9_261;
float3 l9_263=l9_262;
float2 l9_264=l9_263.xy;
float l9_265=l9_257;
float4 l9_266=sc_set0.backCapTex.sample(sc_set0.backCapTexSmpSC,l9_264,bias(l9_265));
float4 l9_267=l9_266;
float4 l9_268=l9_267;
if (l9_193)
{
l9_268=mix(l9_194,l9_268,float4(l9_197));
}
float4 l9_269=l9_268;
l9_178=l9_269;
l9_166=l9_178;
l9_171=l9_166;
}
else
{
if (DROPLIST_BACK_CAP_MODE_tmp==1)
{
float4 l9_270=float4(0.0);
float4 l9_271=(*sc_set0.UserUniforms).backCapStartingColor;
l9_270=l9_271;
float4 l9_272=float4(0.0);
l9_272=l9_270;
float4 l9_273=float4(0.0);
float4 l9_274=(*sc_set0.UserUniforms).backCapEndingColor;
l9_273=l9_274;
float4 l9_275=float4(0.0);
l9_275=l9_273;
float2 l9_276=float2(0.0);
l9_276=l9_170.Surface_UVCoord0;
float2 l9_277=float2(0.0);
l9_277=(((l9_276-float2((*sc_set0.UserUniforms).Port_RangeMinA_N132))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N132-(*sc_set0.UserUniforms).Port_RangeMinA_N132)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N132-(*sc_set0.UserUniforms).Port_RangeMinB_N132))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N132);
float2 l9_278=float2(0.0);
l9_278=(*sc_set0.UserUniforms).Port_Import_N133;
float2 l9_279=float2(0.0);
l9_279=((l9_277-(*sc_set0.UserUniforms).Port_Center_N134)*l9_278)+(*sc_set0.UserUniforms).Port_Center_N134;
float2 l9_280=float2(0.0);
l9_280=(*sc_set0.UserUniforms).Port_Import_N135;
float2 l9_281=float2(0.0);
l9_281=l9_279-l9_280;
float l9_282=0.0;
float l9_283=(*sc_set0.UserUniforms).backCapGradientRamp;
l9_282=l9_283;
float l9_284=0.0;
l9_284=(((l9_282-(*sc_set0.UserUniforms).Port_RangeMinA_N164)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N164-(*sc_set0.UserUniforms).Port_RangeMinA_N164)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N164-(*sc_set0.UserUniforms).Port_RangeMinB_N164))+(*sc_set0.UserUniforms).Port_RangeMinB_N164;
float2 l9_285=float2(0.0);
l9_285=float2(0.0,float2(l9_284).y);
float2 l9_286=float2(0.0);
l9_286=l9_285;
float2 l9_287=float2(0.0);
l9_287=l9_286-l9_280;
float l9_288=0.0;
l9_288=dot(l9_281,l9_287);
float l9_289=0.0;
l9_289=dot(l9_287,l9_287);
float l9_290=0.0;
l9_290=l9_288/(l9_289+1.234e-06);
float l9_291=0.0;
l9_291=fast::clamp(l9_290+0.001,(*sc_set0.UserUniforms).Port_Input1_N142+0.001,(*sc_set0.UserUniforms).Port_Input2_N142+0.001)-0.001;
float l9_292=0.0;
l9_292=smoothstep((*sc_set0.UserUniforms).Port_Input0_N143,(*sc_set0.UserUniforms).Port_Input1_N143,l9_291);
float4 l9_293=float4(0.0);
l9_293=mix(l9_272,l9_275,float4(l9_292));
float4 l9_294=float4(0.0);
l9_294=l9_293;
l9_167=l9_294;
l9_171=l9_167;
}
else
{
if (DROPLIST_BACK_CAP_MODE_tmp==2)
{
float4 l9_295=float4(0.0);
float4 l9_296=(*sc_set0.UserUniforms).backCapStartingColor;
l9_295=l9_296;
l9_168=l9_295;
l9_171=l9_168;
}
else
{
l9_171=l9_169;
}
}
}
l9_165=l9_171;
param_1=l9_165;
param_2=param_1;
}
Output_N150=param_2;
float4 Output_N120=float4(0.0);
float4 param_4=float4(1.0);
float4 param_5=float4(1.0,0.0,0.0,0.0);
ssGlobals param_7=Globals;
float4 param_6;
if ((int(frontCapPBR_tmp)!=0))
{
float4 l9_297=float4(0.0);
float4 l9_298=float4(0.0);
float4 l9_299=float4(0.0);
float4 l9_300=float4(0.0);
float4 l9_301=(*sc_set0.UserUniforms).Port_Default_N010;
ssGlobals l9_302=param_7;
float4 l9_303;
if (DROPLIST_FRONT_CAP_MODE_tmp==0)
{
float2 l9_304=float2(0.0);
l9_304=l9_302.Surface_UVCoord0;
float2 l9_305=float2(0.0);
float2 l9_306=(*sc_set0.UserUniforms).frontCapTexScale;
l9_305=l9_306;
float2 l9_307=float2(0.0);
float2 l9_308=(*sc_set0.UserUniforms).frontCapTexOffset;
l9_307=l9_308;
float2 l9_309=float2(0.0);
l9_309=(l9_304*l9_305)+l9_307;
float4 l9_310=float4(0.0);
int l9_311=0;
if ((int(frontCapTexHasSwappedViews_tmp)!=0))
{
int l9_312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_312=0;
}
else
{
l9_312=in.varStereoViewID;
}
int l9_313=l9_312;
l9_311=1-l9_313;
}
else
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=in.varStereoViewID;
}
int l9_315=l9_314;
l9_311=l9_315;
}
int l9_316=l9_311;
int l9_317=frontCapTexLayout_tmp;
int l9_318=l9_316;
float2 l9_319=l9_309;
bool l9_320=(int(SC_USE_UV_TRANSFORM_frontCapTex_tmp)!=0);
float3x3 l9_321=(*sc_set0.UserUniforms).frontCapTexTransform;
int2 l9_322=int2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex_tmp,SC_SOFTWARE_WRAP_MODE_V_frontCapTex_tmp);
bool l9_323=(int(SC_USE_UV_MIN_MAX_frontCapTex_tmp)!=0);
float4 l9_324=(*sc_set0.UserUniforms).frontCapTexUvMinMax;
bool l9_325=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex_tmp)!=0);
float4 l9_326=(*sc_set0.UserUniforms).frontCapTexBorderColor;
float l9_327=0.0;
bool l9_328=l9_325&&(!l9_323);
float l9_329=1.0;
float l9_330=l9_319.x;
int l9_331=l9_322.x;
if (l9_331==1)
{
l9_330=fract(l9_330);
}
else
{
if (l9_331==2)
{
float l9_332=fract(l9_330);
float l9_333=l9_330-l9_332;
float l9_334=step(0.25,fract(l9_333*0.5));
l9_330=mix(l9_332,1.0-l9_332,fast::clamp(l9_334,0.0,1.0));
}
}
l9_319.x=l9_330;
float l9_335=l9_319.y;
int l9_336=l9_322.y;
if (l9_336==1)
{
l9_335=fract(l9_335);
}
else
{
if (l9_336==2)
{
float l9_337=fract(l9_335);
float l9_338=l9_335-l9_337;
float l9_339=step(0.25,fract(l9_338*0.5));
l9_335=mix(l9_337,1.0-l9_337,fast::clamp(l9_339,0.0,1.0));
}
}
l9_319.y=l9_335;
if (l9_323)
{
bool l9_340=l9_325;
bool l9_341;
if (l9_340)
{
l9_341=l9_322.x==3;
}
else
{
l9_341=l9_340;
}
float l9_342=l9_319.x;
float l9_343=l9_324.x;
float l9_344=l9_324.z;
bool l9_345=l9_341;
float l9_346=l9_329;
float l9_347=fast::clamp(l9_342,l9_343,l9_344);
float l9_348=step(abs(l9_342-l9_347),9.9999997e-06);
l9_346*=(l9_348+((1.0-float(l9_345))*(1.0-l9_348)));
l9_342=l9_347;
l9_319.x=l9_342;
l9_329=l9_346;
bool l9_349=l9_325;
bool l9_350;
if (l9_349)
{
l9_350=l9_322.y==3;
}
else
{
l9_350=l9_349;
}
float l9_351=l9_319.y;
float l9_352=l9_324.y;
float l9_353=l9_324.w;
bool l9_354=l9_350;
float l9_355=l9_329;
float l9_356=fast::clamp(l9_351,l9_352,l9_353);
float l9_357=step(abs(l9_351-l9_356),9.9999997e-06);
l9_355*=(l9_357+((1.0-float(l9_354))*(1.0-l9_357)));
l9_351=l9_356;
l9_319.y=l9_351;
l9_329=l9_355;
}
float2 l9_358=l9_319;
bool l9_359=l9_320;
float3x3 l9_360=l9_321;
if (l9_359)
{
l9_358=float2((l9_360*float3(l9_358,1.0)).xy);
}
float2 l9_361=l9_358;
float2 l9_362=l9_361;
float2 l9_363=l9_362;
l9_319=l9_363;
float l9_364=l9_319.x;
int l9_365=l9_322.x;
bool l9_366=l9_328;
float l9_367=l9_329;
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
l9_319.x=l9_364;
l9_329=l9_367;
float l9_375=l9_319.y;
int l9_376=l9_322.y;
bool l9_377=l9_328;
float l9_378=l9_329;
if ((l9_376==0)||(l9_376==3))
{
float l9_379=l9_375;
float l9_380=0.0;
float l9_381=1.0;
bool l9_382=l9_377;
float l9_383=l9_378;
float l9_384=fast::clamp(l9_379,l9_380,l9_381);
float l9_385=step(abs(l9_379-l9_384),9.9999997e-06);
l9_383*=(l9_385+((1.0-float(l9_382))*(1.0-l9_385)));
l9_379=l9_384;
l9_375=l9_379;
l9_378=l9_383;
}
l9_319.y=l9_375;
l9_329=l9_378;
float2 l9_386=l9_319;
int l9_387=l9_317;
int l9_388=l9_318;
float l9_389=l9_327;
float2 l9_390=l9_386;
int l9_391=l9_387;
int l9_392=l9_388;
float3 l9_393=float3(0.0);
if (l9_391==0)
{
l9_393=float3(l9_390,0.0);
}
else
{
if (l9_391==1)
{
l9_393=float3(l9_390.x,(l9_390.y*0.5)+(0.5-(float(l9_392)*0.5)),0.0);
}
else
{
l9_393=float3(l9_390,float(l9_392));
}
}
float3 l9_394=l9_393;
float3 l9_395=l9_394;
float2 l9_396=l9_395.xy;
float l9_397=l9_389;
float4 l9_398=sc_set0.frontCapTex.sample(sc_set0.frontCapTexSmpSC,l9_396,bias(l9_397));
float4 l9_399=l9_398;
float4 l9_400=l9_399;
if (l9_325)
{
l9_400=mix(l9_326,l9_400,float4(l9_329));
}
float4 l9_401=l9_400;
l9_310=l9_401;
l9_298=l9_310;
l9_303=l9_298;
}
else
{
if (DROPLIST_FRONT_CAP_MODE_tmp==1)
{
float4 l9_402=float4(0.0);
float4 l9_403=(*sc_set0.UserUniforms).frontCapStartingColor;
l9_402=l9_403;
float4 l9_404=float4(0.0);
l9_404=l9_402;
float4 l9_405=float4(0.0);
float4 l9_406=(*sc_set0.UserUniforms).frontCapEndingColor;
l9_405=l9_406;
float4 l9_407=float4(0.0);
l9_407=l9_405;
float2 l9_408=float2(0.0);
l9_408=l9_302.Surface_UVCoord0;
float2 l9_409=float2(0.0);
l9_409=(((l9_408-float2((*sc_set0.UserUniforms).Port_RangeMinA_N101))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N101-(*sc_set0.UserUniforms).Port_RangeMinA_N101)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N101-(*sc_set0.UserUniforms).Port_RangeMinB_N101))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N101);
float2 l9_410=float2(0.0);
l9_410=(*sc_set0.UserUniforms).Port_Import_N102;
float2 l9_411=float2(0.0);
l9_411=((l9_409-(*sc_set0.UserUniforms).Port_Center_N103)*l9_410)+(*sc_set0.UserUniforms).Port_Center_N103;
float2 l9_412=float2(0.0);
l9_412=(*sc_set0.UserUniforms).Port_Import_N104;
float2 l9_413=float2(0.0);
l9_413=l9_411-l9_412;
float l9_414=0.0;
float l9_415=(*sc_set0.UserUniforms).frontCapGradientRamp;
l9_414=l9_415;
float l9_416=0.0;
l9_416=(((l9_414-(*sc_set0.UserUniforms).Port_RangeMinA_N160)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N160-(*sc_set0.UserUniforms).Port_RangeMinA_N160)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N160-(*sc_set0.UserUniforms).Port_RangeMinB_N160))+(*sc_set0.UserUniforms).Port_RangeMinB_N160;
float2 l9_417=float2(0.0);
l9_417=float2(0.0,float2(l9_416).y);
float2 l9_418=float2(0.0);
l9_418=l9_417;
float2 l9_419=float2(0.0);
l9_419=l9_418-l9_412;
float l9_420=0.0;
l9_420=dot(l9_413,l9_419);
float l9_421=0.0;
l9_421=dot(l9_419,l9_419);
float l9_422=0.0;
l9_422=l9_420/(l9_421+1.234e-06);
float l9_423=0.0;
l9_423=fast::clamp(l9_422+0.001,(*sc_set0.UserUniforms).Port_Input1_N111+0.001,(*sc_set0.UserUniforms).Port_Input2_N111+0.001)-0.001;
float l9_424=0.0;
l9_424=smoothstep((*sc_set0.UserUniforms).Port_Input0_N112,(*sc_set0.UserUniforms).Port_Input1_N112,l9_423);
float4 l9_425=float4(0.0);
l9_425=mix(l9_404,l9_407,float4(l9_424));
float4 l9_426=float4(0.0);
l9_426=l9_425;
l9_299=l9_426;
l9_303=l9_299;
}
else
{
if (DROPLIST_FRONT_CAP_MODE_tmp==2)
{
float4 l9_427=float4(0.0);
float4 l9_428=(*sc_set0.UserUniforms).frontCapStartingColor;
l9_427=l9_428;
l9_300=l9_427;
l9_303=l9_300;
}
else
{
l9_303=l9_301;
}
}
}
l9_297=l9_303;
float l9_429=0.0;
float l9_430=(*sc_set0.UserUniforms).frontCapMetallic;
l9_429=l9_430;
float l9_431=0.0;
float l9_432=(*sc_set0.UserUniforms).frontCapRoughness;
l9_431=l9_432;
float4 l9_433=float4(0.0);
float3 l9_434=l9_297.xyz;
float l9_435=(*sc_set0.UserUniforms).Port_Opacity_N118;
float3 l9_436=(*sc_set0.UserUniforms).Port_Emissive_N118;
float l9_437=l9_429;
float l9_438=l9_431;
float3 l9_439=(*sc_set0.UserUniforms).Port_AO_N118;
float3 l9_440=(*sc_set0.UserUniforms).Port_SpecularAO_N118;
ssGlobals l9_441=param_7;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_441.BumpedNormal=l9_441.VertexNormal_WorldSpace;
}
float l9_442=l9_435;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_442<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_443=gl_FragCoord;
float2 l9_444=floor(mod(l9_443.xy,float2(4.0)));
float l9_445=(mod(dot(l9_444,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_442<l9_445)
{
discard_fragment();
}
}
l9_434=fast::max(l9_434,float3(0.0));
float4 l9_446;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_446=float4(l9_434,l9_435);
}
else
{
l9_437=fast::clamp(l9_437,0.0,1.0);
l9_438=fast::clamp(l9_438,0.0,1.0);
float3 l9_447=l9_434;
float l9_448=l9_435;
float3 l9_449=l9_441.BumpedNormal;
float3 l9_450=l9_441.PositionWS;
float3 l9_451=l9_441.ViewDirWS;
float3 l9_452=l9_436;
float l9_453=l9_437;
float l9_454=l9_438;
float3 l9_455=l9_439;
float3 l9_456=l9_440;
l9_446=ngsCalculateLighting(l9_447,l9_448,l9_449,l9_450,l9_451,l9_452,l9_453,l9_454,l9_455,l9_456,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
l9_446=fast::max(l9_446,float4(0.0));
l9_433=l9_446;
param_4=l9_433;
param_6=param_4;
}
else
{
float4 l9_457=float4(0.0);
float4 l9_458=float4(0.0);
float4 l9_459=float4(0.0);
float4 l9_460=float4(0.0);
float4 l9_461=(*sc_set0.UserUniforms).Port_Default_N010;
ssGlobals l9_462=param_7;
float4 l9_463;
if (DROPLIST_FRONT_CAP_MODE_tmp==0)
{
float2 l9_464=float2(0.0);
l9_464=l9_462.Surface_UVCoord0;
float2 l9_465=float2(0.0);
float2 l9_466=(*sc_set0.UserUniforms).frontCapTexScale;
l9_465=l9_466;
float2 l9_467=float2(0.0);
float2 l9_468=(*sc_set0.UserUniforms).frontCapTexOffset;
l9_467=l9_468;
float2 l9_469=float2(0.0);
l9_469=(l9_464*l9_465)+l9_467;
float4 l9_470=float4(0.0);
int l9_471=0;
if ((int(frontCapTexHasSwappedViews_tmp)!=0))
{
int l9_472=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_472=0;
}
else
{
l9_472=in.varStereoViewID;
}
int l9_473=l9_472;
l9_471=1-l9_473;
}
else
{
int l9_474=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_474=0;
}
else
{
l9_474=in.varStereoViewID;
}
int l9_475=l9_474;
l9_471=l9_475;
}
int l9_476=l9_471;
int l9_477=frontCapTexLayout_tmp;
int l9_478=l9_476;
float2 l9_479=l9_469;
bool l9_480=(int(SC_USE_UV_TRANSFORM_frontCapTex_tmp)!=0);
float3x3 l9_481=(*sc_set0.UserUniforms).frontCapTexTransform;
int2 l9_482=int2(SC_SOFTWARE_WRAP_MODE_U_frontCapTex_tmp,SC_SOFTWARE_WRAP_MODE_V_frontCapTex_tmp);
bool l9_483=(int(SC_USE_UV_MIN_MAX_frontCapTex_tmp)!=0);
float4 l9_484=(*sc_set0.UserUniforms).frontCapTexUvMinMax;
bool l9_485=(int(SC_USE_CLAMP_TO_BORDER_frontCapTex_tmp)!=0);
float4 l9_486=(*sc_set0.UserUniforms).frontCapTexBorderColor;
float l9_487=0.0;
bool l9_488=l9_485&&(!l9_483);
float l9_489=1.0;
float l9_490=l9_479.x;
int l9_491=l9_482.x;
if (l9_491==1)
{
l9_490=fract(l9_490);
}
else
{
if (l9_491==2)
{
float l9_492=fract(l9_490);
float l9_493=l9_490-l9_492;
float l9_494=step(0.25,fract(l9_493*0.5));
l9_490=mix(l9_492,1.0-l9_492,fast::clamp(l9_494,0.0,1.0));
}
}
l9_479.x=l9_490;
float l9_495=l9_479.y;
int l9_496=l9_482.y;
if (l9_496==1)
{
l9_495=fract(l9_495);
}
else
{
if (l9_496==2)
{
float l9_497=fract(l9_495);
float l9_498=l9_495-l9_497;
float l9_499=step(0.25,fract(l9_498*0.5));
l9_495=mix(l9_497,1.0-l9_497,fast::clamp(l9_499,0.0,1.0));
}
}
l9_479.y=l9_495;
if (l9_483)
{
bool l9_500=l9_485;
bool l9_501;
if (l9_500)
{
l9_501=l9_482.x==3;
}
else
{
l9_501=l9_500;
}
float l9_502=l9_479.x;
float l9_503=l9_484.x;
float l9_504=l9_484.z;
bool l9_505=l9_501;
float l9_506=l9_489;
float l9_507=fast::clamp(l9_502,l9_503,l9_504);
float l9_508=step(abs(l9_502-l9_507),9.9999997e-06);
l9_506*=(l9_508+((1.0-float(l9_505))*(1.0-l9_508)));
l9_502=l9_507;
l9_479.x=l9_502;
l9_489=l9_506;
bool l9_509=l9_485;
bool l9_510;
if (l9_509)
{
l9_510=l9_482.y==3;
}
else
{
l9_510=l9_509;
}
float l9_511=l9_479.y;
float l9_512=l9_484.y;
float l9_513=l9_484.w;
bool l9_514=l9_510;
float l9_515=l9_489;
float l9_516=fast::clamp(l9_511,l9_512,l9_513);
float l9_517=step(abs(l9_511-l9_516),9.9999997e-06);
l9_515*=(l9_517+((1.0-float(l9_514))*(1.0-l9_517)));
l9_511=l9_516;
l9_479.y=l9_511;
l9_489=l9_515;
}
float2 l9_518=l9_479;
bool l9_519=l9_480;
float3x3 l9_520=l9_481;
if (l9_519)
{
l9_518=float2((l9_520*float3(l9_518,1.0)).xy);
}
float2 l9_521=l9_518;
float2 l9_522=l9_521;
float2 l9_523=l9_522;
l9_479=l9_523;
float l9_524=l9_479.x;
int l9_525=l9_482.x;
bool l9_526=l9_488;
float l9_527=l9_489;
if ((l9_525==0)||(l9_525==3))
{
float l9_528=l9_524;
float l9_529=0.0;
float l9_530=1.0;
bool l9_531=l9_526;
float l9_532=l9_527;
float l9_533=fast::clamp(l9_528,l9_529,l9_530);
float l9_534=step(abs(l9_528-l9_533),9.9999997e-06);
l9_532*=(l9_534+((1.0-float(l9_531))*(1.0-l9_534)));
l9_528=l9_533;
l9_524=l9_528;
l9_527=l9_532;
}
l9_479.x=l9_524;
l9_489=l9_527;
float l9_535=l9_479.y;
int l9_536=l9_482.y;
bool l9_537=l9_488;
float l9_538=l9_489;
if ((l9_536==0)||(l9_536==3))
{
float l9_539=l9_535;
float l9_540=0.0;
float l9_541=1.0;
bool l9_542=l9_537;
float l9_543=l9_538;
float l9_544=fast::clamp(l9_539,l9_540,l9_541);
float l9_545=step(abs(l9_539-l9_544),9.9999997e-06);
l9_543*=(l9_545+((1.0-float(l9_542))*(1.0-l9_545)));
l9_539=l9_544;
l9_535=l9_539;
l9_538=l9_543;
}
l9_479.y=l9_535;
l9_489=l9_538;
float2 l9_546=l9_479;
int l9_547=l9_477;
int l9_548=l9_478;
float l9_549=l9_487;
float2 l9_550=l9_546;
int l9_551=l9_547;
int l9_552=l9_548;
float3 l9_553=float3(0.0);
if (l9_551==0)
{
l9_553=float3(l9_550,0.0);
}
else
{
if (l9_551==1)
{
l9_553=float3(l9_550.x,(l9_550.y*0.5)+(0.5-(float(l9_552)*0.5)),0.0);
}
else
{
l9_553=float3(l9_550,float(l9_552));
}
}
float3 l9_554=l9_553;
float3 l9_555=l9_554;
float2 l9_556=l9_555.xy;
float l9_557=l9_549;
float4 l9_558=sc_set0.frontCapTex.sample(sc_set0.frontCapTexSmpSC,l9_556,bias(l9_557));
float4 l9_559=l9_558;
float4 l9_560=l9_559;
if (l9_485)
{
l9_560=mix(l9_486,l9_560,float4(l9_489));
}
float4 l9_561=l9_560;
l9_470=l9_561;
l9_458=l9_470;
l9_463=l9_458;
}
else
{
if (DROPLIST_FRONT_CAP_MODE_tmp==1)
{
float4 l9_562=float4(0.0);
float4 l9_563=(*sc_set0.UserUniforms).frontCapStartingColor;
l9_562=l9_563;
float4 l9_564=float4(0.0);
l9_564=l9_562;
float4 l9_565=float4(0.0);
float4 l9_566=(*sc_set0.UserUniforms).frontCapEndingColor;
l9_565=l9_566;
float4 l9_567=float4(0.0);
l9_567=l9_565;
float2 l9_568=float2(0.0);
l9_568=l9_462.Surface_UVCoord0;
float2 l9_569=float2(0.0);
l9_569=(((l9_568-float2((*sc_set0.UserUniforms).Port_RangeMinA_N101))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N101-(*sc_set0.UserUniforms).Port_RangeMinA_N101)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N101-(*sc_set0.UserUniforms).Port_RangeMinB_N101))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N101);
float2 l9_570=float2(0.0);
l9_570=(*sc_set0.UserUniforms).Port_Import_N102;
float2 l9_571=float2(0.0);
l9_571=((l9_569-(*sc_set0.UserUniforms).Port_Center_N103)*l9_570)+(*sc_set0.UserUniforms).Port_Center_N103;
float2 l9_572=float2(0.0);
l9_572=(*sc_set0.UserUniforms).Port_Import_N104;
float2 l9_573=float2(0.0);
l9_573=l9_571-l9_572;
float l9_574=0.0;
float l9_575=(*sc_set0.UserUniforms).frontCapGradientRamp;
l9_574=l9_575;
float l9_576=0.0;
l9_576=(((l9_574-(*sc_set0.UserUniforms).Port_RangeMinA_N160)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N160-(*sc_set0.UserUniforms).Port_RangeMinA_N160)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N160-(*sc_set0.UserUniforms).Port_RangeMinB_N160))+(*sc_set0.UserUniforms).Port_RangeMinB_N160;
float2 l9_577=float2(0.0);
l9_577=float2(0.0,float2(l9_576).y);
float2 l9_578=float2(0.0);
l9_578=l9_577;
float2 l9_579=float2(0.0);
l9_579=l9_578-l9_572;
float l9_580=0.0;
l9_580=dot(l9_573,l9_579);
float l9_581=0.0;
l9_581=dot(l9_579,l9_579);
float l9_582=0.0;
l9_582=l9_580/(l9_581+1.234e-06);
float l9_583=0.0;
l9_583=fast::clamp(l9_582+0.001,(*sc_set0.UserUniforms).Port_Input1_N111+0.001,(*sc_set0.UserUniforms).Port_Input2_N111+0.001)-0.001;
float l9_584=0.0;
l9_584=smoothstep((*sc_set0.UserUniforms).Port_Input0_N112,(*sc_set0.UserUniforms).Port_Input1_N112,l9_583);
float4 l9_585=float4(0.0);
l9_585=mix(l9_564,l9_567,float4(l9_584));
float4 l9_586=float4(0.0);
l9_586=l9_585;
l9_459=l9_586;
l9_463=l9_459;
}
else
{
if (DROPLIST_FRONT_CAP_MODE_tmp==2)
{
float4 l9_587=float4(0.0);
float4 l9_588=(*sc_set0.UserUniforms).frontCapStartingColor;
l9_587=l9_588;
l9_460=l9_587;
l9_463=l9_460;
}
else
{
l9_463=l9_461;
}
}
}
l9_457=l9_463;
param_5=l9_457;
param_6=param_5;
}
Output_N120=param_6;
float2 UVCoord_N52=float2(0.0);
UVCoord_N52=Globals.Surface_UVCoord0;
float Output_N53=0.0;
Output_N53=UVCoord_N52.x;
float Output_N54=0.0;
Output_N54=step(Output_N53,(*sc_set0.UserUniforms).Port_Input1_N054);
float4 Output_N51=float4(0.0);
Output_N51=mix(Output_N150,Output_N120,float4(Output_N54));
float4 Output_N75=float4(0.0);
float4 param_8=float4(1.0);
float4 param_9=float4(1.0,0.0,0.0,0.0);
ssGlobals param_11=Globals;
float4 param_10;
if ((int(outerEdgePBR_tmp)!=0))
{
float4 l9_589=float4(0.0);
float4 l9_590=float4(0.0);
float4 l9_591=float4(0.0);
float4 l9_592=float4(0.0);
float4 l9_593=(*sc_set0.UserUniforms).Port_Default_N046;
ssGlobals l9_594=param_11;
float4 l9_595;
if (DROPLIST_OUTER_EDGE_MODE_tmp==0)
{
float2 l9_596=float2(0.0);
l9_596=l9_594.Surface_UVCoord0;
float2 l9_597=float2(0.0);
float2 l9_598=(*sc_set0.UserUniforms).outerEdgeTexScale;
l9_597=l9_598;
float2 l9_599=float2(0.0);
float2 l9_600=(*sc_set0.UserUniforms).outerEdgeTexOffset;
l9_599=l9_600;
float2 l9_601=float2(0.0);
l9_601=(l9_596*l9_597)+l9_599;
float4 l9_602=float4(0.0);
int l9_603=0;
if ((int(outerEdgeTexHasSwappedViews_tmp)!=0))
{
int l9_604=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_604=0;
}
else
{
l9_604=in.varStereoViewID;
}
int l9_605=l9_604;
l9_603=1-l9_605;
}
else
{
int l9_606=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_606=0;
}
else
{
l9_606=in.varStereoViewID;
}
int l9_607=l9_606;
l9_603=l9_607;
}
int l9_608=l9_603;
int l9_609=outerEdgeTexLayout_tmp;
int l9_610=l9_608;
float2 l9_611=l9_601;
bool l9_612=(int(SC_USE_UV_TRANSFORM_outerEdgeTex_tmp)!=0);
float3x3 l9_613=(*sc_set0.UserUniforms).outerEdgeTexTransform;
int2 l9_614=int2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex_tmp,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex_tmp);
bool l9_615=(int(SC_USE_UV_MIN_MAX_outerEdgeTex_tmp)!=0);
float4 l9_616=(*sc_set0.UserUniforms).outerEdgeTexUvMinMax;
bool l9_617=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex_tmp)!=0);
float4 l9_618=(*sc_set0.UserUniforms).outerEdgeTexBorderColor;
float l9_619=0.0;
bool l9_620=l9_617&&(!l9_615);
float l9_621=1.0;
float l9_622=l9_611.x;
int l9_623=l9_614.x;
if (l9_623==1)
{
l9_622=fract(l9_622);
}
else
{
if (l9_623==2)
{
float l9_624=fract(l9_622);
float l9_625=l9_622-l9_624;
float l9_626=step(0.25,fract(l9_625*0.5));
l9_622=mix(l9_624,1.0-l9_624,fast::clamp(l9_626,0.0,1.0));
}
}
l9_611.x=l9_622;
float l9_627=l9_611.y;
int l9_628=l9_614.y;
if (l9_628==1)
{
l9_627=fract(l9_627);
}
else
{
if (l9_628==2)
{
float l9_629=fract(l9_627);
float l9_630=l9_627-l9_629;
float l9_631=step(0.25,fract(l9_630*0.5));
l9_627=mix(l9_629,1.0-l9_629,fast::clamp(l9_631,0.0,1.0));
}
}
l9_611.y=l9_627;
if (l9_615)
{
bool l9_632=l9_617;
bool l9_633;
if (l9_632)
{
l9_633=l9_614.x==3;
}
else
{
l9_633=l9_632;
}
float l9_634=l9_611.x;
float l9_635=l9_616.x;
float l9_636=l9_616.z;
bool l9_637=l9_633;
float l9_638=l9_621;
float l9_639=fast::clamp(l9_634,l9_635,l9_636);
float l9_640=step(abs(l9_634-l9_639),9.9999997e-06);
l9_638*=(l9_640+((1.0-float(l9_637))*(1.0-l9_640)));
l9_634=l9_639;
l9_611.x=l9_634;
l9_621=l9_638;
bool l9_641=l9_617;
bool l9_642;
if (l9_641)
{
l9_642=l9_614.y==3;
}
else
{
l9_642=l9_641;
}
float l9_643=l9_611.y;
float l9_644=l9_616.y;
float l9_645=l9_616.w;
bool l9_646=l9_642;
float l9_647=l9_621;
float l9_648=fast::clamp(l9_643,l9_644,l9_645);
float l9_649=step(abs(l9_643-l9_648),9.9999997e-06);
l9_647*=(l9_649+((1.0-float(l9_646))*(1.0-l9_649)));
l9_643=l9_648;
l9_611.y=l9_643;
l9_621=l9_647;
}
float2 l9_650=l9_611;
bool l9_651=l9_612;
float3x3 l9_652=l9_613;
if (l9_651)
{
l9_650=float2((l9_652*float3(l9_650,1.0)).xy);
}
float2 l9_653=l9_650;
float2 l9_654=l9_653;
float2 l9_655=l9_654;
l9_611=l9_655;
float l9_656=l9_611.x;
int l9_657=l9_614.x;
bool l9_658=l9_620;
float l9_659=l9_621;
if ((l9_657==0)||(l9_657==3))
{
float l9_660=l9_656;
float l9_661=0.0;
float l9_662=1.0;
bool l9_663=l9_658;
float l9_664=l9_659;
float l9_665=fast::clamp(l9_660,l9_661,l9_662);
float l9_666=step(abs(l9_660-l9_665),9.9999997e-06);
l9_664*=(l9_666+((1.0-float(l9_663))*(1.0-l9_666)));
l9_660=l9_665;
l9_656=l9_660;
l9_659=l9_664;
}
l9_611.x=l9_656;
l9_621=l9_659;
float l9_667=l9_611.y;
int l9_668=l9_614.y;
bool l9_669=l9_620;
float l9_670=l9_621;
if ((l9_668==0)||(l9_668==3))
{
float l9_671=l9_667;
float l9_672=0.0;
float l9_673=1.0;
bool l9_674=l9_669;
float l9_675=l9_670;
float l9_676=fast::clamp(l9_671,l9_672,l9_673);
float l9_677=step(abs(l9_671-l9_676),9.9999997e-06);
l9_675*=(l9_677+((1.0-float(l9_674))*(1.0-l9_677)));
l9_671=l9_676;
l9_667=l9_671;
l9_670=l9_675;
}
l9_611.y=l9_667;
l9_621=l9_670;
float2 l9_678=l9_611;
int l9_679=l9_609;
int l9_680=l9_610;
float l9_681=l9_619;
float2 l9_682=l9_678;
int l9_683=l9_679;
int l9_684=l9_680;
float3 l9_685=float3(0.0);
if (l9_683==0)
{
l9_685=float3(l9_682,0.0);
}
else
{
if (l9_683==1)
{
l9_685=float3(l9_682.x,(l9_682.y*0.5)+(0.5-(float(l9_684)*0.5)),0.0);
}
else
{
l9_685=float3(l9_682,float(l9_684));
}
}
float3 l9_686=l9_685;
float3 l9_687=l9_686;
float2 l9_688=l9_687.xy;
float l9_689=l9_681;
float4 l9_690=sc_set0.outerEdgeTex.sample(sc_set0.outerEdgeTexSmpSC,l9_688,bias(l9_689));
float4 l9_691=l9_690;
float4 l9_692=l9_691;
if (l9_617)
{
l9_692=mix(l9_618,l9_692,float4(l9_621));
}
float4 l9_693=l9_692;
l9_602=l9_693;
l9_590=l9_602;
l9_595=l9_590;
}
else
{
if (DROPLIST_OUTER_EDGE_MODE_tmp==1)
{
float4 l9_694=float4(0.0);
float4 l9_695=(*sc_set0.UserUniforms).outerEdgeStartingColor;
l9_694=l9_695;
float4 l9_696=float4(0.0);
l9_696=l9_694;
float4 l9_697=float4(0.0);
float4 l9_698=(*sc_set0.UserUniforms).outerEdgeEndingColor;
l9_697=l9_698;
float4 l9_699=float4(0.0);
l9_699=l9_697;
float2 l9_700=float2(0.0);
l9_700=l9_594.Surface_UVCoord0;
float2 l9_701=float2(0.0);
l9_701=(((l9_700-float2((*sc_set0.UserUniforms).Port_RangeMinA_N033))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N033-(*sc_set0.UserUniforms).Port_RangeMinA_N033)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N033-(*sc_set0.UserUniforms).Port_RangeMinB_N033))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N033);
float2 l9_702=float2(0.0);
l9_702=(*sc_set0.UserUniforms).Port_Import_N017;
float2 l9_703=float2(0.0);
l9_703=((l9_701-(*sc_set0.UserUniforms).Port_Center_N047)*l9_702)+(*sc_set0.UserUniforms).Port_Center_N047;
float2 l9_704=float2(0.0);
l9_704=(*sc_set0.UserUniforms).Port_Import_N058;
float2 l9_705=float2(0.0);
l9_705=l9_703-l9_704;
float l9_706=0.0;
float l9_707=(*sc_set0.UserUniforms).outerEdgeGradientRamp;
l9_706=l9_707;
float l9_708=0.0;
l9_708=(((l9_706-(*sc_set0.UserUniforms).Port_RangeMinA_N153)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N153-(*sc_set0.UserUniforms).Port_RangeMinA_N153)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N153-(*sc_set0.UserUniforms).Port_RangeMinB_N153))+(*sc_set0.UserUniforms).Port_RangeMinB_N153;
float2 l9_709=float2(0.0);
l9_709=float2(0.0,float2(l9_708).y);
float2 l9_710=float2(0.0);
l9_710=l9_709;
float2 l9_711=float2(0.0);
l9_711=l9_710-l9_704;
float l9_712=0.0;
l9_712=dot(l9_705,l9_711);
float l9_713=0.0;
l9_713=dot(l9_711,l9_711);
float l9_714=0.0;
l9_714=l9_712/(l9_713+1.234e-06);
float l9_715=0.0;
l9_715=fast::clamp(l9_714+0.001,(*sc_set0.UserUniforms).Port_Input1_N065+0.001,(*sc_set0.UserUniforms).Port_Input2_N065+0.001)-0.001;
float l9_716=0.0;
l9_716=smoothstep((*sc_set0.UserUniforms).Port_Input0_N066,(*sc_set0.UserUniforms).Port_Input1_N066,l9_715);
float4 l9_717=float4(0.0);
l9_717=mix(l9_696,l9_699,float4(l9_716));
float4 l9_718=float4(0.0);
l9_718=l9_717;
l9_591=l9_718;
l9_595=l9_591;
}
else
{
if (DROPLIST_OUTER_EDGE_MODE_tmp==2)
{
float4 l9_719=float4(0.0);
float4 l9_720=(*sc_set0.UserUniforms).outerEdgeStartingColor;
l9_719=l9_720;
l9_592=l9_719;
l9_595=l9_592;
}
else
{
l9_595=l9_593;
}
}
}
l9_589=l9_595;
float l9_721=0.0;
float l9_722=(*sc_set0.UserUniforms).outerEdgeMetallic;
l9_721=l9_722;
float l9_723=0.0;
float l9_724=(*sc_set0.UserUniforms).outerRoughness;
l9_723=l9_724;
float4 l9_725=float4(0.0);
float3 l9_726=l9_589.xyz;
float l9_727=(*sc_set0.UserUniforms).Port_Opacity_N057;
float3 l9_728=(*sc_set0.UserUniforms).Port_Emissive_N057;
float l9_729=l9_721;
float l9_730=l9_723;
float3 l9_731=(*sc_set0.UserUniforms).Port_AO_N057;
float3 l9_732=(*sc_set0.UserUniforms).Port_SpecularAO_N057;
ssGlobals l9_733=param_11;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_733.BumpedNormal=l9_733.VertexNormal_WorldSpace;
}
float l9_734=l9_727;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_734<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_735=gl_FragCoord;
float2 l9_736=floor(mod(l9_735.xy,float2(4.0)));
float l9_737=(mod(dot(l9_736,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_734<l9_737)
{
discard_fragment();
}
}
l9_726=fast::max(l9_726,float3(0.0));
float4 l9_738;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_738=float4(l9_726,l9_727);
}
else
{
l9_729=fast::clamp(l9_729,0.0,1.0);
l9_730=fast::clamp(l9_730,0.0,1.0);
float3 l9_739=l9_726;
float l9_740=l9_727;
float3 l9_741=l9_733.BumpedNormal;
float3 l9_742=l9_733.PositionWS;
float3 l9_743=l9_733.ViewDirWS;
float3 l9_744=l9_728;
float l9_745=l9_729;
float l9_746=l9_730;
float3 l9_747=l9_731;
float3 l9_748=l9_732;
l9_738=ngsCalculateLighting(l9_739,l9_740,l9_741,l9_742,l9_743,l9_744,l9_745,l9_746,l9_747,l9_748,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
l9_738=fast::max(l9_738,float4(0.0));
l9_725=l9_738;
param_8=l9_725;
param_10=param_8;
}
else
{
float4 l9_749=float4(0.0);
float4 l9_750=float4(0.0);
float4 l9_751=float4(0.0);
float4 l9_752=float4(0.0);
float4 l9_753=(*sc_set0.UserUniforms).Port_Default_N046;
ssGlobals l9_754=param_11;
float4 l9_755;
if (DROPLIST_OUTER_EDGE_MODE_tmp==0)
{
float2 l9_756=float2(0.0);
l9_756=l9_754.Surface_UVCoord0;
float2 l9_757=float2(0.0);
float2 l9_758=(*sc_set0.UserUniforms).outerEdgeTexScale;
l9_757=l9_758;
float2 l9_759=float2(0.0);
float2 l9_760=(*sc_set0.UserUniforms).outerEdgeTexOffset;
l9_759=l9_760;
float2 l9_761=float2(0.0);
l9_761=(l9_756*l9_757)+l9_759;
float4 l9_762=float4(0.0);
int l9_763=0;
if ((int(outerEdgeTexHasSwappedViews_tmp)!=0))
{
int l9_764=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_764=0;
}
else
{
l9_764=in.varStereoViewID;
}
int l9_765=l9_764;
l9_763=1-l9_765;
}
else
{
int l9_766=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_766=0;
}
else
{
l9_766=in.varStereoViewID;
}
int l9_767=l9_766;
l9_763=l9_767;
}
int l9_768=l9_763;
int l9_769=outerEdgeTexLayout_tmp;
int l9_770=l9_768;
float2 l9_771=l9_761;
bool l9_772=(int(SC_USE_UV_TRANSFORM_outerEdgeTex_tmp)!=0);
float3x3 l9_773=(*sc_set0.UserUniforms).outerEdgeTexTransform;
int2 l9_774=int2(SC_SOFTWARE_WRAP_MODE_U_outerEdgeTex_tmp,SC_SOFTWARE_WRAP_MODE_V_outerEdgeTex_tmp);
bool l9_775=(int(SC_USE_UV_MIN_MAX_outerEdgeTex_tmp)!=0);
float4 l9_776=(*sc_set0.UserUniforms).outerEdgeTexUvMinMax;
bool l9_777=(int(SC_USE_CLAMP_TO_BORDER_outerEdgeTex_tmp)!=0);
float4 l9_778=(*sc_set0.UserUniforms).outerEdgeTexBorderColor;
float l9_779=0.0;
bool l9_780=l9_777&&(!l9_775);
float l9_781=1.0;
float l9_782=l9_771.x;
int l9_783=l9_774.x;
if (l9_783==1)
{
l9_782=fract(l9_782);
}
else
{
if (l9_783==2)
{
float l9_784=fract(l9_782);
float l9_785=l9_782-l9_784;
float l9_786=step(0.25,fract(l9_785*0.5));
l9_782=mix(l9_784,1.0-l9_784,fast::clamp(l9_786,0.0,1.0));
}
}
l9_771.x=l9_782;
float l9_787=l9_771.y;
int l9_788=l9_774.y;
if (l9_788==1)
{
l9_787=fract(l9_787);
}
else
{
if (l9_788==2)
{
float l9_789=fract(l9_787);
float l9_790=l9_787-l9_789;
float l9_791=step(0.25,fract(l9_790*0.5));
l9_787=mix(l9_789,1.0-l9_789,fast::clamp(l9_791,0.0,1.0));
}
}
l9_771.y=l9_787;
if (l9_775)
{
bool l9_792=l9_777;
bool l9_793;
if (l9_792)
{
l9_793=l9_774.x==3;
}
else
{
l9_793=l9_792;
}
float l9_794=l9_771.x;
float l9_795=l9_776.x;
float l9_796=l9_776.z;
bool l9_797=l9_793;
float l9_798=l9_781;
float l9_799=fast::clamp(l9_794,l9_795,l9_796);
float l9_800=step(abs(l9_794-l9_799),9.9999997e-06);
l9_798*=(l9_800+((1.0-float(l9_797))*(1.0-l9_800)));
l9_794=l9_799;
l9_771.x=l9_794;
l9_781=l9_798;
bool l9_801=l9_777;
bool l9_802;
if (l9_801)
{
l9_802=l9_774.y==3;
}
else
{
l9_802=l9_801;
}
float l9_803=l9_771.y;
float l9_804=l9_776.y;
float l9_805=l9_776.w;
bool l9_806=l9_802;
float l9_807=l9_781;
float l9_808=fast::clamp(l9_803,l9_804,l9_805);
float l9_809=step(abs(l9_803-l9_808),9.9999997e-06);
l9_807*=(l9_809+((1.0-float(l9_806))*(1.0-l9_809)));
l9_803=l9_808;
l9_771.y=l9_803;
l9_781=l9_807;
}
float2 l9_810=l9_771;
bool l9_811=l9_772;
float3x3 l9_812=l9_773;
if (l9_811)
{
l9_810=float2((l9_812*float3(l9_810,1.0)).xy);
}
float2 l9_813=l9_810;
float2 l9_814=l9_813;
float2 l9_815=l9_814;
l9_771=l9_815;
float l9_816=l9_771.x;
int l9_817=l9_774.x;
bool l9_818=l9_780;
float l9_819=l9_781;
if ((l9_817==0)||(l9_817==3))
{
float l9_820=l9_816;
float l9_821=0.0;
float l9_822=1.0;
bool l9_823=l9_818;
float l9_824=l9_819;
float l9_825=fast::clamp(l9_820,l9_821,l9_822);
float l9_826=step(abs(l9_820-l9_825),9.9999997e-06);
l9_824*=(l9_826+((1.0-float(l9_823))*(1.0-l9_826)));
l9_820=l9_825;
l9_816=l9_820;
l9_819=l9_824;
}
l9_771.x=l9_816;
l9_781=l9_819;
float l9_827=l9_771.y;
int l9_828=l9_774.y;
bool l9_829=l9_780;
float l9_830=l9_781;
if ((l9_828==0)||(l9_828==3))
{
float l9_831=l9_827;
float l9_832=0.0;
float l9_833=1.0;
bool l9_834=l9_829;
float l9_835=l9_830;
float l9_836=fast::clamp(l9_831,l9_832,l9_833);
float l9_837=step(abs(l9_831-l9_836),9.9999997e-06);
l9_835*=(l9_837+((1.0-float(l9_834))*(1.0-l9_837)));
l9_831=l9_836;
l9_827=l9_831;
l9_830=l9_835;
}
l9_771.y=l9_827;
l9_781=l9_830;
float2 l9_838=l9_771;
int l9_839=l9_769;
int l9_840=l9_770;
float l9_841=l9_779;
float2 l9_842=l9_838;
int l9_843=l9_839;
int l9_844=l9_840;
float3 l9_845=float3(0.0);
if (l9_843==0)
{
l9_845=float3(l9_842,0.0);
}
else
{
if (l9_843==1)
{
l9_845=float3(l9_842.x,(l9_842.y*0.5)+(0.5-(float(l9_844)*0.5)),0.0);
}
else
{
l9_845=float3(l9_842,float(l9_844));
}
}
float3 l9_846=l9_845;
float3 l9_847=l9_846;
float2 l9_848=l9_847.xy;
float l9_849=l9_841;
float4 l9_850=sc_set0.outerEdgeTex.sample(sc_set0.outerEdgeTexSmpSC,l9_848,bias(l9_849));
float4 l9_851=l9_850;
float4 l9_852=l9_851;
if (l9_777)
{
l9_852=mix(l9_778,l9_852,float4(l9_781));
}
float4 l9_853=l9_852;
l9_762=l9_853;
l9_750=l9_762;
l9_755=l9_750;
}
else
{
if (DROPLIST_OUTER_EDGE_MODE_tmp==1)
{
float4 l9_854=float4(0.0);
float4 l9_855=(*sc_set0.UserUniforms).outerEdgeStartingColor;
l9_854=l9_855;
float4 l9_856=float4(0.0);
l9_856=l9_854;
float4 l9_857=float4(0.0);
float4 l9_858=(*sc_set0.UserUniforms).outerEdgeEndingColor;
l9_857=l9_858;
float4 l9_859=float4(0.0);
l9_859=l9_857;
float2 l9_860=float2(0.0);
l9_860=l9_754.Surface_UVCoord0;
float2 l9_861=float2(0.0);
l9_861=(((l9_860-float2((*sc_set0.UserUniforms).Port_RangeMinA_N033))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N033-(*sc_set0.UserUniforms).Port_RangeMinA_N033)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N033-(*sc_set0.UserUniforms).Port_RangeMinB_N033))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N033);
float2 l9_862=float2(0.0);
l9_862=(*sc_set0.UserUniforms).Port_Import_N017;
float2 l9_863=float2(0.0);
l9_863=((l9_861-(*sc_set0.UserUniforms).Port_Center_N047)*l9_862)+(*sc_set0.UserUniforms).Port_Center_N047;
float2 l9_864=float2(0.0);
l9_864=(*sc_set0.UserUniforms).Port_Import_N058;
float2 l9_865=float2(0.0);
l9_865=l9_863-l9_864;
float l9_866=0.0;
float l9_867=(*sc_set0.UserUniforms).outerEdgeGradientRamp;
l9_866=l9_867;
float l9_868=0.0;
l9_868=(((l9_866-(*sc_set0.UserUniforms).Port_RangeMinA_N153)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N153-(*sc_set0.UserUniforms).Port_RangeMinA_N153)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N153-(*sc_set0.UserUniforms).Port_RangeMinB_N153))+(*sc_set0.UserUniforms).Port_RangeMinB_N153;
float2 l9_869=float2(0.0);
l9_869=float2(0.0,float2(l9_868).y);
float2 l9_870=float2(0.0);
l9_870=l9_869;
float2 l9_871=float2(0.0);
l9_871=l9_870-l9_864;
float l9_872=0.0;
l9_872=dot(l9_865,l9_871);
float l9_873=0.0;
l9_873=dot(l9_871,l9_871);
float l9_874=0.0;
l9_874=l9_872/(l9_873+1.234e-06);
float l9_875=0.0;
l9_875=fast::clamp(l9_874+0.001,(*sc_set0.UserUniforms).Port_Input1_N065+0.001,(*sc_set0.UserUniforms).Port_Input2_N065+0.001)-0.001;
float l9_876=0.0;
l9_876=smoothstep((*sc_set0.UserUniforms).Port_Input0_N066,(*sc_set0.UserUniforms).Port_Input1_N066,l9_875);
float4 l9_877=float4(0.0);
l9_877=mix(l9_856,l9_859,float4(l9_876));
float4 l9_878=float4(0.0);
l9_878=l9_877;
l9_751=l9_878;
l9_755=l9_751;
}
else
{
if (DROPLIST_OUTER_EDGE_MODE_tmp==2)
{
float4 l9_879=float4(0.0);
float4 l9_880=(*sc_set0.UserUniforms).outerEdgeStartingColor;
l9_879=l9_880;
l9_752=l9_879;
l9_755=l9_752;
}
else
{
l9_755=l9_753;
}
}
}
l9_749=l9_755;
param_9=l9_749;
param_10=param_9;
}
Output_N75=param_10;
float4 Output_N81=float4(0.0);
float4 param_12=float4(1.0);
float4 param_13=float4(1.0,0.0,0.0,0.0);
ssGlobals param_15=Globals;
float4 param_14;
if ((int(innerEdgePBR_tmp)!=0))
{
float4 l9_881=float4(0.0);
float4 l9_882=float4(0.0);
float4 l9_883=float4(0.0);
float4 l9_884=float4(0.0);
float4 l9_885=(*sc_set0.UserUniforms).Port_Default_N077;
ssGlobals l9_886=param_15;
float4 l9_887;
if (DROPLIST_INNER_EDGE_MODE_tmp==0)
{
float2 l9_888=float2(0.0);
l9_888=l9_886.Surface_UVCoord0;
float2 l9_889=float2(0.0);
float2 l9_890=(*sc_set0.UserUniforms).InnerEdgeTexScale;
l9_889=l9_890;
float2 l9_891=float2(0.0);
float2 l9_892=(*sc_set0.UserUniforms).InnerEdgeTexOffset;
l9_891=l9_892;
float2 l9_893=float2(0.0);
l9_893=(l9_888*l9_889)+l9_891;
float4 l9_894=float4(0.0);
int l9_895=0;
if ((int(InnerEdgeTexHasSwappedViews_tmp)!=0))
{
int l9_896=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_896=0;
}
else
{
l9_896=in.varStereoViewID;
}
int l9_897=l9_896;
l9_895=1-l9_897;
}
else
{
int l9_898=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_898=0;
}
else
{
l9_898=in.varStereoViewID;
}
int l9_899=l9_898;
l9_895=l9_899;
}
int l9_900=l9_895;
int l9_901=InnerEdgeTexLayout_tmp;
int l9_902=l9_900;
float2 l9_903=l9_893;
bool l9_904=(int(SC_USE_UV_TRANSFORM_InnerEdgeTex_tmp)!=0);
float3x3 l9_905=(*sc_set0.UserUniforms).InnerEdgeTexTransform;
int2 l9_906=int2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex_tmp,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex_tmp);
bool l9_907=(int(SC_USE_UV_MIN_MAX_InnerEdgeTex_tmp)!=0);
float4 l9_908=(*sc_set0.UserUniforms).InnerEdgeTexUvMinMax;
bool l9_909=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex_tmp)!=0);
float4 l9_910=(*sc_set0.UserUniforms).InnerEdgeTexBorderColor;
float l9_911=0.0;
bool l9_912=l9_909&&(!l9_907);
float l9_913=1.0;
float l9_914=l9_903.x;
int l9_915=l9_906.x;
if (l9_915==1)
{
l9_914=fract(l9_914);
}
else
{
if (l9_915==2)
{
float l9_916=fract(l9_914);
float l9_917=l9_914-l9_916;
float l9_918=step(0.25,fract(l9_917*0.5));
l9_914=mix(l9_916,1.0-l9_916,fast::clamp(l9_918,0.0,1.0));
}
}
l9_903.x=l9_914;
float l9_919=l9_903.y;
int l9_920=l9_906.y;
if (l9_920==1)
{
l9_919=fract(l9_919);
}
else
{
if (l9_920==2)
{
float l9_921=fract(l9_919);
float l9_922=l9_919-l9_921;
float l9_923=step(0.25,fract(l9_922*0.5));
l9_919=mix(l9_921,1.0-l9_921,fast::clamp(l9_923,0.0,1.0));
}
}
l9_903.y=l9_919;
if (l9_907)
{
bool l9_924=l9_909;
bool l9_925;
if (l9_924)
{
l9_925=l9_906.x==3;
}
else
{
l9_925=l9_924;
}
float l9_926=l9_903.x;
float l9_927=l9_908.x;
float l9_928=l9_908.z;
bool l9_929=l9_925;
float l9_930=l9_913;
float l9_931=fast::clamp(l9_926,l9_927,l9_928);
float l9_932=step(abs(l9_926-l9_931),9.9999997e-06);
l9_930*=(l9_932+((1.0-float(l9_929))*(1.0-l9_932)));
l9_926=l9_931;
l9_903.x=l9_926;
l9_913=l9_930;
bool l9_933=l9_909;
bool l9_934;
if (l9_933)
{
l9_934=l9_906.y==3;
}
else
{
l9_934=l9_933;
}
float l9_935=l9_903.y;
float l9_936=l9_908.y;
float l9_937=l9_908.w;
bool l9_938=l9_934;
float l9_939=l9_913;
float l9_940=fast::clamp(l9_935,l9_936,l9_937);
float l9_941=step(abs(l9_935-l9_940),9.9999997e-06);
l9_939*=(l9_941+((1.0-float(l9_938))*(1.0-l9_941)));
l9_935=l9_940;
l9_903.y=l9_935;
l9_913=l9_939;
}
float2 l9_942=l9_903;
bool l9_943=l9_904;
float3x3 l9_944=l9_905;
if (l9_943)
{
l9_942=float2((l9_944*float3(l9_942,1.0)).xy);
}
float2 l9_945=l9_942;
float2 l9_946=l9_945;
float2 l9_947=l9_946;
l9_903=l9_947;
float l9_948=l9_903.x;
int l9_949=l9_906.x;
bool l9_950=l9_912;
float l9_951=l9_913;
if ((l9_949==0)||(l9_949==3))
{
float l9_952=l9_948;
float l9_953=0.0;
float l9_954=1.0;
bool l9_955=l9_950;
float l9_956=l9_951;
float l9_957=fast::clamp(l9_952,l9_953,l9_954);
float l9_958=step(abs(l9_952-l9_957),9.9999997e-06);
l9_956*=(l9_958+((1.0-float(l9_955))*(1.0-l9_958)));
l9_952=l9_957;
l9_948=l9_952;
l9_951=l9_956;
}
l9_903.x=l9_948;
l9_913=l9_951;
float l9_959=l9_903.y;
int l9_960=l9_906.y;
bool l9_961=l9_912;
float l9_962=l9_913;
if ((l9_960==0)||(l9_960==3))
{
float l9_963=l9_959;
float l9_964=0.0;
float l9_965=1.0;
bool l9_966=l9_961;
float l9_967=l9_962;
float l9_968=fast::clamp(l9_963,l9_964,l9_965);
float l9_969=step(abs(l9_963-l9_968),9.9999997e-06);
l9_967*=(l9_969+((1.0-float(l9_966))*(1.0-l9_969)));
l9_963=l9_968;
l9_959=l9_963;
l9_962=l9_967;
}
l9_903.y=l9_959;
l9_913=l9_962;
float2 l9_970=l9_903;
int l9_971=l9_901;
int l9_972=l9_902;
float l9_973=l9_911;
float2 l9_974=l9_970;
int l9_975=l9_971;
int l9_976=l9_972;
float3 l9_977=float3(0.0);
if (l9_975==0)
{
l9_977=float3(l9_974,0.0);
}
else
{
if (l9_975==1)
{
l9_977=float3(l9_974.x,(l9_974.y*0.5)+(0.5-(float(l9_976)*0.5)),0.0);
}
else
{
l9_977=float3(l9_974,float(l9_976));
}
}
float3 l9_978=l9_977;
float3 l9_979=l9_978;
float2 l9_980=l9_979.xy;
float l9_981=l9_973;
float4 l9_982=sc_set0.InnerEdgeTex.sample(sc_set0.InnerEdgeTexSmpSC,l9_980,bias(l9_981));
float4 l9_983=l9_982;
float4 l9_984=l9_983;
if (l9_909)
{
l9_984=mix(l9_910,l9_984,float4(l9_913));
}
float4 l9_985=l9_984;
l9_894=l9_985;
l9_882=l9_894;
l9_887=l9_882;
}
else
{
if (DROPLIST_INNER_EDGE_MODE_tmp==1)
{
float4 l9_986=float4(0.0);
float4 l9_987=(*sc_set0.UserUniforms).InnerEdgeStartingColor;
l9_986=l9_987;
float4 l9_988=float4(0.0);
l9_988=l9_986;
float4 l9_989=float4(0.0);
float4 l9_990=(*sc_set0.UserUniforms).InnerEdgeEndingColor;
l9_989=l9_990;
float4 l9_991=float4(0.0);
l9_991=l9_989;
float2 l9_992=float2(0.0);
l9_992=l9_886.Surface_UVCoord0;
float2 l9_993=float2(0.0);
l9_993=(((l9_992-float2((*sc_set0.UserUniforms).Port_RangeMinA_N023))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N023-(*sc_set0.UserUniforms).Port_RangeMinA_N023)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N023-(*sc_set0.UserUniforms).Port_RangeMinB_N023))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N023);
float2 l9_994=float2(0.0);
l9_994=(*sc_set0.UserUniforms).Port_Import_N024;
float2 l9_995=float2(0.0);
l9_995=((l9_993-(*sc_set0.UserUniforms).Port_Center_N025)*l9_994)+(*sc_set0.UserUniforms).Port_Center_N025;
float2 l9_996=float2(0.0);
l9_996=(*sc_set0.UserUniforms).Port_Import_N026;
float2 l9_997=float2(0.0);
l9_997=l9_995-l9_996;
float l9_998=0.0;
float l9_999=(*sc_set0.UserUniforms).InnerEdgeGradientRamp;
l9_998=l9_999;
float l9_1000=0.0;
l9_1000=(((l9_998-(*sc_set0.UserUniforms).Port_RangeMinA_N155)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N155-(*sc_set0.UserUniforms).Port_RangeMinA_N155)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N155-(*sc_set0.UserUniforms).Port_RangeMinB_N155))+(*sc_set0.UserUniforms).Port_RangeMinB_N155;
float2 l9_1001=float2(0.0);
l9_1001=float2(0.0,float2(l9_1000).y);
float2 l9_1002=float2(0.0);
l9_1002=l9_1001;
float2 l9_1003=float2(0.0);
l9_1003=l9_1002-l9_996;
float l9_1004=0.0;
l9_1004=dot(l9_997,l9_1003);
float l9_1005=0.0;
l9_1005=dot(l9_1003,l9_1003);
float l9_1006=0.0;
l9_1006=l9_1004/(l9_1005+1.234e-06);
float l9_1007=0.0;
l9_1007=fast::clamp(l9_1006+0.001,(*sc_set0.UserUniforms).Port_Input1_N034+0.001,(*sc_set0.UserUniforms).Port_Input2_N034+0.001)-0.001;
float l9_1008=0.0;
l9_1008=smoothstep((*sc_set0.UserUniforms).Port_Input0_N035,(*sc_set0.UserUniforms).Port_Input1_N035,l9_1007);
float4 l9_1009=float4(0.0);
l9_1009=mix(l9_988,l9_991,float4(l9_1008));
float4 l9_1010=float4(0.0);
l9_1010=l9_1009;
l9_883=l9_1010;
l9_887=l9_883;
}
else
{
if (DROPLIST_INNER_EDGE_MODE_tmp==2)
{
float4 l9_1011=float4(0.0);
float4 l9_1012=(*sc_set0.UserUniforms).InnerEdgeStartingColor;
l9_1011=l9_1012;
l9_884=l9_1011;
l9_887=l9_884;
}
else
{
l9_887=l9_885;
}
}
}
l9_881=l9_887;
float l9_1013=0.0;
float l9_1014=(*sc_set0.UserUniforms).InnerEdgeMetallic;
l9_1013=l9_1014;
float l9_1015=0.0;
float l9_1016=(*sc_set0.UserUniforms).InnerEdgeRoughness;
l9_1015=l9_1016;
float4 l9_1017=float4(0.0);
float3 l9_1018=l9_881.xyz;
float l9_1019=(*sc_set0.UserUniforms).Port_Opacity_N080;
float3 l9_1020=(*sc_set0.UserUniforms).Port_Emissive_N080;
float l9_1021=l9_1013;
float l9_1022=l9_1015;
float3 l9_1023=(*sc_set0.UserUniforms).Port_AO_N080;
float3 l9_1024=(*sc_set0.UserUniforms).Port_SpecularAO_N080;
ssGlobals l9_1025=param_15;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1025.BumpedNormal=l9_1025.VertexNormal_WorldSpace;
}
float l9_1026=l9_1019;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1026<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1027=gl_FragCoord;
float2 l9_1028=floor(mod(l9_1027.xy,float2(4.0)));
float l9_1029=(mod(dot(l9_1028,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1026<l9_1029)
{
discard_fragment();
}
}
l9_1018=fast::max(l9_1018,float3(0.0));
float4 l9_1030;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1030=float4(l9_1018,l9_1019);
}
else
{
l9_1021=fast::clamp(l9_1021,0.0,1.0);
l9_1022=fast::clamp(l9_1022,0.0,1.0);
float3 l9_1031=l9_1018;
float l9_1032=l9_1019;
float3 l9_1033=l9_1025.BumpedNormal;
float3 l9_1034=l9_1025.PositionWS;
float3 l9_1035=l9_1025.ViewDirWS;
float3 l9_1036=l9_1020;
float l9_1037=l9_1021;
float l9_1038=l9_1022;
float3 l9_1039=l9_1023;
float3 l9_1040=l9_1024;
l9_1030=ngsCalculateLighting(l9_1031,l9_1032,l9_1033,l9_1034,l9_1035,l9_1036,l9_1037,l9_1038,l9_1039,l9_1040,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
l9_1030=fast::max(l9_1030,float4(0.0));
l9_1017=l9_1030;
param_12=l9_1017;
param_14=param_12;
}
else
{
float4 l9_1041=float4(0.0);
float4 l9_1042=float4(0.0);
float4 l9_1043=float4(0.0);
float4 l9_1044=float4(0.0);
float4 l9_1045=(*sc_set0.UserUniforms).Port_Default_N077;
ssGlobals l9_1046=param_15;
float4 l9_1047;
if (DROPLIST_INNER_EDGE_MODE_tmp==0)
{
float2 l9_1048=float2(0.0);
l9_1048=l9_1046.Surface_UVCoord0;
float2 l9_1049=float2(0.0);
float2 l9_1050=(*sc_set0.UserUniforms).InnerEdgeTexScale;
l9_1049=l9_1050;
float2 l9_1051=float2(0.0);
float2 l9_1052=(*sc_set0.UserUniforms).InnerEdgeTexOffset;
l9_1051=l9_1052;
float2 l9_1053=float2(0.0);
l9_1053=(l9_1048*l9_1049)+l9_1051;
float4 l9_1054=float4(0.0);
int l9_1055=0;
if ((int(InnerEdgeTexHasSwappedViews_tmp)!=0))
{
int l9_1056=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1056=0;
}
else
{
l9_1056=in.varStereoViewID;
}
int l9_1057=l9_1056;
l9_1055=1-l9_1057;
}
else
{
int l9_1058=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1058=0;
}
else
{
l9_1058=in.varStereoViewID;
}
int l9_1059=l9_1058;
l9_1055=l9_1059;
}
int l9_1060=l9_1055;
int l9_1061=InnerEdgeTexLayout_tmp;
int l9_1062=l9_1060;
float2 l9_1063=l9_1053;
bool l9_1064=(int(SC_USE_UV_TRANSFORM_InnerEdgeTex_tmp)!=0);
float3x3 l9_1065=(*sc_set0.UserUniforms).InnerEdgeTexTransform;
int2 l9_1066=int2(SC_SOFTWARE_WRAP_MODE_U_InnerEdgeTex_tmp,SC_SOFTWARE_WRAP_MODE_V_InnerEdgeTex_tmp);
bool l9_1067=(int(SC_USE_UV_MIN_MAX_InnerEdgeTex_tmp)!=0);
float4 l9_1068=(*sc_set0.UserUniforms).InnerEdgeTexUvMinMax;
bool l9_1069=(int(SC_USE_CLAMP_TO_BORDER_InnerEdgeTex_tmp)!=0);
float4 l9_1070=(*sc_set0.UserUniforms).InnerEdgeTexBorderColor;
float l9_1071=0.0;
bool l9_1072=l9_1069&&(!l9_1067);
float l9_1073=1.0;
float l9_1074=l9_1063.x;
int l9_1075=l9_1066.x;
if (l9_1075==1)
{
l9_1074=fract(l9_1074);
}
else
{
if (l9_1075==2)
{
float l9_1076=fract(l9_1074);
float l9_1077=l9_1074-l9_1076;
float l9_1078=step(0.25,fract(l9_1077*0.5));
l9_1074=mix(l9_1076,1.0-l9_1076,fast::clamp(l9_1078,0.0,1.0));
}
}
l9_1063.x=l9_1074;
float l9_1079=l9_1063.y;
int l9_1080=l9_1066.y;
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
l9_1063.y=l9_1079;
if (l9_1067)
{
bool l9_1084=l9_1069;
bool l9_1085;
if (l9_1084)
{
l9_1085=l9_1066.x==3;
}
else
{
l9_1085=l9_1084;
}
float l9_1086=l9_1063.x;
float l9_1087=l9_1068.x;
float l9_1088=l9_1068.z;
bool l9_1089=l9_1085;
float l9_1090=l9_1073;
float l9_1091=fast::clamp(l9_1086,l9_1087,l9_1088);
float l9_1092=step(abs(l9_1086-l9_1091),9.9999997e-06);
l9_1090*=(l9_1092+((1.0-float(l9_1089))*(1.0-l9_1092)));
l9_1086=l9_1091;
l9_1063.x=l9_1086;
l9_1073=l9_1090;
bool l9_1093=l9_1069;
bool l9_1094;
if (l9_1093)
{
l9_1094=l9_1066.y==3;
}
else
{
l9_1094=l9_1093;
}
float l9_1095=l9_1063.y;
float l9_1096=l9_1068.y;
float l9_1097=l9_1068.w;
bool l9_1098=l9_1094;
float l9_1099=l9_1073;
float l9_1100=fast::clamp(l9_1095,l9_1096,l9_1097);
float l9_1101=step(abs(l9_1095-l9_1100),9.9999997e-06);
l9_1099*=(l9_1101+((1.0-float(l9_1098))*(1.0-l9_1101)));
l9_1095=l9_1100;
l9_1063.y=l9_1095;
l9_1073=l9_1099;
}
float2 l9_1102=l9_1063;
bool l9_1103=l9_1064;
float3x3 l9_1104=l9_1065;
if (l9_1103)
{
l9_1102=float2((l9_1104*float3(l9_1102,1.0)).xy);
}
float2 l9_1105=l9_1102;
float2 l9_1106=l9_1105;
float2 l9_1107=l9_1106;
l9_1063=l9_1107;
float l9_1108=l9_1063.x;
int l9_1109=l9_1066.x;
bool l9_1110=l9_1072;
float l9_1111=l9_1073;
if ((l9_1109==0)||(l9_1109==3))
{
float l9_1112=l9_1108;
float l9_1113=0.0;
float l9_1114=1.0;
bool l9_1115=l9_1110;
float l9_1116=l9_1111;
float l9_1117=fast::clamp(l9_1112,l9_1113,l9_1114);
float l9_1118=step(abs(l9_1112-l9_1117),9.9999997e-06);
l9_1116*=(l9_1118+((1.0-float(l9_1115))*(1.0-l9_1118)));
l9_1112=l9_1117;
l9_1108=l9_1112;
l9_1111=l9_1116;
}
l9_1063.x=l9_1108;
l9_1073=l9_1111;
float l9_1119=l9_1063.y;
int l9_1120=l9_1066.y;
bool l9_1121=l9_1072;
float l9_1122=l9_1073;
if ((l9_1120==0)||(l9_1120==3))
{
float l9_1123=l9_1119;
float l9_1124=0.0;
float l9_1125=1.0;
bool l9_1126=l9_1121;
float l9_1127=l9_1122;
float l9_1128=fast::clamp(l9_1123,l9_1124,l9_1125);
float l9_1129=step(abs(l9_1123-l9_1128),9.9999997e-06);
l9_1127*=(l9_1129+((1.0-float(l9_1126))*(1.0-l9_1129)));
l9_1123=l9_1128;
l9_1119=l9_1123;
l9_1122=l9_1127;
}
l9_1063.y=l9_1119;
l9_1073=l9_1122;
float2 l9_1130=l9_1063;
int l9_1131=l9_1061;
int l9_1132=l9_1062;
float l9_1133=l9_1071;
float2 l9_1134=l9_1130;
int l9_1135=l9_1131;
int l9_1136=l9_1132;
float3 l9_1137=float3(0.0);
if (l9_1135==0)
{
l9_1137=float3(l9_1134,0.0);
}
else
{
if (l9_1135==1)
{
l9_1137=float3(l9_1134.x,(l9_1134.y*0.5)+(0.5-(float(l9_1136)*0.5)),0.0);
}
else
{
l9_1137=float3(l9_1134,float(l9_1136));
}
}
float3 l9_1138=l9_1137;
float3 l9_1139=l9_1138;
float2 l9_1140=l9_1139.xy;
float l9_1141=l9_1133;
float4 l9_1142=sc_set0.InnerEdgeTex.sample(sc_set0.InnerEdgeTexSmpSC,l9_1140,bias(l9_1141));
float4 l9_1143=l9_1142;
float4 l9_1144=l9_1143;
if (l9_1069)
{
l9_1144=mix(l9_1070,l9_1144,float4(l9_1073));
}
float4 l9_1145=l9_1144;
l9_1054=l9_1145;
l9_1042=l9_1054;
l9_1047=l9_1042;
}
else
{
if (DROPLIST_INNER_EDGE_MODE_tmp==1)
{
float4 l9_1146=float4(0.0);
float4 l9_1147=(*sc_set0.UserUniforms).InnerEdgeStartingColor;
l9_1146=l9_1147;
float4 l9_1148=float4(0.0);
l9_1148=l9_1146;
float4 l9_1149=float4(0.0);
float4 l9_1150=(*sc_set0.UserUniforms).InnerEdgeEndingColor;
l9_1149=l9_1150;
float4 l9_1151=float4(0.0);
l9_1151=l9_1149;
float2 l9_1152=float2(0.0);
l9_1152=l9_1046.Surface_UVCoord0;
float2 l9_1153=float2(0.0);
l9_1153=(((l9_1152-float2((*sc_set0.UserUniforms).Port_RangeMinA_N023))/float2(((*sc_set0.UserUniforms).Port_RangeMaxA_N023-(*sc_set0.UserUniforms).Port_RangeMinA_N023)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N023-(*sc_set0.UserUniforms).Port_RangeMinB_N023))+float2((*sc_set0.UserUniforms).Port_RangeMinB_N023);
float2 l9_1154=float2(0.0);
l9_1154=(*sc_set0.UserUniforms).Port_Import_N024;
float2 l9_1155=float2(0.0);
l9_1155=((l9_1153-(*sc_set0.UserUniforms).Port_Center_N025)*l9_1154)+(*sc_set0.UserUniforms).Port_Center_N025;
float2 l9_1156=float2(0.0);
l9_1156=(*sc_set0.UserUniforms).Port_Import_N026;
float2 l9_1157=float2(0.0);
l9_1157=l9_1155-l9_1156;
float l9_1158=0.0;
float l9_1159=(*sc_set0.UserUniforms).InnerEdgeGradientRamp;
l9_1158=l9_1159;
float l9_1160=0.0;
l9_1160=(((l9_1158-(*sc_set0.UserUniforms).Port_RangeMinA_N155)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N155-(*sc_set0.UserUniforms).Port_RangeMinA_N155)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N155-(*sc_set0.UserUniforms).Port_RangeMinB_N155))+(*sc_set0.UserUniforms).Port_RangeMinB_N155;
float2 l9_1161=float2(0.0);
l9_1161=float2(0.0,float2(l9_1160).y);
float2 l9_1162=float2(0.0);
l9_1162=l9_1161;
float2 l9_1163=float2(0.0);
l9_1163=l9_1162-l9_1156;
float l9_1164=0.0;
l9_1164=dot(l9_1157,l9_1163);
float l9_1165=0.0;
l9_1165=dot(l9_1163,l9_1163);
float l9_1166=0.0;
l9_1166=l9_1164/(l9_1165+1.234e-06);
float l9_1167=0.0;
l9_1167=fast::clamp(l9_1166+0.001,(*sc_set0.UserUniforms).Port_Input1_N034+0.001,(*sc_set0.UserUniforms).Port_Input2_N034+0.001)-0.001;
float l9_1168=0.0;
l9_1168=smoothstep((*sc_set0.UserUniforms).Port_Input0_N035,(*sc_set0.UserUniforms).Port_Input1_N035,l9_1167);
float4 l9_1169=float4(0.0);
l9_1169=mix(l9_1148,l9_1151,float4(l9_1168));
float4 l9_1170=float4(0.0);
l9_1170=l9_1169;
l9_1043=l9_1170;
l9_1047=l9_1043;
}
else
{
if (DROPLIST_INNER_EDGE_MODE_tmp==2)
{
float4 l9_1171=float4(0.0);
float4 l9_1172=(*sc_set0.UserUniforms).InnerEdgeStartingColor;
l9_1171=l9_1172;
l9_1044=l9_1171;
l9_1047=l9_1044;
}
else
{
l9_1047=l9_1045;
}
}
}
l9_1041=l9_1047;
param_13=l9_1041;
param_14=param_13;
}
Output_N81=param_14;
float Output_N42=0.0;
Output_N42=UVCoord_N52.y;
float Output_N43=0.0;
Output_N43=step(Output_N42,(*sc_set0.UserUniforms).Port_Input1_N043);
float4 Output_N0=float4(0.0);
Output_N0=mix(Output_N75,Output_N81,float4(Output_N43));
float Output_N12=0.0;
Output_N12=UVCoord_N52.y;
float Output_N14=0.0;
Output_N14=step(Output_N12,(*sc_set0.UserUniforms).Port_Input1_N014);
float4 Output_N13=float4(0.0);
Output_N13=mix(Output_N51,Output_N0,float4(Output_N14));
FinalColor=Output_N13;
bool l9_1173=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_1173)
{
float4 param_16=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_16.w=1.0;
}
float4 l9_1174=fast::max(param_16,float4(0.0));
float4 param_17=l9_1174;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_17.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_17;
return out;
}
float4 param_18=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1175=param_18;
float4 l9_1176=l9_1175;
float l9_1177=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1177=l9_1176.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1177=fast::clamp(l9_1176.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1177=fast::clamp(dot(l9_1176.xyz,float3(l9_1176.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1177=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1177=(1.0-dot(l9_1176.xyz,float3(0.33333001)))*l9_1176.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1177=(1.0-fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0))*l9_1176.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1177=fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0)*l9_1176.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1177=fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1177=fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0)*l9_1176.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1177=dot(l9_1176.xyz,float3(0.33333001))*l9_1176.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1177=1.0-fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1177=fast::clamp(dot(l9_1176.xyz,float3(1.0)),0.0,1.0);
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
float l9_1178=l9_1177;
float l9_1179=l9_1178;
float l9_1180=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1179;
float3 l9_1181=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1175.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1182=float4(l9_1181.x,l9_1181.y,l9_1181.z,l9_1180);
param_18=l9_1182;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_18=float4(param_18.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1183=param_18;
float4 l9_1184=float4(0.0);
float4 l9_1185=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1186=out.FragColor0;
float4 l9_1187=l9_1186;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1187.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1188=l9_1187;
l9_1185=l9_1188;
}
else
{
float4 l9_1189=gl_FragCoord;
float2 l9_1190=l9_1189.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1191=l9_1190;
float2 l9_1192=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1193=1;
int l9_1194=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1194=0;
}
else
{
l9_1194=in.varStereoViewID;
}
int l9_1195=l9_1194;
int l9_1196=l9_1195;
float3 l9_1197=float3(l9_1191,0.0);
int l9_1198=l9_1193;
int l9_1199=l9_1196;
if (l9_1198==1)
{
l9_1197.y=((2.0*l9_1197.y)+float(l9_1199))-1.0;
}
float2 l9_1200=l9_1197.xy;
l9_1192=l9_1200;
}
else
{
l9_1192=l9_1191;
}
float2 l9_1201=l9_1192;
float2 l9_1202=l9_1201;
float2 l9_1203=l9_1202;
int l9_1204=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1205=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1205=0;
}
else
{
l9_1205=in.varStereoViewID;
}
int l9_1206=l9_1205;
l9_1204=1-l9_1206;
}
else
{
int l9_1207=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1207=0;
}
else
{
l9_1207=in.varStereoViewID;
}
int l9_1208=l9_1207;
l9_1204=l9_1208;
}
int l9_1209=l9_1204;
float2 l9_1210=l9_1203;
int l9_1211=l9_1209;
float2 l9_1212=l9_1210;
int l9_1213=l9_1211;
float l9_1214=0.0;
float4 l9_1215=float4(0.0);
float2 l9_1216=l9_1212;
int l9_1217=sc_ScreenTextureLayout_tmp;
int l9_1218=l9_1213;
float l9_1219=l9_1214;
float2 l9_1220=l9_1216;
int l9_1221=l9_1217;
int l9_1222=l9_1218;
float3 l9_1223=float3(0.0);
if (l9_1221==0)
{
l9_1223=float3(l9_1220,0.0);
}
else
{
if (l9_1221==1)
{
l9_1223=float3(l9_1220.x,(l9_1220.y*0.5)+(0.5-(float(l9_1222)*0.5)),0.0);
}
else
{
l9_1223=float3(l9_1220,float(l9_1222));
}
}
float3 l9_1224=l9_1223;
float3 l9_1225=l9_1224;
float2 l9_1226=l9_1225.xy;
float l9_1227=l9_1219;
float4 l9_1228=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1226,bias(l9_1227));
float4 l9_1229=l9_1228;
l9_1215=l9_1229;
float4 l9_1230=l9_1215;
float4 l9_1231=l9_1230;
float4 l9_1232=l9_1231;
l9_1185=l9_1232;
}
float4 l9_1233=l9_1185;
float4 l9_1234=l9_1233;
float3 l9_1235=l9_1234.xyz;
float3 l9_1236=l9_1235;
float3 l9_1237=l9_1183.xyz;
float3 l9_1238=definedBlend(l9_1236,l9_1237,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1184=float4(l9_1238.x,l9_1238.y,l9_1238.z,l9_1184.w);
float3 l9_1239=mix(l9_1235,l9_1184.xyz,float3(l9_1183.w));
l9_1184=float4(l9_1239.x,l9_1239.y,l9_1239.z,l9_1184.w);
l9_1184.w=1.0;
float4 l9_1240=l9_1184;
param_18=l9_1240;
}
else
{
float4 l9_1241=param_18;
float4 l9_1242=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1242=float4(mix(float3(1.0),l9_1241.xyz,float3(l9_1241.w)),l9_1241.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1243=l9_1241.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1243=fast::clamp(l9_1243,0.0,1.0);
}
l9_1242=float4(l9_1241.xyz*l9_1243,l9_1243);
}
else
{
l9_1242=l9_1241;
}
}
float4 l9_1244=l9_1242;
param_18=l9_1244;
}
}
}
float4 l9_1245=param_18;
FinalColor=l9_1245;
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
float4 l9_1246=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1246=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1246=float4(0.0);
}
float4 l9_1247=l9_1246;
float4 Cost=l9_1247;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_19=in.varPos;
float4 param_20=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_19,param_20,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_21=FinalColor;
float4 l9_1248=param_21;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1248.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1248;
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
float4 backCapTexSize;
float4 backCapTexDims;
float4 backCapTexView;
float3x3 backCapTexTransform;
float4 backCapTexUvMinMax;
float4 backCapTexBorderColor;
float2 backCapTexScale;
float2 backCapTexOffset;
float4 backCapStartingColor;
float4 backCapEndingColor;
float backCapGradientRamp;
float backCapMetallic;
float backCapRoughness;
float4 frontCapTexSize;
float4 frontCapTexDims;
float4 frontCapTexView;
float3x3 frontCapTexTransform;
float4 frontCapTexUvMinMax;
float4 frontCapTexBorderColor;
float2 frontCapTexScale;
float2 frontCapTexOffset;
float4 frontCapStartingColor;
float4 frontCapEndingColor;
float frontCapGradientRamp;
float frontCapMetallic;
float frontCapRoughness;
float4 outerEdgeTexSize;
float4 outerEdgeTexDims;
float4 outerEdgeTexView;
float3x3 outerEdgeTexTransform;
float4 outerEdgeTexUvMinMax;
float4 outerEdgeTexBorderColor;
float2 outerEdgeTexScale;
float2 outerEdgeTexOffset;
float4 outerEdgeStartingColor;
float4 outerEdgeEndingColor;
float outerEdgeGradientRamp;
float outerEdgeMetallic;
float outerRoughness;
float4 InnerEdgeTexSize;
float4 InnerEdgeTexDims;
float4 InnerEdgeTexView;
float3x3 InnerEdgeTexTransform;
float4 InnerEdgeTexUvMinMax;
float4 InnerEdgeTexBorderColor;
float2 InnerEdgeTexScale;
float2 InnerEdgeTexOffset;
float4 InnerEdgeStartingColor;
float4 InnerEdgeEndingColor;
float InnerEdgeGradientRamp;
float InnerEdgeMetallic;
float InnerEdgeRoughness;
float4 Port_Import_N129;
float4 Port_Import_N130;
float Port_Input0_N143;
float Port_Input1_N143;
float Port_RangeMinA_N132;
float Port_RangeMaxA_N132;
float Port_RangeMinB_N132;
float Port_RangeMaxB_N132;
float2 Port_Import_N133;
float2 Port_Center_N134;
float2 Port_Import_N135;
float Port_RangeMinA_N164;
float Port_RangeMaxA_N164;
float Port_RangeMinB_N164;
float Port_RangeMaxB_N164;
float2 Port_Import_N137;
float Port_Input1_N142;
float Port_Input2_N142;
float4 Port_Default_N146;
float Port_Opacity_N149;
float3 Port_Normal_N149;
float3 Port_Emissive_N149;
float3 Port_AO_N149;
float3 Port_SpecularAO_N149;
float4 Port_Import_N098;
float4 Port_Import_N099;
float Port_Input0_N112;
float Port_Input1_N112;
float Port_RangeMinA_N101;
float Port_RangeMaxA_N101;
float Port_RangeMinB_N101;
float Port_RangeMaxB_N101;
float2 Port_Import_N102;
float2 Port_Center_N103;
float2 Port_Import_N104;
float Port_RangeMinA_N160;
float Port_RangeMaxA_N160;
float Port_RangeMinB_N160;
float Port_RangeMaxB_N160;
float2 Port_Import_N106;
float Port_Input1_N111;
float Port_Input2_N111;
float4 Port_Default_N010;
float Port_Opacity_N118;
float3 Port_Normal_N118;
float3 Port_Emissive_N118;
float3 Port_AO_N118;
float3 Port_SpecularAO_N118;
float Port_Input1_N054;
float4 Port_Import_N038;
float4 Port_Import_N039;
float Port_Input0_N066;
float Port_Input1_N066;
float Port_RangeMinA_N033;
float Port_RangeMaxA_N033;
float Port_RangeMinB_N033;
float Port_RangeMaxB_N033;
float2 Port_Import_N017;
float2 Port_Center_N047;
float2 Port_Import_N058;
float Port_RangeMinA_N153;
float Port_RangeMaxA_N153;
float Port_RangeMinB_N153;
float Port_RangeMaxB_N153;
float2 Port_Import_N060;
float Port_Input1_N065;
float Port_Input2_N065;
float4 Port_Default_N046;
float Port_Opacity_N057;
float3 Port_Normal_N057;
float3 Port_Emissive_N057;
float3 Port_AO_N057;
float3 Port_SpecularAO_N057;
float4 Port_Import_N020;
float4 Port_Import_N021;
float Port_Input0_N035;
float Port_Input1_N035;
float Port_RangeMinA_N023;
float Port_RangeMaxA_N023;
float Port_RangeMinB_N023;
float Port_RangeMaxB_N023;
float2 Port_Import_N024;
float2 Port_Center_N025;
float2 Port_Import_N026;
float Port_RangeMinA_N155;
float Port_RangeMaxA_N155;
float Port_RangeMinB_N155;
float Port_RangeMaxB_N155;
float2 Port_Import_N028;
float Port_Input1_N034;
float Port_Input2_N034;
float4 Port_Default_N077;
float Port_Opacity_N080;
float3 Port_Normal_N080;
float3 Port_Emissive_N080;
float3 Port_AO_N080;
float3 Port_SpecularAO_N080;
float Port_Input1_N043;
float Port_Input1_N014;
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
texture2d<float> InnerEdgeTex [[id(4)]];
texture2d<float> backCapTex [[id(5)]];
texture2d<float> frontCapTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> outerEdgeTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(21)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler InnerEdgeTexSmpSC [[id(29)]];
sampler backCapTexSmpSC [[id(30)]];
sampler frontCapTexSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler outerEdgeTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
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
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
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
Globals.Surface_UVCoord0=in.varPackedTex.xy;
ssGlobals param=Globals;
if ((int(backCapPBR_tmp)!=0))
{
float l9_0=0.0;
float l9_1=(*sc_set0.UserUniforms).backCapRoughness;
l9_0=l9_1;
float l9_2=(*sc_set0.UserUniforms).Port_Opacity_N149;
float l9_3=l9_0;
ssGlobals l9_4=param;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_4.BumpedNormal=l9_4.VertexNormal_WorldSpace;
}
float l9_5=l9_2;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_5<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_6=gl_FragCoord;
float2 l9_7=floor(mod(l9_6.xy,float2(4.0)));
float l9_8=(mod(dot(l9_7,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_5<l9_8)
{
discard_fragment();
}
}
float3 l9_9=l9_4.PositionWS;
float3 l9_10=l9_4.BumpedNormal;
float l9_11=l9_3;
float3 l9_12=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_9);
if (dot(l9_12,l9_10)>=(-0.050000001))
{
uint3 l9_13=uint3(round((l9_9-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_13.x,l9_13.y,l9_13.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_14=l9_10;
float l9_15=dot(abs(l9_14),float3(1.0));
l9_14/=float3(l9_15);
float l9_16=fast::clamp(-l9_14.z,0.0,1.0);
float2 l9_17=l9_14.xy;
float l9_18;
if (l9_14.x>=0.0)
{
l9_18=l9_16;
}
else
{
l9_18=-l9_16;
}
l9_17.x+=l9_18;
float l9_19;
if (l9_14.y>=0.0)
{
l9_19=l9_16;
}
else
{
l9_19=-l9_16;
}
l9_17.y+=l9_19;
float2 l9_20=l9_17;
float2 l9_21=l9_20;
uint2 l9_22=uint2(as_type<uint>(half2(float2(l9_21.x,0.0))),as_type<uint>(half2(float2(l9_21.y,0.0))));
out.normal_and_more=uint4(l9_22.x,l9_22.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_23;
if (l9_11<0.0)
{
l9_23=1023u;
}
else
{
l9_23=uint(fast::clamp(l9_11,0.0,1.0)*1000.0);
}
uint l9_24=l9_23;
l9_24 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_24;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
}
ssGlobals param_1=Globals;
if ((int(frontCapPBR_tmp)!=0))
{
float l9_25=0.0;
float l9_26=(*sc_set0.UserUniforms).frontCapRoughness;
l9_25=l9_26;
float l9_27=(*sc_set0.UserUniforms).Port_Opacity_N118;
float l9_28=l9_25;
ssGlobals l9_29=param_1;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_29.BumpedNormal=l9_29.VertexNormal_WorldSpace;
}
float l9_30=l9_27;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_30<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_31=gl_FragCoord;
float2 l9_32=floor(mod(l9_31.xy,float2(4.0)));
float l9_33=(mod(dot(l9_32,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_30<l9_33)
{
discard_fragment();
}
}
float3 l9_34=l9_29.PositionWS;
float3 l9_35=l9_29.BumpedNormal;
float l9_36=l9_28;
float3 l9_37=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_34);
if (dot(l9_37,l9_35)>=(-0.050000001))
{
uint3 l9_38=uint3(round((l9_34-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_38.x,l9_38.y,l9_38.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_39=l9_35;
float l9_40=dot(abs(l9_39),float3(1.0));
l9_39/=float3(l9_40);
float l9_41=fast::clamp(-l9_39.z,0.0,1.0);
float2 l9_42=l9_39.xy;
float l9_43;
if (l9_39.x>=0.0)
{
l9_43=l9_41;
}
else
{
l9_43=-l9_41;
}
l9_42.x+=l9_43;
float l9_44;
if (l9_39.y>=0.0)
{
l9_44=l9_41;
}
else
{
l9_44=-l9_41;
}
l9_42.y+=l9_44;
float2 l9_45=l9_42;
float2 l9_46=l9_45;
uint2 l9_47=uint2(as_type<uint>(half2(float2(l9_46.x,0.0))),as_type<uint>(half2(float2(l9_46.y,0.0))));
out.normal_and_more=uint4(l9_47.x,l9_47.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_48;
if (l9_36<0.0)
{
l9_48=1023u;
}
else
{
l9_48=uint(fast::clamp(l9_36,0.0,1.0)*1000.0);
}
uint l9_49=l9_48;
l9_49 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_49;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
}
ssGlobals param_2=Globals;
if ((int(outerEdgePBR_tmp)!=0))
{
float l9_50=0.0;
float l9_51=(*sc_set0.UserUniforms).outerRoughness;
l9_50=l9_51;
float l9_52=(*sc_set0.UserUniforms).Port_Opacity_N057;
float l9_53=l9_50;
ssGlobals l9_54=param_2;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_54.BumpedNormal=l9_54.VertexNormal_WorldSpace;
}
float l9_55=l9_52;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_55<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_56=gl_FragCoord;
float2 l9_57=floor(mod(l9_56.xy,float2(4.0)));
float l9_58=(mod(dot(l9_57,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_55<l9_58)
{
discard_fragment();
}
}
float3 l9_59=l9_54.PositionWS;
float3 l9_60=l9_54.BumpedNormal;
float l9_61=l9_53;
float3 l9_62=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_59);
if (dot(l9_62,l9_60)>=(-0.050000001))
{
uint3 l9_63=uint3(round((l9_59-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_63.x,l9_63.y,l9_63.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_64=l9_60;
float l9_65=dot(abs(l9_64),float3(1.0));
l9_64/=float3(l9_65);
float l9_66=fast::clamp(-l9_64.z,0.0,1.0);
float2 l9_67=l9_64.xy;
float l9_68;
if (l9_64.x>=0.0)
{
l9_68=l9_66;
}
else
{
l9_68=-l9_66;
}
l9_67.x+=l9_68;
float l9_69;
if (l9_64.y>=0.0)
{
l9_69=l9_66;
}
else
{
l9_69=-l9_66;
}
l9_67.y+=l9_69;
float2 l9_70=l9_67;
float2 l9_71=l9_70;
uint2 l9_72=uint2(as_type<uint>(half2(float2(l9_71.x,0.0))),as_type<uint>(half2(float2(l9_71.y,0.0))));
out.normal_and_more=uint4(l9_72.x,l9_72.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_73;
if (l9_61<0.0)
{
l9_73=1023u;
}
else
{
l9_73=uint(fast::clamp(l9_61,0.0,1.0)*1000.0);
}
uint l9_74=l9_73;
l9_74 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_74;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
}
ssGlobals param_3=Globals;
if ((int(innerEdgePBR_tmp)!=0))
{
float l9_75=0.0;
float l9_76=(*sc_set0.UserUniforms).InnerEdgeRoughness;
l9_75=l9_76;
float l9_77=(*sc_set0.UserUniforms).Port_Opacity_N080;
float l9_78=l9_75;
ssGlobals l9_79=param_3;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_79.BumpedNormal=l9_79.VertexNormal_WorldSpace;
}
float l9_80=l9_77;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_80<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_81=gl_FragCoord;
float2 l9_82=floor(mod(l9_81.xy,float2(4.0)));
float l9_83=(mod(dot(l9_82,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_80<l9_83)
{
discard_fragment();
}
}
float3 l9_84=l9_79.PositionWS;
float3 l9_85=l9_79.BumpedNormal;
float l9_86=l9_78;
float3 l9_87=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_84);
if (dot(l9_87,l9_85)>=(-0.050000001))
{
uint3 l9_88=uint3(round((l9_84-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_88.x,l9_88.y,l9_88.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_89=l9_85;
float l9_90=dot(abs(l9_89),float3(1.0));
l9_89/=float3(l9_90);
float l9_91=fast::clamp(-l9_89.z,0.0,1.0);
float2 l9_92=l9_89.xy;
float l9_93;
if (l9_89.x>=0.0)
{
l9_93=l9_91;
}
else
{
l9_93=-l9_91;
}
l9_92.x+=l9_93;
float l9_94;
if (l9_89.y>=0.0)
{
l9_94=l9_91;
}
else
{
l9_94=-l9_91;
}
l9_92.y+=l9_94;
float2 l9_95=l9_92;
float2 l9_96=l9_95;
uint2 l9_97=uint2(as_type<uint>(half2(float2(l9_96.x,0.0))),as_type<uint>(half2(float2(l9_96.y,0.0))));
out.normal_and_more=uint4(l9_97.x,l9_97.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_98;
if (l9_86<0.0)
{
l9_98=1023u;
}
else
{
l9_98=uint(fast::clamp(l9_86,0.0,1.0)*1000.0);
}
uint l9_99=l9_98;
l9_99 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_99;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
}
return out;
}
} // RECEIVER MODE SHADER
