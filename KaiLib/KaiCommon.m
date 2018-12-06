//
//  KaiCommon.m
//

#import "KaiCommon.h"

#import <QuartzCore/QuartzCore.h>



@implementation KaiCommon

#pragma mark - device
/**
 * @brief スクリーンサイズタイプを返す
 */
+ (KaiScreenSizeType)screenSizeType
{
	KaiScreenSizeType ret = KaiScreenSizeType3_5Inch;

	CGFloat screenHeight = [UIScreen mainScreen].scale * KAI_SCREEN_SIZE.height;

	if([[NSNumber numberWithFloat:screenHeight] isEqualToNumber:@(1136)])
	{
		ret = KaiScreenSizeType4_0Inch;
	}

	return ret;
}

/**
 * @brief ルートビューのフレームを返す
 */
+ (CGRect)rootViewFrame
{
	CGRect ret = CGRectMake(0, 0, KAI_SCREEN_SIZE.width, KAI_SCREEN_SIZE.height);

	return ret;
}



#pragma mark - path
/**
 * @brief "Documents" のパスを取得
 */
+ (NSString *)documentPath
{
	NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
														NSUserDomainMask,
														YES);
	
	if([dirs count] == 0) return nil;
	
	
	NSString *ret = dirs[0];
	
	return ret;
}



#pragma mark - date
/**
 * @brief 引数から NSDate 取得
 */
+ (NSDate *)dateWithYear:(NSInteger)year
				 month:(NSInteger)month
				   day:(NSInteger)day
				  hour:(NSInteger)hour
				minute:(NSInteger)minute
				second:(NSInteger)second
{
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	
	[dateComponents setYear:year];
	[dateComponents setMonth:month];
	[dateComponents setDay:day];
	[dateComponents setHour:hour];
	[dateComponents setMinute:minute];
	[dateComponents setSecond:second];
	
	NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
	
	return date;
}

/**
 * @brief NSDate から NSDateComponents を取得
 */
+ (NSDateComponents *)dateComponentsWithDate:(NSDate*)date;
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit |
								   NSMonthCalendarUnit |
								   NSDayCalendarUnit |
								   NSHourCalendarUnit |
                                   NSMinuteCalendarUnit |
                                   NSSecondCalendarUnit
											  fromDate:date];
	
	return dateComps;
}

/**
 * @brief NSDate からその日の始まりの NSDate を返す
 */
+ (NSDate *)beginDateWithDate:(NSDate *)date
{
	NSDateComponents *dateComps = [KaiCommon dateComponentsWithDate:date];

	NSDate *ret = [KaiCommon dateWithYear:[dateComps year]
									month:[dateComps month]
									  day:[dateComps day]
									 hour:0
								   minute:0
								   second:0];

	return ret;
}

/**
 * @brief NSDate からその日の終わりの NSDate を返す
 */
+ (NSDate *)endDateWithDate:(NSDate *)date
{
	NSDateComponents *dateComps = [KaiCommon dateComponentsWithDate:date];
	
	NSDate *ret = [KaiCommon dateWithYear:[dateComps year]
									month:[dateComps month]
									  day:[dateComps day]
									 hour:23
								   minute:59
								   second:59];

	return ret;
}



#pragma mark - version
/**
 * @brief リリースバージョン
 */
+ (NSString *)releaseVersion
{
	NSString *ret = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

	return ret;
}

/**
 * @brief ビルドバージョン
 */
+ (NSString *)buildVersion
{
	NSString *ret = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
	
	return ret;
}



#pragma mark - alert
+ (void)showSimpleAlert:(NSString *)message
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
													message:message
												   delegate:nil
										  cancelButtonTitle:nil
										  otherButtonTitles:@"OK", nil];

	[alert show];
}

@end
