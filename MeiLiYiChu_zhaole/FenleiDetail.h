//
//  FenleiDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenleiDetail : NSObject


@property (nonatomic,copy)NSString *pic_url;
@property (nonatomic,copy)NSString *taobao_title;
@property (nonatomic,copy)NSString *taobao_cid;
+(FenleiDetail *)parseWaterMessageWithDict:(NSDictionary *)dict;

@end
