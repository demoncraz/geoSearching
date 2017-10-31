//
//  LocationDetailViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationDetailViewController.h"
//#import "LocationDetailViewController.h"
#import "LocationDetailTableViewCell.h"
#import "LocationDescriptionTableViewCell.h"
#import "LocationPosterTableViewCell.h"

static NSString * const detailCellId = @"detailCellId";
static NSString * const descriptionCellId = @"descriptionCellId";
static NSString * const postInfoCellId = @"postInfoCellId";

@interface LocationDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation LocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.estimatedRowHeight = 100;
    
    self.tableView.tableFooterView = [UIView new];
    
    //register cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:detailCellId];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDescriptionTableViewCell class]) bundle:nil] forCellReuseIdentifier:descriptionCellId];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationPosterTableViewCell class]) bundle:nil] forCellReuseIdentifier:postInfoCellId];
    
    //
//    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LocationDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellId];
        return cell;
    } else if (indexPath.row == 1) {
        LocationDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:descriptionCellId];
        return cell;
    } else {
        LocationPosterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:postInfoCellId];
        return cell;
    }
}

@end
