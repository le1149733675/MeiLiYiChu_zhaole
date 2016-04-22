//
//  DetailBaobeiViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailBaobeiViewController : UIViewController

//接收传递过来的taobao_num_id
//@property(nonatomic,copy)NSString *num_id;

//记录被点击的那个collection的item
@property(nonatomic,assign)NSInteger item;

//接收上个页面的全部的淘宝id数据的数组
@property(nonatomic,retain)NSMutableArray *idArray;

//
@property(nonatomic,retain)NSMutableArray *numberArray;

//记录点击的颜色和尺寸
@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *yanse;


@end
