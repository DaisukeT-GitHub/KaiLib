//
//  KaiFPSCountManager.h
//  KaiLib
//

#import "KaiLib.h"



#define KAI_FPS	((NSInteger)60)

/**
 * @brief FPS カウントマネージャー
 */
#define KAI_FPS_MAN	[KaiFPSCountManager singleton]

@interface KaiFPSCountManager : KaiSingleton<UIApplicationDelegate>

+ (KaiFPSCountManager *)singleton;

- (void)start;
- (void)stop;

- (void)increment;
- (NSInteger)lastFPS;

@end


