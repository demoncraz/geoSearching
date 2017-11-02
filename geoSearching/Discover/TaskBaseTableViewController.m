//
//  TaskBaseTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/3.
//

#import "TaskBaseTableViewController.h"

@interface TaskBaseTableViewController ()

@end

@implementation TaskBaseTableViewController

- (NSArray *)model {
    if (_model == nil) {
        _model = [NSArray array];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.tableView.rowHeight = 60;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coupon"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"coupon"];
    }
    cell.textLabel.text = self.model[indexPath.row];
    return cell;
}

@end
