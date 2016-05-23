//
//  APIClient.m
//  MVVM
//
//  Created by LIUYONG on 16/3/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "APIClient.h"
#import "NetTool.h"
#import "Urls.h"
#import "Response.h"
@implementation APIClient

//单例，每次只允许一次网络请求
+ (APIClient *)sharedManager {
    
    static APIClient *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        //一次只允许一个请求
        if (manager == nil) {
            manager = [APIClient new];
        }
    });
    return manager;
}

//获取首页list数据
- (void)netWorkGetHomePageListWithPageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum success:(void (^)(Response *))success failure:(void (^)(NSError *))failure {
    
    NSDictionary *paramDict = [NSDictionary dictionaryWithObjectsAndKeys:@(pageSize),@"limit",@(pageNum),@"skip",nil];
    NSLog(@"param:%@",paramDict);
    [[NetTool shareManager] httpGetRequest:kApi_Get_HomePageList parameter:paramDict success:^(Response *response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end
