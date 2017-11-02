//
//  FilterTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/2.
//

#import "FilterTableViewController.h"
#import "Constants.h"

@interface FilterTableViewController ()

@end

@implementation FilterTableViewController

- (instancetype)init {
    if (self = [super init]) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil];
        self = [sb instantiateInitialViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Filter";
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeClick)];
    self.navigationItem.rightBarButtonItem = cancelItem;
    self.view.backgroundColor = ColorWithWhite(247);
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = ColorWithWhite(247);
}

- (void)closeClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
