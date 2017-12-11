//
//  UIView+ViewFrame.h
//  AccountBank
//
//  Created by 尚德悦成 on 13-7-19.
//  Copyright (c) 2013年 尚德悦成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewFrame)

/**
 * 取 frame.origin.x 的值（封装成更简单的方法）
 *
 * 赋值时 frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * 取 frame.origin.y 的值（封装成更简单的方法）
 *
 * 赋值时 frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
//@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
//@property (nonatomic, readonly) CGFloat orientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;
/**********************************************************
 函数名称：fitSizeWithString: fontSize: size:
 函数描述：设置适合文字的区域。
 输入参数  fitString,fontSize,size
 输出参数：N/A
 返回值：CGSize。
 **********************************************************/
-(CGSize)fitSizeWithString:(NSString *)fitString fontSize:(CGFloat)fontSize size:(CGSize)size;

@end
