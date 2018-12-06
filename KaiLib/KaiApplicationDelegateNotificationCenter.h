//
//  KaiApplicationDelegateNotificationCenter.h
//  KaiLib
//

#import "KaiLib.h"



#define KAI_APPDELEG_NOTIFY_MAN	[KaiApplicationDelegateNotificationCenter defaultCenter]

@interface KaiApplicationDelegateNotificationCenter : KaiSingleton

+ (KaiApplicationDelegateNotificationCenter *)defaultCenter;

- (void)addObserver:(id<UIApplicationDelegate>)observer;
- (void)removeObserver:(id<UIApplicationDelegate>)observer;

@end

