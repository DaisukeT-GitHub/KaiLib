//
//  KaiTextFieldTableViewCell.m
//  KaiLib
//

#import "KaiTextFieldTableViewCell.h"

NSString * const KaiTextFieldTableViewCellReuseIdentifier = @"KaiTextFieldTableViewCellReuseIdentifier";

@implementation KaiTextFieldTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
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
