//
//  Left.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "Left.h"

@implementation Left
+(Left *)parseLeftWithDict:(NSDictionary *)dict
{
    Left *left = [[Left alloc] init];
    left.taobao_num_iid = [dict objectForKey:@"taobao_num_iid"];
    left.taobao_title = [dict objectForKey:@"taobao_title"];
    left.taobao_promo_price = [dict objectForKey:@"taobao_promo_price"];
    left.taobao_price = [dict objectForKey:@"taobao_price"];
    left.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    left.pic_url = [dict objectForKey:@"pic_url"];
    left.action = [dict objectForKey:@"action"];
    return left;
}
@end
