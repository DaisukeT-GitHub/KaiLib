//
//  UIBarItem+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"

/**
 * @brief UIBarItem カテゴリ拡張
 */
@interface UIBarItem (KaiLib)

- (void)setBoldFontForState:(UIControlState)state;
- (void)resetBoldFontForState:(UIControlState)state;

@end
