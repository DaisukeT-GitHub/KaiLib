//
//  KaiTextFieldTableViewCell.h
//  KaiLib
//

#import "KaiLib.h"



extern NSString * const KaiTextFieldTableViewCellReuseIdentifier;

@interface KaiTextFieldTableViewCell : UITableViewCell

@property (weak) IBOutlet UILabel *label;
@property (weak) IBOutlet UITextField *textField;

+ (NSString *)nibName;

@end
