//
//  LocationDetailView.m
//  geoSearching
//
//  Created by demoncraz on 2017/10/31.
//

#import "LocationDetailView.h"
#import "LocationDetailTableViewCell.h"
#import "LocationDescriptionTableViewCell.h"
#import "LocationPosterTableViewCell.h"

static NSString * const detailCellId = @"detailCellId";
static NSString * const descriptionCellId = @"descriptionCellId";
static NSString * const postInfoCellId = @"postInfoCellId";

@interface LocationDetailView()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *expandButton;
@property (nonatomic, assign, getter=isViewHidden) BOOL viewHidden;
@property (weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;


@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;

@end

@implementation LocationDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
        //register cell
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.estimatedRowHeight = 100;
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:detailCellId];
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDescriptionTableViewCell class]) bundle:nil] forCellReuseIdentifier:descriptionCellId];
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationPosterTableViewCell class]) bundle:nil] forCellReuseIdentifier:postInfoCellId];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTapped)];
        [self.titleView addGestureRecognizer:tap];
        
        self.viewHidden = YES;
    }
    return self;
}

- (void)titleTapped {
    self.viewHidden = !self.viewHidden;
    if (self.delegate && [self.delegate respondsToSelector:@selector(LocationDetailView:didClickToShow:)]) {
        [self.delegate LocationDetailView:self didClickToShow:!self.viewHidden];
    }
}

- (void)setViewHidden:(BOOL)viewHidden {
    _viewHidden = viewHidden;
//    self.expandButton.selected = !viewHidden;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LocationDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellId];
//        cell.type = self.dataSource.detailType;
        cell.image = self.dataSource.detailImage;
        return cell;
    } else if (indexPath.row == 1) {
        LocationDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:descriptionCellId];
        cell.locDescription = self.dataSource.locDescription;
        return cell;
    } else {
        LocationPosterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:postInfoCellId];
        return cell;
    }
}

- (void)setDataSource:(LocationInfoModel *)dataSource {
    _dataSource = dataSource;
    self.titleTextLabel.text = dataSource.locTitle;
    self.likeLabel.text = dataSource.locLikeCount;
    self.distanceLabel.text = dataSource.locDistance;
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self.tableView reloadData];
}

- (IBAction)navigateBtnClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        if ([self.delegate respondsToSelector:@selector(LocationDetailView:didClickNavigateToCord:cancel:)]) {
            [self.delegate LocationDetailView:self didClickNavigateToCord:self.locationCoord cancel:NO];
        }
        self.buttonLabel.text = @"STOP";
    } else {
        if ([self.delegate respondsToSelector:@selector(LocationDetailView:didClickNavigateToCord:cancel:)]) {
            [self.delegate LocationDetailView:self didClickNavigateToCord:self.locationCoord cancel:YES];
        }
        self.buttonLabel.text = @"START";
    }
    
}

@end
