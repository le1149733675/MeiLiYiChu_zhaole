

//
//  ReMenTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ReMenTableViewCell.h"

@implementation ReMenTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH/2-1, 150/2-1)];
        [self addSubview:_btn1];
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+1, 0, VIEWWIDTH/2, 150/2-1)];
        [self addSubview:_btn2];
        _btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 150/2+1, VIEWWIDTH/2-1, 150/2)];
        [self addSubview:_btn3];
        _btn4 = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2, 150/2+1, VIEWWIDTH/2-1, 150/2)];
        [self addSubview:_btn4];
        
        
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
