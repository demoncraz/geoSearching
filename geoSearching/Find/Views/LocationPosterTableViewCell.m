//
//  LocationPosterTableViewCell.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationPosterTableViewCell.h"
#import "Constants.h"

@interface LocationPosterTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *posterNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *contactButton;

@end


@implementation LocationPosterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contactButton.layer.cornerRadius = 5;
    self.contactButton.layer.borderColor = DefaultBlueColor.CGColor;
    self.contactButton.layer.borderWidth = 0.5;
    
    self.iconImageVIew.layer.cornerRadius = 35;
    self.iconImageVIew.layer.masksToBounds = YES;
}

- (void)setPosterName:(NSString *)posterName {
    _posterName = posterName;
    self.posterNameLabel.text = posterName;
}

- (void)setPosterIcon:(NSString *)posterIcon {
    _posterIcon = posterIcon;
    self.iconImageVIew.image = [UIImage imageNamed:posterIcon];
}

- (void)setPostTime:(NSString *)postTime {
    _postTime = postTime;
    self.postTimeLabel.text = postTime;
}

@end
