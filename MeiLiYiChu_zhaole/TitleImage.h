//
//  TitleImage.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleImage : NSObject

@property(nonatomic,copy)NSString *url;
@property(nonatomic,assign)NSInteger position;

+(TitleImage *)parseRequestScollerViewWithdict:(NSDictionary *)dict;

@end
