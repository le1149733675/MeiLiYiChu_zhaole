//
//  TopTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTableViewCell : UITableViewCell
@property (nonatomic,copy) UIImageView *topView;
@property (nonatomic,copy) UILabel *titLabel;
@property (nonatomic,copy) UIButton *loginButton;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
