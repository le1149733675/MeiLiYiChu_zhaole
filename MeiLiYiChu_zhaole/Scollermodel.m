//
//  Scollermodel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "Scollermodel.h"

@implementation Scollermodel
+(Scollermodel*)parseBannerWithDictionary:(NSDictionary *)dict{
    Scollermodel *scoll = [[Scollermodel alloc] init];
    scoll.pic_url = [dict objectForKey:@"pic_url"];
    scoll.url = [dict objectForKey:@"url"];
    return scoll;
}
@end
