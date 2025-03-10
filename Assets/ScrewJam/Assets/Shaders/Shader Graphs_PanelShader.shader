// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/PanelShader"
{
  Properties
  {
    _MainColor ("MainColor", Color) = (0.8396226,0.2653524,0.2653524,0.2509804)
    [NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
    _AeroTex ("AeroTex", 2D) = "white" {}
    _AeroOffset ("AeroOffset", Vector) = (0,0,0,0)
    _AeroMultiplier ("AeroMultiplier", float) = 1
    _BreakTexture ("BreakTexture", 2D) = "white" {}
    _BreakPosition ("BreakPosition", Vector) = (0,0,0,0)
    _BreakScale ("BreakScale", float) = 0.85
    _BreakOpacity ("BreakOpacity", Range(0, 1)) = 1
    unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
    unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
    unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
  }
  SubShader
  {
    Tags
    { 
      "QUEUE" = "Transparent"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Transparent"
      "ShaderGraphShader" = "true"
      "ShaderGraphTargetId" = ""
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: Sprite Lit
    {
      Name "Sprite Lit"
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = ""
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ProjectionParams;
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _RendererColor;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _MainTex;
      
      uniform sampler2D _AeroTex;
      
      uniform sampler2D _BreakTexture;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 texcoord : TEXCOORD0;
          
          float4 color : COLOR0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP3 : INTERP3;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
      
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
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vs_INTERP0.xyz = u_xlat0.xyz;
          
          u_xlat0 = u_xlat1 + unity_MatrixVP[3];
          
          out_v.vertex = u_xlat0;
          
          out_v.vs_INTERP1 = in_v.texcoord;
          
          out_v.vs_INTERP2 = in_v.color * _RendererColor;
          
          u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
          
          u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
          
          out_v.vs_INTERP3.zw = u_xlat0.zw;
          
          out_v.vs_INTERP3.xy = u_xlat1.zz + u_xlat1.xw;
          
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
          uniform float4 _MainTex_TexelSize;
          
          uniform float4 _AeroTex_TexelSize;
          
          uniform float4 _AeroTex_ST;
          
          uniform float _AeroMultiplier;
          
          uniform float4 _MainColor;
          
          uniform float2 _AeroOffset;
          
          uniform float4 _BreakTexture_TexelSize;
          
          uniform float4 _BreakTexture_ST;
          
          uniform float _BreakOpacity;
          
          uniform float2 _BreakPosition;
          
          uniform float _BreakScale;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      float u_xlat16_0;
      
      float3 u_xlat1_d;
      
      float4 u_xlat16_1;
      
      int u_xlatb1;
      
      float4 u_xlat16_2;
      
      float3 u_xlat3;
      
      int u_xlatb3;
      
      float3 u_xlat4;
      
      float u_xlat6;
      
      int u_xlatb6;
      
      float2 u_xlat8;
      
      float u_xlat10;
      
      int u_xlatb10;
      
      float u_xlat12;
      
      int u_xlatb12;
      
      float u_xlat13;
      
      int u_xlatb13;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.vs_INTERP0.yy * unity_WorldToObject[1].xy;
          
          u_xlat0_d.xy = unity_WorldToObject[0].xy * in_f.vs_INTERP0.xx + u_xlat0_d.xy;
          
          u_xlat0_d.xy = unity_WorldToObject[2].xy * in_f.vs_INTERP0.zz + u_xlat0_d.xy;
          
          u_xlat0_d.xy = u_xlat0_d.xy + unity_WorldToObject[3].xy;
          
          u_xlat8.xy = in_f.vs_INTERP0.xy + _AeroOffset.xy;
          
          u_xlat8.xy = u_xlat8.xy * _AeroTex_ST.xy + _AeroTex_ST.zw;
          
          u_xlat16_1 = texture(_AeroTex, u_xlat8.xy, _GlobalMipBias.x);
          
          u_xlat1_d.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz * float3(_AeroMultiplier);
          
          u_xlat16_2 = texture(_MainTex, in_f.vs_INTERP1.xy, _GlobalMipBias.x);
          
          u_xlat3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz * u_xlat16_2.xxx + u_xlat3.xyz;
          
          u_xlat3.xyz = (-u_xlat16_2.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat1_d.xyz = u_xlat3.xyz * u_xlat16_2.www + u_xlat1_d.xyz;
          
          u_xlat0_d.xy = u_xlat0_d.xy + (-float2(_BreakPosition.x, _BreakPosition.y));
          
          u_xlat8.xy = u_xlat0_d.xy + float2(0.5, 0.5);
          
          u_xlat8.xy = u_xlat8.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlatb13 = _BreakScale==0.0;
          
          u_xlat13 = u_xlatb13 ? 9.99999997e-07 : float(0.0);
          
          u_xlat13 = u_xlat13 + _BreakScale;
          
          u_xlat8.xy = u_xlat8.xy / float2(u_xlat13);
          
          u_xlat8.xy = u_xlat8.xy * float2(1.01542664, 1.01542664);
          
          u_xlat13 = min(abs(u_xlat8.x), abs(u_xlat8.y));
          
          u_xlat6 = max(abs(u_xlat8.x), abs(u_xlat8.y));
          
          u_xlat6 = float(1.0) / u_xlat6;
          
          u_xlat13 = u_xlat13 * u_xlat6;
          
          u_xlat6 = u_xlat13 * u_xlat13;
          
          u_xlat10 = u_xlat6 * 0.0208350997 + -0.0851330012;
          
          u_xlat10 = u_xlat6 * u_xlat10 + 0.180141002;
          
          u_xlat10 = u_xlat6 * u_xlat10 + -0.330299497;
          
          u_xlat6 = u_xlat6 * u_xlat10 + 0.999866009;
          
          u_xlat10 = u_xlat13 * u_xlat6;
          
          u_xlatb3 = abs(u_xlat8.x)<abs(u_xlat8.y);
          
          u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
          
          u_xlat10 = u_xlatb3 ? u_xlat10 : float(0.0);
          
          u_xlat13 = u_xlat13 * u_xlat6 + u_xlat10;
          
          u_xlatb6 = u_xlat8.x<(-u_xlat8.x);
          
          u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
          
          u_xlat13 = u_xlat13 + u_xlat6;
          
          u_xlat6 = min(u_xlat8.x, u_xlat8.y);
          
          u_xlat10 = max(u_xlat8.x, u_xlat8.y);
          
          u_xlatb6 = u_xlat6<(-u_xlat6);
          
          u_xlatb10 = u_xlat10>=(-u_xlat10);
          
          u_xlatb6 = u_xlatb10 && u_xlatb6;
          
          u_xlat13 = (u_xlatb6) ? (-u_xlat13) : u_xlat13;
          
          u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
          
          u_xlat8.x = sqrt(u_xlat8.x);
          
          u_xlat12 = u_xlat13 + 8.02851486;
          
          u_xlat12 = u_xlat12 * 2.86478877;
          
          u_xlatb13 = u_xlat12>=(-u_xlat12);
          
          u_xlat12 = fract(u_xlat12);
          
          u_xlat12 = (u_xlatb13) ? u_xlat12 : (-u_xlat12);
          
          u_xlat12 = u_xlat12 * 0.34906587 + -0.174532935;
          
          u_xlat13 = cos(abs(u_xlat12));
          
          u_xlat6 = u_xlat8.x * u_xlat13;
          
          u_xlat10 = abs(u_xlat12) + -0.174532756;
          
          u_xlat10 = (-u_xlat10) * 5729578.0 + 1.0;
          
          u_xlat10 = (-u_xlat10) * 0.174532935 + 3.14159274;
          
          u_xlat10 = cos(u_xlat10);
          
          u_xlat10 = (-u_xlat10) * 2.17886668e-06 + 1.03108883;
          
          u_xlat10 = sqrt(u_xlat10);
          
          u_xlat12 = -abs(u_xlat12) + 0.174532935;
          
          u_xlatb12 = u_xlat12<1.74532929e-07;
          
          u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
          
          u_xlat10 = u_xlat8.x / u_xlat10;
          
          u_xlat8.x = (-u_xlat13) * u_xlat8.x + u_xlat10;
          
          u_xlat8.x = u_xlat12 * u_xlat8.x + u_xlat6;
          
          u_xlat12 = (-u_xlat8.x) + 1.0;
          
          u_xlat13 = dFdx(u_xlat8.x);
          
          u_xlat8.x = dFdy(u_xlat8.x);
          
          u_xlat8.x = abs(u_xlat8.x) + abs(u_xlat13);
          
          u_xlat8.x = u_xlat12 / u_xlat8.x;
          
          u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
          
          u_xlat0_d.xy = u_xlat0_d.xy * _BreakTexture_ST.xy + _BreakTexture_ST.zw;
          
          u_xlat16_0 = texture(_BreakTexture, u_xlat0_d.xy, _GlobalMipBias.x).w;
          
          u_xlat0_d.x = (-u_xlat8.x) * u_xlat16_0 + 1.0;
          
          u_xlat4.xyz = (-u_xlat1_d.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat0_d.xyz = (-u_xlat0_d.xxx) * u_xlat4.xyz + (-u_xlat1_d.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + float3(1.0, 1.0, 1.0);
          
          u_xlat0_d.xyz = float3(_BreakOpacity) * u_xlat0_d.xyz + u_xlat1_d.xyz;
          
          u_xlat1_d.x = (-u_xlat16_2.x) + u_xlat16_2.w;
          
          u_xlat0_d.w = _MainColor.w * u_xlat16_2.w + u_xlat1_d.x;
          
          u_xlat0_d = u_xlat0_d * in_f.vs_INTERP2;
          
          u_xlatb1 = u_xlat0_d.w==0.0;
          
          if(u_xlatb1)
      {
              discard;
      }
          
          out_f.SV_TARGET0 = max(u_xlat0_d, float4(0.0, 0.0, 0.0, 0.0));
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Sprite Normal
    {
      Name "Sprite Normal"
      Tags
      { 
        "LIGHTMODE" = "NormalsRendering"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = ""
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 tangent : TANGENT0;
          
          float4 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP3 : INTERP3;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP3 : INTERP3;
      
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
      
      float u_xlat6;
      
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
          
          out_v.vs_INTERP1.x = unity_MatrixV[0].z;
          
          out_v.vs_INTERP1.y = unity_MatrixV[1].z;
          
          out_v.vs_INTERP1.z = unity_MatrixV[2].z;
          
          u_xlat0.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP2.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.vs_INTERP2.w = in_v.tangent.w;
          
          out_v.vs_INTERP3 = in_v.texcoord;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _MainTex_TexelSize;
          
          uniform float4 _AeroTex_TexelSize;
          
          uniform float4 _AeroTex_ST;
          
          uniform float _AeroMultiplier;
          
          uniform float4 _MainColor;
          
          uniform float2 _AeroOffset;
          
          uniform float4 _BreakTexture_TexelSize;
          
          uniform float4 _BreakTexture_ST;
          
          uniform float _BreakOpacity;
          
          uniform float2 _BreakPosition;
          
          uniform float _BreakScale;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float u_xlat0_d;
      
      float2 u_xlat16_0;
      
      float3 u_xlat16_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0.xy = texture(_MainTex, in_f.vs_INTERP3.xy, _GlobalMipBias.x).xw;
          
          u_xlat0_d = (-u_xlat16_0.x) + u_xlat16_0.y;
          
          u_xlat0_d = _MainColor.w * u_xlat16_0.y + u_xlat0_d;
          
          out_f.SV_TARGET0.w = u_xlat0_d;
          
          u_xlat16_1.xyz = in_f.vs_INTERP1.xyz + float3(1.0, 1.0, 1.0);
          
          out_f.SV_TARGET0.xyz = u_xlat16_1.xyz * float3(0.5, 0.5, 0.5);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Sprite Forward
    {
      Name "Sprite Forward"
      Tags
      { 
        "LIGHTMODE" = "UniversalForward"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = ""
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _RendererColor;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _MainTex;
      
      uniform sampler2D _AeroTex;
      
      uniform sampler2D _BreakTexture;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 texcoord : TEXCOORD0;
          
          float4 color : COLOR0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
      
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
          
          out_v.vs_INTERP2 = in_v.color * _RendererColor;
          
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
          uniform float4 _MainTex_TexelSize;
          
          uniform float4 _AeroTex_TexelSize;
          
          uniform float4 _AeroTex_ST;
          
          uniform float _AeroMultiplier;
          
          uniform float4 _MainColor;
          
          uniform float2 _AeroOffset;
          
          uniform float4 _BreakTexture_TexelSize;
          
          uniform float4 _BreakTexture_ST;
          
          uniform float _BreakOpacity;
          
          uniform float2 _BreakPosition;
          
          uniform float _BreakScale;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      float u_xlat16_0;
      
      float u_xlat1_d;
      
      float4 u_xlat16_1;
      
      int u_xlatb1;
      
      float3 u_xlat2;
      
      float3 u_xlat3;
      
      float u_xlat4;
      
      float2 u_xlat6;
      
      int u_xlatb6;
      
      int u_xlatb7;
      
      float u_xlat9;
      
      int u_xlatb9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.vs_INTERP0.yy * unity_WorldToObject[1].xy;
          
          u_xlat0_d.xy = unity_WorldToObject[0].xy * in_f.vs_INTERP0.xx + u_xlat0_d.xy;
          
          u_xlat0_d.xy = unity_WorldToObject[2].xy * in_f.vs_INTERP0.zz + u_xlat0_d.xy;
          
          u_xlat0_d.xy = u_xlat0_d.xy + unity_WorldToObject[3].xy;
          
          u_xlat0_d.xy = u_xlat0_d.xy + (-float2(_BreakPosition.x, _BreakPosition.y));
          
          u_xlat6.xy = u_xlat0_d.xy + float2(0.5, 0.5);
          
          u_xlat0_d.xy = u_xlat0_d.xy * _BreakTexture_ST.xy + _BreakTexture_ST.zw;
          
          u_xlat16_0 = texture(_BreakTexture, u_xlat0_d.xy, _GlobalMipBias.x).w;
          
          u_xlat3.xy = u_xlat6.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlatb9 = _BreakScale==0.0;
          
          u_xlat9 = u_xlatb9 ? 9.99999997e-07 : float(0.0);
          
          u_xlat9 = u_xlat9 + _BreakScale;
          
          u_xlat3.xy = u_xlat3.xy / float2(u_xlat9);
          
          u_xlat3.xy = u_xlat3.xy * float2(1.01542664, 1.01542664);
          
          u_xlat9 = max(abs(u_xlat3.x), abs(u_xlat3.y));
          
          u_xlat9 = float(1.0) / u_xlat9;
          
          u_xlat1_d = min(abs(u_xlat3.x), abs(u_xlat3.y));
          
          u_xlat9 = u_xlat9 * u_xlat1_d;
          
          u_xlat1_d = u_xlat9 * u_xlat9;
          
          u_xlat4 = u_xlat1_d * 0.0208350997 + -0.0851330012;
          
          u_xlat4 = u_xlat1_d * u_xlat4 + 0.180141002;
          
          u_xlat4 = u_xlat1_d * u_xlat4 + -0.330299497;
          
          u_xlat1_d = u_xlat1_d * u_xlat4 + 0.999866009;
          
          u_xlat4 = u_xlat9 * u_xlat1_d;
          
          u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
          
          u_xlatb7 = abs(u_xlat3.x)<abs(u_xlat3.y);
          
          u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
          
          u_xlat9 = u_xlat9 * u_xlat1_d + u_xlat4;
          
          u_xlatb1 = u_xlat3.x<(-u_xlat3.x);
          
          u_xlat1_d = u_xlatb1 ? -3.14159274 : float(0.0);
          
          u_xlat9 = u_xlat9 + u_xlat1_d;
          
          u_xlat1_d = min(u_xlat3.x, u_xlat3.y);
          
          u_xlatb1 = u_xlat1_d<(-u_xlat1_d);
          
          u_xlat4 = max(u_xlat3.x, u_xlat3.y);
          
          u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
          
          u_xlatb6 = u_xlat4>=(-u_xlat4);
          
          u_xlatb6 = u_xlatb6 && u_xlatb1;
          
          u_xlat6.x = (u_xlatb6) ? (-u_xlat9) : u_xlat9;
          
          u_xlat6.x = u_xlat6.x + 8.02851486;
          
          u_xlat6.x = u_xlat6.x * 2.86478877;
          
          u_xlatb9 = u_xlat6.x>=(-u_xlat6.x);
          
          u_xlat6.x = fract(u_xlat6.x);
          
          u_xlat6.x = (u_xlatb9) ? u_xlat6.x : (-u_xlat6.x);
          
          u_xlat6.x = u_xlat6.x * 0.34906587 + -0.174532935;
          
          u_xlat9 = abs(u_xlat6.x) + -0.174532756;
          
          u_xlat9 = (-u_xlat9) * 5729578.0 + 1.0;
          
          u_xlat9 = (-u_xlat9) * 0.174532935 + 3.14159274;
          
          u_xlat9 = cos(u_xlat9);
          
          u_xlat3.z = (-u_xlat9) * 2.17886668e-06 + 1.03108883;
          
          u_xlat3.xz = sqrt(u_xlat3.xz);
          
          u_xlat9 = u_xlat3.x / u_xlat3.z;
          
          u_xlat1_d = cos(abs(u_xlat6.x));
          
          u_xlat6.x = -abs(u_xlat6.x) + 0.174532935;
          
          u_xlatb6 = u_xlat6.x<1.74532929e-07;
          
          u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
          
          u_xlat9 = (-u_xlat1_d) * u_xlat3.x + u_xlat9;
          
          u_xlat3.x = u_xlat3.x * u_xlat1_d;
          
          u_xlat3.x = u_xlat6.x * u_xlat9 + u_xlat3.x;
          
          u_xlat6.x = dFdx(u_xlat3.x);
          
          u_xlat9 = dFdy(u_xlat3.x);
          
          u_xlat3.x = (-u_xlat3.x) + 1.0;
          
          u_xlat6.x = abs(u_xlat9) + abs(u_xlat6.x);
          
          u_xlat3.x = u_xlat3.x / u_xlat6.x;
          
          u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
          
          u_xlat0_d.x = (-u_xlat3.x) * u_xlat16_0 + 1.0;
          
          u_xlat3.xy = in_f.vs_INTERP0.xy + _AeroOffset.xy;
          
          u_xlat3.xy = u_xlat3.xy * _AeroTex_ST.xy + _AeroTex_ST.zw;
          
          u_xlat16_1 = texture(_AeroTex, u_xlat3.xy, _GlobalMipBias.x);
          
          u_xlat3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
          
          u_xlat3.xyz = u_xlat3.xyz * float3(_AeroMultiplier);
          
          u_xlat16_1 = texture(_MainTex, in_f.vs_INTERP1.xy, _GlobalMipBias.x);
          
          u_xlat2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
          
          u_xlat3.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
          
          u_xlat2.xyz = (-u_xlat16_1.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat3.xyz = u_xlat2.xyz * u_xlat16_1.www + u_xlat3.xyz;
          
          u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat2.xyz = (-u_xlat0_d.xxx) * u_xlat2.xyz + (-u_xlat3.xyz);
          
          u_xlat2.xyz = u_xlat2.xyz + float3(1.0, 1.0, 1.0);
          
          u_xlat0_d.xyz = float3(_BreakOpacity) * u_xlat2.xyz + u_xlat3.xyz;
          
          u_xlat1_d = (-u_xlat16_1.x) + u_xlat16_1.w;
          
          u_xlat0_d.w = _MainColor.w * u_xlat16_1.w + u_xlat1_d;
          
          u_xlat0_d = u_xlat0_d * in_f.vs_INTERP2;
          
          out_f.SV_TARGET0 = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
