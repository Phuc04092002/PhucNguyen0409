// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/MetaBuildingShader"
{
  Properties
  {
    _Progress ("Progress", Range(0, 1)) = 0.25
    _HeightBounds ("HeightBounds", Vector) = (0,1,0,0)
    _BaseColor ("BaseColor", Color) = (1,1,1,1)
    [NoScaleOffset] _MainTex ("MainTexture", 2D) = "white" {}
    _Metallic ("Metallic", Range(0, 1)) = 0
    _Smoothness ("Smoothness", Range(0, 1)) = 0.5
    [HDR] _Emission ("Emission", Color) = (0,0,0,0)
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
      #pragma multi_compile _AdditionalLightsPosition _AdditionalLightsSpotDir unity_WorldTransformParams unity_SpecCube0_HDR unity_SpecCube0_BoxMin unity_DynamicLightmapST
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform int unity_BaseInstanceID;
      
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
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
          
          float4 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP3 : INTERP3;
          
          float3 vs_INTERP4 : INTERP4;
          
          float2 vs_INTERP5 : INTERP5;
          
          float2 vs_INTERP6 : INTERP6;
          
          float3 vs_INTERP7 : INTERP7;
          
          float4 vs_INTERP8 : INTERP8;
          
          float4 vs_INTERP9 : INTERP9;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP3 : INTERP3;
          
          float3 vs_INTERP4 : INTERP4;
          
          float3 vs_INTERP7 : INTERP7;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      struct unity_Builtins0Array_Type 
          {
          
          float4 unity_ObjectToWorldArray[4];
          
          float4 unity_WorldToObjectArray[4];
          
          float unity_RenderingLayerArray;
      
      };
      
      uniform UnityInstancing_PerDraw0 
          {
          
          #endif
          uniform unity_Builtins0Array_Type unity_Builtins0Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      struct unity_Builtins2Array_Type 
          {
          
          float4 unity_SHArArray;
          
          float4 unity_SHAgArray;
          
          float4 unity_SHAbArray;
          
          float4 unity_SHBrArray;
          
          float4 unity_SHBgArray;
          
          float4 unity_SHBbArray;
          
          float4 unity_SHCArray;
      
      };
      
      uniform UnityInstancing_PerDraw2 
          {
          
          #endif
          uniform unity_Builtins2Array_Type unity_Builtins2Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 phase0_Output0_6;
      
      flat out uint vs_CUSTOM_INSTANCE_ID0;
      
      float4 u_xlat0;
      
      int2 u_xlati0;
      
      int u_xlatb0;
      
      float3 u_xlat1;
      
      float4 u_xlat16_1;
      
      float4 u_xlat2;
      
      float3 u_xlat3;
      
      float3 u_xlat16_4;
      
      float3 u_xlat16_5;
      
      float u_xlat12;
      
      float u_xlat19;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0.x = gl_InstanceID + unity_BaseInstanceID;
          
          u_xlati0.xy = u_xlati0.xx * int2(9, 7);
          
          u_xlat1.xyz = in_v.vertex.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.vertex.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.vertex.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[3].xyz;
          
          u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
          
          u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
          
          out_v.vertex = u_xlat2 + unity_MatrixVP[3];
          
          out_v.vs_INTERP0.xyz = u_xlat1.xyz;
          
          u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat2.x = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[0].xyz);
          
          u_xlat2.y = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[1].xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[2].xyz);
          
          u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat12 = max(u_xlat12, 1.17549435e-38);
          
          u_xlat12 = inversesqrt(u_xlat12);
          
          u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
          
          out_v.vs_INTERP1.xyz = u_xlat2.xyz;
          
          u_xlat3.xyz = in_v.tangent.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat3.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.tangent.xxx + u_xlat3.xyz;
          
          u_xlat0.xzw = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.tangent.zzz + u_xlat3.xyz;
          
          u_xlat19 = dot(u_xlat0.xzw, u_xlat0.xzw);
          
          u_xlat19 = max(u_xlat19, 1.17549435e-38);
          
          u_xlat19 = inversesqrt(u_xlat19);
          
          out_v.vs_INTERP2.xyz = u_xlat0.xzw * float3(u_xlat19);
          
          out_v.vs_INTERP2.w = in_v.tangent.w;
          
          out_v.vs_INTERP3 = in_v.texcoord;
          
          u_xlatb0 = unity_OrthoParams.w==0.0;
          
          out_v.vs_INTERP4.x = (u_xlatb0) ? u_xlat1.x : unity_MatrixV[0].z;
          
          out_v.vs_INTERP4.y = (u_xlatb0) ? u_xlat1.y : unity_MatrixV[1].z;
          
          out_v.vs_INTERP4.z = (u_xlatb0) ? u_xlat1.z : unity_MatrixV[2].z;
          
          phase0_Output0_6 = float4(0.0, 0.0, 0.0, 0.0);
          
          u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
          
          u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
          
          u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
          
          u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBrArray, u_xlat16_1);
          
          u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBgArray, u_xlat16_1);
          
          u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBbArray, u_xlat16_1);
          
          u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0.y / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
          
          out_v.vs_INTERP7.xyz = u_xlat16_4.xyz;
          
          out_v.vs_INTERP8 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_INTERP9 = float4(0.0, 0.0, 0.0, 0.0);
          
          vs_CUSTOM_INSTANCE_ID0 = uint(gl_InstanceID);
          
          out_v.vs_INTERP5 = phase0_Output0_6.xy;
          
          out_v.vs_INTERP6 = phase0_Output0_6.zw;
          
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
      
      struct unity_Builtins0Array_Type 
          {
          
          float4 unity_ObjectToWorldArray[4];
          
          float4 unity_WorldToObjectArray[4];
          
          float unity_RenderingLayerArray;
      
      };
      
      uniform UnityInstancing_PerDraw0 
          {
          
          #endif
          uniform unity_Builtins0Array_Type unity_Builtins0Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      struct unity_Builtins2Array_Type 
          {
          
          float4 unity_SHArArray;
          
          float4 unity_SHAgArray;
          
          float4 unity_SHAbArray;
          
          float4 unity_SHBrArray;
          
          float4 unity_SHBgArray;
          
          float4 unity_SHBbArray;
          
          float4 unity_SHCArray;
      
      };
      
      uniform UnityInstancing_PerDraw2 
          {
          
          #endif
          uniform unity_Builtins2Array_Type unity_Builtins2Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float _Progress;
          
          uniform float2 _HeightBounds;
          
          uniform float4 _MainTex_TexelSize;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float4 _Emission;
          
          uniform float4 _BaseColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat in uint vs_CUSTOM_INSTANCE_ID0;
      
      float4 u_xlat0_d;
      
      int2 u_xlati0_d;
      
      int u_xlatb0_d;
      
      float4 u_xlat1_d;
      
      float4 u_xlat16_1_d;
      
      uint u_xlatu1;
      
      float3 u_xlat2_d;
      
      float4 u_xlat3_d;
      
      float3 u_xlat4;
      
      float4 u_xlat5;
      
      bool4 u_xlatb5;
      
      float4 u_xlat6;
      
      float4 u_xlat16_6;
      
      float3 u_xlat7;
      
      bool4 u_xlatb7;
      
      float3 u_xlat8;
      
      float3 u_xlat16_9;
      
      float u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float u_xlat16_12;
      
      float3 u_xlat16_13;
      
      float3 u_xlat16_14;
      
      float2 u_xlat16_15;
      
      float3 u_xlat16;
      
      float3 u_xlat16_17;
      
      float3 u_xlat16_18;
      
      float3 u_xlat19_d;
      
      uint u_xlatu19;
      
      bool3 u_xlatb19;
      
      float3 u_xlat20;
      
      int u_xlati20;
      
      uint u_xlatu20;
      
      int u_xlatb20;
      
      float3 u_xlat16_29;
      
      float u_xlat16_31;
      
      float3 u_xlat16_34;
      
      float u_xlat38;
      
      bool2 u_xlatb38;
      
      float u_xlat39;
      
      int u_xlati39;
      
      float2 u_xlat45;
      
      bool2 u_xlatb45;
      
      float u_xlat16_50;
      
      int u_xlati57;
      
      uint u_xlatu57;
      
      float u_xlat58;
      
      float u_xlat59;
      
      int u_xlati59;
      
      int u_xlatb59;
      
      float u_xlat60;
      
      int u_xlati60;
      
      int u_xlatb60;
      
      float u_xlat61;
      
      int u_xlati61;
      
      float u_xlat16_66;
      
      float u_xlat16_68;
      
      float u_xlat16_69;
      
      float u_xlat16_70;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlati0_d.x = int(vs_CUSTOM_INSTANCE_ID0) + unity_BaseInstanceID;
          
          u_xlati0_d.xy = u_xlati0_d.xx * int2(9, 7);
          
          u_xlat38 = in_f.vs_INTERP0.y * unity_Builtins0Array[u_xlati0_d.x / 9].unity_WorldToObjectArray[1].y;
          
          u_xlat38 = unity_Builtins0Array[u_xlati0_d.x / 9].unity_WorldToObjectArray[0].y * in_f.vs_INTERP0.x + u_xlat38;
          
          u_xlat38 = unity_Builtins0Array[u_xlati0_d.x / 9].unity_WorldToObjectArray[2].y * in_f.vs_INTERP0.z + u_xlat38;
          
          u_xlat0_d.x = u_xlat38 + unity_Builtins0Array[u_xlati0_d.x / 9].unity_WorldToObjectArray[3].y;
          
          u_xlat16_1_d.xyz = texture(_MainTex, in_f.vs_INTERP3.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1_d.xyz = u_xlat16_1_d.xyz * _BaseColor.xyz;
          
          u_xlat38 = (-_HeightBounds.xxyx.y) + _HeightBounds.xxyx.z;
          
          u_xlat38 = _Progress * u_xlat38 + _HeightBounds.xxyx.y;
          
          u_xlatb0_d = u_xlat38>=u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlatb0_d ? 1.0 : float(0.0);
          
          u_xlat2_d.xyz = u_xlat1_d.xyz * u_xlat0_d.xxx;
          
          u_xlat38 = dot(in_f.vs_INTERP1.xyz, in_f.vs_INTERP1.xyz);
          
          u_xlat38 = max(u_xlat38, 1.17549435e-38);
          
          u_xlat38 = inversesqrt(u_xlat38);
          
          u_xlat3_d.xyz = float3(u_xlat38) * in_f.vs_INTERP1.xyz;
          
          u_xlat38 = dot(in_f.vs_INTERP4.xyz, in_f.vs_INTERP4.xyz);
          
          u_xlat38 = max(u_xlat38, 1.17549435e-38);
          
          u_xlat38 = inversesqrt(u_xlat38);
          
          u_xlat4.xyz = float3(u_xlat38) * in_f.vs_INTERP4.xyz;
          
          u_xlat5.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat6.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat7.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat8.xyz = in_f.vs_INTERP0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
          
          u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
          
          u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
          
          u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
          
          u_xlatb5 = lessThan(u_xlat5, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_6.x = (u_xlatb5.x) ? float(1.0) : float(0.0);
          
          u_xlat16_6.y = (u_xlatb5.y) ? float(1.0) : float(0.0);
          
          u_xlat16_6.z = (u_xlatb5.z) ? float(1.0) : float(0.0);
          
          u_xlat16_6.w = (u_xlatb5.w) ? float(1.0) : float(0.0);
          
          u_xlat16_9.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.xyz = u_xlat16_6.yzw + u_xlat16_9.xyz;
          
          u_xlat16_6.yzw = max(u_xlat16_9.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_9.x = dot(u_xlat16_6, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_9.x = (-u_xlat16_9.x) + 4.0;
          
          u_xlatu57 = uint(u_xlat16_9.x);
          
          u_xlati57 = int(int(u_xlatu57) << 2);
          
          u_xlat5.xyz = in_f.vs_INTERP0.yyy * _MainLightWorldToShadow[(u_xlati57 + 1)].xyz;
          
          u_xlat5.xyz = _MainLightWorldToShadow[u_xlati57].xyz * in_f.vs_INTERP0.xxx + u_xlat5.xyz;
          
          u_xlat5.xyz = _MainLightWorldToShadow[(u_xlati57 + 2)].xyz * in_f.vs_INTERP0.zzz + u_xlat5.xyz;
          
          u_xlat5.xyz = u_xlat5.xyz + _MainLightWorldToShadow[(u_xlati57 + 3)].xyz;
          
          u_xlat3_d.w = 1.0;
          
          u_xlat16_9.x = dot(unity_Builtins2Array[u_xlati0_d.y / 7].unity_SHArArray, u_xlat3_d);
          
          u_xlat16_9.y = dot(unity_Builtins2Array[u_xlati0_d.y / 7].unity_SHAgArray, u_xlat3_d);
          
          u_xlat16_9.z = dot(unity_Builtins2Array[u_xlati0_d.y / 7].unity_SHAbArray, u_xlat3_d);
          
          u_xlat16_9.xyz = u_xlat16_9.xyz + in_f.vs_INTERP7.xyz;
          
          u_xlat16_9.xyz = max(u_xlat16_9.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat19_d.xz = float2(_Metallic, _Smoothness);
          
          u_xlat19_d.xz = clamp(u_xlat19_d.xz, 0.0, 1.0);
          
          u_xlat16_66 = (-u_xlat19_d.x) * 0.959999979 + 0.959999979;
          
          u_xlat16_10 = (-u_xlat16_66) + 1.0;
          
          u_xlat16_29.xyz = u_xlat2_d.xyz * float3(u_xlat16_66);
          
          u_xlat16_11.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz + float3(-0.0399999991, -0.0399999991, -0.0399999991);
          
          u_xlat16_11.xyz = u_xlat19_d.xxx * u_xlat16_11.xyz + float3(0.0399999991, 0.0399999991, 0.0399999991);
          
          u_xlat16_66 = (-u_xlat19_d.z) + 1.0;
          
          u_xlat16_68 = u_xlat16_66 * u_xlat16_66;
          
          u_xlat16_68 = max(u_xlat16_68, 0.0078125);
          
          u_xlat16_12 = u_xlat16_68 * u_xlat16_68;
          
          u_xlat16_10 = u_xlat19_d.z + u_xlat16_10;
          
          u_xlat16_10 = min(u_xlat16_10, 1.0);
          
          u_xlat16_31 = u_xlat16_68 * 4.0 + 2.0;
          
          u_xlatb0_d = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0_d)
      {
              
              u_xlat0_d.xyw = u_xlat5.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xy,u_xlat0_d.w);
              
              u_xlat16_1_d.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat0_d.xyw = u_xlat5.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat0_d.xy,u_xlat0_d.w);
              
              u_xlat16_1_d.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat0_d.xyw = u_xlat5.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat0_d.xy,u_xlat0_d.w);
              
              u_xlat16_1_d.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat0_d.xyw = u_xlat5.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat0_d.xy,u_xlat0_d.w);
              
              u_xlat16_1_d.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_50 = dot(u_xlat16_1_d, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat5.xy,u_xlat5.z);
              
              u_xlat16_50 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_50 = u_xlat16_50;
      
      }
          
          u_xlat16_69 = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_50 = u_xlat16_50 * _MainLightShadowParams.x + u_xlat16_69;
          
          u_xlatb0_d = 0.0>=u_xlat5.z;
          
          u_xlatb19.x = u_xlat5.z>=1.0;
          
          u_xlatb0_d = u_xlatb19.x || u_xlatb0_d;
          
          u_xlat16_50 = (u_xlatb0_d) ? 1.0 : u_xlat16_50;
          
          u_xlat0_d.xyw = in_f.vs_INTERP0.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xyw, u_xlat0_d.xyw);
          
          u_xlat19_d.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat19_d.x = clamp(u_xlat19_d.x, 0.0, 1.0);
          
          u_xlat16_69 = (-u_xlat16_50) + 1.0;
          
          u_xlat16_50 = u_xlat19_d.x * u_xlat16_69 + u_xlat16_50;
          
          u_xlatb19.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb19.x)
      {
              
              u_xlat19_d.xz = in_f.vs_INTERP0.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat19_d.xz = _MainLightWorldToLight[0].xy * in_f.vs_INTERP0.xx + u_xlat19_d.xz;
              
              u_xlat19_d.xz = _MainLightWorldToLight[2].xy * in_f.vs_INTERP0.zz + u_xlat19_d.xz;
              
              u_xlat19_d.xz = u_xlat19_d.xz + _MainLightWorldToLight[3].xy;
              
              u_xlat19_d.xz = u_xlat19_d.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat1_d = texture(_MainLightCookieTexture, u_xlat19_d.xz, _GlobalMipBias.x);
              
              u_xlatb19.xz = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 0.0, 1.0, 1.0)).xz;
              
              u_xlat16_69 = (u_xlatb19.z) ? u_xlat1_d.w : u_xlat1_d.x;
              
              u_xlat16_13.xyz = (u_xlatb19.x) ? u_xlat1_d.xyz : float3(u_xlat16_69);
      
      }
          else
          
              {
              
              u_xlat16_13.x = float(1.0);
              
              u_xlat16_13.y = float(1.0);
              
              u_xlat16_13.z = float(1.0);
      
      }
          
          u_xlat16_13.xyz = u_xlat16_13.xyz * _MainLightColor.xyz;
          
          u_xlat16_69 = dot((-u_xlat4.xyz), u_xlat3_d.xyz);
          
          u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
          
          u_xlat16_14.xyz = u_xlat3_d.xyz * (-float3(u_xlat16_69)) + (-u_xlat4.xyz);
          
          u_xlat16_69 = dot(u_xlat3_d.xyz, u_xlat4.xyz);
          
          u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
          
          u_xlat16_69 = (-u_xlat16_69) + 1.0;
          
          u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
          
          u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
          
          u_xlat16_70 = (-u_xlat16_66) * 0.699999988 + 1.70000005;
          
          u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
          
          u_xlat16_66 = u_xlat16_66 * 6.0;
          
          u_xlat16_1_d = textureLod(unity_SpecCube0, u_xlat16_14.xyz, u_xlat16_66);
          
          u_xlat16_66 = u_xlat16_1_d.w + -1.0;
          
          u_xlat16_66 = unity_SpecCube0_HDR.w * u_xlat16_66 + 1.0;
          
          u_xlat16_66 = max(u_xlat16_66, 0.0);
          
          u_xlat16_66 = log2(u_xlat16_66);
          
          u_xlat16_66 = u_xlat16_66 * unity_SpecCube0_HDR.y;
          
          u_xlat16_66 = exp2(u_xlat16_66);
          
          u_xlat16_66 = u_xlat16_66 * unity_SpecCube0_HDR.x;
          
          u_xlat16_14.xyz = u_xlat16_1_d.xyz * float3(u_xlat16_66);
          
          u_xlat16_15.xy = float2(u_xlat16_68) * float2(u_xlat16_68) + float2(-1.0, 1.0);
          
          u_xlat16_66 = float(1.0) / u_xlat16_15.y;
          
          u_xlat16_34.xyz = (-u_xlat16_11.xyz) + float3(u_xlat16_10);
          
          u_xlat16_34.xyz = float3(u_xlat16_69) * u_xlat16_34.xyz + u_xlat16_11.xyz;
          
          u_xlat1_d.xyz = float3(u_xlat16_66) * u_xlat16_34.xyz;
          
          u_xlat16_14.xyz = u_xlat1_d.xyz * u_xlat16_14.xyz;
          
          u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_29.xyz + u_xlat16_14.xyz;
          
          u_xlat19_d.x = u_xlat16_50 * unity_LightData.z;
          
          u_xlat16_66 = dot(u_xlat3_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
          
          u_xlat16_66 = u_xlat19_d.x * u_xlat16_66;
          
          u_xlat16_13.xyz = float3(u_xlat16_66) * u_xlat16_13.xyz;
          
          u_xlat19_d.xyz = in_f.vs_INTERP4.xyz * float3(u_xlat38) + _MainLightPosition.xyz;
          
          u_xlat1_d.x = dot(u_xlat19_d.xyz, u_xlat19_d.xyz);
          
          u_xlat1_d.x = max(u_xlat1_d.x, 1.17549435e-38);
          
          u_xlat1_d.x = inversesqrt(u_xlat1_d.x);
          
          u_xlat19_d.xyz = u_xlat19_d.xyz * u_xlat1_d.xxx;
          
          u_xlat1_d.x = dot(u_xlat3_d.xyz, u_xlat19_d.xyz);
          
          u_xlat1_d.x = clamp(u_xlat1_d.x, 0.0, 1.0);
          
          u_xlat19_d.x = dot(_MainLightPosition.xyz, u_xlat19_d.xyz);
          
          u_xlat19_d.x = clamp(u_xlat19_d.x, 0.0, 1.0);
          
          u_xlat38 = u_xlat1_d.x * u_xlat1_d.x;
          
          u_xlat38 = u_xlat38 * u_xlat16_15.x + 1.00001001;
          
          u_xlat16_66 = u_xlat19_d.x * u_xlat19_d.x;
          
          u_xlat19_d.x = u_xlat38 * u_xlat38;
          
          u_xlat38 = max(u_xlat16_66, 0.100000001);
          
          u_xlat19_d.x = u_xlat38 * u_xlat19_d.x;
          
          u_xlat19_d.x = u_xlat16_31 * u_xlat19_d.x;
          
          u_xlat19_d.x = u_xlat16_12 / u_xlat19_d.x;
          
          u_xlat16_66 = u_xlat19_d.x + -6.10351563e-05;
          
          u_xlat16_66 = max(u_xlat16_66, 0.0);
          
          u_xlat16_66 = min(u_xlat16_66, 100.0);
          
          u_xlat16_14.xyz = u_xlat16_11.xyz * float3(u_xlat16_66) + u_xlat16_29.xyz;
          
          u_xlat16_66 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu19 = uint(int(u_xlat16_66));
          
          u_xlat0_d.x = u_xlat0_d.x * _AdditionalShadowFadeParams.x + _AdditionalShadowFadeParams.y;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlatb38.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 1.0)).xy;
          
          u_xlat16_34.x = float(0.0);
          
          u_xlat16_34.y = float(0.0);
          
          u_xlat16_34.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu19 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati39 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat20.x = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati39]);
              
              u_xlati20 = int(u_xlat20.x);
              
              u_xlat2_d.xyz = (-in_f.vs_INTERP0.xyz) * _AdditionalLightsPosition[u_xlati20].www + _AdditionalLightsPosition[u_xlati20].xyz;
              
              u_xlat39 = dot(u_xlat2_d.xyz, u_xlat2_d.xyz);
              
              u_xlat39 = max(u_xlat39, 6.10351563e-05);
              
              u_xlat58 = inversesqrt(u_xlat39);
              
              u_xlat5.xyz = float3(u_xlat58) * u_xlat2_d.xyz;
              
              u_xlat59 = float(1.0) / float(u_xlat39);
              
              u_xlat39 = u_xlat39 * _AdditionalLightsAttenuation[u_xlati20].x + _AdditionalLightsAttenuation[u_xlati20].y;
              
              u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
              
              u_xlat39 = u_xlat39 * u_xlat59;
              
              u_xlat16_66 = dot(_AdditionalLightsSpotDir[u_xlati20].xyz, u_xlat5.xyz);
              
              u_xlat16_66 = u_xlat16_66 * _AdditionalLightsAttenuation[u_xlati20].z + _AdditionalLightsAttenuation[u_xlati20].w;
              
              u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
              
              u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
              
              u_xlat39 = u_xlat39 * u_xlat16_66;
              
              u_xlati59 = int(_AdditionalShadowParams[u_xlati20].w);
              
              u_xlatb60 = u_xlati59>=0;
              
              if(u_xlatb60)
      {
                  
                  u_xlatb60 = float4(0.0, 0.0, 0.0, 0.0)!=float4(_AdditionalShadowParams[u_xlati20].z);
                  
                  if(u_xlatb60)
      {
                      
                      u_xlatb7.xyz = greaterThanEqual(abs(u_xlat5.zzyz), abs(u_xlat5.xyxx)).xyz;
                      
                      u_xlatb60 = u_xlatb7.y && u_xlatb7.x;
                      
                      u_xlatb7.xyw = lessThan((-u_xlat5.zyzx), float4(0.0, 0.0, 0.0, 0.0)).xyw;
                      
                      u_xlat7.x = (u_xlatb7.x) ? float(5.0) : float(4.0);
                      
                      u_xlat7.y = (u_xlatb7.y) ? float(3.0) : float(2.0);
                      
                      u_xlat61 = u_xlatb7.w ? 1.0 : float(0.0);
                      
                      u_xlat61 = (u_xlatb7.z) ? u_xlat7.y : u_xlat61;
                      
                      u_xlat60 = (u_xlatb60) ? u_xlat7.x : u_xlat61;
                      
                      u_xlat61 = trunc(_AdditionalShadowParams[u_xlati20].w);
                      
                      u_xlat60 = u_xlat60 + u_xlat61;
                      
                      u_xlati59 = int(u_xlat60);
      
      }
                  
                  u_xlati59 = int(u_xlati59 << 2);
                  
                  u_xlat6 = in_f.vs_INTERP0.yyyy * _AdditionalLightsWorldToShadow[(u_xlati59 + 1)];
                  
                  u_xlat6 = _AdditionalLightsWorldToShadow[u_xlati59] * in_f.vs_INTERP0.xxxx + u_xlat6;
                  
                  u_xlat6 = _AdditionalLightsWorldToShadow[(u_xlati59 + 2)] * in_f.vs_INTERP0.zzzz + u_xlat6;
                  
                  u_xlat6 = u_xlat6 + _AdditionalLightsWorldToShadow[(u_xlati59 + 3)];
                  
                  u_xlat7.xyz = u_xlat6.xyz / u_xlat6.www;
                  
                  u_xlatb59 = 0.0!=_AdditionalShadowParams[u_xlati20].y;
                  
                  if(u_xlatb59)
      {
                      
                      u_xlat8.xyz = u_xlat7.xyz + _AdditionalShadowOffset0.xyz;
                      
                      float3 txVec5 = float3(u_xlat8.xy,u_xlat8.z);
                      
                      u_xlat16_6.x = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec5, 0.0);
                      
                      u_xlat8.xyz = u_xlat7.xyz + _AdditionalShadowOffset1.xyz;
                      
                      float3 txVec6 = float3(u_xlat8.xy,u_xlat8.z);
                      
                      u_xlat16_6.y = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec6, 0.0);
                      
                      u_xlat8.xyz = u_xlat7.xyz + _AdditionalShadowOffset2.xyz;
                      
                      float3 txVec7 = float3(u_xlat8.xy,u_xlat8.z);
                      
                      u_xlat16_6.z = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec7, 0.0);
                      
                      u_xlat8.xyz = u_xlat7.xyz + _AdditionalShadowOffset3.xyz;
                      
                      float3 txVec8 = float3(u_xlat8.xy,u_xlat8.z);
                      
                      u_xlat16_6.w = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec8, 0.0);
                      
                      u_xlat16_66 = dot(u_xlat16_6, float4(0.25, 0.25, 0.25, 0.25));
      
      }
                  else
                  
                      {
                      
                      float3 txVec9 = float3(u_xlat7.xy,u_xlat7.z);
                      
                      u_xlat16_66 = textureLod(hlslcc_zcmp_AdditionalLightsShadowmapTexture, txVec9, 0.0);
                      
                      u_xlat16_66 = u_xlat16_66;
      
      }
                  
                  u_xlat16_10 = 1.0 + (-_AdditionalShadowParams[u_xlati20].x);
                  
                  u_xlat16_66 = u_xlat16_66 * _AdditionalShadowParams[u_xlati20].x + u_xlat16_10;
                  
                  u_xlatb59 = 0.0>=u_xlat7.z;
                  
                  u_xlatb60 = u_xlat7.z>=1.0;
                  
                  u_xlatb59 = u_xlatb59 || u_xlatb60;
                  
                  u_xlat16_66 = (u_xlatb59) ? 1.0 : u_xlat16_66;
      
      }
              else
              
                  {
                  
                  u_xlat16_66 = 1.0;
      
      }
              
              u_xlat16_10 = (-u_xlat16_66) + 1.0;
              
              u_xlat16_66 = u_xlat0_d.x * u_xlat16_10 + u_xlat16_66;
              
              u_xlati59 = int(1 << u_xlati20);
              
              u_xlati59 = int(uint(uint(u_xlati59) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati59 != 0)
      {
                  
                  u_xlati59 = int(_AdditionalLightsLightTypes[u_xlati20]);
                  
                  u_xlati60 = (u_xlati59 != 0) ? 0 : 1;
                  
                  u_xlati61 = int(u_xlati20 << 2);
                  
                  if(u_xlati60 != 0)
      {
                      
                      u_xlat7.xyz = in_f.vs_INTERP0.yyy * _AdditionalLightsWorldToLights[(u_xlati61 + 1)].xyw;
                      
                      u_xlat7.xyz = _AdditionalLightsWorldToLights[u_xlati61].xyw * in_f.vs_INTERP0.xxx + u_xlat7.xyz;
                      
                      u_xlat7.xyz = _AdditionalLightsWorldToLights[(u_xlati61 + 2)].xyw * in_f.vs_INTERP0.zzz + u_xlat7.xyz;
                      
                      u_xlat7.xyz = u_xlat7.xyz + _AdditionalLightsWorldToLights[(u_xlati61 + 3)].xyw;
                      
                      u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
                      
                      u_xlat7.xy = u_xlat7.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
                      
                      u_xlat7.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati20].xy * u_xlat7.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati20].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb59 = u_xlati59==1;
                      
                      u_xlati59 = u_xlatb59 ? 1 : int(0);
                      
                      if(u_xlati59 != 0)
      {
                          
                          u_xlat45.xy = in_f.vs_INTERP0.yy * _AdditionalLightsWorldToLights[(u_xlati61 + 1)].xy;
                          
                          u_xlat45.xy = _AdditionalLightsWorldToLights[u_xlati61].xy * in_f.vs_INTERP0.xx + u_xlat45.xy;
                          
                          u_xlat45.xy = _AdditionalLightsWorldToLights[(u_xlati61 + 2)].xy * in_f.vs_INTERP0.zz + u_xlat45.xy;
                          
                          u_xlat45.xy = u_xlat45.xy + _AdditionalLightsWorldToLights[(u_xlati61 + 3)].xy;
                          
                          u_xlat45.xy = u_xlat45.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat45.xy = fract(u_xlat45.xy);
                          
                          u_xlat7.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati20].xy * u_xlat45.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati20].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat6 = in_f.vs_INTERP0.yyyy * _AdditionalLightsWorldToLights[(u_xlati61 + 1)];
                          
                          u_xlat6 = _AdditionalLightsWorldToLights[u_xlati61] * in_f.vs_INTERP0.xxxx + u_xlat6;
                          
                          u_xlat6 = _AdditionalLightsWorldToLights[(u_xlati61 + 2)] * in_f.vs_INTERP0.zzzz + u_xlat6;
                          
                          u_xlat6 = u_xlat6 + _AdditionalLightsWorldToLights[(u_xlati61 + 3)];
                          
                          u_xlat8.xyz = u_xlat6.xyz / u_xlat6.www;
                          
                          u_xlat59 = dot(u_xlat8.xyz, u_xlat8.xyz);
                          
                          u_xlat59 = inversesqrt(u_xlat59);
                          
                          u_xlat8.xyz = float3(u_xlat59) * u_xlat8.xyz;
                          
                          u_xlat59 = dot(abs(u_xlat8.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat59 = max(u_xlat59, 9.99999997e-07);
                          
                          u_xlat59 = float(1.0) / float(u_xlat59);
                          
                          u_xlat16.xyz = float3(u_xlat59) * u_xlat8.zxy;
                          
                          u_xlat16.x = (-u_xlat16.x);
                          
                          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
                          
                          u_xlatb45.xy = greaterThanEqual(u_xlat16.yzyz, float4(0.0, 0.0, 0.0, 0.0)).xy;
                          
                          u_xlat45.x = (u_xlatb45.x) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat45.y = (u_xlatb45.y) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat45.xy = u_xlat8.xy * float2(u_xlat59) + u_xlat45.xy;
                          
                          u_xlat45.xy = u_xlat45.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat45.xy = clamp(u_xlat45.xy, 0.0, 1.0);
                          
                          u_xlat7.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati20].xy * u_xlat45.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati20].zw;
      
      }
      
      }
                  
                  u_xlat6 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat7.xy, _GlobalMipBias.x);
                  
                  u_xlat16_10 = (u_xlatb38.y) ? u_xlat6.w : u_xlat6.x;
                  
                  u_xlat16_17.xyz = (u_xlatb38.x) ? u_xlat6.xyz : float3(u_xlat16_10);
      
      }
              else
              
                  {
                  
                  u_xlat16_17.x = float(1.0);
                  
                  u_xlat16_17.y = float(1.0);
                  
                  u_xlat16_17.z = float(1.0);
      
      }
              
              u_xlat16_17.xyz = u_xlat16_17.xyz * _AdditionalLightsColor[u_xlati20].xyz;
              
              u_xlat20.x = u_xlat39 * u_xlat16_66;
              
              u_xlat16_66 = dot(u_xlat3_d.xyz, u_xlat5.xyz);
              
              u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
              
              u_xlat16_66 = u_xlat20.x * u_xlat16_66;
              
              u_xlat16_17.xyz = float3(u_xlat16_66) * u_xlat16_17.xyz;
              
              u_xlat20.xyz = u_xlat2_d.xyz * float3(u_xlat58) + u_xlat4.xyz;
              
              u_xlat2_d.x = dot(u_xlat20.xyz, u_xlat20.xyz);
              
              u_xlat2_d.x = max(u_xlat2_d.x, 1.17549435e-38);
              
              u_xlat2_d.x = inversesqrt(u_xlat2_d.x);
              
              u_xlat20.xyz = u_xlat20.xyz * u_xlat2_d.xxx;
              
              u_xlat2_d.x = dot(u_xlat3_d.xyz, u_xlat20.xyz);
              
              u_xlat2_d.x = clamp(u_xlat2_d.x, 0.0, 1.0);
              
              u_xlat20.x = dot(u_xlat5.xyz, u_xlat20.xyz);
              
              u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
              
              u_xlat39 = u_xlat2_d.x * u_xlat2_d.x;
              
              u_xlat39 = u_xlat39 * u_xlat16_15.x + 1.00001001;
              
              u_xlat16_66 = u_xlat20.x * u_xlat20.x;
              
              u_xlat20.x = u_xlat39 * u_xlat39;
              
              u_xlat39 = max(u_xlat16_66, 0.100000001);
              
              u_xlat20.x = u_xlat39 * u_xlat20.x;
              
              u_xlat20.x = u_xlat16_31 * u_xlat20.x;
              
              u_xlat20.x = u_xlat16_12 / u_xlat20.x;
              
              u_xlat16_66 = u_xlat20.x + -6.10351563e-05;
              
              u_xlat16_66 = max(u_xlat16_66, 0.0);
              
              u_xlat16_66 = min(u_xlat16_66, 100.0);
              
              u_xlat16_18.xyz = u_xlat16_11.xyz * float3(u_xlat16_66) + u_xlat16_29.xyz;
              
              u_xlat16_34.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + u_xlat16_34.xyz;
      
      }
          
          u_xlat16_9.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + u_xlat16_9.xyz;
          
          u_xlat16_9.xyz = u_xlat16_34.xyz + u_xlat16_9.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat16_9.xyz + _Emission.xyz;
          
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
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 texcoord : TEXCOORD0;
      
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
          
          float4 vs_INTERP1 : INTERP1;
      
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
          
          out_v.vs_INTERP1 = in_v.texcoord;
          
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float _Progress;
          
          uniform float2 _HeightBounds;
          
          uniform float4 _MainTex_TexelSize;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float4 _Emission;
          
          uniform float4 _BaseColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      int u_xlatb0;
      
      float3 u_xlat1_d;
      
      float3 u_xlat16_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = in_f.vs_INTERP0.y * unity_WorldToObject[1].y;
          
          u_xlat0_d.x = unity_WorldToObject[0].y * in_f.vs_INTERP0.x + u_xlat0_d.x;
          
          u_xlat0_d.x = unity_WorldToObject[2].y * in_f.vs_INTERP0.z + u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat0_d.x + unity_WorldToObject[3].y;
          
          u_xlat1_d.x = (-_HeightBounds.xxyx.y) + _HeightBounds.xxyx.z;
          
          u_xlat1_d.x = _Progress * u_xlat1_d.x + _HeightBounds.xxyx.y;
          
          u_xlatb0 = u_xlat1_d.x>=u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlatb0 ? 1.0 : float(0.0);
          
          u_xlat16_1.xyz = texture(_MainTex, in_f.vs_INTERP1.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1_d.xyz = u_xlat16_1.xyz * _BaseColor.xyz;
          
          u_xlat0_d.xyz = u_xlat1_d.xyz * u_xlat0_d.xxx;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
