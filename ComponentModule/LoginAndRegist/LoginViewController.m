//
//  LoginViewController.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/4.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TF;
@property (nonatomic,strong)NSBundleResourceRequest *resourceRequest;
@end

@implementation LoginViewController

#pragma mark - LiftCycle
- (void)dealloc{
    [self.resourceRequest.progress removeObserver:self forKeyPath:@"fractionCompleted"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.hidden = YES;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"self.TF 地址：%p",self.TF);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate

#pragma mark - Event Handle


- (IBAction)login:(id)sender {
    
    if ([self.TF.text isEqualToString:@"1"]) {
        NSSet *tags = [NSSet setWithArray: @[@"HCWX"]];
        // All the resources are in the main bundle so use the shorter initialization method
        self.resourceRequest = [[NSBundleResourceRequest alloc] initWithTags:tags];

        [self.resourceRequest.progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:NULL];
        
        [self.resourceRequest conditionallyBeginAccessingResourcesWithCompletionHandler:^(BOOL resourcesAvailable) {
            if (resourcesAvailable) {
                dispatch_async(dispatch_get_main_queue(),^{
                    THEMEManager.themeType = ThemeHCWX;
                    KeyWindow.rootViewController = [[MainViewController alloc]init];
                });
                
            }else{
                dispatch_async(dispatch_get_main_queue(),^{
                    [self loadData];
                });
            }
            
        }];
        
        
    }else{
        THEMEManager.themeType = ThemeLSG;
        KeyWindow.rootViewController = [[MainViewController alloc]init];
    }
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ((object == self.resourceRequest.progress) && ([keyPath isEqualToString:@"fractionCompleted"])) {
            double progressSoFar = self.resourceRequest.progress.fractionCompleted;
        NSLog(@"--------%f",progressSoFar);
        if (progressSoFar>=1) {
//            dispatch_async(dispatch_get_main_queue(),^{
//                NSSet *tags = [NSSet setWithArray:@[@"HCWX"]];
//                [self.resourceRequest.bundle setPreservationPriority:1.0 forTags:tags];
//                THEMEManager.themeType = ThemeHCWX;
//                KeyWindow.rootViewController = [[MainViewController alloc]init];
//            });
        }
        
    }
                                                       
}



- (void)loadData{
    [self.resourceRequest beginAccessingResourcesWithCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(),^{
                NSSet *tags = [NSSet setWithArray:@[@"HCWX"]];
                [self.resourceRequest.bundle setPreservationPriority:1.0 forTags:tags];
                THEMEManager.themeType = ThemeHCWX;
                KeyWindow.rootViewController = [[MainViewController alloc]init];
            });
        }else{
            NSLog(@"下载错误");
        }
    }];
}
#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Getter 和 Setter

@end
