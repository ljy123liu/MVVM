//
//  HomeViewModel.m
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "HomeViewModel.h"
#import "APIClient.h"
#import "Define.h"
#import "HomeListModel.h"
#import "Response.h"
@implementation HomeViewModel

//处理网络获取的数据
- (void)handleDataWithSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
    
    [[APIClient sharedManager] netWorkGetHomePageListWithPageSize:20 pageNum:0 success:^(Response *respone) {
        
        if (respone.status==kEnumServerStateSuccess) {
            
            NSMutableArray *tmpArr=[NSMutableArray array];
            for (NSDictionary *subDic in (NSArray *)[respone.data valueForKey:@"results"]) {
                HomeListModel *model=[[HomeListModel alloc]initWithDic:subDic];
                [tmpArr addObject:model];
            }
            success(tmpArr);
        }

    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
