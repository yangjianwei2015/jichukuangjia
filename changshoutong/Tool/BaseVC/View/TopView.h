//
//  TopView.h
//  YoungPure
//
//  Created by YoungPure on 2017/5/8.
//  Copyright © 2017年 YoungPure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView

//背景图
@property (nonatomic, strong) UIImageView *topBackgroundImageView;
//标题
@property (nonatomic,strong)  UIImageView *titleImageView;
//左键
@property (nonatomic,strong) UIButton *leftBtn;
//右键
@property (nonatomic,strong) UIButton *rightBtn;

//message 提示
@property (nonatomic,strong)  UILabel *redView;


@property (nonatomic, assign) BOOL isImageAnimation;

/*
 设置背景图
 */
-(void)topBackgroundImage:(NSString*)bgImageName;
/*
 设置左按钮图片
 */
-(void)setLeftImage:(NSString *)leftImage;
/*
 设置右按钮图片
 */
-(void)setRightImage:(NSString *)rightImage;
/*
 设置中间标题图片
 */
-(void)setTitleImage:(NSString *)titleImage;

@end
