//
//  WenziDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WenziDetail : NSObject

@property(nonatomic,copy)NSString *pname;
@property(nonatomic,copy)NSString *vname;

+(WenziDetail *)parseRequestDetailDict:(NSDictionary *)dict;

@end
