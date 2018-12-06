//
//  KaiGLVertexShader.m
//  KaiLib
//

#import "KaiGLVertexShader.h"

@implementation KaiGLVertexShader

/**
 * @brief 基本
 */
+ (NSString *)basic
{
	return SHADER_STRING(
							attribute vec4 position;
							uniform vec4 uniformColor;
							varying highp vec4 varyingColor;

							void main()
							{
								varyingColor = uniformColor;
								gl_Position = position;
							}
						);
}

/**
 * @brief 基本(テクスチャ使用)
 */
+ (NSString *)basicTexture
{
	return SHADER_STRING(
						 attribute vec4 position;
						 attribute vec2 texcoord;
						 varying highp vec2 uv;
						 
						 void main()
						 {
							 uv = texcoord;
							 gl_Position = position;
						 }
						 );
}

@end
