//
//  KaiSysLogManager.h
//

#import "KaiSingleton.h"

// ログレベル
typedef enum {
	KAISysLogLevelErr = 0,
	KAISysLogLevelWar,
	KAISysLogLevelInf,
	KAISysLogLevelDev,
} KaiSysLogLevel;



/**
 * @brief システムログマネージャクラス
 *
 * KaiLib のシステムログを出力する。
 */
#define KAI_SYSLOG_MAN	[KaiSysLogManager singleton]

// システムログマクロ定義
#define KaiLogErr(...) [KAI_SYSLOG_MAN outputErr:@"[KAI] %s(%d) [ERR] %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__]];
#define KaiLogWar(...) [KAI_SYSLOG_MAN outputWar:@"[KAI] %s(%d) [WAR] %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__]];
#define KaiLogInf(...) [KAI_SYSLOG_MAN outputInf:@"[KAI] %s(%d) [INF] %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__]];
#define KaiLogDev(...) [KAI_SYSLOG_MAN outputDev:@"[KAI] %s(%d) [DEV] %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__]];

@interface KaiSysLogManager : KaiSingleton
{
}

@property (nonatomic, assign) KaiSysLogLevel logLevel;

+ (KaiSysLogManager*)singleton;



- (void)outputErr:(id)arg, ...;
- (void)outputWar:(id)arg, ...;
- (void)outputInf:(id)arg, ...;
- (void)outputDev:(id)arg, ...;


@end


