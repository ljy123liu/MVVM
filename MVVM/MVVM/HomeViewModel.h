//
//  HomeViewModel.h
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

//处理网络获取的数据
- (void)handleDataWithSuccess:(void (^)(NSArray *arr))success
                      failure:(void(^)(NSError *error))failure;

@end
