//
//  HomeViewController.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/4.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "HomeViewController.h"
#import "RecomendViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - LiftCycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    
    
}


//根据需要跳转到不同的地方，传递相应的参数
- (IBAction)recomend:(id)sender {
    Class recomend = NSClassFromString(THEMEManager.currentThemeConfig[Controller][ControllerRecomend]);
    BaseViewController *VC = [[recomend alloc]init];
    VC.name = @"我是参数";
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor redColor] colorWithAlphaComponent:0.5]] forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view from its nib.
}
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
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

@end
