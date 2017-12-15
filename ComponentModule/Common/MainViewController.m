//
//  MainViewController.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/1.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SellerViewController.h"
#import "MallViewController.h"
#import "MineViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - LiftCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *home = [[HomeViewController alloc]init];
    SellerViewController *seller = [[SellerViewController alloc]init];
    MallViewController *mall = [[MallViewController alloc]init];
    MineViewController *mine = [[MineViewController alloc]init];
    
    
    
    [self setChildrenVC:home title:@"首页" image:@"home_pag_black" selectedImage:@"home_pag_red"];
    
    [self setChildrenVC:seller title:@"商家" image:@"home_merchant_black" selectedImage:@"home_merchant_red"];
    
    
    [self setChildrenVC:mall title:@"商城" image:@"home_shop_black" selectedImage:@"home_shop_red"];
    
    [self setChildrenVC:mine title:@"我的" image:@"home_me_black" selectedImage:@"home_me_red"];
}



- (void)setChildrenVC:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    viewController.title = title;
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:viewController];
//    navVC.hidesBottomBarWhenPushed = YES;
    navVC.tabBarItem.image = [[UIImage theme_imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage theme_imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //导航栏标题颜色
    navVC.navigationBar.barTintColor = [UIColor colorWithHexString:THEMEManager.currentThemeConfig[NavigationBar][NavigationBarTintColor]];
    [navVC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:THEMEManager.currentThemeConfig[NavigationBar][NavigationBarTitleLabelColor]],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    [navVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:THEMEManager.currentThemeConfig[TabBar][TabBarTitleLabelColor]]} forState:UIControlStateNormal];
    [navVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:THEMEManager.currentThemeConfig[TabBar][TabBarTitleLabelColorSelected]]} forState:UIControlStateSelected];
    [self addChildViewController:navVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






#pragma mark - Delegate

#pragma mark - Event Handle

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Getter 和 Setter
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
