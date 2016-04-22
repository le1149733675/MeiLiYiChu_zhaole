//
//  LingYuan.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "LingYuan.h"

@implementation LingYuan
+(LingYuan *)parseShowMessageWithDictionary:(NSDictionary*)dict{
    LingYuan *ling = [[LingYuan alloc] init];
    NSDictionary *dataDict = [dict objectForKey:@"content_data"];
    ling.action = [dataDict objectForKey:@"action"];
    ling.pic_url = [dataDict objectForKey:@"pic_url"];
    ling.sub_title = [dataDict objectForKey:@"sub_title"];
    ling.title = [dataDict objectForKey:@"title"];
    NSArray *leftArray  = [dataDict objectForKey:@"left_part"];
    NSArray *rightArray = [dataDict objectForKey:@"right_part"];
    ling.leftArray = [NSMutableArray array];
    ling.rightArray = [NSMutableArray array];
    for (NSDictionary *leftDict in leftArray) {
        Left *left = [Left parseLeftWithDict:leftDict];
        [ling.leftArray addObject:left];
    }
    ling.rightArray = [NSMutableArray array];
    for (NSDictionary *rightDict in rightArray) {
        Right *right = [Right parseRightWithDict:rightDict];
        [ling.rightArray addObject:right];
    }
    
    
    return ling;

}

@end
