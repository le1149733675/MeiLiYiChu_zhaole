//
//  GoumaiModel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "GoumaiModel.h"

@implementation GoumaiModel

+(GoumaiModel *)parseRequestWithGouwucheDict:(NSDictionary *)dict{
    GoumaiModel *goumai = [[GoumaiModel alloc]init];
    goumai.taobao_title = [dict objectForKey:@"taobao_title"];
    goumai.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    goumai.taobao_price = [dict objectForKey:@"taobao_selling_price"];
    goumai.style = [dict objectForKey:@"style"];
    goumai.size = [dict objectForKey:@"size"];
    goumai.quantity = [dict objectForKey:@"quantity"];
    goumai.sku_id = [dict objectForKey:@"sku_id"];
    
//    NSMutableDictionary *skuDict = [NSMutableDictionary dictionary];
//    [skuDict setObject:@"sku_id" forKey:[NSString stringWithFormat:@"%@%@",goumai.style,goumai.size]];
//    NSLog(@" 新字典 %@",skuDict);
    
    return goumai;
}

@end
