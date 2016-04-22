//
//  GouDetail.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "GouDetail.h"

@implementation GouDetail
+(GouDetail *)parseWaterMessageWithDict:(NSDictionary *)dict{
    GouDetail *detail = [[GouDetail alloc]init];
    detail.taobao_title = [dict objectForKey:@"taobao_title"];
    detail.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    detail.taobao_price = [dict objectForKey:@"taobao_price"];
    detail.style_key = [dict objectForKey:@"style_key"];
    detail.style = [dict objectForKey:@"style"];
    detail.size_key = [dict objectForKey:@"size_key"];
    detail.size = [dict objectForKey:@"size"];
    detail.number = [dict objectForKey:@"number"];
    detail.taobao_selling_price = [dict objectForKey:@"taobao_selling_price"];
    detail.sku_id = [dict objectForKey:@"sku_id"];
    
    //给自定义model类赋初值
    detail.isSale = 1;
    detail.isselected = NO;
    
    
    
    
    return detail;
}

@end
