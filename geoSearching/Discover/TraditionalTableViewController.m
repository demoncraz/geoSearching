//
//  TraditionalTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/3.
//

#import "TraditionalTableViewController.h"

@interface TraditionalTableViewController ()


@end

@implementation TraditionalTableViewController

//- (NSArray *)model {
//    if (_model == nil) {
//        _model = @[@"Squiggly Bridge", @"A Grove by the Kelvin", @"Glasgow Riverside Museum"];
//    }
//    return _model;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = @[@"Squiggly Bridge", @"A Grove by the Kelvin", @"Glasgow Riverside Museum"];
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

@end
