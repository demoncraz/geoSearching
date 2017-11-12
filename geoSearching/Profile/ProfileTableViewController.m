//
//  ProfileTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/2.
//

#import "ProfileTableViewController.h"
#import "Constants.h"
#import "CCTopTabViewController.h"

#import "BusinessNewTableViewController.h"
#import "BusinessManagementTableViewController.h"

@interface ProfileTableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageVIew;
@property (weak, nonatomic) IBOutlet UIView *businessiew;

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Profile";
    
    self.iconImageVIew.layer.cornerRadius = 50;
    self.iconImageVIew.layer.masksToBounds = YES;
    
    self.tableView.backgroundColor = ColorWithWhite(247);
    self.tableView.tableFooterView = [UIView new];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.businessiew addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)tap {
    CCTopTabViewController *vc = [[CCTopTabViewController alloc] initWithTitles:@[@"New", @"Management"] viewControllers:@[[BusinessNewTableViewController new], [BusinessManagementTableViewController new]] shouldHideNavigationBar:NO];
    vc.title = @"Huntr Business Portal";
    for (UIView *view in vc.view.subviews) {
        view.backgroundColor = [UIColor whiteColor];
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
