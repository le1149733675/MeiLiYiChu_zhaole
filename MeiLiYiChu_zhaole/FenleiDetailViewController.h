//
//  FenleiDetailViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FenleiDetailViewController : UIViewController

//传递过来的类的名字
@property(nonatomic,copy)NSString *title;

//价格数据
@property(nonatomic,retain)NSMutableArray *JiageArray;

//淘宝cid
@property(nonatomic,copy)NSString *cid;

//搜索页面传过来的搜索内容
@property(nonatomic,copy)NSString *searchString;
//记录搜索得到的数据
@property(nonatomic,retain)NSMutableArray *searchArray;

//判断是不是
@property(nonatomic,assign)BOOL isSearch;

@end
