//
//  KaiLocale.h
//  KaiLib
//

#import "KaiLib.h"

// 地域コード
typedef enum
{
	KaiLocaleIdentifierJA_JP,		// 日本語_日本
	KaiLocaleIdentifierEN_IE,		// 英語_アイルランド
	KaiLocaleIdentifierEN_US,		// 英語_アメリカ合衆国
	KaiLocaleIdentifierEN_GB,		// 英語_イギリス
	KaiLocaleIdentifierEN_IT,		// 英語_イタリア
	KaiLocaleIdentifierEN_IN,		// 英語_インド
	KaiLocaleIdentifierEN_EE,		// 英語_エストニア
	KaiLocaleIdentifierEN_AU,		// 英語_オーストラリア
	KaiLocaleIdentifierEN_AT,		// 英語_オーストリア
	KaiLocaleIdentifierEN_NL,		// 英語_オランダ
	KaiLocaleIdentifierEN_CA,		// 英語_カナダ
	KaiLocaleIdentifierEN_HR,		// 英語_クロアチア
	KaiLocaleIdentifierEN_SG,		// 英語_シンガポール
	KaiLocaleIdentifierEN_CH,		// 英語_スイス
	KaiLocaleIdentifierEN_SE,		// 英語_スウェーデン
	KaiLocaleIdentifierEN_ES,		// 英語_スペイン
	KaiLocaleIdentifierEN_SK,		// 英語_スロバキア
	KaiLocaleIdentifierEN_SI,		// 英語_スロベニア
	KaiLocaleIdentifierEN_CZ,		// 英語_チェコ共和国
	KaiLocaleIdentifierEN_DK,		// 英語_デンマーク
	KaiLocaleIdentifierEN_DE,		// 英語_ドイツ
	KaiLocaleIdentifierEN_TR,		// 英語_トルコ
	KaiLocaleIdentifierEN_NO,		// 英語_ノルウェー
	KaiLocaleIdentifierEN_HU,		// 英語_ハンガリー
	KaiLocaleIdentifierEN_FI,		// 英語_フィンランド
	KaiLocaleIdentifierEN_FR,		// 英語_フランス
	KaiLocaleIdentifierEN_BE,		// 英語_ベルギー
	KaiLocaleIdentifierEN_PL,		// 英語_ポーランド
	KaiLocaleIdentifierEN_PT,		// 英語_ポルトガル
	KaiLocaleIdentifierEN_LV,		// 英語_ラトビア
	KaiLocaleIdentifierEN_LT,		// 英語_リトアニア
	KaiLocaleIdentifierEN_RO,		// 英語_ルーマニア
	KaiLocaleIdentifierEN_RU,		// 英語_ロシア
	KaiLocaleIdentifierEN_HK,		// 英語_香港
	KaiLocaleIdentifierMax,
	KaiLocaleIdentifierUnknown = KaiLocaleIdentifierMax,
} KaiLocaleIdentifier;



// 言語コード
typedef enum
{
	KaiLocaleLanguageEN = 0,
	KaiLocaleLanguageJA,
	KaiLocaleLanguageFR,
	KaiLocaleLanguageDE,
	KaiLocaleLanguageNL,
	KaiLocaleLanguageIT,
	KaiLocaleLanguageES,
	KaiLocaleLanguagePT,
	KaiLocaleLanguagePT_PT,
	KaiLocaleLanguageDA,
	KaiLocaleLanguageFI,
	KaiLocaleLanguageNB,
	KaiLocaleLanguageSV,
	KaiLocaleLanguageKO,
	KaiLocaleLanguageZH_HANS,
	KaiLocaleLanguageZH_HANT,
	KaiLocaleLanguageRU,
	KaiLocaleLanguagePL,
	KaiLocaleLanguageTR,
	KaiLocaleLanguageUK,
	KaiLocaleLanguageAR,
	KaiLocaleLanguageHR,
	KaiLocaleLanguageCS,
	KaiLocaleLanguageEL,
	KaiLocaleLanguageHE,
	KaiLocaleLanguageRO,
	KaiLocaleLanguageSK,
	KaiLocaleLanguageTH,
	KaiLocaleLanguageID,
	KaiLocaleLanguageMS,
	KaiLocaleLanguageEN_GB,
	KaiLocaleLanguageCA,
	KaiLocaleLanguageHU,
	KaiLocaleLanguageVI,
	KaiLocaleLanguageES_MX,
	KaiLocaleLanguageEN_AU,

	KaiLocaleLanguageUnknown,
	KaiLocaleLanguageMax = KaiLocaleLanguageUnknown,
} KaiLocaleLanguage;

/**
 * @brief ロケール系ユーティリティ
 */
@interface KaiLocale : NSObject

+ (KaiLocaleIdentifier)localeIdentifier;
+ (KaiLocaleLanguage)preferredLanguage;

@end
