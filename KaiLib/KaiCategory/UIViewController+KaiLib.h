//
//  UIViewController+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"

/**
 * @brief UIViewController カテゴリ拡張
 */
@interface UIViewController (KaiLib)

- (void)addChildViewControllerSimple:(UIViewController *)controller;
- (void)removeFromParentViewControllerSimple;

- (void)addChildViewControllerSimpleWithView:(UIView *)view
								  controller:(UIViewController *)controller;
- (void)removeFromParentViewControllerSimpleWithView:(UIView *)view;

@end
