//
//  GWCmodel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "GWCmodel.h"
#import "GouDetail.h"
@implementation GWCmodel
+(GWCmodel *)parseWaterMessageWithDict:(NSDictionary *)dict{
    GWCmodel *gouwuche = [[GWCmodel alloc]init];
//    gouwuche.carts_count = [[dict objectForKey:@"carts_count"]integerValue];
    
    gouwuche.brand_title = [dict objectForKey:@"brand_title"];
    NSArray *array = [dict objectForKey:@"skus"];
    gouwuche.GWCarray = [NSMutableArray array];
    for (NSDictionary *ddd in array) {
        GouDetail *detail = [GouDetail parseWaterMessageWithDict:ddd];
        [gouwuche.GWCarray addObject:detail];
    }
    
    //给自定义的model类赋初值
    gouwuche.is_Seleted = [[NSString stringWithFormat:@"0"]boolValue];
    gouwuche.price = @"0.00";
    gouwuche.quantity = @"0";
    
    
    return gouwuche;
}

@end
