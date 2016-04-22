//
//  Right.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "Right.h"

@implementation Right
+(Right *)parseRightWithDict:(NSDictionary *)dict
{
    Right *right = [[Right alloc] init];
    right.taobao_num_iid = [dict objectForKey:@"taobao_num_iid"];
    right.taobao_title = [dict objectForKey:@"taobao_title"];
    right.taobao_promo_price = [dict objectForKey:@"taobao_promo_price"];
    right.taobao_price = [dict objectForKey:@"taobao_price"];
    right.taobao_pic_url = [dict objectForKey:@"taobao_pic_url"];
    right.pic_url = [dict objectForKey:@"pic_url"];
    right.action = [dict objectForKey:@"action"];
    return right;
    
    
}
@end
