//
//  FenRexiao.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "FenRexiao.h"

@implementation FenRexiao
+(FenRexiao *)parseWaterMessageWithDict:(NSDictionary *)dict{
    FenRexiao *rexiao = [[FenRexiao alloc]init];
    rexiao.tag_url = [dict objectForKey:@"tag_url"];
    rexiao.taobao_title = [dict objectForKey:@"taobao_title"];
    rexiao.taobao_promo_price = [dict objectForKey:@"taobao_promo_price"];
    rexiao.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    rexiao.taobao_num_iid = [dict objectForKey:@"taobao_num_iid"];
    return rexiao;
}

@end
