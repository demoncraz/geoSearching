//
//  ViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "ViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
//#import <MKMapKit/MKMapKit.h>
//#import <MapKit/MapKit.h>
#import "Constants.h"
#import "LocationDetailView.h"

#import <MapKit/MapKit.h>

@interface ViewController ()<LocationDetailViewDelegate, MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

//@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, assign) CLLocationCoordinate2D currentCoord;

@property (nonatomic, assign) BOOL hasUpdatedAnnotes;

@property (nonatomic, strong) MKAnnotationView *selAnnotationView;

@property (nonatomic, strong) LocationDetailView *locationDetailView;

@end

@implementation ViewController

- (LocationDetailView *)locationDetailView {
    if (_locationDetailView == nil) {
        _locationDetailView = [[LocationDetailView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, ScreenH)];
        [self.view addSubview:_locationDetailView];
        _locationDetailView.frame = CGRectMake(0, ScreenH, ScreenW, ScreenH);
        _locationDetailView.delegate = self;
    }
    return _locationDetailView;
}

- (AMapLocationManager *)locationManager {
    if (_locationManager == nil) {
        _locationManager = [[AMapLocationManager alloc] init];
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    self.navigationController.title = @"Find";
    self.navigationItem.title = @"Find";

    [AMapServices sharedServices].enableHTTPS = YES;
    ///初始化地图
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH + 44)];
    self.mapView = mapView;

    ///把地图添加至view
    [self.view addSubview:mapView];
//    mapView.language = MKMapLanguageEn;
//    mapView.showsScale = NO;
//    mapView.showsCompass = NO;
    mapView.delegate = self;

    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MKUserTrackingModeFollow;

    [self.view addSubview:self.locationDetailView];
    
    [self setupLocateMeButton];
}

- (void)setupLocateMeButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(locateMeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(10, 10, 45, 45);
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(1, 1);
    button.layer.shadowOpacity = 0.6;
    button.layer.shadowRadius = 2;
    [button setImage:[UIImage imageNamed:@"locateMe"] forState:0];
    [self.view addSubview:button];
}

- (void)locateMeBtnClick {
    [self.mapView setCenterCoordinate:self.currentCoord animated:YES];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//
//    self.title = @"Find";
//
//    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
//    self.mapView = mapView;
//    [self.view addSubview:mapView];
//    mapView.showsUserLocation = YES;
//    mapView.userTrackingMode = MKUserTrackingModeFollow;
//
//    mapView.delegate = self;
//}


- (void)generateRandomLocationWithRegion:(MKCoordinateRegion)region {
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
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = cord;
        annotation.title = [NSString stringWithFormat:@"%.2f", newLat];
        [annotations addObject:annotation];
    }
    [self.mapView addAnnotations:annotations];
//    CLLocationDegrees currentLatitude = self.mapView.userLocation.location.coordinate.latitude;
//    CLLocationDegrees curretLongitude = self.mapView.userLocation.location.coordinate.longitude;
//    self.hasUpdatedAnnotes = YES;

}

- (void)showLocationDetailView:(BOOL)show {
    if (show) {
        self.locationDetailView.CC_y = ScreenH;
        [UIView animateWithDuration:0.25 animations:^{
            self.locationDetailView.CC_y = ScreenH - 144 - 44;
        }];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            self.locationDetailView.CC_y = ScreenH;
        }];
    }
}

#pragma mark - LocationDetailViewDelegate
- (void)LocationDetailView:(LocationDetailView *)view didClickToShow:(BOOL)showShow {
    [UIView animateWithDuration:0.3 animations:^{
        self.locationDetailView.CC_y = showShow ? 0 : ScreenH - 144 - 44;
    }];
}

//- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *view = views[0];
    if ([view.annotation isKindOfClass:[MKUserLocation class]]) {
        view.canShowCallout = NO;
        CLLocationCoordinate2D coord = mapView.region.center;
        self.currentCoord = coord;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self generateRandomLocationWithRegion:mapView.region];
        });
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
//        NSArray *imageNames = @[@"001", @"002", @"003
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (view == nil) {
            view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        view.canShowCallout = NO;
        view.draggable = NO;
        UIImage *image = [UIImage imageNamed:@"bluePoint"];
//        view.tag = random;
        view.image = image;
        return view;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    CLLocationCoordinate2D coord = mapView.region.center;
//    self.currentCoord = coord;
//    if (!self.hasUpdatedAnnotes) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self generateRandomLocationWithRegion:mapView.region];
//        });
//    }
//    self.hasUpdatedAnnotes = YES;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    CLLocationCoordinate2D coord = view.annotation.coordinate;
    MKMapPoint selectedPoint = MKMapPointForCoordinate(coord);
    MKMapPoint currentPint = MKMapPointForCoordinate(self.currentCoord);
    CLLocationDistance distance = MKMetersBetweenMapPoints(selectedPoint, currentPint);

    view.image = [UIImage imageNamed:@"bluePoint_selected_1"];
    LocationInfoModel *model = [LocationInfoModel randomModel];
    if (distance < 1000) {
        model.locDistance = [NSString stringWithFormat:@"%.0fm", distance];
    } else {
        
        model.locDistance = [NSString stringWithFormat:@"%.1fkm", distance * 0.001];
    }
    self.locationDetailView.dataSource = model;
    [self showLocationDetailView:YES];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    view.image = [UIImage imageNamed:@"bluePoint"];
    [self showLocationDetailView:NO];
}



@end
