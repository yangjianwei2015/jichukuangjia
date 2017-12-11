//
//  TopView.m
//  YoungPure
//
//  Created by YoungPure on 2017/5/8.
//  Copyright © 2017年 YoungPure. All rights reserved.
//

#import "TopView.h"
@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatViewInfo];
    }
    return self;
}

//创建视图
- (void)creatViewInfo {
    
    [self addSubview:self.topBackgroundImageView];
    [self.topBackgroundImageView addSubview:self.leftBtn];
    [self.topBackgroundImageView addSubview:self.titleImageView];
    [self.topBackgroundImageView addSubview:self.rightBtn];
    [self.topBackgroundImageView addSubview:self.redView];

    [self.topBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topBackgroundImageView.mas_left).offset(-6);
        make.width.and.height.mas_equalTo(55);
        make.top.equalTo(self.topBackgroundImageView.mas_top).offset(30);
    }];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topBackgroundImageView.mas_centerX);
        make.centerY.equalTo(self.leftBtn.mas_centerY);
        make.width.mas_equalTo(170);
        make.height.mas_equalTo(23);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topBackgroundImageView.mas_right).offset(8);
        make.width.and.height.mas_equalTo(55);
        make.centerY.equalTo(self.titleImageView.mas_centerY);
    }];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topBackgroundImageView.mas_right).offset(-2);
        make.width.height.mas_equalTo(16);
        make.top.equalTo(self.rightBtn.mas_top).offset(7);

    }];
//
}
#pragma mark - 懒加载
- (UIImageView *)topBackgroundImageView {
    if (!_topBackgroundImageView) {
        _topBackgroundImageView = [[UIImageView alloc] init];
        _topBackgroundImageView.image = [UIImage imageNamed:@"G_bg_top"];
        _topBackgroundImageView.userInteractionEnabled = YES;
    }
    return _topBackgroundImageView;
}
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _leftBtn.backgroundColor = [UIColor blueColor];
        [_leftBtn setImage:[UIImage imageNamed:@"icon_menu_top"] forState:UIControlStateNormal];
    }
    return _leftBtn;
}
- (UIImageView *)titleImageView {
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] init];
        _titleImageView.image = [UIImage imageNamed:@"G_title_YoungPure"];
    }
    return _titleImageView;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _rightBtn.backgroundColor = [UIColor blueColor];
        [_rightBtn setImage:[UIImage imageNamed:@"icon_playing_top"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}

-(UILabel *)redView{
    
    if (_redView == nil) {
        _redView = [[UILabel alloc]init];
        _redView.backgroundColor = [UIColor redColor];
        _redView.font = [UIFont systemFontOfSize:10];
        _redView.layer.borderWidth = 1.0f;
        _redView.text = @"";
        _redView.textColor = [UIColor whiteColor];
        _redView.textAlignment = NSTextAlignmentCenter;
        _redView.layer.borderColor = [UIColor whiteColor].CGColor;
        [_redView setFourRoundedCornersWithCornerRadius:8];
    }
    return _redView;
}

/*
 设置背景图
 */
-(void)topBackgroundImage:(NSString*)bgImageName
{
    self.topBackgroundImageView.image = [UIImage imageNamed:bgImageName];
//    self.topBackgroundImageView.image = [[UIImage imageNamed:imageName]stretchableImageWithLeftCapWidth:10 topCapHeight:0];
}


/*
 设置左边按钮
 */
/*
- (void)setLeftImage:(NSString *)leftImage {
    
    [self.leftBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
}
 */


-(void)setLeftImage:(NSString *)rightImage
{
    [self.leftBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];

    // 播放一组图片，设置一共有多少张图片生成的动画
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i <= 7; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_play_%02d", i]];
        [arr addObject:image];
    }
    // 开始做动画
    self.leftBtn.imageView.animationImages = arr;
    // 设置动画时长
    self.leftBtn.imageView.animationDuration = arr.count*0.1;
    // 设置重复次数
    self.leftBtn.imageView.animationRepeatCount = 100000;
    //    [self.rightBtn.imageView startAnimating];
    
    //    [self.rightBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
}
-(void)setIsImageAnimation:(BOOL)isImageAnimation
{
    _isImageAnimation = isImageAnimation;
    if (isImageAnimation) {
        if (![self.leftBtn.imageView isAnimating])
        {
            [self.leftBtn.imageView startAnimating];
        }
    } else {
        if ([self.leftBtn.imageView isAnimating]) {
            [self.leftBtn.imageView stopAnimating];
        }
    }
}

/*
 设置中间标题图片
 */
- (void)setTitleImage:(NSString *)titleImage {
    
    self.titleImageView.image = [UIImage imageNamed:titleImage];
//    self.titleImageView.image = [[UIImage imageNamed:titleImage]stretchableImageWithLeftCapWidth:10 topCapHeight:0];
}
/*
 设置右按钮图片
 */
-(void)setRightImage:(NSString *)rightImage
{
    
    // 播放一组图片，设置一共有多少张图片生成的动画
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i <= 7; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_play_%02d", i]];
        [arr addObject:image];
    }
    // 开始做动画
    self.rightBtn.imageView.animationImages = arr;
    // 设置动画时长
    self.rightBtn.imageView.animationDuration = arr.count*0.1;
    // 设置重复次数
    self.rightBtn.imageView.animationRepeatCount = 100000;
//    [self.rightBtn.imageView startAnimating];

//    [self.rightBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
}

/*
-(void)setIsImageAnimation:(BOOL)isImageAnimation
{
    _isImageAnimation = isImageAnimation;
    if (isImageAnimation) {
        if (![self.rightBtn.imageView isAnimating])
        {
            [self.rightBtn.imageView startAnimating];
        }
    } else {
        if ([self.rightBtn.imageView isAnimating]) {
            [self.rightBtn.imageView stopAnimating];
        }
    }
}*/
@end
