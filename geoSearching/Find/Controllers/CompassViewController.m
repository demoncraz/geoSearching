//
//  CompassViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/10.
//

#import "CompassViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Constants.h"

@interface CompassViewController ()<CLLocationManagerDelegate>

/** 位置管理者 */
@property (nonatomic, strong) CLLocationManager *locationM;
@property (strong, nonatomic) UIImageView *compassVIew;
@property (strong, nonatomic) UIImageView *pointerView;
@property (strong, nonatomic) UILabel * distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentLatLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLongLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLatLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLonLabel;


@end

@implementation CompassViewController

#pragma mark -懒加载
-(CLLocationManager *)locationM
{
    if (!_locationM) {
        _locationM = [[CLLocationManager alloc] init];
        _locationM.delegate = self;
    }
    return _locationM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Compass";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.rightBarButtonItem = item;
    
    // 获取当前设备朝向
    [self.locationM startUpdatingHeading];
    
    self.compassVIew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 100, ScreenW - 100)];
    self.compassVIew.image = [UIImage imageNamed:@"compassBg"];
    [self.view addSubview:self.compassVIew];
    
    self.compassVIew.center = CGPointMake(ScreenW * 0.5, ScreenH * 0.5 - 32);
    
    UIImageView *pointerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.compassVIew.frame.size.width -30, self.compassVIew.frame.size.height -30)];
    self.pointerView = pointerView;
    [self.view addSubview:pointerView];
    pointerView.center = self.compassVIew.center;
    pointerView.image = [UIImage imageNamed:@"pointer"];
    
    UILabel *distanceLabel = [[UILabel alloc] init];
    self.distanceLabel = distanceLabel;
    distanceLabel.font = [UIFont systemFontOfSize:38];
    distanceLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:distanceLabel];
    if (self.distance < 1000) {
        distanceLabel.text = [NSString stringWithFormat:@"%.0fm", self.distance];
    } else {
        distanceLabel.text = [NSString stringWithFormat:@"%.1fkm", self.distance * 0.001];
    }
    [distanceLabel sizeToFit];
    distanceLabel.center = self.compassVIew.center;
    
    self.currentLatLabel.text = [NSString stringWithFormat:@"%@ %.4f", @"N", [DataManager shared].currentLocation.latitude];
    self.currentLongLabel.text = [NSString stringWithFormat:@"%@ %.4f", @"E", [DataManager shared].currentLocation.longitude];
    self.destinationLatLabel.text = [NSString stringWithFormat:@"%@ %.4f", @"N", self.annotation.coordinate.latitude];
    self.destinationLonLabel.text = [NSString stringWithFormat:@"%@ %.4f", @"E", self.annotation.coordinate.longitude];
}

- (void)itemClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 已经更新到用户设备朝向时调用
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
    // magneticHeading : 距离磁北方向的角度
    // trueHeading : 真北
    // headingAccuracy : 如果是负数,代表当前设备朝向不可用
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    
    // 角度
    CLLocationDirection angle = newHeading.magneticHeading;
    
    // 角度-> 弧度
    double radius = angle / 180.0 * M_PI;
    
    CLLocationCoordinate2D currentLocation = [DataManager shared].currentLocation;
    CLLocationCoordinate2D desLoc = self.annotation.coordinate;
    
    //计算目的地的direction
    double deltaLat = desLoc.latitude - currentLocation.latitude;
    double deltaLong = desLoc.longitude - currentLocation.longitude;
    double averageLat = (desLoc.latitude + currentLocation.latitude) * 0.5;
    double deltaX = deltaLong * 111000 * cos(averageLat / 180.0 * M_PI);
    double deltaY = deltaLat * 111000;
    
    double direction;
    if (deltaY == 0) {
        direction = deltaX > 0 ? M_PI * 0.5 : M_PI * -0.5;
    } else {
        direction = atan(fabs(deltaX) / fabs(deltaY));
        if (deltaX > 0 && deltaY > 0) {
            direction = direction;
        } else if (deltaX > 0 && deltaY < 0){
            direction = M_PI - direction;
        } else if (deltaX < 0 && deltaY < 0) {
            direction = direction - M_PI;
        } else {
            direction = -direction;
        }
    }

    
    // 反向旋转图片(弧度)
    [UIView animateWithDuration:0.5 animations:^{
        self.compassVIew.transform = CGAffineTransformMakeRotation(-radius);
        self.pointerView.transform = CGAffineTransformMakeRotation(-radius + direction);
    }];
    
}



@end
