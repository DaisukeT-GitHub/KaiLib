//
//  KaiDBManager.m
//  KaiLib
//

#import "KaiDBManager.h"



@interface KaiDBManager ()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;

@end



@implementation KaiDBManager



#pragma mark - 初期化/解放
/**
 * @brief 初期化する
 *
 * @return 初期化されたインスタンス
 */
- (id)init
{
	self = [super init];
	if (self == nil) return nil;

	return self;
}

/**
 * @brief 解放する
 *
 * @return なし
 */
- (void)dealloc
{
}

/**
 * @brief シングルトンオブジェクトを返す
 *
 * @return シングルトンオブジェクト
 */
+ (KaiDBManager *)singleton
{
	return (KaiDBManager*)[super singleton];
}



#pragma mark - KaiDBManagerProtocol
- (NSString *)filePath
{
	KaiLogWar(@"invalid method call");

	return nil;
}



#pragma mark - save / load
/**
 * @brief DB のロード
 */
- (BOOL)load
{
	BOOL ret = NO;
	NSPersistentStoreCoordinator *psc = nil;

	if([[self filePath] length] == 0)
	{
		KaiLogErr(@"filePath is length 0");
		return ret;
	}

	// データモデルの作成
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
	
	// ストアコーディネーター作成
	psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];

	// ストアコーディネーターにDBファイルを追加
    NSURL *filePath = [NSURL fileURLWithPath:[self filePath]];

    NSError *error = nil;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:filePath
                                 options:nil
                                   error:&error])
	{
		KaiLogErr(@"open failed URL[%@] reason[%@]", filePath, [error localizedDescription]);
		return ret;
    }
	
	// コンテキスト作成
    _context = [[NSManagedObjectContext alloc] init];
    [_context setPersistentStoreCoordinator:psc];
	
	// コンテキスト初期設定
    [_context setUndoManager:nil];

	ret = YES;

	return ret;
}

/**
 * @brief DB のセーブ
 */
- (BOOL)save
{
	NSError *err = nil;
	BOOL ret = [_context save:&err];
	if (!ret)
	{
		KaiLogErr(@"error[%@]", [err localizedDescription]);
    }
	
	return ret;
}



#pragma mark - fetch
/**
 * @brief fetch 実行
 */
- (NSArray *)fetch:(NSFetchRequest *)req
{
	NSError *err = nil;
	NSArray *ret = [_context executeFetchRequest:req error:&err];

	if(ret == nil && err != nil)
	{
		KaiLogErr(@"error[%@]", [err localizedDescription]);
	}

	return ret;
}

/**
 * @brief class から EntityDescription を取得
 */
- (NSEntityDescription *)entityDescWithClass:(Class)entityClass
{
	NSDictionary *entities = [_model entitiesByName];
	NSEntityDescription *entityDesc = entities[NSStringFromClass(entityClass)];
	return entityDesc;
}



#pragma mark - add / remove
/**
 * @brief エンティティの追加 ( クラスから )
 */
- (id)insertObjectWithEntityClass:(Class)entityClass
{
	id ret = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(entityClass)
										   inManagedObjectContext:_context];

	return ret;
}

/**
 * @brief オブジェクトの削除
 */
- (BOOL)removeObject:(NSManagedObject *)obj
{
	BOOL ret = NO;
	
	if(obj == nil)
	{
		return ret;
	}
	
	ret = YES;
	[_context deleteObject:obj];
	
	return ret;
}

/**
 * @brief 該当エンティティのすべてのオブジェクトの削除
 */
-(BOOL)removeAllObjectsWithEntityClass:(Class)entityClass
{
	NSFetchRequest *fetchReq = [[NSFetchRequest alloc] init];

	NSEntityDescription *entityDesc = [self entityDescWithClass:entityClass];
	[fetchReq setEntity:entityDesc];

	NSArray *fetchRet = [self fetch:fetchReq];

	for(NSManagedObject* obj in fetchRet)
	{
		[self removeObject:obj];
	}

	return YES;
}

@end
