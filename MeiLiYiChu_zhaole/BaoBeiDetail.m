//
//  BaoBeiDetail.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "BaoBeiDetail.h"
#import "ImageDetail.h"
#import "TitleImage.h"
#import "WenziDetail.h"
#import "QGBaoyou.h"
#import "GoumaiModel.h"

@implementation BaoBeiDetail


+(BaoBeiDetail *)paresGetmessageWithDict:(NSDictionary *)dict{
    BaoBeiDetail *baobei = [[BaoBeiDetail alloc]init];
    baobei.taobao_title = [dict objectForKey:@"taobao_title"];
    baobei.taobao_price = [dict objectForKey:@"taobao_price"];
    baobei.taobao_promo_price = [dict objectForKey:@"taobao_promo_price"];
    baobei.money_symbol = [dict objectForKey:@"money_symbol"];
    baobei.title = [[dict objectForKey:@"brand"]objectForKey:@"title"];
    baobei.dianjiaID = [[dict objectForKey:@"brand"]objectForKey:@"id"];
    
    
    baobei.size_table = [dict objectForKey:@"size_table"];
    if ([baobei.size_table isKindOfClass:[NSString class]]) {
        
    }else if([baobei.size_table isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *ddd = [dict objectForKey:@"size_table"];
        baobei.sizeArray = [ddd objectForKey:@"values"];
        
    }
    
    
    //宝贝详情图片数组
    NSMutableArray *array1 = [dict objectForKey:@"mobile_desc"];
    baobei.ImagedetailArray = [NSMutableArray array];
    for (NSDictionary *ddd in array1) {
        ImageDetail *image = [ImageDetail parseRequestImageArrrayDict:ddd];
        [baobei.ImagedetailArray addObject:image];
    }
    
    //滑动视图数组
    NSMutableArray *array2 = [dict objectForKey:@"taobao_item_imgs"];
    baobei.taobaotitleImageArray = [NSMutableArray array];
    for (NSDictionary *ddd in array2) {
        TitleImage *title = [TitleImage parseRequestScollerViewWithdict:ddd];
        [baobei.taobaotitleImageArray addObject:title];
    }
    
    //宝贝汉字详情
    NSMutableArray *array3 = [dict objectForKey:@"props_name"];
    baobei.DetailArray = [NSMutableArray array];
    for (NSDictionary *ddd in array3) {
        WenziDetail *wenzi = [WenziDetail parseRequestDetailDict:ddd];
        [baobei.DetailArray addObject:wenzi];
    }
    
    //全国包邮数组
    NSMutableArray *array4 = [dict objectForKey:@"service"];
    baobei.QGbaoyouArray = [NSMutableArray array];
    for (NSDictionary *ddd in array4) {
        QGBaoyou *baoyou = [QGBaoyou parseRequestWithbaoyouDict:ddd];
        [baobei.QGbaoyouArray addObject:baoyou];
    }
    
    //加入购物车数组
    NSMutableArray *array5 = [dict objectForKey:@"skus"];
    baobei.JRGWCarray = [NSMutableArray array];
    for (NSDictionary *ddd in array5) {
        GoumaiModel *goumai = [GoumaiModel parseRequestWithGouwucheDict:ddd];
        [baobei.JRGWCarray addObject:goumai];
    }
    
    
    
    return baobei;
}




@end
