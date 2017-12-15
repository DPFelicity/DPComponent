# DPComponent
主题切换思想实现动态UI
1、创建.json文件用来存放基类需要的属性、网络请求配置，格式如下：
```
{
    "Color":{
        "BaseColor":"#3096EA"
    },
    "Label": {
        "baseTitleColor":"#3096EA",
        "titleColor":"#3096EA",
        "subtitleColor":"#666666"
    },
    "NavigationBar": {
        "tintColor":"#3096EA",
        "titleLabelColor":"#FFFFFF"
    },
    "TabBar": {
        "titleLabelColor":"#333333",
        "titleLabelColorSelected":"#3096EA"
    },
    "Button":{
        "titleColor":"#FFFFFF",
        "titleColorSelected":"#FFFFFF",
        "backgroundColor":"#3096EA",
        "backgroundColorSelected":"#FFFFFF",
    },
    "Beta":{
        "serverApi":"http://temp.api.mypip.cn/router",
        "appKey":"JC-iOS-Alpha",
        "appSecret":"MTgxN2EwMmRkNTdjZWE0OTM2MDVlNWE5",
        "qrcodeDomin":"http://lai.szhedehan.com",
        "updataPhotoKey":"JC-iOS-Beta"
    },
    "Release":{
        "serverApi":"http://temp.api.mypip.cn/router",
        "appKey":"JC-iOS-Alpha",
        "appSecret":"MTgxN2EwMmRkNTdjZWE0OTM2MDVlNWE5",
        "qrcodeDomin":"http://lai.szhedehan.com",
        "updataPhotoKey":"JC-iOS-Beta"
    },
    "Prod":{
        "serverApi":"http://temp.api.mypip.cn/router",
        "appKey":"JC-iOS-Alpha",
        "appSecret":"MTgxN2EwMmRkNTdjZWE0OTM2MDVlNWE5",
        "qrcodeDomin":"http://lai.szhedehan.com",
        "updataPhotoKey":"JC-iOS-Beta"
    },
    
    
}
```
所有key都用全局变量来定义，便于后期读取数据
```
static NSString * ThemeTypeKey = @"ThemeType";

static NSString * Label = @"Label";
static NSString * LabelSubtitleColor = @"subtitleColor";
static NSString * LabelTitleColor = @"titleColor";
static NSString * LabelBaseTitleColor = @"baseTitleColor";

static NSString * TabBar = @"TabBar";
static NSString * TabBarTitleLabelColor = @"titleLabelColor";
static NSString * TabBarTitleLabelColorSelected = @"titleLabelColorSelected";


static NSString * NavigationBar = @"NavigationBar";
static NSString * NavigationBarTintColor = @"tintColor";
static NSString * NavigationBarTitleLabelColor = @"titleLabelColor";

static NSString * Button = @"Button";
static NSString * ButtonTitleColor = @"titleColor";
static NSString * ButtonTitleColorSelected = @"titleColorSelected";
static NSString * ButtonBackgroundColor = @"backgroundColor";
static NSString * ButtonBackgroundColorSelected = @"backgroundColorSelected";

//接口配置
static NSString * Beta = @"Beta";
static NSString * Release = @"Release";
static NSString * Prod = @"Prod";
static NSString * ServerApi = @"serverApi";
static NSString * AppKey = @"appKey";
static NSString * AppSecret = @"appSecret";
static NSString * QrcodeDomin = @"qrcodeDomin";
static NSString * UpdataPhotoKey = @"updataPhotoKey";
```
2、接口请求的相关参数请求之后要全局保存早本地
```
//切换环境配置，通过注释来完成
NSString *key = Beta;
    //    NSString *key = Release;
    //    NSString *key = Prod;
    [ThemeManager shareManager].themeType = ThemeLSG;
    [UserDefaults setValue:THEMEManager.currentThemeConfig[key][ServerApi] forKey:ServerApi];
    [UserDefaults setValue:THEMEManager.currentThemeConfig[key][AppKey] forKey:AppKey];
    [UserDefaults setValue:THEMEManager.currentThemeConfig[key][AppSecret] forKey:AppSecret];
    [UserDefaults setValue:THEMEManager.currentThemeConfig[key][QrcodeDomin] forKey:QrcodeDomin];
    [UserDefaults setValue:THEMEManager.currentThemeConfig[key][UpdataPhotoKey] forKey:UpdataPhotoKey];
    [UserDefaults synchronize];
```
3、自定义常用控件，所有控件都用相应的自定义控件创建，相应属性读取json文件
如下：
```
Label 读取颜色
NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelSubtitleColor];
self.textColor = [UIColor colorWithHexString:colorStr];

image读取图片
+ (UIImage *)theme_imageNamed:(NSString *)name{
    //基类图片前缀
    NSString *pre = THEMEManager.imageNamePrefix;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",pre,name]];
    return image;
}
其他控件也遵照以上方式
```
4、页面跳转和参数传递
所有控制器继承于BaseViewController，在BaseViewController 创建参数属性，作为参数传递的中间量，具体形式视情况而定，是数组、字符串、还是字典。
跳转方式做简化处理，如下：
```
Class recomend = NSClassFromString(THEMEManager.currentThemeConfig[Controller][ControllerRecomend]);
BaseViewController *VC = [[recomend alloc]init];
VC.name = @"我是参数";
VC.hidesBottomBarWhenPushed = YES;
[self.navigationController pushViewController:VC animated:YES];
```
具体跳转到那里需要在json文件中配置，这样各个模块都是独立的，不需要在#import造成耦合，是模态跳转还是push，看需求。


