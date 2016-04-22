//
//  BiMaiTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BiMaiTableViewCell : UITableViewCell
@property (nonatomic,copy) UIButton*rightBtn;
@property (nonatomic,copy) UIButton *leftBtn1;
@property (nonatomic,copy) UIButton *leftBtn2;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
