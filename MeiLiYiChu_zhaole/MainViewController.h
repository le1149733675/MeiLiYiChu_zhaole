//
//  MainViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

//滑动视图的数组
@property(nonatomic,retain)NSMutableArray *ScrollArr;
//零元数组
@property(nonatomic,retain)NSMutableArray *LingArr;
//最下部的collectionview数组
@property(nonatomic,retain)NSMutableArray *PuBuLiuArr;

//记录传递到下一店铺页面的id
@property(nonatomic,copy)NSString *brand_id;




@end
