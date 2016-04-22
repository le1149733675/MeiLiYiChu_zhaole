
//
//  PinpaiMoel.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "PinpaiMoel.h"
#import "NvzhuangModel.h"

@implementation PinpaiMoel
+(PinpaiMoel *)parseRequestMessageWithDict:(NSDictionary *)dict{
    PinpaiMoel *pin = [[PinpaiMoel alloc]init];
    pin.group_name = [dict objectForKey:@"group_name"];
    
    //得到下一个数组
    NSMutableArray *array1 = [dict objectForKey:@"items"];
    pin.NvYifuArray = [NSMutableArray array];
    for (NSDictionary *ddd in array1) {
        NvzhuangModel *model = [NvzhuangModel parseRequestMessageWithDict:ddd];
        [pin.NvYifuArray addObject:model];
    }
    
    
    return pin;
}
@end
