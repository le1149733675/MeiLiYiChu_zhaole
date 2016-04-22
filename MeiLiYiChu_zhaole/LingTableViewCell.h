//
//  LingTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LingTableViewCell : UITableViewCell
@property (nonatomic,copy) UIButton *mainButton;
@property (nonatomic,copy) UILabel *mainlabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
