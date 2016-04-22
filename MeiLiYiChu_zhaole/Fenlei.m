//
//  Fenlei.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "Fenlei.h"
#import "FenleiDetail.h"
@implementation Fenlei
+(Fenlei *)parseWaterMessageWithDict:(NSDictionary *)dict{
    Fenlei *fen = [[Fenlei alloc]init];
    fen.category_title = [dict objectForKey:@"category_title"];
    NSArray *array = [dict objectForKey:@"sub_categories"];
    fen.categoryArray = [NSMutableArray array];
    for (NSDictionary *dic  in array) {
        FenleiDetail *detail = [FenleiDetail parseWaterMessageWithDict:dic];
        [fen.categoryArray addObject:detail];
    }
    return fen;
}

@end
