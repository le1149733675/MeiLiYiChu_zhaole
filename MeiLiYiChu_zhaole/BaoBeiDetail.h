//
//  BaoBeiDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaoBeiDetail : NSObject

@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *taobao_price;
@property(nonatomic,copy)NSString *taobao_promo_price;
@property(nonatomic,copy)NSString *money_symbol;

//尺码
@property(nonatomic,copy)NSString *size_table;
//尺码数组
@property(nonatomic,retain)NSMutableArray *sizeArray;


//店家名称
@property(nonatomic,copy)NSString *title;
//店家id
@property(nonatomic,copy)NSString *dianjiaID;


//滑动视图数组
@property(nonatomic,retain)NSMutableArray *taobaotitleImageArray;
//介绍详情数组
@property(nonatomic,retain)NSMutableArray *DetailArray;
//图片详情
@property(nonatomic,retain)NSMutableArray *ImagedetailArray;
//全国包邮
@property(nonatomic,retain)NSMutableArray *QGbaoyouArray;
//加入购物车数组
@property(nonatomic,retain)NSMutableArray *JRGWCarray;


+(BaoBeiDetail *)paresGetmessageWithDict:(NSDictionary *)dict;

@end
