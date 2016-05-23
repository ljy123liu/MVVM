//
//  HomeDetailViewController.h
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailViewController : UIViewController

@property (nonatomic,strong) NSString *navTitle;//导航栏标题
@property (nonatomic,strong) NSString *urlStr;//用webView加载详情
@end
