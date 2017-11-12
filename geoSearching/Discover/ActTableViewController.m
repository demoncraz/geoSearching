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

//if ([annotation.title isEqualToString:@"Squiggly Bridge"] || [annotation.title isEqualToString:@"A Grove by the Kelvin"] || [annotation.title isEqualToString:@"Glasgow Riverside Museum"] || [annotation.title isEqualToString:@"Glasgow Libraries : The Mitchell Library"]) {
//    ran = 2;
//} else if ([annotation.title isEqualToString:@"University of Glasgow"] || [annotation.title isEqualToString:@"Kelvingrove Art Gallery and Museum"] || [annotation.title isEqualToString:@"George Square"] || [annotation.title isEqualToString:@"Gallery of Modern Art"]) {
//    ran = 1;
//} else if ([annotation.title isEqualToString:@"G12 Cafe 42 University Ave, Glasgow, G12 8NN"] || [annotation.title isEqualToString:@"Chow Chinese Restaurant  98 Byres Road, Glasgow, G12 8TB"] || [annotation.title isEqualToString:@"Sandyford Hotel"] || [annotation.title isEqualToString:@"iMart Oriental"] || [annotation.title isEqualToString:@"The Park Bar"]) {
//    ran = 0;
//}

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
