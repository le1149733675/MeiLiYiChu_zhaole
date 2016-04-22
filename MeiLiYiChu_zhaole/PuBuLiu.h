//
//  PuBuLiu.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PuBuLiu : NSObject
@property (nonatomic,copy) NSString *taobao_title;
@property (nonatomic,copy) NSString *taobao_price;
@property (nonatomic,copy) NSString *taobao_pic_url;
@property (nonatomic,copy) NSString *money_symbol;
@property (nonatomic,copy) NSString *product_id;
@property (nonatomic,copy) NSString *tag_url;
@property (nonatomic,copy) NSString *taobao_num_iid;
+(PuBuLiu *)parseWaterMessageWithDict:(NSDictionary *)dict;
@end
