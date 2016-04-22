//
//  Fenlei.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fenlei : NSObject
@property(nonatomic,copy)NSString *category_title;
@property (nonatomic,retain) NSMutableArray *categoryArray;

+(Fenlei *)parseWaterMessageWithDict:(NSDictionary *)dict;

@end
