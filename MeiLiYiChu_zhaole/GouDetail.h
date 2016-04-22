//
//  GouDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GouDetail : NSObject

@property(nonatomic,copy)NSString *taobao_selling_price;
@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *taobao_pic_url;
@property(nonatomic,copy)NSString *taobao_price;
@property(nonatomic,copy)NSString *style_key;
@property(nonatomic,copy)NSString *style;
@property(nonatomic,copy)NSString *size_key;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *number;
@property(nonatomic,copy)NSString *sku_id;

//自定义model类
@property(nonatomic,assign)NSInteger isSale;
@property(nonatomic,assign)BOOL isselected;


+(GouDetail *)parseWaterMessageWithDict:(NSDictionary *)dict;


@end
