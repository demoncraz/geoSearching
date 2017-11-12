//
//  BusinessNewTableViewCell.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/12.
//

#import "BusinessNewTableViewCell.h"

@interface BusinessNewTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation BusinessNewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)name {
    _name = name;
    self.nameLabel.text = [NSString stringWithFormat:@"%@: ", name];
}

@end
