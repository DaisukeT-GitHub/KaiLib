//
//  KaiRandomManager.m
//

#import "KaiRandomManager.h"

@implementation KaiRandomManager

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

	srand((unsigned int)time(NULL));

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
+ (KaiRandomManager *)singleton
{
	return (KaiRandomManager*)[super singleton];
}



#pragma mark - 乱数
- (double)uniform
{
//	return ((double)rand()+1.0)/((double)RAND_MAX+2.0);
	return (double)rand() / RAND_MAX;
}

- (double)normal:(double)mu sigma:(double)sigma
{
	double z=sqrt( -2.0*log([self uniform]) ) * sin( 2.0*M_PI*[self uniform] );
    return mu + sigma*z;
}



@end
