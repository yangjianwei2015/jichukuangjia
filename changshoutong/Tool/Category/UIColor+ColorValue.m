//
//  UIColor+ColorValue.m
//  AccountBank
//
//  Created by 尚德悦成 on 13-7-10.
//  Copyright (c) 2013年 尚德悦成. All rights reserved.
//

#import "UIColor+ColorValue.h"

@implementation UIColor (ColorValue)

/**********************************************************
 函数名称：colorWithHexString
 函数描述：把16进制的字符串转化成对应的颜色值。
 输入参数：color
 输出参数：N/A
 返回值：UIColor。
 **********************************************************/
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
//    // Separate into r, g, b substrings
//    NSRange range;
//    range.location = 0;
//    range.length = 2;
//    
//    //r
//    NSString *rString = [cString substringWithRange:range];
//    
//    //g
//    range.location = 2;
//    NSString *gString = [cString substringWithRange:range];
//    
//    //b
//    range.location = 4;
//    NSString *bString = [cString substringWithRange:range];
//    
//    // Scan values
//    unsigned int r, g, b;
//    [[NSScanner scannerWithString:rString] scanHexInt:&r];
//    [[NSScanner scannerWithString:gString] scanHexInt:&g];
//    [[NSScanner scannerWithString:bString] scanHexInt:&b];
//    
//    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != cString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:cString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
