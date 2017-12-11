//
//  BaseTabBarController.h
//  YoungPure
//
//  Created by Jerry.Yang on 2017/12/4.
//  Copyright © 2017年 Jerry.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
@interface BaseTabBarController : UITabBarController<UITabBarControllerDelegate>

+ (BaseTabBarController *)shareInstance;
@property (nonatomic, strong) HomeViewController * oneSelectVC;
@property (nonatomic, strong) FindViewController * twoSelectVC;
@property (nonatomic, strong) MineViewController * threeSelectVC;
@end
