// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/ScrewShaderTest"
{
  Properties
  {
    [NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
    _MainColor ("MainColor", Color) = (1,1,1,1)
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
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _MainTex_TexelSize;
          
          uniform float4 _MainColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      bool3 u_xlatb1;
      
      float3 u_xlat2;
      
      float3 u_xlat3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.vs_INTERP1.xy, _GlobalMipBias.x);
          
          u_xlatb1.xyz = lessThan(_MainColor.xyzx, float4(0.5, 0.5, 0.5, 0.0)).xyz;
          
          u_xlat2.xyz = _MainColor.xyz * float3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
          
          u_xlat2.xyz = u_xlat2.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat3.xyz = _MainColor.xyz + float3(-0.5, -0.5, -0.5);
          
          u_xlat3.xyz = u_xlat3.xyz * float3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
          
          u_xlat3.xyz = min(u_xlat3.xyz, float3(1.0, 1.0, 1.0));
          
          u_xlat16_0.x = (u_xlatb1.x) ? u_xlat2.x : u_xlat3.x;
          
          u_xlat16_0.y = (u_xlatb1.y) ? u_xlat2.y : u_xlat3.y;
          
          u_xlat16_0.z = (u_xlatb1.z) ? u_xlat2.z : u_xlat3.z;
          
          u_xlat0_d = u_xlat16_0 * in_f.vs_INTERP2;
          
          u_xlatb1.x = u_xlat0_d.w==0.0;
          
          if(u_xlatb1.x)
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
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vs_INTERP2 : INTERP2;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
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
          
          out_v.vs_INTERP0.x = unity_MatrixV[0].z;
          
          out_v.vs_INTERP0.y = unity_MatrixV[1].z;
          
          out_v.vs_INTERP0.z = unity_MatrixV[2].z;
          
          u_xlat0.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP1.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.vs_INTERP1.w = in_v.tangent.w;
          
          out_v.vs_INTERP2 = in_v.texcoord;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat16_0;
      
      float u_xlat16_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0.xyz = in_f.vs_INTERP0.xyz + float3(1.0, 1.0, 1.0);
          
          out_f.SV_TARGET0.xyz = u_xlat16_0.xyz * float3(0.5, 0.5, 0.5);
          
          u_xlat16_1 = texture(_MainTex, in_f.vs_INTERP2.xy, _GlobalMipBias.x).w;
          
          out_f.SV_TARGET0.w = u_xlat16_1;
          
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
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _MainTex_TexelSize;
          
          uniform float4 _MainColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      bool3 u_xlatb0;
      
      float4 u_xlat16_1;
      
      float3 u_xlat2;
      
      float3 u_xlat3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlatb0.xyz = lessThan(_MainColor.xyzx, float4(0.5, 0.5, 0.5, 0.0)).xyz;
          
          u_xlat16_1 = texture(_MainTex, in_f.vs_INTERP1.xy, _GlobalMipBias.x);
          
          u_xlat2.xyz = _MainColor.xyz * float3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
          
          u_xlat2.xyz = u_xlat2.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat3.xyz = _MainColor.xyz + float3(-0.5, -0.5, -0.5);
          
          u_xlat3.xyz = u_xlat3.xyz * float3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
          
          u_xlat3.xyz = min(u_xlat3.xyz, float3(1.0, 1.0, 1.0));
          
          u_xlat16_1.x = (u_xlatb0.x) ? u_xlat2.x : u_xlat3.x;
          
          u_xlat16_1.y = (u_xlatb0.y) ? u_xlat2.y : u_xlat3.y;
          
          u_xlat16_1.z = (u_xlatb0.z) ? u_xlat2.z : u_xlat3.z;
          
          u_xlat0_d = u_xlat16_1 * in_f.vs_INTERP2;
          
          out_f.SV_TARGET0 = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
