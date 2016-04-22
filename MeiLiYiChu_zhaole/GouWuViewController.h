//
//  GouWuViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GouWuViewController : UIViewController

//购物车总数组
@property(nonatomic,retain)NSMutableArray *GouArray;
//购物车详情数组
@property(nonatomic,retain)NSMutableArray *GouDetailArray;

//记录点击删除的那个id
@property(nonatomic,copy)NSString *removeID;
//传递过来的删除字典
@property(nonatomic,retain)NSDictionary *removedict;


@end
