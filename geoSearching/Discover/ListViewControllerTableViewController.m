//
//  ListViewControllerTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/12.
//

#import "ListViewControllerTableViewController.h"

@interface ListViewControllerTableViewController ()

@end

@implementation ListViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelection = NO;
    
    self.model = @[@"Squiggly Bridge"];
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

@end
