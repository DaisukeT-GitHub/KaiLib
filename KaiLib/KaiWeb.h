//
//  KaiWeb.h
//  KaiLib
//

#import "KaiLib.h"

/**
 * @brief Web 系ユーティリティ
 */
@interface KaiWeb : NSObject

+ (BOOL)validateUrl:(NSURL *)URL;
+ (UIImage *)faviconImage:(NSURL *)URL;
+ (NSString *)URLToString:(NSURL *)URL;

+ (NSString *)newWindowURLSuffix;
+ (BOOL)isNewWindowURL:(NSURL *)URL;
+ (NSURL *)URLWithoutNewWindowURLSuffix:(NSURL *)URL;
+ (NSString *)replaceNewWindowURLSuffixJS;

+ (NSURL *)blankPageURL;
+ (BOOL)isLinkInPageWithURL:(NSURL *)URL;

@end
