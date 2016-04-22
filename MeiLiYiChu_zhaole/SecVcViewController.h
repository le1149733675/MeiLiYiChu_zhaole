//
//  SecVcViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecVcViewController : UIViewController

@property(nonatomic,assign)NSInteger index;

//淘宝numid数据
@property(nonatomic,copy)NSString *Taobaonum_id;

//接收传递过来的全部数据的数组
@property(nonatomic,retain)NSMutableArray *Allarray;

//滑动视图数组
@property(nonatomic,retain)NSMutableArray *ScorllArray;
//全国包邮数组
@property(nonatomic,retain)NSMutableArray *BaoyouArr;


@property(nonatomic,retain)NSMutableArray *TaoIdarray;

@end
