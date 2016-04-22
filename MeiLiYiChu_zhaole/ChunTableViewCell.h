//
//  ChunTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChunTableViewCell : UITableViewCell
@property (nonatomic ,copy) UIButton *leftBigBtn;
@property (nonatomic ,copy) UIButton *rightTopBtn;
@property (nonatomic ,copy) UIButton *rightBottomBtn;
@property (nonatomic ,copy) UILabel *leftBigLabel;
@property (nonatomic ,copy) UILabel *leftgrayLabel;
@property (nonatomic ,copy) UILabel *leftredlabel;
@property (nonatomic ,copy) UILabel *rightTopLabel;
@property (nonatomic ,copy) UILabel *rightTopgraylabel;
@property (nonatomic ,copy) UILabel *rightTopredlabel;
@property (nonatomic ,copy) UILabel *rightBottomLabel;
@property (nonatomic ,copy) UILabel *rightBottomgraylabel;
@property (nonatomic ,copy) UILabel *rightBottomredlabel;


@property(nonatomic,retain)UILabel *label1;
@property(nonatomic,retain)UILabel *label2;
@property(nonatomic,retain)UILabel *label3;

@property(nonatomic,retain)UILabel *label4;
@property(nonatomic,retain)UILabel *label5;


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
