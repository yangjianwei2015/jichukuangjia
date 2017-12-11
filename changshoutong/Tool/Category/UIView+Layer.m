//
//  UIView+Layer.m
//  FenggeBeautifulClothesApp
//
//  Created by liyexiang on 14-7-22.
//  Copyright (c) 2014年 Liyexiang. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (LayerRoundedCorners)

/**********************************************************
 函数名称：setBorder
 函数描述：设置边缘，默认颜色浅灰色，线宽1.0。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBorder
{
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.masksToBounds = YES;
}

/**********************************************************
 函数名称：setBorderWithColor:andWidth:
 函数描述：设置边缘的颜色和线宽。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBorderWithColor:(NSString *)color andWidth:(CGFloat)width
{
    self.layer.borderWidth = width;
    self.layer.borderColor = [UIColor colorWithHexString:color].CGColor;
    self.layer.masksToBounds = YES;
}

/**********************************************************
 函数名称：setRoundedCorner:(UIRectCorner)corners withRadius:(CGFloat)radius
 函数描述：设置圆角。
 输入参数：corners,radius
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setRoundedCorner:(UIRectCorner)corners withRadius:(CGFloat)radius
{
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.layer.mask = maskLayer1;
//    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

/**********************************************************
 函数名称：setFourRoundedCorners
 函数描述：设置四个圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setFourRoundedCorners
{
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
}

/**********************************************************
 函数名称：setTopTwoRoundedCorners
 函数描述：设置顶部圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setTopTwoRoundedCorners
{
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.layer.mask = maskLayer1;
   // self.layer.masksToBounds = YES;
   // self.layer.cornerRadius = 3;
}

/**********************************************************
 函数名称：setBottomTwoRoundedCorners
 函数描述：设置底部圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBottomTwoRoundedCorners
{
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.layer.mask = maskLayer1;
   // self.layer.masksToBounds = YES;
   // self.layer.cornerRadius = 3;
}


-(void)setleftTwoRoundedCorners
{
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(12.5, 12.5)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.layer.mask = maskLayer1;
    // self.layer.masksToBounds = YES;
    // self.layer.cornerRadius = 3;
}
-(void)setrightTwoRoundedCorners
{
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(12.5, 12.5)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.layer.mask = maskLayer1;
    // self.layer.masksToBounds = YES;
    // self.layer.cornerRadius = 3;
}
/**********************************************************
 函数名称：setFourRoundedCorners
 函数描述：设置四个圆角。
 输入参数：cornerRadius
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setFourRoundedCornersWithCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

/**********************************************************
 函数名称：setLightGrayLine
 函数描述：设置边缘线。
 输入参数  top
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineWidth:(CGFloat)top
{
    
    UILabel *lineLabel= [[UILabel alloc]initWithFrame:CGRectMake(0, top, self.width, .5)];
    
//    lineLabel = [self viewWithTag:99999];
//    if (lineLabel == nil) {
//        lineLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, top, ViewWidth, .5)];
//    }
    lineLabel.backgroundColor = [UIColor colorWithHexString:FITSIZE_COLOR];
    lineLabel.tag = 99999;
    [self addSubview:lineLabel];
}
/**********************************************************
 函数名称：setLightGrayLineTop andWidth withColor
 函数描述：设置边缘线。
 输入参数  top,width,color
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andWidth:(CGFloat)width withColor:(NSString *)color
{
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, top, width, .5)];
    lineLabel.backgroundColor = [UIColor colorWithHexString:color];
    lineLabel.tag = 99999;
    [self addSubview:lineLabel];
}
/**********************************************************
 函数名称：setLightGrayLineTop andWidth withColor left
 函数描述：设置边缘线。
 输入参数  top,width,color,left
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andWidth:(CGFloat)width withColor:(NSString *)color left:(CGFloat)left
{
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(left, top, width, .5)];
    lineLabel.backgroundColor = [UIColor colorWithHexString:color];
    lineLabel.tag = 99999;
    [self addSubview:lineLabel];
}
/**********************************************************
 函数名称：setLightGrayLineTop andHeight withColor
 函数描述：设置边缘线。
 输入参数  top,height,color
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andHeight:(CGFloat)height withColor:(NSString *)color
{
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, top, .5, height)];
    lineLabel.backgroundColor = [UIColor colorWithHexString:color];
    lineLabel.tag = 99999;
    [self addSubview:lineLabel];
}
/**********************************************************
 函数名称：setLightGrayLineTop andHeight withColor left
 函数描述：设置边缘线。
 输入参数  top,height,color,left
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andHeight:(CGFloat)height  withColor:(NSString *)color left:(CGFloat)left
{
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(left, top, .5, height)];
    lineLabel.backgroundColor = [UIColor colorWithHexString:color];
    lineLabel.tag = 99999;
    [self addSubview:lineLabel];
}
@end
