//
//  UIImage+Theme.m
//  ComponentModule
//
//  Created by Heaven on 2017/11/30.
//  Copyright © 2017年 heaven. All rights reserved.
//

#import "UIImage+Theme.h"

@implementation UIImage (Theme)
+ (UIImage *)theme_imageNamed:(NSString *)name{
    //基类图片前缀
    NSString *pre = THEMEManager.imageNamePrefix;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",pre,name]];
    return image;
}
@end
