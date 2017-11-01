//
//  LocationInfoModel.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationInfoModel.h"

@interface LocationInfoModel()

@property (nonatomic, strong) NSArray *titles;
@end

@implementation LocationInfoModel

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = [NSArray arrayWithObjects:@"Grocery Store", @"Car Shop", @"Super Market", @"Walmart", @"Laundry", nil];
    }
    return _titles;
}


+ (instancetype)randomModel {
    LocationInfoModel *model = [[LocationInfoModel alloc] init];
    NSInteger index = arc4random_uniform(5);
    model.locTitle = [model.titles objectAtIndex:index];
    model.locDescription = @"The team at this full service supermarket in the heart of the Whistler Village is committed to excellence in all that it does; seeking out the freshest ingredients locally as well as globally, providing a product mix to satisfy the many tastes and dietary needs of our broad customer base, all provided in a clean and constantly updated store.";
    
    NSInteger like = arc4random_uniform(100);
    model.locLikeCount = [NSString stringWithFormat:@"%zd", like];
    NSInteger distance1 = arc4random_uniform(20);
    NSInteger distance2 = arc4random_uniform(10);
    model.locDistance = [NSString stringWithFormat:@"%zd.%zdkm", distance1, distance2];
    return model;
}

@end
