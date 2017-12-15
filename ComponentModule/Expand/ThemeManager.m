//
//  ThemeManager.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/1.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *manager = nil;

@implementation ThemeManager

+ (void)load{
    [super load];
    [ThemeManager shareManager];
}

+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ThemeManager alloc]init];
    });
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.themeType = [self getTypeFromLocal];
    }
    return self;
}

- (void)setThemeType:(ThemeType)themeType {
        _themeType = themeType;
        NSString *path;
        switch (themeType) {
            case ThemeHCWX:{
                _imageNamePrefix = @"sp_";
                path = [[NSBundle mainBundle]pathForResource:@"ThemeHCWX" ofType:@"json"];
            }
                break;
            case ThemeLSG:{
                _imageNamePrefix = @"";
                path = [[NSBundle mainBundle]pathForResource:@"ThemeLSG" ofType:@"json"];
            }
                break;
            default:
                break;
        }
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        _currentThemeConfig = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        if (_currentThemeConfig == nil) {
            NSAssert(false, @"ThemeConfig配置有误", self);
            abort();
        }
        //保存当前配置到本地
        [self saveTypeLocal:themeType];
    
}

+ (NSString *)getImageNamePrefix{
    return [ThemeManager shareManager].imageNamePrefix;
}

- (void)saveTypeLocal:(ThemeType)themeType{
    [[NSUserDefaults standardUserDefaults] setInteger:themeType forKey:ThemeTypeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (ThemeType)getTypeFromLocal{
    ThemeType type = [[NSUserDefaults standardUserDefaults]integerForKey:ThemeTypeKey];
    if (!type) {
        type = ThemeHCWX;
    }
    return type;
}

@end
