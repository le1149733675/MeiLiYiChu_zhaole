//
//  FenJiage.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenJiage : NSObject

@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *taobao_promo_price;
@property(nonatomic,copy)NSString *tag_url;
@property(nonatomic,copy)NSString *taobao_pic_url;

+(FenJiage *)parseWaterMessageWithDict:(NSDictionary *)dict;

@end
