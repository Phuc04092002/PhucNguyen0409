// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Universal Render Pipeline/Lit"
{
  Properties
  {
    _WorkflowMode ("WorkflowMode", float) = 1
    _BaseMap ("Albedo", 2D) = "white" {}
    _BaseColor ("Color", Color) = (1,1,1,1)
    _Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
    _Smoothness ("Smoothness", Range(0, 1)) = 0.5
    _SmoothnessTextureChannel ("Smoothness texture channel", float) = 0
    _Metallic ("Metallic", Range(0, 1)) = 0
    _MetallicGlossMap ("Metallic", 2D) = "white" {}
    _SpecColor ("Specular", Color) = (0.2,0.2,0.2,1)
    _SpecGlossMap ("Specular", 2D) = "white" {}
    [ToggleOff] _SpecularHighlights ("Specular Highlights", float) = 1
    [ToggleOff] _EnvironmentReflections ("Environment Reflections", float) = 1
    _BumpScale ("Scale", float) = 1
    _BumpMap ("Normal Map", 2D) = "bump" {}
    _Parallax ("Scale", Range(0.005, 0.08)) = 0.005
    _ParallaxMap ("Height Map", 2D) = "black" {}
    _OcclusionStrength ("Strength", Range(0, 1)) = 1
    _OcclusionMap ("Occlusion", 2D) = "white" {}
    [HDR] _EmissionColor ("Color", Color) = (0,0,0,1)
    _EmissionMap ("Emission", 2D) = "white" {}
    _DetailMask ("Detail Mask", 2D) = "white" {}
    _DetailAlbedoMapScale ("Scale", Range(0, 2)) = 1
    _DetailAlbedoMap ("Detail Albedo x2", 2D) = "linearGrey" {}
    _DetailNormalMapScale ("Scale", Range(0, 2)) = 1
    [Normal] _DetailNormalMap ("Normal Map", 2D) = "bump" {}
    [HideInInspector] _ClearCoatMask ("_ClearCoatMask", float) = 0
    [HideInInspector] _ClearCoatSmoothness ("_ClearCoatSmoothness", float) = 0
    _Surface ("__surface", float) = 0
    _Blend ("__blend", float) = 0
    _Cull ("__cull", float) = 2
    [ToggleUI] _AlphaClip ("__clip", float) = 0
    [HideInInspector] _SrcBlend ("__src", float) = 1
    [HideInInspector] _DstBlend ("__dst", float) = 0
    [HideInInspector] _ZWrite ("__zw", float) = 1
    [ToggleUI] _ReceiveShadows ("Receive Shadows", float) = 1
    _QueueOffset ("Queue offset", float) = 0
    [HideInInspector] _MainTex ("BaseMap", 2D) = "white" {}
    [HideInInspector] _Color ("Base Color", Color) = (1,1,1,1)
    [HideInInspector] _GlossMapScale ("Smoothness", float) = 0
    [HideInInspector] _Glossiness ("Smoothness", float) = 0
    [HideInInspector] _GlossyReflections ("EnvironmentReflections", float) = 0
    unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
    unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
    unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderModel" = "4.5"
      "UniversalMaterialType" = "Lit"
    }
    LOD 300
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForward"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 3, name: GBuffer
    {
      Name "GBuffer"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalGBuffer"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 4, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 5, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 6, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderModel" = "2.0"
      "UniversalMaterialType" = "Lit"
    }
    LOD 300
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForward"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile UnityPerDraw _MainLightColor unity_SpecCube1_HDR unity_SpecCube0_ProbePosition unity_SHAr
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _MainLightPosition;
      
      uniform float4 _MainLightColor;
      
      uniform float4 _AdditionalLightsCount;
      
      uniform float4 _AdditionalLightsPosition[16];
      
      uniform float4 _AdditionalLightsColor[16];
      
      uniform float4 _AdditionalLightsAttenuation[16];
      
      uniform float4 _AdditionalLightsSpotDir[16];
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 _MainLightWorldToShadow[20];
      
      uniform float4 _CascadeShadowSplitSpheres0;
      
      uniform float4 _CascadeShadowSplitSpheres1;
      
      uniform float4 _CascadeShadowSplitSpheres2;
      
      uniform float4 _CascadeShadowSplitSpheres3;
      
      uniform float4 _CascadeShadowSplitSphereRadii;
      
      uniform float4 _MainLightShadowOffset0;
      
      uniform float4 _MainLightShadowOffset1;
      
      uniform float4 _MainLightShadowOffset2;
      
      uniform float4 _MainLightShadowOffset3;
      
      uniform float4 _MainLightShadowParams;
      
      uniform float4 _AdditionalShadowParams[16];
      
      uniform float4 _AdditionalLightsWorldToShadow[64];
      
      uniform float4 _AdditionalShadowOffset0;
      
      uniform float4 _AdditionalShadowOffset1;
      
      uniform float4 _AdditionalShadowOffset2;
      
      uniform float4 _AdditionalShadowOffset3;
      
      uniform float4 _AdditionalShadowFadeParams;
      
      uniform float4 _MainLightWorldToLight[4];
      
      uniform float _AdditionalLightsCookieEnableBits;
      
      uniform float _MainLightCookieTextureFormat;
      
      uniform float _AdditionalLightsCookieAtlasTextureFormat;
      
      uniform float4 _AdditionalLightsWorldToLights[64];
      
      uniform float4 _AdditionalLightsCookieAtlasUVRects[16];
      
      uniform float _AdditionalLightsLightTypes[16];
      
      uniform samplerCUBE unity_SpecCube0;
      
      uniform sampler2D _BaseMap;
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _AdditionalLightsShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_AdditionalLightsShadowmapTexture;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord5 : TEXCOORD5;
          
          float3 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord4 : TEXCOORD4;
          
          float3 texcoord8 : TEXCOORD8;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord8 : TEXCOORD8;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float3 u_xlat16_2;
      
      float4 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float u_xlat15;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          out_v.texcoord1.xyz = u_xlat0.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat15 = max(u_xlat15, 1.17549435e-38);
          
          u_xlat15 = inversesqrt(u_xlat15);
          
          u_xlat1.xyz = float3(u_xlat15) * u_xlat1.xyz;
          
          out_v.texcoord2.xyz = u_xlat1.xyz;
          
          out_v.texcoord4.xyz = float3(0.0, 0.0, 0.0);
          
          out_v.texcoord5 = 0.0;
          
          u_xlat16_2.x = u_xlat1.y * u_xlat1.y;
          
          u_xlat16_2.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_2.x);
          
          u_xlat16_3 = u_xlat1.yzzx * u_xlat1.xyzz;
          
          u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
          
          u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
          
          u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
          
          u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
          
          u_xlat1.w = 1.0;
          
          u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
          
          u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
          
          u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
          
          u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
          
          out_v.texcoord8.xyz = max(u_xlat16_2.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 ImmCB_0[4];
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      int u_xlatb0;
      
      float4 u_xlat16_1;
      
      float3 u_xlat2;
      
      float3 u_xlat16_3_d;
      
      float4 u_xlat4;
      
      float4 u_xlat16_4_d;
      
      int u_xlati4;
      
      uint u_xlatu4;
      
      bool4 u_xlatb4;
      
      float4 u_xlat5;
      
      float4 u_xlat16_5;
      
      float3 u_xlat6;
      
      float3 u_xlat7;
      
      float3 u_xlat16_8;
      
      float u_xlat16_9;
      
      float3 u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float2 u_xlat16_12;
      
      float3 u_xlat16_13;
      
      float3 u_xlat14;
      
      bool4 u_xlatb14;
      
      float3 u_xlat15_d;
      
      float3 u_xlat16;
      
      float3 u_xlat16_17;
      
      float3 u_xlat16_18;
      
      float3 u_xlat19;
      
      uint u_xlatu19;
      
      bool2 u_xlatb19;
      
      float3 u_xlat16_20;
      
      float3 u_xlat23;
      
      int u_xlati23;
      
      float u_xlat25;
      
      float3 u_xlat16_27;
      
      float u_xlat16_28;
      
      float3 u_xlat16_31;
      
      float u_xlat38;
      
      bool2 u_xlatb38;
      
      float2 u_xlat44;
      
      int u_xlati44;
      
      int u_xlatb44;
      
      float u_xlat16_47;
      
      float2 u_xlat52;
      
      bool2 u_xlatb52;
      
      float u_xlat57;
      
      int u_xlati57;
      
      uint u_xlatu57;
      
      int u_xlatb57;
      
      float u_xlat59;
      
      uint u_xlatu59;
      
      float u_xlat16_60;
      
      float u_xlat61;
      
      float u_xlat63;
      
      int u_xlati63;
      
      int u_xlatb63;
      
      float u_xlat64;
      
      int u_xlati64;
      
      float u_xlat16_66;
      
      float u_xlat16_67;
      
      float u_xlat16_68;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat16_0 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_1 = u_xlat16_0.wxyz * _BaseColor.wxyz;
          
          u_xlatb57 = unity_OrthoParams.w==0.0;
          
          u_xlat2.xyz = (-in_f.texcoord1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat59 = inversesqrt(u_xlat59);
          
          u_xlat2.xyz = float3(u_xlat59) * u_xlat2.xyz;
          
          u_xlat16_3_d.x = (u_xlatb57) ? u_xlat2.x : unity_MatrixV[0].z;
          
          u_xlat16_3_d.y = (u_xlatb57) ? u_xlat2.y : unity_MatrixV[1].z;
          
          u_xlat16_3_d.z = (u_xlatb57) ? u_xlat2.z : unity_MatrixV[2].z;
          
          u_xlat57 = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat57 = inversesqrt(u_xlat57);
          
          u_xlat2.xyz = float3(u_xlat57) * in_f.texcoord2.xyz;
          
          u_xlat4.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat5.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat6.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat7.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
          
          u_xlat4.y = dot(u_xlat5.xyz, u_xlat5.xyz);
          
          u_xlat4.z = dot(u_xlat6.xyz, u_xlat6.xyz);
          
          u_xlat4.w = dot(u_xlat7.xyz, u_xlat7.xyz);
          
          u_xlatb4 = lessThan(u_xlat4, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_5.x = (u_xlatb4.x) ? float(1.0) : float(0.0);
          
          u_xlat16_5.y = (u_xlatb4.y) ? float(1.0) : float(0.0);
          
          u_xlat16_5.z = (u_xlatb4.z) ? float(1.0) : float(0.0);
          
          u_xlat16_5.w = (u_xlatb4.w) ? float(1.0) : float(0.0);
          
          u_xlat16_8.x = (u_xlatb4.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8.y = (u_xlatb4.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8.z = (u_xlatb4.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8.xyz = u_xlat16_5.yzw + u_xlat16_8.xyz;
          
          u_xlat16_5.yzw = max(u_xlat16_8.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_60 = dot(u_xlat16_5, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_60 = (-u_xlat16_60) + 4.0;
          
          u_xlatu57 = uint(u_xlat16_60);
          
          u_xlati57 = int(int(u_xlatu57) << 2);
          
          u_xlat4.xyz = in_f.texcoord1.yyy * _MainLightWorldToShadow[(u_xlati57 + 1)].xyz;
          
          u_xlat4.xyz = _MainLightWorldToShadow[u_xlati57].xyz * in_f.texcoord1.xxx + u_xlat4.xyz;
          
          u_xlat4.xyz = _MainLightWorldToShadow[(u_xlati57 + 2)].xyz * in_f.texcoord1.zzz + u_xlat4.xyz;
          
          u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[(u_xlati57 + 3)].xyz;
          
          u_xlat16_60 = (-_Metallic) * 0.959999979 + 0.959999979;
          
          u_xlat16_8.x = (-u_xlat16_60) + _Smoothness;
          
          u_xlat16_20.xyz = u_xlat16_1.yzw * float3(u_xlat16_60);
          
          u_xlat16_27.xyz = u_xlat16_0.xyz * _BaseColor.xyz + float3(-0.0399999991, -0.0399999991, -0.0399999991);
          
          u_xlat16_27.xyz = float3(float3(_Metallic, _Metallic, _Metallic)) * u_xlat16_27.xyz + float3(0.0399999991, 0.0399999991, 0.0399999991);
          
          u_xlat16_60 = (-_Smoothness) + 1.0;
          
          u_xlat16_9 = u_xlat16_60 * u_xlat16_60;
          
          u_xlat16_9 = max(u_xlat16_9, 0.0078125);
          
          u_xlat16_28 = u_xlat16_9 * u_xlat16_9;
          
          u_xlat16_8.x = u_xlat16_8.x + 1.0;
          
          u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
          
          u_xlat16_47 = u_xlat16_9 * 4.0 + 2.0;
          
          u_xlatb0 = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0)
      {
              
              u_xlat0_d.xyz = u_xlat4.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat6.xyz = u_xlat4.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat6.xy,u_xlat6.z);
              
              u_xlat16_0.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat6.xyz = u_xlat4.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat6.xy,u_xlat6.z);
              
              u_xlat16_0.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat6.xyz = u_xlat4.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat6.xy,u_xlat6.z);
              
              u_xlat16_0.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_66 = dot(u_xlat16_0, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat4.xy,u_xlat4.z);
              
              u_xlat16_66 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_66 = u_xlat16_66;
      
      }
          
          u_xlat16_10.x = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_66 = u_xlat16_66 * _MainLightShadowParams.x + u_xlat16_10.x;
          
          u_xlatb0 = 0.0>=u_xlat4.z;
          
          u_xlatb19.x = u_xlat4.z>=1.0;
          
          u_xlatb0 = u_xlatb19.x || u_xlatb0;
          
          u_xlat16_66 = (u_xlatb0) ? 1.0 : u_xlat16_66;
          
          u_xlat0_d.xyz = in_f.texcoord1.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xyz, u_xlat0_d.xyz);
          
          u_xlat19.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
          
          u_xlat16_10.x = (-u_xlat16_66) + 1.0;
          
          u_xlat16_66 = u_xlat19.x * u_xlat16_10.x + u_xlat16_66;
          
          u_xlatb19.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb19.x)
      {
              
              u_xlat19.xy = in_f.texcoord1.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat19.xy = _MainLightWorldToLight[0].xy * in_f.texcoord1.xx + u_xlat19.xy;
              
              u_xlat19.xy = _MainLightWorldToLight[2].xy * in_f.texcoord1.zz + u_xlat19.xy;
              
              u_xlat19.xy = u_xlat19.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat19.xy = u_xlat19.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat4 = texture(_MainLightCookieTexture, u_xlat19.xy, _GlobalMipBias.x);
              
              u_xlatb19.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_10.x = (u_xlatb19.y) ? u_xlat4.w : u_xlat4.x;
              
              u_xlat16_10.xyz = (u_xlatb19.x) ? u_xlat4.xyz : u_xlat16_10.xxx;
      
      }
          else
          
              {
              
              u_xlat16_10.x = float(1.0);
              
              u_xlat16_10.y = float(1.0);
              
              u_xlat16_10.z = float(1.0);
      
      }
          
          u_xlat16_10.xyz = u_xlat16_10.xyz * _MainLightColor.xyz;
          
          u_xlat16_67 = dot((-u_xlat16_3_d.xyz), u_xlat2.xyz);
          
          u_xlat16_67 = u_xlat16_67 + u_xlat16_67;
          
          u_xlat16_11.xyz = u_xlat2.xyz * (-float3(u_xlat16_67)) + (-u_xlat16_3_d.xyz);
          
          u_xlat16_67 = dot(u_xlat2.xyz, u_xlat16_3_d.xyz);
          
          u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
          
          u_xlat16_67 = (-u_xlat16_67) + 1.0;
          
          u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
          
          u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
          
          u_xlat16_68 = (-u_xlat16_60) * 0.699999988 + 1.70000005;
          
          u_xlat16_60 = u_xlat16_60 * u_xlat16_68;
          
          u_xlat16_60 = u_xlat16_60 * 6.0;
          
          u_xlat16_4_d = textureLod(unity_SpecCube0, u_xlat16_11.xyz, u_xlat16_60);
          
          u_xlat16_60 = u_xlat16_4_d.w + -1.0;
          
          u_xlat16_60 = unity_SpecCube0_HDR.w * u_xlat16_60 + 1.0;
          
          u_xlat16_60 = max(u_xlat16_60, 0.0);
          
          u_xlat16_60 = log2(u_xlat16_60);
          
          u_xlat16_60 = u_xlat16_60 * unity_SpecCube0_HDR.y;
          
          u_xlat16_60 = exp2(u_xlat16_60);
          
          u_xlat16_60 = u_xlat16_60 * unity_SpecCube0_HDR.x;
          
          u_xlat16_11.xyz = u_xlat16_4_d.xyz * float3(u_xlat16_60);
          
          u_xlat16_12.xy = float2(u_xlat16_9) * float2(u_xlat16_9) + float2(-1.0, 1.0);
          
          u_xlat16_60 = float(1.0) / u_xlat16_12.y;
          
          u_xlat16_31.xyz = (-u_xlat16_27.xyz) + u_xlat16_8.xxx;
          
          u_xlat16_31.xyz = float3(u_xlat16_67) * u_xlat16_31.xyz + u_xlat16_27.xyz;
          
          u_xlat19.xyz = float3(u_xlat16_60) * u_xlat16_31.xyz;
          
          u_xlat16_11.xyz = u_xlat19.xyz * u_xlat16_11.xyz;
          
          u_xlat16_11.xyz = in_f.texcoord8.xyz * u_xlat16_20.xyz + u_xlat16_11.xyz;
          
          u_xlat19.x = u_xlat16_66 * unity_LightData.z;
          
          u_xlat16_60 = dot(u_xlat2.xyz, _MainLightPosition.xyz);
          
          u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
          
          u_xlat16_60 = u_xlat19.x * u_xlat16_60;
          
          u_xlat16_10.xyz = float3(u_xlat16_60) * u_xlat16_10.xyz;
          
          u_xlat19.xyz = u_xlat16_3_d.xyz + _MainLightPosition.xyz;
          
          u_xlat59 = dot(u_xlat19.xyz, u_xlat19.xyz);
          
          u_xlat59 = max(u_xlat59, 1.17549435e-38);
          
          u_xlat59 = inversesqrt(u_xlat59);
          
          u_xlat19.xyz = u_xlat19.xyz * float3(u_xlat59);
          
          u_xlat59 = dot(u_xlat2.xyz, u_xlat19.xyz);
          
          u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
          
          u_xlat19.x = dot(_MainLightPosition.xyz, u_xlat19.xyz);
          
          u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
          
          u_xlat38 = u_xlat59 * u_xlat59;
          
          u_xlat38 = u_xlat38 * u_xlat16_12.x + 1.00001001;
          
          u_xlat16_60 = u_xlat19.x * u_xlat19.x;
          
          u_xlat19.x = u_xlat38 * u_xlat38;
          
          u_xlat38 = max(u_xlat16_60, 0.100000001);
          
          u_xlat19.x = u_xlat38 * u_xlat19.x;
          
          u_xlat19.x = u_xlat16_47 * u_xlat19.x;
          
          u_xlat19.x = u_xlat16_28 / u_xlat19.x;
          
          u_xlat16_60 = u_xlat19.x + -6.10351563e-05;
          
          u_xlat16_60 = max(u_xlat16_60, 0.0);
          
          u_xlat16_60 = min(u_xlat16_60, 100.0);
          
          u_xlat16_31.xyz = u_xlat16_27.xyz * float3(u_xlat16_60) + u_xlat16_20.xyz;
          
          u_xlat16_60 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu19 = uint(int(u_xlat16_60));
          
          u_xlat0_d.x = u_xlat0_d.x * _AdditionalShadowFadeParams.x + _AdditionalShadowFadeParams.y;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlatb38.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 1.0)).xy;
          
          u_xlat16_13.x = float(0.0);
          
          u_xlat16_13.y = float(0.0);
          
          u_xlat16_13.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu19 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu4 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati23 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat4.x = dot(unity_LightIndices[int(u_xlatu4)], ImmCB_0[u_xlati23]);
              
              u_xlati4 = int(u_xlat4.x);
              
              u_xlat23.xyz = (-in_f.texcoord1.xyz) * _AdditionalLightsPosition[u_xlati4].www + _AdditionalLightsPosition[u_xlati4].xyz;
              
              u_xlat6.x = dot(u_xlat23.xyz, u_xlat23.xyz);
              
              u_xlat6.x = max(u_xlat6.x, 6.10351563e-05);
              
              u_xlat25 = inversesqrt(u_xlat6.x);
              
              u_xlat7.xyz = u_xlat23.xyz * float3(u_xlat25);
              
              u_xlat44.x = float(1.0) / float(u_xlat6.x);
              
              u_xlat6.x = u_xlat6.x * _AdditionalLightsAttenuation[u_xlati4].x + _AdditionalLightsAttenuation[u_xlati4].y;
              
              u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
              
              u_xlat6.x = u_xlat6.x * u_xlat44.x;
              
              u_xlat16_60 = dot(_AdditionalLightsSpotDir[u_xlati4].xyz, u_xlat7.xyz);
              
              u_xlat16_60 = u_xlat16_60 * _AdditionalLightsAttenuation[u_xlati4].z + _AdditionalLightsAttenuation[u_xlati4].w;
              
              u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
              
              u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
              
              u_xlat6.x = u_xlat16_60 * u_xlat6.x;
              
              u_xlati44 = int(_AdditionalShadowParams[u_xlati4].w);
              
              u_xlatb63 = u_xlati44>=0;
              
              if(u_xlatb63)
      {
                  
                  u_xlatb63 = float4(0.0, 0.0, 0.0, 0.0)!=float4(_AdditionalShadowParams[u_xlati4].z);
                  
                  if(u_xlatb63)
      {
                      
                      u_xlatb14.xyz = greaterThanEqual(abs(u_xlat7.zzyz), abs(u_xlat7.xyxx)).xyz;
                      
                      u_xlatb63 = u_xlatb14.y && u_xlatb14.x;
                      
                      u_xlatb14.xyw = lessThan((-u_xlat7.zyzx), float4(0.0, 0.0, 0.0, 0.0)).xyw;
                      
                      u_xlat14.x = (u_xlatb14.x) ? float(5.0) : float(4.0);
                      
                      u_xlat14.y = (u_xlatb14.y) ? float(3.0) : float(2.0);
                      
                      u_xlat64 = u_xlatb14.w ? 1.0 : float(0.0);
                      
                      u_xlat64 = (u_xlatb14.z) ? u_xlat14.y : u_xlat64;
                      
                      u_xlat63 = (u_xlatb63) ? u_xlat14.x : u_xlat64;
                      
                      u_xlat64 = trunc(_AdditionalShadowParams[u_xlati4].w);
                      
                      u_xlat63 = u_xlat63 + u_xlat64;
                      
                      u_xlati44 = int(u_xlat63);
      
      }
                  
                  u_xlati44 = int(u_xlati44 << 2);
                  
                  u_xlat5 = in_f.texcoord1.yyyy * _AdditionalLightsWorldToShadow[(u_xlati44 + 1)];
                  
                  u_xlat5 = _AdditionalLightsWorldToShadow[u_xlati44] * in_f.texcoord1.xxxx + u_xlat5;
                  
                  u_xlat5 = _AdditionalLightsWorldToShadow[(u_xlati44 + 2)] * in_f.texcoord1.zzzz + u_xlat5;
                  
                  u_xlat5 = u_xlat5 + _AdditionalLightsWorldToShadow[(u_xlati44 + 3)];
                  
                  u_xlat14.xyz = u_xlat5.xyz / u_xlat5.www;
                  
                  u_xlatb44 = 0.0!=_AdditionalShadowParams[u_xlati4].y;
                  
                  if(u_xlatb44)
      {
                      
                      u_xlat15_d.xyz = u_xlat14.xyz + _AdditionalShadowOffset0.xyz;
                      
                      float3 txVec5 = float3(u_xlat15_d.xy,u_xlat15_d.z);
                      
                      u_xlat16_5.x = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec5, 0.0);
                      
                      u_xlat15_d.xyz = u_xlat14.xyz + _AdditionalShadowOffset1.xyz;
                      
                      float3 txVec6 = float3(u_xlat15_d.xy,u_xlat15_d.z);
                      
                      u_xlat16_5.y = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec6, 0.0);
                      
                      u_xlat15_d.xyz = u_xlat14.xyz + _AdditionalShadowOffset2.xyz;
                      
                      float3 txVec7 = float3(u_xlat15_d.xy,u_xlat15_d.z);
                      
                      u_xlat16_5.z = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec7, 0.0);
                      
                      u_xlat15_d.xyz = u_xlat14.xyz + _AdditionalShadowOffset3.xyz;
                      
                      float3 txVec8 = float3(u_xlat15_d.xy,u_xlat15_d.z);
                      
                      u_xlat16_5.w = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec8, 0.0);
                      
                      u_xlat16_60 = dot(u_xlat16_5, float4(0.25, 0.25, 0.25, 0.25));
      
      }
                  else
                  
                      {
                      
                      float3 txVec9 = float3(u_xlat14.xy,u_xlat14.z);
                      
                      u_xlat16_60 = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec9, 0.0);
                      
                      u_xlat16_60 = u_xlat16_60;
      
      }
                  
                  u_xlat16_8.x = 1.0 + (-_AdditionalShadowParams[u_xlati4].x);
                  
                  u_xlat16_60 = u_xlat16_60 * _AdditionalShadowParams[u_xlati4].x + u_xlat16_8.x;
                  
                  u_xlatb44 = 0.0>=u_xlat14.z;
                  
                  u_xlatb63 = u_xlat14.z>=1.0;
                  
                  u_xlatb44 = u_xlatb63 || u_xlatb44;
                  
                  u_xlat16_60 = (u_xlatb44) ? 1.0 : u_xlat16_60;
      
      }
              else
              
                  {
                  
                  u_xlat16_60 = 1.0;
      
      }
              
              u_xlat16_8.x = (-u_xlat16_60) + 1.0;
              
              u_xlat16_60 = u_xlat0_d.x * u_xlat16_8.x + u_xlat16_60;
              
              u_xlati44 = int(1 << u_xlati4);
              
              u_xlati44 = int(uint(uint(u_xlati44) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati44 != 0)
      {
                  
                  u_xlati44 = int(_AdditionalLightsLightTypes[u_xlati4]);
                  
                  u_xlati63 = (u_xlati44 != 0) ? 0 : 1;
                  
                  u_xlati64 = int(u_xlati4 << 2);
                  
                  if(u_xlati63 != 0)
      {
                      
                      u_xlat14.xyz = in_f.texcoord1.yyy * _AdditionalLightsWorldToLights[(u_xlati64 + 1)].xyw;
                      
                      u_xlat14.xyz = _AdditionalLightsWorldToLights[u_xlati64].xyw * in_f.texcoord1.xxx + u_xlat14.xyz;
                      
                      u_xlat14.xyz = _AdditionalLightsWorldToLights[(u_xlati64 + 2)].xyw * in_f.texcoord1.zzz + u_xlat14.xyz;
                      
                      u_xlat14.xyz = u_xlat14.xyz + _AdditionalLightsWorldToLights[(u_xlati64 + 3)].xyw;
                      
                      u_xlat14.xy = u_xlat14.xy / u_xlat14.zz;
                      
                      u_xlat14.xy = u_xlat14.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
                      
                      u_xlat14.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati4].xy * u_xlat14.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati4].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb44 = u_xlati44==1;
                      
                      u_xlati44 = u_xlatb44 ? 1 : int(0);
                      
                      if(u_xlati44 != 0)
      {
                          
                          u_xlat44.xy = in_f.texcoord1.yy * _AdditionalLightsWorldToLights[(u_xlati64 + 1)].xy;
                          
                          u_xlat44.xy = _AdditionalLightsWorldToLights[u_xlati64].xy * in_f.texcoord1.xx + u_xlat44.xy;
                          
                          u_xlat44.xy = _AdditionalLightsWorldToLights[(u_xlati64 + 2)].xy * in_f.texcoord1.zz + u_xlat44.xy;
                          
                          u_xlat44.xy = u_xlat44.xy + _AdditionalLightsWorldToLights[(u_xlati64 + 3)].xy;
                          
                          u_xlat44.xy = u_xlat44.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat44.xy = fract(u_xlat44.xy);
                          
                          u_xlat14.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati4].xy * u_xlat44.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati4].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat5 = in_f.texcoord1.yyyy * _AdditionalLightsWorldToLights[(u_xlati64 + 1)];
                          
                          u_xlat5 = _AdditionalLightsWorldToLights[u_xlati64] * in_f.texcoord1.xxxx + u_xlat5;
                          
                          u_xlat5 = _AdditionalLightsWorldToLights[(u_xlati64 + 2)] * in_f.texcoord1.zzzz + u_xlat5;
                          
                          u_xlat5 = u_xlat5 + _AdditionalLightsWorldToLights[(u_xlati64 + 3)];
                          
                          u_xlat15_d.xyz = u_xlat5.xyz / u_xlat5.www;
                          
                          u_xlat44.x = dot(u_xlat15_d.xyz, u_xlat15_d.xyz);
                          
                          u_xlat44.x = inversesqrt(u_xlat44.x);
                          
                          u_xlat15_d.xyz = u_xlat44.xxx * u_xlat15_d.xyz;
                          
                          u_xlat44.x = dot(abs(u_xlat15_d.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat44.x = max(u_xlat44.x, 9.99999997e-07);
                          
                          u_xlat44.x = float(1.0) / float(u_xlat44.x);
                          
                          u_xlat16.xyz = u_xlat44.xxx * u_xlat15_d.zxy;
                          
                          u_xlat16.x = (-u_xlat16.x);
                          
                          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
                          
                          u_xlatb52.xy = greaterThanEqual(u_xlat16.yzyz, float4(0.0, 0.0, 0.0, 0.0)).xy;
                          
                          u_xlat52.x = (u_xlatb52.x) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat52.y = (u_xlatb52.y) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat44.xy = u_xlat15_d.xy * u_xlat44.xx + u_xlat52.xy;
                          
                          u_xlat44.xy = u_xlat44.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat44.xy = clamp(u_xlat44.xy, 0.0, 1.0);
                          
                          u_xlat14.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati4].xy * u_xlat44.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati4].zw;
      
      }
      
      }
                  
                  u_xlat5 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat14.xy, _GlobalMipBias.x);
                  
                  u_xlat16_8.x = (u_xlatb38.y) ? u_xlat5.w : u_xlat5.x;
                  
                  u_xlat16_17.xyz = (u_xlatb38.x) ? u_xlat5.xyz : u_xlat16_8.xxx;
      
      }
              else
              
                  {
                  
                  u_xlat16_17.x = float(1.0);
                  
                  u_xlat16_17.y = float(1.0);
                  
                  u_xlat16_17.z = float(1.0);
      
      }
              
              u_xlat16_17.xyz = u_xlat16_17.xyz * _AdditionalLightsColor[u_xlati4].xyz;
              
              u_xlat4.x = u_xlat16_60 * u_xlat6.x;
              
              u_xlat16_60 = dot(u_xlat2.xyz, u_xlat7.xyz);
              
              u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
              
              u_xlat16_60 = u_xlat16_60 * u_xlat4.x;
              
              u_xlat16_17.xyz = float3(u_xlat16_60) * u_xlat16_17.xyz;
              
              u_xlat4.xyz = u_xlat23.xyz * float3(u_xlat25) + u_xlat16_3_d.xyz;
              
              u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
              
              u_xlat61 = max(u_xlat61, 1.17549435e-38);
              
              u_xlat61 = inversesqrt(u_xlat61);
              
              u_xlat4.xyz = float3(u_xlat61) * u_xlat4.xyz;
              
              u_xlat61 = dot(u_xlat2.xyz, u_xlat4.xyz);
              
              u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
              
              u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
              
              u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
              
              u_xlat23.x = u_xlat61 * u_xlat61;
              
              u_xlat23.x = u_xlat23.x * u_xlat16_12.x + 1.00001001;
              
              u_xlat16_60 = u_xlat4.x * u_xlat4.x;
              
              u_xlat4.x = u_xlat23.x * u_xlat23.x;
              
              u_xlat23.x = max(u_xlat16_60, 0.100000001);
              
              u_xlat4.x = u_xlat23.x * u_xlat4.x;
              
              u_xlat4.x = u_xlat16_47 * u_xlat4.x;
              
              u_xlat4.x = u_xlat16_28 / u_xlat4.x;
              
              u_xlat16_60 = u_xlat4.x + -6.10351563e-05;
              
              u_xlat16_60 = max(u_xlat16_60, 0.0);
              
              u_xlat16_60 = min(u_xlat16_60, 100.0);
              
              u_xlat16_18.xyz = u_xlat16_27.xyz * float3(u_xlat16_60) + u_xlat16_20.xyz;
              
              u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + u_xlat16_13.xyz;
      
      }
          
          u_xlat16_20.xyz = u_xlat16_31.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
          
          out_f.color.xyz = u_xlat16_13.xyz + u_xlat16_20.xyz;
          
          u_xlatb0 = _Surface==1.0;
          
          out_f.color.w = (u_xlatb0) ? u_xlat16_1.x : 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _ShadowBias;
      
      uniform float3 _LightDirection;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
          
          u_xlat6 = dot(_LightDirection.xyz, u_xlat1.xyz);
          
          u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
          
          u_xlat6 = (-u_xlat6) + 1.0;
          
          u_xlat6 = u_xlat6 * _ShadowBias.y;
          
          u_xlat0.xyz = u_xlat1.xyz * float3(u_xlat6) + u_xlat0.xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          u_xlat0 = u_xlat0 + unity_MatrixVP[3];
          
          out_v.vertex.z = max(u_xlat0.z, -1.0);
          
          out_v.vertex.xyw = u_xlat0.xyw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0 = in_v.vertex.yyyy * unity_ObjectToWorld[1];
          
          u_xlat0 = unity_ObjectToWorld[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat0;
          
          u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord5 : TEXCOORD5;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 texcoord2 : TEXCOORD2;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * unity_ObjectToWorld[1];
          
          u_xlat0 = unity_ObjectToWorld[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat0;
          
          u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          out_v.texcoord1.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.texcoord2.xyz = u_xlat0.xyz;
          
          out_v.texcoord5.xyz = float3(0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * in_f.texcoord2.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _BaseMap;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _BaseColor;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Universal Render Pipeline/FallbackError"
}
