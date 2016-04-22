//
//  Right.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Right : NSObject
@property (nonatomic,copy) NSString *taobao_num_iid;
@property (nonatomic,copy) NSString *taobao_title;
@property (nonatomic,copy) NSString *taobao_price;
@property (nonatomic,copy) NSString *taobao_promo_price;
@property (nonatomic,copy) NSString *taobao_pic_url;
@property (nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *action;
+(Right *)parseRightWithDict:(NSDictionary *)dict;
@end
