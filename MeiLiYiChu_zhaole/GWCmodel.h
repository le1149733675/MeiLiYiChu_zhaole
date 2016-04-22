//
//  GWCmodel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWCmodel : NSObject

@property(nonatomic,copy)NSString *brand_title;
@property(nonatomic,assign)NSInteger carts_count;
@property(nonatomic,retain)NSMutableArray *GWCarray;

//自定义声明model属性
@property(nonatomic,assign)BOOL is_Seleted;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *quantity;

@property(nonatomic,copy)NSString *save;

+(GWCmodel *)parseWaterMessageWithDict:(NSDictionary *)dict;

@end
