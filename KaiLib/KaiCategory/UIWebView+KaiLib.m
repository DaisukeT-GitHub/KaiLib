//
//  UIWebView+KaiLib.m
//  KaiLib
//

#import "UIWebView+KaiLib.h"

@implementation UIWebView (KaiLib)

/**
 * @brief タイトル取得
 */
- (NSString *)title
{
	NSString *ret = [self stringByEvaluatingJavaScriptFromString:@"document.title"];

	return ret;
}

/**
 * @brief URL 取得
 */
- (NSURL *)URL
{
    NSString *str = [self stringByEvaluatingJavaScriptFromString:@"document.URL"];
	NSURL *ret = nil;

	if([str length] > 0)
	{
		ret = [NSURL URLWithString:str];
	}

	return ret;
}

@end
