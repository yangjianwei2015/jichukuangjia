//
//  BaseNavigationController.m
//  YoungPure
//
//  Created by Jerry.Yang on 2017/12/4.
//  Copyright © 2017年 Jerry.Yang. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMembers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//初始化属性
-(void)initMembers
{
    __weak BaseNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        
        self.delegate = weakSelf;
        
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&
        animated == YES) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (self.childViewControllers.count > 0) {
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&
        animated == YES) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController
                        animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToViewController:viewController animated:animated];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isEqual:self.interactivePopGestureRecognizer] &&
        self.viewControllers.count > 1 &&
        [self.visibleViewController isEqual:[self.viewControllers lastObject]]) {
        //判断当导航堆栈中存在页面，并且可见视图如果不是导航堆栈中的最后一个视图时，就会屏蔽掉滑动返回的手势。此设置是为了避免页面滑动返回时因动画存在延迟所导致的卡死。
        return YES;
    } else {
        return NO;
    }
}

@end
