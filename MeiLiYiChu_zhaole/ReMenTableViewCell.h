//
//  ReMenTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReMenTableViewCell : UITableViewCell
@property (nonatomic,copy)UIButton *btn1;
@property (nonatomic,copy)UIButton *btn2;
@property (nonatomic,copy)UIButton *btn3;
@property (nonatomic,copy)UIButton *btn4;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
