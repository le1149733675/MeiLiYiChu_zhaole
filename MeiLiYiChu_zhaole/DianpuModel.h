//
//  DianpuModel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DianpuModel : NSObject

@property(nonatomic,copy)NSString *taobao_pic_url;
@property(nonatomic,copy)NSString *taobao_selling_price;
@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *logo_url;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *taobao_num_iid;

+(DianpuModel *)parseDianpuMessageWithDict:(NSDictionary *)dict;


@end
