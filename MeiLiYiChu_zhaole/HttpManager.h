//
//  HttpManager.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HttpManager : NSObject
+(void)getBannerMessageCompletionBlock:(void (^) (NSMutableArray *bannerArray))block;
+(void)getshowMessageCompletionBlock:(void (^) (NSMutableArray *showArray))block;
+(void)getWaterMeaasgeCompletionBlock:(void (^) (NSMutableArray *waterArray))block;
+(void)getFenleifyMessageCompletionBlock:(void (^) (NSMutableArray *classfyArray))block;

//新品商品
+(void)getXinpinRequestWithCid:(NSString *)cid WithSort:(NSString *)sort  CompletionBlock:(void(^)(NSMutableArray *array ))block;

//购物车
+(void)getGouWuCheRequestWithcountCompletionBlock:(void(^)(NSMutableArray *array))block;


//搜索数据
+(void)getSearchRquestWithSearchString:(NSString *)searchString WithSort:(NSString *)sort CompletionBlock:(void(^)(NSMutableArray *array))block;

//每日零元
+(void)getDianpuRequestWithSearchBrandid:(NSString *)SearchBrandid WithSort:(NSString *)sort CompletionBlock:(void(^)(NSMutableArray *array))block;
//宝贝详情
+(void)getBaobeiDetailRequestWithNumid:(NSString *)Numid CompletionBlock:(void(^)(NSMutableArray *array))block;

//品牌排行
+(void)getPinpaiPaihangRequestWithCompletionBlock:(void(^)(NSMutableArray *array))block;
//加入购物车
+(void)getAddGouwucheRequestWithSkuid:(NSString *)skuid Withnumber:(NSString *)number CompletionBlock:(void(^)(NSMutableArray *array))block;

//删除宝贝
+(void)getRemoveBaobeiRequestWithSkuid:(NSString *)skuid CompletionBlock:(void(^)(NSDictionary *dict))block;


@end
