//
//  BaseTabBarController.m
//  YoungPure
//
//  Created by Jerry.Yang on 2017/12/4.
//  Copyright © 2017年 Jerry.Yang. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()



@end

@implementation BaseTabBarController
#pragma mark 初始化
+ (BaseTabBarController *)shareInstance {
    static BaseTabBarController *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMembers];
    [self addView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化区域
//初始化属性
-(void)initMembers
{
    self.delegate = self;
}
//添加view视图
-(void)addView
{
    [self setupAllChildViewController];
}
#pragma mark  自写方法
-(void)setupAllChildViewController
{
    //初始化页面
    // 1.首页
    UINavigationController *homNavController;
    _oneSelectVC  =  [[HomeViewController alloc] init];
    homNavController = [[UINavigationController alloc] initWithRootViewController:_oneSelectVC];
    //2.搜索
    _twoSelectVC = [[FindViewController alloc] init];
    UINavigationController *findNavController = [[UINavigationController alloc] initWithRootViewController:_twoSelectVC];
    // 3.我的
    _threeSelectVC = [[MineViewController alloc] init];
    UINavigationController *mineNavController = [[UINavigationController alloc] initWithRootViewController:_threeSelectVC];
   
    //初始化图片
   _oneSelectVC.tabBarItem= [self setbaritemWithimg:@"tag_home_btn_normal" Withimgsel:@"tag_home_btn_highlighted" WithTabTitle:@"Home" WithColor:@"#808080" WithColorSel:@"#f54683"];
    _twoSelectVC.tabBarItem= [self setbaritemWithimg:@"tab_discovery_icon_normal" Withimgsel:@"tab_discovery_icon_highlighted" WithTabTitle:@"Search" WithColor:@"#808080" WithColorSel:@"#f54683"];
    _threeSelectVC.tabBarItem= [self setbaritemWithimg:@"tab_personal_btn_normal" Withimgsel:@"tab_personal_btn_highlighted" WithTabTitle:@"Mine" WithColor:@"#808080" WithColorSel:@"#f54683"];
   //归档
    self.viewControllers = @[homNavController,findNavController,mineNavController];
    
}

-(UITabBarItem*)setbaritemWithimg:(NSString*)strimg Withimgsel:(NSString*)strimgsel WithTabTitle:(NSString*)strtitle WithColor:(NSString*)strcolor WithColorSel:(NSString*)strcolorSel
{
 UITabBarItem * tabBarItem= [[UITabBarItem alloc] initWithTitle:strtitle image:[[UIImage imageNamed:strimg]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:strimgsel]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:strcolor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:strcolorSel], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    return tabBarItem;
}
// 控制哪些 ViewController 的标签栏能被点击

- ( BOOL )tabBarController:( UITabBarController *)tabBarController shouldSelectViewController :( UIViewController *)viewController{
    return YES ;
}
// 选中哪个标签栏 , 一个监控作用吧
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
