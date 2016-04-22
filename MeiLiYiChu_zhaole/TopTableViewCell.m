
//
//  TopTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "TopTableViewCell.h"

@implementation TopTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, VIEWWIDTH, 300)];
        [self addSubview:_topView];
        
        _titLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2-110, 20, 220, 30)];
        _titLabel.textColor = RGB(251, 55, 117);
        [self addSubview:_titLabel];
        
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2-50, 60, 100, 30)];
        [self addSubview:_loginButton];
        
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
