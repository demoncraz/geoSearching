//
//  ViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "ViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>
#import "LocationDetailViewController.h"

@interface ViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, assign) CLLocationCoordinate2D currentCoord;

@property (nonatomic, assign) BOOL hasUpdatedAnnotes;

@property (nonatomic, strong) MAAnnotationView *selAnnotationView;

@property (nonatomic, strong) LocationDetailViewController *locationDetailVC;

@end

@implementation ViewController

- (AMapLocationManager *)locationManager {
    if (_locationManager == nil) {
        _locationManager = [[AMapLocationManager alloc] init];
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Find";
    
    [AMapServices sharedServices].enableHTTPS = YES;
    ///初始化地图
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = mapView;
    
    ///把地图添加至view
    [self.view addSubview:mapView];
    mapView.language = MAMapLanguageEn;
    mapView.showsScale = NO;
    
    mapView.delegate = self;
    
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MAUserTrackingModeFollow;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)generateRandomLocationWithRegion:(MACoordinateRegion)region {
    CLLocationCoordinate2D coord = self.currentCoord;
    NSMutableArray *annotations = [NSMutableArray array];
    NSInteger flag1 = 1;
    NSInteger flag2 = -1;
    for (NSInteger i = 0; i < 100; i++) {
        int random1 = arc4random_uniform(100);
        flag1 = random1 % 2 == 0 ? 1 : -1;
        int random2 = arc4random_uniform(100);
        flag2 = random2 % 2 == 0 ? 1 : -1;
        CLLocationDegrees newLat = coord.latitude + random1 * flag1 * 0.01 * region.span.latitudeDelta * 0.5;
        CLLocationDegrees newLong = coord.longitude + random2 * flag2 * 0.01 * region.span.longitudeDelta * 0.5;
        CLLocationCoordinate2D cord = {newLat, newLong};
        //        CLLocation *location = [[CLLocation alloc] initWithLatitude:cord.latitude longitude:cord.longitude];
        MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
        annotation.coordinate = cord;
        annotation.title = [NSString stringWithFormat:@"%.2f", newLat];
        [annotations addObject:annotation];
    }
    
    [self.mapView addAnnotations:annotations];
    
//    CLLocationDegrees currentLatitude = self.mapView.userLocation.location.coordinate.latitude;
//    CLLocationDegrees curretLongitude = self.mapView.userLocation.location.coordinate.longitude;
    self.hasUpdatedAnnotes = YES;
    
}

#pragma mark - MAMapViewDelegate

- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MAAnnotationView *view = views[0];
    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        view.canShowCallout = NO;
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        NSArray *imageNames = @[@"001", @"002", @"003", @"004"];
        int random = arc4random_uniform(4);
        NSString *imageName = imageNames[random];
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (view == nil) {
            view = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        view.canShowCallout = YES;
        //        view.animatesDrop = YES;
        view.draggable = NO;
        UIImage *image = [UIImage imageNamed:imageName];
        view.tag = random;
        view.image = image;
        return view;
    }
    return nil;
}

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    CLLocationCoordinate2D coord = mapView.region.center;
    self.currentCoord = coord;
    if (!self.hasUpdatedAnnotes) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self generateRandomLocationWithRegion:mapView.region];
        });
    }
    self.hasUpdatedAnnotes = YES;
}

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    NSInteger index = view.tag;
    NSArray *selImageNames = @[@"001_selected", @"002_selected", @"003_selected", @"004_selected"];
    NSString *selImageName = selImageNames[index];
    view.image = [UIImage imageNamed:selImageName];
    
//    LocationDetailViewController *locationDetailVC = [[LocationDetailViewController alloc] init];
////    [self presentViewController:locationDetailVC animated:YES completion:nil];
//    [self presentSemiViewController:locationDetailVC withOptions:nil completion:nil dismissBlock:nil];
}

- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view {
    NSInteger index = view.tag;
    NSArray *selImageNames = @[@"001", @"002", @"003", @"004"];
    NSString *selImageName = selImageNames[index];
    view.image = [UIImage imageNamed:selImageName];
}

@end
