//
//  ActTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/3.
//

#import "ActTableViewController.h"

@interface ActTableViewController ()


@end

@implementation ActTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = @[@"University of Glasgow", @"Kelvingrove Art Gallery and Museum", @"George Square", @"Gallery of Modern"];
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



@end
