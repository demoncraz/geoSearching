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

@end

@implementation LocationDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
        //register cell
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:detailCellId];
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationDescriptionTableViewCell class]) bundle:nil] forCellReuseIdentifier:descriptionCellId];
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LocationPosterTableViewCell class]) bundle:nil] forCellReuseIdentifier:postInfoCellId];
    }
    return self;
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
