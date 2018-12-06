//
//  KaiRandomManager.h
//

#import "KaiLib.h"



/**
 * @brief 乱数マネージャー
 */
#define KAI_RND_MAN	[KaiRandomManager singleton]

@interface KaiRandomManager : KaiSingleton

+ (KaiRandomManager *)singleton;

- (double)uniform;
- (double)normal:(double)mean sigma:(double)sigma;

@end
