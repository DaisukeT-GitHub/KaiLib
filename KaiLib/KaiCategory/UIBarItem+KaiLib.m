//
//  UIBarItem+KaiLib.m
//  KaiLib
//

#import "UIBarItem+KaiLib.h"

@implementation UIBarItem (KaiLib)

/**
 * @brief フォントのボールド設定
 */
- (void)setBoldFontForState:(UIControlState)state
{
	NSDictionary *attrFont = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:[UIFont labelFontSize]]};
	[self setTitleTextAttributes:attrFont forState:UIControlStateNormal];
}

/**
 * @brief フォントのボールド解除
 */
- (void)resetBoldFontForState:(UIControlState)state
{
	NSDictionary *attrFont = @{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont labelFontSize]]};
	[self setTitleTextAttributes:attrFont forState:UIControlStateNormal];
}

@end
