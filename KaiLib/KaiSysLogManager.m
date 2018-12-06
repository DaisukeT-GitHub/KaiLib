//
//  KaiSysLogManager.m
//

#import "KaiSysLogManager.h"

#import "KaiCommon.h"



@interface KaiSysLogManager()
- (void)outputLog:(NSString*)str;
@end



@implementation KaiSysLogManager

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

	[self setLogLevel:KAISysLogLevelInf];

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
+ (KaiSysLogManager*)singleton
{
	return (KaiSysLogManager*)[super singleton];
}



#pragma mark - logging
/**
 * @brief ログを出力する(エラーレベル)
 *
 * @param [in] arg ログ内容
 *
 * @return なし
 */
- (void)outputErr:(id)arg, ...
{
	KaiSysLogLevel level = _logLevel;
	if(level < KAISysLogLevelErr)
	{
		return;
	}
	
	//ログメッセージ生成
	va_list argumentList;
	va_start(argumentList, arg);
	NSString *logMessage = (__bridge_transfer NSString*)CFStringCreateWithFormatAndArguments(NULL, NULL, (CFStringRef)arg, argumentList);
	va_end(argumentList);

	//ログ出力
	[self outputLog:logMessage];

	CFStringRef logMessageCF = (__bridge_retained CFStringRef)logMessage;
	KAI_SAFECFRELEASE(logMessageCF);
}



/**
 * @brief ログを出力する(警告レベル)
 *
 * @param [in] arg ログ内容
 *
 * @return なし
 */
- (void)outputWar:(id)arg, ...
{
	KaiSysLogLevel level = _logLevel;
	if(level < KAISysLogLevelWar)
	{
		return;
	}
	
	//ログメッセージ生成
	va_list argumentList;
	va_start(argumentList, arg);
	NSString *logMessage = (__bridge_transfer NSString*)CFStringCreateWithFormatAndArguments(NULL, NULL, (CFStringRef)arg, argumentList);
	va_end(argumentList);

	//ログ出力
	[self outputLog:logMessage];

	CFStringRef logMessageCF = (__bridge_retained CFStringRef)logMessage;
	KAI_SAFECFRELEASE(logMessageCF);
}

/**
 * @brief ログを出力する(情報レベル)
 *
 * @param [in] arg ログ内容
 *
 * @return なし
 */
- (void)outputInf:(id)arg, ...
{
	KaiSysLogLevel level = _logLevel;
	if(level < KAISysLogLevelInf)
	{
		return;
	}

	//ログメッセージ生成
	va_list argumentList;
	va_start(argumentList, arg);
	NSString *logMessage = (__bridge_transfer NSString*)CFStringCreateWithFormatAndArguments(NULL, NULL, (CFStringRef)arg, argumentList);
	va_end(argumentList);
	
	//ログ出力
	[self outputLog:logMessage];

	CFStringRef logMessageCF = (__bridge_retained CFStringRef)logMessage;
	KAI_SAFECFRELEASE(logMessageCF);
}

/**
 * @brief ログを出力する(開発レベル)
 *
 * @param [in] arg ログ内容
 *
 * @return なし
 */
- (void)outputDev:(id)arg, ...
{
	KaiSysLogLevel level = _logLevel;
	if(level < KAISysLogLevelDev)
	{
		return;
	}
	
	//ログメッセージ生成
	va_list argumentList;
	va_start(argumentList, arg);
	NSString *logMessage = (__bridge_transfer NSString*)CFStringCreateWithFormatAndArguments(NULL, NULL, (CFStringRef)arg, argumentList);
	va_end(argumentList);
	
	//ログ出力
	[self outputLog:logMessage];

	CFStringRef logMessageCF = (__bridge_retained CFStringRef)logMessage;
	KAI_SAFECFRELEASE(logMessageCF);
}



/**
 * @brief ログを出力する
 *
 * @param [in] str ログ内容
 *
 * @return なし
 */
- (void)outputLog:(NSString*)str
{
	@autoreleasepool
	{
		if([str length] == 0) return;

		NSLog(@"%@",str);
	}
}

@end
