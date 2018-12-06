//
//  KaiCommon.h
//

#import "KaiLib.h"



// アーキテクチャ別定義
#if __LP64__
#define OS_ARCH	@"64"
#define NSI_FMT "ld"
#define NSU_FMT "lu"
#else
#define OS_ARCH	@"32"
#define NSI_FMT "d"
#define NSU_FMT "u"
#endif



#pragma mark - macros

#define KAI_CLAMP(x, l, h)		( ( ( x ) > ( h ) ) ? ( h ) : ( ( x ) < ( l ) ) ? ( l ) : ( x ) )
#define KAI_ZEROFILL(x)			if(x != NULL){ memset(x, 0, sizeof(*x)); }
#define KAI_SAFEFREE(x)			if(x!=NULL){ free(x); x=NULL; }
#define KAI_SAFECFRELEASE(x)	if(x!=NULL){ CFRelease(x); x=NULL; }

#define KAI_UNUSED(x)			( ( void )x )

#define KAI_EPSILON				( FLT_EPSILON )	// 計算機ε
#define	KAI_PI					( M_PI )		// π

// デグリー <-> ラジアン変換
#define	KAI_DEGTORAD(x)			( float )( ( x * KAI_PI / ( float )180.0f ) )
#define	KAI_RADTODEG(x)			( float )( ( x * 180.0f / ( float )KAI_PI ) )

// 浮動小数点の等価比較
#define	KAI_FLOAT_EQUAL(x,y)	( fabs( x - y ) < KAI_EPSILON ? 1 : 0 )

#define	KAI_RECIPROCAL(x)	( 1.0f / ( x ) )	// 逆数

#define KAI_SINF(x)			sinf(KAI_DEGTORAD(x))
#define KAI_COSF(x)			cosf(KAI_DEGTORAD(x))

#define	KAI_LERP_ST(x)		( x )	// 直線
#define	KAI_LERP_FS(x)		KAI_SINF( x * 90.0f )	// 早い→遅い
#define	KAI_LERP_SF(x)		( 1.0f - KAI_COSF( x * 90.0f ) ) 	// 遅い→早い
#define	KAI_LERP_ARC(x)		KAI_SINF( x * 180.0f )	// 円弧運動
#define	KAI_LERP_FSF(x)		( ( x ) < 0.5f ? KAI_SINF( x * 180.0f ) * 0.5f : ( 1.0f - KAI_SINF( x * 180.0f ) ) * 0.5f + 0.5f )	// 早い→遅い→早い
#define	KAI_LERP_SFS(x)		( ( x ) < 0.5f ? ( 1.0f - KAI_COSF( x * 180.0f ) ) * 0.5f : KAI_COSF( x * 180.0f ) * -0.5f + 0.5f )	// 遅い→早い→遅い



#define	KAI_STATUSBAR_HEIGHT	([UIApplication sharedApplication].statusBarFrame.size.height)
#define KAI_SCREEN_SIZE			([UIScreen mainScreen].bounds.size)				// ステータスバーを含むスクリーンのサイズ
#define KAI_APPSCREEN_SIZE		([[UIScreen mainScreen] applicationFrame].size)	// ステータスバーを含まないスクリーンのサイズ
#define KAI_NAVIBAR_HEIGHT		(44)
#define KAI_TOOLBAR_HEIGHT		(44)

// 画面サイズ
typedef enum
{
	KaiScreenSizeType3_5Inch = 0,
	KaiScreenSizeType4_0Inch,
	KaiScreenSizeTypeUnknown,
} KaiScreenSizeType;



#define KAI_LOCALIZED_STRING(key)	NSLocalizedString(key,nil)



#pragma mark KaiCommon class
/**
 * @brief 共通機能
 */
@interface KaiCommon : NSObject

// device
+ (KaiScreenSizeType)screenSizeType;
+ (CGRect)rootViewFrame;

+ (NSString *)documentPath;
+ (NSDate *)dateWithYear:(NSInteger)year
				   month:(NSInteger)month
					 day:(NSInteger)day
					hour:(NSInteger)hour
				  minute:(NSInteger)minute
				  second:(NSInteger)second;
+ (NSDateComponents *)dateComponentsWithDate:(NSDate*)date;
+ (NSDate *)beginDateWithDate:(NSDate *)date;
+ (NSDate *)endDateWithDate:(NSDate *)date;

+ (NSString *)releaseVersion;
+ (NSString *)buildVersion;

+ (void)showSimpleAlert:(NSString *)message;

@end
