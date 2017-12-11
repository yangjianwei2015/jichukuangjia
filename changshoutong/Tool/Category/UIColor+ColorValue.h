//
//  UIColor+ColorValue.h
//  AccountBank
//
//  Created by 尚德悦成 on 13-7-10.
//  Copyright (c) 2013年 尚德悦成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorValue)
/**********************************************************
 函数名称：colorWithHexString
 函数描述：把16进制的字符串转化成对应的颜色值。
 输入参数：color
 输出参数：N/A
 返回值：UIColor。
 **********************************************************/
+ (UIColor *) colorWithHexString: (NSString *)color;
@end
