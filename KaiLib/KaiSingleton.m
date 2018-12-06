//
//  KaiSingleton.m
//
//

#import "KaiSingleton.h"
#import "KaiLib.h"

@implementation KaiSingleton

// 唯一のインスタンス
static NSMutableDictionary *_instances = nil;

/**
 * @brief シングルトンオブジェクトを返す
 *
 * @return シングルトンオブジェクト
 */
+ (id)singleton
{
	@synchronized(self)
	{
		if(_instances[NSStringFromClass(self)] == nil)
		{
			KAI_UNUSED([[self alloc] init]);
		}
	}

	return _instances[NSStringFromClass(self)];
}

/**
 * @brief 生成する
 *
 * @param [in] zone ゾーン
 *
 * @return 生成したシングルトンオブジェクト（生成済みの場合は nil）
 */
+ (id)allocWithZone:(NSZone *)zone
{
	@synchronized(self)
	{
		if(_instances[NSStringFromClass(self)] == nil)
		{
			id instance = [super allocWithZone:zone];

			if([_instances count] == 0)
			{
				_instances = [[NSMutableDictionary alloc] init];
			}

			_instances[NSStringFromClass(self)] = instance;

			return instance;
		}
	}

	return nil;
}

/**
 * @brief コピーを行なう
 *
 * @param [in] zone ゾーン
 *
 * @return 自身
 */
- (id)copyWithZone:(NSZone *)zone
{
	return self;
}



@end
