// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/ScreenSpaceShadows"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
    }
    Pass // ind: 1, name: ScreenSpaceShadows
    {
      Name "ScreenSpaceShadows"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile unity_MatrixInvVP
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 unity_MatrixInvVP[4];
      
      uniform float4 _MainLightWorldToShadow[20];
      
      uniform float4 _MainLightShadowParams;
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _CameraDepthTexture;
      
      
      
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
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
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
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float u_xlat16_0;
      
      float4 u_xlat1_d;
      
      int u_xlatb1;
      
      float u_xlat16_2;
      
      int u_xlatb3;
      
      int u_xlatb9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat1_d = u_xlat0_d.yyyy * unity_MatrixInvVP[1];
          
          u_xlat0_d = unity_MatrixInvVP[0] * u_xlat0_d.xxxx + u_xlat1_d;
          
          u_xlat1_d.x = texture(_CameraDepthTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat1_d.x = u_xlat1_d.x * 2.0 + -1.0;
          
          u_xlat0_d = unity_MatrixInvVP[2] * u_xlat1_d.xxxx + u_xlat0_d;
          
          u_xlat0_d = u_xlat0_d + unity_MatrixInvVP[3];
          
          u_xlat0_d.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * _MainLightWorldToShadow[1].xyz;
          
          u_xlat0_d.xyw = _MainLightWorldToShadow[0].xyz * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = _MainLightWorldToShadow[2].xyz * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + _MainLightWorldToShadow[3].xyz;
          
          u_xlatb9 = 0.0>=u_xlat0_d.z;
          
          u_xlatb1 = u_xlat0_d.z>=1.0;
          
          float3 txVec0 = float3(u_xlat0_d.xy,u_xlat0_d.z);
          
          u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
          
          u_xlatb3 = u_xlatb9 || u_xlatb1;
          
          u_xlat16_2 = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_2 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_2;
          
          out_f.color = (int(u_xlatb3)) ? float4(1.0, 1.0, 1.0, 1.0) : float4(u_xlat16_2);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
