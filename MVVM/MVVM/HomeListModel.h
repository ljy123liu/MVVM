//
//  HomeListModel.h
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "BaseModel.h"
@interface HomeListModel : BaseModel

@property (nonatomic,strong) NSString <Optional> *createdAt;
@property (nonatomic,strong) NSString <Optional> *newsCreateTime;
@property (nonatomic,strong) NSString <Optional> *newsId;
@property (nonatomic,strong) NSString <Optional> *newsImage;
@property (nonatomic,strong) NSString <Optional> *newsLink;
@property (nonatomic,strong) NSString <Optional> *newsNum;
@property (nonatomic,strong) NSString <Optional> *newsSource;
@property (nonatomic,strong) NSString <Optional> *newsTitle;
@property (nonatomic,strong) NSString <Optional> *newsType;
@property (nonatomic,strong) NSString <Optional> *newsTypeName;
@property (nonatomic,strong) NSString <Optional> *objectId;
@property (nonatomic,strong) NSString <Optional> *updatedAt;

@end
