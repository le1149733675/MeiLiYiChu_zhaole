
//
//  FenleiDetail.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "FenleiDetail.h"

@implementation FenleiDetail
+(FenleiDetail *)parseWaterMessageWithDict:(NSDictionary *)dict{
    FenleiDetail *detail = [[FenleiDetail alloc]init];
    detail.pic_url = [dict objectForKey:@"pic_url"];
    detail.taobao_title = [dict objectForKey:@"taobao_title"];
    detail.taobao_cid = [dict objectForKey:@"taobao_cid"];
    
    return detail;
}
@end
