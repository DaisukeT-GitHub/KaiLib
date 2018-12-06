//
//  KaiApplicationDelegateNotificationCenter.m
//  KaiLib
//

#import "KaiApplicationDelegateNotificationCenter.h"



@interface KaiApplicationDelegateNotificationCenter()

@property (strong) NSMutableArray *arrayForObserver;
@property (strong) NSObject *lockForObserver;

- (void)applicationDidEnterBackground;
- (void)applicationWillResignActive;
- (void)applicationDidBecomeActive;
- (void)applicationWillChangeStatusBarFrame;
- (void)applicationDidChangeStatusBarFrame;

@end



@implementation KaiApplicationDelegateNotificationCenter

+ (KaiApplicationDelegateNotificationCenter *)defaultCenter
{
	return (KaiApplicationDelegateNotificationCenter *)[super singleton];
}

- (id)init
{
	self = [super init];
	if (self == nil) return nil;

	_arrayForObserver = [[NSMutableArray alloc] init];
	_lockForObserver = [[NSObject alloc] init];

	NSArray *arrayForNotification = @[
									  @{@"name":UIApplicationDidEnterBackgroundNotification,
										@"selector": @"applicationDidEnterBackground"},
									  @{@"name":UIApplicationWillResignActiveNotification,
										@"selector": @"applicationWillResignActive"},
									  @{@"name":UIApplicationDidBecomeActiveNotification,
										@"selector": @"applicationDidBecomeActive"},
									  @{@"name":UIApplicationWillChangeStatusBarFrameNotification,
										@"selector": @"applicationWillChangeStatusBarFrame"},
									  @{@"name":UIApplicationDidChangeStatusBarFrameNotification,
										@"selector": @"applicationDidChangeStatusBarFrame"},
									  ];

	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	for(NSDictionary *dictionary in arrayForNotification){
		[center addObserver:self
				   selector:NSSelectorFromString(dictionary[@"selector"])
					   name:dictionary[@"name"]
					 object:nil];
	}

	return self;
}



- (void)addObserver:(id<UIApplicationDelegate>)observer
{
	@synchronized(_lockForObserver)
	{
		if([_arrayForObserver containsObject:observer]) return;
	
		[_arrayForObserver addObject:observer];
	}
}

- (void)removeObserver:(id<UIApplicationDelegate>)observer
{
	@synchronized(_lockForObserver)
	{
		if(![_arrayForObserver containsObject:observer]) return;
	
		[_arrayForObserver removeObject:observer];
	}
}



#pragma mark - UIApplicationDelegate Notification
- (void)applicationDidEnterBackground
{
	@synchronized(_lockForObserver)
	{
		for(id<UIApplicationDelegate> observer in _arrayForObserver)
		{
			if([observer respondsToSelector:@selector(applicationDidEnterBackground:)])
			{
				[observer applicationDidEnterBackground:nil];
			}
		}
	}
}

- (void)applicationWillResignActive
{
	@synchronized(_lockForObserver)
	{
		for(id<UIApplicationDelegate> observer in _arrayForObserver)
		{
			if([observer respondsToSelector:@selector(applicationWillResignActive:)])
			{
				[observer applicationWillResignActive:nil];
			}
		}
	}
}

- (void)applicationDidBecomeActive
{
	@synchronized(_lockForObserver)
	{
		for(id<UIApplicationDelegate> observer in _arrayForObserver)
		{
			if([observer respondsToSelector:@selector(applicationDidBecomeActive:)])
			{
				[observer applicationDidBecomeActive:nil];
			}
		}
	}
}

- (void)applicationWillChangeStatusBarFrame
{
	@synchronized(_lockForObserver)
	{
		for(id<UIApplicationDelegate> observer in _arrayForObserver)
		{
			if([observer respondsToSelector:@selector(application:willChangeStatusBarFrame:)])
			{
				[observer application:nil willChangeStatusBarFrame:CGRectMake(0, 0, 0, 0)];
			}
		}
	}
}

- (void)applicationDidChangeStatusBarFrame
{
	@synchronized(_lockForObserver)
	{
		for(id<UIApplicationDelegate> observer in _arrayForObserver)
		{
			if([observer respondsToSelector:@selector(application:didChangeStatusBarFrame:)])
			{
				[observer application:nil didChangeStatusBarFrame:CGRectMake(0, 0, 0, 0)];
			}
		}
	}
}



@end
