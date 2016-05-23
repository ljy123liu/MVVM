//
//  NetTool.m
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "NetTool.h"
#import "AFNetworking.h"
#import "Response.h"
@implementation NetTool
+ (NetTool *)shareManager {
    static NetTool *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [NetTool new];
        }
    });
    return manager;
}

- (void)httpGetRequest:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(Response *))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.securityPolicy.allowInvalidCertificates = YES;
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", nil];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //每次开始下载任务前做判断
    NSMutableArray *requestArray = [NSMutableArray array];
    for (NSString *requestUrl in requestArray) {
        if ([url isEqualToString:requestUrl]) {
            return;
        }
    }
    [requestArray addObject:url];
    
    [sessionManager GET:url parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        Response *responseObj = [[Response alloc] initWithDictionary:responseObject];
        success(responseObj);
        [requestArray removeObject:url];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            [requestArray removeObject:url];
        }
    }];
    
}

@end
