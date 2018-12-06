//
//  UITableView+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"

/**
 * @brief UITableView カテゴリ拡張
 */
@interface UITableView (KaiLib)

- (void)deselect:(BOOL)animted;
- (UITableViewCell *)cellForRow:(NSInteger)row section:(NSInteger)section;
- (void)setExclusiveCheckmarkForRow:(NSInteger)row section:(NSInteger)section;

@end
