//
//  Define.h
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#ifndef Define_h
#define Define_h

//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//导航条高度
#define kNavBarHeight 64

#define UICOLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kAppWhiteColor [UIColor whiteColor]//白色
#define kAppDarkGrayColor [UIColor darkGrayColor]//深灰色
#define kAppGrayColor [UIColor grayColor]//灰色
#define kAppMainBgColor UICOLOR_FROM_RGB(240,240,240,1)


//弱引用
#define __WeakSelf__ __weak typeof (self)

//字体
#define UIFont_size(size) [UIFont systemFontOfSize:size]

#endif /* Define_h */
