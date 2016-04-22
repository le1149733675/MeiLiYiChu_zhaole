//
//  DianpuModel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "DianpuModel.h"

@implementation DianpuModel

+(DianpuModel*)parseDianpuMessageWithDict:(NSDictionary *)dict{
    DianpuModel *dian = [[DianpuModel alloc]init];
    dian.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    dian.taobao_selling_price = [dict objectForKey:@"taobao_selling_price"];
    dian.taobao_num_iid = [dict objectForKey:@"taobao_num_iid"];
    dian.taobao_title = [dict objectForKey:@"taobao_title"];
    dian.logo_url = [[dict objectForKey:@"brand"]objectForKey:@"logo_url"];
    dian.title = [[dict objectForKey:@"brand"]objectForKey:@"title"];
    return dian;
}


@end
