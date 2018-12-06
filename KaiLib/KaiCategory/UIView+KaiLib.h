//
//  UIView+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"

/**
 * @brief UIView カテゴリ拡張
 */
@interface UIView (KaiLib)

- (UIImage *)snapshotWithAfterScreenUpdates:(BOOL)afterScreenUpdates;
- (CGSize)size;
- (void)removeAllSubviews;

@end
