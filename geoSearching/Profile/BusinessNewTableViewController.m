//
//  BusinessNewTableViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/12.
//

#import "BusinessNewTableViewController.h"
#import "BusinessNewTableViewCell.h"
#import "Constants.h"

@interface BusinessNewTableViewController ()

@property (nonatomic, strong) NSArray *names;

@end

@implementation BusinessNewTableViewController

- (NSArray *)names {
    if (_names == nil) {
        _names = @[@"Location", @"Date", @"Time", @"Amount", @"Points"];
    }
    return _names;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessNewTableViewCell" bundle:nil] forCellReuseIdentifier:@"businessCell"];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 84)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Submit" forState:0];
    button.backgroundColor = DefaultBlueColor;
    button.frame = CGRectMake(20, 40, ScreenW - 40, 44);
    [footer addSubview:button];
    self.tableView.tableFooterView = footer;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)buttonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessNewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"businessCell"];
    
    cell.name = self.names[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
