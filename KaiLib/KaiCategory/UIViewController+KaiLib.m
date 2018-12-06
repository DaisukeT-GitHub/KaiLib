//
//  UIViewController+KaiLib.m
//  KaiLib
//

#import "UIViewController+KaiLib.h"

@implementation UIViewController (KaiLib)

/**
 * @brief	単純な addChildViewController メソッド
 *			メソッド内で addChildViewController, addSubview, didMoveToParentViewController を実施する
 */
- (void)addChildViewControllerSimple:(UIViewController *)controller
{
	[self addChildViewController:controller];
	[[self view] addSubview:[controller view]];
	[controller didMoveToParentViewController:self];
}

/**
 * @brief	単純な removeFromParentViewController メソッド
 *			メソッド内で willMoveToParentViewController, removeFromSuperview, removeFromParentViewController を実施する
 */
- (void)removeFromParentViewControllerSimple
{
	[self willMoveToParentViewController:nil];
	[[self view] removeFromSuperview];
	[self removeFromParentViewController];
}

/**
 * @brief	単純な addChildViewController メソッド ( superView 指定版 )
 *			メソッド内で addChildViewController, addSubview, didMoveToParentViewController を実施する
 */
- (void)addChildViewControllerSimpleWithView:(UIView *)view
								  controller:(UIViewController *)controller
{
	[self addChildViewController:controller];
	[view addSubview:[controller view]];
	[controller didMoveToParentViewController:self];
}

/**
 * @brief	単純な removeFromParentViewController メソッド ( superView 指定版 )
 *			メソッド内で willMoveToParentViewController, removeFromSuperview, removeFromParentViewController を実施する
 */

- (void)removeFromParentViewControllerSimpleWithView:(UIView *)view
{
	[self willMoveToParentViewController:nil];
	[view removeFromSuperview];
	[self removeFromParentViewController];
}


@end
