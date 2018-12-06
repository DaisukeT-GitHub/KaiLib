//
//  KaiImage.h
//  KaiLib
//

#import "KaiLib.h"



/**
 * @brief 画像処理クラス
 */
@interface KaiImage : NSObject

+ (unsigned char *)convertUIImageToBitmapRGBA8:(UIImage *)image;
+ (CGContextRef)newBitmapRGBA8ContextFromImage:(CGImageRef)image;
+ (UIImage *)convertBitmapRGBA8ToUIImage:(unsigned char *)buffer
							   withWidth:(int)width
							  withHeight:(int)height;

@end
