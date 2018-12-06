//
//  NSArray+KaiLib.h
//  KaiLib
//

#import "KaiCategory.h"

/**
 * @brief NSArray カテゴリ拡張
 */
@interface NSArray (KaiLib)
@end

@interface NSMutableArray (KaiLib)

- (void)replaceObjectAll:(id)anObject;

@end



/**
 * @brief NSMutableArray カテゴリ拡張 ( キュー )
 */
@interface NSMutableArray (KaiLibQueue)

- (id)dequeue;
- (void)enqueue:(id)obj;

@end


/**
 * @brief NSMutableArray カテゴリ拡張 ( スタック )
 */
@interface NSMutableArray (KaiLibStack)

- (id)pop;
- (void)push:(id)obj;

@end
