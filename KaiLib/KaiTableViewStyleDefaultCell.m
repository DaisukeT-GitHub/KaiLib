//
//  KaiTableViewStyleDefaultCell.m
//  KaiLib
//

#import "KaiTableViewStyleDefaultCell.h"

NSString * const KaiTableViewStyleDefaultCellReuseIdentifier = @"KaiTableViewStyleDefaultCellReuseIdentifier";

@implementation KaiTableViewStyleDefaultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
