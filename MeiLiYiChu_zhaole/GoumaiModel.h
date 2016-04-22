//
//  GoumaiModel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoumaiModel : NSObject

@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *taobao_pic_url;
@property(nonatomic,copy)NSString *taobao_price;
@property(nonatomic,copy)NSString *style;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *quantity;
//购物车专用id
@property(nonatomic,copy)NSString *sku_id;

//@property(nonatomic,retain)NSMutableDictionary *skuDict;

+(GoumaiModel *)parseRequestWithGouwucheDict:(NSDictionary *)dict;

@end
