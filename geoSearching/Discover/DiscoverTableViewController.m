//
//  DiscoverTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/2.
//

#import "DiscoverTableViewController.h"
#import "CCTopTabViewController.h"

#import "TraditionalTableViewController.h"
#import "ActTableViewController.h"
#import "CouponTableViewController.h"
#import "ListViewControllerTableViewController.h"

@interface DiscoverTableViewController ()

@end

@implementation DiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Discover";
    self.tableView.tableFooterView = [UIView new];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {//task
        
        CCTopTabViewController *vc = [[CCTopTabViewController alloc] initWithTitles:@[@"Traditional", @"Activities", @"Coupons"] viewControllers:@[[[TraditionalTableViewController alloc] init], [[ActTableViewController alloc] init], [[CouponTableViewController alloc] init]] shouldHideNavigationBar:NO];
        vc.title = @"Tasks";
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 2) {
        ListViewControllerTableViewController *vc = [[ListViewControllerTableViewController alloc] init];
        vc.title = @"Lists";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
