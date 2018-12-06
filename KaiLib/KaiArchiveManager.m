//
//  KaiArchiveManager.m
//  KaiLib
//

#import "KaiArchiveManager.h"



@implementation KaiArchiveManager

#pragma mark - life cycle
- (id)init
{
	self = [super init];
	if(self == nil) return self;
	
	_dictionary = [[NSMutableDictionary alloc] init];
	
	return self;
}

+ (KaiArchiveManager*)singleton
{
	return (KaiArchiveManager*)[super singleton];
}



#pragma mark - save / load
- (BOOL)load
{
	if([[self filePath] length] == 0)
	{
		KaiLogErr(@"file path length is 0");
		
		return NO;
	}
	
	NSDictionary *dictionary = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
	
	if([dictionary count] > 0)
	{
		_dictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
	}
	
	return YES;
}

- (BOOL)save
{
	BOOL ret = NO;
	
	ret = [NSKeyedArchiver archiveRootObject:_dictionary toFile:[self filePath]];
	
	return ret;
}



#pragma mark - KaiArchiveManagerProtocol
- (NSString *)filePath
{
	NSString *docPath = [KaiCommon documentPath];
	NSString *ret = [docPath stringByAppendingPathComponent:@"archive.ka"];
	
	return ret;
}

@end
