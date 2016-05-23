//
//  HomeTableViewCell.h
//  MVVM
//
//  Created by LIUYONG on 16/3/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeListModel;
@interface HomeTableViewCell : UITableViewCell
@property (nonatomic,strong) HomeListModel *data;
@end
