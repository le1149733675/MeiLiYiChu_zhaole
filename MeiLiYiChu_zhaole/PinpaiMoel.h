//
//  PinpaiMoel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinpaiMoel : NSObject

@property(nonatomic,copy)NSString *group_name;

//女装
@property(nonatomic,retain)NSMutableArray *NvYifuArray;

+(PinpaiMoel *)parseRequestMessageWithDict:(NSDictionary *)dict;


@end
