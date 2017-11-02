//
//  CouponTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/3.
//

#import "CouponTableViewController.h"

@interface CouponTableViewController ()


@end

@implementation CouponTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = @[@"G12 Cafe", @"Chow Chinese Restaurant"];
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

@end
