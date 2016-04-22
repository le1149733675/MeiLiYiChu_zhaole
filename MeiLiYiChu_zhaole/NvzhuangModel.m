

//
//  NvzhuangModel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "NvzhuangModel.h"

@implementation NvzhuangModel
+(NvzhuangModel *)parseRequestMessageWithDict:(NSDictionary *)dict{
    NvzhuangModel *nvzhuang = [[NvzhuangModel alloc]init];
    
    nvzhuang.logo_url = [dict objectForKey:@"logo_url"];
    nvzhuang.dianId = [[dict objectForKey:@"id"]intValue];
    
    return nvzhuang;
}
@end
