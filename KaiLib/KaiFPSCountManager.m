//
//  KaiFPSCountManager.m
//  KaiLib
//

#import "KaiFPSCountManager.h"

@interface KaiFPSCountManager()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger lastCount;
@property (nonatomic, strong) NSTimer *timer;

- (void)timerMethod:(NSTimer *)timer;

@end



@implementation KaiFPSCountManager

#pragma mark - life cycle
- (id)init
{
	self = [super init];
	if(self == nil) return self;

	[KAI_APPDELEG_NOTIFY_MAN addObserver:self];

	return self;
}

- (void)dealloc
{
	[KAI_APPDELEG_NOTIFY_MAN removeObserver:self];

	[self stop];
}

+ (KaiFPSCountManager *)singleton
{
	return (KaiFPSCountManager *)[super singleton];
}



#pragma mark - FPS
/**
 * @brief カウントをインクリメント
 *
 */
- (void)increment
{
	_count++;
}

/**
 * @brief 最後の FPSカウント を返す
 */
- (NSInteger)lastFPS
{
	return _lastCount;
}



#pragma mark - timer
/**
 * @brief 開始
 */
- (void)start
{
	if([_timer isValid]) return;

    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
											  target:self
											selector:@selector(timerMethod:)
											userInfo:nil
											 repeats:YES];
	
}

/**
 * @brief 停止
 */
- (void)stop
{
	if(![_timer isValid]) return;

	[_timer invalidate];
}

/**
 * 定期的に呼び出されるタイマコールバック
 */
- (void)timerMethod:(NSTimer *)timer
{
	_lastCount = _count;
	_count = 0;
}



#pragma mark - UIApplicationDelegate
- (void)applicationWillResignActive:(UIApplication *)application
{
	[self stop];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	[self start];
}

@end
