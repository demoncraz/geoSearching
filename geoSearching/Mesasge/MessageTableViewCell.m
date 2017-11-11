//
//  MessageTableViewCell.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/11.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iconImageView.layer.cornerRadius = 20;
    self.iconImageView.layer.masksToBounds = YES;
}

- (void)setModel:(MessageModel *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.content;
    self.iconImageView.image = [UIImage imageNamed:model.icon];
}

@end
