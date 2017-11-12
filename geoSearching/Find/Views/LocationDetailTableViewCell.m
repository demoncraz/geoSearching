//
//  LocationDetailTableViewCell.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationDetailTableViewCell.h"
#import "Constants.h"

@interface LocationDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *hintView;
@property (weak, nonatomic) IBOutlet UIButton *communityButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *positionImageView;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UIView *commentView;

@end

@implementation LocationDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iconImageView.layer.cornerRadius = 20;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.hidden = YES;
    self.commentLabel.hidden = YES;
    self.positionImageView.hidden = YES;
    self.positionLabel.hidden =YES;
    self.commentView.hidden = YES;
}

- (void)setImage:(NSString *)image {
    _image = image;
    self.hintView.CC_centerX = self.aboutButton.CC_centerX;
    [self.communityButton setTitleColor:ColorWithWhite(66) forState:0];
    [self.aboutButton setTitleColor:DefaultBlueColor forState:0];
    self.detailImageView.hidden = NO;
    self.detailLabel.hidden = NO;
    self.iconImageView.hidden = YES;
    self.commentLabel.hidden = YES;
    self.positionImageView.hidden = YES;
    self.positionLabel.hidden = YES;
    self.commentView.hidden = YES;
}

- (void)setNumber:(NSString *)number {
    _number = number;
    self.detailLabel.text = [NSString stringWithFormat:@"Details: %@", number];
}
- (IBAction)communityClick:(UIButton *)sender {
    if (!self.shouldShowComment) {
        return;
    }
    self.hintView.CC_centerX = self.communityButton.CC_centerX;
    [self.communityButton setTitleColor:DefaultBlueColor forState:0];
    [self.aboutButton setTitleColor:ColorWithWhite(66) forState:0];
    self.detailImageView.hidden = YES;
    self.detailLabel.hidden = YES;
    self.iconImageView.hidden = NO;
    self.commentLabel.hidden = NO;
    self.positionImageView.hidden = NO;
    self.positionLabel.hidden = NO;
    self.commentView.hidden = NO;
}

- (IBAction)aboutBtnClick:(id)sender {
    if (!self.shouldShowComment) {
        return;
    }
    self.hintView.CC_centerX = self.aboutButton.CC_centerX;
    [self.communityButton setTitleColor:ColorWithWhite(66) forState:0];
    [self.aboutButton setTitleColor:DefaultBlueColor forState:0];
    self.detailImageView.hidden = NO;
    self.detailLabel.hidden = NO;
    self.iconImageView.hidden = YES;
    self.commentLabel.hidden = YES;
    self.positionImageView.hidden = YES;
    self.positionLabel.hidden = YES;
    self.commentView.hidden = YES;
}


@end
