//
//  UIView+Layer.h
//  FenggeBeautifulClothesApp
//
//  Created by liyexiang on 14-7-22.
//  Copyright (c) 2014年 Liyexiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (Layer)
/**********************************************************
 函数名称：setBorder
 函数描述：设置边缘，默认颜色浅灰色，线宽1.0。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBorder;

/**********************************************************
 函数名称：setBorderWithColor:andWidth:
 函数描述：设置边缘的颜色和线宽。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBorderWithColor:(NSString *)color andWidth:(CGFloat)width;

/**********************************************************
 函数名称：setRoundedCorner:(UIRectCorner)corners withRadius:(CGFloat)radius
 函数描述：设置圆角。
 输入参数：corners,radius
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setRoundedCorner:(UIRectCorner)corners withRadius:(CGFloat)radius;

/**********************************************************
 函数名称：setFourRoundedCorners
 函数描述：设置四个圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setFourRoundedCorners;

/**********************************************************
 函数名称：setTopTwoRoundedCorners
 函数描述：设置顶部圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setTopTwoRoundedCorners;

/**********************************************************
 函数名称：setBottomTwoRoundedCorners
 函数描述：设置底部圆角。
 输入参数：N/A
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setBottomTwoRoundedCorners;
-(void)setrightTwoRoundedCorners;
-(void)setleftTwoRoundedCorners;
/**********************************************************
 函数名称：setFourRoundedCorners
 函数描述：设置四个圆角。
 输入参数：cornerRadius
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setFourRoundedCornersWithCornerRadius:(CGFloat)cornerRadius;

/**********************************************************
 函数名称：setLightGrayLine
 函数描述：设置边缘线。
 输入参数  top
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineWidth:(CGFloat)top;
/**********************************************************
 函数名称：setLightGrayLineTop andWidth withColor
 函数描述：设置边缘线。
 输入参数  top,width,color
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andWidth:(CGFloat)width withColor:(NSString *)color;
/**********************************************************
 函数名称：setLightGrayLineTop andWidth withColor left
 函数描述：设置边缘线。
 输入参数  top,width,color,left
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andWidth:(CGFloat)width withColor:(NSString *)color left:(CGFloat)left;
/**********************************************************
 函数名称：setLightGrayLineTop andHeight withColor
 函数描述：设置边缘线。
 输入参数  top,height,color
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andHeight:(CGFloat)height withColor:(NSString *)color;
/**********************************************************
 函数名称：setLightGrayLineTop andHeight withColor left
 函数描述：设置边缘线。
 输入参数  top,height,color,left
 输出参数：N/A
 返回值：void。
 **********************************************************/
-(void)setLightGrayLineTop:(CGFloat)top andHeight:(CGFloat)height  withColor:(NSString *)color left:(CGFloat)left;

@end
