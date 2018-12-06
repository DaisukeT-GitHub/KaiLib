//
//  KaiThread.m
//

#import "KaiThread.h"



@interface KaiThread(Private)
-(void)entryThread:(id)object;
@end



@implementation KaiThread

#pragma mark - 初期化/解放

/**
 * 初期化する
 *
 * @return 初期化されたインスタンス
 */
- (id)init
{
	self = [super init];
	if(self == nil) return nil;

	return self;
}

/**
 * @brief 解放
 *
 * @return なし
 */
- (void)dealloc
{
}



#pragma mark - thread
/**
 * @brief スレッドを開始する
 *
 * @param [in] object スレッドへの引数
 *
 * @return なし
 */
- (void)startThread:(id)object
{
	[NSThread detachNewThreadSelector:@selector(entryThread:) toTarget:self withObject:object];
}

/**
 * @brief スレッドのエントリポイント
 *
 * @param [in] object スレッドへの引数
 *
 * @return なし
 */
- (void)entryThread:(id)object
{
	@autoreleasepool
	{
		[[NSThread currentThread] setName:[self threadName]];
		
		KaiLogInf(@"thread[%@] start", [self threadName]);
		
		[self runOnThread:object];
		
		KaiLogInf(@"thread[%@] end", [self threadName]);
	}

	return;
}



#pragma mark - KaiThreadProtocol
/**
 * @brief スレッド処理
 *
 * @param [in] object スレッドへの引数
 *
 * @return なし
 */
- (void)runOnThread:(id)object
{
	KaiLogWar(@"illegal method call");
}

/**
 * @brief スレッド名を返す
 *
 * @return スレッド名
 */
- (NSString*)threadName
{
	KaiLogWar(@"illegal method call");
	return @"KaiThread";
}



@end

