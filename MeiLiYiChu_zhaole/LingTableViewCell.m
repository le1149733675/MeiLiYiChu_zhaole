//
//  LingTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "LingTableViewCell.h"

@implementation LingTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSMutableArray *labelArray = [NSMutableArray arrayWithObjects:@"品牌排行",@"摇一摇",@"签到",@"公众号", nil];
    
    if (self) {
        for (int i = 0; i<4; i++) {
            _mainButton = [[UIButton alloc] initWithFrame:CGRectMake(20+(VIEWWIDTH-40-54)/3*i, 10, 54, 54)];
            NSString *imageString = [NSString stringWithFormat:@"Section1-%d",i+1];
            [_mainButton setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
            _mainButton.tag = i +1;
            [self addSubview:_mainButton];
            
            _mainlabel = [[UILabel alloc] initWithFrame:CGRectMake(10+(VIEWWIDTH-40-54)/3*i, 70, 70, 10)];
            _mainlabel.textAlignment = NSTextAlignmentCenter;
            _mainlabel.text =[labelArray objectAtIndex:i];
            [self addSubview:_mainlabel];
        }
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
