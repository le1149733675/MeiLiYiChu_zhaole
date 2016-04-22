//
//  PuBuLiu.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "PuBuLiu.h"

@implementation PuBuLiu
+(PuBuLiu *)parseWaterMessageWithDict:(NSDictionary *)dict{
    PuBuLiu *ppp = [[PuBuLiu alloc] init];
    ppp.taobao_title = [dict objectForKey:@"taobao_title"];
    ppp.taobao_price = [dict objectForKey:@"taobao_price"];
    ppp.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    ppp.money_symbol = [dict objectForKey:@"money_symbol"];
    ppp.product_id = [dict objectForKey:@"product_id"];
    ppp.tag_url = [dict objectForKey:@"tag_url"];
    ppp.taobao_num_iid = [dict objectForKey:@"taobao_num_iid"];
    return ppp;
}

@end
