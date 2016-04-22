//
//  ShoppingHeaderView.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-19.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICellButton.h"
#import "GWCmodel.h"
@protocol ShoppingHeaderViewDelegate <NSObject>

//选中按钮点击
-(void)carSelectButtonClicked:(GWCmodel *)item WithIndexPathSection:(NSInteger)section WithIndexPathRow:(NSInteger)row;

@end

@interface ShoppingHeaderView : UITableViewHeaderFooterView
@property (nonatomic,assign) id<ShoppingHeaderViewDelegate> delegate;
@property (nonatomic,strong) UILabel     *titleLable;
@property (nonatomic,strong) UICellButton    *selectButton;
@property (nonatomic,strong) GWCmodel     *sectionData;
- (void)reloadData;


@end
