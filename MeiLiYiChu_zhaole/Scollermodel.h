//
//  Scollermodel.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scollermodel : NSObject
@property (nonatomic,copy) NSString*pic_url;
@property (nonatomic,copy) NSString *url;
+(Scollermodel*)parseBannerWithDictionary:(NSDictionary *)dict;
@end
