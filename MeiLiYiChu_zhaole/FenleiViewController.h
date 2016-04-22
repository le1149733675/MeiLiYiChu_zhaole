//
//  FenleiViewController.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FenleiViewController : UIViewController

{
    //记录被点击的那个按钮
    NSInteger _selectedIndex;
}
//分类的数据
@property(nonatomic,retain)NSMutableArray *FenLeiArr;


@end
