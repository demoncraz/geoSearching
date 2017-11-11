//
//  MessageViewController.m
//  geoSearching
//
//  Created by 陈川 on 2017/11/1.
//

#import "MessageViewController.h"
#import "Constants.h"
#import "MessageTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *models;

@end

@implementation MessageViewController

- (NSArray *)models {
    if (_models == nil) {
        MessageModel *model1 = [MessageModel modelWithName:@"Neo" content:@"Hey, how is it going?" icon:@"Neo"];
        MessageModel *model2 = [MessageModel modelWithName:@"Jacky" content:@"I was just searching around the area, you?" icon:@"Jacky"];
        MessageModel *model3 = [MessageModel modelWithName:@"Jessica" content:@"See ya..." icon:@"Jessica"];
        
        
        //groups
        MessageModel *model4 = [MessageModel modelWithName:@"Huntr Glasgow City Group" content:@"Frank : Does anybody know about Sandyford Hotel? I was planning to go there for a party and I heared there is" icon:@"groups"];
        MessageModel *model5 = [MessageModel modelWithName:@"Huntr Team of Glasgow Uni" content:@"Dean :  Well that's awesome!!" icon:@"groups"];
        
        _models = @[model1, model2, model3, model4, model5];
    }
    return _models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Message";
    self.view.backgroundColor = ColorWithWhite(247);
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MessageTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"MessageCell"];
    self.tableView.backgroundColor = ColorWithWhite(247);
    self.tableView.tableFooterView = [UIView new];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(addClick)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)addClick {
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    cell.model = self.models[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
