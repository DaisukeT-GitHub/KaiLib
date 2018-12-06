//
//  NSString+KaiLib.m
//

#import "NSString+KaiLib.h"

@implementation NSString (KaiLib)

- (NSUInteger)occurredCount:(NSString*)str
{
	if([str length] == 0) return 0;

    NSUInteger strCount = [self length] - [[self stringByReplacingOccurrencesOfString:str withString:@""] length];
    return strCount / [str length];
}

- (BOOL)isDigit
{
    NSCharacterSet *digitCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
	
    NSCharacterSet *aCharacterSet = [NSCharacterSet characterSetWithCharactersInString:self];
    
    return [digitCharSet isSupersetOfSet:aCharacterSet];
}

@end
