//
//  SearchMainViewController.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/2.
//

#import "SearchMainViewController.h"
#import "Constants.h"


@interface SearchMainViewController ()

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Search By:";
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    self.navigationItem.leftBarButtonItem = cancelItem;
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = ColorWithWhite(247);
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            view.layer.shadowColor = ColorWithWhite(150).CGColor;
            view.layer.shadowRadius = 2;
            view.layer.shadowOffset = CGSizeMake(1, 1);
            view.layer.shadowOpacity = 0.7;
        }
    }
}

- (void)cancelClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
