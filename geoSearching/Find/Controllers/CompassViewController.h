//
//  CompassViewController.h
//  geoSearching
//
//  Created by demoncraz on 2017/11/10.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CompassViewController : UIViewController

@property (nonatomic, strong) id<MKAnnotation> annotation;

@property (nonatomic, assign) CLLocationDistance distance;

@end
