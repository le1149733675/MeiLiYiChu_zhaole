//
//  ImageDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDetail : NSObject
@property(nonatomic,copy)NSString *content;

+(ImageDetail *)parseRequestImageArrrayDict:(NSDictionary *)dict;

@end
