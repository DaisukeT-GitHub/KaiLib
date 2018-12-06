//
//  UIActivityViewController+KaiLib.m
//  KaiLib
//

#import "UIActivityViewController+KaiLib.h"

@implementation UIActivityViewController (KaiLib)

- (void)setIncludedActivityTypes:(NSArray *)array
{
	NSArray *allTypes = @[UIActivityTypePostToFacebook,
						  UIActivityTypePostToTwitter,
						  UIActivityTypePostToWeibo,
						  UIActivityTypeMessage,
						  UIActivityTypeMail,
						  UIActivityTypePrint,
						  UIActivityTypeCopyToPasteboard,
						  UIActivityTypeAssignToContact,
						  UIActivityTypeSaveToCameraRoll,
						  UIActivityTypeAddToReadingList,
						  UIActivityTypePostToFlickr,
						  UIActivityTypePostToVimeo,
						  UIActivityTypePostToTencentWeibo,
						  UIActivityTypeAirDrop,];
	
	NSMutableArray *excludeTypes = [NSMutableArray array];
	BOOL isInclude = NO;

	for(NSString *type in allTypes){
		isInclude = NO;
		for(NSString *includeType in array){
			if(![type isEqualToString:includeType]) continue;
			
			isInclude = YES;
			break;
		}

		if(isInclude) continue;
		
		[excludeTypes addObject:type];
	}

	[self setExcludedActivityTypes:excludeTypes];
}

@end
