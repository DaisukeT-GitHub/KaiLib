//
//  KaiGLFragmentShader.h
//  KaiLib
//

#import "KaiGL.h"

/**
 * @brief フラグメントシェーダー群
 */
@interface KaiGLFragmentShader : NSObject

+ (NSString *)basic;
+ (NSString *)basicTexture;
+ (NSString *)invertColor;
+ (NSString *)grayScale;
+ (NSString *)sepia;
+ (NSString *)monochrome;
+ (NSString *)swimmingGoggles;
+ (NSString *)retoroGame1985;
+ (NSString *)retoroHandheldGame1989;
+ (NSString *)mosaic;

@end
