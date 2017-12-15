//
//  ThemeButton.m
//  ComponentModule
//
//  Created by Heaven on 2017/12/1.
//Copyright © 2017年 heaven. All rights reserved.
//

#import "ThemeButton.h"

#pragma mark - LiftCycle

@implementation ThemeButton
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor colorWithHexString:THEMEManager.currentThemeConfig[Button][ButtonTitleColor]] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor colorWithHexString:THEMEManager.currentThemeConfig[Button][ButtonBackgroundColor]]];
        ViewRadius(self, 5);
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setTitleColor:[UIColor colorWithHexString:THEMEManager.currentThemeConfig[Button][ButtonTitleColor]] forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor colorWithHexString:THEMEManager.currentThemeConfig[Button][ButtonBackgroundColor]]];
    ViewRadius(self, 5);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation RadiusButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        ViewRadius(self, 5);
    }
    return self;
}
-(void)awakeFromNib {
    [super awakeFromNib];
    ViewRadius(self, 5);
    
}

@end



