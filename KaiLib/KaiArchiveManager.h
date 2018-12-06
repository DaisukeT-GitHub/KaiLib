//
//  KaiArchiveManager.h
//  KaiLib
//

#import "KaiLib.h"



@protocol KaiArchiveManagerProtocol

@optional
- (NSString *)filePath;

@end



#define KAI_ARCHIVE_MAN				[KaiArchiveManager singleton]
#define	KAI_ARCHIVE_GET(key)		[[KAI_ARCHIVE_MAN dictionary] objectForKey:(key)]
#define KAI_ARCHIVE_SET(key,obj)	[[KAI_ARCHIVE_MAN dictionary] setObject:(obj) forKey:(key)]

@interface KaiArchiveManager : KaiSingleton

@property (strong) NSMutableDictionary *dictionary;

+ (KaiArchiveManager *)singleton;

// load & save
- (BOOL)load;
- (BOOL)save;

@end
