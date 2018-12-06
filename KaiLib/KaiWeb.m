//
//  KaiWeb.m
//  KaiLib
//

#import "KaiWeb.h"

@implementation KaiWeb

/**
 * @brief URL のバリデート
 */
+ (BOOL)validateUrl:(NSURL *)URL
{
	if(URL == nil) return NO;

	if(![[URL scheme] isEqual:@"http"] && ![[URL scheme] isEqual:@"https"])
	{
		if(![[UIApplication sharedApplication] canOpenURL:URL])
		{
			return NO;
		}
	}

	return YES;
}

/**
 * @brief ファビコンイメージの取得
 */
+ (UIImage *)faviconImage:(NSURL *)URL
{
	if(URL == nil) return nil;

	NSString *serviceStr = @"http://www.google.com/s2/favicons?domain=";
	NSString *domain = [URL host];
	NSString *reqStr = [NSString stringWithFormat:@"%@%@", serviceStr, domain];
	NSURL *reqURL = [NSURL URLWithString:reqStr];
	NSData *data = [NSData dataWithContentsOfURL:reqURL];

	UIImage *image = [UIImage imageWithData:data];

	return image;
}

/**
 * @brief URL から文字列への変換
 */
+ (NSString *)URLToString:(NSURL *)URL
{
	return [URL absoluteString];
}



#pragma mark - new window
/**
 * @brief 新しいタブ・ウインドウを開く URL サフィックスを取得
 */
+ (NSString *)newWindowURLSuffix
{
	return @"kaiwebnewtab";
}

/**
 * @brief 新しいタブ・ウインドウを開く URL か
 */
+ (BOOL)isNewWindowURL:(NSURL *)URL
{
	if([[URL fragment] hasSuffix:[KaiWeb newWindowURLSuffix]])
	{
		return YES;
	}

	return NO;
}

/**
 * @brief URL から新しいタブ・ウインドウのための URL サフィックスを削除する
 */
+ (NSURL *)URLWithoutNewWindowURLSuffix:(NSURL *)URL
{
	NSURL *ret = URL;

	if(![[URL fragment] hasSuffix:[KaiWeb newWindowURLSuffix]])
	{
		return ret;
	}

	// URL サフィックスを削除した URL を作成する
	NSString *URLStr = [KaiWeb URLToString:URL];
	NSUInteger suffixLength = [[KaiWeb newWindowURLSuffix] length] + 1;
	NSString *URLWithoutScheme = [URLStr substringToIndex:[URLStr length] - suffixLength];

	ret = [NSURL URLWithString:URLWithoutScheme];

	return ret;
}

/**
 * @brief 新しいタブ・ウインドウを開く URL サフィックスを変更する
 */
+ (NSString *)replaceNewWindowURLSuffixJS
{
	NSString *ret =
	@"var elements = document.getElementsByTagName(\"a\");"
	"for(var i=0; i < elements.length; i++)"
	"{"
	"	var element = elements[i];"
	"	var target = element.getAttribute(\"target\");"
	"	var href = element.getAttribute(\"href\");"
	""
	"	if(target != \"_blank\") continue;"
	""
	"   var index = href.indexOf(\"kaiwebnewtab\");"
	"	if(index >= 0) continue;"
	""
	"	var repURL = href + (href.match(/#/) ? \"_kaiwebnewtab\" : \"#kaiwebnewtab\");"
	"	element.setAttribute(\"href\", repURL);"
	"}"
	"";
	
	return ret;
}

/**
 * @brief 空ページの URL
 */
+ (NSURL *)blankPageURL
{
	NSURL *ret = [NSURL URLWithString:@"about:blank"];

	return ret;
}

/**
 * @brief ページ内リンクかどうか
 */
+ (BOOL)isLinkInPageWithURL:(NSURL *)URL
{
	NSString *str = [KaiWeb URLToString:URL];
	NSRange sharpRange = [str rangeOfString:@"#"];

	if(sharpRange.location == NSNotFound) return NO;

	return YES;
}

@end
