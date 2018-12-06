//
//  UIImage+KaiLib.m
//  KaiLib
//

#import "UIImage+KaiLib.h"

@implementation UIImage (KaiLib)

/**
 * @brief サイズと色からイメージを作成する
 */
+ (UIImage *)imageWithSize:(CGSize)size
					 color:(UIColor *)color
{
	UIImage *ret = nil;

	CGRect rect = CGRectMake(0, 0, size.width, size.height);

	UIGraphicsBeginImageContext(size);

	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextFillRect(context, rect);

	ret = UIGraphicsGetImageFromCurrentImageContext();

	UIGraphicsEndImageContext();

	return ret;
}



@end
