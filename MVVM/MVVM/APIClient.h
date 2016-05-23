//
//  APIClient.h
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Response;
@interface APIClient : NSObject

//单例自行实例化
+ (APIClient *)sharedManager;

/**
 *  获取首页list数据
 *
 *  @param pageSize 每页数据量
 *  @param pageNum  页号
 *  @param success  成功回调
 *  @param failure  失败回调
 */
- (void)netWorkGetHomePageListWithPageSize:(NSInteger)pageSize
                                   pageNum:(NSInteger)pageNum
                                   success:(void (^)(Response *respone))success
                                   failure:(void(^)(NSError *error))failure;

@end
