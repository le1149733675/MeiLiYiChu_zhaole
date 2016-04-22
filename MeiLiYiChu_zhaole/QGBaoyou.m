//
//  QGBaoyou.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "QGBaoyou.h"

@implementation QGBaoyou
+(QGBaoyou *)parseRequestWithbaoyouDict:(NSDictionary *)dict{
    QGBaoyou *baoyou = [[QGBaoyou alloc]init];
    baoyou.pic_url = [dict objectForKey:@"pic_url"];
    baoyou.title = [dict objectForKey:@"title"];
    return baoyou;
}
@end
