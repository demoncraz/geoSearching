//
//  LocationDescriptionTableViewCell.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationDescriptionTableViewCell.h"

@interface LocationDescriptionTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end


@implementation LocationDescriptionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLocDescription:(NSString *)locDescription {
    _locDescription = locDescription;
    self.desLabel.text = locDescription;
}

@end
