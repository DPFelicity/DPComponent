//
//  ThemeManager.h
//  ComponentModule
//
//  Created by Heaven on 2017/12/1.
//Copyright © 2017年 heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#define THEMEManager ([ThemeManager shareManager])

typedef NS_ENUM(NSUInteger,ThemeType) {
    ThemeHCWX = 0,
    ThemeLSG = 1,
};

@interface ThemeManager : NSObject
//当前主题，以及主题的修改，重写了set方法，
@property (nonatomic,assign) ThemeType themeType;

//当前主题的配置参数
@property (nonatomic, strong, readonly) NSDictionary *currentThemeConfig;
///图片名字前缀
@property (nonatomic, strong, readonly) NSString *imageNamePrefix;

///当前主题图片名字前缀
+ (NSString *)getImageNamePrefix;

+(instancetype)shareManager;





@end
