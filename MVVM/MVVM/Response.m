//
//  Response.m
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "Response.h"

@implementation Response

-(instancetype)initWithDictionary:(NSDictionary *)dic {
    kEnumServerState flag = kEnumServerStateSuccess;
    NSObject *data = @"";
    NSString *message = @"";
    NSString *status = @"";
    if ([dic valueForKey:@"code"]) {
        flag = [[dic valueForKey:@"code"] integerValue];
    }
    data = [dic objectForKey:@"data"];
    message = [dic valueForKey:@"msg"];
    status = [dic valueForKey:@"status"];
    return [self initWithState:flag result:data message:message];
}

- (Response *)initWithState:(kEnumServerState)state result:(NSObject *)data message:(NSString *)message; {
    if (self = [super init]) {
        _status = state;
        _data = data;
        _msg = message;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"status=%@, data=%@, message=%@",@(_status),_data,_msg];
}

@end
