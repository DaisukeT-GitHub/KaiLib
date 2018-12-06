//
//  KaiGLFragmentShader.m
//  KaiLib
//

#import "KaiGLFragmentShader.h"

@implementation KaiGLFragmentShader

/**
 * @brief 基本のシェーダ
 */
+ (NSString *)basic
{
	return SHADER_STRING(
						 precision highp float;

						 varying highp vec4 varyingColor;

						 void main()
						 {
							 gl_FragColor = varyingColor;
						 }
						 );
}

/**
 * @brief 基本のシェーダ(テクスチャ使用)
 */
+ (NSString *)basicTexture
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform vec2 iResolution;
						 uniform float iGlobalTime;
						 
						 varying highp vec2 uv;
						 
						 void main()
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;
							 
							 gl_FragColor = texture2D(videoInput, uv);
						 }
						 );
}


/**
 * @brief 色反転
 */
+ (NSString *)invertColor
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform vec2 iResolution;
						 uniform float iGlobalTime;
						 
						 varying highp vec2 uv;

						 void main()
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;

							 vec4 sampleColor  = texture2D(videoInput, uv);
							 gl_FragColor = vec4(1.0 - sampleColor.x,
												 1.0 - sampleColor.y,
												 1.0 - sampleColor.z,
												 1.0);
						 }
						 );
}

/**
 * @brief グレースケール
 */
+ (NSString *)grayScale
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform vec2 iResolution;
						 uniform float iGlobalTime;
						 
						 varying vec2 uv;

						 const vec3 monochromeScale = vec3(0.298912, 0.586611, 0.114478);
						 
						 void main(void)
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;

							 vec4 sampleColor  = texture2D(videoInput, uv);
							 float grayColor = dot(sampleColor.rgb, monochromeScale);
							 sampleColor = vec4(vec3(grayColor), 1.0);
							 gl_FragColor = sampleColor;
						 }
						 );
}

/**
 * @brief セピア
 */
+ (NSString *)sepia
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform vec2 iResolution;
						 uniform float iGlobalTime;
						 
						 varying vec2 uv;

						 const vec3 monochromeScale = vec3(0.298912, 0.586611, 0.114478);
						 const vec3 sepiaScale = vec3(1.07, 0.74, 0.43);
						 
						 void main(void)
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;

							 vec4 sampleColor  = texture2D(videoInput, uv);

							 float grayColor = dot(sampleColor.rgb, monochromeScale);
							 vec3 monoColor = vec3(grayColor) * sepiaScale;
							 sampleColor = vec4(monoColor, 1.0);

							 gl_FragColor = sampleColor;
						 }
						 );
}

/**
 * @brief モノクローム
 */
+ (NSString *)monochrome
{
	return SHADER_STRING(
						 precision highp float;

						 uniform sampler2D videoInput;
						 uniform float iGlobalTime;
						 uniform vec2 iResolution;

						 varying highp vec2 uv;

						 void main()
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;

							 vec4 sampleColor = texture2D(videoInput, uv);
							 float total = sampleColor.r + sampleColor.g + sampleColor.b;

							 if(total >= 2.30)
							 {
								 gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
							 }
							 else
							 {
								 gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
							 }
						 }
						 );
}

/**
 * @brief レトロゲーム1985
 */
+ (NSString *)retoroGame1985
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform float iGlobalTime;
						 uniform vec2 iResolution;
						 
						 varying vec2 uv;

						 // 白・黒
						 const vec4 color0 = vec4(0.0, 0.0, 0.0, 1.0);
						 const vec4 color1 = vec4(1.0, 1.0, 1.0, 1.0);

						 // 赤
						 const vec4 color2 = vec4(0.698, 0.365, 0.020, 1.0);
						 const vec4 color3 = vec4(0.973, 0.745, 0.682, 1.0);
						 const vec4 color4 = vec4(0.859, 0.204, 0.031, 1.0);
						 const vec4 color5 = vec4(0.973, 0.541, 0.055, 1.0);

						 // 緑
						 const vec4 color6 = vec4(0.298, 0.584, 0.082, 1.0);
						 const vec4 color7 = vec4(0.235, 0.612, 0.055, 1.0);
						 const vec4 color8 = vec4(0.541, 0.918, 0.035, 1.0);

						 // 青
						 const vec4 color9 = vec4(0.251, 0.392, 1.000, 1.0);
						 const vec4 color10 = vec4(0.259, 0.482, 0.576, 1.0);
						 const vec4 color11 = vec4(0.231, 0.471, 0.765, 1.0);

						 void main()
						 {
							 vec2 unused1 = iResolution;
							 float unused2 = iGlobalTime;

							 float diff = 0.0;
							 
							 vec4 sampleColor = texture2D(videoInput, uv);
							 vec4 paletteColor = color0;
							 
							 diff = length(color0 - sampleColor);
							 
							 if(length(color1 - sampleColor) < diff){ diff = length(color1 - sampleColor); paletteColor = color1; }
							 if(length(color2 - sampleColor) < diff){ diff = length(color2 - sampleColor); paletteColor = color2; }
							 if(length(color3 - sampleColor) < diff){ diff = length(color3 - sampleColor); paletteColor = color3; }
							 if(length(color4 - sampleColor) < diff){ diff = length(color4 - sampleColor); paletteColor = color4; }
							 if(length(color5 - sampleColor) < diff){ diff = length(color5 - sampleColor); paletteColor = color5; }
							 if(length(color6 - sampleColor) < diff){ diff = length(color6 - sampleColor); paletteColor = color6; }
							 if(length(color7 - sampleColor) < diff){ diff = length(color7 - sampleColor); paletteColor = color7; }
							 if(length(color8 - sampleColor) < diff){ diff = length(color8 - sampleColor); paletteColor = color8; }
							 if(length(color9 - sampleColor) < diff){ diff = length(color9 - sampleColor); paletteColor = color9; }
							 if(length(color10 - sampleColor) < diff){ diff = length(color10 - sampleColor); paletteColor = color10; }
							 if(length(color11 - sampleColor) < diff){ diff = length(color11 - sampleColor); paletteColor = color11; }

							 gl_FragColor = paletteColor;
						 }
						 );
}

/**
 * @brief レトロ携帯ゲーム
 */
+ (NSString *)retoroHandheldGame1989
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform float iGlobalTime;
						 uniform vec2 iResolution;
						 
						 varying vec2 uv;
						 
						 const vec4 color0 = vec4(0.808, 0.816, 0.671, 1.0);
						 const vec4 color1 = vec4(0.651, 0.651, 0.557, 1.0);
						 const vec4 color2 = vec4(0.42, 0.42, 0.325, 1.0);
						 const vec4 color3 = vec4(0.118, 0.11, 0.063, 1.0);
						 
						 void main()
						 {
							 float unused2 = iGlobalTime;
							 
							 int mosaicLevel = 3;
							 
							 // モザイクとして使用する色を決定
							 float x = uv.x * iResolution.x;
							 float y = uv.y * iResolution.y;
							 int ix = (int(x) / mosaicLevel) * mosaicLevel;
							 int iy = (int(y) / mosaicLevel) * mosaicLevel;
							 float fx = float(ix) / iResolution.x;
							 float fy = float(iy) / iResolution.y;
							 
							 vec2 texCoord = vec2(fx, fy);
							 
							 float diff = 0.0;
							 
							 vec4 sampleColor = texture2D(videoInput, texCoord);
							 vec4 paletteColor = color0;
							 
							 diff = length(color0 - sampleColor);
							 
							 if(length(color1 - sampleColor) < diff){ diff = length(color1 - sampleColor); paletteColor = color1; }
							 if(length(color2 - sampleColor) < diff){ diff = length(color2 - sampleColor); paletteColor = color2; }
							 if(length(color3 - sampleColor) < diff){ diff = length(color3 - sampleColor); paletteColor = color3; }
							 
							 gl_FragColor = paletteColor;
						 }
						 );
}

/**
 * @brief 水中メガネ
 */
+ (NSString *)swimmingGoggles
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform float iGlobalTime;
						 uniform vec2 iResolution;
						 
						 varying vec2 uv;
						 
						 const vec3 waveScale = vec3(0.70588235294118, 0.96, 1.0);
						 
						 void main()
						 {
							 vec2 unused = iResolution;
							 
							 float stongth = sin(iGlobalTime) * 0.5 + 0.5;
							 float waveu = sin((uv.y + iGlobalTime) * 20.0) * 0.5 * 0.03 * stongth;
							 
							 vec4 sampleColor = texture2D(videoInput, uv + vec2(waveu, 0));

							 gl_FragColor = vec4(sampleColor.x * waveScale.x,
												 sampleColor.y * waveScale.y,
												 sampleColor.z * waveScale.z,
												 1.0);
						 }
						 );
}

/**
 * @brief モザイク
 */
+ (NSString *)mosaic
{
	return SHADER_STRING(
						 precision highp float;
						 
						 uniform sampler2D videoInput;
						 uniform float iGlobalTime;
						 uniform vec2 iResolution;
						 
						 varying vec2 uv;

						 void main()
						 {
							 float unused2 = iGlobalTime;
							 int mosaicLevel = 3;

							 // モザイクとして使用する色を決定
							 float x = uv.x * iResolution.x;
							 float y = uv.y * iResolution.y;
							 int ix = (int(x) / mosaicLevel) * mosaicLevel;
							 int iy = (int(y) / mosaicLevel) * mosaicLevel;
							 float fx = float(ix) / iResolution.x;
							 float fy = float(iy) / iResolution.y;

							 vec2 texCoord = vec2(fx, fy);

							 vec4 sampleColor = texture2D(videoInput, texCoord);
							 
							 gl_FragColor = sampleColor;
						 }
						 );
}

@end
