//
//  BaseViewController.m
//  YoungPure
//
//  Created by Jerry.Yang on 2017/12/4.
//  Copyright © 2017年 Jerry.Yang. All rights reserved.
//


#import "BaseViewController.h"
@interface BaseViewController ()<UIAlertViewDelegate >
{
    
}

@property (assign,nonatomic) BOOL bt_r_n;
@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置默认情况
    self.bt_r_n = YES;
    //设置导航栏背景色为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //设置默认标题
    [self setNavigationBarTitle:self.tabBarItem.title];
    //设置baseview背景色
    self.view.backgroundColor = [UIColor colorWithHexString:BIG_BACKGROUND_COLOR];
    
    
#pragma mark  测试功能代码

    
    
    [self creatBarButtonItemWithType:NavigationItemType_left WithImg:[UIImage imageNamed:@"tab_discovery_icon_highlighted"] target:self action:@selector(rightbtnevent)];
    
    [self creatBarButtonItemWithType:NavigationItemType_right WithImg:[UIImage imageNamed:@"tab_discovery_icon_highlighted"] target:self action:@selector(rightbtnevent)];
    
    UIBarButtonItem * barButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tab_discovery_icon_highlighted"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    UILabel * view = [[UILabel alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.text =@"zidingyizidingyizidingyizidingyizidingyizidingyizidingyizidingyizidingyi";
    view.textColor = [UIColor blueColor];
    self.navigationItem.titleView = view;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  测试功能代码
-(void)leftbtnevent
{
    
}
-(void)rightbtnevent
{
    BaseViewController * vc = [[BaseViewController alloc] init];
 
    [self.navigationController pushViewController:vc animated:NO];
    
    
//     self.navigationItem.titleView = view;
}



#pragma mark --
#pragma mark  **************尽量提供全部设置方法**************
/*⚠️备注 注意主体顺序
 *⚠️0:以 UINavigationController 为整个应用的根控制器,UITabBarController 又为 navigationController 的 rootViewControlle
 *⚠️1:以 UITabBarController 为整个应用的根控制器,UINavigationController 又为 UITabBarController 的 ViewController之一
 *⚠️此两种情况下设置方法是不一样的
 *⚠️故此提供属性在方法里面判断然后区分  bt_r_n
 */






#pragma mark --
#pragma mark TabBarController和NavigationController相关设置 自定义视图除外
/*
 *🚩设置选中tag
 */
-(void)setTabBarSelectIndexNum:(NSInteger)numindes
{
    self.tabBarController.selectedIndex = numindes;
}







#pragma mark --
#pragma mark 设置上面区域 navigationbar
/*
 * 🚩调用系统方法设置navigationbar的背景色
 * ⚠️此方法仅在 模式1下能够区分设置  模式0下会被覆盖,只能有一种情况
 */
-(void)setNavigationBarStyle:(UIBarStyle)nstyle
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}
/*
 * 🚩NavigationBar Backcolor
 * ⚠️此方法仅在 模式1下能够区分设置  模式0下会被覆盖,只能有一种情况
 */
-(void)setNavigationBarBackcolor:(UIColor*)color
{
    [self.navigationController.navigationBar setBarTintColor:color];
}
/*
 * 🚩navigationItem title
 * ⚠️此方法仅在 模式1下能够区分设置  模式0下会被覆盖,只能有一种情况
 */
-(void)setNavigationBarTitle:(NSString*)strtitle
{
    if (_bt_r_n) {
       self.navigationItem.title = strtitle;
    }
    else
    {
        self.tabBarController.navigationItem.title = strtitle;
    }
}
/*
 * 🚩navigationBar title 颜色
 * ⚠️此方法仅在 模式1下能够区分设置  模式0下会被覆盖,只能有一种情况
 */
-(void)setNavigationBarTitlecolor:(UIColor*)color
{
    NSMutableDictionary *textSelectAttrs = [NSMutableDictionary dictionary];
    textSelectAttrs[NSForegroundColorAttributeName] = color;
    self.navigationController.navigationBar.titleTextAttributes = textSelectAttrs;
}
/*
 * 🚩navigationBarItem 所有图片情况下 颜色
 * ⚠️此方法才能区分 navigationBar和Tabbar上面 item的颜色,否则默认情况下navigationBar Item 的颜色和Tabbar Item的选中颜色一样
 * ⚠️⚠️⚠️此方法 🚩不能 直接设置文字情况下item颜色.
 */
-(void)setNavigationBarItemALLimgiconbackcolor:(UIColor*)color
{
    [self.navigationController.navigationBar setTintColor:color];
}
/*
 * 🚩navigationItem 单个Item 颜色(不管是图片还是文字)
 * ⚠️此方法才能区分 navigationBar和Tabbar上面 item的颜色,否则默认情况下navigationBar Item 的颜色和Tabbar Item的选中颜色一样
 * ⚠️⚠️只有此方法 🚩能 直接设置文字情况下item颜色.
 * ⚠️⚠️⚠️此方法 调用后 🚩如果item为文字情况下 setNavigationBarItemALLimgiconbackcolor再次设置 无法影响此Item
 */
-(void)setNavigationBarItemWithType:(NavigationItemType)ntype Withbackcolor:(UIColor*)color
{
    switch (ntype) {
        case NavigationItemType_left:
            {
                if (_bt_r_n) {
                    [self.navigationItem.leftBarButtonItem setTintColor:color];
                }
                else
                {
                    [self.tabBarController.navigationItem.leftBarButtonItem setTintColor:color];
                }
            }
            break;
        case NavigationItemType_right:
        {
            if (_bt_r_n) {
                [self.navigationItem.rightBarButtonItem setTintColor:color];
            }
            else
            {
                [self.tabBarController.navigationItem.rightBarButtonItem setTintColor:color];
            }
        }
            break;
        case NavigationItemType_back:
        {
            if (_bt_r_n) {
                [self.navigationItem.backBarButtonItem setTintColor:color];
            }
            else
            {
                [self.tabBarController.navigationItem.backBarButtonItem setTintColor:color];
            }
        }
            break;
            
        default:
            break;
    }

}




/*
 * 🚩navigationItem 单个Item 的文字 文字颜色 及事件响应方法
 * ⚠️
 */
-(void)creatBarButtonItemWithType:(NavigationItemType)ntype WithTitle:(nullable NSString *)strtitle WithTitlecolor:(UIColor*)titlecolor target:(nullable id)target action:(nullable SEL)action
{
    UIBarButtonItem * barButtonItem =[[UIBarButtonItem alloc] initWithTitle:strtitle
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:target
                                                                     action:action];
    [barButtonItem setTintColor:titlecolor];//设置navigationbar上左右按钮字体颜色
    
    [self setbaritem:barButtonItem WithType:ntype];
}
/*
 * 🚩navigationItem 单个Item 的图片  及事件响应方法
 * ⚠️
 */
-(void)creatBarButtonItemWithType:(NavigationItemType)ntype WithImg:(nullable UIImage *)img target:(nullable id)target action:(nullable SEL)action
{
    UIBarButtonItem * barButtonItem =[[UIBarButtonItem alloc] initWithImage:img
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:target
                                                                     action:action];
    [self setbaritem:barButtonItem WithType:ntype];
}
/*
 * 🚩navigationItem 单个Item 系统样式 及事件响应方法
 * ⚠️
 */
-(void)creatBarButtonItemWithType:(NavigationItemType)ntype WithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(nullable id)target action:(nullable SEL)action
{
    UIBarButtonItem * barButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem
                                                                                   target:target
                                                                                   action:action];
    [self setbaritem:barButtonItem WithType:ntype];
}

/*
 * 🚩自定义navigationItem 的title View
 * ⚠️
 */
-(void)creatNavigationItemTitleView:(nullable UIView *)view
{
    if (_bt_r_n) {
        self.navigationItem.titleView = view;
    }
    else
    {
        self.tabBarController.navigationItem.titleView = view;
    }
}



#pragma mark --
#pragma mark 设置下面区域。tabbar
/*
 * 🚩设置tabbar的背景色
 * ⚠️不能区分 只能统一设置  覆盖上一次
 */
-(void)setTabBarBackgroundColor:(UIColor*)color
{
    [self.tabBarController.tabBar setBarTintColor:color];
}
/*
 * 🚩设置半透明
 */
-(void)setTabBarTranslucent:(BOOL)btranslucent
{
    [self.tabBarController.tabBar setTranslucent:btranslucent];
    //或者 self.tabBarController.tabBar.translucent = NO;
}
/*
 * 🚩设置tabbar的title
 */
-(void)setTabBarTtemTitle:(NSString*)strtitle
{
    self.tabBarItem.title=strtitle;
}
/*
 * 🚩设置提示信息
 */
-(void)setTabBarTtemBadgeValue:(NSString*)strtag
{
    self.tabBarItem.badgeValue = strtag;
}
/*
 * 🚩设置tabbar提示信息背景色
 * ⚠️此方法在ios10 之后才使用
 */
-(void)setTabBarTtemBadgeColor:(UIColor*)color
{
    if (@available(iOS 10.0, *)) {
        self.tabBarItem.badgeColor = color;
    } else {
        // Fallback on earlier versions
    }
}
/*
 * 🚩隐藏tabbar提示信息
 */
-(void)hideTabBarTtemBadgeValue
{
    self.tabBarItem.badgeValue = nil;
}






#pragma mark 视图控制器设置
//设置视图控制器背景色
-(void)setBaseViewBackgroundColor:(UIColor*)color
{
    self.view.backgroundColor =color;
}







#pragma mark ----------------- 二次封装内部调用方法
-(void)setbaritem:(UIBarButtonItem*)barButtonItem WithType:(NavigationItemType)ntype
{
    switch (ntype) {
        case NavigationItemType_left:
        {
            if (_bt_r_n) {
                self.navigationItem.leftBarButtonItem = barButtonItem;
            }
            else
            {
                self.tabBarController.navigationItem.leftBarButtonItem = barButtonItem;
            }
        }
            break;
        case NavigationItemType_right:
        {
            if (_bt_r_n) {
                self.navigationItem.rightBarButtonItem = barButtonItem;
            }
            else
            {
                self.tabBarController.navigationItem.rightBarButtonItem = barButtonItem;
            }
        }
            break;
        case NavigationItemType_back:
        {
            if (_bt_r_n) {
                self.navigationItem.backBarButtonItem = barButtonItem;
            }
            else
            {
                self.tabBarController.navigationItem.backBarButtonItem = barButtonItem;
            }
        }
            break;
            
        default:
            break;
    }
}


@end






