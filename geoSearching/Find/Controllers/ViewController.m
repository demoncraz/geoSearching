//
//  ViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "ViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "SearchMainViewController.h"
#import "FilterTableViewController.h"
//#import <MKMapKit/MKMapKit.h>
//#import <MapKit/MapKit.h>
#import "Constants.h"
#import "LocationDetailView.h"
#import "GeneticNavViewController.h"
#import <MapKit/MapKit.h>
#import "ListTableViewCell.h"

@interface ViewController ()<LocationDetailViewDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MKMapView *mapView;

//@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, assign) CLLocationCoordinate2D currentCoord;

@property (nonatomic, assign) BOOL hasUpdatedAnnotes;

@property (nonatomic, strong) MKAnnotationView *selAnnotationView;

@property (nonatomic, strong) LocationDetailView *locationDetailView;

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) UIView *baseView;

@property (nonatomic, strong) NSArray *mapIcons;

@end

@implementation ViewController

- (NSArray *)mapIcons {
    if (_mapIcons == nil) {
        _mapIcons = @[@"redPoint", @"act", @"box"];
    }
    return _mapIcons;
}

- (UITableView *)listTableView {
    if (_listTableView == nil) {
        _listTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [_listTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"listCell"];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.rowHeight = 100;
        _listTableView.tableFooterView = [UIView new];
        _listTableView.backgroundColor = ColorWithWhite(247);
        _listTableView.allowsSelection = NO;
    }
    return _listTableView;
}

- (LocationDetailView *)locationDetailView {
    if (_locationDetailView == nil) {
        _locationDetailView = [[LocationDetailView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, ScreenH)];
        [self.baseView addSubview:_locationDetailView];
        _locationDetailView.frame = CGRectMake(0, ScreenH, ScreenW, ScreenH - 44 - 64);
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
    UIView *baseView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:baseView];
    self.baseView = baseView;
    // Do any additional setup after loading the view, typically from a nib.

//    self.navigationController.title = @"Find";
    self.title = @"Huntr";

    [AMapServices sharedServices].enableHTTPS = YES;
    ///初始化地图
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    self.mapView = mapView;

    ///把地图添加至view
    [self.baseView addSubview:mapView];
//    mapView.language = MKMapLanguageEn;
//    mapView.showsScale = NO;
//    mapView.showsCompass = NO;
    mapView.delegate = self;

    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MKUserTrackingModeFollow;

    //barItems
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchClick)];
    UIBarButtonItem *filterItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(filterClick)];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeButton addTarget:self action:@selector(changeListClick:) forControlEvents:UIControlEventTouchUpInside];
    [changeButton setImage:[UIImage imageNamed:@"list"] forState:0];
    [changeButton setImage:[UIImage imageNamed:@"map"] forState:UIControlStateSelected];
//    UIBarButtonItem *changeListItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStylePlain target:self action:@selector(changeListClick)];
    UIBarButtonItem *changeListItem = [[UIBarButtonItem alloc] initWithCustomView:changeButton];
    
    self.navigationItem.rightBarButtonItems = @[changeListItem, filterItem];
    
    [self setupLocateMeButton];
    [self.baseView addSubview:self.locationDetailView];
}

- (void)searchClick {
    SearchMainViewController *searchVC = [[SearchMainViewController alloc] init];
    GeneticNavViewController *nav = [[GeneticNavViewController alloc] initWithRootViewController:searchVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)filterClick {
    FilterTableViewController *filterVC = [[FilterTableViewController alloc] init];
    GeneticNavViewController *nav = [[GeneticNavViewController alloc] initWithRootViewController:filterVC];
    [self presentViewController:nav animated:YES completion:nil];

}

- (void)changeListClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        self.listTableView.alpha = 0;
        [self.view addSubview: self.listTableView];
        [UIView animateWithDuration:0.3 animations:^{
            self.listTableView.alpha = 1;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.listTableView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.listTableView removeFromSuperview];
        }];
    }
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
    [self.baseView addSubview:button];
}

- (void)locateMeBtnClick {
    [self.mapView setCenterCoordinate:self.currentCoord animated:YES];
}


- (void)generateRandomLocationWithRegion:(MKCoordinateRegion)region {
//    CLLocationCoordinate2D coord = self.currentCoord;
//    NSMutableArray *annotations = [NSMutableArray array];
//    NSInteger flag1 = 1;
//    NSInteger flag2 = -1;
//    for (NSInteger i = 0; i < 100; i++) {
//        int random1 = arc4random_uniform(100);
//        flag1 = random1 % 2 == 0 ? 1 : -1;
//        int random2 = arc4random_uniform(100);
//        flag2 = random2 % 2 == 0 ? 1 : -1;
//        CLLocationDegrees newLat = coord.latitude + random1 * flag1 * 0.01 * region.span.latitudeDelta * 0.5;
//        CLLocationDegrees newLong = coord.longitude + random2 * flag2 * 0.01 * region.span.longitudeDelta * 0.5;
//        CLLocationCoordinate2D cord = {newLat, newLong};
//        //        CLLocation *location = [[CLLocation alloc] initWithLatitude:cord.latitude longitude:cord.longitude];
//        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//        annotation.coordinate = cord;
//        annotation.title = [NSString stringWithFormat:@"%.2f", newLat];
//        [annotations addObject:annotation];
//    }
//    [self.mapView addAnnotations:annotations];
//    
//    self.hasUpdatedAnnotes = YES;
    
    //增加制定虚拟点
    MKPointAnnotation *annotation1 = [[MKPointAnnotation alloc] init];
    annotation1.title = @"Squiggly Bridge";
    annotation1.coordinate = CLLocationCoordinate2DMake(55.855833, -4.263889);
    [self.mapView addAnnotation:annotation1];
    
    MKPointAnnotation *annotation2 = [[MKPointAnnotation alloc] init];
    annotation2.title = @"A Grove by the Kelvin";
    annotation2.coordinate = CLLocationCoordinate2DMake(55 + 52.230 / 60.0, -4 - 17.114 / 60.0);
    [self.mapView addAnnotation:annotation2];
    
    MKPointAnnotation *annotation3 = [[MKPointAnnotation alloc] init];
    annotation3.title = @"Glasgow Riverside Museum";
    annotation3.coordinate = CLLocationCoordinate2DMake(55 + 51.935 / 60.0, -4 - 18.236 / 60.0);
    [self.mapView addAnnotation:annotation3];
    
    MKPointAnnotation *annotation4 = [[MKPointAnnotation alloc] init];
    annotation4.title = @"University of Glasgow";
    annotation4.coordinate = CLLocationCoordinate2DMake(55.8721091, -4.2881897);
    [self.mapView addAnnotation:annotation4];
    
    MKPointAnnotation *annotation5 = [[MKPointAnnotation alloc] init];
    annotation5.title = @"Kelvingrove Art Gallery and Museum";
    annotation5.coordinate = CLLocationCoordinate2DMake(55 + 52.0 / 60.0 + 6.89/60/60, -4 - 17.0 / 60.0 -25.82/60/60);
    [self.mapView addAnnotation:annotation5];
    
    MKPointAnnotation *annotation6 = [[MKPointAnnotation alloc] init];
    annotation6.title = @"George Square";
    annotation6.coordinate = CLLocationCoordinate2DMake(55 + 51.0 / 60.0 + 40.179/60/60, -4 - 15.0 / 60.0 -0.64/60/60);
    [self.mapView addAnnotation:annotation6];
    
    MKPointAnnotation *annotation7 = [[MKPointAnnotation alloc] init];
    annotation7.title = @"Gallery of Modern Art";
    annotation7.coordinate = CLLocationCoordinate2DMake(55.8602, -4.25249);
    [self.mapView addAnnotation:annotation7];
    
    MKPointAnnotation *annotation8 = [[MKPointAnnotation alloc] init];
    annotation8.title = @"G12 Cafe 42 University Ave, Glasgow, G12 8NN";
    annotation8.coordinate = CLLocationCoordinate2DMake(55.872760, -4.284738);
    [self.mapView addAnnotation:annotation8];
    
    
    MKPointAnnotation *annotation9 = [[MKPointAnnotation alloc] init];
    annotation9.title = @"Chow Chinese Restaurant  98 Byres Road, Glasgow, G12 8TB";
    annotation9.coordinate = CLLocationCoordinate2DMake(55.872996, -4.295831);
    [self.mapView addAnnotation:annotation9];
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
        CLLocationCoordinate2D coord = view.annotation.coordinate;
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
        NSInteger ran = arc4random_uniform(3);
        if ([annotation.title isEqualToString:@"Squiggly Bridge"] || [annotation.title isEqualToString:@"A Grove by the Kelvin"] || [annotation.title isEqualToString:@"Glasgow Riverside Museum"]) {
            ran = 2;
        } else if ([annotation.title isEqualToString:@"University of Glasgow"] || [annotation.title isEqualToString:@"Kelvingrove Art Gallery and Museum"] || [annotation.title isEqualToString:@"George Square"] || [annotation.title isEqualToString:@"Gallery of Modern Art"]) {
            ran = 1;
        } else if ([annotation.title isEqualToString:@"G12 Cafe 42 University Ave, Glasgow, G12 8NN"] || [annotation.title isEqualToString:@"Chow Chinese Restaurant  98 Byres Road, Glasgow, G12 8TB"]) {
            ran = 0;
        }

        view.tag = ran;
        UIImage *image = [UIImage imageNamed:self.mapIcons[ran]];
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

//    view.image = [UIImage imageNamed:@"bluePoint_selected_1"];
    NSInteger index = view.tag;
    NSString *imageName = [NSString stringWithFormat:@"%@_big", self.mapIcons[index]];
    view.image = [UIImage imageNamed:imageName];
    LocationInfoModel *model = [LocationInfoModel modelWithTitle:view.annotation.title];
    if (distance < 1000) {
        model.locDistance = [NSString stringWithFormat:@"%.0fm", distance];
    } else {
        
        model.locDistance = [NSString stringWithFormat:@"%.1fkm", distance * 0.001];
    }
    self.locationDetailView.dataSource = model;
    [self showLocationDetailView:YES];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    view.image = [UIImage imageNamed:self.mapIcons[view.tag]];
    [self showLocationDetailView:NO];
}

#pragma mark - uitableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    return cell;
}

@end
