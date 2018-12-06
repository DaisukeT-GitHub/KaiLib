//
//  KaiGLCommon.m
//  KaiLib
//

#import "KaiGLCommon.h"

@implementation KaiGLCommon

/**
 * @brief 左上原点の座標から GL の座標へ変換する
 */
+ (GLKVector2)convertPointLUtoGLWithPoint:(GLKVector2)point viewSize:(GLKVector2)viewSize
{
	GLKVector2 ret = GLKVector2Make(point.x * (2.0 / (float)viewSize.x) - 1.0,
									(viewSize.y - point.y) * (2.0 / (float)viewSize.y) - 1.0);

	return ret;
}

/**
 * @brief 開始位置とサイズとビューサイズからGLの頂点配列を作成する
 */
+ (void)makeVertexArray:(GLKVector2 *)array
			   position:(GLKVector2)position
				   size:(GLKVector2)size
			   viewSize:(GLKVector2)viewSize
{
	array[0] = [KaiGLCommon convertPointLUtoGLWithPoint:GLKVector2Make(position.x, position.y + size.y)
											   viewSize:viewSize];
	array[1] = [KaiGLCommon convertPointLUtoGLWithPoint:position viewSize:viewSize];
	array[2] = [KaiGLCommon convertPointLUtoGLWithPoint:GLKVector2Make(position.x + size.x, position.y)
											   viewSize:viewSize];
	array[3] = [KaiGLCommon convertPointLUtoGLWithPoint:GLKVector2Make(position.x + size.x, position.y + size.y)
											   viewSize:viewSize];

	return;
}

@end
