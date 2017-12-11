//
//  BaseViewController.h
//  YoungPure
//
//  Created by Jerry.Yang on 2017/12/4.
//  Copyright © 2017年 Jerry.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TopView.h"
#import "AppMacro.h"
#import "AppDelegate.h"

@interface BaseViewController : UIViewController
/**  顶部导航栏 */
@property (nonatomic, strong) TopView *topView;
@property (nonatomic, strong) UIButton *backToTopBtn;

// 1 首页 2搜索页面 3个人中心 4自然音
@property (nonatomic, assign) NSInteger viewtype;



//无结果页面

@property(nonatomic,strong)UILabel *noResult;
/*
 设置根视图头部视图
 */
-(void)setRootControllerTopView;

//search Naviheader
-(void)setSearchRootControllerTopView:(UIView *)view;
//titleTextView
-(void)setRootControllerTopTitleView:(NSString *)text;


//-----------------------新设置------
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel *redView;

@property (nonatomic, assign) BOOL isImageAnimation;
/**
 *  VIEW是否渗透导航栏
 * (YES_VIEW渗透导航栏下／NO_VIEW不渗透导航栏下)
 */
@property (assign,nonatomic) BOOL isExtendLayout;
/**
 * 功能：导航栏
 * 参数：title
 */
@property (nonatomic, copy) NSString* navBarTitle;
/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
//-(void)hideNavigationBar:(BOOL)isHide
// animated:(BOOL)animated;

/**
 * 功能：添加RightNavButton
 * 参数：
 */
- (UIButton*)addRightNavButtonWithTitle:(NSString*)title
                                 action:(SEL)action;


/**
 * 功能：添加LeftNav
 * 参数：
 */
- (UIButton*)addLeftNavButtonWithTitle:(NSString*)title
                                action:(SEL)action;
- (UIButton*)addLeftNavButtonWithImage:(NSString *) imgage
                                action:(SEL)action;
- (UILabel*)addLeftNavLabelWithTitle:(NSString*)title;
- (UIImageView*)addLeftNavImageWithTitle:(NSString*)image;

-(void)backAction:(id)sender;

- (UIImageView*)addNavTitleWithImage:(NSString*)image;



- (UIButton*)addRightNavButtonWithBtnimage:(NSString*)image withRed:(BOOL)show
                                    action:(SEL)action;
-(void)goSinglePlayPageController;
- (void)goMeassagesController;



//跳转登录页面
-(void)pushLoginViewAlertTitle:(NSString *) title withDetail:(NSString *)detail;

@end
