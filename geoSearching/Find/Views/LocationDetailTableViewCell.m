//
//  LocationDetailTableViewCell.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationDetailTableViewCell.h"

@interface LocationDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@end

@implementation LocationDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImage:(NSString *)image {
    _image = image;
    self.detailImageView.image = [UIImage imageNamed:image];
}

@end
