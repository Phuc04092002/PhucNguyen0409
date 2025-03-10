// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/GradientPlane"
{
  Properties
  {
    [NoScaleOffset] __Gradient_Gradient ("[Gradient] Gradient", 2D) = "white" {}
    [HideInInspector] _QueueOffset ("_QueueOffset", float) = 0
    [HideInInspector] _QueueControl ("_QueueControl", float) = -1
    unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
    unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
    unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
  }
  SubShader
  {
    Tags
    { 
      "QUEUE" = "Geometry"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderGraphShader" = "true"
      "ShaderGraphTargetId" = "UniversalLitSubTarget"
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: Universal Forward
    {
      Name "Universal Forward"
      Tags
      { 
        "LIGHTMODE" = "UniversalForward"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
    Pass // ind: 2, name: GBuffer
    {
      Name "GBuffer"
      Tags
      { 
        "LIGHTMODE" = "UniversalGBuffer"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
    Pass // ind: 3, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "LIGHTMODE" = "SHADOWCASTER"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
    Pass // ind: 4, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "LIGHTMODE" = "DepthOnly"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
    Pass // ind: 6, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
      "QUEUE" = "Geometry"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderGraphShader" = "true"
      "ShaderGraphTargetId" = "UniversalLitSubTarget"
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: Universal Forward
    {
      Name "Universal Forward"
      Tags
      { 
        "LIGHTMODE" = "UniversalForward"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile _AdditionalLightsColor _WorldSpaceCameraPos unity_SpecCube1_HDR unity_SpecCube0_ProbePosition unity_SHAr
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _MainLightPosition;
      
      uniform float4 _MainLightColor;
      
      uniform float4 _AdditionalLightsCount;
      
      uniform float4 _AdditionalLightsPosition[16];
      
      uniform float4 _AdditionalLightsColor[16];
      
      uniform float4 _AdditionalLightsAttenuation[16];
      
      uniform float4 _AdditionalLightsSpotDir[16];
      
      uniform float2 _GlobalMipBias;
      
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
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _AdditionalLightsShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_AdditionalLightsShadowmapTexture;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      uniform sampler2D __Gradient_Gradient;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float3 vs_INTERP3 : INTERP3;
          
          float2 vs_INTERP4 : INTERP4;
          
          float2 vs_INTERP5 : INTERP5;
          
          float3 vs_INTERP6 : INTERP6;
          
          float4 vs_INTERP7 : INTERP7;
          
          float4 vs_INTERP8 : INTERP8;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float3 vs_INTERP3 : INTERP3;
          
          float3 vs_INTERP6 : INTERP6;
      
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
      
      float4 phase0_Output0_5;
      
      float3 u_xlat0;
      
      float4 u_xlat16_0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float u_xlat15;
      
      int u_xlatb15;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = u_xlat1 + unity_MatrixVP[3];
          
          out_v.vs_INTERP0.xyz = u_xlat0.xyz;
          
          u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat15 = max(u_xlat15, 1.17549435e-38);
          
          u_xlat15 = inversesqrt(u_xlat15);
          
          u_xlat1.xyz = float3(u_xlat15) * u_xlat1.xyz;
          
          out_v.vs_INTERP1.xyz = u_xlat1.xyz;
          
          u_xlat2.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat2.xyz;
          
          u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat2.xyz;
          
          u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat15 = max(u_xlat15, 1.17549435e-38);
          
          u_xlat15 = inversesqrt(u_xlat15);
          
          out_v.vs_INTERP2.xyz = float3(u_xlat15) * u_xlat2.xyz;
          
          out_v.vs_INTERP2.w = in_v.tangent.w;
          
          u_xlatb15 = unity_OrthoParams.w==0.0;
          
          out_v.vs_INTERP3.x = (u_xlatb15) ? u_xlat0.x : unity_MatrixV[0].z;
          
          out_v.vs_INTERP3.y = (u_xlatb15) ? u_xlat0.y : unity_MatrixV[1].z;
          
          out_v.vs_INTERP3.z = (u_xlatb15) ? u_xlat0.z : unity_MatrixV[2].z;
          
          phase0_Output0_5 = float4(0.0, 0.0, 0.0, 0.0);
          
          u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
          
          u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
          
          u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
          
          u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
          
          u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
          
          u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
          
          u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
          
          out_v.vs_INTERP6.xyz = u_xlat16_3.xyz;
          
          out_v.vs_INTERP7 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_INTERP8 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_INTERP4 = phase0_Output0_5.xy;
          
          out_v.vs_INTERP5 = phase0_Output0_5.zw;
          
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
      
      float3 u_xlat0_d;
      
      float3 u_xlat16_0_d;
      
      int u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat2_d;
      
      float4 u_xlat3;
      
      float4 u_xlat16_3_d;
      
      int u_xlati3;
      
      bool4 u_xlatb3;
      
      float4 u_xlat4;
      
      float4 u_xlat16_4_d;
      
      float3 u_xlat5;
      
      float3 u_xlat6;
      
      int u_xlati6;
      
      int u_xlatb6;
      
      float3 u_xlat16_7;
      
      float3 u_xlat16_8;
      
      float3 u_xlat16_9;
      
      float3 u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float3 u_xlat12;
      
      bool3 u_xlatb12;
      
      float3 u_xlat13;
      
      float3 u_xlat16_14;
      
      float3 u_xlat16_15;
      
      float3 u_xlat16;
      
      uint u_xlatu16;
      
      bool2 u_xlatb16;
      
      float3 u_xlat21;
      
      float3 u_xlat22;
      
      int u_xlati22;
      
      bool3 u_xlatb22;
      
      float u_xlat32;
      
      bool2 u_xlatb32;
      
      float u_xlat38;
      
      int u_xlati38;
      
      float2 u_xlat44;
      
      bool2 u_xlatb44;
      
      float u_xlat48;
      
      float u_xlat49;
      
      uint u_xlatu49;
      
      float u_xlat50;
      
      int u_xlati50;
      
      uint u_xlatu50;
      
      int u_xlatb50;
      
      float u_xlat51;
      
      int u_xlatb54;
      
      float u_xlat16_55;
      
      float u_xlat16_56;
      
      float u_xlat16_57;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat0_d.x = in_f.vs_INTERP0.y * unity_WorldToObject[1].y;
          
          u_xlat0_d.x = unity_WorldToObject[0].y * in_f.vs_INTERP0.x + u_xlat0_d.x;
          
          u_xlat0_d.x = unity_WorldToObject[2].y * in_f.vs_INTERP0.z + u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat0_d.x + unity_WorldToObject[3].y;
          
          u_xlat0_d.x = u_xlat0_d.x + 0.5;
          
          u_xlat16_0_d.xyz = texture(__Gradient_Gradient, u_xlat0_d.xx, _GlobalMipBias.x).xyz;
          
          u_xlat48 = dot(in_f.vs_INTERP1.xyz, in_f.vs_INTERP1.xyz);
          
          u_xlat48 = max(u_xlat48, 1.17549435e-38);
          
          u_xlat48 = inversesqrt(u_xlat48);
          
          u_xlat1_d.xyz = float3(u_xlat48) * in_f.vs_INTERP1.xyz;
          
          u_xlat48 = dot(in_f.vs_INTERP3.xyz, in_f.vs_INTERP3.xyz);
          
          u_xlat48 = max(u_xlat48, 1.17549435e-38);
          
          u_xlat48 = inversesqrt(u_xlat48);
          
          u_xlat2_d.xyz = float3(u_xlat48) * in_f.vs_INTERP3.xyz;
          
          u_xlat3.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat4.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat5.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat6.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
          
          u_xlat3.y = dot(u_xlat4.xyz, u_xlat4.xyz);
          
          u_xlat3.z = dot(u_xlat5.xyz, u_xlat5.xyz);
          
          u_xlat3.w = dot(u_xlat6.xyz, u_xlat6.xyz);
          
          u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_4_d.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
          
          u_xlat16_7.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.xyz = u_xlat16_4_d.yzw + u_xlat16_7.xyz;
          
          u_xlat16_4_d.yzw = max(u_xlat16_7.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_7.x = dot(u_xlat16_4_d, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_7.x = (-u_xlat16_7.x) + 4.0;
          
          u_xlatu50 = uint(u_xlat16_7.x);
          
          u_xlati50 = int(int(u_xlatu50) << 2);
          
          u_xlat3.xyz = in_f.vs_INTERP0.yyy * _MainLightWorldToShadow[(u_xlati50 + 1)].xyz;
          
          u_xlat3.xyz = _MainLightWorldToShadow[u_xlati50].xyz * in_f.vs_INTERP0.xxx + u_xlat3.xyz;
          
          u_xlat3.xyz = _MainLightWorldToShadow[(u_xlati50 + 2)].xyz * in_f.vs_INTERP0.zzz + u_xlat3.xyz;
          
          u_xlat3.xyz = u_xlat3.xyz + _MainLightWorldToShadow[(u_xlati50 + 3)].xyz;
          
          u_xlat1_d.w = 1.0;
          
          u_xlat16_7.x = dot(unity_SHAr, u_xlat1_d);
          
          u_xlat16_7.y = dot(unity_SHAg, u_xlat1_d);
          
          u_xlat16_7.z = dot(unity_SHAb, u_xlat1_d);
          
          u_xlat16_7.xyz = u_xlat16_7.xyz + in_f.vs_INTERP6.xyz;
          
          u_xlat16_7.xyz = max(u_xlat16_7.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_8.xyz = u_xlat16_0_d.xyz * float3(0.959999979, 0.959999979, 0.959999979);
          
          u_xlatb0 = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0)
      {
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_55 = dot(u_xlat16_4_d, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat3.xy,u_xlat3.z);
              
              u_xlat16_55 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_55 = u_xlat16_55;
      
      }
          
          u_xlat16_56 = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_55 = u_xlat16_55 * _MainLightShadowParams.x + u_xlat16_56;
          
          u_xlatb0 = 0.0>=u_xlat3.z;
          
          u_xlatb16.x = u_xlat3.z>=1.0;
          
          u_xlatb0 = u_xlatb16.x || u_xlatb0;
          
          u_xlat16_55 = (u_xlatb0) ? 1.0 : u_xlat16_55;
          
          u_xlat0_d.xyz = in_f.vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xyz, u_xlat0_d.xyz);
          
          u_xlat16.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
          
          u_xlat16_56 = (-u_xlat16_55) + 1.0;
          
          u_xlat16_55 = u_xlat16.x * u_xlat16_56 + u_xlat16_55;
          
          u_xlatb16.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb16.x)
      {
              
              u_xlat16.xy = in_f.vs_INTERP0.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat16.xy = _MainLightWorldToLight[0].xy * in_f.vs_INTERP0.xx + u_xlat16.xy;
              
              u_xlat16.xy = _MainLightWorldToLight[2].xy * in_f.vs_INTERP0.zz + u_xlat16.xy;
              
              u_xlat16.xy = u_xlat16.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat16.xy = u_xlat16.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat3 = texture(_MainLightCookieTexture, u_xlat16.xy, _GlobalMipBias.x);
              
              u_xlatb16.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_56 = (u_xlatb16.y) ? u_xlat3.w : u_xlat3.x;
              
              u_xlat16_9.xyz = (u_xlatb16.x) ? u_xlat3.xyz : float3(u_xlat16_56);
      
      }
          else
          
              {
              
              u_xlat16_9.x = float(1.0);
              
              u_xlat16_9.y = float(1.0);
              
              u_xlat16_9.z = float(1.0);
      
      }
          
          u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightColor.xyz;
          
          u_xlat16_56 = dot((-u_xlat2_d.xyz), u_xlat1_d.xyz);
          
          u_xlat16_56 = u_xlat16_56 + u_xlat16_56;
          
          u_xlat16_10.xyz = u_xlat1_d.xyz * (-float3(u_xlat16_56)) + (-u_xlat2_d.xyz);
          
          u_xlat16_56 = dot(u_xlat1_d.xyz, u_xlat2_d.xyz);
          
          u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
          
          u_xlat16_56 = (-u_xlat16_56) + 1.0;
          
          u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
          
          u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
          
          u_xlat16_3_d = textureLod(unity_SpecCube0, u_xlat16_10.xyz, 4.05000019);
          
          u_xlat16_57 = u_xlat16_3_d.w + -1.0;
          
          u_xlat16_57 = unity_SpecCube0_HDR.w * u_xlat16_57 + 1.0;
          
          u_xlat16_57 = max(u_xlat16_57, 0.0);
          
          u_xlat16_57 = log2(u_xlat16_57);
          
          u_xlat16_57 = u_xlat16_57 * unity_SpecCube0_HDR.y;
          
          u_xlat16_57 = exp2(u_xlat16_57);
          
          u_xlat16_57 = u_xlat16_57 * unity_SpecCube0_HDR.x;
          
          u_xlat16_10.xyz = u_xlat16_3_d.xyz * float3(u_xlat16_57);
          
          u_xlat16_56 = u_xlat16_56 * 0.5 + 0.0399999991;
          
          u_xlat16.x = u_xlat16_56 * 0.941176474;
          
          u_xlat16_10.xyz = u_xlat16.xxx * u_xlat16_10.xyz;
          
          u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_10.xyz;
          
          u_xlat16.x = u_xlat16_55 * unity_LightData.z;
          
          u_xlat16_55 = dot(u_xlat1_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
          
          u_xlat16_55 = u_xlat16.x * u_xlat16_55;
          
          u_xlat16_9.xyz = float3(u_xlat16_55) * u_xlat16_9.xyz;
          
          u_xlat16.xyz = in_f.vs_INTERP3.xyz * float3(u_xlat48) + _MainLightPosition.xyz;
          
          u_xlat49 = dot(u_xlat16.xyz, u_xlat16.xyz);
          
          u_xlat49 = max(u_xlat49, 1.17549435e-38);
          
          u_xlat49 = inversesqrt(u_xlat49);
          
          u_xlat16.xyz = u_xlat16.xyz * float3(u_xlat49);
          
          u_xlat49 = dot(u_xlat1_d.xyz, u_xlat16.xyz);
          
          u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
          
          u_xlat16.x = dot(_MainLightPosition.xyz, u_xlat16.xyz);
          
          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
          
          u_xlat32 = u_xlat49 * u_xlat49;
          
          u_xlat32 = u_xlat32 * -0.9375 + 1.00001001;
          
          u_xlat16_55 = u_xlat16.x * u_xlat16.x;
          
          u_xlat16.x = u_xlat32 * u_xlat32;
          
          u_xlat32 = max(u_xlat16_55, 0.100000001);
          
          u_xlat16.x = u_xlat32 * u_xlat16.x;
          
          u_xlat16.x = u_xlat16.x * 3.0;
          
          u_xlat16.x = 0.0625 / u_xlat16.x;
          
          u_xlat16_55 = u_xlat16.x + -6.10351563e-05;
          
          u_xlat16_10.xyz = float3(u_xlat16_55) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_8.xyz;
          
          u_xlat16_55 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu16 = uint(int(u_xlat16_55));
          
          u_xlat0_d.x = u_xlat0_d.x * _AdditionalShadowFadeParams.x + _AdditionalShadowFadeParams.y;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlatb32.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 1.0)).xy;
          
          u_xlat16_11.x = float(0.0);
          
          u_xlat16_11.y = float(0.0);
          
          u_xlat16_11.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu16 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu50 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati3 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat50 = dot(unity_LightIndices[int(u_xlatu50)], ImmCB_0[u_xlati3]);
              
              u_xlati50 = int(u_xlat50);
              
              u_xlat3.xyz = (-in_f.vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati50].www + _AdditionalLightsPosition[u_xlati50].xyz;
              
              u_xlat51 = dot(u_xlat3.xyz, u_xlat3.xyz);
              
              u_xlat51 = max(u_xlat51, 6.10351563e-05);
              
              u_xlat5.x = inversesqrt(u_xlat51);
              
              u_xlat21.xyz = u_xlat3.xyz * u_xlat5.xxx;
              
              u_xlat6.x = float(1.0) / float(u_xlat51);
              
              u_xlat51 = u_xlat51 * _AdditionalLightsAttenuation[u_xlati50].x + _AdditionalLightsAttenuation[u_xlati50].y;
              
              u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
              
              u_xlat51 = u_xlat51 * u_xlat6.x;
              
              u_xlat16_55 = dot(_AdditionalLightsSpotDir[u_xlati50].xyz, u_xlat21.xyz);
              
              u_xlat16_55 = u_xlat16_55 * _AdditionalLightsAttenuation[u_xlati50].z + _AdditionalLightsAttenuation[u_xlati50].w;
              
              u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
              
              u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
              
              u_xlat51 = u_xlat51 * u_xlat16_55;
              
              u_xlati6 = int(_AdditionalShadowParams[u_xlati50].w);
              
              u_xlatb22.x = u_xlati6>=0;
              
              if(u_xlatb22.x)
      {
                  
                  u_xlatb22.x = float4(0.0, 0.0, 0.0, 0.0)!=float4(_AdditionalShadowParams[u_xlati50].z);
                  
                  if(u_xlatb22.x)
      {
                      
                      u_xlatb22.xyz = greaterThanEqual(abs(u_xlat21.zzyy), abs(u_xlat21.xyxx)).xyz;
                      
                      u_xlatb22.x = u_xlatb22.y && u_xlatb22.x;
                      
                      u_xlatb12.xyz = lessThan((-u_xlat21.zyxz), float4(0.0, 0.0, 0.0, 0.0)).xyz;
                      
                      u_xlat12.x = (u_xlatb12.x) ? float(5.0) : float(4.0);
                      
                      u_xlat12.y = (u_xlatb12.y) ? float(3.0) : float(2.0);
                      
                      u_xlat38 = u_xlatb12.z ? 1.0 : float(0.0);
                      
                      u_xlat38 = (u_xlatb22.z) ? u_xlat12.y : u_xlat38;
                      
                      u_xlat22.x = (u_xlatb22.x) ? u_xlat12.x : u_xlat38;
                      
                      u_xlat38 = trunc(_AdditionalShadowParams[u_xlati50].w);
                      
                      u_xlat22.x = u_xlat22.x + u_xlat38;
                      
                      u_xlati6 = int(u_xlat22.x);
      
      }
                  
                  u_xlati6 = int(u_xlati6 << 2);
                  
                  u_xlat4 = in_f.vs_INTERP0.yyyy * _AdditionalLightsWorldToShadow[(u_xlati6 + 1)];
                  
                  u_xlat4 = _AdditionalLightsWorldToShadow[u_xlati6] * in_f.vs_INTERP0.xxxx + u_xlat4;
                  
                  u_xlat4 = _AdditionalLightsWorldToShadow[(u_xlati6 + 2)] * in_f.vs_INTERP0.zzzz + u_xlat4;
                  
                  u_xlat4 = u_xlat4 + _AdditionalLightsWorldToShadow[(u_xlati6 + 3)];
                  
                  u_xlat6.xyz = u_xlat4.xyz / u_xlat4.www;
                  
                  u_xlatb54 = 0.0!=_AdditionalShadowParams[u_xlati50].y;
                  
                  if(u_xlatb54)
      {
                      
                      u_xlat12.xyz = u_xlat6.xyz + _AdditionalShadowOffset0.xyz;
                      
                      float3 txVec5 = float3(u_xlat12.xy,u_xlat12.z);
                      
                      u_xlat16_4_d.x = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec5, 0.0);
                      
                      u_xlat12.xyz = u_xlat6.xyz + _AdditionalShadowOffset1.xyz;
                      
                      float3 txVec6 = float3(u_xlat12.xy,u_xlat12.z);
                      
                      u_xlat16_4_d.y = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec6, 0.0);
                      
                      u_xlat12.xyz = u_xlat6.xyz + _AdditionalShadowOffset2.xyz;
                      
                      float3 txVec7 = float3(u_xlat12.xy,u_xlat12.z);
                      
                      u_xlat16_4_d.z = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec7, 0.0);
                      
                      u_xlat12.xyz = u_xlat6.xyz + _AdditionalShadowOffset3.xyz;
                      
                      float3 txVec8 = float3(u_xlat12.xy,u_xlat12.z);
                      
                      u_xlat16_4_d.w = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec8, 0.0);
                      
                      u_xlat16_55 = dot(u_xlat16_4_d, float4(0.25, 0.25, 0.25, 0.25));
      
      }
                  else
                  
                      {
                      
                      float3 txVec9 = float3(u_xlat6.xy,u_xlat6.z);
                      
                      u_xlat16_55 = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec9, 0.0);
                      
                      u_xlat16_55 = u_xlat16_55;
      
      }
                  
                  u_xlat16_56 = 1.0 + (-_AdditionalShadowParams[u_xlati50].x);
                  
                  u_xlat16_55 = u_xlat16_55 * _AdditionalShadowParams[u_xlati50].x + u_xlat16_56;
                  
                  u_xlatb6 = 0.0>=u_xlat6.z;
                  
                  u_xlatb22.x = u_xlat6.z>=1.0;
                  
                  u_xlatb6 = u_xlatb22.x || u_xlatb6;
                  
                  u_xlat16_55 = (u_xlatb6) ? 1.0 : u_xlat16_55;
      
      }
              else
              
                  {
                  
                  u_xlat16_55 = 1.0;
      
      }
              
              u_xlat16_56 = (-u_xlat16_55) + 1.0;
              
              u_xlat16_55 = u_xlat0_d.x * u_xlat16_56 + u_xlat16_55;
              
              u_xlati6 = int(1 << u_xlati50);
              
              u_xlati6 = int(uint(uint(u_xlati6) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati6 != 0)
      {
                  
                  u_xlati6 = int(_AdditionalLightsLightTypes[u_xlati50]);
                  
                  u_xlati22 = (u_xlati6 != 0) ? 0 : 1;
                  
                  u_xlati38 = int(u_xlati50 << 2);
                  
                  if(u_xlati22 != 0)
      {
                      
                      u_xlat12.xyz = in_f.vs_INTERP0.yyy * _AdditionalLightsWorldToLights[(u_xlati38 + 1)].xyw;
                      
                      u_xlat12.xyz = _AdditionalLightsWorldToLights[u_xlati38].xyw * in_f.vs_INTERP0.xxx + u_xlat12.xyz;
                      
                      u_xlat12.xyz = _AdditionalLightsWorldToLights[(u_xlati38 + 2)].xyw * in_f.vs_INTERP0.zzz + u_xlat12.xyz;
                      
                      u_xlat12.xyz = u_xlat12.xyz + _AdditionalLightsWorldToLights[(u_xlati38 + 3)].xyw;
                      
                      u_xlat22.xz = u_xlat12.xy / u_xlat12.zz;
                      
                      u_xlat22.xz = u_xlat22.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat22.xz = clamp(u_xlat22.xz, 0.0, 1.0);
                      
                      u_xlat22.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati50].xy * u_xlat22.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati50].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb6 = u_xlati6==1;
                      
                      u_xlati6 = u_xlatb6 ? 1 : int(0);
                      
                      if(u_xlati6 != 0)
      {
                          
                          u_xlat12.xy = in_f.vs_INTERP0.yy * _AdditionalLightsWorldToLights[(u_xlati38 + 1)].xy;
                          
                          u_xlat12.xy = _AdditionalLightsWorldToLights[u_xlati38].xy * in_f.vs_INTERP0.xx + u_xlat12.xy;
                          
                          u_xlat12.xy = _AdditionalLightsWorldToLights[(u_xlati38 + 2)].xy * in_f.vs_INTERP0.zz + u_xlat12.xy;
                          
                          u_xlat12.xy = u_xlat12.xy + _AdditionalLightsWorldToLights[(u_xlati38 + 3)].xy;
                          
                          u_xlat12.xy = u_xlat12.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat12.xy = fract(u_xlat12.xy);
                          
                          u_xlat22.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati50].xy * u_xlat12.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati50].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat4 = in_f.vs_INTERP0.yyyy * _AdditionalLightsWorldToLights[(u_xlati38 + 1)];
                          
                          u_xlat4 = _AdditionalLightsWorldToLights[u_xlati38] * in_f.vs_INTERP0.xxxx + u_xlat4;
                          
                          u_xlat4 = _AdditionalLightsWorldToLights[(u_xlati38 + 2)] * in_f.vs_INTERP0.zzzz + u_xlat4;
                          
                          u_xlat4 = u_xlat4 + _AdditionalLightsWorldToLights[(u_xlati38 + 3)];
                          
                          u_xlat12.xyz = u_xlat4.xyz / u_xlat4.www;
                          
                          u_xlat6.x = dot(u_xlat12.xyz, u_xlat12.xyz);
                          
                          u_xlat6.x = inversesqrt(u_xlat6.x);
                          
                          u_xlat12.xyz = u_xlat6.xxx * u_xlat12.xyz;
                          
                          u_xlat6.x = dot(abs(u_xlat12.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat6.x = max(u_xlat6.x, 9.99999997e-07);
                          
                          u_xlat6.x = float(1.0) / float(u_xlat6.x);
                          
                          u_xlat13.xyz = u_xlat6.xxx * u_xlat12.zxy;
                          
                          u_xlat13.x = (-u_xlat13.x);
                          
                          u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
                          
                          u_xlatb44.xy = greaterThanEqual(u_xlat13.yzyz, float4(0.0, 0.0, 0.0, 0.0)).xy;
                          
                          u_xlat44.x = (u_xlatb44.x) ? u_xlat13.x : (-u_xlat13.x);
                          
                          u_xlat44.y = (u_xlatb44.y) ? u_xlat13.x : (-u_xlat13.x);
                          
                          u_xlat6.xz = u_xlat12.xy * u_xlat6.xx + u_xlat44.xy;
                          
                          u_xlat6.xz = u_xlat6.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat6.xz = clamp(u_xlat6.xz, 0.0, 1.0);
                          
                          u_xlat22.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati50].xy * u_xlat6.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati50].zw;
      
      }
      
      }
                  
                  u_xlat4 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat22.xz, _GlobalMipBias.x);
                  
                  u_xlat16_56 = (u_xlatb32.y) ? u_xlat4.w : u_xlat4.x;
                  
                  u_xlat16_14.xyz = (u_xlatb32.x) ? u_xlat4.xyz : float3(u_xlat16_56);
      
      }
              else
              
                  {
                  
                  u_xlat16_14.x = float(1.0);
                  
                  u_xlat16_14.y = float(1.0);
                  
                  u_xlat16_14.z = float(1.0);
      
      }
              
              u_xlat16_14.xyz = u_xlat16_14.xyz * _AdditionalLightsColor[u_xlati50].xyz;
              
              u_xlat50 = u_xlat51 * u_xlat16_55;
              
              u_xlat16_55 = dot(u_xlat1_d.xyz, u_xlat21.xyz);
              
              u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
              
              u_xlat16_55 = u_xlat50 * u_xlat16_55;
              
              u_xlat16_14.xyz = float3(u_xlat16_55) * u_xlat16_14.xyz;
              
              u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx + u_xlat2_d.xyz;
              
              u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
              
              u_xlat50 = max(u_xlat50, 1.17549435e-38);
              
              u_xlat50 = inversesqrt(u_xlat50);
              
              u_xlat3.xyz = float3(u_xlat50) * u_xlat3.xyz;
              
              u_xlat50 = dot(u_xlat1_d.xyz, u_xlat3.xyz);
              
              u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
              
              u_xlat3.x = dot(u_xlat21.xyz, u_xlat3.xyz);
              
              u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
              
              u_xlat50 = u_xlat50 * u_xlat50;
              
              u_xlat50 = u_xlat50 * -0.9375 + 1.00001001;
              
              u_xlat16_55 = u_xlat3.x * u_xlat3.x;
              
              u_xlat50 = u_xlat50 * u_xlat50;
              
              u_xlat3.x = max(u_xlat16_55, 0.100000001);
              
              u_xlat50 = u_xlat50 * u_xlat3.x;
              
              u_xlat50 = u_xlat50 * 3.0;
              
              u_xlat50 = 0.0625 / u_xlat50;
              
              u_xlat16_55 = u_xlat50 + -6.10351563e-05;
              
              u_xlat16_15.xyz = float3(u_xlat16_55) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_8.xyz;
              
              u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
      
      }
          
          u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz + u_xlat16_7.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
          
          out_f.SV_TARGET0.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "LIGHTMODE" = "SHADOWCASTER"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
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
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat0.xyz = float3(_LightDirection.x, _LightDirection.y, _LightDirection.z) * _ShadowBias.xxx + u_xlat0.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
          
          u_xlat6 = dot(float3(_LightDirection.x, _LightDirection.y, _LightDirection.z), u_xlat1.xyz);
          
          u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
          
          u_xlat6 = (-u_xlat6) + 1.0;
          
          u_xlat6 = u_xlat6 * _ShadowBias.y;
          
          u_xlat0.xyz = u_xlat1.xyz * float3(u_xlat6) + u_xlat0.xyz;
          
          out_v.vs_INTERP0.xyz = u_xlat1.xyz;
          
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
        "LIGHTMODE" = "DepthOnly"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
          
          float3 vertex : POSITION0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
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
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
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
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
      
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
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          u_xlat0.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP1.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.vs_INTERP1.w = in_v.tangent.w;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = dot(in_f.vs_INTERP0.xyz, in_f.vs_INTERP0.xyz);
          
          u_xlat0_d.x = max(u_xlat0_d.x, 1.17549435e-38);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * in_f.vs_INTERP0.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D __Gradient_Gradient;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
      
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
      
      float3 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vs_INTERP0.xyz = u_xlat0.xyz;
          
          out_v.vertex = u_xlat1 + unity_MatrixVP[3];
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
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
      
      float u_xlat0_d;
      
      float3 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d = in_f.vs_INTERP0.y * unity_WorldToObject[1].y;
          
          u_xlat0_d = unity_WorldToObject[0].y * in_f.vs_INTERP0.x + u_xlat0_d;
          
          u_xlat0_d = unity_WorldToObject[2].y * in_f.vs_INTERP0.z + u_xlat0_d;
          
          u_xlat0_d = u_xlat0_d + unity_WorldToObject[3].y;
          
          u_xlat0_d = u_xlat0_d + 0.5;
          
          u_xlat16_0.xyz = texture(__Gradient_Gradient, float2(u_xlat0_d), _GlobalMipBias.x).xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat16_0.xyz;
          
          out_f.SV_TARGET0.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
