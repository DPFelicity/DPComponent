//
//  MineViewController.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/4.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

#pragma mark - LiftCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate

#pragma mark - Event Handle

- (IBAction)loginOut:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
    KeyWindow.rootViewController = nav;
}

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Getter 和 Setter

@end
