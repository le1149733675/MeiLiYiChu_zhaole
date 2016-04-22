//
//  QGBaoyou.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QGBaoyou : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *pic_url;

+(QGBaoyou *)parseRequestWithbaoyouDict:(NSDictionary *)dict;

@end
