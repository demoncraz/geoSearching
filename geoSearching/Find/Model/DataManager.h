//
//  DataManager.h
//  geoSearching
//
//  Created by demoncraz on 2017/11/10.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DataManager : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D currentLocation;

+ (instancetype)shared;

@end
