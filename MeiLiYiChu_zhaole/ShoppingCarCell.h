//
//  ShoppingCarCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-19.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICellButton.h"
#import "GWCmodel.h"
#import "GouDetail.h"

/*-------------------------代理----------------------------------*/
@protocol ShoppingCarCellDelegate <NSObject>

//选中按钮点击
-(void)carSelectButtonClicked:(GouDetail *)item WithSectionIndexPath:(NSInteger)section WithIndexPath:(NSInteger)row;

@end
/*-------------------------代理----------------------------------*/


@interface ShoppingCarCell : UITableViewCell


@property (nonatomic,retain)  UIImageView *gouwuche_image;
@property (nonatomic,retain)  UILabel *gouwuche_title;
@property (nonatomic,retain)  UILabel *gouwuche_yanse;
@property (nonatomic,retain)  UILabel *gouwuche_yanse1;
@property (nonatomic,retain)  UILabel *gouwuche_chima;
@property (nonatomic,retain)  UILabel *gouwuche_chima1;
@property (nonatomic,retain)  UILabel *gouwuche_jiage;
@property (nonatomic,retain)  UILabel *gouwuche_jiage1;
@property (nonatomic,retain)  UILabel *gouwuche_yuanlaidejiage;
@property (nonatomic,retain)  UILabel *gouwuche_yuanlaidejiage1;
@property (nonatomic,retain)  UILabel *gouwuche_shuliang;
@property (nonatomic,retain)  UIButton *gouwuche_btn_shanchu;
//@property (nonatomic,retain)  UIButton *gouwuche_btn_daixuanze;
@property (nonatomic,retain)  UIButton *gouwuche_btn_jian;
@property (nonatomic,retain)  UIButton *gouwuche_btn_jia;


@property (nonatomic,assign) id<ShoppingCarCellDelegate> delegate;
@property (nonatomic,strong) GouDetail     *itemData;
@property (nonatomic,strong) UICellButton    *selectButton;

- (void)reloadData;

@end
