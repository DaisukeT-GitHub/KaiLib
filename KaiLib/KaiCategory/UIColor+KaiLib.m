//
//  UIColor+KaiLib.m
//  KaiLib
//

#import "UIColor+KaiLib.h"



/**
 * @brief UIColor の表示用の String を返す
 */
NSString * NSStringFromUIColor(UIColor *color)
{
	NSString *ret = @"";

	const size_t numComponents = CGColorGetNumberOfComponents([color CGColor]);
	const CGFloat *components = CGColorGetComponents([color CGColor]);
	if(numComponents == 4)
	{
		ret = [NSString stringWithFormat:@"color(%f,%f,%f,%f)",
			   components[0], components[1], components[2], components[3]];
	}
	else if(numComponents == 2)
	{
		ret = [NSString stringWithFormat:@"color(%f,%f,%f,%f)",
			   components[0], components[0], components[0], components[1]];
	}

	return ret;
}

/**
 * @brief UIColor の表示用の String を返す (0-255形式)
 */
NSString * NSStringFromUIColorByte(UIColor *color)
{
	NSString *ret = @"";
	
	const size_t numComponents = CGColorGetNumberOfComponents([color CGColor]);
	const CGFloat *components = CGColorGetComponents([color CGColor]);
	if(numComponents == 0) return ret;
	if(components == NULL) return ret;

	if (numComponents == 4)
	{
		ret = [NSString stringWithFormat:@"color(%d,%d,%d,%d)",
			   (int)(components[0] * 255.0),
			   (int)(components[1] * 255.0),
			   (int)(components[2] * 255.0),
			   (int)(components[3] * 255.0)];
	}
	else if(numComponents == 2)
	{
		ret = [NSString stringWithFormat:@"color(%d,%d,%d,%d)",
			   (int)(components[0] * 255.0),
			   (int)(components[0] * 255.0),
			   (int)(components[0] * 255.0),
			   (int)(components[1] * 255.0)];
	}
	
	return ret;
}



@implementation UIColor (KaiLib)

+ (UIColor *)defaultScrollViewBackgroundColor
{
	return [UIColor colorWithByteRed:111 green:113 blue:121 alpha:255];
}

+ (UIColor *)defaultSafariBarColor
{
	return [UIColor colorWithByteRed:22 green:126 blue:251 alpha:255];
}

+ (UIColor *)defaultTintColor
{
	return [UIColor colorWithByteRed:0 green:122 blue:255 alpha:255];
}

+ (UIColor *)defaultBarColor
{
	return [UIColor colorWithByteRed:247 green:247 blue:247 alpha:255];
}

+ (UIColor *)defaultGroupTableViewBackgroundColor
{
	return [UIColor colorWithByteRed:239 green:239 blue:244 alpha:255];
}

+ (UIColor *)defaultTableViewHeaderFooterTextColor
{
	return [UIColor grayColor];
}

+ (UIColor *)colorWithByteRed:(uchar)red green:(uchar)green blue:(uchar)blue alpha:(uchar)alpha
{
	return [UIColor colorWithRed:red/(CGFloat)255 green:green/(CGFloat)255 blue:blue/(CGFloat)255 alpha:alpha/(CGFloat)255];
}

+ (UIColor *)colorWithByteWhite:(uchar)white alpha:(uchar)alpha
{
	return [UIColor colorWithWhite:white/(CGFloat)255 alpha:alpha/(CGFloat)255];
}

@end
