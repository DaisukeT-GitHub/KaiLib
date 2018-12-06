//
//  KaiTextFieldTableViewCell.m
//  KaiLib
//

#import "KaiTextFieldTableViewCell.h"

NSString * const KaiTextFieldTableViewCellReuseIdentifier = @"KaiTextFieldTableViewCellReuseIdentifier";

@implementation KaiTextFieldTableViewCell

- (void)awakeFromNib
{
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];
}

+ (NSString *)nibName
{
	return @"KaiTextFieldTableViewCell";
}

@end
