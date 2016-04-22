//
//  ImageDetail.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ImageDetail.h"

@implementation ImageDetail

+(ImageDetail *)parseRequestImageArrrayDict:(NSDictionary *)dict{
    ImageDetail *image = [[ImageDetail alloc]init];
    image.content = [dict objectForKey:@"content"];
    
    return image;
}

@end
