//
//  ThemeLabel.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/1.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "ThemeLabel.h"

#pragma mark - LiftCycle

@implementation ThemeLabel

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelTitleColor];
        self.textColor = [UIColor colorWithHexString:colorStr];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelTitleColor];
    self.textColor = [UIColor colorWithHexString:colorStr];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end


@implementation ThemeSubLabel


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelSubtitleColor];
        self.textColor = [UIColor colorWithHexString:colorStr];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelSubtitleColor];
    self.textColor = [UIColor colorWithHexString:colorStr];
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end


@implementation ThemeBaseLabel


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelBaseTitleColor];
        self.textColor = [UIColor colorWithHexString:colorStr];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSString *colorStr = THEMEManager.currentThemeConfig[Label][LabelBaseTitleColor];
    self.textColor = [UIColor colorWithHexString:colorStr];
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
