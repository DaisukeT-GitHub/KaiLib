//
//  NSNumber+KaiLib.m
//  KaiLib
//

#import "NSNumber+KaiLib.h"

@implementation NSNumber (KaiLib)

- (NSString *)thousandSeparatorString
{
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[formatter setGroupingSeparator:@","];
	[formatter setGroupingSize:3];

	NSString *str = [formatter stringForObjectValue:self];

	return str;
}

@end
