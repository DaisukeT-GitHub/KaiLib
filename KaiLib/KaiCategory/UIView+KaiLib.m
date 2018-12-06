//
//  UIView+KaiLib.m
//  KaiLib
//

#import "UIView+KaiLib.h"



@implementation UIView (KaiLib)

/**
 * @brief スナップショット画像を返す
 */
- (UIImage *)snapshotWithAfterScreenUpdates:(BOOL)afterScreenUpdates
{
	UIGraphicsBeginImageContextWithOptions([self frame].size , YES, 0.0);

	if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
	{
		// iOS 7 以降 ( GPU 処理。安定して 30FPS くらい保てる )
		[self drawViewHierarchyInRect:[self bounds] afterScreenUpdates:afterScreenUpdates];
	}
	else
	{
		// iOS 7 以前 ( CPU 処理。ケースバイケースで性能が大きく変わる )
		[[self layer] renderInContext:UIGraphicsGetCurrentContext()];
	}

	UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return ret;
}

/**
 * @brief ビューのサイズを取得する
 */
- (CGSize)size
{
	CGSize ret;
	KAI_ZEROFILL(&ret);

	CGRect bounds = [self bounds];
	ret = CGSizeMake(bounds.size.width, bounds.size.height);

	return ret;
}

- (void)removeAllSubviews
{
	NSArray *subviews = [self subviews];
	for(UIView *subview in subviews) {
		[subview removeFromSuperview];
	}
}

@end
