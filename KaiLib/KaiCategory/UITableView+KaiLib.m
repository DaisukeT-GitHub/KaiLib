//
//  UITableView+KaiLib.m
//  KaiLib
//

#import "UITableView+KaiLib.h"

@implementation UITableView (KaiLib)

- (void)deselect:(BOOL)animted
{
	NSIndexPath *indexPath = [self indexPathForSelectedRow];
	[self deselectRowAtIndexPath:indexPath animated:animted];
}

- (UITableViewCell *)cellForRow:(NSInteger)row section:(NSInteger)section
{
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
	return [self cellForRowAtIndexPath:indexPath];
}

- (void)setExclusiveCheckmarkForRow:(NSInteger)row section:(NSInteger)section
{
	NSInteger rowNum = [self numberOfRowsInSection:section];

	for(NSInteger i = 0; i < rowNum; i++)
	{
		UITableViewCell *cell = [self cellForRow:i section:section];
		[cell setAccessoryType:UITableViewCellAccessoryNone];
		if(i != row){
			continue;
		}
		[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	}
}


@end
