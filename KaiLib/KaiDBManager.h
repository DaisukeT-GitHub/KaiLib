//
//  KaiDBManager.h
//  KaiLib
//

#import "KaiLib.h"

/**
 * @brief DB マネージャープロトコル
 */
@protocol KaiMDBManagerProtocol

- (NSString*)filePath;

@end



/**
 * @brief DB マネージャー
 */
#define KAI_DB_MAN	[KaiDBManager singleton]

@interface KaiDBManager : KaiSingleton <KaiMDBManagerProtocol>
{
}

+ (KaiDBManager*)singleton;

- (BOOL)load;
- (BOOL)save;

- (NSArray *)fetch:(NSFetchRequest *)req;
- (NSEntityDescription *)entityDescWithClass:(Class)entityClass;

- (id)insertObjectWithEntityClass:(Class)entityClass;
- (BOOL)removeObject:(NSManagedObject *)obj;
- (BOOL)removeAllObjectsWithEntityClass:(Class)entityClass;



@end
