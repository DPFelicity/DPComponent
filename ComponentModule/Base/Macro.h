//
//  Macro.h
//  ComponentModule
//
//  Created by Heaven on 2017/12/4.
//  Copyright © 2017年 heaven. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//切圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//切圆角和颜色
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define KeyWindow ([UIApplication sharedApplication].keyWindow)











#endif /* Macro_h */
