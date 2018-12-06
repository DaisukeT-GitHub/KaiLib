//
//  UIColor+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"



extern NSString * NSStringFromUIColor(UIColor *color);
extern NSString * NSStringFromUIColorByte(UIColor *color);



/**
 * @brief UIColor カテゴリ拡張
 */
@interface UIColor (KaiLib)

+ (UIColor *)defaultScrollViewBackgroundColor;
+ (UIColor *)defaultSafariBarColor;
+ (UIColor *)defaultTintColor;
+ (UIColor *)defaultBarColor;
+ (UIColor *)defaultGroupTableViewBackgroundColor;
+ (UIColor *)defaultTableViewHeaderFooterTextColor;
+ (UIColor *)colorWithByteRed:(uchar)red green:(uchar)green blue:(uchar)blue alpha:(uchar)alpha;
+ (UIColor *)colorWithByteWhite:(uchar)white alpha:(uchar)alpha;

@end
