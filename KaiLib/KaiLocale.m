//
//  KaiLocale.m
//  KaiLib
//

#import "KaiLocale.h"



@implementation KaiLocale

/**
 * @brief 地域の識別子を返す
 */
+ (KaiLocaleIdentifier)localeIdentifier
{
	KaiLocaleIdentifier ret = KaiLocaleIdentifierUnknown;

	const NSString *keyIDStr = @"keyIDStr";
	const NSString *keyIDEnum = @"keyIDEnum";

	NSArray *table = @[
					   @{ keyIDStr:@"ja_JP", keyIDEnum:@(KaiLocaleIdentifierJA_JP) },
					   @{ keyIDStr:@"en_IE", keyIDEnum:@(KaiLocaleIdentifierEN_IE) },
					   @{ keyIDStr:@"en_US", keyIDEnum:@(KaiLocaleIdentifierEN_US) },
					   @{ keyIDStr:@"en_GB", keyIDEnum:@(KaiLocaleIdentifierEN_GB) },
					   @{ keyIDStr:@"en_IT", keyIDEnum:@(KaiLocaleIdentifierEN_IT) },
					   @{ keyIDStr:@"en_IN", keyIDEnum:@(KaiLocaleIdentifierEN_IN) },
					   @{ keyIDStr:@"en_EE", keyIDEnum:@(KaiLocaleIdentifierEN_EE) },
					   @{ keyIDStr:@"en_AU", keyIDEnum:@(KaiLocaleIdentifierEN_AU) },
					   @{ keyIDStr:@"en_AT", keyIDEnum:@(KaiLocaleIdentifierEN_AT) },
					   @{ keyIDStr:@"en_NL", keyIDEnum:@(KaiLocaleIdentifierEN_NL) },
					   @{ keyIDStr:@"en_CA", keyIDEnum:@(KaiLocaleIdentifierEN_CA) },
					   @{ keyIDStr:@"en_HR", keyIDEnum:@(KaiLocaleIdentifierEN_HR) },
					   @{ keyIDStr:@"en_SG", keyIDEnum:@(KaiLocaleIdentifierEN_SG) },
					   @{ keyIDStr:@"en_CH", keyIDEnum:@(KaiLocaleIdentifierEN_CH) },
					   @{ keyIDStr:@"en_SE", keyIDEnum:@(KaiLocaleIdentifierEN_SE) },
					   @{ keyIDStr:@"en_ES", keyIDEnum:@(KaiLocaleIdentifierEN_ES) },
					   @{ keyIDStr:@"en_SK", keyIDEnum:@(KaiLocaleIdentifierEN_SK) },
					   @{ keyIDStr:@"en_SI", keyIDEnum:@(KaiLocaleIdentifierEN_SI) },
					   @{ keyIDStr:@"en_CZ", keyIDEnum:@(KaiLocaleIdentifierEN_CZ) },
					   @{ keyIDStr:@"en_DK", keyIDEnum:@(KaiLocaleIdentifierEN_DK) },
					   @{ keyIDStr:@"en_DE", keyIDEnum:@(KaiLocaleIdentifierEN_DE) },
					   @{ keyIDStr:@"en_TR", keyIDEnum:@(KaiLocaleIdentifierEN_TR) },
					   @{ keyIDStr:@"en_NO", keyIDEnum:@(KaiLocaleIdentifierEN_NO) },
					   @{ keyIDStr:@"en_HU", keyIDEnum:@(KaiLocaleIdentifierEN_HU) },
					   @{ keyIDStr:@"en_FI", keyIDEnum:@(KaiLocaleIdentifierEN_FI) },
					   @{ keyIDStr:@"en_FR", keyIDEnum:@(KaiLocaleIdentifierEN_FR) },
					   @{ keyIDStr:@"en_BE", keyIDEnum:@(KaiLocaleIdentifierEN_BE) },
					   @{ keyIDStr:@"en_PL", keyIDEnum:@(KaiLocaleIdentifierEN_PL) },
					   @{ keyIDStr:@"en_PT", keyIDEnum:@(KaiLocaleIdentifierEN_PT) },
					   @{ keyIDStr:@"en_LV", keyIDEnum:@(KaiLocaleIdentifierEN_LV) },
					   @{ keyIDStr:@"en_LT", keyIDEnum:@(KaiLocaleIdentifierEN_LT) },
					   @{ keyIDStr:@"en_RO", keyIDEnum:@(KaiLocaleIdentifierEN_RO) },
					   @{ keyIDStr:@"en_RU", keyIDEnum:@(KaiLocaleIdentifierEN_RU) },
					   @{ keyIDStr:@"en_HK", keyIDEnum:@(KaiLocaleIdentifierEN_HK) },
					   ];

	NSString *idStr = [[NSLocale currentLocale] localeIdentifier];
	for(NSDictionary *dict in table)
	{
		if(![dict[keyIDStr] isEqualToString:idStr]) continue;
	
		ret = (KaiLocaleIdentifier)[dict[keyIDEnum] integerValue];
		break;
	}

	return ret;
}



/**
 * @brief 設定されている望まれる言語コードを返す
 */
+ (KaiLocaleLanguage)preferredLanguage
{
	KaiLocaleLanguage ret = KaiLocaleLanguageUnknown;
	
	const NSString *keyIDStr = @"keyIDStr";
	const NSString *keyIDEnum = @"keyIDEnum";
	
	NSArray *table = @[
					   @{ keyIDStr:@"en", keyIDEnum:@(KaiLocaleLanguageEN) },
					   @{ keyIDStr:@"ja", keyIDEnum:@(KaiLocaleLanguageJA) },
					   @{ keyIDStr:@"fr", keyIDEnum:@(KaiLocaleLanguageFR) },
					   @{ keyIDStr:@"de", keyIDEnum:@(KaiLocaleLanguageDE) },
					   @{ keyIDStr:@"nl", keyIDEnum:@(KaiLocaleLanguageNL) },
					   @{ keyIDStr:@"it", keyIDEnum:@(KaiLocaleLanguageIT) },
					   @{ keyIDStr:@"es", keyIDEnum:@(KaiLocaleLanguageES) },
					   @{ keyIDStr:@"pt", keyIDEnum:@(KaiLocaleLanguagePT) },
					   @{ keyIDStr:@"pt-PT", keyIDEnum:@(KaiLocaleLanguagePT_PT) },
					   @{ keyIDStr:@"da", keyIDEnum:@(KaiLocaleLanguageDA) },
					   @{ keyIDStr:@"fi", keyIDEnum:@(KaiLocaleLanguageFI) },
					   @{ keyIDStr:@"nb", keyIDEnum:@(KaiLocaleLanguageNB) },
					   @{ keyIDStr:@"sv", keyIDEnum:@(KaiLocaleLanguageSV) },
					   @{ keyIDStr:@"ko", keyIDEnum:@(KaiLocaleLanguageKO) },
					   @{ keyIDStr:@"zh-Hans", keyIDEnum:@(KaiLocaleLanguageZH_HANS) },
					   @{ keyIDStr:@"zh-Hant", keyIDEnum:@(KaiLocaleLanguageZH_HANT) },
					   @{ keyIDStr:@"ru", keyIDEnum:@(KaiLocaleLanguageRU) },
					   @{ keyIDStr:@"pl", keyIDEnum:@(KaiLocaleLanguagePL) },
					   @{ keyIDStr:@"tr", keyIDEnum:@(KaiLocaleLanguageTR) },
					   @{ keyIDStr:@"uk", keyIDEnum:@(KaiLocaleLanguageUK) },
					   @{ keyIDStr:@"ar", keyIDEnum:@(KaiLocaleLanguageAR) },
					   @{ keyIDStr:@"hr", keyIDEnum:@(KaiLocaleLanguageHR) },
					   @{ keyIDStr:@"cs", keyIDEnum:@(KaiLocaleLanguageCS) },
					   @{ keyIDStr:@"el", keyIDEnum:@(KaiLocaleLanguageEL) },
					   @{ keyIDStr:@"he", keyIDEnum:@(KaiLocaleLanguageHE) },
					   @{ keyIDStr:@"ro", keyIDEnum:@(KaiLocaleLanguageRO) },
					   @{ keyIDStr:@"sk", keyIDEnum:@(KaiLocaleLanguageSK) },
					   @{ keyIDStr:@"th", keyIDEnum:@(KaiLocaleLanguageTH) },
					   @{ keyIDStr:@"id", keyIDEnum:@(KaiLocaleLanguageID) },
					   @{ keyIDStr:@"ms", keyIDEnum:@(KaiLocaleLanguageMS) },
					   @{ keyIDStr:@"en_GB", keyIDEnum:@(KaiLocaleLanguageEN_GB) },
					   @{ keyIDStr:@"ca", keyIDEnum:@(KaiLocaleLanguageCA) },
					   @{ keyIDStr:@"hu", keyIDEnum:@(KaiLocaleLanguageHU) },
					   @{ keyIDStr:@"vi", keyIDEnum:@(KaiLocaleLanguageVI) },
					   @{ keyIDStr:@"es_MX", keyIDEnum:@(KaiLocaleLanguageES_MX) },
					   @{ keyIDStr:@"en_AU", keyIDEnum:@(KaiLocaleLanguageEN_AU) },
					   ];
	
	NSString *idStr = [NSLocale preferredLanguages][0];
	for(NSDictionary *dict in table)
	{
		if(![dict[keyIDStr] isEqualToString:idStr]) continue;
		
		ret = (KaiLocaleLanguage)[dict[keyIDEnum] integerValue];
		break;
	}
	
	return ret;
}

@end
