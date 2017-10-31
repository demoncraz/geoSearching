//
//  GeneticNavViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "GeneticNavViewController.h"

@interface GeneticNavViewController ()

@end

@implementation GeneticNavViewController

+(void)initialize {
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].backgroundColor = [UIColor colorWithRed:33 green:150 blue:242 alpha:1];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"blueblueblue"] forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [UINavigationBar appearance].shadowImage =
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
