//
//  LocationDetailTableViewCell.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationDetailTableViewCell.h"

@interface LocationDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation LocationDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setType:(NSInteger)type {
    _type = type;
    if (type == 0) {
        self.imageView1.image = [UIImage imageNamed:@"detail01"];
        self.imageView2.image = [UIImage imageNamed:@"detail02"];
    } else {
        self.imageView1.image = [UIImage imageNamed:@"cloths01"];
        self.imageView2.image = [UIImage imageNamed:@"cloths02"];
    }
}

@end
