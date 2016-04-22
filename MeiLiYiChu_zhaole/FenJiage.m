//
//  FenJiage.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "FenJiage.h"

@implementation FenJiage
+(FenJiage *)parseWaterMessageWithDict:(NSDictionary *)dict{
    FenJiage *jiage = [[FenJiage alloc]init];
    jiage.taobao_title = [dict objectForKey:@"taobao_title"];
    jiage.taobao_promo_price = [dict objectForKey:@"taobao_promo_price"];
    jiage.tag_url = [dict objectForKey:@"tag_url"];
    jiage.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    return jiage;
}

@end
