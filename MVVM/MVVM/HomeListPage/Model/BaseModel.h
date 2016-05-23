//
//  BaseModel.h
//  MVVM
//
//  Created by LIUYONG on 16/3/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
