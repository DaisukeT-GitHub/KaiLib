//
//  NSArray+KaiLib.m
//  KaiLib
//

#import "NSArray+KaiLib.h"



#pragma mark - NSMArray ( KaiLib )
@implementation NSArray (KaiLib)

@end



#pragma mark - NSMutableArray ( KaiLib )
@implementation NSMutableArray (KaiLib)

/**
 * @brief Array要素を引数の要素で置き換え
 */
- (void)replaceObjectAll:(id)anObject
{
	NSUInteger count = [self count];

	for(NSUInteger i = 0; i < count; i++)
	{
		self[i] = anObject;
	}
}

@end



#pragma mark - NSMutableArray ( KaiLibQueue )
@implementation NSMutableArray (KaiLibQueue)

/**
 * @brief デキュー
 */
- (id)dequeue
{
	if([self count] == 0) return nil;

	id obj = [self objectAtIndex:0];
	if(obj != nil)
	{
		[self removeObjectAtIndex:0];
	}

	return obj;
}

/**
 * @brief エンキュー
 */
- (void)enqueue:(id)obj
{
	[self addObject:obj];
}

@end



#pragma mark - NSMutableArray ( KaiLibStack )
@implementation NSMutableArray (KaiLibStack)

/**
 * @brief ポップ
 */
- (id)pop
{
	if([self count] == 0) return nil;

	id obj = [self lastObject];
	if(obj != nil)
	{
		[self removeLastObject];
	}

	return obj;
}

/**
 * @brief プッシュ
 */
- (void)push:(id)obj
{
	[self addObject:obj];
}

@end
