//
//  GeneticNavViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "GeneticNavViewController.h"
#import "Constants.h"

@interface GeneticNavViewController ()

@end

@implementation GeneticNavViewController

+(void)initialize {
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].backgroundColor = DefaultBlueColor;
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"blueblueblue"] forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [UINavigationBar appearance].shadowImage =
    
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [UITabBar appearance].shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
