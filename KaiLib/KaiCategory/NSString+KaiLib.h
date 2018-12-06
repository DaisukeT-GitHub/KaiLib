//
//  NSString+KaiLib.h
//

#import "KaiCategory.h"

/**
 * @brief NSString カテゴリ拡張
 */
@interface NSString (KaiLib)

- (NSUInteger)occurredCount:(NSString*)str;
- (BOOL)isDigit;

@end
