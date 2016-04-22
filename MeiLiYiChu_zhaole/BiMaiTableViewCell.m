//
//  BiMaiTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "BiMaiTableViewCell.h"

@implementation BiMaiTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH/2-1, 200)];
        [self addSubview:_rightBtn];
        _leftBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+1, 0, VIEWWIDTH/2-1, 99)];
        [self addSubview:_leftBtn1];
        _leftBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+1, 101, VIEWWIDTH/2-1, 99)];
        [self addSubview:_leftBtn2];
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
