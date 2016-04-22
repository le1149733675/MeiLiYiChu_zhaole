//
//  NvzhuangModel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NvzhuangModel : NSObject

@property(nonatomic,copy)NSString *logo_url;

//店铺id
@property(nonatomic,assign)NSInteger dianId;

+(NvzhuangModel *)parseRequestMessageWithDict:(NSDictionary *)dict;


@end
