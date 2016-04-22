//
//  TitleImage.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "TitleImage.h"

@implementation TitleImage


+(TitleImage *)parseRequestScollerViewWithdict:(NSDictionary *)dict{
    TitleImage *title = [[TitleImage alloc]init];
    title.url = [dict objectForKey:@"url"];
    title.position = [[dict objectForKey:@"position"]intValue];
    return title;
}

@end
