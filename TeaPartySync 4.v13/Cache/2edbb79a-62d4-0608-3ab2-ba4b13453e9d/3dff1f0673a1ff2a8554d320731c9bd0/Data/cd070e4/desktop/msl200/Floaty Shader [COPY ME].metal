#pragma clang diagnostic ignored "-Wmissing-prototypes"
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
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 0:32
//sampler sampler bodyDepthTexSmpSC 0:33
//sampler sampler detailNormalTexSmpSC 0:34
//sampler sampler emissiveTexSmpSC 0:35
//sampler sampler fluidPressureSmpSC 0:36
//sampler sampler heightmapSmpSC 0:37
//sampler sampler intensityTextureSmpSC 0:38
//sampler sampler materialParamsTexSmpSC 0:39
//sampler sampler normalTexSmpSC 0:40
//sampler sampler opacityTexSmpSC 0:41
//sampler sampler reflectionModulationTexSmpSC 0:42
//sampler sampler reflectionTexSmpSC 0:43
//sampler sampler rimColorTexSmpSC 0:44
//sampler sampler sc_EnvmapDiffuseSmpSC 0:45
//sampler sampler sc_EnvmapSpecularSmpSC 0:46
//sampler sampler sc_RayTracedAoTextureSmpSC 0:48
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:49
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:50
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:51
//sampler sampler sc_SSAOTextureSmpSC 0:52
//sampler sampler sc_ScreenTextureSmpSC 0:53
//sampler sampler sc_ShadowTextureSmpSC 0:54
//texture texture2D baseTex 0:1:0:32
//texture texture2D bodyDepthTex 0:2:0:33
//texture texture2D detailNormalTex 0:3:0:34
//texture texture2D emissiveTex 0:4:0:35
//texture texture2D fluidPressure 0:5:0:36
//texture texture2D heightmap 0:6:0:37
//texture texture2D intensityTexture 0:7:0:38
//texture texture2D materialParamsTex 0:8:0:39
//texture texture2D normalTex 0:9:0:40
//texture texture2D opacityTex 0:10:0:41
//texture texture2D reflectionModulationTex 0:11:0:42
//texture texture2D reflectionTex 0:12:0:43
//texture texture2D rimColorTex 0:13:0:44
//texture texture2D sc_EnvmapDiffuse 0:14:0:45
//texture texture2D sc_EnvmapSpecular 0:15:0:46
//texture texture2D sc_RayTracedAoTexture 0:24:0:48
//texture texture2D sc_RayTracedDiffIndTexture 0:25:0:49
//texture texture2D sc_RayTracedReflectionTexture 0:26:0:50
//texture texture2D sc_RayTracedShadowTexture 0:27:0:51
//texture texture2D sc_SSAOTexture 0:28:0:52
//texture texture2D sc_ScreenTexture 0:29:0:53
//texture texture2D sc_ShadowTexture 0:30:0:54
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:56:6272 {
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
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
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
//float alphaTestThreshold 4396
//float3 oceanPos 4400
//float3x3 heightmapTransform 4464
//float4 heightmapUvMinMax 4512
//float4 heightmapBorderColor 4528
//float2 unpackVal 4544
//float3 oceanMin 4560
//float3 oceanMax 4576
//float enableFluid 4592
//float2 pressureRange 4600
//float3x3 fluidPressureTransform 4656
//float4 fluidPressureUvMinMax 4704
//float4 fluidPressureBorderColor 4720
//float speed 4740
//float bodyIntersection 4744
//float4 baseColor 4752
//float3x3 baseTexTransform 4816
//float4 baseTexUvMinMax 4864
//float4 baseTexBorderColor 4880
//float3 recolorRed 4896
//float3 recolorGreen 4912
//float3 recolorBlue 4928
//float3x3 opacityTexTransform 4992
//float4 opacityTexUvMinMax 5040
//float4 opacityTexBorderColor 5056
//float3x3 normalTexTransform 5120
//float4 normalTexUvMinMax 5168
//float4 normalTexBorderColor 5184
//float3x3 detailNormalTexTransform 5248
//float4 detailNormalTexUvMinMax 5296
//float4 detailNormalTexBorderColor 5312
//float3x3 emissiveTexTransform 5376
//float4 emissiveTexUvMinMax 5424
//float4 emissiveTexBorderColor 5440
//float3 emissiveColor 5456
//float emissiveIntensity 5472
//float3x3 reflectionTexTransform 5536
//float4 reflectionTexUvMinMax 5584
//float4 reflectionTexBorderColor 5600
//float reflectionIntensity 5616
//float3x3 reflectionModulationTexTransform 5680
//float4 reflectionModulationTexUvMinMax 5728
//float4 reflectionModulationTexBorderColor 5744
//float3 rimColor 5760
//float rimIntensity 5776
//float rimExponent 5780
//float3x3 rimColorTexTransform 5840
//float4 rimColorTexUvMinMax 5888
//float4 rimColorTexBorderColor 5904
//float metallic 5920
//float roughness 5924
//float3x3 materialParamsTexTransform 5984
//float4 materialParamsTexUvMinMax 6032
//float4 materialParamsTexBorderColor 6048
//float specularAoIntensity 6064
//float specularAoDarkening 6068
//float2 uv2Scale 6072
//float2 uv2Offset 6080
//float2 uv3Scale 6088
//float2 uv3Offset 6096
//float3x3 bodyDepthTexTransform 6160
//float4 bodyDepthTexUvMinMax 6208
//float4 bodyDepthTexBorderColor 6224
//float4 bodyDepthTexProjectionMatrixTerms 6240
//float Port_BobPosSpeed_N153 6256
//float Port_BobPosAmount_N153 6260
//float Port_BobRotSpeed_N153 6264
//float Port_BobRotAmount_N153 6268
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
//spec_const bool ENABLE_BASE_TEX 30 0
//spec_const bool ENABLE_DETAIL_NORMAL 31 0
//spec_const bool ENABLE_EMISSIVE 32 0
//spec_const bool ENABLE_MATERIAL_PARAM_TEX 33 0
//spec_const bool ENABLE_NORMALMAP 34 0
//spec_const bool ENABLE_OPACITY_TEX 35 0
//spec_const bool ENABLE_RECOLOR 36 0
//spec_const bool ENABLE_RIM_HIGHLIGHT 37 0
//spec_const bool ENABLE_RIM_INVERT 38 0
//spec_const bool ENABLE_SIMPLE_REFLECTION 39 0
//spec_const bool ENABLE_SPECULAR_AO 40 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 41 0
//spec_const bool ENABLE_UV2 42 0
//spec_const bool ENABLE_UV3 43 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 44 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex 45 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 46 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 47 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_fluidPressure 48 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_heightmap 49 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 50 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 52 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 53 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 54 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 55 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 56 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 57 0
//spec_const bool SC_USE_UV_MIN_MAX_bodyDepthTex 58 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 59 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 60 0
//spec_const bool SC_USE_UV_MIN_MAX_fluidPressure 61 0
//spec_const bool SC_USE_UV_MIN_MAX_heightmap 62 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 63 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 64 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 65 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 66 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 67 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 68 0
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 69 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 70 0
//spec_const bool SC_USE_UV_TRANSFORM_bodyDepthTex 71 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 72 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 73 0
//spec_const bool SC_USE_UV_TRANSFORM_fluidPressure 74 0
//spec_const bool SC_USE_UV_TRANSFORM_heightmap 75 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 76 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 77 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 78 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 79 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 80 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 81 0
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 82 0
//spec_const bool Tweak_N177 83 0
//spec_const bool Tweak_N216 84 0
//spec_const bool UseViewSpaceDepthVariant 85 1
//spec_const bool baseTexHasSwappedViews 86 0
//spec_const bool bodyDepthTexHasSwappedViews 87 0
//spec_const bool detailNormalTexHasSwappedViews 88 0
//spec_const bool emissiveTexHasSwappedViews 89 0
//spec_const bool fluidPressureHasSwappedViews 90 0
//spec_const bool heightmapHasSwappedViews 91 0
//spec_const bool intensityTextureHasSwappedViews 92 0
//spec_const bool materialParamsTexHasSwappedViews 93 0
//spec_const bool normalTexHasSwappedViews 94 0
//spec_const bool opacityTexHasSwappedViews 95 0
//spec_const bool reflectionModulationTexHasSwappedViews 96 0
//spec_const bool reflectionTexHasSwappedViews 97 0
//spec_const bool rimColorTexHasSwappedViews 98 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 99 0
//spec_const bool sc_BlendMode_Add 100 0
//spec_const bool sc_BlendMode_AlphaTest 101 0
//spec_const bool sc_BlendMode_AlphaToCoverage 102 0
//spec_const bool sc_BlendMode_ColoredGlass 103 0
//spec_const bool sc_BlendMode_Custom 104 0
//spec_const bool sc_BlendMode_Max 105 0
//spec_const bool sc_BlendMode_Min 106 0
//spec_const bool sc_BlendMode_MultiplyOriginal 107 0
//spec_const bool sc_BlendMode_Multiply 108 0
//spec_const bool sc_BlendMode_Normal 109 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 110 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 111 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 112 0
//spec_const bool sc_BlendMode_Screen 113 0
//spec_const bool sc_BlendMode_Software 114 0
//spec_const bool sc_DepthOnly 115 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 116 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 117 0
//spec_const bool sc_FramebufferFetch 118 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 119 0
//spec_const bool sc_HasDiffuseEnvmap 120 0
//spec_const bool sc_IsEditor 121 0
//spec_const bool sc_LightEstimation 122 0
//spec_const bool sc_MotionVectorsPass 123 0
//spec_const bool sc_OITCompositingPass 124 0
//spec_const bool sc_OITDepthBoundsPass 125 0
//spec_const bool sc_OITDepthGatherPass 126 0
//spec_const bool sc_ProjectiveShadowsCaster 127 0
//spec_const bool sc_ProjectiveShadowsReceiver 128 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 129 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 130 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 131 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 132 0
//spec_const bool sc_RenderAlphaToColor 133 0
//spec_const bool sc_SSAOEnabled 134 0
//spec_const bool sc_ScreenTextureHasSwappedViews 135 0
//spec_const bool sc_ShaderComplexityAnalyzer 136 0
//spec_const bool sc_TAAEnabled 137 0
//spec_const bool sc_UseFramebufferFetchMarker 138 0
//spec_const bool sc_VertexBlendingUseNormals 139 0
//spec_const bool sc_VertexBlending 140 0
//spec_const bool uv2EnableAnimation 141 0
//spec_const bool uv3EnableAnimation 142 0
//spec_const int NODE_13_DROPLIST_ITEM 143 0
//spec_const int NODE_181_DROPLIST_ITEM 144 0
//spec_const int NODE_184_DROPLIST_ITEM 145 0
//spec_const int NODE_221_DROPLIST_ITEM 146 0
//spec_const int NODE_228_DROPLIST_ITEM 147 0
//spec_const int NODE_27_DROPLIST_ITEM 148 0
//spec_const int NODE_315_DROPLIST_ITEM 149 0
//spec_const int NODE_38_DROPLIST_ITEM 150 0
//spec_const int NODE_49_DROPLIST_ITEM 151 0
//spec_const int NODE_69_DROPLIST_ITEM 152 0
//spec_const int NODE_76_DROPLIST_ITEM 153 0
//spec_const int SC_DEVICE_CLASS 154 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_fluidPressure 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_heightmap 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 163 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 164 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 165 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 166 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 167 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 168 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex 169 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 170 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 171 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_fluidPressure 172 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_heightmap 173 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 174 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 175 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 176 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 177 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 178 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 179 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 180 -1
//spec_const int baseTexLayout 181 0
//spec_const int bodyDepthTexLayout 182 0
//spec_const int detailNormalTexLayout 183 0
//spec_const int emissiveTexLayout 184 0
//spec_const int fluidPressureLayout 185 0
//spec_const int heightmapLayout 186 0
//spec_const int intensityTextureLayout 187 0
//spec_const int materialParamsTexLayout 188 0
//spec_const int normalTexLayout 189 0
//spec_const int opacityTexLayout 190 0
//spec_const int reflectionModulationTexLayout 191 0
//spec_const int reflectionTexLayout 192 0
//spec_const int rimColorTexLayout 193 0
//spec_const int sc_AmbientLightMode0 194 0
//spec_const int sc_AmbientLightMode1 195 0
//spec_const int sc_AmbientLightMode2 196 0
//spec_const int sc_AmbientLightMode_Constant 197 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 198 0
//spec_const int sc_AmbientLightMode_FromCamera 199 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 200 0
//spec_const int sc_AmbientLightsCount 201 0
//spec_const int sc_DepthBufferMode 202 0
//spec_const int sc_DirectionalLightsCount 203 0
//spec_const int sc_EnvLightMode 204 0
//spec_const int sc_EnvmapDiffuseLayout 205 0
//spec_const int sc_EnvmapSpecularLayout 206 0
//spec_const int sc_LightEstimationSGCount 207 0
//spec_const int sc_MaxTextureImageUnits 208 0
//spec_const int sc_PointLightsCount 209 0
//spec_const int sc_RayTracedAoTextureLayout 210 0
//spec_const int sc_RayTracedDiffIndTextureLayout 211 0
//spec_const int sc_RayTracedReflectionTextureLayout 212 0
//spec_const int sc_RayTracedShadowTextureLayout 213 0
//spec_const int sc_RenderingSpace 214 -1
//spec_const int sc_ScreenTextureLayout 215 0
//spec_const int sc_ShaderCacheConstant 216 0
//spec_const int sc_SkinBonesCount 217 0
//spec_const int sc_StereoRenderingMode 218 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 219 0
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
constant bool ENABLE_BASE_TEX [[function_constant(30)]];
constant bool ENABLE_BASE_TEX_tmp = is_function_constant_defined(ENABLE_BASE_TEX) ? ENABLE_BASE_TEX : false;
constant bool ENABLE_DETAIL_NORMAL [[function_constant(31)]];
constant bool ENABLE_DETAIL_NORMAL_tmp = is_function_constant_defined(ENABLE_DETAIL_NORMAL) ? ENABLE_DETAIL_NORMAL : false;
constant bool ENABLE_EMISSIVE [[function_constant(32)]];
constant bool ENABLE_EMISSIVE_tmp = is_function_constant_defined(ENABLE_EMISSIVE) ? ENABLE_EMISSIVE : false;
constant bool ENABLE_MATERIAL_PARAM_TEX [[function_constant(33)]];
constant bool ENABLE_MATERIAL_PARAM_TEX_tmp = is_function_constant_defined(ENABLE_MATERIAL_PARAM_TEX) ? ENABLE_MATERIAL_PARAM_TEX : false;
constant bool ENABLE_NORMALMAP [[function_constant(34)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_OPACITY_TEX [[function_constant(35)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_RECOLOR [[function_constant(36)]];
constant bool ENABLE_RECOLOR_tmp = is_function_constant_defined(ENABLE_RECOLOR) ? ENABLE_RECOLOR : false;
constant bool ENABLE_RIM_HIGHLIGHT [[function_constant(37)]];
constant bool ENABLE_RIM_HIGHLIGHT_tmp = is_function_constant_defined(ENABLE_RIM_HIGHLIGHT) ? ENABLE_RIM_HIGHLIGHT : false;
constant bool ENABLE_RIM_INVERT [[function_constant(38)]];
constant bool ENABLE_RIM_INVERT_tmp = is_function_constant_defined(ENABLE_RIM_INVERT) ? ENABLE_RIM_INVERT : false;
constant bool ENABLE_SIMPLE_REFLECTION [[function_constant(39)]];
constant bool ENABLE_SIMPLE_REFLECTION_tmp = is_function_constant_defined(ENABLE_SIMPLE_REFLECTION) ? ENABLE_SIMPLE_REFLECTION : false;
constant bool ENABLE_SPECULAR_AO [[function_constant(40)]];
constant bool ENABLE_SPECULAR_AO_tmp = is_function_constant_defined(ENABLE_SPECULAR_AO) ? ENABLE_SPECULAR_AO : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(41)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_UV2 [[function_constant(42)]];
constant bool ENABLE_UV2_tmp = is_function_constant_defined(ENABLE_UV2) ? ENABLE_UV2 : false;
constant bool ENABLE_UV3 [[function_constant(43)]];
constant bool ENABLE_UV3_tmp = is_function_constant_defined(ENABLE_UV3) ? ENABLE_UV3 : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(44)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex [[function_constant(45)]];
constant bool SC_USE_CLAMP_TO_BORDER_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_bodyDepthTex) ? SC_USE_CLAMP_TO_BORDER_bodyDepthTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(46)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex [[function_constant(47)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTex) ? SC_USE_CLAMP_TO_BORDER_emissiveTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure [[function_constant(48)]];
constant bool SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_fluidPressure) ? SC_USE_CLAMP_TO_BORDER_fluidPressure : false;
constant bool SC_USE_CLAMP_TO_BORDER_heightmap [[function_constant(49)]];
constant bool SC_USE_CLAMP_TO_BORDER_heightmap_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_heightmap) ? SC_USE_CLAMP_TO_BORDER_heightmap : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(50)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(51)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(52)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(53)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex [[function_constant(54)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex) ? SC_USE_CLAMP_TO_BORDER_reflectionModulationTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex [[function_constant(55)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionTex) ? SC_USE_CLAMP_TO_BORDER_reflectionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex [[function_constant(56)]];
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_rimColorTex) ? SC_USE_CLAMP_TO_BORDER_rimColorTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(57)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_bodyDepthTex [[function_constant(58)]];
constant bool SC_USE_UV_MIN_MAX_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_bodyDepthTex) ? SC_USE_UV_MIN_MAX_bodyDepthTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(59)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTex [[function_constant(60)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTex) ? SC_USE_UV_MIN_MAX_emissiveTex : false;
constant bool SC_USE_UV_MIN_MAX_fluidPressure [[function_constant(61)]];
constant bool SC_USE_UV_MIN_MAX_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_fluidPressure) ? SC_USE_UV_MIN_MAX_fluidPressure : false;
constant bool SC_USE_UV_MIN_MAX_heightmap [[function_constant(62)]];
constant bool SC_USE_UV_MIN_MAX_heightmap_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_heightmap) ? SC_USE_UV_MIN_MAX_heightmap : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(63)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(64)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(65)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(66)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex [[function_constant(67)]];
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionModulationTex) ? SC_USE_UV_MIN_MAX_reflectionModulationTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionTex [[function_constant(68)]];
constant bool SC_USE_UV_MIN_MAX_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionTex) ? SC_USE_UV_MIN_MAX_reflectionTex : false;
constant bool SC_USE_UV_MIN_MAX_rimColorTex [[function_constant(69)]];
constant bool SC_USE_UV_MIN_MAX_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_rimColorTex) ? SC_USE_UV_MIN_MAX_rimColorTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(70)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_bodyDepthTex [[function_constant(71)]];
constant bool SC_USE_UV_TRANSFORM_bodyDepthTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_bodyDepthTex) ? SC_USE_UV_TRANSFORM_bodyDepthTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(72)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTex [[function_constant(73)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTex) ? SC_USE_UV_TRANSFORM_emissiveTex : false;
constant bool SC_USE_UV_TRANSFORM_fluidPressure [[function_constant(74)]];
constant bool SC_USE_UV_TRANSFORM_fluidPressure_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_fluidPressure) ? SC_USE_UV_TRANSFORM_fluidPressure : false;
constant bool SC_USE_UV_TRANSFORM_heightmap [[function_constant(75)]];
constant bool SC_USE_UV_TRANSFORM_heightmap_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_heightmap) ? SC_USE_UV_TRANSFORM_heightmap : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(76)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(77)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(78)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(79)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex [[function_constant(80)]];
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionModulationTex) ? SC_USE_UV_TRANSFORM_reflectionModulationTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionTex [[function_constant(81)]];
constant bool SC_USE_UV_TRANSFORM_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionTex) ? SC_USE_UV_TRANSFORM_reflectionTex : false;
constant bool SC_USE_UV_TRANSFORM_rimColorTex [[function_constant(82)]];
constant bool SC_USE_UV_TRANSFORM_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_rimColorTex) ? SC_USE_UV_TRANSFORM_rimColorTex : false;
constant bool Tweak_N177 [[function_constant(83)]];
constant bool Tweak_N177_tmp = is_function_constant_defined(Tweak_N177) ? Tweak_N177 : false;
constant bool Tweak_N216 [[function_constant(84)]];
constant bool Tweak_N216_tmp = is_function_constant_defined(Tweak_N216) ? Tweak_N216 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(85)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(86)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool bodyDepthTexHasSwappedViews [[function_constant(87)]];
constant bool bodyDepthTexHasSwappedViews_tmp = is_function_constant_defined(bodyDepthTexHasSwappedViews) ? bodyDepthTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(88)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool emissiveTexHasSwappedViews [[function_constant(89)]];
constant bool emissiveTexHasSwappedViews_tmp = is_function_constant_defined(emissiveTexHasSwappedViews) ? emissiveTexHasSwappedViews : false;
constant bool fluidPressureHasSwappedViews [[function_constant(90)]];
constant bool fluidPressureHasSwappedViews_tmp = is_function_constant_defined(fluidPressureHasSwappedViews) ? fluidPressureHasSwappedViews : false;
constant bool heightmapHasSwappedViews [[function_constant(91)]];
constant bool heightmapHasSwappedViews_tmp = is_function_constant_defined(heightmapHasSwappedViews) ? heightmapHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(92)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(93)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(94)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(95)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool reflectionModulationTexHasSwappedViews [[function_constant(96)]];
constant bool reflectionModulationTexHasSwappedViews_tmp = is_function_constant_defined(reflectionModulationTexHasSwappedViews) ? reflectionModulationTexHasSwappedViews : false;
constant bool reflectionTexHasSwappedViews [[function_constant(97)]];
constant bool reflectionTexHasSwappedViews_tmp = is_function_constant_defined(reflectionTexHasSwappedViews) ? reflectionTexHasSwappedViews : false;
constant bool rimColorTexHasSwappedViews [[function_constant(98)]];
constant bool rimColorTexHasSwappedViews_tmp = is_function_constant_defined(rimColorTexHasSwappedViews) ? rimColorTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(99)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(100)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(101)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(102)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(103)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(104)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(105)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(106)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(107)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(108)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(109)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(110)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(111)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(112)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(113)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_BlendMode_Software [[function_constant(114)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_DepthOnly [[function_constant(115)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(116)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(117)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(118)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(119)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(120)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_IsEditor [[function_constant(121)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_LightEstimation [[function_constant(122)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(123)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(124)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(125)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(126)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(127)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(128)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(129)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(130)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(131)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(132)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(133)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(134)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(135)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(136)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(137)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(138)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(139)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(140)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool uv2EnableAnimation [[function_constant(141)]];
constant bool uv2EnableAnimation_tmp = is_function_constant_defined(uv2EnableAnimation) ? uv2EnableAnimation : false;
constant bool uv3EnableAnimation [[function_constant(142)]];
constant bool uv3EnableAnimation_tmp = is_function_constant_defined(uv3EnableAnimation) ? uv3EnableAnimation : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(143)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(144)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(145)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_221_DROPLIST_ITEM [[function_constant(146)]];
constant int NODE_221_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_221_DROPLIST_ITEM) ? NODE_221_DROPLIST_ITEM : 0;
constant int NODE_228_DROPLIST_ITEM [[function_constant(147)]];
constant int NODE_228_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_228_DROPLIST_ITEM) ? NODE_228_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(148)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_315_DROPLIST_ITEM [[function_constant(149)]];
constant int NODE_315_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_315_DROPLIST_ITEM) ? NODE_315_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(150)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(151)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(152)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int NODE_76_DROPLIST_ITEM [[function_constant(153)]];
constant int NODE_76_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_76_DROPLIST_ITEM) ? NODE_76_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(154)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(155)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex [[function_constant(156)]];
constant int SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex) ? SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(157)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex [[function_constant(158)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure [[function_constant(159)]];
constant int SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_U_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_heightmap [[function_constant(160)]];
constant int SC_SOFTWARE_WRAP_MODE_U_heightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_heightmap) ? SC_SOFTWARE_WRAP_MODE_U_heightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(161)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(162)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(163)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(164)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex [[function_constant(165)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex [[function_constant(166)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex [[function_constant(167)]];
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_U_rimColorTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(168)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex [[function_constant(169)]];
constant int SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex) ? SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(170)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex [[function_constant(171)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure [[function_constant(172)]];
constant int SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_fluidPressure) ? SC_SOFTWARE_WRAP_MODE_V_fluidPressure : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_heightmap [[function_constant(173)]];
constant int SC_SOFTWARE_WRAP_MODE_V_heightmap_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_heightmap) ? SC_SOFTWARE_WRAP_MODE_V_heightmap : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(174)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(175)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(176)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(177)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex [[function_constant(178)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex [[function_constant(179)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex [[function_constant(180)]];
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_V_rimColorTex : -1;
constant int baseTexLayout [[function_constant(181)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int bodyDepthTexLayout [[function_constant(182)]];
constant int bodyDepthTexLayout_tmp = is_function_constant_defined(bodyDepthTexLayout) ? bodyDepthTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(183)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int emissiveTexLayout [[function_constant(184)]];
constant int emissiveTexLayout_tmp = is_function_constant_defined(emissiveTexLayout) ? emissiveTexLayout : 0;
constant int fluidPressureLayout [[function_constant(185)]];
constant int fluidPressureLayout_tmp = is_function_constant_defined(fluidPressureLayout) ? fluidPressureLayout : 0;
constant int heightmapLayout [[function_constant(186)]];
constant int heightmapLayout_tmp = is_function_constant_defined(heightmapLayout) ? heightmapLayout : 0;
constant int intensityTextureLayout [[function_constant(187)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(188)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(189)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(190)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int reflectionModulationTexLayout [[function_constant(191)]];
constant int reflectionModulationTexLayout_tmp = is_function_constant_defined(reflectionModulationTexLayout) ? reflectionModulationTexLayout : 0;
constant int reflectionTexLayout [[function_constant(192)]];
constant int reflectionTexLayout_tmp = is_function_constant_defined(reflectionTexLayout) ? reflectionTexLayout : 0;
constant int rimColorTexLayout [[function_constant(193)]];
constant int rimColorTexLayout_tmp = is_function_constant_defined(rimColorTexLayout) ? rimColorTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(194)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(195)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(196)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(197)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(198)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(199)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(200)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(201)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(202)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(203)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(204)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(205)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(206)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(207)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(208)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(209)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(210)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(211)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(212)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(213)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(214)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(215)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(216)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(217)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(218)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(219)]];
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
float2 N7_TransformedUV2;
float2 N7_TransformedUV3;
float3 SurfacePosition_ObjectSpace;
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
float3 oceanPos;
float4 heightmapSize;
float4 heightmapDims;
float4 heightmapView;
float3x3 heightmapTransform;
float4 heightmapUvMinMax;
float4 heightmapBorderColor;
float2 unpackVal;
float3 oceanMin;
float3 oceanMax;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float speed;
float bodyIntersection;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float3 recolorRed;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float reflectionIntensity;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float rimExponent;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float metallic;
float roughness;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float specularAoIntensity;
float specularAoDarkening;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_BobPosSpeed_N153;
float Port_BobPosAmount_N153;
float Port_BobRotSpeed_N153;
float Port_BobRotAmount_N153;
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
texture2d<float> baseTex [[id(1)]];
texture2d<float> bodyDepthTex [[id(2)]];
texture2d<float> detailNormalTex [[id(3)]];
texture2d<float> emissiveTex [[id(4)]];
texture2d<float> fluidPressure [[id(5)]];
texture2d<float> heightmap [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
sampler baseTexSmpSC [[id(32)]];
sampler bodyDepthTexSmpSC [[id(33)]];
sampler detailNormalTexSmpSC [[id(34)]];
sampler emissiveTexSmpSC [[id(35)]];
sampler fluidPressureSmpSC [[id(36)]];
sampler heightmapSmpSC [[id(37)]];
sampler intensityTextureSmpSC [[id(38)]];
sampler materialParamsTexSmpSC [[id(39)]];
sampler normalTexSmpSC [[id(40)]];
sampler opacityTexSmpSC [[id(41)]];
sampler reflectionModulationTexSmpSC [[id(42)]];
sampler reflectionTexSmpSC [[id(43)]];
sampler rimColorTexSmpSC [[id(44)]];
sampler sc_EnvmapDiffuseSmpSC [[id(45)]];
sampler sc_EnvmapSpecularSmpSC [[id(46)]];
sampler sc_RayTracedAoTextureSmpSC [[id(48)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(49)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(50)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(51)]];
sampler sc_SSAOTextureSmpSC [[id(52)]];
sampler sc_ScreenTextureSmpSC [[id(53)]];
sampler sc_ShadowTextureSmpSC [[id(54)]];
constant userUniformsObj* UserUniforms [[id(56)]];
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
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
float3 N153_OceanWorldTransform=float3(0.0);
float2 N153_UnpackVal=float2(0.0);
float3 N153_OceanAabbMin=float3(0.0);
float3 N153_OceanAabbMax=float3(0.0);
float N153_EnableFluid=0.0;
float2 N153_PressureRange=float2(0.0);
float N153_BobPosSpeed=0.0;
float N153_BobPosAmount=0.0;
float N153_BobRotSpeed=0.0;
float N153_BobRotAmount=0.0;
float N153_Speed=0.0;
float3 N153_Result=float3(0.0);
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
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 Output_N9=float3(0.0);
float3 param_1=(*sc_set0.UserUniforms).oceanPos;
Output_N9=param_1;
float2 Output_N20=float2(0.0);
float2 param_2=(*sc_set0.UserUniforms).unpackVal;
Output_N20=param_2;
float3 Output_N145=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).oceanMin;
Output_N145=param_3;
float3 Output_N146=float3(0.0);
float3 param_4=(*sc_set0.UserUniforms).oceanMax;
Output_N146=param_4;
float Output_N21=0.0;
float param_5=(*sc_set0.UserUniforms).enableFluid;
Output_N21=param_5;
float2 Output_N12=float2(0.0);
float2 param_6=(*sc_set0.UserUniforms).pressureRange;
Output_N12=param_6;
float Output_N19=0.0;
float param_7=(*sc_set0.UserUniforms).speed;
Output_N19=param_7;
float3 Result_N153=float3(0.0);
float3 param_8=Output_N9;
float2 param_9=Output_N20;
float3 param_10=Output_N145;
float3 param_11=Output_N146;
float param_12=Output_N21;
float2 param_13=Output_N12;
float param_14=(*sc_set0.UserUniforms).Port_BobPosSpeed_N153;
float param_15=(*sc_set0.UserUniforms).Port_BobPosAmount_N153;
float param_16=(*sc_set0.UserUniforms).Port_BobRotSpeed_N153;
float param_17=(*sc_set0.UserUniforms).Port_BobRotAmount_N153;
float param_18=Output_N19;
ssGlobals param_20=Globals;
ssGlobals tempGlobals=param_20;
float3 param_19=float3(0.0);
N153_OceanWorldTransform=param_8;
N153_UnpackVal=param_9;
N153_OceanAabbMin=param_10;
N153_OceanAabbMax=param_11;
N153_EnableFluid=param_12;
N153_PressureRange=param_13;
N153_BobPosSpeed=param_14;
N153_BobPosAmount=param_15;
N153_BobRotSpeed=param_16;
N153_BobRotAmount=param_17;
N153_Speed=param_18;
float4x4 l9_119=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_120=l9_119[3].xyz;
float2 l9_121=float2(N153_OceanAabbMin.x,N153_OceanAabbMin.z);
float2 l9_122=float2(N153_OceanAabbMax.x,N153_OceanAabbMax.z);
float2 l9_123=float2(0.0)+(((l9_120.xz-l9_121)*1.0)/((l9_122-l9_121)+float2(1e-06)));
l9_123.y=1.0-l9_123.y;
float2 l9_124=l9_123;
float4 l9_125=float4(0.0);
int l9_126=0;
if ((int(heightmapHasSwappedViews_tmp)!=0))
{
int l9_127=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_127=0;
}
else
{
l9_127=gl_InstanceIndex%2;
}
int l9_128=l9_127;
l9_126=1-l9_128;
}
else
{
int l9_129=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_129=0;
}
else
{
l9_129=gl_InstanceIndex%2;
}
int l9_130=l9_129;
l9_126=l9_130;
}
int l9_131=l9_126;
int l9_132=heightmapLayout_tmp;
int l9_133=l9_131;
float2 l9_134=l9_124;
bool l9_135=(int(SC_USE_UV_TRANSFORM_heightmap_tmp)!=0);
float3x3 l9_136=(*sc_set0.UserUniforms).heightmapTransform;
int2 l9_137=int2(SC_SOFTWARE_WRAP_MODE_U_heightmap_tmp,SC_SOFTWARE_WRAP_MODE_V_heightmap_tmp);
bool l9_138=(int(SC_USE_UV_MIN_MAX_heightmap_tmp)!=0);
float4 l9_139=(*sc_set0.UserUniforms).heightmapUvMinMax;
bool l9_140=(int(SC_USE_CLAMP_TO_BORDER_heightmap_tmp)!=0);
float4 l9_141=(*sc_set0.UserUniforms).heightmapBorderColor;
float l9_142=0.0;
bool l9_143=l9_140&&(!l9_138);
float l9_144=1.0;
float l9_145=l9_134.x;
int l9_146=l9_137.x;
if (l9_146==1)
{
l9_145=fract(l9_145);
}
else
{
if (l9_146==2)
{
float l9_147=fract(l9_145);
float l9_148=l9_145-l9_147;
float l9_149=step(0.25,fract(l9_148*0.5));
l9_145=mix(l9_147,1.0-l9_147,fast::clamp(l9_149,0.0,1.0));
}
}
l9_134.x=l9_145;
float l9_150=l9_134.y;
int l9_151=l9_137.y;
if (l9_151==1)
{
l9_150=fract(l9_150);
}
else
{
if (l9_151==2)
{
float l9_152=fract(l9_150);
float l9_153=l9_150-l9_152;
float l9_154=step(0.25,fract(l9_153*0.5));
l9_150=mix(l9_152,1.0-l9_152,fast::clamp(l9_154,0.0,1.0));
}
}
l9_134.y=l9_150;
if (l9_138)
{
bool l9_155=l9_140;
bool l9_156;
if (l9_155)
{
l9_156=l9_137.x==3;
}
else
{
l9_156=l9_155;
}
float l9_157=l9_134.x;
float l9_158=l9_139.x;
float l9_159=l9_139.z;
bool l9_160=l9_156;
float l9_161=l9_144;
float l9_162=fast::clamp(l9_157,l9_158,l9_159);
float l9_163=step(abs(l9_157-l9_162),9.9999997e-06);
l9_161*=(l9_163+((1.0-float(l9_160))*(1.0-l9_163)));
l9_157=l9_162;
l9_134.x=l9_157;
l9_144=l9_161;
bool l9_164=l9_140;
bool l9_165;
if (l9_164)
{
l9_165=l9_137.y==3;
}
else
{
l9_165=l9_164;
}
float l9_166=l9_134.y;
float l9_167=l9_139.y;
float l9_168=l9_139.w;
bool l9_169=l9_165;
float l9_170=l9_144;
float l9_171=fast::clamp(l9_166,l9_167,l9_168);
float l9_172=step(abs(l9_166-l9_171),9.9999997e-06);
l9_170*=(l9_172+((1.0-float(l9_169))*(1.0-l9_172)));
l9_166=l9_171;
l9_134.y=l9_166;
l9_144=l9_170;
}
float2 l9_173=l9_134;
bool l9_174=l9_135;
float3x3 l9_175=l9_136;
if (l9_174)
{
l9_173=float2((l9_175*float3(l9_173,1.0)).xy);
}
float2 l9_176=l9_173;
float2 l9_177=l9_176;
float2 l9_178=l9_177;
l9_134=l9_178;
float l9_179=l9_134.x;
int l9_180=l9_137.x;
bool l9_181=l9_143;
float l9_182=l9_144;
if ((l9_180==0)||(l9_180==3))
{
float l9_183=l9_179;
float l9_184=0.0;
float l9_185=1.0;
bool l9_186=l9_181;
float l9_187=l9_182;
float l9_188=fast::clamp(l9_183,l9_184,l9_185);
float l9_189=step(abs(l9_183-l9_188),9.9999997e-06);
l9_187*=(l9_189+((1.0-float(l9_186))*(1.0-l9_189)));
l9_183=l9_188;
l9_179=l9_183;
l9_182=l9_187;
}
l9_134.x=l9_179;
l9_144=l9_182;
float l9_190=l9_134.y;
int l9_191=l9_137.y;
bool l9_192=l9_143;
float l9_193=l9_144;
if ((l9_191==0)||(l9_191==3))
{
float l9_194=l9_190;
float l9_195=0.0;
float l9_196=1.0;
bool l9_197=l9_192;
float l9_198=l9_193;
float l9_199=fast::clamp(l9_194,l9_195,l9_196);
float l9_200=step(abs(l9_194-l9_199),9.9999997e-06);
l9_198*=(l9_200+((1.0-float(l9_197))*(1.0-l9_200)));
l9_194=l9_199;
l9_190=l9_194;
l9_193=l9_198;
}
l9_134.y=l9_190;
l9_144=l9_193;
float2 l9_201=l9_134;
int l9_202=l9_132;
int l9_203=l9_133;
float l9_204=l9_142;
float2 l9_205=l9_201;
int l9_206=l9_202;
int l9_207=l9_203;
float3 l9_208=float3(0.0);
if (l9_206==0)
{
l9_208=float3(l9_205,0.0);
}
else
{
if (l9_206==1)
{
l9_208=float3(l9_205.x,(l9_205.y*0.5)+(0.5-(float(l9_207)*0.5)),0.0);
}
else
{
l9_208=float3(l9_205,float(l9_207));
}
}
float3 l9_209=l9_208;
float3 l9_210=l9_209;
float2 l9_211=l9_210.xy;
float l9_212=l9_204;
float4 l9_213=sc_set0.heightmap.sample(sc_set0.heightmapSmpSC,l9_211,level(l9_212));
float4 l9_214=l9_213;
float4 l9_215=l9_214;
if (l9_140)
{
l9_215=mix(l9_141,l9_215,float4(l9_144));
}
float4 l9_216=l9_215;
l9_125=l9_216;
float4 l9_217=l9_125;
float2 l9_218=l9_217.xy;
float l9_219=N153_UnpackVal.x;
float l9_220=N153_UnpackVal.y;
float l9_221=0.0;
float2 l9_222=l9_218;
float l9_223=l9_219;
float l9_224=l9_220;
float l9_225=0.99998999;
float2 l9_226=l9_222;
#if (1)
{
l9_226=floor((l9_226*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_227=dot(l9_226,float2(1.0,0.0039215689));
float l9_228=l9_227;
float l9_229=0.0;
float l9_230=l9_225;
float l9_231=l9_223;
float l9_232=l9_224;
float l9_233=l9_231+(((l9_228-l9_229)*(l9_232-l9_231))/(l9_230-l9_229));
float l9_234=l9_233;
l9_221=l9_234;
float l9_235=l9_221;
float l9_236=l9_235+N153_OceanWorldTransform.y;
float l9_237=0.0+(((l9_236-N153_UnpackVal.x)*1.0)/((N153_UnpackVal.y-N153_UnpackVal.x)+1e-06));
float l9_238=l9_237;
float l9_239=0.0;
if (N153_EnableFluid==1.0)
{
float2 l9_240=l9_123;
float4 l9_241=float4(0.0);
int l9_242=0;
if ((int(fluidPressureHasSwappedViews_tmp)!=0))
{
int l9_243=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_243=0;
}
else
{
l9_243=gl_InstanceIndex%2;
}
int l9_244=l9_243;
l9_242=1-l9_244;
}
else
{
int l9_245=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_245=0;
}
else
{
l9_245=gl_InstanceIndex%2;
}
int l9_246=l9_245;
l9_242=l9_246;
}
int l9_247=l9_242;
int l9_248=fluidPressureLayout_tmp;
int l9_249=l9_247;
float2 l9_250=l9_240;
bool l9_251=(int(SC_USE_UV_TRANSFORM_fluidPressure_tmp)!=0);
float3x3 l9_252=(*sc_set0.UserUniforms).fluidPressureTransform;
int2 l9_253=int2(SC_SOFTWARE_WRAP_MODE_U_fluidPressure_tmp,SC_SOFTWARE_WRAP_MODE_V_fluidPressure_tmp);
bool l9_254=(int(SC_USE_UV_MIN_MAX_fluidPressure_tmp)!=0);
float4 l9_255=(*sc_set0.UserUniforms).fluidPressureUvMinMax;
bool l9_256=(int(SC_USE_CLAMP_TO_BORDER_fluidPressure_tmp)!=0);
float4 l9_257=(*sc_set0.UserUniforms).fluidPressureBorderColor;
float l9_258=0.0;
bool l9_259=l9_256&&(!l9_254);
float l9_260=1.0;
float l9_261=l9_250.x;
int l9_262=l9_253.x;
if (l9_262==1)
{
l9_261=fract(l9_261);
}
else
{
if (l9_262==2)
{
float l9_263=fract(l9_261);
float l9_264=l9_261-l9_263;
float l9_265=step(0.25,fract(l9_264*0.5));
l9_261=mix(l9_263,1.0-l9_263,fast::clamp(l9_265,0.0,1.0));
}
}
l9_250.x=l9_261;
float l9_266=l9_250.y;
int l9_267=l9_253.y;
if (l9_267==1)
{
l9_266=fract(l9_266);
}
else
{
if (l9_267==2)
{
float l9_268=fract(l9_266);
float l9_269=l9_266-l9_268;
float l9_270=step(0.25,fract(l9_269*0.5));
l9_266=mix(l9_268,1.0-l9_268,fast::clamp(l9_270,0.0,1.0));
}
}
l9_250.y=l9_266;
if (l9_254)
{
bool l9_271=l9_256;
bool l9_272;
if (l9_271)
{
l9_272=l9_253.x==3;
}
else
{
l9_272=l9_271;
}
float l9_273=l9_250.x;
float l9_274=l9_255.x;
float l9_275=l9_255.z;
bool l9_276=l9_272;
float l9_277=l9_260;
float l9_278=fast::clamp(l9_273,l9_274,l9_275);
float l9_279=step(abs(l9_273-l9_278),9.9999997e-06);
l9_277*=(l9_279+((1.0-float(l9_276))*(1.0-l9_279)));
l9_273=l9_278;
l9_250.x=l9_273;
l9_260=l9_277;
bool l9_280=l9_256;
bool l9_281;
if (l9_280)
{
l9_281=l9_253.y==3;
}
else
{
l9_281=l9_280;
}
float l9_282=l9_250.y;
float l9_283=l9_255.y;
float l9_284=l9_255.w;
bool l9_285=l9_281;
float l9_286=l9_260;
float l9_287=fast::clamp(l9_282,l9_283,l9_284);
float l9_288=step(abs(l9_282-l9_287),9.9999997e-06);
l9_286*=(l9_288+((1.0-float(l9_285))*(1.0-l9_288)));
l9_282=l9_287;
l9_250.y=l9_282;
l9_260=l9_286;
}
float2 l9_289=l9_250;
bool l9_290=l9_251;
float3x3 l9_291=l9_252;
if (l9_290)
{
l9_289=float2((l9_291*float3(l9_289,1.0)).xy);
}
float2 l9_292=l9_289;
float2 l9_293=l9_292;
float2 l9_294=l9_293;
l9_250=l9_294;
float l9_295=l9_250.x;
int l9_296=l9_253.x;
bool l9_297=l9_259;
float l9_298=l9_260;
if ((l9_296==0)||(l9_296==3))
{
float l9_299=l9_295;
float l9_300=0.0;
float l9_301=1.0;
bool l9_302=l9_297;
float l9_303=l9_298;
float l9_304=fast::clamp(l9_299,l9_300,l9_301);
float l9_305=step(abs(l9_299-l9_304),9.9999997e-06);
l9_303*=(l9_305+((1.0-float(l9_302))*(1.0-l9_305)));
l9_299=l9_304;
l9_295=l9_299;
l9_298=l9_303;
}
l9_250.x=l9_295;
l9_260=l9_298;
float l9_306=l9_250.y;
int l9_307=l9_253.y;
bool l9_308=l9_259;
float l9_309=l9_260;
if ((l9_307==0)||(l9_307==3))
{
float l9_310=l9_306;
float l9_311=0.0;
float l9_312=1.0;
bool l9_313=l9_308;
float l9_314=l9_309;
float l9_315=fast::clamp(l9_310,l9_311,l9_312);
float l9_316=step(abs(l9_310-l9_315),9.9999997e-06);
l9_314*=(l9_316+((1.0-float(l9_313))*(1.0-l9_316)));
l9_310=l9_315;
l9_306=l9_310;
l9_309=l9_314;
}
l9_250.y=l9_306;
l9_260=l9_309;
float2 l9_317=l9_250;
int l9_318=l9_248;
int l9_319=l9_249;
float l9_320=l9_258;
float2 l9_321=l9_317;
int l9_322=l9_318;
int l9_323=l9_319;
float3 l9_324=float3(0.0);
if (l9_322==0)
{
l9_324=float3(l9_321,0.0);
}
else
{
if (l9_322==1)
{
l9_324=float3(l9_321.x,(l9_321.y*0.5)+(0.5-(float(l9_323)*0.5)),0.0);
}
else
{
l9_324=float3(l9_321,float(l9_323));
}
}
float3 l9_325=l9_324;
float3 l9_326=l9_325;
float2 l9_327=l9_326.xy;
float l9_328=l9_320;
float4 l9_329=sc_set0.fluidPressure.sample(sc_set0.fluidPressureSmpSC,l9_327,level(l9_328));
float4 l9_330=l9_329;
float4 l9_331=l9_330;
if (l9_256)
{
l9_331=mix(l9_257,l9_331,float4(l9_260));
}
float4 l9_332=l9_331;
l9_241=l9_332;
float4 l9_333=l9_241;
float2 l9_334=l9_333.xy;
float l9_335=N153_PressureRange.x;
float l9_336=N153_PressureRange.y;
float l9_337=0.0;
float2 l9_338=l9_334;
float l9_339=l9_335;
float l9_340=l9_336;
float l9_341=0.99998999;
float2 l9_342=l9_338;
#if (1)
{
l9_342=floor((l9_342*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_343=dot(l9_342,float2(1.0,0.0039215689));
float l9_344=l9_343;
float l9_345=0.0;
float l9_346=l9_341;
float l9_347=l9_339;
float l9_348=l9_340;
float l9_349=l9_347+(((l9_344-l9_345)*(l9_348-l9_347))/(l9_346-l9_345));
float l9_350=l9_349;
l9_337=l9_350;
float l9_351=l9_337;
l9_239=l9_351;
float l9_352=(-1.0)+(((l9_239-0.0)*2.0)/1.000001);
l9_238=(l9_237+l9_352)/2.0;
}
float l9_353=tempGlobals.gTimeElapsed;
float l9_354=l9_353*N153_Speed;
float l9_355=(sin(l9_354*N153_BobPosSpeed)*l9_238)*N153_BobPosAmount;
float l9_356=(sin(l9_354*N153_BobRotSpeed)*l9_238)*N153_BobRotAmount;
float l9_357=(sin((l9_354-1.0)*N153_BobRotSpeed)*l9_238)*N153_BobRotAmount;
float3 l9_358=float3(l9_356,0.0,l9_357);
float3 l9_359=tempGlobals.SurfacePosition_ObjectSpace;
float3 l9_360=l9_359;
float3 l9_361=l9_358;
float3 l9_362=l9_360;
float l9_363=cos(radians(l9_361.x));
float l9_364=sin(radians(l9_361.x));
float l9_365=cos(radians(l9_361.y));
float l9_366=sin(radians(l9_361.y));
float l9_367=cos(radians(l9_361.z));
float l9_368=sin(radians(l9_361.z));
float4x4 l9_369=float4x4(float4(l9_365*l9_367,(l9_363*l9_368)+((l9_364*l9_366)*l9_367),(l9_364*l9_368)-((l9_363*l9_366)*l9_367),0.0),float4((-l9_365)*l9_368,(l9_363*l9_367)-((l9_364*l9_366)*l9_368),(l9_364*l9_367)+((l9_363*l9_366)*l9_368),0.0),float4(l9_366,(-l9_364)*l9_365,l9_363*l9_365,0.0),float4(l9_362.x,l9_362.y,l9_362.z,1.0));
float4x4 l9_370=l9_369;
float4x4 l9_371=l9_370;
float3 l9_372=float3(float3x3(l9_371[0].xyz,l9_371[1].xyz,l9_371[2].xyz)*l9_360);
float4x4 l9_373=(*sc_set0.UserUniforms).sc_ModelMatrix;
N153_Result=float3((l9_373*float4(l9_372,1.0)).xyz)+float3(0.0,(l9_236+l9_239)+l9_355,0.0);
param_19=N153_Result;
Result_N153=param_19;
WorldPosition=Result_N153;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_21=v;
float3 param_22=WorldPosition;
float3 param_23=WorldNormal;
float3 param_24=WorldTangent;
float4 param_25=v.position;
out.varPos=param_22;
out.varNormal=normalize(param_23);
float3 l9_374=normalize(param_24);
out.varTangent=float4(l9_374.x,l9_374.y,l9_374.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_375=param_21.position;
float4 l9_376=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_377=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_377=0;
}
else
{
l9_377=gl_InstanceIndex%2;
}
int l9_378=l9_377;
l9_376=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_378]*l9_375;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_379=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_379=0;
}
else
{
l9_379=gl_InstanceIndex%2;
}
int l9_380=l9_379;
l9_376=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_380]*l9_375;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_381=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_381=0;
}
else
{
l9_381=gl_InstanceIndex%2;
}
int l9_382=l9_381;
l9_376=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_382]*l9_375;
}
else
{
l9_376=l9_375;
}
}
}
float4 l9_383=l9_376;
out.varViewSpaceDepth=-l9_383.z;
}
float4 l9_384=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_384=param_25;
}
else
{
if (sc_RenderingSpace_tmp==4)
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
l9_384=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_386]*param_21.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_387=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_387=0;
}
else
{
l9_387=gl_InstanceIndex%2;
}
int l9_388=l9_387;
l9_384=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_388]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_389=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_389=0;
}
else
{
l9_389=gl_InstanceIndex%2;
}
int l9_390=l9_389;
l9_384=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_390]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_21.texture0,param_21.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_391=param_21.position;
float4 l9_392=l9_391;
if (sc_RenderingSpace_tmp==1)
{
l9_392=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_391;
}
float4 l9_393=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_392;
float2 l9_394=((l9_393.xy/float2(l9_393.w))*0.5)+float2(0.5);
out.varShadowTex=l9_394;
}
float4 l9_395=l9_384;
if (sc_DepthBufferMode_tmp==1)
{
int l9_396=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_396=0;
}
else
{
l9_396=gl_InstanceIndex%2;
}
int l9_397=l9_396;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_397][2].w!=0.0)
{
float l9_398=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_395.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_395.w))*l9_398)-1.0)*l9_395.w;
}
}
float4 l9_399=l9_395;
l9_384=l9_399;
float4 l9_400=l9_384;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_401=l9_400.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_400.w);
l9_400=float4(l9_401.x,l9_401.y,l9_400.z,l9_400.w);
}
float4 l9_402=l9_400;
l9_384=l9_402;
float4 l9_403=l9_384;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_403.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_404=l9_403;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_405=dot(l9_404,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_406=l9_405;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_406;
}
}
float4 l9_407=float4(l9_403.x,-l9_403.y,(l9_403.z*0.5)+(l9_403.w*0.5),l9_403.w);
out.gl_Position=l9_407;
v=param_21;
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
float2 N7_TransformedUV2;
float2 N7_TransformedUV3;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float4 VertexColor;
float2 gScreenCoord;
float3 SurfacePosition_WorldSpace;
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
float3 oceanPos;
float4 heightmapSize;
float4 heightmapDims;
float4 heightmapView;
float3x3 heightmapTransform;
float4 heightmapUvMinMax;
float4 heightmapBorderColor;
float2 unpackVal;
float3 oceanMin;
float3 oceanMax;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float speed;
float bodyIntersection;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float3 recolorRed;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float reflectionIntensity;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float rimExponent;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float metallic;
float roughness;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float specularAoIntensity;
float specularAoDarkening;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_BobPosSpeed_N153;
float Port_BobPosAmount_N153;
float Port_BobRotSpeed_N153;
float Port_BobRotAmount_N153;
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
texture2d<float> baseTex [[id(1)]];
texture2d<float> bodyDepthTex [[id(2)]];
texture2d<float> detailNormalTex [[id(3)]];
texture2d<float> emissiveTex [[id(4)]];
texture2d<float> fluidPressure [[id(5)]];
texture2d<float> heightmap [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
sampler baseTexSmpSC [[id(32)]];
sampler bodyDepthTexSmpSC [[id(33)]];
sampler detailNormalTexSmpSC [[id(34)]];
sampler emissiveTexSmpSC [[id(35)]];
sampler fluidPressureSmpSC [[id(36)]];
sampler heightmapSmpSC [[id(37)]];
sampler intensityTextureSmpSC [[id(38)]];
sampler materialParamsTexSmpSC [[id(39)]];
sampler normalTexSmpSC [[id(40)]];
sampler opacityTexSmpSC [[id(41)]];
sampler reflectionModulationTexSmpSC [[id(42)]];
sampler reflectionTexSmpSC [[id(43)]];
sampler rimColorTexSmpSC [[id(44)]];
sampler sc_EnvmapDiffuseSmpSC [[id(45)]];
sampler sc_EnvmapSpecularSmpSC [[id(46)]];
sampler sc_RayTracedAoTextureSmpSC [[id(48)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(49)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(50)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(51)]];
sampler sc_SSAOTextureSmpSC [[id(52)]];
sampler sc_ScreenTextureSmpSC [[id(53)]];
sampler sc_ShadowTextureSmpSC [[id(54)]];
constant userUniformsObj* UserUniforms [[id(56)]];
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
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
float N22_EnableBodyDepth=0.0;
float4 N22_OceanColor=float4(0.0);
float N22_BodyDepth=0.0;
float N22_cameraDepth=0.0;
float4 N22_Result=float4(0.0);
int N7_VertexColorSwitch=0;
float4 N7_BaseColorValue=float4(0.0);
bool N7_EnableBaseTexture=false;
int N7_BaseTextureUVSwitch=0;
bool N7_EnableRecolor=false;
float3 N7_RecolorR=float3(0.0);
float3 N7_RecolorG=float3(0.0);
float3 N7_RecolorB=float3(0.0);
bool N7_EnableOpacityTexture=false;
int N7_OpacityUVSwitch=0;
bool N7_EnableNormalTexture=false;
int N7_NormalUVSwitch=0;
bool N7_EnableDetailNormal=false;
int N7_Detail_NormalUVSwitch=0;
bool N7_EnableEmissiveTexture=false;
int N7_EmissiveUVSwitch=0;
float3 N7_EmissiveColor=float3(0.0);
float N7_EmissiveIntensity=0.0;
bool N7_EnableSimpleReflection=false;
float N7_ReflectionIntensity=0.0;
bool N7_EnableModulationTexture=false;
int N7_ModuationUVSwitch=0;
bool N7_EnableRimHighlight=false;
float3 N7_RimColor=float3(0.0);
float N7_RimIntensity=0.0;
float N7_RimExponent=0.0;
bool N7_EnableRimColorTexture=false;
bool N7_EnableRimInvert=false;
int N7_RimUVSwitch=0;
bool N7_EnableMaterialParamsTexture=false;
float N7_MetallicValue=0.0;
float N7_RoughnessValue=0.0;
int N7_MaterialParamsUVSwitch=0;
bool N7_EnableSpecularAO=false;
float N7_Intensity=0.0;
float N7_Darkening=0.0;
bool N7_EnableUV2=false;
int N7_UV2Switch=0;
float2 N7_UV2Scale=float2(0.0);
float2 N7_UV2Offset=float2(0.0);
bool N7_UV2Animation=false;
bool N7_EnableUV3=false;
int N7_UV3Switch=0;
float2 N7_UV3Scale=float2(0.0);
float2 N7_UV3Offset=float2(0.0);
bool N7_UV3Animation=false;
float4 N7_Albedo=float4(0.0);
float N7_Opacity=0.0;
float3 N7_Normal=float3(0.0);
float3 N7_Emissive=float3(0.0);
float N7_Metallic=0.0;
float N7_Roughness=0.0;
float3 N7_AO=float3(0.0);
float3 N7_SpecularAO=float3(0.0);
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
float4 FinalColor=float4(0.0,0.99144,1.0,1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
Globals.VertexColor=in.varColor;
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
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float Output_N24=0.0;
float param=(*sc_set0.UserUniforms).bodyIntersection;
Output_N24=param;
float4 Output_N5=float4(0.0);
float4 param_1=(*sc_set0.UserUniforms).baseColor;
Output_N5=param_1;
float3 Output_N85=float3(0.0);
float3 param_2=(*sc_set0.UserUniforms).recolorRed;
Output_N85=param_2;
float3 Output_N86=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).recolorGreen;
Output_N86=param_3;
float3 Output_N87=float3(0.0);
float3 param_4=(*sc_set0.UserUniforms).recolorBlue;
Output_N87=param_4;
float3 Output_N236=float3(0.0);
float3 param_5=(*sc_set0.UserUniforms).emissiveColor;
Output_N236=param_5;
float Output_N233=0.0;
float param_6=(*sc_set0.UserUniforms).emissiveIntensity;
Output_N233=param_6;
float Output_N225=0.0;
float param_7=(*sc_set0.UserUniforms).reflectionIntensity;
Output_N225=param_7;
float3 Output_N309=float3(0.0);
float3 param_8=(*sc_set0.UserUniforms).rimColor;
Output_N309=param_8;
float Output_N310=0.0;
float param_9=(*sc_set0.UserUniforms).rimIntensity;
Output_N310=param_9;
float Output_N311=0.0;
float param_10=(*sc_set0.UserUniforms).rimExponent;
Output_N311=param_10;
float Output_N242=0.0;
float param_11=(*sc_set0.UserUniforms).metallic;
Output_N242=param_11;
float Output_N243=0.0;
float param_12=(*sc_set0.UserUniforms).roughness;
Output_N243=param_12;
float Output_N244=0.0;
float param_13=(*sc_set0.UserUniforms).specularAoIntensity;
Output_N244=param_13;
float Output_N245=0.0;
float param_14=(*sc_set0.UserUniforms).specularAoDarkening;
Output_N245=param_14;
float2 Output_N14=float2(0.0);
float2 param_15=(*sc_set0.UserUniforms).uv2Scale;
Output_N14=param_15;
float2 Output_N15=float2(0.0);
float2 param_16=(*sc_set0.UserUniforms).uv2Offset;
Output_N15=param_16;
float2 Output_N50=float2(0.0);
float2 param_17=(*sc_set0.UserUniforms).uv3Scale;
Output_N50=param_17;
float2 Output_N51=float2(0.0);
float2 param_18=(*sc_set0.UserUniforms).uv3Offset;
Output_N51=param_18;
float4 Albedo_N7=float4(0.0);
float Opacity_N7=0.0;
float3 Normal_N7=float3(0.0);
float3 Emissive_N7=float3(0.0);
float Metallic_N7=0.0;
float Roughness_N7=0.0;
float3 AO_N7=float3(0.0);
float3 SpecularAO_N7=float3(0.0);
float4 param_19=Output_N5;
float3 param_20=Output_N85;
float3 param_21=Output_N86;
float3 param_22=Output_N87;
float3 param_23=Output_N236;
float param_24=Output_N233;
float param_25=Output_N225;
float3 param_26=Output_N309;
float param_27=Output_N310;
float param_28=Output_N311;
float param_29=Output_N242;
float param_30=Output_N243;
float param_31=Output_N244;
float param_32=Output_N245;
float2 param_33=Output_N14;
float2 param_34=Output_N15;
float2 param_35=Output_N50;
float2 param_36=Output_N51;
ssGlobals param_45=Globals;
ssGlobals tempGlobals=param_45;
float4 param_37=float4(0.0);
float param_38=0.0;
float3 param_39=float3(0.0);
float3 param_40=float3(0.0);
float param_41=0.0;
float param_42=0.0;
float3 param_43=float3(0.0);
float3 param_44=float3(0.0);
N7_VertexColorSwitch=NODE_38_DROPLIST_ITEM_tmp;
N7_BaseColorValue=param_19;
N7_EnableBaseTexture=(int(ENABLE_BASE_TEX_tmp)!=0);
N7_BaseTextureUVSwitch=NODE_27_DROPLIST_ITEM_tmp;
N7_EnableRecolor=(int(ENABLE_RECOLOR_tmp)!=0);
N7_RecolorR=param_20;
N7_RecolorG=param_21;
N7_RecolorB=param_22;
N7_EnableOpacityTexture=(int(ENABLE_OPACITY_TEX_tmp)!=0);
N7_OpacityUVSwitch=NODE_69_DROPLIST_ITEM_tmp;
N7_EnableNormalTexture=(int(ENABLE_NORMALMAP_tmp)!=0);
N7_NormalUVSwitch=NODE_181_DROPLIST_ITEM_tmp;
N7_EnableDetailNormal=(int(ENABLE_DETAIL_NORMAL_tmp)!=0);
N7_Detail_NormalUVSwitch=NODE_184_DROPLIST_ITEM_tmp;
N7_EnableEmissiveTexture=(int(ENABLE_EMISSIVE_tmp)!=0);
N7_EmissiveUVSwitch=NODE_76_DROPLIST_ITEM_tmp;
N7_EmissiveColor=param_23;
N7_EmissiveIntensity=param_24;
N7_EnableSimpleReflection=(int(ENABLE_SIMPLE_REFLECTION_tmp)!=0);
N7_ReflectionIntensity=param_25;
N7_EnableModulationTexture=(int(Tweak_N177_tmp)!=0);
N7_ModuationUVSwitch=NODE_228_DROPLIST_ITEM_tmp;
N7_EnableRimHighlight=(int(ENABLE_RIM_HIGHLIGHT_tmp)!=0);
N7_RimColor=param_26;
N7_RimIntensity=param_27;
N7_RimExponent=param_28;
N7_EnableRimColorTexture=(int(Tweak_N216_tmp)!=0);
N7_EnableRimInvert=(int(ENABLE_RIM_INVERT_tmp)!=0);
N7_RimUVSwitch=NODE_315_DROPLIST_ITEM_tmp;
N7_EnableMaterialParamsTexture=(int(ENABLE_MATERIAL_PARAM_TEX_tmp)!=0);
N7_MetallicValue=param_29;
N7_RoughnessValue=param_30;
N7_MaterialParamsUVSwitch=NODE_221_DROPLIST_ITEM_tmp;
N7_EnableSpecularAO=(int(ENABLE_SPECULAR_AO_tmp)!=0);
N7_Intensity=param_31;
N7_Darkening=param_32;
N7_EnableUV2=(int(ENABLE_UV2_tmp)!=0);
N7_UV2Switch=NODE_13_DROPLIST_ITEM_tmp;
N7_UV2Scale=param_33;
N7_UV2Offset=param_34;
N7_UV2Animation=(int(uv2EnableAnimation_tmp)!=0);
N7_EnableUV3=(int(ENABLE_UV3_tmp)!=0);
N7_UV3Switch=NODE_49_DROPLIST_ITEM_tmp;
N7_UV3Scale=param_35;
N7_UV3Offset=param_36;
N7_UV3Animation=(int(uv3EnableAnimation_tmp)!=0);
int l9_14=N7_UV2Switch;
float2 l9_15=N7_UV2Scale;
float2 l9_16=N7_UV2Offset;
bool l9_17=N7_UV2Animation;
bool l9_18=N7_EnableUV2;
float2 l9_19=tempGlobals.Surface_UVCoord0;
float2 l9_20=l9_19;
if (l9_18==N7_EnableUV2)
{
if (l9_14==0)
{
float2 l9_21=tempGlobals.Surface_UVCoord0;
l9_20=l9_21;
}
if (l9_14==1)
{
float2 l9_22=tempGlobals.Surface_UVCoord1;
l9_20=l9_22;
}
if (l9_14==2)
{
float2 l9_23=tempGlobals.gScreenCoord;
l9_20=l9_23;
}
}
else
{
if (l9_14==0)
{
float2 l9_24=tempGlobals.Surface_UVCoord0;
l9_20=l9_24;
}
if (l9_14==1)
{
float2 l9_25=tempGlobals.Surface_UVCoord1;
l9_20=l9_25;
}
if (l9_14==2)
{
float2 l9_26=tempGlobals.gScreenCoord;
l9_20=l9_26;
}
if (l9_14==3)
{
l9_20=tempGlobals.N7_TransformedUV2;
}
}
l9_20=(l9_20*l9_15)+l9_16;
if (l9_17)
{
float l9_27=tempGlobals.gTimeElapsed;
l9_20+=(l9_16*l9_27);
}
float2 l9_28=l9_20;
tempGlobals.N7_TransformedUV2=l9_28;
int l9_29=N7_UV3Switch;
float2 l9_30=N7_UV3Scale;
float2 l9_31=N7_UV3Offset;
bool l9_32=N7_UV3Animation;
bool l9_33=N7_EnableUV3;
float2 l9_34=tempGlobals.Surface_UVCoord0;
float2 l9_35=l9_34;
if (l9_33==N7_EnableUV2)
{
if (l9_29==0)
{
float2 l9_36=tempGlobals.Surface_UVCoord0;
l9_35=l9_36;
}
if (l9_29==1)
{
float2 l9_37=tempGlobals.Surface_UVCoord1;
l9_35=l9_37;
}
if (l9_29==2)
{
float2 l9_38=tempGlobals.gScreenCoord;
l9_35=l9_38;
}
}
else
{
if (l9_29==0)
{
float2 l9_39=tempGlobals.Surface_UVCoord0;
l9_35=l9_39;
}
if (l9_29==1)
{
float2 l9_40=tempGlobals.Surface_UVCoord1;
l9_35=l9_40;
}
if (l9_29==2)
{
float2 l9_41=tempGlobals.gScreenCoord;
l9_35=l9_41;
}
if (l9_29==3)
{
l9_35=tempGlobals.N7_TransformedUV2;
}
}
l9_35=(l9_35*l9_30)+l9_31;
if (l9_32)
{
float l9_42=tempGlobals.gTimeElapsed;
l9_35+=(l9_31*l9_42);
}
float2 l9_43=l9_35;
tempGlobals.N7_TransformedUV3=l9_43;
float2 l9_44=tempGlobals.Surface_UVCoord0;
float2 l9_45=l9_44;
float2 l9_46=tempGlobals.Surface_UVCoord0;
float2 l9_47=l9_46;
N7_Opacity=1.0;
N7_Albedo=N7_BaseColorValue;
if (N7_EnableBaseTexture)
{
int l9_48=N7_BaseTextureUVSwitch;
float2 l9_49=tempGlobals.Surface_UVCoord0;
float2 l9_50=l9_49;
if (l9_48==0)
{
float2 l9_51=tempGlobals.Surface_UVCoord0;
l9_50=l9_51;
}
if (l9_48==1)
{
float2 l9_52=tempGlobals.Surface_UVCoord1;
l9_50=l9_52;
}
if (l9_48==2)
{
l9_50=tempGlobals.N7_TransformedUV2;
}
if (l9_48==3)
{
l9_50=tempGlobals.N7_TransformedUV3;
}
float2 l9_53=l9_50;
l9_45=l9_53;
float2 l9_54=l9_45;
float4 l9_55=float4(0.0);
int l9_56=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_57=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_57=0;
}
else
{
l9_57=in.varStereoViewID;
}
int l9_58=l9_57;
l9_56=1-l9_58;
}
else
{
int l9_59=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_59=0;
}
else
{
l9_59=in.varStereoViewID;
}
int l9_60=l9_59;
l9_56=l9_60;
}
int l9_61=l9_56;
int l9_62=baseTexLayout_tmp;
int l9_63=l9_61;
float2 l9_64=l9_54;
bool l9_65=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_66=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_67=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_68=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_69=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_70=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_71=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_72=0.0;
bool l9_73=l9_70&&(!l9_68);
float l9_74=1.0;
float l9_75=l9_64.x;
int l9_76=l9_67.x;
if (l9_76==1)
{
l9_75=fract(l9_75);
}
else
{
if (l9_76==2)
{
float l9_77=fract(l9_75);
float l9_78=l9_75-l9_77;
float l9_79=step(0.25,fract(l9_78*0.5));
l9_75=mix(l9_77,1.0-l9_77,fast::clamp(l9_79,0.0,1.0));
}
}
l9_64.x=l9_75;
float l9_80=l9_64.y;
int l9_81=l9_67.y;
if (l9_81==1)
{
l9_80=fract(l9_80);
}
else
{
if (l9_81==2)
{
float l9_82=fract(l9_80);
float l9_83=l9_80-l9_82;
float l9_84=step(0.25,fract(l9_83*0.5));
l9_80=mix(l9_82,1.0-l9_82,fast::clamp(l9_84,0.0,1.0));
}
}
l9_64.y=l9_80;
if (l9_68)
{
bool l9_85=l9_70;
bool l9_86;
if (l9_85)
{
l9_86=l9_67.x==3;
}
else
{
l9_86=l9_85;
}
float l9_87=l9_64.x;
float l9_88=l9_69.x;
float l9_89=l9_69.z;
bool l9_90=l9_86;
float l9_91=l9_74;
float l9_92=fast::clamp(l9_87,l9_88,l9_89);
float l9_93=step(abs(l9_87-l9_92),9.9999997e-06);
l9_91*=(l9_93+((1.0-float(l9_90))*(1.0-l9_93)));
l9_87=l9_92;
l9_64.x=l9_87;
l9_74=l9_91;
bool l9_94=l9_70;
bool l9_95;
if (l9_94)
{
l9_95=l9_67.y==3;
}
else
{
l9_95=l9_94;
}
float l9_96=l9_64.y;
float l9_97=l9_69.y;
float l9_98=l9_69.w;
bool l9_99=l9_95;
float l9_100=l9_74;
float l9_101=fast::clamp(l9_96,l9_97,l9_98);
float l9_102=step(abs(l9_96-l9_101),9.9999997e-06);
l9_100*=(l9_102+((1.0-float(l9_99))*(1.0-l9_102)));
l9_96=l9_101;
l9_64.y=l9_96;
l9_74=l9_100;
}
float2 l9_103=l9_64;
bool l9_104=l9_65;
float3x3 l9_105=l9_66;
if (l9_104)
{
l9_103=float2((l9_105*float3(l9_103,1.0)).xy);
}
float2 l9_106=l9_103;
float2 l9_107=l9_106;
float2 l9_108=l9_107;
l9_64=l9_108;
float l9_109=l9_64.x;
int l9_110=l9_67.x;
bool l9_111=l9_73;
float l9_112=l9_74;
if ((l9_110==0)||(l9_110==3))
{
float l9_113=l9_109;
float l9_114=0.0;
float l9_115=1.0;
bool l9_116=l9_111;
float l9_117=l9_112;
float l9_118=fast::clamp(l9_113,l9_114,l9_115);
float l9_119=step(abs(l9_113-l9_118),9.9999997e-06);
l9_117*=(l9_119+((1.0-float(l9_116))*(1.0-l9_119)));
l9_113=l9_118;
l9_109=l9_113;
l9_112=l9_117;
}
l9_64.x=l9_109;
l9_74=l9_112;
float l9_120=l9_64.y;
int l9_121=l9_67.y;
bool l9_122=l9_73;
float l9_123=l9_74;
if ((l9_121==0)||(l9_121==3))
{
float l9_124=l9_120;
float l9_125=0.0;
float l9_126=1.0;
bool l9_127=l9_122;
float l9_128=l9_123;
float l9_129=fast::clamp(l9_124,l9_125,l9_126);
float l9_130=step(abs(l9_124-l9_129),9.9999997e-06);
l9_128*=(l9_130+((1.0-float(l9_127))*(1.0-l9_130)));
l9_124=l9_129;
l9_120=l9_124;
l9_123=l9_128;
}
l9_64.y=l9_120;
l9_74=l9_123;
float2 l9_131=l9_64;
int l9_132=l9_62;
int l9_133=l9_63;
float l9_134=l9_72;
float2 l9_135=l9_131;
int l9_136=l9_132;
int l9_137=l9_133;
float3 l9_138=float3(0.0);
if (l9_136==0)
{
l9_138=float3(l9_135,0.0);
}
else
{
if (l9_136==1)
{
l9_138=float3(l9_135.x,(l9_135.y*0.5)+(0.5-(float(l9_137)*0.5)),0.0);
}
else
{
l9_138=float3(l9_135,float(l9_137));
}
}
float3 l9_139=l9_138;
float3 l9_140=l9_139;
float2 l9_141=l9_140.xy;
float l9_142=l9_134;
float4 l9_143=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_141,bias(l9_142));
float4 l9_144=l9_143;
float4 l9_145=l9_144;
if (l9_70)
{
l9_145=mix(l9_71,l9_145,float4(l9_74));
}
float4 l9_146=l9_145;
l9_55=l9_146;
float4 l9_147=l9_55;
N7_Albedo*=l9_147;
}
if (N7_EnableRecolor)
{
float3 l9_148=((N7_RecolorR*N7_Albedo.x)+(N7_RecolorG*N7_Albedo.y))+(N7_RecolorB*N7_Albedo.z);
N7_Albedo=float4(l9_148.x,l9_148.y,l9_148.z,N7_Albedo.w);
}
if (N7_EnableOpacityTexture)
{
int l9_149=N7_OpacityUVSwitch;
float2 l9_150=tempGlobals.Surface_UVCoord0;
float2 l9_151=l9_150;
if (l9_149==0)
{
float2 l9_152=tempGlobals.Surface_UVCoord0;
l9_151=l9_152;
}
if (l9_149==1)
{
float2 l9_153=tempGlobals.Surface_UVCoord1;
l9_151=l9_153;
}
if (l9_149==2)
{
l9_151=tempGlobals.N7_TransformedUV2;
}
if (l9_149==3)
{
l9_151=tempGlobals.N7_TransformedUV3;
}
float2 l9_154=l9_151;
l9_47=l9_154;
float2 l9_155=l9_47;
float4 l9_156=float4(0.0);
int l9_157=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=in.varStereoViewID;
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
l9_160=in.varStereoViewID;
}
int l9_161=l9_160;
l9_157=l9_161;
}
int l9_162=l9_157;
int l9_163=opacityTexLayout_tmp;
int l9_164=l9_162;
float2 l9_165=l9_155;
bool l9_166=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_167=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_168=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_169=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_170=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_171=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_172=(*sc_set0.UserUniforms).opacityTexBorderColor;
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
float4 l9_244=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_242,bias(l9_243));
float4 l9_245=l9_244;
float4 l9_246=l9_245;
if (l9_171)
{
l9_246=mix(l9_172,l9_246,float4(l9_175));
}
float4 l9_247=l9_246;
l9_156=l9_247;
float4 l9_248=l9_156;
N7_Opacity=l9_248.x;
}
N7_Opacity*=N7_Albedo.w;
if (N7_VertexColorSwitch==1)
{
float4 l9_249=tempGlobals.VertexColor;
N7_Albedo*=l9_249;
float4 l9_250=tempGlobals.VertexColor;
N7_Opacity*=l9_250.w;
}
if (N7_EnableNormalTexture)
{
float3 l9_251=float3(0.0,0.0,1.0);
int l9_252=N7_NormalUVSwitch;
float2 l9_253=tempGlobals.Surface_UVCoord0;
float2 l9_254=l9_253;
if (l9_252==0)
{
float2 l9_255=tempGlobals.Surface_UVCoord0;
l9_254=l9_255;
}
if (l9_252==1)
{
float2 l9_256=tempGlobals.Surface_UVCoord1;
l9_254=l9_256;
}
if (l9_252==2)
{
l9_254=tempGlobals.N7_TransformedUV2;
}
if (l9_252==3)
{
l9_254=tempGlobals.N7_TransformedUV3;
}
float2 l9_257=l9_254;
float2 l9_258=l9_257;
float2 l9_259=l9_258;
float4 l9_260=float4(0.0);
int l9_261=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_262=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_262=0;
}
else
{
l9_262=in.varStereoViewID;
}
int l9_263=l9_262;
l9_261=1-l9_263;
}
else
{
int l9_264=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_264=0;
}
else
{
l9_264=in.varStereoViewID;
}
int l9_265=l9_264;
l9_261=l9_265;
}
int l9_266=l9_261;
int l9_267=normalTexLayout_tmp;
int l9_268=l9_266;
float2 l9_269=l9_259;
bool l9_270=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_271=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_272=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_273=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_274=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_275=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_276=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_277=0.0;
bool l9_278=l9_275&&(!l9_273);
float l9_279=1.0;
float l9_280=l9_269.x;
int l9_281=l9_272.x;
if (l9_281==1)
{
l9_280=fract(l9_280);
}
else
{
if (l9_281==2)
{
float l9_282=fract(l9_280);
float l9_283=l9_280-l9_282;
float l9_284=step(0.25,fract(l9_283*0.5));
l9_280=mix(l9_282,1.0-l9_282,fast::clamp(l9_284,0.0,1.0));
}
}
l9_269.x=l9_280;
float l9_285=l9_269.y;
int l9_286=l9_272.y;
if (l9_286==1)
{
l9_285=fract(l9_285);
}
else
{
if (l9_286==2)
{
float l9_287=fract(l9_285);
float l9_288=l9_285-l9_287;
float l9_289=step(0.25,fract(l9_288*0.5));
l9_285=mix(l9_287,1.0-l9_287,fast::clamp(l9_289,0.0,1.0));
}
}
l9_269.y=l9_285;
if (l9_273)
{
bool l9_290=l9_275;
bool l9_291;
if (l9_290)
{
l9_291=l9_272.x==3;
}
else
{
l9_291=l9_290;
}
float l9_292=l9_269.x;
float l9_293=l9_274.x;
float l9_294=l9_274.z;
bool l9_295=l9_291;
float l9_296=l9_279;
float l9_297=fast::clamp(l9_292,l9_293,l9_294);
float l9_298=step(abs(l9_292-l9_297),9.9999997e-06);
l9_296*=(l9_298+((1.0-float(l9_295))*(1.0-l9_298)));
l9_292=l9_297;
l9_269.x=l9_292;
l9_279=l9_296;
bool l9_299=l9_275;
bool l9_300;
if (l9_299)
{
l9_300=l9_272.y==3;
}
else
{
l9_300=l9_299;
}
float l9_301=l9_269.y;
float l9_302=l9_274.y;
float l9_303=l9_274.w;
bool l9_304=l9_300;
float l9_305=l9_279;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_269.y=l9_301;
l9_279=l9_305;
}
float2 l9_308=l9_269;
bool l9_309=l9_270;
float3x3 l9_310=l9_271;
if (l9_309)
{
l9_308=float2((l9_310*float3(l9_308,1.0)).xy);
}
float2 l9_311=l9_308;
float2 l9_312=l9_311;
float2 l9_313=l9_312;
l9_269=l9_313;
float l9_314=l9_269.x;
int l9_315=l9_272.x;
bool l9_316=l9_278;
float l9_317=l9_279;
if ((l9_315==0)||(l9_315==3))
{
float l9_318=l9_314;
float l9_319=0.0;
float l9_320=1.0;
bool l9_321=l9_316;
float l9_322=l9_317;
float l9_323=fast::clamp(l9_318,l9_319,l9_320);
float l9_324=step(abs(l9_318-l9_323),9.9999997e-06);
l9_322*=(l9_324+((1.0-float(l9_321))*(1.0-l9_324)));
l9_318=l9_323;
l9_314=l9_318;
l9_317=l9_322;
}
l9_269.x=l9_314;
l9_279=l9_317;
float l9_325=l9_269.y;
int l9_326=l9_272.y;
bool l9_327=l9_278;
float l9_328=l9_279;
if ((l9_326==0)||(l9_326==3))
{
float l9_329=l9_325;
float l9_330=0.0;
float l9_331=1.0;
bool l9_332=l9_327;
float l9_333=l9_328;
float l9_334=fast::clamp(l9_329,l9_330,l9_331);
float l9_335=step(abs(l9_329-l9_334),9.9999997e-06);
l9_333*=(l9_335+((1.0-float(l9_332))*(1.0-l9_335)));
l9_329=l9_334;
l9_325=l9_329;
l9_328=l9_333;
}
l9_269.y=l9_325;
l9_279=l9_328;
float2 l9_336=l9_269;
int l9_337=l9_267;
int l9_338=l9_268;
float l9_339=l9_277;
float2 l9_340=l9_336;
int l9_341=l9_337;
int l9_342=l9_338;
float3 l9_343=float3(0.0);
if (l9_341==0)
{
l9_343=float3(l9_340,0.0);
}
else
{
if (l9_341==1)
{
l9_343=float3(l9_340.x,(l9_340.y*0.5)+(0.5-(float(l9_342)*0.5)),0.0);
}
else
{
l9_343=float3(l9_340,float(l9_342));
}
}
float3 l9_344=l9_343;
float3 l9_345=l9_344;
float2 l9_346=l9_345.xy;
float l9_347=l9_339;
float4 l9_348=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_346,bias(l9_347));
float4 l9_349=l9_348;
float4 l9_350=l9_349;
if (l9_275)
{
l9_350=mix(l9_276,l9_350,float4(l9_279));
}
float4 l9_351=l9_350;
l9_260=l9_351;
float4 l9_352=l9_260;
N7_Normal=(l9_352.xyz*1.9921875)-float3(1.0);
if (N7_EnableDetailNormal)
{
int l9_353=N7_Detail_NormalUVSwitch;
float2 l9_354=tempGlobals.Surface_UVCoord0;
float2 l9_355=l9_354;
if (l9_353==0)
{
float2 l9_356=tempGlobals.Surface_UVCoord0;
l9_355=l9_356;
}
if (l9_353==1)
{
float2 l9_357=tempGlobals.Surface_UVCoord1;
l9_355=l9_357;
}
if (l9_353==2)
{
l9_355=tempGlobals.N7_TransformedUV2;
}
if (l9_353==3)
{
l9_355=tempGlobals.N7_TransformedUV3;
}
float2 l9_358=l9_355;
float2 l9_359=l9_358;
float2 l9_360=l9_359;
float4 l9_361=float4(0.0);
int l9_362=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_363=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_363=0;
}
else
{
l9_363=in.varStereoViewID;
}
int l9_364=l9_363;
l9_362=1-l9_364;
}
else
{
int l9_365=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_365=0;
}
else
{
l9_365=in.varStereoViewID;
}
int l9_366=l9_365;
l9_362=l9_366;
}
int l9_367=l9_362;
int l9_368=detailNormalTexLayout_tmp;
int l9_369=l9_367;
float2 l9_370=l9_360;
bool l9_371=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_372=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_373=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_374=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_375=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_376=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_377=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_378=0.0;
bool l9_379=l9_376&&(!l9_374);
float l9_380=1.0;
float l9_381=l9_370.x;
int l9_382=l9_373.x;
if (l9_382==1)
{
l9_381=fract(l9_381);
}
else
{
if (l9_382==2)
{
float l9_383=fract(l9_381);
float l9_384=l9_381-l9_383;
float l9_385=step(0.25,fract(l9_384*0.5));
l9_381=mix(l9_383,1.0-l9_383,fast::clamp(l9_385,0.0,1.0));
}
}
l9_370.x=l9_381;
float l9_386=l9_370.y;
int l9_387=l9_373.y;
if (l9_387==1)
{
l9_386=fract(l9_386);
}
else
{
if (l9_387==2)
{
float l9_388=fract(l9_386);
float l9_389=l9_386-l9_388;
float l9_390=step(0.25,fract(l9_389*0.5));
l9_386=mix(l9_388,1.0-l9_388,fast::clamp(l9_390,0.0,1.0));
}
}
l9_370.y=l9_386;
if (l9_374)
{
bool l9_391=l9_376;
bool l9_392;
if (l9_391)
{
l9_392=l9_373.x==3;
}
else
{
l9_392=l9_391;
}
float l9_393=l9_370.x;
float l9_394=l9_375.x;
float l9_395=l9_375.z;
bool l9_396=l9_392;
float l9_397=l9_380;
float l9_398=fast::clamp(l9_393,l9_394,l9_395);
float l9_399=step(abs(l9_393-l9_398),9.9999997e-06);
l9_397*=(l9_399+((1.0-float(l9_396))*(1.0-l9_399)));
l9_393=l9_398;
l9_370.x=l9_393;
l9_380=l9_397;
bool l9_400=l9_376;
bool l9_401;
if (l9_400)
{
l9_401=l9_373.y==3;
}
else
{
l9_401=l9_400;
}
float l9_402=l9_370.y;
float l9_403=l9_375.y;
float l9_404=l9_375.w;
bool l9_405=l9_401;
float l9_406=l9_380;
float l9_407=fast::clamp(l9_402,l9_403,l9_404);
float l9_408=step(abs(l9_402-l9_407),9.9999997e-06);
l9_406*=(l9_408+((1.0-float(l9_405))*(1.0-l9_408)));
l9_402=l9_407;
l9_370.y=l9_402;
l9_380=l9_406;
}
float2 l9_409=l9_370;
bool l9_410=l9_371;
float3x3 l9_411=l9_372;
if (l9_410)
{
l9_409=float2((l9_411*float3(l9_409,1.0)).xy);
}
float2 l9_412=l9_409;
float2 l9_413=l9_412;
float2 l9_414=l9_413;
l9_370=l9_414;
float l9_415=l9_370.x;
int l9_416=l9_373.x;
bool l9_417=l9_379;
float l9_418=l9_380;
if ((l9_416==0)||(l9_416==3))
{
float l9_419=l9_415;
float l9_420=0.0;
float l9_421=1.0;
bool l9_422=l9_417;
float l9_423=l9_418;
float l9_424=fast::clamp(l9_419,l9_420,l9_421);
float l9_425=step(abs(l9_419-l9_424),9.9999997e-06);
l9_423*=(l9_425+((1.0-float(l9_422))*(1.0-l9_425)));
l9_419=l9_424;
l9_415=l9_419;
l9_418=l9_423;
}
l9_370.x=l9_415;
l9_380=l9_418;
float l9_426=l9_370.y;
int l9_427=l9_373.y;
bool l9_428=l9_379;
float l9_429=l9_380;
if ((l9_427==0)||(l9_427==3))
{
float l9_430=l9_426;
float l9_431=0.0;
float l9_432=1.0;
bool l9_433=l9_428;
float l9_434=l9_429;
float l9_435=fast::clamp(l9_430,l9_431,l9_432);
float l9_436=step(abs(l9_430-l9_435),9.9999997e-06);
l9_434*=(l9_436+((1.0-float(l9_433))*(1.0-l9_436)));
l9_430=l9_435;
l9_426=l9_430;
l9_429=l9_434;
}
l9_370.y=l9_426;
l9_380=l9_429;
float2 l9_437=l9_370;
int l9_438=l9_368;
int l9_439=l9_369;
float l9_440=l9_378;
float2 l9_441=l9_437;
int l9_442=l9_438;
int l9_443=l9_439;
float3 l9_444=float3(0.0);
if (l9_442==0)
{
l9_444=float3(l9_441,0.0);
}
else
{
if (l9_442==1)
{
l9_444=float3(l9_441.x,(l9_441.y*0.5)+(0.5-(float(l9_443)*0.5)),0.0);
}
else
{
l9_444=float3(l9_441,float(l9_443));
}
}
float3 l9_445=l9_444;
float3 l9_446=l9_445;
float2 l9_447=l9_446.xy;
float l9_448=l9_440;
float4 l9_449=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_447,bias(l9_448));
float4 l9_450=l9_449;
float4 l9_451=l9_450;
if (l9_376)
{
l9_451=mix(l9_377,l9_451,float4(l9_380));
}
float4 l9_452=l9_451;
l9_361=l9_452;
float4 l9_453=l9_361;
l9_251=(l9_453.xyz*1.9921875)-float3(1.0);
}
float3 l9_454=N7_Normal;
float3 l9_455=l9_251;
float3 l9_456=l9_454+float3(0.0,0.0,1.0);
float3 l9_457=l9_455*float3(-1.0,-1.0,1.0);
float3 l9_458=normalize((l9_456*dot(l9_456,l9_457))-(l9_457*l9_456.z));
N7_Normal=l9_458;
float3 l9_459=tempGlobals.VertexNormal_WorldSpace;
float3 l9_460=l9_459;
float3 l9_461=tempGlobals.VertexTangent_WorldSpace;
float3 l9_462=l9_461;
float3 l9_463=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_464=l9_463;
float3x3 l9_465=float3x3(float3(l9_462),float3(l9_464),float3(l9_460));
N7_Normal=normalize(l9_465*N7_Normal);
}
else
{
float3 l9_466=tempGlobals.VertexNormal_WorldSpace;
N7_Normal=normalize(l9_466);
}
float2 l9_467=tempGlobals.Surface_UVCoord0;
float2 l9_468=l9_467;
float3 l9_469=float3(0.0);
float3 l9_470=float3(0.0);
N7_Emissive=float3(0.0);
if (N7_EnableEmissiveTexture)
{
int l9_471=N7_EmissiveUVSwitch;
float2 l9_472=tempGlobals.Surface_UVCoord0;
float2 l9_473=l9_472;
if (l9_471==0)
{
float2 l9_474=tempGlobals.Surface_UVCoord0;
l9_473=l9_474;
}
if (l9_471==1)
{
float2 l9_475=tempGlobals.Surface_UVCoord1;
l9_473=l9_475;
}
if (l9_471==2)
{
l9_473=tempGlobals.N7_TransformedUV2;
}
if (l9_471==3)
{
l9_473=tempGlobals.N7_TransformedUV3;
}
float2 l9_476=l9_473;
l9_468=l9_476;
float2 l9_477=l9_468;
float4 l9_478=float4(0.0);
int l9_479=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_480=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_480=0;
}
else
{
l9_480=in.varStereoViewID;
}
int l9_481=l9_480;
l9_479=1-l9_481;
}
else
{
int l9_482=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_482=0;
}
else
{
l9_482=in.varStereoViewID;
}
int l9_483=l9_482;
l9_479=l9_483;
}
int l9_484=l9_479;
int l9_485=emissiveTexLayout_tmp;
int l9_486=l9_484;
float2 l9_487=l9_477;
bool l9_488=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_489=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_490=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_491=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_492=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_493=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_494=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_495=0.0;
bool l9_496=l9_493&&(!l9_491);
float l9_497=1.0;
float l9_498=l9_487.x;
int l9_499=l9_490.x;
if (l9_499==1)
{
l9_498=fract(l9_498);
}
else
{
if (l9_499==2)
{
float l9_500=fract(l9_498);
float l9_501=l9_498-l9_500;
float l9_502=step(0.25,fract(l9_501*0.5));
l9_498=mix(l9_500,1.0-l9_500,fast::clamp(l9_502,0.0,1.0));
}
}
l9_487.x=l9_498;
float l9_503=l9_487.y;
int l9_504=l9_490.y;
if (l9_504==1)
{
l9_503=fract(l9_503);
}
else
{
if (l9_504==2)
{
float l9_505=fract(l9_503);
float l9_506=l9_503-l9_505;
float l9_507=step(0.25,fract(l9_506*0.5));
l9_503=mix(l9_505,1.0-l9_505,fast::clamp(l9_507,0.0,1.0));
}
}
l9_487.y=l9_503;
if (l9_491)
{
bool l9_508=l9_493;
bool l9_509;
if (l9_508)
{
l9_509=l9_490.x==3;
}
else
{
l9_509=l9_508;
}
float l9_510=l9_487.x;
float l9_511=l9_492.x;
float l9_512=l9_492.z;
bool l9_513=l9_509;
float l9_514=l9_497;
float l9_515=fast::clamp(l9_510,l9_511,l9_512);
float l9_516=step(abs(l9_510-l9_515),9.9999997e-06);
l9_514*=(l9_516+((1.0-float(l9_513))*(1.0-l9_516)));
l9_510=l9_515;
l9_487.x=l9_510;
l9_497=l9_514;
bool l9_517=l9_493;
bool l9_518;
if (l9_517)
{
l9_518=l9_490.y==3;
}
else
{
l9_518=l9_517;
}
float l9_519=l9_487.y;
float l9_520=l9_492.y;
float l9_521=l9_492.w;
bool l9_522=l9_518;
float l9_523=l9_497;
float l9_524=fast::clamp(l9_519,l9_520,l9_521);
float l9_525=step(abs(l9_519-l9_524),9.9999997e-06);
l9_523*=(l9_525+((1.0-float(l9_522))*(1.0-l9_525)));
l9_519=l9_524;
l9_487.y=l9_519;
l9_497=l9_523;
}
float2 l9_526=l9_487;
bool l9_527=l9_488;
float3x3 l9_528=l9_489;
if (l9_527)
{
l9_526=float2((l9_528*float3(l9_526,1.0)).xy);
}
float2 l9_529=l9_526;
float2 l9_530=l9_529;
float2 l9_531=l9_530;
l9_487=l9_531;
float l9_532=l9_487.x;
int l9_533=l9_490.x;
bool l9_534=l9_496;
float l9_535=l9_497;
if ((l9_533==0)||(l9_533==3))
{
float l9_536=l9_532;
float l9_537=0.0;
float l9_538=1.0;
bool l9_539=l9_534;
float l9_540=l9_535;
float l9_541=fast::clamp(l9_536,l9_537,l9_538);
float l9_542=step(abs(l9_536-l9_541),9.9999997e-06);
l9_540*=(l9_542+((1.0-float(l9_539))*(1.0-l9_542)));
l9_536=l9_541;
l9_532=l9_536;
l9_535=l9_540;
}
l9_487.x=l9_532;
l9_497=l9_535;
float l9_543=l9_487.y;
int l9_544=l9_490.y;
bool l9_545=l9_496;
float l9_546=l9_497;
if ((l9_544==0)||(l9_544==3))
{
float l9_547=l9_543;
float l9_548=0.0;
float l9_549=1.0;
bool l9_550=l9_545;
float l9_551=l9_546;
float l9_552=fast::clamp(l9_547,l9_548,l9_549);
float l9_553=step(abs(l9_547-l9_552),9.9999997e-06);
l9_551*=(l9_553+((1.0-float(l9_550))*(1.0-l9_553)));
l9_547=l9_552;
l9_543=l9_547;
l9_546=l9_551;
}
l9_487.y=l9_543;
l9_497=l9_546;
float2 l9_554=l9_487;
int l9_555=l9_485;
int l9_556=l9_486;
float l9_557=l9_495;
float2 l9_558=l9_554;
int l9_559=l9_555;
int l9_560=l9_556;
float3 l9_561=float3(0.0);
if (l9_559==0)
{
l9_561=float3(l9_558,0.0);
}
else
{
if (l9_559==1)
{
l9_561=float3(l9_558.x,(l9_558.y*0.5)+(0.5-(float(l9_560)*0.5)),0.0);
}
else
{
l9_561=float3(l9_558,float(l9_560));
}
}
float3 l9_562=l9_561;
float3 l9_563=l9_562;
float2 l9_564=l9_563.xy;
float l9_565=l9_557;
float4 l9_566=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_564,bias(l9_565));
float4 l9_567=l9_566;
float4 l9_568=l9_567;
if (l9_493)
{
l9_568=mix(l9_494,l9_568,float4(l9_497));
}
float4 l9_569=l9_568;
l9_478=l9_569;
float4 l9_570=l9_478;
N7_Emissive=l9_570.xyz;
}
if (N7_VertexColorSwitch==2)
{
float4 l9_571=tempGlobals.VertexColor;
N7_Emissive+=l9_571.xyz;
}
if ((N7_VertexColorSwitch==2)||N7_EnableEmissiveTexture)
{
float3 l9_572=(N7_Emissive*N7_EmissiveColor)*float3(N7_EmissiveIntensity);
float3 l9_573=float3(2.2);
float l9_574;
if (l9_572.x<=0.0)
{
l9_574=0.0;
}
else
{
l9_574=pow(l9_572.x,l9_573.x);
}
float l9_575=l9_574;
float l9_576;
if (l9_572.y<=0.0)
{
l9_576=0.0;
}
else
{
l9_576=pow(l9_572.y,l9_573.y);
}
float l9_577=l9_576;
float l9_578;
if (l9_572.z<=0.0)
{
l9_578=0.0;
}
else
{
l9_578=pow(l9_572.z,l9_573.z);
}
float3 l9_579=float3(l9_575,l9_577,l9_578);
N7_Emissive=l9_579;
}
if (N7_EnableSimpleReflection)
{
float3 l9_580=tempGlobals.ViewDirWS;
float3 l9_581=l9_580;
float3 l9_582=reflect(l9_581,N7_Normal);
l9_582.z=-l9_582.z;
float3 l9_583=l9_582;
float l9_584=((l9_583.x*l9_583.x)+(l9_583.y*l9_583.y))+((l9_583.z+1.0)*(l9_583.z+1.0));
float l9_585;
if (l9_584<=0.0)
{
l9_585=0.0;
}
else
{
l9_585=sqrt(l9_584);
}
float l9_586=l9_585;
float l9_587=2.0*l9_586;
float2 l9_588=(l9_583.xy/float2(l9_587))+float2(0.5);
float2 l9_589=l9_588;
float2 l9_590=float2(1.0)-l9_589;
float2 l9_591=l9_590;
float4 l9_592=float4(0.0);
int l9_593=0;
if ((int(reflectionTexHasSwappedViews_tmp)!=0))
{
int l9_594=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_594=0;
}
else
{
l9_594=in.varStereoViewID;
}
int l9_595=l9_594;
l9_593=1-l9_595;
}
else
{
int l9_596=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_596=0;
}
else
{
l9_596=in.varStereoViewID;
}
int l9_597=l9_596;
l9_593=l9_597;
}
int l9_598=l9_593;
int l9_599=reflectionTexLayout_tmp;
int l9_600=l9_598;
float2 l9_601=l9_591;
bool l9_602=(int(SC_USE_UV_TRANSFORM_reflectionTex_tmp)!=0);
float3x3 l9_603=(*sc_set0.UserUniforms).reflectionTexTransform;
int2 l9_604=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp);
bool l9_605=(int(SC_USE_UV_MIN_MAX_reflectionTex_tmp)!=0);
float4 l9_606=(*sc_set0.UserUniforms).reflectionTexUvMinMax;
bool l9_607=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp)!=0);
float4 l9_608=(*sc_set0.UserUniforms).reflectionTexBorderColor;
float l9_609=0.0;
bool l9_610=l9_607&&(!l9_605);
float l9_611=1.0;
float l9_612=l9_601.x;
int l9_613=l9_604.x;
if (l9_613==1)
{
l9_612=fract(l9_612);
}
else
{
if (l9_613==2)
{
float l9_614=fract(l9_612);
float l9_615=l9_612-l9_614;
float l9_616=step(0.25,fract(l9_615*0.5));
l9_612=mix(l9_614,1.0-l9_614,fast::clamp(l9_616,0.0,1.0));
}
}
l9_601.x=l9_612;
float l9_617=l9_601.y;
int l9_618=l9_604.y;
if (l9_618==1)
{
l9_617=fract(l9_617);
}
else
{
if (l9_618==2)
{
float l9_619=fract(l9_617);
float l9_620=l9_617-l9_619;
float l9_621=step(0.25,fract(l9_620*0.5));
l9_617=mix(l9_619,1.0-l9_619,fast::clamp(l9_621,0.0,1.0));
}
}
l9_601.y=l9_617;
if (l9_605)
{
bool l9_622=l9_607;
bool l9_623;
if (l9_622)
{
l9_623=l9_604.x==3;
}
else
{
l9_623=l9_622;
}
float l9_624=l9_601.x;
float l9_625=l9_606.x;
float l9_626=l9_606.z;
bool l9_627=l9_623;
float l9_628=l9_611;
float l9_629=fast::clamp(l9_624,l9_625,l9_626);
float l9_630=step(abs(l9_624-l9_629),9.9999997e-06);
l9_628*=(l9_630+((1.0-float(l9_627))*(1.0-l9_630)));
l9_624=l9_629;
l9_601.x=l9_624;
l9_611=l9_628;
bool l9_631=l9_607;
bool l9_632;
if (l9_631)
{
l9_632=l9_604.y==3;
}
else
{
l9_632=l9_631;
}
float l9_633=l9_601.y;
float l9_634=l9_606.y;
float l9_635=l9_606.w;
bool l9_636=l9_632;
float l9_637=l9_611;
float l9_638=fast::clamp(l9_633,l9_634,l9_635);
float l9_639=step(abs(l9_633-l9_638),9.9999997e-06);
l9_637*=(l9_639+((1.0-float(l9_636))*(1.0-l9_639)));
l9_633=l9_638;
l9_601.y=l9_633;
l9_611=l9_637;
}
float2 l9_640=l9_601;
bool l9_641=l9_602;
float3x3 l9_642=l9_603;
if (l9_641)
{
l9_640=float2((l9_642*float3(l9_640,1.0)).xy);
}
float2 l9_643=l9_640;
float2 l9_644=l9_643;
float2 l9_645=l9_644;
l9_601=l9_645;
float l9_646=l9_601.x;
int l9_647=l9_604.x;
bool l9_648=l9_610;
float l9_649=l9_611;
if ((l9_647==0)||(l9_647==3))
{
float l9_650=l9_646;
float l9_651=0.0;
float l9_652=1.0;
bool l9_653=l9_648;
float l9_654=l9_649;
float l9_655=fast::clamp(l9_650,l9_651,l9_652);
float l9_656=step(abs(l9_650-l9_655),9.9999997e-06);
l9_654*=(l9_656+((1.0-float(l9_653))*(1.0-l9_656)));
l9_650=l9_655;
l9_646=l9_650;
l9_649=l9_654;
}
l9_601.x=l9_646;
l9_611=l9_649;
float l9_657=l9_601.y;
int l9_658=l9_604.y;
bool l9_659=l9_610;
float l9_660=l9_611;
if ((l9_658==0)||(l9_658==3))
{
float l9_661=l9_657;
float l9_662=0.0;
float l9_663=1.0;
bool l9_664=l9_659;
float l9_665=l9_660;
float l9_666=fast::clamp(l9_661,l9_662,l9_663);
float l9_667=step(abs(l9_661-l9_666),9.9999997e-06);
l9_665*=(l9_667+((1.0-float(l9_664))*(1.0-l9_667)));
l9_661=l9_666;
l9_657=l9_661;
l9_660=l9_665;
}
l9_601.y=l9_657;
l9_611=l9_660;
float2 l9_668=l9_601;
int l9_669=l9_599;
int l9_670=l9_600;
float l9_671=l9_609;
float2 l9_672=l9_668;
int l9_673=l9_669;
int l9_674=l9_670;
float3 l9_675=float3(0.0);
if (l9_673==0)
{
l9_675=float3(l9_672,0.0);
}
else
{
if (l9_673==1)
{
l9_675=float3(l9_672.x,(l9_672.y*0.5)+(0.5-(float(l9_674)*0.5)),0.0);
}
else
{
l9_675=float3(l9_672,float(l9_674));
}
}
float3 l9_676=l9_675;
float3 l9_677=l9_676;
float2 l9_678=l9_677.xy;
float l9_679=l9_671;
float4 l9_680=sc_set0.reflectionTex.sample(sc_set0.reflectionTexSmpSC,l9_678,bias(l9_679));
float4 l9_681=l9_680;
float4 l9_682=l9_681;
if (l9_607)
{
l9_682=mix(l9_608,l9_682,float4(l9_611));
}
float4 l9_683=l9_682;
l9_592=l9_683;
float4 l9_684=l9_592;
l9_469=l9_684.xyz;
if (N7_EnableModulationTexture)
{
int l9_685=N7_ModuationUVSwitch;
float2 l9_686=tempGlobals.Surface_UVCoord0;
float2 l9_687=l9_686;
if (l9_685==0)
{
float2 l9_688=tempGlobals.Surface_UVCoord0;
l9_687=l9_688;
}
if (l9_685==1)
{
float2 l9_689=tempGlobals.Surface_UVCoord1;
l9_687=l9_689;
}
if (l9_685==2)
{
l9_687=tempGlobals.N7_TransformedUV2;
}
if (l9_685==3)
{
l9_687=tempGlobals.N7_TransformedUV3;
}
float2 l9_690=l9_687;
float2 l9_691=l9_690;
float2 l9_692=l9_691;
float4 l9_693=float4(0.0);
int l9_694=0;
if ((int(reflectionModulationTexHasSwappedViews_tmp)!=0))
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
l9_694=1-l9_696;
}
else
{
int l9_697=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_697=0;
}
else
{
l9_697=in.varStereoViewID;
}
int l9_698=l9_697;
l9_694=l9_698;
}
int l9_699=l9_694;
int l9_700=reflectionModulationTexLayout_tmp;
int l9_701=l9_699;
float2 l9_702=l9_692;
bool l9_703=(int(SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp)!=0);
float3x3 l9_704=(*sc_set0.UserUniforms).reflectionModulationTexTransform;
int2 l9_705=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp);
bool l9_706=(int(SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp)!=0);
float4 l9_707=(*sc_set0.UserUniforms).reflectionModulationTexUvMinMax;
bool l9_708=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp)!=0);
float4 l9_709=(*sc_set0.UserUniforms).reflectionModulationTexBorderColor;
float l9_710=0.0;
bool l9_711=l9_708&&(!l9_706);
float l9_712=1.0;
float l9_713=l9_702.x;
int l9_714=l9_705.x;
if (l9_714==1)
{
l9_713=fract(l9_713);
}
else
{
if (l9_714==2)
{
float l9_715=fract(l9_713);
float l9_716=l9_713-l9_715;
float l9_717=step(0.25,fract(l9_716*0.5));
l9_713=mix(l9_715,1.0-l9_715,fast::clamp(l9_717,0.0,1.0));
}
}
l9_702.x=l9_713;
float l9_718=l9_702.y;
int l9_719=l9_705.y;
if (l9_719==1)
{
l9_718=fract(l9_718);
}
else
{
if (l9_719==2)
{
float l9_720=fract(l9_718);
float l9_721=l9_718-l9_720;
float l9_722=step(0.25,fract(l9_721*0.5));
l9_718=mix(l9_720,1.0-l9_720,fast::clamp(l9_722,0.0,1.0));
}
}
l9_702.y=l9_718;
if (l9_706)
{
bool l9_723=l9_708;
bool l9_724;
if (l9_723)
{
l9_724=l9_705.x==3;
}
else
{
l9_724=l9_723;
}
float l9_725=l9_702.x;
float l9_726=l9_707.x;
float l9_727=l9_707.z;
bool l9_728=l9_724;
float l9_729=l9_712;
float l9_730=fast::clamp(l9_725,l9_726,l9_727);
float l9_731=step(abs(l9_725-l9_730),9.9999997e-06);
l9_729*=(l9_731+((1.0-float(l9_728))*(1.0-l9_731)));
l9_725=l9_730;
l9_702.x=l9_725;
l9_712=l9_729;
bool l9_732=l9_708;
bool l9_733;
if (l9_732)
{
l9_733=l9_705.y==3;
}
else
{
l9_733=l9_732;
}
float l9_734=l9_702.y;
float l9_735=l9_707.y;
float l9_736=l9_707.w;
bool l9_737=l9_733;
float l9_738=l9_712;
float l9_739=fast::clamp(l9_734,l9_735,l9_736);
float l9_740=step(abs(l9_734-l9_739),9.9999997e-06);
l9_738*=(l9_740+((1.0-float(l9_737))*(1.0-l9_740)));
l9_734=l9_739;
l9_702.y=l9_734;
l9_712=l9_738;
}
float2 l9_741=l9_702;
bool l9_742=l9_703;
float3x3 l9_743=l9_704;
if (l9_742)
{
l9_741=float2((l9_743*float3(l9_741,1.0)).xy);
}
float2 l9_744=l9_741;
float2 l9_745=l9_744;
float2 l9_746=l9_745;
l9_702=l9_746;
float l9_747=l9_702.x;
int l9_748=l9_705.x;
bool l9_749=l9_711;
float l9_750=l9_712;
if ((l9_748==0)||(l9_748==3))
{
float l9_751=l9_747;
float l9_752=0.0;
float l9_753=1.0;
bool l9_754=l9_749;
float l9_755=l9_750;
float l9_756=fast::clamp(l9_751,l9_752,l9_753);
float l9_757=step(abs(l9_751-l9_756),9.9999997e-06);
l9_755*=(l9_757+((1.0-float(l9_754))*(1.0-l9_757)));
l9_751=l9_756;
l9_747=l9_751;
l9_750=l9_755;
}
l9_702.x=l9_747;
l9_712=l9_750;
float l9_758=l9_702.y;
int l9_759=l9_705.y;
bool l9_760=l9_711;
float l9_761=l9_712;
if ((l9_759==0)||(l9_759==3))
{
float l9_762=l9_758;
float l9_763=0.0;
float l9_764=1.0;
bool l9_765=l9_760;
float l9_766=l9_761;
float l9_767=fast::clamp(l9_762,l9_763,l9_764);
float l9_768=step(abs(l9_762-l9_767),9.9999997e-06);
l9_766*=(l9_768+((1.0-float(l9_765))*(1.0-l9_768)));
l9_762=l9_767;
l9_758=l9_762;
l9_761=l9_766;
}
l9_702.y=l9_758;
l9_712=l9_761;
float2 l9_769=l9_702;
int l9_770=l9_700;
int l9_771=l9_701;
float l9_772=l9_710;
float2 l9_773=l9_769;
int l9_774=l9_770;
int l9_775=l9_771;
float3 l9_776=float3(0.0);
if (l9_774==0)
{
l9_776=float3(l9_773,0.0);
}
else
{
if (l9_774==1)
{
l9_776=float3(l9_773.x,(l9_773.y*0.5)+(0.5-(float(l9_775)*0.5)),0.0);
}
else
{
l9_776=float3(l9_773,float(l9_775));
}
}
float3 l9_777=l9_776;
float3 l9_778=l9_777;
float2 l9_779=l9_778.xy;
float l9_780=l9_772;
float4 l9_781=sc_set0.reflectionModulationTex.sample(sc_set0.reflectionModulationTexSmpSC,l9_779,bias(l9_780));
float4 l9_782=l9_781;
float4 l9_783=l9_782;
if (l9_708)
{
l9_783=mix(l9_709,l9_783,float4(l9_712));
}
float4 l9_784=l9_783;
l9_693=l9_784;
float4 l9_785=l9_693;
float3 l9_786=l9_785.xyz;
l9_469*=l9_786;
}
float3 l9_787=l9_469;
float3 l9_788;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_788=float3(pow(l9_787.x,2.2),pow(l9_787.y,2.2),pow(l9_787.z,2.2));
}
else
{
l9_788=l9_787*l9_787;
}
float3 l9_789=l9_788;
l9_469=l9_789;
l9_469*=N7_ReflectionIntensity;
}
if (N7_EnableRimHighlight)
{
float3 l9_790=N7_RimColor*N7_RimIntensity;
if (N7_EnableRimColorTexture)
{
int l9_791=N7_RimUVSwitch;
float2 l9_792=tempGlobals.Surface_UVCoord0;
float2 l9_793=l9_792;
if (l9_791==0)
{
float2 l9_794=tempGlobals.Surface_UVCoord0;
l9_793=l9_794;
}
if (l9_791==1)
{
float2 l9_795=tempGlobals.Surface_UVCoord1;
l9_793=l9_795;
}
if (l9_791==2)
{
l9_793=tempGlobals.N7_TransformedUV2;
}
if (l9_791==3)
{
l9_793=tempGlobals.N7_TransformedUV3;
}
float2 l9_796=l9_793;
float2 l9_797=l9_796;
float2 l9_798=l9_797;
float4 l9_799=float4(0.0);
int l9_800=0;
if ((int(rimColorTexHasSwappedViews_tmp)!=0))
{
int l9_801=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_801=0;
}
else
{
l9_801=in.varStereoViewID;
}
int l9_802=l9_801;
l9_800=1-l9_802;
}
else
{
int l9_803=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_803=0;
}
else
{
l9_803=in.varStereoViewID;
}
int l9_804=l9_803;
l9_800=l9_804;
}
int l9_805=l9_800;
int l9_806=rimColorTexLayout_tmp;
int l9_807=l9_805;
float2 l9_808=l9_798;
bool l9_809=(int(SC_USE_UV_TRANSFORM_rimColorTex_tmp)!=0);
float3x3 l9_810=(*sc_set0.UserUniforms).rimColorTexTransform;
int2 l9_811=int2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp,SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp);
bool l9_812=(int(SC_USE_UV_MIN_MAX_rimColorTex_tmp)!=0);
float4 l9_813=(*sc_set0.UserUniforms).rimColorTexUvMinMax;
bool l9_814=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp)!=0);
float4 l9_815=(*sc_set0.UserUniforms).rimColorTexBorderColor;
float l9_816=0.0;
bool l9_817=l9_814&&(!l9_812);
float l9_818=1.0;
float l9_819=l9_808.x;
int l9_820=l9_811.x;
if (l9_820==1)
{
l9_819=fract(l9_819);
}
else
{
if (l9_820==2)
{
float l9_821=fract(l9_819);
float l9_822=l9_819-l9_821;
float l9_823=step(0.25,fract(l9_822*0.5));
l9_819=mix(l9_821,1.0-l9_821,fast::clamp(l9_823,0.0,1.0));
}
}
l9_808.x=l9_819;
float l9_824=l9_808.y;
int l9_825=l9_811.y;
if (l9_825==1)
{
l9_824=fract(l9_824);
}
else
{
if (l9_825==2)
{
float l9_826=fract(l9_824);
float l9_827=l9_824-l9_826;
float l9_828=step(0.25,fract(l9_827*0.5));
l9_824=mix(l9_826,1.0-l9_826,fast::clamp(l9_828,0.0,1.0));
}
}
l9_808.y=l9_824;
if (l9_812)
{
bool l9_829=l9_814;
bool l9_830;
if (l9_829)
{
l9_830=l9_811.x==3;
}
else
{
l9_830=l9_829;
}
float l9_831=l9_808.x;
float l9_832=l9_813.x;
float l9_833=l9_813.z;
bool l9_834=l9_830;
float l9_835=l9_818;
float l9_836=fast::clamp(l9_831,l9_832,l9_833);
float l9_837=step(abs(l9_831-l9_836),9.9999997e-06);
l9_835*=(l9_837+((1.0-float(l9_834))*(1.0-l9_837)));
l9_831=l9_836;
l9_808.x=l9_831;
l9_818=l9_835;
bool l9_838=l9_814;
bool l9_839;
if (l9_838)
{
l9_839=l9_811.y==3;
}
else
{
l9_839=l9_838;
}
float l9_840=l9_808.y;
float l9_841=l9_813.y;
float l9_842=l9_813.w;
bool l9_843=l9_839;
float l9_844=l9_818;
float l9_845=fast::clamp(l9_840,l9_841,l9_842);
float l9_846=step(abs(l9_840-l9_845),9.9999997e-06);
l9_844*=(l9_846+((1.0-float(l9_843))*(1.0-l9_846)));
l9_840=l9_845;
l9_808.y=l9_840;
l9_818=l9_844;
}
float2 l9_847=l9_808;
bool l9_848=l9_809;
float3x3 l9_849=l9_810;
if (l9_848)
{
l9_847=float2((l9_849*float3(l9_847,1.0)).xy);
}
float2 l9_850=l9_847;
float2 l9_851=l9_850;
float2 l9_852=l9_851;
l9_808=l9_852;
float l9_853=l9_808.x;
int l9_854=l9_811.x;
bool l9_855=l9_817;
float l9_856=l9_818;
if ((l9_854==0)||(l9_854==3))
{
float l9_857=l9_853;
float l9_858=0.0;
float l9_859=1.0;
bool l9_860=l9_855;
float l9_861=l9_856;
float l9_862=fast::clamp(l9_857,l9_858,l9_859);
float l9_863=step(abs(l9_857-l9_862),9.9999997e-06);
l9_861*=(l9_863+((1.0-float(l9_860))*(1.0-l9_863)));
l9_857=l9_862;
l9_853=l9_857;
l9_856=l9_861;
}
l9_808.x=l9_853;
l9_818=l9_856;
float l9_864=l9_808.y;
int l9_865=l9_811.y;
bool l9_866=l9_817;
float l9_867=l9_818;
if ((l9_865==0)||(l9_865==3))
{
float l9_868=l9_864;
float l9_869=0.0;
float l9_870=1.0;
bool l9_871=l9_866;
float l9_872=l9_867;
float l9_873=fast::clamp(l9_868,l9_869,l9_870);
float l9_874=step(abs(l9_868-l9_873),9.9999997e-06);
l9_872*=(l9_874+((1.0-float(l9_871))*(1.0-l9_874)));
l9_868=l9_873;
l9_864=l9_868;
l9_867=l9_872;
}
l9_808.y=l9_864;
l9_818=l9_867;
float2 l9_875=l9_808;
int l9_876=l9_806;
int l9_877=l9_807;
float l9_878=l9_816;
float2 l9_879=l9_875;
int l9_880=l9_876;
int l9_881=l9_877;
float3 l9_882=float3(0.0);
if (l9_880==0)
{
l9_882=float3(l9_879,0.0);
}
else
{
if (l9_880==1)
{
l9_882=float3(l9_879.x,(l9_879.y*0.5)+(0.5-(float(l9_881)*0.5)),0.0);
}
else
{
l9_882=float3(l9_879,float(l9_881));
}
}
float3 l9_883=l9_882;
float3 l9_884=l9_883;
float2 l9_885=l9_884.xy;
float l9_886=l9_878;
float4 l9_887=sc_set0.rimColorTex.sample(sc_set0.rimColorTexSmpSC,l9_885,bias(l9_886));
float4 l9_888=l9_887;
float4 l9_889=l9_888;
if (l9_814)
{
l9_889=mix(l9_815,l9_889,float4(l9_818));
}
float4 l9_890=l9_889;
l9_799=l9_890;
float4 l9_891=l9_799;
l9_790*=l9_891.xyz;
}
float3 l9_892=tempGlobals.ViewDirWS;
float3 l9_893=l9_892;
float l9_894=abs(dot(N7_Normal,l9_893));
if (!N7_EnableRimInvert)
{
l9_894=1.0-l9_894;
}
float l9_895=l9_894;
float l9_896=N7_RimExponent;
float l9_897;
if (l9_895<=0.0)
{
l9_897=0.0;
}
else
{
l9_897=pow(l9_895,l9_896);
}
float l9_898=l9_897;
float l9_899=l9_898;
float3 l9_900=l9_790;
float3 l9_901;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_901=float3(pow(l9_900.x,2.2),pow(l9_900.y,2.2),pow(l9_900.z,2.2));
}
else
{
l9_901=l9_900*l9_900;
}
float3 l9_902=l9_901;
l9_470+=(l9_902*l9_899);
}
float3 l9_903=(N7_Emissive+l9_469)+l9_470;
float3 l9_904=float3(0.45454547);
float l9_905;
if (l9_903.x<=0.0)
{
l9_905=0.0;
}
else
{
l9_905=pow(l9_903.x,l9_904.x);
}
float l9_906=l9_905;
float l9_907;
if (l9_903.y<=0.0)
{
l9_907=0.0;
}
else
{
l9_907=pow(l9_903.y,l9_904.y);
}
float l9_908=l9_907;
float l9_909;
if (l9_903.z<=0.0)
{
l9_909=0.0;
}
else
{
l9_909=pow(l9_903.z,l9_904.z);
}
float3 l9_910=float3(l9_906,l9_908,l9_909);
N7_Emissive=l9_910;
N7_Metallic=N7_MetallicValue;
N7_Roughness=N7_RoughnessValue;
float3 l9_911;
if (N7_VertexColorSwitch==3)
{
float4 l9_912=tempGlobals.VertexColor;
l9_911=l9_912.xyz;
}
else
{
l9_911=float3(1.0);
}
N7_AO=l9_911;
if (N7_EnableMaterialParamsTexture)
{
int l9_913=N7_MaterialParamsUVSwitch;
float2 l9_914=tempGlobals.Surface_UVCoord0;
float2 l9_915=l9_914;
if (l9_913==0)
{
float2 l9_916=tempGlobals.Surface_UVCoord0;
l9_915=l9_916;
}
if (l9_913==1)
{
float2 l9_917=tempGlobals.Surface_UVCoord1;
l9_915=l9_917;
}
if (l9_913==2)
{
l9_915=tempGlobals.N7_TransformedUV2;
}
if (l9_913==3)
{
l9_915=tempGlobals.N7_TransformedUV3;
}
float2 l9_918=l9_915;
float2 l9_919=l9_918;
float2 l9_920=l9_919;
float4 l9_921=float4(0.0);
int l9_922=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_923=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_923=0;
}
else
{
l9_923=in.varStereoViewID;
}
int l9_924=l9_923;
l9_922=1-l9_924;
}
else
{
int l9_925=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_925=0;
}
else
{
l9_925=in.varStereoViewID;
}
int l9_926=l9_925;
l9_922=l9_926;
}
int l9_927=l9_922;
int l9_928=materialParamsTexLayout_tmp;
int l9_929=l9_927;
float2 l9_930=l9_920;
bool l9_931=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_932=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_933=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_934=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_935=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_936=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_937=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_938=0.0;
bool l9_939=l9_936&&(!l9_934);
float l9_940=1.0;
float l9_941=l9_930.x;
int l9_942=l9_933.x;
if (l9_942==1)
{
l9_941=fract(l9_941);
}
else
{
if (l9_942==2)
{
float l9_943=fract(l9_941);
float l9_944=l9_941-l9_943;
float l9_945=step(0.25,fract(l9_944*0.5));
l9_941=mix(l9_943,1.0-l9_943,fast::clamp(l9_945,0.0,1.0));
}
}
l9_930.x=l9_941;
float l9_946=l9_930.y;
int l9_947=l9_933.y;
if (l9_947==1)
{
l9_946=fract(l9_946);
}
else
{
if (l9_947==2)
{
float l9_948=fract(l9_946);
float l9_949=l9_946-l9_948;
float l9_950=step(0.25,fract(l9_949*0.5));
l9_946=mix(l9_948,1.0-l9_948,fast::clamp(l9_950,0.0,1.0));
}
}
l9_930.y=l9_946;
if (l9_934)
{
bool l9_951=l9_936;
bool l9_952;
if (l9_951)
{
l9_952=l9_933.x==3;
}
else
{
l9_952=l9_951;
}
float l9_953=l9_930.x;
float l9_954=l9_935.x;
float l9_955=l9_935.z;
bool l9_956=l9_952;
float l9_957=l9_940;
float l9_958=fast::clamp(l9_953,l9_954,l9_955);
float l9_959=step(abs(l9_953-l9_958),9.9999997e-06);
l9_957*=(l9_959+((1.0-float(l9_956))*(1.0-l9_959)));
l9_953=l9_958;
l9_930.x=l9_953;
l9_940=l9_957;
bool l9_960=l9_936;
bool l9_961;
if (l9_960)
{
l9_961=l9_933.y==3;
}
else
{
l9_961=l9_960;
}
float l9_962=l9_930.y;
float l9_963=l9_935.y;
float l9_964=l9_935.w;
bool l9_965=l9_961;
float l9_966=l9_940;
float l9_967=fast::clamp(l9_962,l9_963,l9_964);
float l9_968=step(abs(l9_962-l9_967),9.9999997e-06);
l9_966*=(l9_968+((1.0-float(l9_965))*(1.0-l9_968)));
l9_962=l9_967;
l9_930.y=l9_962;
l9_940=l9_966;
}
float2 l9_969=l9_930;
bool l9_970=l9_931;
float3x3 l9_971=l9_932;
if (l9_970)
{
l9_969=float2((l9_971*float3(l9_969,1.0)).xy);
}
float2 l9_972=l9_969;
float2 l9_973=l9_972;
float2 l9_974=l9_973;
l9_930=l9_974;
float l9_975=l9_930.x;
int l9_976=l9_933.x;
bool l9_977=l9_939;
float l9_978=l9_940;
if ((l9_976==0)||(l9_976==3))
{
float l9_979=l9_975;
float l9_980=0.0;
float l9_981=1.0;
bool l9_982=l9_977;
float l9_983=l9_978;
float l9_984=fast::clamp(l9_979,l9_980,l9_981);
float l9_985=step(abs(l9_979-l9_984),9.9999997e-06);
l9_983*=(l9_985+((1.0-float(l9_982))*(1.0-l9_985)));
l9_979=l9_984;
l9_975=l9_979;
l9_978=l9_983;
}
l9_930.x=l9_975;
l9_940=l9_978;
float l9_986=l9_930.y;
int l9_987=l9_933.y;
bool l9_988=l9_939;
float l9_989=l9_940;
if ((l9_987==0)||(l9_987==3))
{
float l9_990=l9_986;
float l9_991=0.0;
float l9_992=1.0;
bool l9_993=l9_988;
float l9_994=l9_989;
float l9_995=fast::clamp(l9_990,l9_991,l9_992);
float l9_996=step(abs(l9_990-l9_995),9.9999997e-06);
l9_994*=(l9_996+((1.0-float(l9_993))*(1.0-l9_996)));
l9_990=l9_995;
l9_986=l9_990;
l9_989=l9_994;
}
l9_930.y=l9_986;
l9_940=l9_989;
float2 l9_997=l9_930;
int l9_998=l9_928;
int l9_999=l9_929;
float l9_1000=l9_938;
float2 l9_1001=l9_997;
int l9_1002=l9_998;
int l9_1003=l9_999;
float3 l9_1004=float3(0.0);
if (l9_1002==0)
{
l9_1004=float3(l9_1001,0.0);
}
else
{
if (l9_1002==1)
{
l9_1004=float3(l9_1001.x,(l9_1001.y*0.5)+(0.5-(float(l9_1003)*0.5)),0.0);
}
else
{
l9_1004=float3(l9_1001,float(l9_1003));
}
}
float3 l9_1005=l9_1004;
float3 l9_1006=l9_1005;
float2 l9_1007=l9_1006.xy;
float l9_1008=l9_1000;
float4 l9_1009=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_1007,bias(l9_1008));
float4 l9_1010=l9_1009;
float4 l9_1011=l9_1010;
if (l9_936)
{
l9_1011=mix(l9_937,l9_1011,float4(l9_940));
}
float4 l9_1012=l9_1011;
l9_921=l9_1012;
float4 l9_1013=l9_921;
float3 l9_1014=l9_1013.xyz;
N7_Metallic*=l9_1014.x;
N7_Roughness*=l9_1014.y;
N7_AO*=l9_1014.z;
}
if (N7_EnableSpecularAO)
{
N7_SpecularAO=mix(float3(0.039999999),N7_Albedo.xyz*N7_Metallic,float3(N7_Metallic));
N7_SpecularAO=mix((N7_SpecularAO*(1.0-N7_Darkening))*N7_SpecularAO,float3(1.0),float3(N7_AO.x));
N7_SpecularAO=mix(float3(1.0),N7_SpecularAO,float3(N7_Intensity));
}
else
{
N7_SpecularAO=float3(1.0);
}
if (N7_EnableSimpleReflection)
{
N7_SpecularAO=float3(0.0);
}
param_37=N7_Albedo;
param_38=N7_Opacity;
param_39=N7_Normal;
param_40=N7_Emissive;
param_41=N7_Metallic;
param_42=N7_Roughness;
param_43=N7_AO;
param_44=N7_SpecularAO;
Albedo_N7=param_37;
Opacity_N7=param_38;
Normal_N7=param_39;
Emissive_N7=param_40;
Metallic_N7=param_41;
Roughness_N7=param_42;
AO_N7=param_43;
SpecularAO_N7=param_44;
float4 Output_N36=float4(0.0);
float3 param_46=Albedo_N7.xyz;
float param_47=Opacity_N7;
float3 param_48=Normal_N7;
float3 param_49=Emissive_N7;
float param_50=Metallic_N7;
float param_51=Roughness_N7;
float3 param_52=AO_N7;
float3 param_53=SpecularAO_N7;
ssGlobals param_55=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_55.BumpedNormal=param_48;
}
param_47=fast::clamp(param_47,0.0,1.0);
float l9_1015=param_47;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1015<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1016=gl_FragCoord;
float2 l9_1017=floor(mod(l9_1016.xy,float2(4.0)));
float l9_1018=(mod(dot(l9_1017,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1015<l9_1018)
{
discard_fragment();
}
}
param_46=fast::max(param_46,float3(0.0));
float4 param_54;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_54=float4(param_46,param_47);
}
else
{
param_49=fast::max(param_49,float3(0.0));
param_50=fast::clamp(param_50,0.0,1.0);
param_51=fast::clamp(param_51,0.0,1.0);
param_52=fast::clamp(param_52,float3(0.0),float3(1.0));
param_53=fast::clamp(param_53,float3(0.0),float3(1.0));
float3 l9_1019=param_46;
float l9_1020=param_47;
float3 l9_1021=param_55.BumpedNormal;
float3 l9_1022=param_55.PositionWS;
float3 l9_1023=param_55.ViewDirWS;
float3 l9_1024=param_49;
float l9_1025=param_50;
float l9_1026=param_51;
float3 l9_1027=param_52;
float3 l9_1028=param_53;
SurfaceProperties l9_1029;
l9_1029.albedo=float3(0.0);
l9_1029.opacity=1.0;
l9_1029.normal=float3(0.0);
l9_1029.positionWS=float3(0.0);
l9_1029.viewDirWS=float3(0.0);
l9_1029.metallic=0.0;
l9_1029.roughness=0.0;
l9_1029.emissive=float3(0.0);
l9_1029.ao=float3(1.0);
l9_1029.specularAo=float3(1.0);
l9_1029.bakedShadows=float3(1.0);
SurfaceProperties l9_1030=l9_1029;
SurfaceProperties l9_1031=l9_1030;
l9_1031.opacity=l9_1020;
float3 l9_1032=l9_1019;
float3 l9_1033;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1033=float3(pow(l9_1032.x,2.2),pow(l9_1032.y,2.2),pow(l9_1032.z,2.2));
}
else
{
l9_1033=l9_1032*l9_1032;
}
float3 l9_1034=l9_1033;
l9_1031.albedo=l9_1034;
l9_1031.normal=normalize(l9_1021);
l9_1031.positionWS=l9_1022;
l9_1031.viewDirWS=l9_1023;
float3 l9_1035=l9_1024;
float3 l9_1036;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1036=float3(pow(l9_1035.x,2.2),pow(l9_1035.y,2.2),pow(l9_1035.z,2.2));
}
else
{
l9_1036=l9_1035*l9_1035;
}
float3 l9_1037=l9_1036;
l9_1031.emissive=l9_1037;
l9_1031.metallic=l9_1025;
l9_1031.roughness=l9_1026;
l9_1031.ao=l9_1027;
l9_1031.specularAo=l9_1028;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_1038=l9_1031.positionWS;
l9_1031.ao=evaluateSSAO(l9_1038,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_1039=l9_1031;
SurfaceProperties l9_1040=l9_1039;
float3 l9_1041=mix(float3(0.039999999),l9_1040.albedo*l9_1040.metallic,float3(l9_1040.metallic));
float3 l9_1042=mix(l9_1040.albedo*(1.0-l9_1040.metallic),float3(0.0),float3(l9_1040.metallic));
l9_1039.albedo=l9_1042;
l9_1039.specColor=l9_1041;
SurfaceProperties l9_1043=l9_1039;
l9_1031=l9_1043;
SurfaceProperties l9_1044=l9_1031;
LightingComponents l9_1045;
l9_1045.directDiffuse=float3(0.0);
l9_1045.directSpecular=float3(0.0);
l9_1045.indirectDiffuse=float3(1.0);
l9_1045.indirectSpecular=float3(0.0);
l9_1045.emitted=float3(0.0);
l9_1045.transmitted=float3(0.0);
LightingComponents l9_1046=l9_1045;
LightingComponents l9_1047=l9_1046;
float3 l9_1048=l9_1044.viewDirWS;
int l9_1049=0;
float4 l9_1050=float4(l9_1044.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_1051;
LightProperties l9_1052;
int l9_1053=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1053<sc_DirectionalLightsCount_tmp)
{
l9_1051.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_1053].direction;
l9_1051.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_1053].color;
l9_1052.direction=l9_1051.direction;
l9_1052.color=l9_1051.color.xyz;
l9_1052.attenuation=l9_1051.color.w;
l9_1052.attenuation*=l9_1050[(l9_1049<3) ? l9_1049 : 3];
l9_1049++;
LightingComponents l9_1054=l9_1047;
LightProperties l9_1055=l9_1052;
SurfaceProperties l9_1056=l9_1044;
float3 l9_1057=l9_1048;
SurfaceProperties l9_1058=l9_1056;
float3 l9_1059=l9_1055.direction;
float l9_1060=dot(l9_1058.normal,l9_1059);
float l9_1061=fast::clamp(l9_1060,0.0,1.0);
float3 l9_1062=float3(l9_1061);
l9_1054.directDiffuse+=((l9_1062*l9_1055.color)*l9_1055.attenuation);
SurfaceProperties l9_1063=l9_1056;
float3 l9_1064=l9_1055.direction;
float3 l9_1065=l9_1057;
l9_1054.directSpecular+=((calculateDirectSpecular(l9_1063,l9_1064,l9_1065)*l9_1055.color)*l9_1055.attenuation);
LightingComponents l9_1066=l9_1054;
l9_1047=l9_1066;
l9_1053++;
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
sc_PointLight_t_1 l9_1067;
LightProperties l9_1068;
int l9_1069=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1069<sc_PointLightsCount_tmp)
{
l9_1067.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].falloffEnabled!=0;
l9_1067.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].falloffEndDistance;
l9_1067.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].negRcpFalloffEndDistance4;
l9_1067.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].angleScale;
l9_1067.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].angleOffset;
l9_1067.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].direction;
l9_1067.position=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].position;
l9_1067.color=(*sc_set0.UserUniforms).sc_PointLights[l9_1069].color;
float3 l9_1070=l9_1067.position-l9_1044.positionWS;
l9_1068.direction=normalize(l9_1070);
l9_1068.color=l9_1067.color.xyz;
l9_1068.attenuation=l9_1067.color.w;
l9_1068.attenuation*=l9_1050[(l9_1049<3) ? l9_1049 : 3];
float3 l9_1071=l9_1068.direction;
float3 l9_1072=l9_1067.direction;
float l9_1073=l9_1067.angleScale;
float l9_1074=l9_1067.angleOffset;
float l9_1075=dot(l9_1071,l9_1072);
float l9_1076=fast::clamp((l9_1075*l9_1073)+l9_1074,0.0,1.0);
float l9_1077=l9_1076*l9_1076;
l9_1068.attenuation*=l9_1077;
if (l9_1067.falloffEnabled)
{
float l9_1078=length(l9_1070);
float l9_1079=l9_1067.falloffEndDistance;
l9_1068.attenuation*=computeDistanceAttenuation(l9_1078,l9_1079);
}
l9_1049++;
LightingComponents l9_1080=l9_1047;
LightProperties l9_1081=l9_1068;
SurfaceProperties l9_1082=l9_1044;
float3 l9_1083=l9_1048;
SurfaceProperties l9_1084=l9_1082;
float3 l9_1085=l9_1081.direction;
float l9_1086=dot(l9_1084.normal,l9_1085);
float l9_1087=fast::clamp(l9_1086,0.0,1.0);
float3 l9_1088=float3(l9_1087);
l9_1080.directDiffuse+=((l9_1088*l9_1081.color)*l9_1081.attenuation);
SurfaceProperties l9_1089=l9_1082;
float3 l9_1090=l9_1081.direction;
float3 l9_1091=l9_1083;
l9_1080.directSpecular+=((calculateDirectSpecular(l9_1089,l9_1090,l9_1091)*l9_1081.color)*l9_1081.attenuation);
LightingComponents l9_1092=l9_1080;
l9_1047=l9_1092;
l9_1069++;
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
float3 l9_1093=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_1094=abs(in.varShadowTex-float2(0.5));
float l9_1095=fast::max(l9_1094.x,l9_1094.y);
float l9_1096=step(l9_1095,0.5);
float4 l9_1097=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_1096;
float3 l9_1098=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1097.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_1099=l9_1097.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_1093=mix(float3(1.0),l9_1098,float3(l9_1099));
}
else
{
l9_1093=float3(1.0);
}
float3 l9_1100=l9_1093;
float3 l9_1101=l9_1100;
l9_1047.directDiffuse*=l9_1101;
l9_1047.directSpecular*=l9_1101;
}
bool l9_1102=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_1102)
{
float4 l9_1103=gl_FragCoord;
float2 l9_1104=l9_1103.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1105=l9_1104;
float2 l9_1106=l9_1105;
int l9_1107=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_1108=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1108=0;
}
else
{
l9_1108=in.varStereoViewID;
}
int l9_1109=l9_1108;
l9_1107=1-l9_1109;
}
else
{
int l9_1110=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1110=0;
}
else
{
l9_1110=in.varStereoViewID;
}
int l9_1111=l9_1110;
l9_1107=l9_1111;
}
int l9_1112=l9_1107;
float2 l9_1113=l9_1106;
int l9_1114=l9_1112;
float2 l9_1115=l9_1113;
int l9_1116=l9_1114;
float l9_1117=0.0;
float4 l9_1118=float4(0.0);
float2 l9_1119=l9_1115;
int l9_1120=sc_RayTracedShadowTextureLayout_tmp;
int l9_1121=l9_1116;
float l9_1122=l9_1117;
float2 l9_1123=l9_1119;
int l9_1124=l9_1120;
int l9_1125=l9_1121;
float3 l9_1126=float3(0.0);
if (l9_1124==0)
{
l9_1126=float3(l9_1123,0.0);
}
else
{
if (l9_1124==1)
{
l9_1126=float3(l9_1123.x,(l9_1123.y*0.5)+(0.5-(float(l9_1125)*0.5)),0.0);
}
else
{
l9_1126=float3(l9_1123,float(l9_1125));
}
}
float3 l9_1127=l9_1126;
float3 l9_1128=l9_1127;
float2 l9_1129=l9_1128.xy;
float l9_1130=l9_1122;
float4 l9_1131=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_1129,bias(l9_1130));
float4 l9_1132=l9_1131;
l9_1118=l9_1132;
float4 l9_1133=l9_1118;
float4 l9_1134=l9_1133;
float4 l9_1135=l9_1134;
float l9_1136=l9_1135.x;
float3 l9_1137=float3(l9_1136);
float3 l9_1138=l9_1137;
l9_1047.directDiffuse*=(float3(1.0)-l9_1138);
l9_1047.directSpecular*=(float3(1.0)-l9_1138);
}
SurfaceProperties l9_1139=l9_1044;
float3 l9_1140=l9_1139.normal;
float3 l9_1141=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_1142=l9_1140;
float3 l9_1143=l9_1142;
float l9_1144=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1145=float2(0.0);
float l9_1146=l9_1143.x;
float l9_1147=-l9_1143.z;
float l9_1148=(l9_1146<0.0) ? (-1.0) : 1.0;
float l9_1149=l9_1148*acos(fast::clamp(l9_1147/length(float2(l9_1146,l9_1147)),-1.0,1.0));
l9_1145.x=l9_1149-1.5707964;
l9_1145.y=acos(l9_1143.y);
l9_1145/=float2(6.2831855,3.1415927);
l9_1145.y=1.0-l9_1145.y;
l9_1145.x+=(l9_1144/360.0);
l9_1145.x=fract((l9_1145.x+floor(l9_1145.x))+1.0);
float2 l9_1150=l9_1145;
float2 l9_1151=l9_1150;
float4 l9_1152=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_1153=l9_1151;
float2 l9_1154=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1155=5.0;
l9_1151=calcSeamlessPanoramicUvsForSampling(l9_1153,l9_1154,l9_1155);
}
float2 l9_1156=l9_1151;
float l9_1157=13.0;
int l9_1158=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1159=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1159=0;
}
else
{
l9_1159=in.varStereoViewID;
}
int l9_1160=l9_1159;
l9_1158=1-l9_1160;
}
else
{
int l9_1161=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1161=0;
}
else
{
l9_1161=in.varStereoViewID;
}
int l9_1162=l9_1161;
l9_1158=l9_1162;
}
int l9_1163=l9_1158;
float2 l9_1164=l9_1156;
int l9_1165=l9_1163;
float l9_1166=l9_1157;
float4 l9_1167=float4(0.0);
float2 l9_1168=l9_1164;
int l9_1169=sc_EnvmapSpecularLayout_tmp;
int l9_1170=l9_1165;
float l9_1171=l9_1166;
float2 l9_1172=l9_1168;
int l9_1173=l9_1169;
int l9_1174=l9_1170;
float3 l9_1175=float3(0.0);
if (l9_1173==0)
{
l9_1175=float3(l9_1172,0.0);
}
else
{
if (l9_1173==1)
{
l9_1175=float3(l9_1172.x,(l9_1172.y*0.5)+(0.5-(float(l9_1174)*0.5)),0.0);
}
else
{
l9_1175=float3(l9_1172,float(l9_1174));
}
}
float3 l9_1176=l9_1175;
float3 l9_1177=l9_1176;
float2 l9_1178=l9_1177.xy;
float l9_1179=l9_1171;
float4 l9_1180=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1178,bias(l9_1179));
float4 l9_1181=l9_1180;
l9_1167=l9_1181;
float4 l9_1182=l9_1167;
float4 l9_1183=l9_1182;
l9_1152=l9_1183;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1184=l9_1151;
float2 l9_1185=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1186=0.0;
l9_1151=calcSeamlessPanoramicUvsForSampling(l9_1184,l9_1185,l9_1186);
float2 l9_1187=l9_1151;
float l9_1188=-13.0;
int l9_1189=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1190=0;
}
else
{
l9_1190=in.varStereoViewID;
}
int l9_1191=l9_1190;
l9_1189=1-l9_1191;
}
else
{
int l9_1192=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1192=0;
}
else
{
l9_1192=in.varStereoViewID;
}
int l9_1193=l9_1192;
l9_1189=l9_1193;
}
int l9_1194=l9_1189;
float2 l9_1195=l9_1187;
int l9_1196=l9_1194;
float l9_1197=l9_1188;
float4 l9_1198=float4(0.0);
float2 l9_1199=l9_1195;
int l9_1200=sc_EnvmapDiffuseLayout_tmp;
int l9_1201=l9_1196;
float l9_1202=l9_1197;
float2 l9_1203=l9_1199;
int l9_1204=l9_1200;
int l9_1205=l9_1201;
float3 l9_1206=float3(0.0);
if (l9_1204==0)
{
l9_1206=float3(l9_1203,0.0);
}
else
{
if (l9_1204==1)
{
l9_1206=float3(l9_1203.x,(l9_1203.y*0.5)+(0.5-(float(l9_1205)*0.5)),0.0);
}
else
{
l9_1206=float3(l9_1203,float(l9_1205));
}
}
float3 l9_1207=l9_1206;
float3 l9_1208=l9_1207;
float2 l9_1209=l9_1208.xy;
float l9_1210=l9_1202;
float4 l9_1211=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_1209,bias(l9_1210));
float4 l9_1212=l9_1211;
l9_1198=l9_1212;
float4 l9_1213=l9_1198;
float4 l9_1214=l9_1213;
l9_1152=l9_1214;
}
else
{
float2 l9_1215=l9_1151;
float l9_1216=13.0;
int l9_1217=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1218=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1218=0;
}
else
{
l9_1218=in.varStereoViewID;
}
int l9_1219=l9_1218;
l9_1217=1-l9_1219;
}
else
{
int l9_1220=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1220=0;
}
else
{
l9_1220=in.varStereoViewID;
}
int l9_1221=l9_1220;
l9_1217=l9_1221;
}
int l9_1222=l9_1217;
float2 l9_1223=l9_1215;
int l9_1224=l9_1222;
float l9_1225=l9_1216;
float4 l9_1226=float4(0.0);
float2 l9_1227=l9_1223;
int l9_1228=sc_EnvmapSpecularLayout_tmp;
int l9_1229=l9_1224;
float l9_1230=l9_1225;
float2 l9_1231=l9_1227;
int l9_1232=l9_1228;
int l9_1233=l9_1229;
float3 l9_1234=float3(0.0);
if (l9_1232==0)
{
l9_1234=float3(l9_1231,0.0);
}
else
{
if (l9_1232==1)
{
l9_1234=float3(l9_1231.x,(l9_1231.y*0.5)+(0.5-(float(l9_1233)*0.5)),0.0);
}
else
{
l9_1234=float3(l9_1231,float(l9_1233));
}
}
float3 l9_1235=l9_1234;
float3 l9_1236=l9_1235;
float2 l9_1237=l9_1236.xy;
float l9_1238=l9_1230;
float4 l9_1239=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1237,bias(l9_1238));
float4 l9_1240=l9_1239;
l9_1226=l9_1240;
float4 l9_1241=l9_1226;
float4 l9_1242=l9_1241;
l9_1152=l9_1242;
}
}
float4 l9_1243=l9_1152;
float3 l9_1244=l9_1243.xyz*(1.0/l9_1243.w);
float3 l9_1245=l9_1244*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1141=l9_1245;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1246=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_1247=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_1248=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_1249=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_1250=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_1251=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_1252=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_1253=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_1254=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_1255=-l9_1140;
float l9_1256=0.0;
l9_1256=l9_1255.x;
float l9_1257=l9_1255.y;
float l9_1258=l9_1255.z;
float l9_1259=l9_1256*l9_1256;
float l9_1260=l9_1257*l9_1257;
float l9_1261=l9_1258*l9_1258;
float l9_1262=l9_1256*l9_1257;
float l9_1263=l9_1257*l9_1258;
float l9_1264=l9_1256*l9_1258;
float3 l9_1265=((((((l9_1254*0.42904299)*(l9_1259-l9_1260))+((l9_1252*0.74312502)*l9_1261))+(l9_1246*0.88622701))-(l9_1252*0.24770799))+((((l9_1250*l9_1262)+(l9_1253*l9_1264))+(l9_1251*l9_1263))*0.85808599))+((((l9_1249*l9_1256)+(l9_1247*l9_1257))+(l9_1248*l9_1258))*1.0233279);
l9_1141=l9_1265*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_1266=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_1266)
{
float4 l9_1267=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_1141=mix(l9_1141,l9_1267.xyz,float3(l9_1267.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1141+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_1141.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1141+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_1141.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1141+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_1141.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1268=l9_1140;
float3 l9_1269=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1270;
float l9_1271;
int l9_1272=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1272<sc_LightEstimationSGCount_tmp)
{
l9_1270.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1272].color;
l9_1270.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1272].sharpness;
l9_1270.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1272].axis;
float3 l9_1273=l9_1268;
float l9_1274=dot(l9_1270.axis,l9_1273);
float l9_1275=l9_1270.sharpness;
float l9_1276=0.36000001;
float l9_1277=1.0/(4.0*l9_1276);
float l9_1278=exp(-l9_1275);
float l9_1279=l9_1278*l9_1278;
float l9_1280=1.0/l9_1275;
float l9_1281=(1.0+(2.0*l9_1279))-l9_1280;
float l9_1282=((l9_1278-l9_1279)*l9_1280)-l9_1279;
float l9_1283=sqrt(1.0-l9_1281);
float l9_1284=l9_1276*l9_1274;
float l9_1285=l9_1277*l9_1283;
float l9_1286=l9_1284+l9_1285;
float l9_1287=l9_1274;
float l9_1288=fast::clamp(l9_1287,0.0,1.0);
float l9_1289=l9_1288;
if (step(abs(l9_1284),l9_1285)>0.5)
{
l9_1271=(l9_1286*l9_1286)/l9_1283;
}
else
{
l9_1271=l9_1289;
}
l9_1289=l9_1271;
float l9_1290=(l9_1281*l9_1289)+l9_1282;
sc_SphericalGaussianLight_t l9_1291=l9_1270;
float3 l9_1292=(l9_1291.color/float3(l9_1291.sharpness))*6.2831855;
float3 l9_1293=(l9_1292*l9_1290)/float3(3.1415927);
l9_1269+=l9_1293;
l9_1272++;
continue;
}
else
{
break;
}
}
float3 l9_1294=l9_1269;
l9_1141+=l9_1294;
}
float3 l9_1295=l9_1141;
float3 l9_1296=l9_1295;
l9_1047.indirectDiffuse=l9_1296;
SurfaceProperties l9_1297=l9_1044;
float3 l9_1298=l9_1048;
float3 l9_1299=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_1300=l9_1297;
float3 l9_1301=l9_1298;
float3 l9_1302=l9_1300.normal;
float3 l9_1303=reflect(-l9_1301,l9_1302);
float3 l9_1304=l9_1302;
float3 l9_1305=l9_1303;
float l9_1306=l9_1300.roughness;
l9_1303=getSpecularDominantDir(l9_1304,l9_1305,l9_1306);
float l9_1307=l9_1300.roughness;
float l9_1308=pow(l9_1307,0.66666669);
float l9_1309=fast::clamp(l9_1308,0.0,1.0);
float l9_1310=l9_1309*5.0;
float l9_1311=l9_1310;
float l9_1312=l9_1311;
float3 l9_1313=l9_1303;
float l9_1314=l9_1312;
float3 l9_1315=l9_1313;
float l9_1316=l9_1314;
float4 l9_1317=float4(0.0);
float3 l9_1318=l9_1315;
float l9_1319=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1320=float2(0.0);
float l9_1321=l9_1318.x;
float l9_1322=-l9_1318.z;
float l9_1323=(l9_1321<0.0) ? (-1.0) : 1.0;
float l9_1324=l9_1323*acos(fast::clamp(l9_1322/length(float2(l9_1321,l9_1322)),-1.0,1.0));
l9_1320.x=l9_1324-1.5707964;
l9_1320.y=acos(l9_1318.y);
l9_1320/=float2(6.2831855,3.1415927);
l9_1320.y=1.0-l9_1320.y;
l9_1320.x+=(l9_1319/360.0);
l9_1320.x=fract((l9_1320.x+floor(l9_1320.x))+1.0);
float2 l9_1325=l9_1320;
float2 l9_1326=l9_1325;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1327=floor(l9_1316);
float l9_1328=ceil(l9_1316);
float l9_1329=l9_1316-l9_1327;
float2 l9_1330=l9_1326;
float2 l9_1331=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1332=l9_1327;
float2 l9_1333=calcSeamlessPanoramicUvsForSampling(l9_1330,l9_1331,l9_1332);
float2 l9_1334=l9_1333;
float l9_1335=l9_1327;
float2 l9_1336=l9_1334;
float l9_1337=l9_1335;
int l9_1338=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1339=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1339=0;
}
else
{
l9_1339=in.varStereoViewID;
}
int l9_1340=l9_1339;
l9_1338=1-l9_1340;
}
else
{
int l9_1341=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1341=0;
}
else
{
l9_1341=in.varStereoViewID;
}
int l9_1342=l9_1341;
l9_1338=l9_1342;
}
int l9_1343=l9_1338;
float2 l9_1344=l9_1336;
int l9_1345=l9_1343;
float l9_1346=l9_1337;
float4 l9_1347=float4(0.0);
float2 l9_1348=l9_1344;
int l9_1349=sc_EnvmapSpecularLayout_tmp;
int l9_1350=l9_1345;
float l9_1351=l9_1346;
float2 l9_1352=l9_1348;
int l9_1353=l9_1349;
int l9_1354=l9_1350;
float3 l9_1355=float3(0.0);
if (l9_1353==0)
{
l9_1355=float3(l9_1352,0.0);
}
else
{
if (l9_1353==1)
{
l9_1355=float3(l9_1352.x,(l9_1352.y*0.5)+(0.5-(float(l9_1354)*0.5)),0.0);
}
else
{
l9_1355=float3(l9_1352,float(l9_1354));
}
}
float3 l9_1356=l9_1355;
float3 l9_1357=l9_1356;
float2 l9_1358=l9_1357.xy;
float l9_1359=l9_1351;
float4 l9_1360=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1358,level(l9_1359));
float4 l9_1361=l9_1360;
l9_1347=l9_1361;
float4 l9_1362=l9_1347;
float4 l9_1363=l9_1362;
float4 l9_1364=l9_1363;
float4 l9_1365=l9_1364;
float2 l9_1366=l9_1326;
float2 l9_1367=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1368=l9_1328;
float2 l9_1369=calcSeamlessPanoramicUvsForSampling(l9_1366,l9_1367,l9_1368);
float2 l9_1370=l9_1369;
float l9_1371=l9_1328;
float2 l9_1372=l9_1370;
float l9_1373=l9_1371;
int l9_1374=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1375=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1375=0;
}
else
{
l9_1375=in.varStereoViewID;
}
int l9_1376=l9_1375;
l9_1374=1-l9_1376;
}
else
{
int l9_1377=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1377=0;
}
else
{
l9_1377=in.varStereoViewID;
}
int l9_1378=l9_1377;
l9_1374=l9_1378;
}
int l9_1379=l9_1374;
float2 l9_1380=l9_1372;
int l9_1381=l9_1379;
float l9_1382=l9_1373;
float4 l9_1383=float4(0.0);
float2 l9_1384=l9_1380;
int l9_1385=sc_EnvmapSpecularLayout_tmp;
int l9_1386=l9_1381;
float l9_1387=l9_1382;
float2 l9_1388=l9_1384;
int l9_1389=l9_1385;
int l9_1390=l9_1386;
float3 l9_1391=float3(0.0);
if (l9_1389==0)
{
l9_1391=float3(l9_1388,0.0);
}
else
{
if (l9_1389==1)
{
l9_1391=float3(l9_1388.x,(l9_1388.y*0.5)+(0.5-(float(l9_1390)*0.5)),0.0);
}
else
{
l9_1391=float3(l9_1388,float(l9_1390));
}
}
float3 l9_1392=l9_1391;
float3 l9_1393=l9_1392;
float2 l9_1394=l9_1393.xy;
float l9_1395=l9_1387;
float4 l9_1396=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1394,level(l9_1395));
float4 l9_1397=l9_1396;
l9_1383=l9_1397;
float4 l9_1398=l9_1383;
float4 l9_1399=l9_1398;
float4 l9_1400=l9_1399;
float4 l9_1401=l9_1400;
l9_1317=mix(l9_1365,l9_1401,float4(l9_1329));
}
else
{
float2 l9_1402=l9_1326;
float l9_1403=l9_1316;
float2 l9_1404=l9_1402;
float l9_1405=l9_1403;
int l9_1406=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1407=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1407=0;
}
else
{
l9_1407=in.varStereoViewID;
}
int l9_1408=l9_1407;
l9_1406=1-l9_1408;
}
else
{
int l9_1409=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1409=0;
}
else
{
l9_1409=in.varStereoViewID;
}
int l9_1410=l9_1409;
l9_1406=l9_1410;
}
int l9_1411=l9_1406;
float2 l9_1412=l9_1404;
int l9_1413=l9_1411;
float l9_1414=l9_1405;
float4 l9_1415=float4(0.0);
float2 l9_1416=l9_1412;
int l9_1417=sc_EnvmapSpecularLayout_tmp;
int l9_1418=l9_1413;
float l9_1419=l9_1414;
float2 l9_1420=l9_1416;
int l9_1421=l9_1417;
int l9_1422=l9_1418;
float3 l9_1423=float3(0.0);
if (l9_1421==0)
{
l9_1423=float3(l9_1420,0.0);
}
else
{
if (l9_1421==1)
{
l9_1423=float3(l9_1420.x,(l9_1420.y*0.5)+(0.5-(float(l9_1422)*0.5)),0.0);
}
else
{
l9_1423=float3(l9_1420,float(l9_1422));
}
}
float3 l9_1424=l9_1423;
float3 l9_1425=l9_1424;
float2 l9_1426=l9_1425.xy;
float l9_1427=l9_1419;
float4 l9_1428=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1426,level(l9_1427));
float4 l9_1429=l9_1428;
l9_1415=l9_1429;
float4 l9_1430=l9_1415;
float4 l9_1431=l9_1430;
float4 l9_1432=l9_1431;
l9_1317=l9_1432;
}
float4 l9_1433=l9_1317;
float3 l9_1434=l9_1433.xyz*(1.0/l9_1433.w);
float3 l9_1435=l9_1434;
float3 l9_1436=l9_1435*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1436+=float3(1e-06);
float3 l9_1437=l9_1436;
float3 l9_1438=l9_1437;
bool l9_1439=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_1439)
{
float4 l9_1440=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_1438=mix(l9_1438,l9_1440.xyz,float3(l9_1440.w));
}
SurfaceProperties l9_1441=l9_1300;
float l9_1442=abs(dot(l9_1302,l9_1301));
float3 l9_1443=l9_1438*envBRDFApprox(l9_1441,l9_1442);
l9_1299+=l9_1443;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_1444=l9_1297;
float3 l9_1445=l9_1298;
float l9_1446=fast::clamp(l9_1444.roughness*l9_1444.roughness,0.0099999998,1.0);
float3 l9_1447=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_1444.specColor;
sc_SphericalGaussianLight_t l9_1448;
sc_SphericalGaussianLight_t l9_1449;
sc_SphericalGaussianLight_t l9_1450;
int l9_1451=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1451<sc_LightEstimationSGCount_tmp)
{
l9_1448.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1451].color;
l9_1448.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1451].sharpness;
l9_1448.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1451].axis;
float3 l9_1452=l9_1444.normal;
float l9_1453=l9_1446;
float3 l9_1454=l9_1445;
float3 l9_1455=l9_1444.specColor;
float3 l9_1456=l9_1452;
float l9_1457=l9_1453;
l9_1449.axis=l9_1456;
float l9_1458=l9_1457*l9_1457;
l9_1449.sharpness=2.0/l9_1458;
l9_1449.color=float3(1.0/(3.1415927*l9_1458));
sc_SphericalGaussianLight_t l9_1459=l9_1449;
sc_SphericalGaussianLight_t l9_1460=l9_1459;
sc_SphericalGaussianLight_t l9_1461=l9_1460;
float3 l9_1462=l9_1454;
l9_1450.axis=reflect(-l9_1462,l9_1461.axis);
l9_1450.color=l9_1461.color;
l9_1450.sharpness=l9_1461.sharpness;
l9_1450.sharpness/=(4.0*fast::max(dot(l9_1461.axis,l9_1462),9.9999997e-05));
sc_SphericalGaussianLight_t l9_1463=l9_1450;
sc_SphericalGaussianLight_t l9_1464=l9_1463;
sc_SphericalGaussianLight_t l9_1465=l9_1464;
sc_SphericalGaussianLight_t l9_1466=l9_1448;
float l9_1467=length((l9_1465.axis*l9_1465.sharpness)+(l9_1466.axis*l9_1466.sharpness));
float3 l9_1468=(l9_1465.color*exp((l9_1467-l9_1465.sharpness)-l9_1466.sharpness))*l9_1466.color;
float l9_1469=1.0-exp((-2.0)*l9_1467);
float3 l9_1470=((l9_1468*6.2831855)*l9_1469)/float3(l9_1467);
float3 l9_1471=l9_1470;
float3 l9_1472=l9_1464.axis;
float l9_1473=l9_1453*l9_1453;
float l9_1474=dot(l9_1452,l9_1472);
float l9_1475=fast::clamp(l9_1474,0.0,1.0);
float l9_1476=l9_1475;
float l9_1477=dot(l9_1452,l9_1454);
float l9_1478=fast::clamp(l9_1477,0.0,1.0);
float l9_1479=l9_1478;
float3 l9_1480=normalize(l9_1464.axis+l9_1454);
float l9_1481=l9_1473;
float l9_1482=l9_1476;
float l9_1483=1.0/(l9_1482+sqrt(l9_1481+(((1.0-l9_1481)*l9_1482)*l9_1482)));
float l9_1484=l9_1473;
float l9_1485=l9_1479;
float l9_1486=1.0/(l9_1485+sqrt(l9_1484+(((1.0-l9_1484)*l9_1485)*l9_1485)));
l9_1471*=(l9_1483*l9_1486);
float l9_1487=dot(l9_1472,l9_1480);
float l9_1488=fast::clamp(l9_1487,0.0,1.0);
float l9_1489=pow(1.0-l9_1488,5.0);
l9_1471*=(l9_1455+((float3(1.0)-l9_1455)*l9_1489));
l9_1471*=l9_1476;
float3 l9_1490=l9_1471;
l9_1447+=l9_1490;
l9_1451++;
continue;
}
else
{
break;
}
}
float3 l9_1491=l9_1447;
l9_1299+=l9_1491;
}
float3 l9_1492=l9_1299;
l9_1047.indirectSpecular=l9_1492;
LightingComponents l9_1493=l9_1047;
LightingComponents l9_1494=l9_1493;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1494.directDiffuse=float3(0.0);
l9_1494.indirectDiffuse=float3(0.0);
float4 l9_1495=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1496=out.FragColor0;
float4 l9_1497=l9_1496;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1497.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1498=l9_1497;
l9_1495=l9_1498;
}
else
{
float4 l9_1499=gl_FragCoord;
float2 l9_1500=l9_1499.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1501=l9_1500;
float2 l9_1502=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1503=1;
int l9_1504=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1504=0;
}
else
{
l9_1504=in.varStereoViewID;
}
int l9_1505=l9_1504;
int l9_1506=l9_1505;
float3 l9_1507=float3(l9_1501,0.0);
int l9_1508=l9_1503;
int l9_1509=l9_1506;
if (l9_1508==1)
{
l9_1507.y=((2.0*l9_1507.y)+float(l9_1509))-1.0;
}
float2 l9_1510=l9_1507.xy;
l9_1502=l9_1510;
}
else
{
l9_1502=l9_1501;
}
float2 l9_1511=l9_1502;
float2 l9_1512=l9_1511;
float2 l9_1513=l9_1512;
int l9_1514=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1515=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1515=0;
}
else
{
l9_1515=in.varStereoViewID;
}
int l9_1516=l9_1515;
l9_1514=1-l9_1516;
}
else
{
int l9_1517=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1517=0;
}
else
{
l9_1517=in.varStereoViewID;
}
int l9_1518=l9_1517;
l9_1514=l9_1518;
}
int l9_1519=l9_1514;
float2 l9_1520=l9_1513;
int l9_1521=l9_1519;
float2 l9_1522=l9_1520;
int l9_1523=l9_1521;
float l9_1524=0.0;
float4 l9_1525=float4(0.0);
float2 l9_1526=l9_1522;
int l9_1527=sc_ScreenTextureLayout_tmp;
int l9_1528=l9_1523;
float l9_1529=l9_1524;
float2 l9_1530=l9_1526;
int l9_1531=l9_1527;
int l9_1532=l9_1528;
float3 l9_1533=float3(0.0);
if (l9_1531==0)
{
l9_1533=float3(l9_1530,0.0);
}
else
{
if (l9_1531==1)
{
l9_1533=float3(l9_1530.x,(l9_1530.y*0.5)+(0.5-(float(l9_1532)*0.5)),0.0);
}
else
{
l9_1533=float3(l9_1530,float(l9_1532));
}
}
float3 l9_1534=l9_1533;
float3 l9_1535=l9_1534;
float2 l9_1536=l9_1535.xy;
float l9_1537=l9_1529;
float4 l9_1538=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1536,bias(l9_1537));
float4 l9_1539=l9_1538;
l9_1525=l9_1539;
float4 l9_1540=l9_1525;
float4 l9_1541=l9_1540;
float4 l9_1542=l9_1541;
l9_1495=l9_1542;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_1495.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_1543=l9_1495;
float4 l9_1544=l9_1543;
float3 l9_1545=l9_1544.xyz;
float3 l9_1546;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1546=float3(pow(l9_1545.x,2.2),pow(l9_1545.y,2.2),pow(l9_1545.z,2.2));
}
else
{
l9_1546=l9_1545*l9_1545;
}
float3 l9_1547=l9_1546;
float3 l9_1548=l9_1547;
l9_1494.transmitted=l9_1548*mix(float3(1.0),l9_1031.albedo,float3(l9_1031.opacity));
l9_1031.opacity=1.0;
}
bool l9_1549=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1549=true;
}
SurfaceProperties l9_1550=l9_1031;
LightingComponents l9_1551=l9_1494;
bool l9_1552=l9_1549;
float3 l9_1553=float3(0.0);
bool l9_1554=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_1554)
{
l9_1553=l9_1550.albedo*(l9_1551.directDiffuse+(l9_1551.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_1553=l9_1550.albedo*(l9_1551.directDiffuse+(l9_1551.indirectDiffuse*l9_1550.ao));
}
float3 l9_1555=l9_1551.directSpecular+(l9_1551.indirectSpecular*l9_1550.specularAo);
float3 l9_1556=l9_1550.emissive;
float3 l9_1557=l9_1551.transmitted;
if (l9_1552)
{
float l9_1558=l9_1550.opacity;
l9_1553*=srgbToLinear(l9_1558);
}
float3 l9_1559=((l9_1553+l9_1555)+l9_1556)+l9_1557;
float3 l9_1560=l9_1559;
float4 l9_1561=float4(l9_1560,l9_1031.opacity);
if ((int(sc_IsEditor_tmp)!=0))
{
l9_1561.x+=((l9_1031.ao.x*l9_1031.specularAo.x)*9.9999997e-06);
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_1562=l9_1561.xyz;
float l9_1563=1.8;
float l9_1564=1.4;
float l9_1565=0.5;
float l9_1566=1.5;
float3 l9_1567=(l9_1562*((l9_1562*l9_1563)+float3(l9_1564)))/((l9_1562*((l9_1562*l9_1563)+float3(l9_1565)))+float3(l9_1566));
l9_1561=float4(l9_1567.x,l9_1567.y,l9_1567.z,l9_1561.w);
}
float3 l9_1568=l9_1561.xyz;
float l9_1569=l9_1568.x;
float l9_1570=l9_1568.y;
float l9_1571=l9_1568.z;
float3 l9_1572=float3(linearToSrgb(l9_1569),linearToSrgb(l9_1570),linearToSrgb(l9_1571));
l9_1561=float4(l9_1572.x,l9_1572.y,l9_1572.z,l9_1561.w);
float4 l9_1573=l9_1561;
param_54=l9_1573;
}
param_54=fast::max(param_54,float4(0.0));
Output_N36=param_54;
float2 ScreenCoord_N26=float2(0.0);
ScreenCoord_N26=Globals.gScreenCoord;
float Depth_N25=0.0;
int l9_1574=0;
if ((int(bodyDepthTexHasSwappedViews_tmp)!=0))
{
int l9_1575=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1575=0;
}
else
{
l9_1575=in.varStereoViewID;
}
int l9_1576=l9_1575;
l9_1574=1-l9_1576;
}
else
{
int l9_1577=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1577=0;
}
else
{
l9_1577=in.varStereoViewID;
}
int l9_1578=l9_1577;
l9_1574=l9_1578;
}
int l9_1579=l9_1574;
int param_56=bodyDepthTexLayout_tmp;
int param_57=l9_1579;
float2 param_58=ScreenCoord_N26;
bool param_59=(int(SC_USE_UV_TRANSFORM_bodyDepthTex_tmp)!=0);
float3x3 param_60=(*sc_set0.UserUniforms).bodyDepthTexTransform;
int2 param_61=int2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex_tmp,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex_tmp);
bool param_62=(int(SC_USE_UV_MIN_MAX_bodyDepthTex_tmp)!=0);
float4 param_63=(*sc_set0.UserUniforms).bodyDepthTexUvMinMax;
bool param_64=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex_tmp)!=0);
float4 param_65=(*sc_set0.UserUniforms).bodyDepthTexBorderColor;
float param_66=0.0;
bool l9_1580=param_64&&(!param_62);
float l9_1581=1.0;
float l9_1582=param_58.x;
int l9_1583=param_61.x;
if (l9_1583==1)
{
l9_1582=fract(l9_1582);
}
else
{
if (l9_1583==2)
{
float l9_1584=fract(l9_1582);
float l9_1585=l9_1582-l9_1584;
float l9_1586=step(0.25,fract(l9_1585*0.5));
l9_1582=mix(l9_1584,1.0-l9_1584,fast::clamp(l9_1586,0.0,1.0));
}
}
param_58.x=l9_1582;
float l9_1587=param_58.y;
int l9_1588=param_61.y;
if (l9_1588==1)
{
l9_1587=fract(l9_1587);
}
else
{
if (l9_1588==2)
{
float l9_1589=fract(l9_1587);
float l9_1590=l9_1587-l9_1589;
float l9_1591=step(0.25,fract(l9_1590*0.5));
l9_1587=mix(l9_1589,1.0-l9_1589,fast::clamp(l9_1591,0.0,1.0));
}
}
param_58.y=l9_1587;
if (param_62)
{
bool l9_1592=param_64;
bool l9_1593;
if (l9_1592)
{
l9_1593=param_61.x==3;
}
else
{
l9_1593=l9_1592;
}
float l9_1594=param_58.x;
float l9_1595=param_63.x;
float l9_1596=param_63.z;
bool l9_1597=l9_1593;
float l9_1598=l9_1581;
float l9_1599=fast::clamp(l9_1594,l9_1595,l9_1596);
float l9_1600=step(abs(l9_1594-l9_1599),9.9999997e-06);
l9_1598*=(l9_1600+((1.0-float(l9_1597))*(1.0-l9_1600)));
l9_1594=l9_1599;
param_58.x=l9_1594;
l9_1581=l9_1598;
bool l9_1601=param_64;
bool l9_1602;
if (l9_1601)
{
l9_1602=param_61.y==3;
}
else
{
l9_1602=l9_1601;
}
float l9_1603=param_58.y;
float l9_1604=param_63.y;
float l9_1605=param_63.w;
bool l9_1606=l9_1602;
float l9_1607=l9_1581;
float l9_1608=fast::clamp(l9_1603,l9_1604,l9_1605);
float l9_1609=step(abs(l9_1603-l9_1608),9.9999997e-06);
l9_1607*=(l9_1609+((1.0-float(l9_1606))*(1.0-l9_1609)));
l9_1603=l9_1608;
param_58.y=l9_1603;
l9_1581=l9_1607;
}
float2 l9_1610=param_58;
bool l9_1611=param_59;
float3x3 l9_1612=param_60;
if (l9_1611)
{
l9_1610=float2((l9_1612*float3(l9_1610,1.0)).xy);
}
float2 l9_1613=l9_1610;
float2 l9_1614=l9_1613;
float2 l9_1615=l9_1614;
param_58=l9_1615;
float l9_1616=param_58.x;
int l9_1617=param_61.x;
bool l9_1618=l9_1580;
float l9_1619=l9_1581;
if ((l9_1617==0)||(l9_1617==3))
{
float l9_1620=l9_1616;
float l9_1621=0.0;
float l9_1622=1.0;
bool l9_1623=l9_1618;
float l9_1624=l9_1619;
float l9_1625=fast::clamp(l9_1620,l9_1621,l9_1622);
float l9_1626=step(abs(l9_1620-l9_1625),9.9999997e-06);
l9_1624*=(l9_1626+((1.0-float(l9_1623))*(1.0-l9_1626)));
l9_1620=l9_1625;
l9_1616=l9_1620;
l9_1619=l9_1624;
}
param_58.x=l9_1616;
l9_1581=l9_1619;
float l9_1627=param_58.y;
int l9_1628=param_61.y;
bool l9_1629=l9_1580;
float l9_1630=l9_1581;
if ((l9_1628==0)||(l9_1628==3))
{
float l9_1631=l9_1627;
float l9_1632=0.0;
float l9_1633=1.0;
bool l9_1634=l9_1629;
float l9_1635=l9_1630;
float l9_1636=fast::clamp(l9_1631,l9_1632,l9_1633);
float l9_1637=step(abs(l9_1631-l9_1636),9.9999997e-06);
l9_1635*=(l9_1637+((1.0-float(l9_1634))*(1.0-l9_1637)));
l9_1631=l9_1636;
l9_1627=l9_1631;
l9_1630=l9_1635;
}
param_58.y=l9_1627;
l9_1581=l9_1630;
float2 l9_1638=param_58;
int l9_1639=param_56;
int l9_1640=param_57;
float l9_1641=param_66;
float2 l9_1642=l9_1638;
int l9_1643=l9_1639;
int l9_1644=l9_1640;
float3 l9_1645=float3(0.0);
if (l9_1643==0)
{
l9_1645=float3(l9_1642,0.0);
}
else
{
if (l9_1643==1)
{
l9_1645=float3(l9_1642.x,(l9_1642.y*0.5)+(0.5-(float(l9_1644)*0.5)),0.0);
}
else
{
l9_1645=float3(l9_1642,float(l9_1644));
}
}
float3 l9_1646=l9_1645;
float3 l9_1647=l9_1646;
float2 l9_1648=l9_1647.xy;
float l9_1649=l9_1641;
float4 l9_1650=sc_set0.bodyDepthTex.sample(sc_set0.bodyDepthTexSmpSC,l9_1648,bias(l9_1649));
float4 l9_1651=l9_1650;
float4 l9_1652=l9_1651;
if (param_64)
{
l9_1652=mix(param_65,l9_1652,float4(l9_1581));
}
float4 l9_1653=l9_1652;
float param_67=l9_1653.x;
float4 param_68=(*sc_set0.UserUniforms).bodyDepthTexProjectionMatrixTerms;
float l9_1654=param_68.x;
float l9_1655=param_68.y;
bool l9_1656=param_68.z==0.0;
param_67=(param_67*2.0)-1.0;
float l9_1657;
if (l9_1656)
{
l9_1657=(param_67-l9_1655)/l9_1654;
}
else
{
l9_1657=l9_1655/((-param_67)-l9_1654);
}
float l9_1658=l9_1657;
Depth_N25=l9_1658;
float Depth_N29=0.0;
float l9_1659=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.x;
float l9_1660=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.y;
float4 l9_1661=gl_FragCoord;
float param_69=(l9_1660*l9_1659)/(l9_1660+(l9_1661.z*(l9_1659-l9_1660)));
Depth_N29=param_69;
float4 Result_N22=float4(0.0);
float param_70=Output_N24;
float4 param_71=Output_N36;
float param_72=Depth_N25;
float param_73=Depth_N29;
ssGlobals param_75=Globals;
tempGlobals=param_75;
float4 param_74=float4(0.0);
N22_EnableBodyDepth=param_70;
N22_OceanColor=param_71;
N22_BodyDepth=param_72;
N22_cameraDepth=param_73;
float l9_1662=N22_BodyDepth-(1.0-N22_cameraDepth);
float l9_1663=l9_1662*0.035;
float l9_1664=100.0;
float l9_1665;
if (l9_1663<=0.0)
{
l9_1665=0.0;
}
else
{
l9_1665=pow(l9_1663,l9_1664);
}
float l9_1666=l9_1665;
l9_1662=1.0-fast::clamp(l9_1666,0.0,1.0);
if ((N22_EnableBodyDepth==1.0)&&(l9_1662<1.0))
{
discard_fragment();
}
N22_Result=N22_OceanColor;
param_74=N22_Result;
Result_N22=param_74;
FinalColor=Result_N22;
float4 param_76=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1667=param_76;
float4 l9_1668=l9_1667;
float l9_1669=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1669=l9_1668.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1669=fast::clamp(l9_1668.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1669=fast::clamp(dot(l9_1668.xyz,float3(l9_1668.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1669=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1669=(1.0-dot(l9_1668.xyz,float3(0.33333001)))*l9_1668.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1669=(1.0-fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0))*l9_1668.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1669=fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0)*l9_1668.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1669=fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1669=fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0)*l9_1668.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1669=dot(l9_1668.xyz,float3(0.33333001))*l9_1668.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1669=1.0-fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1669=fast::clamp(dot(l9_1668.xyz,float3(1.0)),0.0,1.0);
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
float l9_1670=l9_1669;
float l9_1671=l9_1670;
float l9_1672=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1671;
float3 l9_1673=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1667.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1674=float4(l9_1673.x,l9_1673.y,l9_1673.z,l9_1672);
param_76=l9_1674;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_76=float4(param_76.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1675=param_76;
float4 l9_1676=float4(0.0);
float4 l9_1677=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1678=out.FragColor0;
float4 l9_1679=l9_1678;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1679.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1680=l9_1679;
l9_1677=l9_1680;
}
else
{
float4 l9_1681=gl_FragCoord;
float2 l9_1682=l9_1681.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1683=l9_1682;
float2 l9_1684=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1685=1;
int l9_1686=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1686=0;
}
else
{
l9_1686=in.varStereoViewID;
}
int l9_1687=l9_1686;
int l9_1688=l9_1687;
float3 l9_1689=float3(l9_1683,0.0);
int l9_1690=l9_1685;
int l9_1691=l9_1688;
if (l9_1690==1)
{
l9_1689.y=((2.0*l9_1689.y)+float(l9_1691))-1.0;
}
float2 l9_1692=l9_1689.xy;
l9_1684=l9_1692;
}
else
{
l9_1684=l9_1683;
}
float2 l9_1693=l9_1684;
float2 l9_1694=l9_1693;
float2 l9_1695=l9_1694;
int l9_1696=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1697=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1697=0;
}
else
{
l9_1697=in.varStereoViewID;
}
int l9_1698=l9_1697;
l9_1696=1-l9_1698;
}
else
{
int l9_1699=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1699=0;
}
else
{
l9_1699=in.varStereoViewID;
}
int l9_1700=l9_1699;
l9_1696=l9_1700;
}
int l9_1701=l9_1696;
float2 l9_1702=l9_1695;
int l9_1703=l9_1701;
float2 l9_1704=l9_1702;
int l9_1705=l9_1703;
float l9_1706=0.0;
float4 l9_1707=float4(0.0);
float2 l9_1708=l9_1704;
int l9_1709=sc_ScreenTextureLayout_tmp;
int l9_1710=l9_1705;
float l9_1711=l9_1706;
float2 l9_1712=l9_1708;
int l9_1713=l9_1709;
int l9_1714=l9_1710;
float3 l9_1715=float3(0.0);
if (l9_1713==0)
{
l9_1715=float3(l9_1712,0.0);
}
else
{
if (l9_1713==1)
{
l9_1715=float3(l9_1712.x,(l9_1712.y*0.5)+(0.5-(float(l9_1714)*0.5)),0.0);
}
else
{
l9_1715=float3(l9_1712,float(l9_1714));
}
}
float3 l9_1716=l9_1715;
float3 l9_1717=l9_1716;
float2 l9_1718=l9_1717.xy;
float l9_1719=l9_1711;
float4 l9_1720=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1718,bias(l9_1719));
float4 l9_1721=l9_1720;
l9_1707=l9_1721;
float4 l9_1722=l9_1707;
float4 l9_1723=l9_1722;
float4 l9_1724=l9_1723;
l9_1677=l9_1724;
}
if ((((int(sc_IsEditor_tmp)!=0)&&(int(sc_GetFramebufferColorInvalidUsageMarker_tmp)!=0))&&(!(int(sc_BlendMode_Software_tmp)!=0)))&&(!(int(sc_BlendMode_ColoredGlass_tmp)!=0)))
{
l9_1677.x+=(*sc_set0.UserUniforms)._sc_GetFramebufferColorInvalidUsageMarker;
}
float4 l9_1725=l9_1677;
float4 l9_1726=l9_1725;
float3 l9_1727=l9_1726.xyz;
float3 l9_1728=l9_1727;
float3 l9_1729=l9_1675.xyz;
float3 l9_1730=definedBlend(l9_1728,l9_1729,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1676=float4(l9_1730.x,l9_1730.y,l9_1730.z,l9_1676.w);
float3 l9_1731=mix(l9_1727,l9_1676.xyz,float3(l9_1675.w));
l9_1676=float4(l9_1731.x,l9_1731.y,l9_1731.z,l9_1676.w);
l9_1676.w=1.0;
float4 l9_1732=l9_1676;
param_76=l9_1732;
}
else
{
float4 l9_1733=param_76;
float4 l9_1734=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1734=float4(mix(float3(1.0),l9_1733.xyz,float3(l9_1733.w)),l9_1733.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1735=l9_1733.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1735=fast::clamp(l9_1735,0.0,1.0);
}
l9_1734=float4(l9_1733.xyz*l9_1735,l9_1735);
}
else
{
l9_1734=l9_1733;
}
}
float4 l9_1736=l9_1734;
param_76=l9_1736;
}
}
}
float4 l9_1737=param_76;
FinalColor=l9_1737;
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
float4 l9_1738=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1738=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1738=float4(0.0);
}
float4 l9_1739=l9_1738;
float4 Cost=l9_1739;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_77=in.varPos;
float4 param_78=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_77,param_78,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_79=FinalColor;
float4 l9_1740=param_79;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1740.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1740;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 N7_TransformedUV2;
float2 N7_TransformedUV3;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float4 VertexColor;
float2 gScreenCoord;
float3 SurfacePosition_WorldSpace;
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
float3 oceanPos;
float4 heightmapSize;
float4 heightmapDims;
float4 heightmapView;
float3x3 heightmapTransform;
float4 heightmapUvMinMax;
float4 heightmapBorderColor;
float2 unpackVal;
float3 oceanMin;
float3 oceanMax;
float enableFluid;
float2 pressureRange;
float4 fluidPressureSize;
float4 fluidPressureDims;
float4 fluidPressureView;
float3x3 fluidPressureTransform;
float4 fluidPressureUvMinMax;
float4 fluidPressureBorderColor;
float fluidMul;
float speed;
float bodyIntersection;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float3 recolorRed;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float reflectionIntensity;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float rimExponent;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float metallic;
float roughness;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float specularAoIntensity;
float specularAoDarkening;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float4 bodyDepthTexSize;
float4 bodyDepthTexDims;
float4 bodyDepthTexView;
float3x3 bodyDepthTexTransform;
float4 bodyDepthTexUvMinMax;
float4 bodyDepthTexBorderColor;
float4 bodyDepthTexProjectionMatrixTerms;
float Port_BobPosSpeed_N153;
float Port_BobPosAmount_N153;
float Port_BobRotSpeed_N153;
float Port_BobRotAmount_N153;
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
texture2d<float> baseTex [[id(1)]];
texture2d<float> bodyDepthTex [[id(2)]];
texture2d<float> detailNormalTex [[id(3)]];
texture2d<float> emissiveTex [[id(4)]];
texture2d<float> fluidPressure [[id(5)]];
texture2d<float> heightmap [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
sampler baseTexSmpSC [[id(32)]];
sampler bodyDepthTexSmpSC [[id(33)]];
sampler detailNormalTexSmpSC [[id(34)]];
sampler emissiveTexSmpSC [[id(35)]];
sampler fluidPressureSmpSC [[id(36)]];
sampler heightmapSmpSC [[id(37)]];
sampler intensityTextureSmpSC [[id(38)]];
sampler materialParamsTexSmpSC [[id(39)]];
sampler normalTexSmpSC [[id(40)]];
sampler opacityTexSmpSC [[id(41)]];
sampler reflectionModulationTexSmpSC [[id(42)]];
sampler reflectionTexSmpSC [[id(43)]];
sampler rimColorTexSmpSC [[id(44)]];
sampler sc_EnvmapDiffuseSmpSC [[id(45)]];
sampler sc_EnvmapSpecularSmpSC [[id(46)]];
sampler sc_RayTracedAoTextureSmpSC [[id(48)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(49)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(50)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(51)]];
sampler sc_SSAOTextureSmpSC [[id(52)]];
sampler sc_ScreenTextureSmpSC [[id(53)]];
sampler sc_ShadowTextureSmpSC [[id(54)]];
constant userUniformsObj* UserUniforms [[id(56)]];
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
float N22_EnableBodyDepth=0.0;
float N22_BodyDepth=0.0;
float N22_cameraDepth=0.0;
int N7_VertexColorSwitch=0;
float4 N7_BaseColorValue=float4(0.0);
bool N7_EnableBaseTexture=false;
int N7_BaseTextureUVSwitch=0;
bool N7_EnableRecolor=false;
float3 N7_RecolorR=float3(0.0);
float3 N7_RecolorG=float3(0.0);
float3 N7_RecolorB=float3(0.0);
bool N7_EnableOpacityTexture=false;
int N7_OpacityUVSwitch=0;
bool N7_EnableNormalTexture=false;
int N7_NormalUVSwitch=0;
bool N7_EnableDetailNormal=false;
int N7_Detail_NormalUVSwitch=0;
bool N7_EnableMaterialParamsTexture=false;
float N7_RoughnessValue=0.0;
int N7_MaterialParamsUVSwitch=0;
bool N7_EnableUV2=false;
int N7_UV2Switch=0;
float2 N7_UV2Scale=float2(0.0);
float2 N7_UV2Offset=float2(0.0);
bool N7_UV2Animation=false;
bool N7_EnableUV3=false;
int N7_UV3Switch=0;
float2 N7_UV3Scale=float2(0.0);
float2 N7_UV3Offset=float2(0.0);
bool N7_UV3Animation=false;
float4 N7_Albedo=float4(0.0);
float N7_Opacity=0.0;
float3 N7_Normal=float3(0.0);
float N7_Roughness=0.0;
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
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
Globals.VertexColor=in.varColor;
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
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float Output_N24=0.0;
float param=(*sc_set0.UserUniforms).bodyIntersection;
Output_N24=param;
float4 Output_N5=float4(0.0);
float4 param_1=(*sc_set0.UserUniforms).baseColor;
Output_N5=param_1;
float3 Output_N85=float3(0.0);
float3 param_2=(*sc_set0.UserUniforms).recolorRed;
Output_N85=param_2;
float3 Output_N86=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).recolorGreen;
Output_N86=param_3;
float3 Output_N87=float3(0.0);
float3 param_4=(*sc_set0.UserUniforms).recolorBlue;
Output_N87=param_4;
float Output_N243=0.0;
float param_5=(*sc_set0.UserUniforms).roughness;
Output_N243=param_5;
float2 Output_N14=float2(0.0);
float2 param_6=(*sc_set0.UserUniforms).uv2Scale;
Output_N14=param_6;
float2 Output_N15=float2(0.0);
float2 param_7=(*sc_set0.UserUniforms).uv2Offset;
Output_N15=param_7;
float2 Output_N50=float2(0.0);
float2 param_8=(*sc_set0.UserUniforms).uv3Scale;
Output_N50=param_8;
float2 Output_N51=float2(0.0);
float2 param_9=(*sc_set0.UserUniforms).uv3Offset;
Output_N51=param_9;
float Opacity_N7=0.0;
float3 Normal_N7=float3(0.0);
float Roughness_N7=0.0;
float4 param_10=Output_N5;
float3 param_11=Output_N85;
float3 param_12=Output_N86;
float3 param_13=Output_N87;
float param_14=Output_N243;
float2 param_15=Output_N14;
float2 param_16=Output_N15;
float2 param_17=Output_N50;
float2 param_18=Output_N51;
ssGlobals param_22=Globals;
ssGlobals tempGlobals=param_22;
float param_19=0.0;
float3 param_20=float3(0.0);
float param_21=0.0;
N7_VertexColorSwitch=NODE_38_DROPLIST_ITEM_tmp;
N7_BaseColorValue=param_10;
N7_EnableBaseTexture=(int(ENABLE_BASE_TEX_tmp)!=0);
N7_BaseTextureUVSwitch=NODE_27_DROPLIST_ITEM_tmp;
N7_EnableRecolor=(int(ENABLE_RECOLOR_tmp)!=0);
N7_RecolorR=param_11;
N7_RecolorG=param_12;
N7_RecolorB=param_13;
N7_EnableOpacityTexture=(int(ENABLE_OPACITY_TEX_tmp)!=0);
N7_OpacityUVSwitch=NODE_69_DROPLIST_ITEM_tmp;
N7_EnableNormalTexture=(int(ENABLE_NORMALMAP_tmp)!=0);
N7_NormalUVSwitch=NODE_181_DROPLIST_ITEM_tmp;
N7_EnableDetailNormal=(int(ENABLE_DETAIL_NORMAL_tmp)!=0);
N7_Detail_NormalUVSwitch=NODE_184_DROPLIST_ITEM_tmp;
N7_EnableMaterialParamsTexture=(int(ENABLE_MATERIAL_PARAM_TEX_tmp)!=0);
N7_RoughnessValue=param_14;
N7_MaterialParamsUVSwitch=NODE_221_DROPLIST_ITEM_tmp;
N7_EnableUV2=(int(ENABLE_UV2_tmp)!=0);
N7_UV2Switch=NODE_13_DROPLIST_ITEM_tmp;
N7_UV2Scale=param_15;
N7_UV2Offset=param_16;
N7_UV2Animation=(int(uv2EnableAnimation_tmp)!=0);
N7_EnableUV3=(int(ENABLE_UV3_tmp)!=0);
N7_UV3Switch=NODE_49_DROPLIST_ITEM_tmp;
N7_UV3Scale=param_17;
N7_UV3Offset=param_18;
N7_UV3Animation=(int(uv3EnableAnimation_tmp)!=0);
int l9_14=N7_UV2Switch;
float2 l9_15=N7_UV2Scale;
float2 l9_16=N7_UV2Offset;
bool l9_17=N7_UV2Animation;
bool l9_18=N7_EnableUV2;
float2 l9_19=tempGlobals.Surface_UVCoord0;
float2 l9_20=l9_19;
if (l9_18==N7_EnableUV2)
{
if (l9_14==0)
{
float2 l9_21=tempGlobals.Surface_UVCoord0;
l9_20=l9_21;
}
if (l9_14==1)
{
float2 l9_22=tempGlobals.Surface_UVCoord1;
l9_20=l9_22;
}
if (l9_14==2)
{
float2 l9_23=tempGlobals.gScreenCoord;
l9_20=l9_23;
}
}
else
{
if (l9_14==0)
{
float2 l9_24=tempGlobals.Surface_UVCoord0;
l9_20=l9_24;
}
if (l9_14==1)
{
float2 l9_25=tempGlobals.Surface_UVCoord1;
l9_20=l9_25;
}
if (l9_14==2)
{
float2 l9_26=tempGlobals.gScreenCoord;
l9_20=l9_26;
}
if (l9_14==3)
{
l9_20=tempGlobals.N7_TransformedUV2;
}
}
l9_20=(l9_20*l9_15)+l9_16;
if (l9_17)
{
float l9_27=tempGlobals.gTimeElapsed;
l9_20+=(l9_16*l9_27);
}
float2 l9_28=l9_20;
tempGlobals.N7_TransformedUV2=l9_28;
int l9_29=N7_UV3Switch;
float2 l9_30=N7_UV3Scale;
float2 l9_31=N7_UV3Offset;
bool l9_32=N7_UV3Animation;
bool l9_33=N7_EnableUV3;
float2 l9_34=tempGlobals.Surface_UVCoord0;
float2 l9_35=l9_34;
if (l9_33==N7_EnableUV2)
{
if (l9_29==0)
{
float2 l9_36=tempGlobals.Surface_UVCoord0;
l9_35=l9_36;
}
if (l9_29==1)
{
float2 l9_37=tempGlobals.Surface_UVCoord1;
l9_35=l9_37;
}
if (l9_29==2)
{
float2 l9_38=tempGlobals.gScreenCoord;
l9_35=l9_38;
}
}
else
{
if (l9_29==0)
{
float2 l9_39=tempGlobals.Surface_UVCoord0;
l9_35=l9_39;
}
if (l9_29==1)
{
float2 l9_40=tempGlobals.Surface_UVCoord1;
l9_35=l9_40;
}
if (l9_29==2)
{
float2 l9_41=tempGlobals.gScreenCoord;
l9_35=l9_41;
}
if (l9_29==3)
{
l9_35=tempGlobals.N7_TransformedUV2;
}
}
l9_35=(l9_35*l9_30)+l9_31;
if (l9_32)
{
float l9_42=tempGlobals.gTimeElapsed;
l9_35+=(l9_31*l9_42);
}
float2 l9_43=l9_35;
tempGlobals.N7_TransformedUV3=l9_43;
float2 l9_44=tempGlobals.Surface_UVCoord0;
float2 l9_45=l9_44;
float2 l9_46=tempGlobals.Surface_UVCoord0;
float2 l9_47=l9_46;
N7_Opacity=1.0;
N7_Albedo=N7_BaseColorValue;
if (N7_EnableBaseTexture)
{
int l9_48=N7_BaseTextureUVSwitch;
float2 l9_49=tempGlobals.Surface_UVCoord0;
float2 l9_50=l9_49;
if (l9_48==0)
{
float2 l9_51=tempGlobals.Surface_UVCoord0;
l9_50=l9_51;
}
if (l9_48==1)
{
float2 l9_52=tempGlobals.Surface_UVCoord1;
l9_50=l9_52;
}
if (l9_48==2)
{
l9_50=tempGlobals.N7_TransformedUV2;
}
if (l9_48==3)
{
l9_50=tempGlobals.N7_TransformedUV3;
}
float2 l9_53=l9_50;
l9_45=l9_53;
float2 l9_54=l9_45;
float4 l9_55=float4(0.0);
int l9_56=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_57=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_57=0;
}
else
{
l9_57=in.varStereoViewID;
}
int l9_58=l9_57;
l9_56=1-l9_58;
}
else
{
int l9_59=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_59=0;
}
else
{
l9_59=in.varStereoViewID;
}
int l9_60=l9_59;
l9_56=l9_60;
}
int l9_61=l9_56;
int l9_62=baseTexLayout_tmp;
int l9_63=l9_61;
float2 l9_64=l9_54;
bool l9_65=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_66=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_67=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_68=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_69=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_70=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_71=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_72=0.0;
bool l9_73=l9_70&&(!l9_68);
float l9_74=1.0;
float l9_75=l9_64.x;
int l9_76=l9_67.x;
if (l9_76==1)
{
l9_75=fract(l9_75);
}
else
{
if (l9_76==2)
{
float l9_77=fract(l9_75);
float l9_78=l9_75-l9_77;
float l9_79=step(0.25,fract(l9_78*0.5));
l9_75=mix(l9_77,1.0-l9_77,fast::clamp(l9_79,0.0,1.0));
}
}
l9_64.x=l9_75;
float l9_80=l9_64.y;
int l9_81=l9_67.y;
if (l9_81==1)
{
l9_80=fract(l9_80);
}
else
{
if (l9_81==2)
{
float l9_82=fract(l9_80);
float l9_83=l9_80-l9_82;
float l9_84=step(0.25,fract(l9_83*0.5));
l9_80=mix(l9_82,1.0-l9_82,fast::clamp(l9_84,0.0,1.0));
}
}
l9_64.y=l9_80;
if (l9_68)
{
bool l9_85=l9_70;
bool l9_86;
if (l9_85)
{
l9_86=l9_67.x==3;
}
else
{
l9_86=l9_85;
}
float l9_87=l9_64.x;
float l9_88=l9_69.x;
float l9_89=l9_69.z;
bool l9_90=l9_86;
float l9_91=l9_74;
float l9_92=fast::clamp(l9_87,l9_88,l9_89);
float l9_93=step(abs(l9_87-l9_92),9.9999997e-06);
l9_91*=(l9_93+((1.0-float(l9_90))*(1.0-l9_93)));
l9_87=l9_92;
l9_64.x=l9_87;
l9_74=l9_91;
bool l9_94=l9_70;
bool l9_95;
if (l9_94)
{
l9_95=l9_67.y==3;
}
else
{
l9_95=l9_94;
}
float l9_96=l9_64.y;
float l9_97=l9_69.y;
float l9_98=l9_69.w;
bool l9_99=l9_95;
float l9_100=l9_74;
float l9_101=fast::clamp(l9_96,l9_97,l9_98);
float l9_102=step(abs(l9_96-l9_101),9.9999997e-06);
l9_100*=(l9_102+((1.0-float(l9_99))*(1.0-l9_102)));
l9_96=l9_101;
l9_64.y=l9_96;
l9_74=l9_100;
}
float2 l9_103=l9_64;
bool l9_104=l9_65;
float3x3 l9_105=l9_66;
if (l9_104)
{
l9_103=float2((l9_105*float3(l9_103,1.0)).xy);
}
float2 l9_106=l9_103;
float2 l9_107=l9_106;
float2 l9_108=l9_107;
l9_64=l9_108;
float l9_109=l9_64.x;
int l9_110=l9_67.x;
bool l9_111=l9_73;
float l9_112=l9_74;
if ((l9_110==0)||(l9_110==3))
{
float l9_113=l9_109;
float l9_114=0.0;
float l9_115=1.0;
bool l9_116=l9_111;
float l9_117=l9_112;
float l9_118=fast::clamp(l9_113,l9_114,l9_115);
float l9_119=step(abs(l9_113-l9_118),9.9999997e-06);
l9_117*=(l9_119+((1.0-float(l9_116))*(1.0-l9_119)));
l9_113=l9_118;
l9_109=l9_113;
l9_112=l9_117;
}
l9_64.x=l9_109;
l9_74=l9_112;
float l9_120=l9_64.y;
int l9_121=l9_67.y;
bool l9_122=l9_73;
float l9_123=l9_74;
if ((l9_121==0)||(l9_121==3))
{
float l9_124=l9_120;
float l9_125=0.0;
float l9_126=1.0;
bool l9_127=l9_122;
float l9_128=l9_123;
float l9_129=fast::clamp(l9_124,l9_125,l9_126);
float l9_130=step(abs(l9_124-l9_129),9.9999997e-06);
l9_128*=(l9_130+((1.0-float(l9_127))*(1.0-l9_130)));
l9_124=l9_129;
l9_120=l9_124;
l9_123=l9_128;
}
l9_64.y=l9_120;
l9_74=l9_123;
float2 l9_131=l9_64;
int l9_132=l9_62;
int l9_133=l9_63;
float l9_134=l9_72;
float2 l9_135=l9_131;
int l9_136=l9_132;
int l9_137=l9_133;
float3 l9_138=float3(0.0);
if (l9_136==0)
{
l9_138=float3(l9_135,0.0);
}
else
{
if (l9_136==1)
{
l9_138=float3(l9_135.x,(l9_135.y*0.5)+(0.5-(float(l9_137)*0.5)),0.0);
}
else
{
l9_138=float3(l9_135,float(l9_137));
}
}
float3 l9_139=l9_138;
float3 l9_140=l9_139;
float2 l9_141=l9_140.xy;
float l9_142=l9_134;
float4 l9_143=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_141,bias(l9_142));
float4 l9_144=l9_143;
float4 l9_145=l9_144;
if (l9_70)
{
l9_145=mix(l9_71,l9_145,float4(l9_74));
}
float4 l9_146=l9_145;
l9_55=l9_146;
float4 l9_147=l9_55;
N7_Albedo*=l9_147;
}
if (N7_EnableRecolor)
{
float3 l9_148=((N7_RecolorR*N7_Albedo.x)+(N7_RecolorG*N7_Albedo.y))+(N7_RecolorB*N7_Albedo.z);
N7_Albedo=float4(l9_148.x,l9_148.y,l9_148.z,N7_Albedo.w);
}
if (N7_EnableOpacityTexture)
{
int l9_149=N7_OpacityUVSwitch;
float2 l9_150=tempGlobals.Surface_UVCoord0;
float2 l9_151=l9_150;
if (l9_149==0)
{
float2 l9_152=tempGlobals.Surface_UVCoord0;
l9_151=l9_152;
}
if (l9_149==1)
{
float2 l9_153=tempGlobals.Surface_UVCoord1;
l9_151=l9_153;
}
if (l9_149==2)
{
l9_151=tempGlobals.N7_TransformedUV2;
}
if (l9_149==3)
{
l9_151=tempGlobals.N7_TransformedUV3;
}
float2 l9_154=l9_151;
l9_47=l9_154;
float2 l9_155=l9_47;
float4 l9_156=float4(0.0);
int l9_157=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=in.varStereoViewID;
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
l9_160=in.varStereoViewID;
}
int l9_161=l9_160;
l9_157=l9_161;
}
int l9_162=l9_157;
int l9_163=opacityTexLayout_tmp;
int l9_164=l9_162;
float2 l9_165=l9_155;
bool l9_166=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_167=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_168=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_169=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_170=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_171=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_172=(*sc_set0.UserUniforms).opacityTexBorderColor;
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
float4 l9_244=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_242,bias(l9_243));
float4 l9_245=l9_244;
float4 l9_246=l9_245;
if (l9_171)
{
l9_246=mix(l9_172,l9_246,float4(l9_175));
}
float4 l9_247=l9_246;
l9_156=l9_247;
float4 l9_248=l9_156;
N7_Opacity=l9_248.x;
}
N7_Opacity*=N7_Albedo.w;
if (N7_VertexColorSwitch==1)
{
float4 l9_249=tempGlobals.VertexColor;
N7_Albedo*=l9_249;
float4 l9_250=tempGlobals.VertexColor;
N7_Opacity*=l9_250.w;
}
if (N7_EnableNormalTexture)
{
float3 l9_251=float3(0.0,0.0,1.0);
int l9_252=N7_NormalUVSwitch;
float2 l9_253=tempGlobals.Surface_UVCoord0;
float2 l9_254=l9_253;
if (l9_252==0)
{
float2 l9_255=tempGlobals.Surface_UVCoord0;
l9_254=l9_255;
}
if (l9_252==1)
{
float2 l9_256=tempGlobals.Surface_UVCoord1;
l9_254=l9_256;
}
if (l9_252==2)
{
l9_254=tempGlobals.N7_TransformedUV2;
}
if (l9_252==3)
{
l9_254=tempGlobals.N7_TransformedUV3;
}
float2 l9_257=l9_254;
float2 l9_258=l9_257;
float2 l9_259=l9_258;
float4 l9_260=float4(0.0);
int l9_261=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_262=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_262=0;
}
else
{
l9_262=in.varStereoViewID;
}
int l9_263=l9_262;
l9_261=1-l9_263;
}
else
{
int l9_264=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_264=0;
}
else
{
l9_264=in.varStereoViewID;
}
int l9_265=l9_264;
l9_261=l9_265;
}
int l9_266=l9_261;
int l9_267=normalTexLayout_tmp;
int l9_268=l9_266;
float2 l9_269=l9_259;
bool l9_270=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_271=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_272=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_273=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_274=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_275=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_276=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_277=0.0;
bool l9_278=l9_275&&(!l9_273);
float l9_279=1.0;
float l9_280=l9_269.x;
int l9_281=l9_272.x;
if (l9_281==1)
{
l9_280=fract(l9_280);
}
else
{
if (l9_281==2)
{
float l9_282=fract(l9_280);
float l9_283=l9_280-l9_282;
float l9_284=step(0.25,fract(l9_283*0.5));
l9_280=mix(l9_282,1.0-l9_282,fast::clamp(l9_284,0.0,1.0));
}
}
l9_269.x=l9_280;
float l9_285=l9_269.y;
int l9_286=l9_272.y;
if (l9_286==1)
{
l9_285=fract(l9_285);
}
else
{
if (l9_286==2)
{
float l9_287=fract(l9_285);
float l9_288=l9_285-l9_287;
float l9_289=step(0.25,fract(l9_288*0.5));
l9_285=mix(l9_287,1.0-l9_287,fast::clamp(l9_289,0.0,1.0));
}
}
l9_269.y=l9_285;
if (l9_273)
{
bool l9_290=l9_275;
bool l9_291;
if (l9_290)
{
l9_291=l9_272.x==3;
}
else
{
l9_291=l9_290;
}
float l9_292=l9_269.x;
float l9_293=l9_274.x;
float l9_294=l9_274.z;
bool l9_295=l9_291;
float l9_296=l9_279;
float l9_297=fast::clamp(l9_292,l9_293,l9_294);
float l9_298=step(abs(l9_292-l9_297),9.9999997e-06);
l9_296*=(l9_298+((1.0-float(l9_295))*(1.0-l9_298)));
l9_292=l9_297;
l9_269.x=l9_292;
l9_279=l9_296;
bool l9_299=l9_275;
bool l9_300;
if (l9_299)
{
l9_300=l9_272.y==3;
}
else
{
l9_300=l9_299;
}
float l9_301=l9_269.y;
float l9_302=l9_274.y;
float l9_303=l9_274.w;
bool l9_304=l9_300;
float l9_305=l9_279;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_269.y=l9_301;
l9_279=l9_305;
}
float2 l9_308=l9_269;
bool l9_309=l9_270;
float3x3 l9_310=l9_271;
if (l9_309)
{
l9_308=float2((l9_310*float3(l9_308,1.0)).xy);
}
float2 l9_311=l9_308;
float2 l9_312=l9_311;
float2 l9_313=l9_312;
l9_269=l9_313;
float l9_314=l9_269.x;
int l9_315=l9_272.x;
bool l9_316=l9_278;
float l9_317=l9_279;
if ((l9_315==0)||(l9_315==3))
{
float l9_318=l9_314;
float l9_319=0.0;
float l9_320=1.0;
bool l9_321=l9_316;
float l9_322=l9_317;
float l9_323=fast::clamp(l9_318,l9_319,l9_320);
float l9_324=step(abs(l9_318-l9_323),9.9999997e-06);
l9_322*=(l9_324+((1.0-float(l9_321))*(1.0-l9_324)));
l9_318=l9_323;
l9_314=l9_318;
l9_317=l9_322;
}
l9_269.x=l9_314;
l9_279=l9_317;
float l9_325=l9_269.y;
int l9_326=l9_272.y;
bool l9_327=l9_278;
float l9_328=l9_279;
if ((l9_326==0)||(l9_326==3))
{
float l9_329=l9_325;
float l9_330=0.0;
float l9_331=1.0;
bool l9_332=l9_327;
float l9_333=l9_328;
float l9_334=fast::clamp(l9_329,l9_330,l9_331);
float l9_335=step(abs(l9_329-l9_334),9.9999997e-06);
l9_333*=(l9_335+((1.0-float(l9_332))*(1.0-l9_335)));
l9_329=l9_334;
l9_325=l9_329;
l9_328=l9_333;
}
l9_269.y=l9_325;
l9_279=l9_328;
float2 l9_336=l9_269;
int l9_337=l9_267;
int l9_338=l9_268;
float l9_339=l9_277;
float2 l9_340=l9_336;
int l9_341=l9_337;
int l9_342=l9_338;
float3 l9_343=float3(0.0);
if (l9_341==0)
{
l9_343=float3(l9_340,0.0);
}
else
{
if (l9_341==1)
{
l9_343=float3(l9_340.x,(l9_340.y*0.5)+(0.5-(float(l9_342)*0.5)),0.0);
}
else
{
l9_343=float3(l9_340,float(l9_342));
}
}
float3 l9_344=l9_343;
float3 l9_345=l9_344;
float2 l9_346=l9_345.xy;
float l9_347=l9_339;
float4 l9_348=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_346,bias(l9_347));
float4 l9_349=l9_348;
float4 l9_350=l9_349;
if (l9_275)
{
l9_350=mix(l9_276,l9_350,float4(l9_279));
}
float4 l9_351=l9_350;
l9_260=l9_351;
float4 l9_352=l9_260;
N7_Normal=(l9_352.xyz*1.9921875)-float3(1.0);
if (N7_EnableDetailNormal)
{
int l9_353=N7_Detail_NormalUVSwitch;
float2 l9_354=tempGlobals.Surface_UVCoord0;
float2 l9_355=l9_354;
if (l9_353==0)
{
float2 l9_356=tempGlobals.Surface_UVCoord0;
l9_355=l9_356;
}
if (l9_353==1)
{
float2 l9_357=tempGlobals.Surface_UVCoord1;
l9_355=l9_357;
}
if (l9_353==2)
{
l9_355=tempGlobals.N7_TransformedUV2;
}
if (l9_353==3)
{
l9_355=tempGlobals.N7_TransformedUV3;
}
float2 l9_358=l9_355;
float2 l9_359=l9_358;
float2 l9_360=l9_359;
float4 l9_361=float4(0.0);
int l9_362=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_363=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_363=0;
}
else
{
l9_363=in.varStereoViewID;
}
int l9_364=l9_363;
l9_362=1-l9_364;
}
else
{
int l9_365=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_365=0;
}
else
{
l9_365=in.varStereoViewID;
}
int l9_366=l9_365;
l9_362=l9_366;
}
int l9_367=l9_362;
int l9_368=detailNormalTexLayout_tmp;
int l9_369=l9_367;
float2 l9_370=l9_360;
bool l9_371=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_372=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_373=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_374=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_375=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_376=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_377=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_378=0.0;
bool l9_379=l9_376&&(!l9_374);
float l9_380=1.0;
float l9_381=l9_370.x;
int l9_382=l9_373.x;
if (l9_382==1)
{
l9_381=fract(l9_381);
}
else
{
if (l9_382==2)
{
float l9_383=fract(l9_381);
float l9_384=l9_381-l9_383;
float l9_385=step(0.25,fract(l9_384*0.5));
l9_381=mix(l9_383,1.0-l9_383,fast::clamp(l9_385,0.0,1.0));
}
}
l9_370.x=l9_381;
float l9_386=l9_370.y;
int l9_387=l9_373.y;
if (l9_387==1)
{
l9_386=fract(l9_386);
}
else
{
if (l9_387==2)
{
float l9_388=fract(l9_386);
float l9_389=l9_386-l9_388;
float l9_390=step(0.25,fract(l9_389*0.5));
l9_386=mix(l9_388,1.0-l9_388,fast::clamp(l9_390,0.0,1.0));
}
}
l9_370.y=l9_386;
if (l9_374)
{
bool l9_391=l9_376;
bool l9_392;
if (l9_391)
{
l9_392=l9_373.x==3;
}
else
{
l9_392=l9_391;
}
float l9_393=l9_370.x;
float l9_394=l9_375.x;
float l9_395=l9_375.z;
bool l9_396=l9_392;
float l9_397=l9_380;
float l9_398=fast::clamp(l9_393,l9_394,l9_395);
float l9_399=step(abs(l9_393-l9_398),9.9999997e-06);
l9_397*=(l9_399+((1.0-float(l9_396))*(1.0-l9_399)));
l9_393=l9_398;
l9_370.x=l9_393;
l9_380=l9_397;
bool l9_400=l9_376;
bool l9_401;
if (l9_400)
{
l9_401=l9_373.y==3;
}
else
{
l9_401=l9_400;
}
float l9_402=l9_370.y;
float l9_403=l9_375.y;
float l9_404=l9_375.w;
bool l9_405=l9_401;
float l9_406=l9_380;
float l9_407=fast::clamp(l9_402,l9_403,l9_404);
float l9_408=step(abs(l9_402-l9_407),9.9999997e-06);
l9_406*=(l9_408+((1.0-float(l9_405))*(1.0-l9_408)));
l9_402=l9_407;
l9_370.y=l9_402;
l9_380=l9_406;
}
float2 l9_409=l9_370;
bool l9_410=l9_371;
float3x3 l9_411=l9_372;
if (l9_410)
{
l9_409=float2((l9_411*float3(l9_409,1.0)).xy);
}
float2 l9_412=l9_409;
float2 l9_413=l9_412;
float2 l9_414=l9_413;
l9_370=l9_414;
float l9_415=l9_370.x;
int l9_416=l9_373.x;
bool l9_417=l9_379;
float l9_418=l9_380;
if ((l9_416==0)||(l9_416==3))
{
float l9_419=l9_415;
float l9_420=0.0;
float l9_421=1.0;
bool l9_422=l9_417;
float l9_423=l9_418;
float l9_424=fast::clamp(l9_419,l9_420,l9_421);
float l9_425=step(abs(l9_419-l9_424),9.9999997e-06);
l9_423*=(l9_425+((1.0-float(l9_422))*(1.0-l9_425)));
l9_419=l9_424;
l9_415=l9_419;
l9_418=l9_423;
}
l9_370.x=l9_415;
l9_380=l9_418;
float l9_426=l9_370.y;
int l9_427=l9_373.y;
bool l9_428=l9_379;
float l9_429=l9_380;
if ((l9_427==0)||(l9_427==3))
{
float l9_430=l9_426;
float l9_431=0.0;
float l9_432=1.0;
bool l9_433=l9_428;
float l9_434=l9_429;
float l9_435=fast::clamp(l9_430,l9_431,l9_432);
float l9_436=step(abs(l9_430-l9_435),9.9999997e-06);
l9_434*=(l9_436+((1.0-float(l9_433))*(1.0-l9_436)));
l9_430=l9_435;
l9_426=l9_430;
l9_429=l9_434;
}
l9_370.y=l9_426;
l9_380=l9_429;
float2 l9_437=l9_370;
int l9_438=l9_368;
int l9_439=l9_369;
float l9_440=l9_378;
float2 l9_441=l9_437;
int l9_442=l9_438;
int l9_443=l9_439;
float3 l9_444=float3(0.0);
if (l9_442==0)
{
l9_444=float3(l9_441,0.0);
}
else
{
if (l9_442==1)
{
l9_444=float3(l9_441.x,(l9_441.y*0.5)+(0.5-(float(l9_443)*0.5)),0.0);
}
else
{
l9_444=float3(l9_441,float(l9_443));
}
}
float3 l9_445=l9_444;
float3 l9_446=l9_445;
float2 l9_447=l9_446.xy;
float l9_448=l9_440;
float4 l9_449=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_447,bias(l9_448));
float4 l9_450=l9_449;
float4 l9_451=l9_450;
if (l9_376)
{
l9_451=mix(l9_377,l9_451,float4(l9_380));
}
float4 l9_452=l9_451;
l9_361=l9_452;
float4 l9_453=l9_361;
l9_251=(l9_453.xyz*1.9921875)-float3(1.0);
}
float3 l9_454=N7_Normal;
float3 l9_455=l9_251;
float3 l9_456=l9_454+float3(0.0,0.0,1.0);
float3 l9_457=l9_455*float3(-1.0,-1.0,1.0);
float3 l9_458=normalize((l9_456*dot(l9_456,l9_457))-(l9_457*l9_456.z));
N7_Normal=l9_458;
float3 l9_459=tempGlobals.VertexNormal_WorldSpace;
float3 l9_460=l9_459;
float3 l9_461=tempGlobals.VertexTangent_WorldSpace;
float3 l9_462=l9_461;
float3 l9_463=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_464=l9_463;
float3x3 l9_465=float3x3(float3(l9_462),float3(l9_464),float3(l9_460));
N7_Normal=normalize(l9_465*N7_Normal);
}
else
{
float3 l9_466=tempGlobals.VertexNormal_WorldSpace;
N7_Normal=normalize(l9_466);
}
N7_Roughness=N7_RoughnessValue;
if (N7_EnableMaterialParamsTexture)
{
int l9_467=N7_MaterialParamsUVSwitch;
float2 l9_468=tempGlobals.Surface_UVCoord0;
float2 l9_469=l9_468;
if (l9_467==0)
{
float2 l9_470=tempGlobals.Surface_UVCoord0;
l9_469=l9_470;
}
if (l9_467==1)
{
float2 l9_471=tempGlobals.Surface_UVCoord1;
l9_469=l9_471;
}
if (l9_467==2)
{
l9_469=tempGlobals.N7_TransformedUV2;
}
if (l9_467==3)
{
l9_469=tempGlobals.N7_TransformedUV3;
}
float2 l9_472=l9_469;
float2 l9_473=l9_472;
float2 l9_474=l9_473;
float4 l9_475=float4(0.0);
int l9_476=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_477=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_477=0;
}
else
{
l9_477=in.varStereoViewID;
}
int l9_478=l9_477;
l9_476=1-l9_478;
}
else
{
int l9_479=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_479=0;
}
else
{
l9_479=in.varStereoViewID;
}
int l9_480=l9_479;
l9_476=l9_480;
}
int l9_481=l9_476;
int l9_482=materialParamsTexLayout_tmp;
int l9_483=l9_481;
float2 l9_484=l9_474;
bool l9_485=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_486=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_487=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_488=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_489=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_490=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_491=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_492=0.0;
bool l9_493=l9_490&&(!l9_488);
float l9_494=1.0;
float l9_495=l9_484.x;
int l9_496=l9_487.x;
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
l9_484.x=l9_495;
float l9_500=l9_484.y;
int l9_501=l9_487.y;
if (l9_501==1)
{
l9_500=fract(l9_500);
}
else
{
if (l9_501==2)
{
float l9_502=fract(l9_500);
float l9_503=l9_500-l9_502;
float l9_504=step(0.25,fract(l9_503*0.5));
l9_500=mix(l9_502,1.0-l9_502,fast::clamp(l9_504,0.0,1.0));
}
}
l9_484.y=l9_500;
if (l9_488)
{
bool l9_505=l9_490;
bool l9_506;
if (l9_505)
{
l9_506=l9_487.x==3;
}
else
{
l9_506=l9_505;
}
float l9_507=l9_484.x;
float l9_508=l9_489.x;
float l9_509=l9_489.z;
bool l9_510=l9_506;
float l9_511=l9_494;
float l9_512=fast::clamp(l9_507,l9_508,l9_509);
float l9_513=step(abs(l9_507-l9_512),9.9999997e-06);
l9_511*=(l9_513+((1.0-float(l9_510))*(1.0-l9_513)));
l9_507=l9_512;
l9_484.x=l9_507;
l9_494=l9_511;
bool l9_514=l9_490;
bool l9_515;
if (l9_514)
{
l9_515=l9_487.y==3;
}
else
{
l9_515=l9_514;
}
float l9_516=l9_484.y;
float l9_517=l9_489.y;
float l9_518=l9_489.w;
bool l9_519=l9_515;
float l9_520=l9_494;
float l9_521=fast::clamp(l9_516,l9_517,l9_518);
float l9_522=step(abs(l9_516-l9_521),9.9999997e-06);
l9_520*=(l9_522+((1.0-float(l9_519))*(1.0-l9_522)));
l9_516=l9_521;
l9_484.y=l9_516;
l9_494=l9_520;
}
float2 l9_523=l9_484;
bool l9_524=l9_485;
float3x3 l9_525=l9_486;
if (l9_524)
{
l9_523=float2((l9_525*float3(l9_523,1.0)).xy);
}
float2 l9_526=l9_523;
float2 l9_527=l9_526;
float2 l9_528=l9_527;
l9_484=l9_528;
float l9_529=l9_484.x;
int l9_530=l9_487.x;
bool l9_531=l9_493;
float l9_532=l9_494;
if ((l9_530==0)||(l9_530==3))
{
float l9_533=l9_529;
float l9_534=0.0;
float l9_535=1.0;
bool l9_536=l9_531;
float l9_537=l9_532;
float l9_538=fast::clamp(l9_533,l9_534,l9_535);
float l9_539=step(abs(l9_533-l9_538),9.9999997e-06);
l9_537*=(l9_539+((1.0-float(l9_536))*(1.0-l9_539)));
l9_533=l9_538;
l9_529=l9_533;
l9_532=l9_537;
}
l9_484.x=l9_529;
l9_494=l9_532;
float l9_540=l9_484.y;
int l9_541=l9_487.y;
bool l9_542=l9_493;
float l9_543=l9_494;
if ((l9_541==0)||(l9_541==3))
{
float l9_544=l9_540;
float l9_545=0.0;
float l9_546=1.0;
bool l9_547=l9_542;
float l9_548=l9_543;
float l9_549=fast::clamp(l9_544,l9_545,l9_546);
float l9_550=step(abs(l9_544-l9_549),9.9999997e-06);
l9_548*=(l9_550+((1.0-float(l9_547))*(1.0-l9_550)));
l9_544=l9_549;
l9_540=l9_544;
l9_543=l9_548;
}
l9_484.y=l9_540;
l9_494=l9_543;
float2 l9_551=l9_484;
int l9_552=l9_482;
int l9_553=l9_483;
float l9_554=l9_492;
float2 l9_555=l9_551;
int l9_556=l9_552;
int l9_557=l9_553;
float3 l9_558=float3(0.0);
if (l9_556==0)
{
l9_558=float3(l9_555,0.0);
}
else
{
if (l9_556==1)
{
l9_558=float3(l9_555.x,(l9_555.y*0.5)+(0.5-(float(l9_557)*0.5)),0.0);
}
else
{
l9_558=float3(l9_555,float(l9_557));
}
}
float3 l9_559=l9_558;
float3 l9_560=l9_559;
float2 l9_561=l9_560.xy;
float l9_562=l9_554;
float4 l9_563=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_561,bias(l9_562));
float4 l9_564=l9_563;
float4 l9_565=l9_564;
if (l9_490)
{
l9_565=mix(l9_491,l9_565,float4(l9_494));
}
float4 l9_566=l9_565;
l9_475=l9_566;
float4 l9_567=l9_475;
float3 l9_568=l9_567.xyz;
N7_Roughness*=l9_568.y;
}
param_19=N7_Opacity;
param_20=N7_Normal;
param_21=N7_Roughness;
Opacity_N7=param_19;
Normal_N7=param_20;
Roughness_N7=param_21;
float param_23=Opacity_N7;
float3 param_24=Normal_N7;
float param_25=Roughness_N7;
ssGlobals param_26=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_26.BumpedNormal=param_24;
}
param_23=fast::clamp(param_23,0.0,1.0);
float l9_569=param_23;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_569<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_570=gl_FragCoord;
float2 l9_571=floor(mod(l9_570.xy,float2(4.0)));
float l9_572=(mod(dot(l9_571,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_569<l9_572)
{
discard_fragment();
}
}
float3 l9_573=param_26.PositionWS;
float3 l9_574=param_26.BumpedNormal;
float l9_575=param_25;
float3 l9_576=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_573);
if (dot(l9_576,l9_574)>=(-0.050000001))
{
uint3 l9_577=uint3(round((l9_573-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_577.x,l9_577.y,l9_577.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_578=l9_574;
float l9_579=dot(abs(l9_578),float3(1.0));
l9_578/=float3(l9_579);
float l9_580=fast::clamp(-l9_578.z,0.0,1.0);
float2 l9_581=l9_578.xy;
float l9_582;
if (l9_578.x>=0.0)
{
l9_582=l9_580;
}
else
{
l9_582=-l9_580;
}
l9_581.x+=l9_582;
float l9_583;
if (l9_578.y>=0.0)
{
l9_583=l9_580;
}
else
{
l9_583=-l9_580;
}
l9_581.y+=l9_583;
float2 l9_584=l9_581;
float2 l9_585=l9_584;
uint2 l9_586=uint2(as_type<uint>(half2(float2(l9_585.x,0.0))),as_type<uint>(half2(float2(l9_585.y,0.0))));
out.normal_and_more=uint4(l9_586.x,l9_586.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_587;
if (l9_575<0.0)
{
l9_587=1023u;
}
else
{
l9_587=uint(fast::clamp(l9_575,0.0,1.0)*1000.0);
}
uint l9_588=l9_587;
l9_588 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_588;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
float2 ScreenCoord_N26=float2(0.0);
ScreenCoord_N26=Globals.gScreenCoord;
float Depth_N25=0.0;
int l9_589=0;
if ((int(bodyDepthTexHasSwappedViews_tmp)!=0))
{
int l9_590=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_590=0;
}
else
{
l9_590=in.varStereoViewID;
}
int l9_591=l9_590;
l9_589=1-l9_591;
}
else
{
int l9_592=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_592=0;
}
else
{
l9_592=in.varStereoViewID;
}
int l9_593=l9_592;
l9_589=l9_593;
}
int l9_594=l9_589;
int param_27=bodyDepthTexLayout_tmp;
int param_28=l9_594;
float2 param_29=ScreenCoord_N26;
bool param_30=(int(SC_USE_UV_TRANSFORM_bodyDepthTex_tmp)!=0);
float3x3 param_31=(*sc_set0.UserUniforms).bodyDepthTexTransform;
int2 param_32=int2(SC_SOFTWARE_WRAP_MODE_U_bodyDepthTex_tmp,SC_SOFTWARE_WRAP_MODE_V_bodyDepthTex_tmp);
bool param_33=(int(SC_USE_UV_MIN_MAX_bodyDepthTex_tmp)!=0);
float4 param_34=(*sc_set0.UserUniforms).bodyDepthTexUvMinMax;
bool param_35=(int(SC_USE_CLAMP_TO_BORDER_bodyDepthTex_tmp)!=0);
float4 param_36=(*sc_set0.UserUniforms).bodyDepthTexBorderColor;
float param_37=0.0;
bool l9_595=param_35&&(!param_33);
float l9_596=1.0;
float l9_597=param_29.x;
int l9_598=param_32.x;
if (l9_598==1)
{
l9_597=fract(l9_597);
}
else
{
if (l9_598==2)
{
float l9_599=fract(l9_597);
float l9_600=l9_597-l9_599;
float l9_601=step(0.25,fract(l9_600*0.5));
l9_597=mix(l9_599,1.0-l9_599,fast::clamp(l9_601,0.0,1.0));
}
}
param_29.x=l9_597;
float l9_602=param_29.y;
int l9_603=param_32.y;
if (l9_603==1)
{
l9_602=fract(l9_602);
}
else
{
if (l9_603==2)
{
float l9_604=fract(l9_602);
float l9_605=l9_602-l9_604;
float l9_606=step(0.25,fract(l9_605*0.5));
l9_602=mix(l9_604,1.0-l9_604,fast::clamp(l9_606,0.0,1.0));
}
}
param_29.y=l9_602;
if (param_33)
{
bool l9_607=param_35;
bool l9_608;
if (l9_607)
{
l9_608=param_32.x==3;
}
else
{
l9_608=l9_607;
}
float l9_609=param_29.x;
float l9_610=param_34.x;
float l9_611=param_34.z;
bool l9_612=l9_608;
float l9_613=l9_596;
float l9_614=fast::clamp(l9_609,l9_610,l9_611);
float l9_615=step(abs(l9_609-l9_614),9.9999997e-06);
l9_613*=(l9_615+((1.0-float(l9_612))*(1.0-l9_615)));
l9_609=l9_614;
param_29.x=l9_609;
l9_596=l9_613;
bool l9_616=param_35;
bool l9_617;
if (l9_616)
{
l9_617=param_32.y==3;
}
else
{
l9_617=l9_616;
}
float l9_618=param_29.y;
float l9_619=param_34.y;
float l9_620=param_34.w;
bool l9_621=l9_617;
float l9_622=l9_596;
float l9_623=fast::clamp(l9_618,l9_619,l9_620);
float l9_624=step(abs(l9_618-l9_623),9.9999997e-06);
l9_622*=(l9_624+((1.0-float(l9_621))*(1.0-l9_624)));
l9_618=l9_623;
param_29.y=l9_618;
l9_596=l9_622;
}
float2 l9_625=param_29;
bool l9_626=param_30;
float3x3 l9_627=param_31;
if (l9_626)
{
l9_625=float2((l9_627*float3(l9_625,1.0)).xy);
}
float2 l9_628=l9_625;
float2 l9_629=l9_628;
float2 l9_630=l9_629;
param_29=l9_630;
float l9_631=param_29.x;
int l9_632=param_32.x;
bool l9_633=l9_595;
float l9_634=l9_596;
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
param_29.x=l9_631;
l9_596=l9_634;
float l9_642=param_29.y;
int l9_643=param_32.y;
bool l9_644=l9_595;
float l9_645=l9_596;
if ((l9_643==0)||(l9_643==3))
{
float l9_646=l9_642;
float l9_647=0.0;
float l9_648=1.0;
bool l9_649=l9_644;
float l9_650=l9_645;
float l9_651=fast::clamp(l9_646,l9_647,l9_648);
float l9_652=step(abs(l9_646-l9_651),9.9999997e-06);
l9_650*=(l9_652+((1.0-float(l9_649))*(1.0-l9_652)));
l9_646=l9_651;
l9_642=l9_646;
l9_645=l9_650;
}
param_29.y=l9_642;
l9_596=l9_645;
float2 l9_653=param_29;
int l9_654=param_27;
int l9_655=param_28;
float l9_656=param_37;
float2 l9_657=l9_653;
int l9_658=l9_654;
int l9_659=l9_655;
float3 l9_660=float3(0.0);
if (l9_658==0)
{
l9_660=float3(l9_657,0.0);
}
else
{
if (l9_658==1)
{
l9_660=float3(l9_657.x,(l9_657.y*0.5)+(0.5-(float(l9_659)*0.5)),0.0);
}
else
{
l9_660=float3(l9_657,float(l9_659));
}
}
float3 l9_661=l9_660;
float3 l9_662=l9_661;
float2 l9_663=l9_662.xy;
float l9_664=l9_656;
float4 l9_665=sc_set0.bodyDepthTex.sample(sc_set0.bodyDepthTexSmpSC,l9_663,bias(l9_664));
float4 l9_666=l9_665;
float4 l9_667=l9_666;
if (param_35)
{
l9_667=mix(param_36,l9_667,float4(l9_596));
}
float4 l9_668=l9_667;
float param_38=l9_668.x;
float4 param_39=(*sc_set0.UserUniforms).bodyDepthTexProjectionMatrixTerms;
float l9_669=param_39.x;
float l9_670=param_39.y;
bool l9_671=param_39.z==0.0;
param_38=(param_38*2.0)-1.0;
float l9_672;
if (l9_671)
{
l9_672=(param_38-l9_670)/l9_669;
}
else
{
l9_672=l9_670/((-param_38)-l9_669);
}
float l9_673=l9_672;
Depth_N25=l9_673;
float Depth_N29=0.0;
float l9_674=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.x;
float l9_675=(*sc_set0.UserUniforms).sc_Camera.clipPlanes.y;
float4 l9_676=gl_FragCoord;
float param_40=(l9_675*l9_674)/(l9_675+(l9_676.z*(l9_674-l9_675)));
Depth_N29=param_40;
float param_41=Output_N24;
float param_42=Depth_N25;
float param_43=Depth_N29;
ssGlobals param_44=Globals;
tempGlobals=param_44;
N22_EnableBodyDepth=param_41;
N22_BodyDepth=param_42;
N22_cameraDepth=param_43;
float l9_677=N22_BodyDepth-(1.0-N22_cameraDepth);
float l9_678=l9_677*0.035;
float l9_679=100.0;
float l9_680;
if (l9_678<=0.0)
{
l9_680=0.0;
}
else
{
l9_680=pow(l9_678,l9_679);
}
float l9_681=l9_680;
l9_677=1.0-fast::clamp(l9_681,0.0,1.0);
if ((N22_EnableBodyDepth==1.0)&&(l9_677<1.0))
{
discard_fragment();
}
return out;
}
} // RECEIVER MODE SHADER
