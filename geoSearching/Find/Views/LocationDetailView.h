//
//  LocationDetailView.h
//  geoSearching
//
//  Created by demoncraz on 2017/10/31.
//

#import <UIKit/UIKit.h>
#import "LocationInfoModel.h"
@class LocationDetailView;

@protocol LocationDetailViewDelegate<NSObject>

- (void)LocationDetailView:(LocationDetailView *)view didClickToShow:(BOOL)showShow;

@end

@interface LocationDetailView : UIView

@property (nonatomic, weak) id<LocationDetailViewDelegate> delegate;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) LocationInfoModel *dataSource;

@end
