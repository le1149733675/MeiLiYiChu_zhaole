//
//  WenziDetail.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "WenziDetail.h"

@implementation WenziDetail
+(WenziDetail *)parseRequestDetailDict:(NSDictionary *)dict{
    WenziDetail *wenxi = [[WenziDetail alloc]init];
    //*****去掉空格和换行******
    wenxi.pname = [[[dict objectForKey:@"pname"]stringByReplacingOccurrencesOfString:@"\n" withString:@""]stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    wenxi.vname = [[dict objectForKey:@"vname"]stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return wenxi;
}
@end
