//
//  LingYuan.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Left.h"
#import "Right.h"
@interface LingYuan : NSObject
@property (nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *sub_title;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) NSMutableArray *leftArray;
@property (nonatomic,retain) NSMutableArray *rightArray;
@property (nonatomic,retain)NSString *action;
+(LingYuan *)parseShowMessageWithDictionary:(NSDictionary*)dict;
@end
