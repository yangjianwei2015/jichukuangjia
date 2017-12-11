//
//  LKBaseViewController.m
//  YoungPure
//
//  Created by  on 2017/8/4.
//  Copyright © 2017年 YoungPure. All rights reserved.
//

#import "LKBaseViewController.h"

@interface LKBaseViewController ()

@end

@implementation LKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIActivityIndicatorView *)activityView
{
    if (_activityView == nil) {
        _activityView = [[UIActivityIndicatorView alloc]initWithFrame:self.view.frame];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activityView.center = self.view.center;
        _activityView.backgroundColor = [UIColor blackColor];
        _activityView.alpha = .1;
        //AppDelegate *delegate =  (AppDelegate *)[UIApplication sharedApplication].delegate;
        [self.view addSubview:_activityView];
    }
    return _activityView;
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
